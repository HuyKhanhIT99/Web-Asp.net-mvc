using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication4
{
    [Serializable]
    public class UserLogin
    {
        public int UserId { set; get;}
        public string Username { set; get;  }
        public string FirstName { set; get; }
        public string LastName { set; get; }
        public bool Gender { set;get; }

        public string Address { set; get; }
        public bool IsNew { set; get; }
    }
}