// SKT Portfolio - Enhanced Responsive JavaScript

// Document ready function
document.addEventListener('DOMContentLoaded', function() {
    initializePortfolio();
});

// Initialize portfolio functionality
function initializePortfolio() {
    // Add smooth scrolling to anchor links
    initializeSmoothScrolling();
    
    // Initialize responsive features
    initializeResponsiveFeatures();
    
    // Initialize animation on scroll
    initializeScrollAnimations();
    
    // Initialize form validation
    initializeFormValidation();
    
    // Initialize skills page specific features
    initializeSkillsPage();
    
    // Initialize projects page specific features
    initializeProjectsPage();
    
    // Initialize contact page specific features
    initializeContactPage();
    
    // Initialize mobile-specific features
    initializeMobileFeatures();
}

// Enhanced responsive features
function initializeResponsiveFeatures() {
    // Mobile navigation improvements
    initializeMobileNavigation();
    
    // Responsive image loading
    initializeResponsiveImages();
    
    // Touch gestures for mobile
    initializeTouchGestures();
    
    // Responsive table handling
    initializeResponsiveTables();
    
    // Window resize handler
    initializeResizeHandler();
}

// Enhanced mobile navigation
function initializeMobileNavigation() {
    const navbarToggler = document.querySelector('.navbar-toggler');
    const navbarCollapse = document.querySelector('.navbar-collapse');
    const navLinks = document.querySelectorAll('.navbar-nav .nav-link');
    
    if (!navbarToggler || !navbarCollapse) return;
    
    // Close mobile menu when clicking on a link
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            if (window.innerWidth <= 768) {
                const bsCollapse = new bootstrap.Collapse(navbarCollapse, {
                    toggle: false
                });
                bsCollapse.hide();
            }
        });
    });
    
    // Close mobile menu when clicking outside
    document.addEventListener('click', function(event) {
        const isClickInsideNav = navbarCollapse.contains(event.target) || navbarToggler.contains(event.target);
        
        if (!isClickInsideNav && navbarCollapse.classList.contains('show')) {
            const bsCollapse = new bootstrap.Collapse(navbarCollapse, {
                toggle: false
            });
            bsCollapse.hide();
        }
    });
    
    // Add active state to current page
    const currentPage = window.location.pathname.split('/').pop() || 'Default.aspx';
    navLinks.forEach(link => {
        const linkPage = link.getAttribute('href');
        if (linkPage === currentPage || (currentPage === '' && linkPage === 'Default.aspx')) {
            link.classList.add('active');
        }
    });
}

// Responsive image loading and optimization
function initializeResponsiveImages() {
    const images = document.querySelectorAll('img');
    
    images.forEach(img => {
        // Add loading="lazy" for better performance
        if (!img.hasAttribute('loading')) {
            img.setAttribute('loading', 'lazy');
        }
        
        // Add error handling for missing images
        img.addEventListener('error', function() {
            this.src = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjZGRkIi8+PHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtZmFtaWx5PSJBcmlhbCwgc2Fucy1zZXJpZiIgZm9udC1zaXplPSIxNCIgZmlsbD0iIzk5OSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPkltYWdlIE5vdCBGb3VuZDwvdGV4dD48L3N2Zz4=';
            this.alt = 'Image not found';
        });
    });
}

// Touch gestures for mobile devices
function initializeTouchGestures() {
    if (!('ontouchstart' in window)) return; // Not a touch device
    
    // Add touch support for project cards
    const projectCards = document.querySelectorAll('.project-card');
    
    projectCards.forEach(card => {
        let startY = 0;
        let startTime = 0;
        
        card.addEventListener('touchstart', function(e) {
            startY = e.touches[0].clientY;
            startTime = Date.now();
        });
        
        card.addEventListener('touchend', function(e) {
            const endY = e.changedTouches[0].clientY;
            const endTime = Date.now();
            const deltaY = startY - endY;
            const deltaTime = endTime - startTime;
            
            // Detect swipe up gesture for quick view
            if (deltaY > 50 && deltaTime < 300) {
                const projectId = this.querySelector('[onclick]')?.getAttribute('onclick')?.match(/'([^']+)'/)?.[1];
                if (projectId) {
                    openProjectModal(projectId);
                }
            }
        });
    });
    
    // Add touch support for skill cards
    const skillCards = document.querySelectorAll('.skills-category-card');
    
    skillCards.forEach(card => {
        card.addEventListener('touchstart', function() {
            this.style.transform = 'scale(0.98)';
        });
        
        card.addEventListener('touchend', function() {
            this.style.transform = '';
        });
    });
}

