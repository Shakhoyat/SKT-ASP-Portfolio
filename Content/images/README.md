# Portfolio Images

This folder contains images used throughout the portfolio website.

## Profile Images
- `profile.jpg` - Main profile image (recommended: 400x400px, square)
- `profile-small.jpg` - Small profile image for avatars (recommended: 200x200px)

## Project Images
- `project-[name].jpg` - Project screenshots/previews (recommended: 800x600px)
- Examples:
  - `project-ecommerce.jpg`
  - `project-taskmanager.jpg`
  - `project-finance.jpg`
  - `project-portfolio.jpg`

## Background Images
- `hero-bg.jpg` - Hero section background (optional)
- `about-bg.jpg` - About section background (optional)

## Icons and Logos
- `logo.png` - Site logo/favicon
- `favicon.ico` - Browser favicon

## Image Guidelines
1. **Format**: Use JPG for photos, PNG for graphics with transparency
2. **Size**: Optimize images for web (keep file sizes under 500KB)
3. **Dimensions**: Use consistent aspect ratios for better layout
4. **Quality**: High quality but web-optimized
5. **Naming**: Use descriptive, lowercase names with hyphens

## Adding Your Profile Image
1. Add your profile image as `profile.jpg` in this folder
2. Update the Default.aspx file to uncomment the img tag:
   ```html
   <!-- Change this: -->
   <div class="profile-image-placeholder">
       <i class="fas fa-user"></i>
   </div>
   
   <!-- To this: -->
   <img src="/Content/images/profile.jpg" alt="Shakhoyat Rahman" />
   ```

## Adding Project Images
1. Add project images with descriptive names
2. Update the project image URLs in your data/Projects.aspx file
3. Use the placeholder styles as fallback for missing images