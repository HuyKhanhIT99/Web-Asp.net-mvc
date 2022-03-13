namespace WebApplication4.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Invoice")]
    public partial class Invoice
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        public int Customer_ID { get; set; }

        public int? Shipper_ID { get; set; }

       
        public string totalMoney { get; set; }

        
        public string createdDate { get; set; }

       
        public string customerAddress { get; set; }

     
        public string shipDate { get; set; }

        public int State_ID { get; set; }
    }
}
