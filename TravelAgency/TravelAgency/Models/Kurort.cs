namespace TravelAgency.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("travelagency.kurort")]
    public partial class Kurort
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kurort()
        {
            tours = new HashSet<Tour>();
        }

        [Key]
        public int id_kurort { get; set; }

		[Display(Name = "Country")]
        public int id_country { get; set; }

        [Required]
        [StringLength(100)]
		[Display(Name = "Hotel")]
		public string hotel { get; set; }

        [Required]
        [StringLength(100)]
		[Display(Name = "Name")]
		public string name { get; set; }

        [Required]
        [StringLength(100)]
		[Display(Name = "City")]
		public string city { get; set; }

        [Required]
        [StringLength(1000)]
		[Display(Name = "Description")]
		public string about { get; set; }

        public virtual Country country { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tour> tours { get; set; }
    }
}
