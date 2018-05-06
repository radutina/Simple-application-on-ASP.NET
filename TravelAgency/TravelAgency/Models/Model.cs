namespace TravelAgency.Models
{
	using System;
	using System.Data.Entity;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Linq;

	public partial class Model : DbContext
	{
		public Model()
			: base("name=Master")
		{
		}

		public virtual DbSet<Country> Countries { get; set; }
		public virtual DbSet<Customer> Customers { get; set; }
		public virtual DbSet<Deal> Deals { get; set; }
		public virtual DbSet<Employee> Employees { get; set; }
		public virtual DbSet<Kurort> Kurorts { get; set; }
		public virtual DbSet<Tour> Tours { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Country>()
				.Property(e => e.name)
				.IsUnicode(false);

			modelBuilder.Entity<Country>()
				.HasMany(e => e.kurorts)
				.WithRequired(e => e.country)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Customer>()
				.Property(e => e.first_name)
				.IsUnicode(false);

			modelBuilder.Entity<Customer>()
				.Property(e => e.last_name)
				.IsUnicode(false);

			modelBuilder.Entity<Customer>()
				.Property(e => e.phone)
				.IsUnicode(false);

			modelBuilder.Entity<Customer>()
				.Property(e => e.email)
				.IsUnicode(false);

			modelBuilder.Entity<Customer>()
				.HasMany(e => e.deals)
				.WithRequired(e => e.customer)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Employee>()
				.Property(e => e.first_name)
				.IsUnicode(false);

			modelBuilder.Entity<Employee>()
				.Property(e => e.last_name)
				.IsUnicode(false);

			modelBuilder.Entity<Employee>()
				.Property(e => e.phone)
				.IsUnicode(false);

			modelBuilder.Entity<Employee>()
				.Property(e => e.email)
				.IsUnicode(false);

			modelBuilder.Entity<Employee>()
				.Property(e => e.login)
				.IsUnicode(false);

			modelBuilder.Entity<Employee>()
				.Property(e => e.passwords)
				.IsUnicode(false);

			modelBuilder.Entity<Employee>()
				.HasMany(e => e.deals)
				.WithRequired(e => e.eployee)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Kurort>()
				.Property(e => e.hotel)
				.IsUnicode(false);

			modelBuilder.Entity<Kurort>()
				.Property(e => e.name)
				.IsUnicode(false);

			modelBuilder.Entity<Kurort>()
				.Property(e => e.city)
				.IsUnicode(false);

			modelBuilder.Entity<Kurort>()
				.Property(e => e.about)
				.IsUnicode(false);

			modelBuilder.Entity<Kurort>()
				.HasMany(e => e.tours)
				.WithRequired(e => e.kurort)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Tour>()
				.Property(e => e.name)
				.IsUnicode(false);

			modelBuilder.Entity<Tour>()
				.HasMany(e => e.deals)
				.WithRequired(e => e.tour)
				.WillCascadeOnDelete(false);
		}
	}
}
