﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace New.Models
{
    public class New
    {
        public int Id { get; set; }
        public string Author { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public string UrlToImage { get; set; }
        public DateTime PublishedAt { get; set; }
        public string Content { get; set; }

    }
}
