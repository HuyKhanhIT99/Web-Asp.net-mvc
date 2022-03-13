namespace WebApplication4.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Customer")]
    public partial class Customer
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [Required(ErrorMessage ="Mời bạn nhập username")]
        [StringLength(50)]
        public string username { get; set; }

        [Column(TypeName = "text")]
        [Required(ErrorMessage ="Mời bạn nhập password")]
        public string password { get; set; }

      
        [StringLength(50)]
        public string firstName { get; set; }

    
        [StringLength(20)]
        public string lastName { get; set; }

        public bool gender { get; set; }

        [StringLength(12)]
        public string birthDate { get; set; }

       
        [StringLength(60)]
        public string address { get; set; }

        [StringLength(12)]
        public string joinDate { get; set; }

        public bool isNew { get; set; }
    }
}
