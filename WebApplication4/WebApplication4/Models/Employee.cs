namespace WebApplication4.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Employee")]
    public partial class Employee
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string username { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string password { get; set; }

        [Required]
        [StringLength(50)]
        public string firstName { get; set; }

        [Required]
        [StringLength(20)]
        public string lastName { get; set; }

        public bool gender { get; set; }

        [StringLength(12)]
        public string birthDate { get; set; }

        [Required]
        [StringLength(60)]
        public string address { get; set; }

        [Required]
        [StringLength(11)]
        public string joinDate { get; set; }

        public int Role_ID { get; set; }
    }
}
