namespace WebApplication4.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Combo")]
    public partial class Combo
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string comboName { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Product_List { get; set; }

        [Required]
        [StringLength(11)]
        public string startDate { get; set; }

        [Required]
        [StringLength(11)]
        public string endDate { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string totalMoney { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string discountMoney { get; set; }
    }
}
