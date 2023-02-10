using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Hosting;
using System.Collections.Generic;
using System;

namespace AbcpXmlProxy
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            builder.WebHost.UseUrls("http://*:5000");
            var app = builder.Build();

            if (app.Environment.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();
            app.UseAbcpXmlProxy();

            app.MapGet("/", async context =>
            {
                await context.Response.WriteAsync("Status OK!");
            });
            app.Run();
        }
    }
}
