using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DMVapiV2.Data;
using DMVapiV2.Models;
using Microsoft.AspNetCore.Authorization;
namespace DMVapiV2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DriverVehiclesController : ControllerBase
    {
        private readonly DMVContext _context;

        public DriverVehiclesController(DMVContext context)
        {
            _context = context;
        }

        // GET: api/DriverVehicles
        [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<DriverVehicle>>> GetDriverVehicles()
        {
          if (_context.DriverVehicles == null)
          {
              return NotFound();
          }
            return await _context.DriverVehicles.ToListAsync();
        }

        // GET: api/DriverVehicles/5
        [Authorize]
        [HttpGet("{id}")]
        public async Task<ActionResult<DriverVehicle>> GetDriverVehicle(int id)
        {
          if (_context.DriverVehicles == null)
          {
              return NotFound();
          }
            var driverVehicle = await _context.DriverVehicles.FindAsync(id);

            if (driverVehicle == null)
            {
                return NotFound();
            }

            return driverVehicle;
        }

        // PUT: api/DriverVehicles/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDriverVehicle(int id, DriverVehicle driverVehicle)
        {
            if (id != driverVehicle.DriverVehicleId)
            {
                return BadRequest();
            }

            _context.Entry(driverVehicle).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DriverVehicleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/DriverVehicles
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<DriverVehicle>> PostDriverVehicle(DriverVehicle driverVehicle)
        {
          if (_context.DriverVehicles == null)
          {
              return Problem("Entity set 'DMVContext.DriverVehicles'  is null.");
          }
            _context.DriverVehicles.Add(driverVehicle);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetDriverVehicle", new { id = driverVehicle.DriverVehicleId }, driverVehicle);
        }

        // DELETE: api/DriverVehicles/5
        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDriverVehicle(int id)
        {
            if (_context.DriverVehicles == null)
            {
                return NotFound();
            }
            var driverVehicle = await _context.DriverVehicles.FindAsync(id);
            if (driverVehicle == null)
            {
                return NotFound();
            }

            _context.DriverVehicles.Remove(driverVehicle);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DriverVehicleExists(int id)
        {
            return (_context.DriverVehicles?.Any(e => e.DriverVehicleId == id)).GetValueOrDefault();
        }
    }
}
