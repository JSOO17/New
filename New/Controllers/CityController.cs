using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace New.Controllers
{//<>


    [Route("api/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {
        public string connection = @"Data Source=JAIDER-PC\JSOO17;Initial Catalog=New; Integrated Security = True";
        //Data Source = JAIDER - PC\JSOO17;Integrated Security = True; Connect Timeout = 30; Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False
        [HttpGet]
        public IActionResult Get()
        {
            IEnumerable<Models.City> lst = null;
            using (var db = new SqlConnection(connection))
            {
                var sql = "SELECT Id, NameCity FROM City";
                lst = db.Query<Models.City>(sql).ToList();
            }
            return Ok(lst);
        }
        [HttpGet("{city}")]
        public IActionResult Show(string city)
        {
            IEnumerable<Models.City> lstCity = null;
            string sqlCity = "SELECT Id, NameCity FROM City WHERE NameCity = @ciudad";
            using(var db = new SqlConnection(connection))
            {
                lstCity = db.Query<Models.City>(sqlCity, new { ciudad = city });
            }
            var City = lstCity.First<Models.City>();

            //query currentWeather
            IEnumerable<Models.CurrentWeather> currentWeather = null;
            var sqlCurrentWeather = "SELECT TOP 1 ObservationTime, Temperature, WeatherDescription, WindSpeed, WindDegree, windDir, Pressure, Precip, HumidiTy, CloudOver, Feelslike, Visibility FROM CurrentWeather WHERE CityId = @id ORDER BY ObservationTime DESC";

            //query news
            IEnumerable<Models.New> news = null;
            var sqlNews = "SELECT * FROM News WHERE CityId = @id ORDER BY PublishedAt DESC";

            var sqlHistory = "INSERT INTO History (NameCity, SearchedAt) VALUES (@Name, @searched)";


            using (var db = new SqlConnection(connection))
            {
                news = db.Query<Models.New>(sqlNews, new { id = City.Id });
                currentWeather = db.Query<Models.CurrentWeather>(sqlCurrentWeather, new { id = City.Id });
                var result = db.Execute(sqlHistory, new { Name = City.NameCity, searched = DateTime.Now});
            }

            City.News = news;
            City.CurrentWeather = currentWeather.First();
            return Ok(City);
        }
    }
}