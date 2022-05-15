﻿
// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using DMVapiV2.Models;

namespace DMVapiV2.Data
{
    public partial class DMVContext : DbContext
    {
        public DMVContext()
        {
        }

        public DMVContext(DbContextOptions<DMVContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Dmvworker> Dmvworkers { get; set; }
        public virtual DbSet<Driver> Drivers { get; set; }
        public virtual DbSet<DriverVehicle> DriverVehicles { get; set; }
        public virtual DbSet<Infraction> Infractions { get; set; }
        public virtual DbSet<Officer> Officers { get; set; }
        public virtual DbSet<Vehicle> Vehicles { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Dmvworker>(entity =>
            {
                entity.HasKey(e => e.WorkerId)
                    .HasName("PK__DMV__F35E9FF4EE50DB88");

                entity.ToTable("DMVworkers");

                entity.HasIndex(e => e.WorkersUserName, "UQ__DMV__0AC8F1B54307884B")
                    .IsUnique();

                entity.HasIndex(e => e.WorkersPassword, "UQ__DMV__9D8CCAAC70CA5D78")
                    .IsUnique();

                entity.Property(e => e.WorkerId).HasColumnName("Worker_ID");

                entity.Property(e => e.WorkersFirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.WorkersLastName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.WorkersPassword)
                    .IsRequired()
                    .HasMaxLength(12)
                    .IsUnicode(false)
                    .HasColumnName("workersPassword");

                entity.Property(e => e.WorkersUserName)
                    .IsRequired()
                    .HasMaxLength(12)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Driver>(entity =>
            {
                entity.HasKey(e => e.DriverSocialSecurity)
                    .HasName("PK__Drivers__E600121EA3B1D21A");

                entity.Property(e => e.DriverSocialSecurity)
                    .HasMaxLength(11)
                    .IsUnicode(false);

                entity.Property(e => e.DriversCity)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DriversFirstName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DriversLastName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DriversPhoneNumber)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DriversState)
                    .HasMaxLength(2)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.DriversStreetAddress)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<DriverVehicle>(entity =>
            {
                entity.ToTable("Driver_Vehicles");

                entity.Property(e => e.DriverVehicleId).HasColumnName("DriverVehicle_ID");

                entity.Property(e => e.DriversSocialSecurity)
                    .HasMaxLength(11)
                    .IsUnicode(false);

                entity.Property(e => e.Vin)
                    .HasMaxLength(17)
                    .IsUnicode(false)
                    .HasColumnName("VIN");

                entity.Property(e => e.WorkerId).HasColumnName("Worker_ID");

                entity.HasOne(d => d.DriversSocialSecurityNavigation)
                    .WithMany(p => p.DriverVehicles)
                    .HasForeignKey(d => d.DriversSocialSecurity)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK__Driver_Ve__Drive__44FF419A");

                entity.HasOne(d => d.VinNavigation)
                    .WithMany(p => p.DriverVehicles)
                    .HasForeignKey(d => d.Vin)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK__Driver_Vehi__VIN__46E78A0C");

                entity.HasOne(d => d.Worker)
                    .WithMany(p => p.DriverVehicles)
                    .HasForeignKey(d => d.WorkerId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK__Driver_Ve__Worke__45F365D3");
            });

            modelBuilder.Entity<Infraction>(entity =>
            {
                entity.Property(e => e.InfractionId).HasColumnName("InfractionID");

                entity.Property(e => e.DriversSocialSecurity)
                    .HasMaxLength(11)
                    .IsUnicode(false);

                entity.Property(e => e.InfractionFine).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.InfractionName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.BadgeNumberNavigation)
                    .WithMany(p => p.Infractions)
                    .HasForeignKey(d => d.BadgeNumber)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK__Infractio__Badge__38996AB5");

                entity.HasOne(d => d.DriversSocialSecurityNavigation)
                    .WithMany(p => p.Infractions)
                    .HasForeignKey(d => d.DriversSocialSecurity)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK__Infractio__Drive__47DBAE45");
            });

            modelBuilder.Entity<Officer>(entity =>
            {
                entity.HasKey(e => e.BadgeNumber)
                    .HasName("PK__Officers__D110FD57DEE1027E");

                entity.HasIndex(e => e.PolicePassword, "UQ__Officers__29A8FD1C0C8F7A95")
                    .IsUnique();

                entity.HasIndex(e => e.PoliceUsername, "UQ__Officers__C5291AF766E3CA5C")
                    .IsUnique();

                entity.Property(e => e.OfficerFirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.OfficerLastName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PolicePassword)
                    .HasMaxLength(12)
                    .IsUnicode(false);

                entity.Property(e => e.PoliceUsername)
                    .HasMaxLength(12)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Vehicle>(entity =>
            {
                entity.HasKey(e => e.Vin)
                    .HasName("PK__Vehicles__C5DF234D3E1EBD4E");

                entity.HasIndex(e => e.LicensePlate, "UQ__Vehicles__026BC15C463FBDDD")
                    .IsUnique();

                entity.Property(e => e.Vin)
                    .HasMaxLength(17)
                    .IsUnicode(false)
                    .HasColumnName("VIN");

                entity.Property(e => e.Color)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LicensePlate)
                    .HasMaxLength(7)
                    .IsUnicode(false);

                entity.Property(e => e.Make)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Model)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ModelYear)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}