# SKT Portfolio - ASP.NET Web Application

A modern, responsive portfolio website built with ASP.NET Web Forms 4.8, featuring a dark theme, admin panel, and database-driven content management.

## Features

### Frontend
- ?? Modern dark theme with smooth animations
- ?? Fully responsive design (mobile, tablet, desktop)
- ?? Professional UI with gradient effects and glassmorphism
- ? Smart navigation that hides/shows based on scroll behavior
- ??? Image placeholders with professional fallbacks
- ?? Animated statistics and interactive elements

### Backend
- ??? Complete database integration with SQL Server
- ????? Admin panel for content management
- ?? Contact form with message storage
- ?? Database setup wizard with automatic schema creation
- ??? Basic authentication system for admin access
- ?? Project, Skills, Achievements, and Education management

### Pages
- **Home** - Hero section with animated elements and project showcase
- **About** - Personal information and social media links
- **Skills** - Technical skills with progress bars
- **Projects** - Portfolio projects with filtering and details
- **Achievements** - Certifications, awards, and milestones
- **Education** - Academic background and qualifications
- **Contact** - Contact form and information
- **Admin Panel** - Content management system

## Quick Start

### Prerequisites
- Visual Studio 2019/2022 or Visual Studio Code
- .NET Framework 4.8
- SQL Server (LocalDB, Express, or Full)
- IIS Express (comes with Visual Studio)

### Installation

1. **Clone or Download the Repository**
   ```bash
   git clone https://github.com/Shakhoyat/SKT-ASP-Portfolio.git
   cd SKT-ASP-Portfolio
   ```

2. **Open in Visual Studio**
   - Open `WebApplication1.sln` in Visual Studio
   - Or open the folder in Visual Studio Code

3. **Database Setup (Choose one option)**

   **Option A: Automatic Setup (Recommended)**
   - Run the application
   - Navigate to `/DatabaseSetup.aspx`
   - Click "Complete Setup (Schema + Data)" button
   - This will create the database and populate it with sample data

   **Option B: Manual Setup**
   - Open SQL Server Management Studio
   - Connect to your SQL Server instance
   - Create a database named `personal-portfolio-ASP`
   - Execute the script from `Database/PortfolioSchema.sql`

4. **Update Connection String (if needed)**
   - Open `Web.config`
   - Update the `PortfolioConnectionString` if using a different SQL Server instance:
   ```xml
   <connectionStrings>
     <add name="PortfolioConnectionString" 
          connectionString="Data Source=YOUR_SERVER; Initial Catalog=personal-portfolio-ASP; Integrated Security=True" 
          providerName="System.Data.SqlClient" />
   </connectionStrings>
   ```

5. **Run the Application**
   - Press F5 in Visual Studio or use IIS Express
   - The application will open at `https://localhost:44300` (or similar)

### Default Admin Credentials
- **Username:** `admin`
- **Password:** `admin123`
- **Admin Panel:** `/AdminLogin.aspx`

## Project Structure

```
SKT-ASP-Portfolio/
??? Content/
?   ??? Site.css                 # Main stylesheet
?   ??? placeholder-styles.css   # Image placeholder styles
?   ??? images/                  # Image assets
?       ??? profile.png          # Main profile image
?       ??? about.jpg           # About page image
?       ??? projects/           # Project screenshots
??? Database/
?   ??? PortfolioSchema.sql     # Database creation script
??? Models/                     # Data models
??? DataAccess/                 # Database access layer
??? *.aspx                      # Web forms pages
??? *.aspx.cs                   # Code-behind files
??? Site.Master                 # Master page template
??? Web.config                  # Application configuration
??? Global.asax                 # Application events
```

## Customization

### Personal Information
Update the following files with your information:
- `Web.config` - Update app settings (name, email, phone)
- `Default.aspx` - Update hero section content
- `About.aspx` - Update personal details and links
- Replace images in `Content/images/` with your photos

### Colors and Styling
The application uses CSS custom properties for easy theming:
- Open `Content/Site.css`
- Modify the `:root` variables at the top of the file
- Primary colors, gradients, and spacing can be customized

### Content Management
1. **Projects** - Add/edit via Admin Panel ? Projects
2. **Skills** - Add/edit via Admin Panel ? Skills  
3. **Achievements** - Add/edit via Admin Panel ? Achievements
4. **Education** - Add/edit via Admin Panel ? Education

## Database Schema

### Tables Created
- **Projects** - Portfolio projects with details, technologies, links
- **Skills** - Technical skills with categories and proficiency levels
- **Achievements** - Certifications, awards, and accomplishments
- **Education** - Academic background and qualifications
- **ContactMessages** - Messages from contact form
- **AdminUsers** - Admin authentication

## Troubleshooting

### Common Issues

1. **Database Connection Errors**
   - Ensure SQL Server is running
   - Check connection string in Web.config
   - Verify database exists and user has permissions

2. **Missing Images**
   - Images have professional fallbacks built-in
   - Add your images to `Content/images/` folder
   - Update image paths in admin panel or database

3. **Build Errors**
   - Ensure .NET Framework 4.8 is installed
   - Check that all NuGet packages are restored
   - Verify project targets correct framework version

4. **Admin Panel Access**
   - Default credentials: admin/admin123
   - Navigate to `/AdminLogin.aspx`
   - Check AdminUsers table for user accounts

### Development Tips

1. **Adding New Pages**
   - Create new .aspx file
   - Add corresponding .aspx.cs code-behind
   - Use Site.Master for consistent layout
   - Update navigation in Site.Master

2. **Database Changes**
   - Update DatabaseHelper.cs for new operations
   - Add new tables to PortfolioSchema.sql
   - Consider migration scripts for existing databases

## Deployment

### IIS Deployment
1. Build the solution in Release mode
2. Copy files to IIS wwwroot directory
3. Create IIS application pointing to your folder
4. Ensure .NET Framework 4.8 is installed on server
5. Update connection string for production database

### Hosting Services
- Compatible with any ASP.NET hosting service
- Requires .NET Framework 4.8 support
- SQL Server database required

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

For questions or issues:
- Create an issue on GitHub
- Email: skt104.shujon@gmail.com
- Check the troubleshooting section above

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

---

**Made with ?? using ASP.NET Web Forms**