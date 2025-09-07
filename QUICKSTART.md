# Quick Start Guide - SKT Portfolio

Follow these simple steps to get the portfolio running on your machine:

## Step 1: Prerequisites Check
- ? Visual Studio 2019/2022 installed
- ? .NET Framework 4.8 installed (usually comes with Visual Studio)
- ? SQL Server LocalDB installed (comes with Visual Studio)

## Step 2: Open the Project
1. Open Visual Studio
2. File ? Open ? Project/Solution
3. Select `WebApplication1.sln`
4. Wait for the solution to load

## Step 3: Build the Project
1. Right-click on the solution in Solution Explorer
2. Select "Build Solution" (or press Ctrl+Shift+B)
3. Ensure build succeeds with no errors

## Step 4: Set Up Database
1. Press F5 to run the application
2. Navigate to `/DatabaseSetup.aspx` in your browser
3. Click "Complete Setup (Schema + Data)" button
4. Wait for success message

## Step 5: Explore the Application
- **Homepage**: `/Default.aspx` - Main portfolio page
- **Admin Panel**: `/AdminLogin.aspx` (username: admin, password: admin123)
- **Projects**: `/Projects.aspx` - View portfolio projects
- **Contact**: `/Contact.aspx` - Contact form

## Step 6: Customize Your Portfolio
1. **Update Personal Info**:
   - Open `Web.config`
   - Update the appSettings section with your details

2. **Add Your Projects**:
   - Login to admin panel (`/AdminLogin.aspx`)
   - Go to Projects section
   - Add/edit your projects

3. **Add Your Images**:
   - Replace `Content/images/profile.png` with your photo
   - Add project images to `Content/images/projects/`

## Troubleshooting

### If Database Setup Fails:
1. Check if SQL Server LocalDB is running
2. Try using SQL Server Management Studio to manually run `Database/PortfolioSchema.sql`
3. Update connection string in Web.config if needed

### If Build Fails:
1. Right-click solution ? "Restore NuGet Packages"
2. Clean solution (Build ? Clean Solution)
3. Rebuild solution (Build ? Rebuild Solution)

### If Images Don't Show:
- Don't worry! The app has built-in placeholders
- Images will show as initials or icons until you add real images

## Need Help?
- Check the full README.md for detailed documentation
- All features work with placeholder data
- Contact: skt104.shujon@gmail.com

**You're ready to go! ??**