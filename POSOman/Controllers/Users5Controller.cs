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
            Random rnd = new Random();
            int num = rnd.Next();
            var model = new ApplicationUser
            {
                UserName = UserName,
                Email = num + "@gmail.com",
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