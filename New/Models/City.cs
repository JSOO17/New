using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace New.Models
{
    public class City
    {
        public int Id { get; set; }
        public string NameCity { get; set; }
        public IEnumerable<Models.New> News { get; set; }
        public CurrentWeather CurrentWeather { get; set; }
}
}
