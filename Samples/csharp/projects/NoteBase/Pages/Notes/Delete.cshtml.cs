using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using NoteBase.Models;

namespace NoteBase.Pages.Notes
{
    public class DeleteModel : PageModel
    {
        private readonly RazorPagesNoteContext _context;

        public DeleteModel(RazorPagesNoteContext context)
        {
            _context = context;
        }

        [BindProperty]
      public Note Note { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Note == null)
            {
                return NotFound();
            }

            var note = await _context.Note.FirstOrDefaultAsync(m => m.NoteId == id);

            if (note == null)
            {
                return NotFound();
            }
            else 
            {
                Note = note;
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null || _context.Note == null)
            {
                return NotFound();
            }
            var note = await _context.Note.FindAsync(id);

            if (note != null)
            {
                Note = note;
                _context.Note.Remove(Note);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
