<%@ WebHandler Language="C#" Class="SSOHandler" %>

/*
Note that this handler imports a library called JWT.NET, which can be found as a DLL under the 'bin' folder
This is the library used to encode the token, and it can be found in the links below:
GitHub: https://github.com/henkmollema/Jwt.NET
NuGet: https://www.nuget.org/packages/JsonWebTokens
*/

using System;
using System.Web;
using JWT;
using System.Web.Script.Serialization;

public class SSOHandler : IHttpHandler {

    // This function is the main entry point of the SSO IHttpHandler.
    // Any HTTP requests directed at it will be handled here, and a response will be returned.
    // Here you will utilize the results of each step in the tutorial.
    public void ProcessRequest(HttpContext context)
    {
    
    }

    public bool IsReusable
    {
        get { return true; }
    }

    /*
    You should add any new functions to this handler, after this comment.
    */
}