namespace WebApplication4.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("State")]
    public partial class State
    {
        [StringLength(10)]
        public string ID { get; set; }

        [Required]
        [StringLength(30)]
        public string stateName { get; set; }
    }
}
