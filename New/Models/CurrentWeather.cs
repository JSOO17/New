using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace New.Models
{
    public class CurrentWeather
    {
        public int Id { get; set; }
        public DateTime ObservationTime { get; set; }
        public int Temperature { get; set; }
        public string WeatherDescription { get; set; }
        public int WindSpeed { get; set; }
        public int WindDegree { get; set; }
        public string windDir { get; set; }
        public int Pressure { get; set; }
        public int Precip { get; set; }
        public int Humidity { get; set; }
        public int CloudOver { get; set; }
        public int Feelslike { get; set; }
        public int Visibility { get; set; }
    }
}
