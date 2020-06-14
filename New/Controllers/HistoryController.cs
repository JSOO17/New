using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace New.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HistoryController : ControllerBase
    {
        public string connection = @"Data Source=JAIDER-PC\JSOO17;Initial Catalog=New; Integrated Security = True";
        [HttpGet]
        public IActionResult Get()
        {
            IEnumerable<Models.History> lst = null;
            using (var db = new SqlConnection(connection))
            {
                var sql = "SELECT * FROM History ORDER BY SearchedAt DESC";
                lst = db.Query<Models.History>(sql);
            }
            return Ok(lst);
        }
    }
}