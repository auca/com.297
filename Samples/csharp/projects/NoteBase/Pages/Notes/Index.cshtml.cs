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
    public class IndexModel : PageModel
    {
        private readonly RazorPagesNoteContext _context;

        public IndexModel(RazorPagesNoteContext context)
        {
            _context = context;
        }

        public IList<Note> Note { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Note != null)
            {
                Note = await _context.Note.ToListAsync();
            }
        }
    }
}
