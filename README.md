# SKT ASP.NET Portfolio

A professional portfolio website built with ASP.NET Web Forms and SQL Server.

## Project Structure

```
SKT-ASP-Portfolio/
??? Content/
?   ??? site.css              # Main stylesheet with custom themes
??? Scripts/
?   ??? site.js               # Custom JavaScript functionality
??? Images/                   # Image assets and placeholders
??? Admin/                    # Admin panel (future implementation)
??? App_Data/                 # Database files
??? Site.Master               # Master page layout
??? Default.aspx              # Home page
??? About.aspx                # About page (completed)
??? Web.config                # ASP.NET configuration
??? Global.asax               # Application events

```

## Features Completed

### ? Step 1: Foundation Structure
- Master page with Bootstrap 5.3 responsive layout
- Web.config with SQL Server connection string
- Custom CSS with CSS variables and animations
- JavaScript for form validation and smooth scrolling
- Proper .gitignore for ASP.NET projects

### ? Step 2: About Page
- Professional hero section with profile image
- Personal story and values section
- Interactive skills progress bars organized by category:
  - Backend Development (C#, ASP.NET, .NET Framework)
  - Frontend Development (HTML5, CSS3, JavaScript, Bootstrap)
  - Tools & Database (SQL Server, Visual Studio, Git)
- Quick facts cards with statistics
- Call-to-action sections linking to other pages
- Fully responsive design for mobile devices

## Technology Stack

- **Backend**: ASP.NET Web Forms (.NET Framework 4.8)
- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5.3
- **Database**: SQL Server with LocalDB
- **Development Tools**: Visual Studio, Git
- **Icons**: Font Awesome 6.4.0

## Pages Structure

1. **Home (Default.aspx)** - Hero section, featured projects, skills preview
2. **About (About.aspx)** - Personal story, detailed skills, values ?
3. **Skills** - Comprehensive skills with certifications (planned)
4. **Projects** - Portfolio showcase with filtering (planned)
5. **Achievements** - Awards and recognition (planned)
6. **Education** - Academic background and courses (planned)
7. **Contact** - Contact form with database storage (planned)
8. **Admin Panel** - CRUD operations for content management (planned)

## Database Schema (Planned)

- Projects (Id, Title, Description, Technologies, ImageUrl, DemoUrl, SourceUrl, CreatedDate)
- Skills (Id, Name, Category, Level, IconClass, IsActive)
- Achievements (Id, Title, Description, Date, Organization, ImageUrl)
- Education (Id, Institution, Degree, Field, StartDate, EndDate, Description)
- ContactMessages (Id, Name, Email, Subject, Message, CreatedDate, IsRead)

## Installation & Setup

1. Open the solution in Visual Studio
2. Ensure .NET Framework 4.8 is installed
3. Build the solution
4. Set Default.aspx as start page
5. Run the application

## Current Status

**Next Step**: Fix project configuration to properly support ASP.NET Web Forms, then continue with Skills page.

The foundation and About page are complete with professional design and responsive layout. The project structure follows ASP.NET Web Forms best practices with proper separation of concerns.

## Contributing

This is a personal portfolio project following industry standards for ASP.NET Web Forms development.