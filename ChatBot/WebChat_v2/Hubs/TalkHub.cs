using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace WebChatSystem.Hubs
{
    public class TalkHub : Hub
    {
        public void Hello()
        {
            Clients.All.hello();
        }
        public void Entry(string userName)
        {
            string entryMsg = string.Format("{0}님이 입장하셨습니다.", userName);
            Clients.All.EntryMessage(entryMsg);
        }
        public void Send(string userName, string message)
        {
            message = message.Replace("<", "&lt;").Replace(">", "&gt;");
            Clients.Others.GetMessage(userName, message);
        }
    }
}