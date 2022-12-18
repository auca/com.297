using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using NoteBase.Models;

public class RazorPagesNoteContext : DbContext
{
    public RazorPagesNoteContext(DbContextOptions<RazorPagesNoteContext> options)
        : base(options)
    {
    }

    public DbSet<NoteBase.Models.Note> Note { get; set; } = default!;
}