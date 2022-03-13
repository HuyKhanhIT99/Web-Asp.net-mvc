namespace WebApplication4.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [Required]
        [StringLength(100)]
        public string productName { get; set; }

        [StringLength(10)]
        public string Catalog_ID { get; set; }

        public int Amount { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Price { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string productImage { get; set; }

        public int State_ID { get; set; }
    }
}