// Responsive table handling
function initializeResponsiveTables() {
    const tables = document.querySelectorAll('table');
    
    tables.forEach(table => {
        if (!table.closest('.table-responsive')) {
            const wrapper = document.createElement('div');
            wrapper.className = 'table-responsive';
            table.parentNode.insertBefore(wrapper, table);
            wrapper.appendChild(table);
        }
    });
}

// Window resize handler
function initializeResizeHandler() {
    let resizeTimer;
    
    window.addEventListener('resize', function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function() {
            // Recalculate layouts after resize
            recalculateLayouts();
        }, 250);
    });
}

// Recalculate layouts for responsive design
function recalculateLayouts() {
    // Refresh masonry layouts if any
    const masonryContainers = document.querySelectorAll('.masonry');
    masonryContainers.forEach(container => {
        // Trigger layout recalculation
        container.style.height = 'auto';
    });
    
    // Refresh timeline positioning
    const timelineItems = document.querySelectorAll('.timeline-item');
    timelineItems.forEach(item => {
        item.style.opacity = '1';
        item.style.transform = 'translateY(0)';
    });
}

// Mobile-specific features
function initializeMobileFeatures() {
    // Add mobile-specific classes
    if (window.innerWidth <= 768) {
        document.body.classList.add('mobile-device');
    }
    
    // Disable hover effects on touch devices
    if ('ontouchstart' in window) {
        document.body.classList.add('touch-device');
    }
    
    // Mobile-specific scroll behavior
    initializeMobileScroll();
    
    // Mobile form enhancements
    initializeMobileFormEnhancements();
}

// Mobile scroll behavior
function initializeMobileScroll() {
    if (window.innerWidth <= 768) {
        // Smooth scroll polyfill for mobile
        const links = document.querySelectorAll('a[href^="#"]');
        
        links.forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    const offsetTop = target.offsetTop - 80; // Account for mobile navbar
                    window.scrollTo({
                        top: offsetTop,
                        behavior: 'smooth'
                    });
                }
            });
        });
    }
}

// Mobile form enhancements
function initializeMobileFormEnhancements() {
    const formInputs = document.querySelectorAll('input, textarea, select');
    
    formInputs.forEach(input => {
        // Prevent zoom on iOS when focusing on inputs
        if (input.type === 'email' || input.type === 'text' || input.type === 'tel') {
            input.addEventListener('focus', function() {
                if (window.innerWidth <= 768) {
                    this.style.fontSize = '16px';
                }
            });
        }
        
        // Add better mobile keyboard types
        if (input.type === 'tel') {
            input.setAttribute('inputmode', 'tel');
        } else if (input.type === 'email') {
            input.setAttribute('inputmode', 'email');
        } else if (input.type === 'number') {
            input.setAttribute('inputmode', 'numeric');
        }
    });
}

// Smooth scrolling for anchor links
function initializeSmoothScrolling() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                e.preventDefault();
                const offsetTop = target.offsetTop - (window.innerWidth <= 768 ? 70 : 80);
                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });
            }
        });
    });
}

// Enhanced scroll animations with responsive behavior
function initializeScrollAnimations() {
    const observerOptions = {
        threshold: window.innerWidth <= 768 ? 0.05 : 0.1, // Lower threshold for mobile
        rootMargin: window.innerWidth <= 768 ? '0px 0px -20px 0px' : '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('fade-in');
                
                // Trigger progress bar animations
                const progressBars = entry.target.querySelectorAll('.progress-bar');
                progressBars.forEach(bar => {
                    bar.style.width = bar.getAttribute('aria-valuenow') + '%';
                });
                
                // Trigger counter animations
                const counters = entry.target.querySelectorAll('.stats-number');
                counters.forEach(counter => {
                    animateCounter(counter);
                });
            }
        });
    }, observerOptions);

    // Observe elements with animation class
    const animatedElements = document.querySelectorAll('.card, .skill-item, .section, .stats-card, .timeline-item, .project-card, .contact-form-container, .contact-info');
    animatedElements.forEach(element => {
        observer.observe(element);
    });
}

// Contact page specific functionality
function initializeContactPage() {
    // Initialize form enhancements
    initializeContactForm();
    
    // Initialize tooltips for social links
    initializeTooltips();
    
    // Initialize scroll to form functionality
    initializeScrollToForm();
    
    // Initialize character counting for message field
    initializeCharacterCount();
}

