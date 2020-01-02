using Owin;
using Microsoft.Owin;
using Microsoft.AspNet.SignalR;

[assembly: OwinStartup(typeof(WebChatSystem.Startup))]

namespace WebChatSystem
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            HubConfiguration hubConfiguration = new HubConfiguration()
            {
                EnableJSONP = true
            };
            app.MapSignalR(hubConfiguration);
        }
    }//real_time hubConfiguration
}