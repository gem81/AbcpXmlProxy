using Microsoft.AspNetCore.Builder;

namespace AbcpXmlProxy
{
    public static class AbcpXmlProxyMiddlewareExtension
    {
        public static IApplicationBuilder UseAbcpXmlProxy(this IApplicationBuilder builder)
        {
            return builder.Use(next => new AbcpXmlProxyMiddleware(next).Invoke);
        }
    }
}
