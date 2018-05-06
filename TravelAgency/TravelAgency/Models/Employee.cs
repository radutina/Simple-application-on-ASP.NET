namespace TravelAgency.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("travelagency.eployee")]
    public partial class Employee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employee()
        {
            deals = new HashSet<Deal>();
        }

        [Key]
        public int id_employee { get; set; }

        [Required]
        [StringLength(40)]
		[Display(Name = "Firstname")]
        public string first_name { get; set; }

        [Required]
        [StringLength(40)]
		[Display(Name = "Lastname")]
		public string last_name { get; set; }

        [Required]
        [StringLength(20)]
		[Display(Name = "Phone")]
		public string phone { get; set; }

        [Required]
        [StringLength(40)]
		[Display(Name = "Email")]
		public string email { get; set; }

        [Required]
        [StringLength(8)]
		[Display(Name = "Login")]
		public string login { get; set; }

        [Required]
        [StringLength(8)]
		[Display(Name = "Password")]
		public string passwords { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Deal> deals { get; set; }
    }
}
