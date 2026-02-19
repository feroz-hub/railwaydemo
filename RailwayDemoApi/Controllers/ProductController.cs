using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RailwayDemoApi.Data;
using RailwayDemoApi.Models;

namespace RailwayDemoApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductController(AppDbContext context) : ControllerBase
{
    [HttpPost]
    public async Task<IActionResult> Create(Product product)
    {
        context.Products.Add(product);
        await context.SaveChangesAsync();
        return Ok(product);
    }

    [HttpGet]
    public async Task<IActionResult> GetAll()
    {
        return Ok(await context.Products.ToListAsync());
    }
}