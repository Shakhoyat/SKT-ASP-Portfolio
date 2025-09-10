# Resume Documents Directory

## Instructions for Adding Your Resume

To make the "Download My Resume" button work, you need to add your resume PDF file to this directory.

### Steps:

1. **Prepare your resume**: Make sure your resume is in PDF format
2. **Name the file**: Rename your resume file to `Shakhoyat_Resume.pdf`
3. **Copy the file**: Place the `Shakhoyat_Resume.pdf` file in this directory (`Content/documents/`)

### File Path Expected:
```
Content/documents/Shakhoyat_Resume.pdf
```

### Current Button Configuration:
The "Download My Resume" button in Default.aspx is already configured to point to:
```
/Content/documents/Shakhoyat_Resume.pdf
```

### Testing:
Once you add the file, test the download button by:
1. Running your website
2. Going to the homepage 
3. Scrolling to the About Me section
4. Clicking the "Download My Resume" button

The file should start downloading immediately.

### Alternative File Names:
If you want to use a different filename, update the href attribute in Default.aspx:
```aspx
<a href="/Content/documents/YourCustomName.pdf" target="_blank" class="cta-button resume-btn">
```

### File Size Recommendations:
- Keep the PDF file under 5MB for faster downloads
- Optimize the PDF for web viewing
- Ensure the PDF is not password protected for public download