namespace WebApplication4.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Models1")
        {
        }

        public virtual DbSet<Catalog> Catalogs { get; set; }
        public virtual DbSet<Combo> Comboes { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Invoice> Invoices { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductDetail> ProductDetails { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<State> States { get; set; }
        public virtual DbSet<InvoiceDetail> InvoiceDetails { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Catalog>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<Combo>()
                .Property(e => e.comboName)
                .IsUnicode(false);

            modelBuilder.Entity<Combo>()
                .Property(e => e.Product_List)
                .IsUnicode(false);

            modelBuilder.Entity<Combo>()
                .Property(e => e.startDate)
                .IsUnicode(false);

            modelBuilder.Entity<Combo>()
                .Property(e => e.endDate)
                .IsUnicode(false);

            modelBuilder.Entity<Combo>()
                .Property(e => e.totalMoney)
                .IsUnicode(false);

            modelBuilder.Entity<Combo>()
                .Property(e => e.discountMoney)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.username)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.birthDate)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.joinDate)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.username)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.birthDate)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.joinDate)
                .IsUnicode(false);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.totalMoney)
                .IsUnicode(false);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.createdDate)
                .IsUnicode(false);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.shipDate)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.Catalog_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.productImage)
                .IsUnicode(false);

            modelBuilder.Entity<State>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<InvoiceDetail>()
                .Property(e => e.Price)
                .IsUnicode(false);
        }
    }
}