// Contact form enhancements
function initializeContactForm() {
    const contactForm = document.querySelector('.contact-form');
    if (!contactForm) return; // Not on contact page
    
    // Add floating labels effect
    const formControls = contactForm.querySelectorAll('.form-control, .form-select');
    formControls.forEach(control => {
        // Add focus and blur event listeners for better UX
        control.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        
        control.addEventListener('blur', function() {
            if (!this.value) {
                this.parentElement.classList.remove('focused');
            }
        });
        
        // Initialize state for pre-filled fields
        if (control.value) {
            control.parentElement.classList.add('focused');
        }
    });
    
    // Phone number formatting
    const phoneInput = document.getElementById('txtPhone');
    if (phoneInput) {
        phoneInput.addEventListener('input', formatPhoneNumber);
    }
    
    // Message field enhancements
    const messageField = document.getElementById('txtMessage');
    if (messageField) {
        messageField.addEventListener('input', function() {
            validateMessageLength(this);
        });
    }
}

// Format phone number as user types
function formatPhoneNumber(e) {
    let value = e.target.value.replace(/\D/g, '');
    let formattedValue = '';
    
    if (value.length > 0) {
        if (value.length <= 3) {
            formattedValue = `(${value}`;
        } else if (value.length <= 6) {
            formattedValue = `(${value.slice(0, 3)}) ${value.slice(3)}`;
        } else {
            formattedValue = `(${value.slice(0, 3)}) ${value.slice(3, 6)}-${value.slice(6, 10)}`;
        }
    }
    
    e.target.value = formattedValue;
}

// Validate message length and show feedback
function validateMessageLength(messageField) {
    const minLength = 10;
    const currentLength = messageField.value.length;
    const formText = messageField.parentElement.querySelector('.form-text');
    
    if (currentLength < minLength) {
        messageField.classList.add('is-invalid');
        messageField.classList.remove('is-valid');
        if (formText) {
            formText.textContent = `Minimum ${minLength} characters required. Current: ${currentLength}`;
            formText.className = 'form-text text-danger';
        }
    } else {
        messageField.classList.remove('is-invalid');
        messageField.classList.add('is-valid');
        if (formText) {
            formText.textContent = `Character count: ${currentLength}`;
            formText.className = 'form-text text-success';
        }
    }
}

// Initialize tooltips
function initializeTooltips() {
    // Initialize Bootstrap tooltips if available
    if (typeof bootstrap !== 'undefined' && bootstrap.Tooltip) {
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    }
}

// Scroll to form functionality
function initializeScrollToForm() {
    const scrollToFormButtons = document.querySelectorAll('.scroll-to-form');
    
    scrollToFormButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const contactForm = document.querySelector('.contact-form-container');
            if (contactForm) {
                const offsetTop = contactForm.offsetTop - (window.innerWidth <= 768 ? 70 : 80);
                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });
                
                // Focus on first input after scroll
                setTimeout(() => {
                    const firstInput = contactForm.querySelector('input[type="text"]');
                    if (firstInput) {
                        firstInput.focus();
                    }
                }, 1000);
            }
        });
    });
}

// Character counting for message field
function initializeCharacterCount() {
    const messageField = document.getElementById('txtMessage');
    if (!messageField) return;
    
    // Create character counter element
    const counterElement = document.createElement('div');
    counterElement.className = 'character-counter text-muted small mt-1';
    counterElement.textContent = '0 characters';
    
    // Insert after the message field
    messageField.parentNode.insertBefore(counterElement, messageField.nextSibling);
    
    // Update counter on input
    messageField.addEventListener('input', function() {
        const currentLength = this.value.length;
        counterElement.textContent = `${currentLength} characters`;
        
        if (currentLength >= 10) {
            counterElement.className = 'character-counter text-success small mt-1';
        } else {
            counterElement.className = 'character-counter text-muted small mt-1';
        }
    });
}

// Projects page specific functionality
function initializeProjectsPage() {
    // Initialize project filtering
    initializeProjectFiltering();
    
    // Initialize project search
    initializeProjectSearch();
    
    // Initialize project modals
    initializeProjectModals();
    
    // Initialize stats counter animation
    initializeStatsCounters();
}

