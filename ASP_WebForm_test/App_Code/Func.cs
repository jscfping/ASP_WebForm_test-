using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// func 的摘要描述
/// </summary>
/// 

public partial class ASPdemo
{
    public class Func
    {
        private static SHA256 mySHA256 = SHA256.Create();

        private static string salt = "i am salt. =)";


        public static string Salt
        {
            get { return salt; }
        }


        public static string Encrypt(string inputstr)
        {

            Byte[] result = mySHA256.ComputeHash(Encoding.Default.GetBytes(inputstr));

            string str = "";

            for (int i = 0; i < result.Length; i++)
            {
                str += result[i].ToString("x2");
            }

            return str;
        }
    }
}
