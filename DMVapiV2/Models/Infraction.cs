// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace DMVapiV2.Models
{
    public partial class Infraction
    {
        public int InfractionId { get; set; }
        public string DriversSocialSecurity { get; set; }
        public int? BadgeNumber { get; set; }
        public string InfractionName { get; set; }
        public decimal? InfractionFine { get; set; }

        public virtual Officer BadgeNumberNavigation { get; set; }
        public virtual Driver DriversSocialSecurityNavigation { get; set; }
    }
}