// Enhanced project filtering functionality
function initializeProjectFiltering() {
    const filterButtons = document.querySelectorAll('.projects-filter-buttons .filter-btn');
    const projectCards = document.querySelectorAll('.project-card');
    
    if (filterButtons.length === 0) return; // Not on projects page
    
    filterButtons.forEach(button => {
        button.addEventListener('click', function() {
            const filter = this.getAttribute('data-filter');
            
            // Update active button
            filterButtons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
            
            // Filter project cards with enhanced animation
            let visibleCount = 0;
            projectCards.forEach((card, index) => {
                const category = card.getAttribute('data-category');
                
                if (filter === 'all' || category === filter) {
                    card.classList.remove('hidden', 'filtered-out');
                    card.style.display = 'block';
                    // Stagger animation for better visual effect
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, index * 50);
                    visibleCount++;
                } else {
                    card.classList.add('filtered-out');
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(20px)';
                    setTimeout(() => {
                        card.classList.add('hidden');
                        card.style.display = 'none';
                    }, 300);
                }
            });
            
            // Show/hide no results message
            toggleNoResultsMessage(visibleCount === 0);
        });
    });
}

// Enhanced project search functionality
function initializeProjectSearch() {
    const searchInput = document.getElementById('projectSearch');
    if (!searchInput) return; // Not on projects page
    
    let searchTimeout;
    
    searchInput.addEventListener('input', function() {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(() => {
            const searchTerm = this.value.toLowerCase();
            const projectCards = document.querySelectorAll('.project-card');
            let visibleCount = 0;
            
            projectCards.forEach((card, index) => {
                const title = card.getAttribute('data-title')?.toLowerCase() || '';
                const tech = card.getAttribute('data-tech')?.toLowerCase() || '';
                const cardText = card.textContent.toLowerCase();
                
                const matches = title.includes(searchTerm) || 
                              tech.includes(searchTerm) || 
                              cardText.includes(searchTerm);
                
                if (matches || searchTerm === '') {
                    card.classList.remove('hidden', 'filtered-out');
                    card.style.display = 'block';
                    // Stagger animation
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, index * 30);
                    visibleCount++;
                } else {
                    card.classList.add('filtered-out');
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(20px)';
                    setTimeout(() => {
                        card.classList.add('hidden');
                        card.style.display = 'none';
                    }, 300);
                }
            });
            
            // Show/hide no results message
            toggleNoResultsMessage(visibleCount === 0);
        }, 300); // Debounce search
    });
}

// Toggle no results message
function toggleNoResultsMessage(show) {
    const noResultsElement = document.getElementById('noProjectsFound');
    if (noResultsElement) {
        noResultsElement.style.display = show ? 'block' : 'none';
    }
}

// Project modal functionality
function initializeProjectModals() {
    // Initialize Bootstrap modal if available
    if (typeof bootstrap !== 'undefined' && document.getElementById('projectModal')) {
        window.projectModal = new bootstrap.Modal(document.getElementById('projectModal'));
    }
}

// Open project modal with details
function openProjectModal(projectId) {
    if (!window.projectDetails || !window.projectDetails[projectId]) {
        console.error('Project details not found for ID:', projectId);
        return;
    }
    
    const project = window.projectDetails[projectId];
    const modalBody = document.getElementById('projectModalBody');
    const modalTitle = document.getElementById('projectModalLabel');
    const demoLink = document.getElementById('modalDemoLink');
    const sourceLink = document.getElementById('modalSourceLink');
    
    if (!modalBody) return;
    
    // Update modal title
    if (modalTitle) modalTitle.textContent = project.title;
    
    // Build features list
    const featuresList = project.features?.map(feature => `<li>${feature}</li>`).join('') || '';
    const techList = project.technologies?.map(tech => `<span class="tech-tag bg-primary">${tech}</span>`).join('') || '';
    
    // Update modal body with responsive layout
    modalBody.innerHTML = `
        <div class="row">
            <div class="col-lg-6 col-md-12 mb-3">
                <img src="${project.imageUrl}" alt="${project.title}" class="img-fluid rounded">
            </div>
            <div class="col-lg-6 col-md-12">
                <h6 class="text-primary">Project Overview</h6>
                <p>${project.description}</p>
                
                <h6 class="text-primary mt-3">Technologies Used</h6>
                <div class="mb-3">${techList}</div>
                
                <h6 class="text-primary">Key Challenges</h6>
                <p>${project.challenges}</p>
                
                <h6 class="text-primary">Results</h6>
                <p class="text-success">${project.results}</p>
            </div>
        </div>
        
        <div class="row mt-4">
            <div class="col-12">
                <h6 class="text-primary">Key Features</h6>
                <ul class="features-list">
                    ${featuresList}
                </ul>
            </div>
        </div>
    `;
    
    // Update modal links
    if (demoLink) demoLink.href = '#';
    if (sourceLink) sourceLink.href = '#';
    
    // Show modal
    if (window.projectModal) {
        window.projectModal.show();
    }
}

