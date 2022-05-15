using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DMVapiV2.Data;
using DMVapiV2.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using System.ComponentModel.DataAnnotations;

namespace DMVapiV2
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly Auth Auth;

        public AuthenticationController(Auth Auth)
        {
            this.Auth = Auth;
        }


        [AllowAnonymous]
        [HttpPost("Authorize")]
        public IActionResult AuthUser([FromBody] User usr)
        {
            var token = Auth.Authenticate(usr.Username, usr.Password);
            if (token == null)
            {
                return Unauthorized();
            }
            return Ok(token);


        }



        public class User
        {
            public string Username { get; set; }
            public string Password { get; set; }
        }


        public class login
        {
            [Required(ErrorMessage = "User Name is required")]
            public string? Username { get; set; }

            [Required(ErrorMessage = "Password is required")]
            public string? Password { get; set; }
        }

    }


}
