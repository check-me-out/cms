﻿using System.ComponentModel.DataAnnotations;

namespace Cms.Data.Model
{
    public class Category
    {
        [Key]
        public int Id { get; set; }

        public string Name { get; set; }

        public string UrlSlug { get; set; }

        public string Description { get; set; }
    }
}
