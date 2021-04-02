using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using System.Xml;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Xml.Xsl;
using System.Net.Mail;

namespace AbcpXmlProxy
{
    public class AbcpXmlProxyMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly HttpClient _client;

        public AbcpXmlProxyMiddleware(RequestDelegate next)
        {
            _next = next;
            HttpClientHandler handler = new HttpClientHandler() { };
            if (handler.SupportsAutomaticDecompression)
            {
                handler.AutomaticDecompression = DecompressionMethods.All;
            }
            _client = new HttpClient(handler);
        }
        public async Task Invoke(HttpContext context)
        {
            if (context.Request.Path.StartsWithSegments("/abcp", StringComparison.Ordinal, out  _, out var abcppath))
            {
                string host = new MailAddress(context.Request.Query["userlogin"]).Host;
                var ret = await GetJsonFromAbcp($"http://{host}.public.api.abcp.ru" + abcppath, context.Request);
                if (ret[0] == '[') ret = "{row :" + ret + "}";
                var xml = JsonConvert.DeserializeXNode(ret, "root");
                var bt = Encoding.UTF8.GetBytes(@"<?xml version=""1.0"" encoding=""UTF-8"" ?>" + Environment.NewLine + xml.ToString());
                context.Response.StatusCode = 200;
                context.Response.ContentType = "application/xml";
                await context.Response.Body.WriteAsync(bt);
                return;
            }
            if (context.Request.Path.StartsWithSegments("/zzap", StringComparison.Ordinal, out _, out var zzappath))
            {
                var xmlzzap = await GetJsonFromAbcp("https://www.zzap.ru" + zzappath, context.Request);
                var ret = XDocument.Parse(xmlzzap).Root.Value;
                if (ret[0] == '[') ret = "{row :" + ret + "}";
                var xml = JsonConvert.DeserializeXNode(ret, "root");
                var bt = Encoding.UTF8.GetBytes(@"<?xml version=""1.0"" encoding=""UTF-8"" ?>" + Environment.NewLine + TransormZzap(xml).ToString());
                context.Response.StatusCode = 200;
                context.Response.ContentType = "application/xml";
                await context.Response.Body.WriteAsync(bt);
                return;
            }
            await _next(context);
        }

        private async Task<string> GetJsonFromAbcp(string path, HttpRequest request)
        {
            try
            {
                return await _client.GetStringAsync(path + request.QueryString);
            } catch(Exception e)
            {
                return $"{{error: \"{e.Message}\", url: \"{path}\"}}";
            }
        }

        private XDocument TransormZzap(XDocument origin)
        {
            var retDoc = new XDocument();
            var myXslTrans = new XslCompiledTransform();
            myXslTrans.Load("zzap.xsl");
            using (var wr = retDoc.CreateWriter())
            {
                myXslTrans.Transform(origin.CreateReader(), wr);
            }
            if (retDoc.Root is null) return origin;
            return retDoc;
        }
    }
}
