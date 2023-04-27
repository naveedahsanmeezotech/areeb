using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MangoERP.Models;

namespace MangoERP.Models.BLL
{
    public class UserActionsPerformed
    {
        dbPOS db = new dbPOS();
        public void MapActions(int? LoginUserID,string ActionPerformed)
        {           
            UserAction_Log UserActions = new UserAction_Log();
            UserActions.UserLogId = LoginUserID==null?0:Convert.ToInt32(LoginUserID);
            UserActions.ActionDate = DateTime.UtcNow.AddHours(5);
            UserActions.UserAction = ActionPerformed.ToString();
            db.UserAction_Log.Add(UserActions);
            if(LoginUserID > 0)
            {db.SaveChanges(); }
            
        }
    }
}
