using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using MangoERP.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using MangoERP.Models.BLL;

namespace MangoERP.Controllers
{
    public class Users5Controller : Controller
    {
       
        dbPOS db = new dbPOS();
         private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        ApplicationDbContext context;

        public Users5Controller()
        {
            context = new ApplicationDbContext();
        }

        public Users5Controller(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        // GET: OutSid/Users
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public async Task<ActionResult> GetUser(string UserName, string Password)
        {

            // Validate the input data
            if (string.IsNullOrEmpty(UserName) ||

                string.IsNullOrEmpty(Password))

            {
                // Handle invalid input
                return RedirectToAction("Error", "Home");
            }
            var model = new ApplicationUser
            {
                UserName = UserName,
                Email = UserName + "@gmail.com",
                BranchID = 9001,
               
            };

            try
            {
                var user = new ApplicationUser { UserName = model.UserName, Email = model.Email, BranchID = model.BranchID };
                var result = await UserManager.CreateAsync(user, Password);
                if (result.Succeeded)
                {

                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                    // Send an email with this link
                    // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                    // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                    // await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");
                    await this.UserManager.AddToRoleAsync(user.Id, "Customer");
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    return RedirectToAction("Login", "Account");

                }
                //// Create a new user with ASP.NET Identity
                //var user = new ApplicationUser
                //{
                //    UserName = UserName,
                //    Email = UserName + "@gmail.com"
                //};

                //var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>());
                //var result = userManager.Create(user, Password);

                //if (result.Succeeded)
                //{
                //    userManager.AddToRoles(user.Id, "Customer");

                //    using (var connection = new SqlConnection("Server=MEEZOTECH;Database=db_fyp;Trusted_Connection=True;"))
                //    {
                //        connection.Open();

                //        var sql = @"INSERT INTO [dbo].[AspNetUsers] (Id, Email, EmailConfirmed, PasswordHash, SecurityStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEndDateUtc, LockoutEnabled, AccessFailedCount, UserName, BranchID)
                //                    VALUES (@Id, @Email, @EmailConfirmed, @PasswordHash, @SecurityStamp, @PhoneNumber, @PhoneNumberConfirmed, @TwoFactorEnabled, @LockoutEndDateUtc, @LockoutEnabled, @AccessFailedCount, @UserName, @BranchID)";

                //        using (var command = new SqlCommand(sql, connection))
                //        {
                //            command.Parameters.AddWithValue("@Id", user.Id);
                //            command.Parameters.AddWithValue("@Email", user.Email);
                //            command.Parameters.AddWithValue("@EmailConfirmed", user.EmailConfirmed);
                //            command.Parameters.AddWithValue("@PasswordHash", user.PasswordHash);
                //            command.Parameters.AddWithValue("@SecurityStamp", user.SecurityStamp);
                //            command.Parameters.AddWithValue("@PhoneNumber", user.PhoneNumber);
                //            command.Parameters.AddWithValue("@PhoneNumberConfirmed", user.PhoneNumberConfirmed);
                //            command.Parameters.AddWithValue("@TwoFactorEnabled", user.TwoFactorEnabled);
                //            command.Parameters.AddWithValue("@LockoutEndDateUtc", user.LockoutEndDateUtc);
                //            command.Parameters.AddWithValue("@LockoutEnabled", user.LockoutEnabled);
                //            command.Parameters.AddWithValue("@AccessFailedCount", user.AccessFailedCount);
                //            command.Parameters.AddWithValue("@UserName", user.UserName);
                //            command.Parameters.AddWithValue("@BranchID", "1"); // Replace with the actual method to get the branch ID

                //            command.ExecuteNonQuery();
                //        }
                //    }
                //}
                //// ...

                return View();

            }
            catch (Exception ex)
            {
                return RedirectToAction("Login", "Account");

                return View();

            }





        }
    }
}