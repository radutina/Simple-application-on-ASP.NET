namespace TravelAgency.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("travelagency.customer")]
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            deals = new HashSet<Deal>();
        }

        [Key]
        public int id_customer { get; set; }

        [Required(ErrorMessage = "Field must be set")]
        [StringLength(40, MinimumLength = 3, ErrorMessage = "The length of the string must be 3 to 40 characters")]
		[Display(Name = "Firstname")]
        public string first_name { get; set; }

        [Required(ErrorMessage = "Field must be set")]
        [StringLength(40, MinimumLength = 3, ErrorMessage = "The length of the string must be 3 to 40 characters")]
		[Display(Name = "Lastname")]
		public string last_name { get; set; }

        [Required(ErrorMessage = "Field must be set")]
        [StringLength(9, MinimumLength = 9, ErrorMessage = "The length of the string must be 3 to 20 characters")]
        [RegularExpression(@"[0 - 9]+$",  ErrorMessage = "Incorrect phone")]
        [Display(Name = "Phone")]
		public string phone { get; set; }

        [Required(ErrorMessage = "Field must be set")]
        [StringLength(40, MinimumLength = 3, ErrorMessage = "The length of the string must be 3 to 40 characters")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}", ErrorMessage = "Incorrect address")]
        [Display(Name = "Email")]
		public string email { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Deal> deals { get; set; }
    }
}
