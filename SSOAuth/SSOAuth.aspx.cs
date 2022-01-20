using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
    
namespace SingleSignOn
{
    public partial class SSOAuth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TimeSpan t = (DateTime.UtcNow - new DateTime(1970, 1, 1));
            int timestamp = (int)t.TotalSeconds;

            string username = GetUser();

            if (username == null)
            {
                Response.Redirect("login.aspx");
            }

            var payload = GenerateJWTPayload(username);
             

            // Encode JWT object into a token
            string token = EncodeJWT(payload);

            string redirectUrl = "http://lssdevapp4.aws2.csc-fsg.com/jwt?jwt=" + token;

            if (Request.QueryString["return_to"] != null)
            {
                redirectUrl += "&return_to=" + HttpUtility.UrlEncode(Request.QueryString["return_to"].ToString());
            }
             
            Response.Redirect(redirectUrl);

        }
        public string EncodeJWT(System.Collections.Generic.Dictionary<string, object> payload)
        {
            string secret = "51ffc8c89bd756ab88c9f6e5110aafb979925769730bde8bb5ac8542f13a969f"; // Shared Secret
            string token = JWT.JsonWebToken.Encode(payload, secret, JWT.JwtHashAlgorithm.HS256);
            return token;
        }
        public string GetUser()
        {
            // Get the correct cookie from the request
            var Cookie = Request.Cookies["UserName"];

            // Return the cookie's value if it exists
            if ((Cookie != null) && (Cookie.Value != null))
                return Cookie.Value;

            // Return null otherwise
            return null;
        }
        public System.Collections.Generic.Dictionary<string, object> GenerateJWTPayload(string username)
        {
            TimeSpan timeSinceEpoch = (DateTime.UtcNow - new DateTime(1970, 1, 1));
            int secondsSinceEpoch = (int)timeSinceEpoch.TotalSeconds;

            var payload = new System.Collections.Generic.Dictionary<string, object>() {
            { "iat", secondsSinceEpoch },
            { "sub", username },             
            { "name", "Ranjan Kumar" },
            { "jti", Guid.NewGuid() } };

            return payload;
        }
    }
}