// Skills page specific functionality
function initializeSkillsPage() {
    // Initialize skill filtering
    initializeSkillFiltering();
    
    // Initialize stats counter animation
    initializeStatsCounters();
    
    // Initialize progress bar animations
    initializeProgressBars();
}

// Skills filtering functionality
function initializeSkillFiltering() {
    const filterButtons = document.querySelectorAll('.skills-filter-buttons .filter-btn');
    const skillCards = document.querySelectorAll('.skills-category-card');
    
    if (filterButtons.length === 0) return; // Not on skills page
    
    filterButtons.forEach(button => {
        button.addEventListener('click', function() {
            const filter = this.getAttribute('data-filter');
            
            // Update active button
            filterButtons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
            
            // Filter skill cards
            skillCards.forEach((card, index) => {
                const category = card.getAttribute('data-category');
                
                if (filter === 'all' || category === filter) {
                    card.style.display = 'block';
                    card.classList.remove('hidden');
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'scale(1)';
                    }, index * 100);
                } else {
                    card.classList.add('hidden');
                    card.style.opacity = '0';
                    card.style.transform = 'scale(0.8)';
                    setTimeout(() => {
                        card.style.display = 'none';
                    }, 500);
                }
            });
        });
    });
}

// Enhanced stats counter animation
function initializeStatsCounters() {
    const statsNumbers = document.querySelectorAll('.stats-number');
    
    statsNumbers.forEach(stat => {
        const target = parseInt(stat.getAttribute('data-target'));
        if (isNaN(target)) return;
        
        const duration = window.innerWidth <= 768 ? 1500 : 2000; // Faster on mobile
        const increment = target / (duration / 16);
        let current = 0;
        let hasAnimated = false;
        
        const updateCounter = () => {
            if (current < target) {
                current += increment;
                stat.textContent = Math.ceil(current);
                requestAnimationFrame(updateCounter);
            } else {
                stat.textContent = target;
            }
        };
        
        // Start animation when element is visible
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting && !hasAnimated) {
                    hasAnimated = true;
                    updateCounter();
                    observer.unobserve(entry.target);
                }
            });
        }, {
            threshold: window.innerWidth <= 768 ? 0.3 : 0.5
        });
        
        observer.observe(stat);
    });
}

// Progress bar animations
function initializeProgressBars() {
    const progressBars = document.querySelectorAll('.progress-bar');
    
    progressBars.forEach(bar => {
        let hasAnimated = false;
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting && !hasAnimated) {
                    hasAnimated = true;
                    const width = bar.getAttribute('aria-valuenow');
                    setTimeout(() => {
                        bar.style.width = width + '%';
                    }, 200);
                    observer.unobserve(entry.target);
                }
            });
        }, {
            threshold: window.innerWidth <= 768 ? 0.2 : 0.3
        });
        
        observer.observe(bar.closest('.skill-item') || bar.closest('.card'));
    });
}

// Animate counter function
function animateCounter(element) {
    const target = parseInt(element.getAttribute('data-target'));
    if (isNaN(target)) return;
    
    const duration = window.innerWidth <= 768 ? 1500 : 2000;
    const increment = target / (duration / 16);
    let current = 0;
    
    const updateCounter = () => {
        if (current < target) {
            current += increment;
            element.textContent = Math.ceil(current);
            requestAnimationFrame(updateCounter);
        } else {
            element.textContent = target;
        }
    };
    
    updateCounter();
}

// Enhanced form validation
function initializeFormValidation() {
    const forms = document.querySelectorAll('form');
    
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            if (!validateForm(this)) {
                e.preventDefault();
                e.stopPropagation();
            }
            this.classList.add('was-validated');
        });
        
        // Real-time validation for contact form
        if (form.querySelector('.contact-form')) {
            initializeRealTimeValidation(form);
        }
    });
}

