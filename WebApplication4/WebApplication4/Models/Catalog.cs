namespace WebApplication4.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Catalog")]
    public partial class Catalog
    {
        [StringLength(10)]
        public string ID { get; set; }

        [Required]
        [StringLength(25)]
        public string catalogName { get; set; }
    }
}
