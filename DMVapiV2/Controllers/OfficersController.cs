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
    public class OfficersController : ControllerBase
    {
        private readonly DMVContext _context;

        public OfficersController(DMVContext context)
        {
            _context = context;
        }

        // GET: api/Officers
        [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Officer>>> GetOfficers()
        {
          if (_context.Officers == null)
          {
              return NotFound();
          }
            return await _context.Officers.ToListAsync();
        }

        // GET: api/Officers/5
        [Authorize]
        [HttpGet("{id}")]
        public async Task<ActionResult<Officer>> GetOfficer(int id)
        {
          if (_context.Officers == null)
          {
              return NotFound();
          }
            var officer = await _context.Officers.FindAsync(id);

            if (officer == null)
            {
                return NotFound();
            }

            return officer;
        }

        // PUT: api/Officers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOfficer(int id, Officer officer)
        {
            if (id != officer.BadgeNumber)
            {
                return BadRequest();
            }

            _context.Entry(officer).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OfficerExists(id))
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

        // POST: api/Officers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<Officer>> PostOfficer(Officer officer)
        {
          if (_context.Officers == null)
          {
              return Problem("Entity set 'DMVContext.Officers'  is null.");
          }
            _context.Officers.Add(officer);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetOfficer", new { id = officer.BadgeNumber }, officer);
        }

        // DELETE: api/Officers/5
        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOfficer(int id)
        {
            if (_context.Officers == null)
            {
                return NotFound();
            }
            var officer = await _context.Officers.FindAsync(id);
            if (officer == null)
            {
                return NotFound();
            }

            _context.Officers.Remove(officer);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OfficerExists(int id)
        {
            return (_context.Officers?.Any(e => e.BadgeNumber == id)).GetValueOrDefault();
        }
    }
}
