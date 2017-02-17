using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodStoreV2.CSharpClasses
{
    public class VerifyReCaptcha
    {
        public bool Success { get; set; }

        public bool verifyCapcha(String gRecaptchaResponse)
        {
            var client = new System.Net.WebClient();
            String secretKey = "6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe";
            String siteToVerify = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}";

            var result = client.DownloadString(string.Format(siteToVerify, secretKey, gRecaptchaResponse));
            var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            var reCaptcha = serializer.Deserialize<VerifyReCaptcha>(result);

            return reCaptcha.Success;
        }

    }
}