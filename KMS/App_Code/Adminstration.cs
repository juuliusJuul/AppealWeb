using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Adminstration
/// </summary>
public class Adminstration
{


    public int Id { get; set; }
    public string Login { get; set; }
    public string Password { get; set; }
    public string Email { get; set; }
    public string Type { get; set; }


    public Adminstration(int id, string login, string password, string email, string type)
    {
        Id = id;
        Login = login;
        Password = password;
        Email = email;
        Type = type;
    }

    public Adminstration(string login, string password, string email, string type)
    {
        Login = login;
        Password = password;
        Email = email;
        Type = type;
    }
}