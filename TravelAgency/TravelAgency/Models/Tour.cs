namespace TravelAgency.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("travelagency.tour")]
    public partial class Tour
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tour()
        {
            deals = new HashSet<Deal>();
        }

        [Key]
        public int id_tour { get; set; }

		[Display(Name = "Kurort")]
		public int id_kurort { get; set; }

		[Display(Name = "Count of days")]
		public int count_day { get; set; }

		[Display(Name = "Price")]
		public int price { get; set; }

        [Required]
        [StringLength(50)]
		[Display(Name = "Name")]
		public string name { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Deal> deals { get; set; }

        public virtual Kurort kurort { get; set; }
    }
}
