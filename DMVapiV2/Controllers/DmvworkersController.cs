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
    public class DmvworkersController : ControllerBase
    {
        private readonly DMVContext _context;

        public DmvworkersController(DMVContext context)
        {
            _context = context;
        }

        // GET: api/Dmvworkers
        [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Dmvworker>>> GetDmvworkers()
        {
          if (_context.Dmvworkers == null)
          {
              return NotFound();
          }
            return await _context.Dmvworkers.ToListAsync();
        }

        // GET: api/Dmvworkers/5
        [Authorize]
        [HttpGet("{id}")]
        public async Task<ActionResult<Dmvworker>> GetDmvworker(int id)
        {
          if (_context.Dmvworkers == null)
          {
              return NotFound();
          }
            var dmvworker = await _context.Dmvworkers.FindAsync(id);

            if (dmvworker == null)
            {
                return NotFound();
            }

            return dmvworker;
        }

        // PUT: api/Dmvworkers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDmvworker(int id, Dmvworker dmvworker)
        {
            if (id != dmvworker.WorkerId)
            {
                return BadRequest();
            }

            _context.Entry(dmvworker).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DmvworkerExists(id))
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

        // POST: api/Dmvworkers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<Dmvworker>> PostDmvworker(Dmvworker dmvworker)
        {
          if (_context.Dmvworkers == null)
          {
              return Problem("Entity set 'DMVContext.Dmvworkers'  is null.");
          }
            _context.Dmvworkers.Add(dmvworker);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetDmvworker", new { id = dmvworker.WorkerId }, dmvworker);
        }

        // DELETE: api/Dmvworkers/5
        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDmvworker(int id)
        {
            if (_context.Dmvworkers == null)
            {
                return NotFound();
            }
            var dmvworker = await _context.Dmvworkers.FindAsync(id);
            if (dmvworker == null)
            {
                return NotFound();
            }

            _context.Dmvworkers.Remove(dmvworker);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DmvworkerExists(int id)
        {
            return (_context.Dmvworkers?.Any(e => e.WorkerId == id)).GetValueOrDefault();
        }
    }
}
