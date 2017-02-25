using System.ComponentModel.DataAnnotations;

namespace Cms.Data.Model
{
    public class BadWords
    {
        [Key]
        public string Keyword { get; set; }
    }
}