// Real-time validation for contact form
function initializeRealTimeValidation(form) {
    const inputs = form.querySelectorAll('input[required], select[required], textarea[required]');
    
    inputs.forEach(input => {
        input.addEventListener('blur', function() {
            validateField(this);
        });
        
        input.addEventListener('input', function() {
            if (this.classList.contains('is-invalid')) {
                validateField(this);
            }
        });
    });
}

// Validate individual field
function validateField(field) {
    const value = field.value.trim();
    let isValid = true;
    let errorMessage = '';
    
    // Required field validation
    if (field.hasAttribute('required') && !value) {
        isValid = false;
        errorMessage = 'This field is required.';
    }
    
    // Email validation
    if (field.type === 'email' && value) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(value)) {
            isValid = false;
            errorMessage = 'Please enter a valid email address.';
        }
    }
    
    // Message length validation
    if (field.id === 'txtMessage' && value.length > 0 && value.length < 10) {
        isValid = false;
        errorMessage = 'Message must be at least 10 characters long.';
    }
    
    // Update field appearance
    if (isValid) {
        field.classList.remove('is-invalid');
        field.classList.add('is-valid');
        clearFieldError(field);
    } else {
        field.classList.remove('is-valid');
        field.classList.add('is-invalid');
        showFieldError(field, errorMessage);
    }
    
    return isValid;
}

// Validate form fields
function validateForm(form) {
    let isValid = true;
    const requiredFields = form.querySelectorAll('[required]');
    
    requiredFields.forEach(field => {
        if (!validateField(field)) {
            isValid = false;
        }
    });
    
    return isValid;
}

// Show field error
function showFieldError(field, message) {
    clearFieldError(field);
    
    const errorDiv = document.createElement('div');
    errorDiv.className = 'invalid-feedback';
    errorDiv.textContent = message;
    
    field.parentNode.appendChild(errorDiv);
}

// Clear field error
function clearFieldError(field) {
    const errorDiv = field.parentNode.querySelector('.invalid-feedback');
    if (errorDiv) {
        errorDiv.remove();
    }
}

// Timeline animation
function initializeTimeline() {
    const timelineItems = document.querySelectorAll('.timeline-item');
    
    const timelineObserver = new IntersectionObserver((entries) => {
        entries.forEach((entry, index) => {
            if (entry.isIntersecting) {
                setTimeout(() => {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }, index * 200);
            }
        });
    }, {
        threshold: window.innerWidth <= 768 ? 0.1 : 0.2
    });
    
    timelineItems.forEach(item => {
        item.style.opacity = '0';
        item.style.transform = 'translateY(30px)';
        item.style.transition = 'all 0.6s ease';
        timelineObserver.observe(item);
    });
}

// Scroll to top functionality
function initializeScrollToTop() {
    const scrollButton = document.createElement('button');
    scrollButton.className = 'btn btn-primary position-fixed';
    scrollButton.style.cssText = `
        bottom: 20px; 
        right: 20px; 
        z-index: 1000; 
        border-radius: 50%; 
        width: ${window.innerWidth <= 768 ? '45px' : '50px'}; 
        height: ${window.innerWidth <= 768 ? '45px' : '50px'}; 
        display: none;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    `;
    scrollButton.innerHTML = '<i class="fas fa-arrow-up"></i>';
    scrollButton.setAttribute('aria-label', 'Scroll to top');
    
    document.body.appendChild(scrollButton);
    
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 300) {
            scrollButton.style.display = 'block';
        } else {
            scrollButton.style.display = 'none';
        }
    });
    
    scrollButton.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

// Lazy loading for images
function initializeLazyLoading() {
    const images = document.querySelectorAll('img[data-src]');
    
    const imageObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.getAttribute('data-src');
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
            }
        });
    });
    
    images.forEach(img => imageObserver.observe(img));
}

// Initialize when page loads
window.addEventListener('load', function() {
    initializeScrollToTop();
    initializeLazyLoading();
    
    // Initialize timeline after page load for better performance
    setTimeout(initializeTimeline, 500);
});

// Utility function for responsive breakpoint detection
function getBreakpoint() {
    const width = window.innerWidth;
    if (width <= 480) return 'xs';
    if (width <= 768) return 'sm';
    if (width <= 991) return 'md';
    if (width <= 1200) return 'lg';
    return 'xl';
}

// Export for global use
window.portfolioUtils = {
    getBreakpoint,
    openProjectModal,
    validateField,
    formatPhoneNumber
};