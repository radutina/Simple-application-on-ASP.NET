namespace TravelAgency.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("travelagency.deal")]
    public partial class Deal
    {
        [Key]
        public int id_deal { get; set; }

		[Display(Name = "Tour")]
        public int id_tour { get; set; }

		[Display(Name = "Customer")]
		public int id_customer { get; set; }

		[Display(Name = "Employee")]
		public int id_employee { get; set; }

        [Column(TypeName = "date")]
		[Display(Name = "Date")]
		public DateTime date { get; set; }

        public virtual Customer customer { get; set; }

        public virtual Tour tour { get; set; }

        public virtual Employee eployee { get; set; }
    }
}
