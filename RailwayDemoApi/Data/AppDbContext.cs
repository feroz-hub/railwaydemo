using Microsoft.EntityFrameworkCore;
using RailwayDemoApi.Models;

namespace RailwayDemoApi.Data;

public class AppDbContext(DbContextOptions<AppDbContext> options) : DbContext(options)
{
    public DbSet<Product> Products => Set<Product>();
}