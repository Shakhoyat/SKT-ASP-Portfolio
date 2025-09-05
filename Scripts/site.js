// SKT Portfolio - Custom JavaScript

// Document ready function
document.addEventListener('DOMContentLoaded', function() {
    initializePortfolio();
});

// Initialize portfolio functionality
function initializePortfolio() {
    // Add smooth scrolling to anchor links
    initializeSmoothScrolling();
    
    // Initialize animation on scroll
    initializeScrollAnimations();
    
    // Initialize form validation
    initializeFormValidation();
    
    // Initialize skills page specific features
    initializeSkillsPage();
    
    // Initialize projects page specific features
    initializeProjectsPage();
}

// Smooth scrolling for anchor links
function initializeSmoothScrolling() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                e.preventDefault();
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
}

// Initialize scroll animations
function initializeScrollAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
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
    const animatedElements = document.querySelectorAll('.card, .skill-item, .section, .stats-card, .timeline-item, .project-card');
    animatedElements.forEach(element => {
        observer.observe(element);
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

// Project filtering functionality
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
            
            // Filter project cards
            let visibleCount = 0;
            projectCards.forEach(card => {
                const category = card.getAttribute('data-category');
                
                if (filter === 'all' || category === filter) {
                    card.classList.remove('hidden', 'filtered-out');
                    card.style.display = 'block';
                    visibleCount++;
                } else {
                    card.classList.add('filtered-out');
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

// Project search functionality
function initializeProjectSearch() {
    const searchInput = document.getElementById('projectSearch');
    if (!searchInput) return; // Not on projects page
    
    searchInput.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        const projectCards = document.querySelectorAll('.project-card');
        let visibleCount = 0;
        
        projectCards.forEach(card => {
            const title = card.getAttribute('data-title')?.toLowerCase() || '';
            const tech = card.getAttribute('data-tech')?.toLowerCase() || '';
            const cardText = card.textContent.toLowerCase();
            
            const matches = title.includes(searchTerm) || 
                          tech.includes(searchTerm) || 
                          cardText.includes(searchTerm);
            
            if (matches || searchTerm === '') {
                card.classList.remove('hidden', 'filtered-out');
                card.style.display = 'block';
                visibleCount++;
            } else {
                card.classList.add('filtered-out');
                setTimeout(() => {
                    card.classList.add('hidden');
                    card.style.display = 'none';
                }, 300);
            }
        });
        
        // Show/hide no results message
        toggleNoResultsMessage(visibleCount === 0);
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
    if (typeof bootstrap !== 'undefined') {
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
    
    // Update modal title
    modalTitle.textContent = project.title;
    
    // Build features list
    const featuresList = project.features.map(feature => `<li>${feature}</li>`).join();
    const techList = project.technologies.map(tech => `<span class="tech-tag bg-primary">${tech}</span>`).join();
    
    // Update modal body
    modalBody.innerHTML = `
        <div class="row">
            <div class="col-md-6">
                <img src="${project.imageUrl}" alt="${project.title}" class="img-fluid rounded mb-3">
            </div>
            <div class="col-md-6">
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
    demoLink.href = '#'; // Replace with actual demo URL
    sourceLink.href = '#'; // Replace with actual source URL
    
    // Show modal
    if (window.projectModal) {
        window.projectModal.show();
    } else {
        // Fallback for when Bootstrap is not available
        document.getElementById('projectModal').style.display = 'block';
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
            skillCards.forEach(card => {
                const category = card.getAttribute('data-category');
                
                if (filter === 'all' || category === filter) {
                    card.style.display = 'block';
                    card.classList.remove('hidden');
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'scale(1)';
                    }, 100);
                } else {
                    card.classList.add('hidden');
                    setTimeout(() => {
                        card.style.display = 'none';
                    }, 500);
                }
            });
        });
    });
}

// Stats counter animation
function initializeStatsCounters() {
    const statsNumbers = document.querySelectorAll('.stats-number');
    
    statsNumbers.forEach(stat => {
        const target = parseInt(stat.getAttribute('data-target'));
        const increment = target / 200; // Animation duration factor
        let current = 0;
        
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
                if (entry.isIntersecting) {
                    updateCounter();
                    observer.unobserve(entry.target);
                }
            });
        });
        
        observer.observe(stat);
    });
}

// Progress bar animations
function initializeProgressBars() {
    const progressBars = document.querySelectorAll('.progress-bar');
    
    progressBars.forEach(bar => {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const width = bar.getAttribute('aria-valuenow');
                    setTimeout(() => {
                        bar.style.width = width + '%';
                    }, 200);
                    observer.unobserve(entry.target);
                }
            });
        });
        
        observer.observe(bar.closest('.skill-item') || bar.closest('.card'));
    });
}

// Animate counter function
function animateCounter(element) {
    const target = parseInt(element.getAttribute('data-target'));
    if (isNaN(target)) return;
    
    const duration = 2000; // 2 seconds
    const increment = target / (duration / 16); // 60fps
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

// Form validation
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
    });
}

// Validate form fields
function validateForm(form) {
    let isValid = true;
    const requiredFields = form.querySelectorAll('[required]');
    
    requiredFields.forEach(field => {
        if (!field.value.trim()) {
            isValid = false;
            showFieldError(field, 'This field is required.');
        } else {
            clearFieldError(field);
        }
        
        // Email validation
        if (field.type === 'email' && field.value.trim()) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(field.value)) {
                isValid = false;
                showFieldError(field, 'Please enter a valid email address.');
            }
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
    
    field.classList.add('is-invalid');
    field.parentNode.appendChild(errorDiv);
}

// Clear field error
function clearFieldError(field) {
    field.classList.remove('is-invalid');
    const errorDiv = field.parentNode.querySelector('.invalid-feedback');
    if (errorDiv) {
        errorDiv.remove();
    }
}

// Timeline animation
function initializeTimeline() {
    const timelineItems = document.querySelectorAll('.timeline-item');
    
    const timelineObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, {
        threshold: 0.2
    });
    
    timelineItems.forEach(item => {
        item.style.opacity = '0';
        item.style.transform = 'translateY(30px)';
        item.style.transition = 'all 0.6s ease';
        timelineObserver.observe(item);
    });
}

// Initialize timeline when page loads
window.addEventListener('load', function() {
    initializeTimeline();
});

// Utility function for AJAX calls (for future use)
function makeAjaxCall(url, method, data, successCallback, errorCallback) {
    const xhr = new XMLHttpRequest();
    xhr.open(method, url, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                if (successCallback) {
                    successCallback(JSON.parse(xhr.responseText));
                }
            } else {
                if (errorCallback) {
                    errorCallback(xhr.statusText);
                }
            }
        }
    };
    
    xhr.send(JSON.stringify(data));
}

// Show notification message
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
    notification.style.cssText = 'top: 90px; right: 20px; z-index: 1050; min-width: 300px;';
    
    notification.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;
    
    document.body.appendChild(notification);
    
    // Auto-remove after 5 seconds
    setTimeout(() => {
        if (notification.parentNode) {
            notification.parentNode.removeChild(notification);
        }
    }, 5000);
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

// Scroll to top functionality
function initializeScrollToTop() {
    const scrollButton = document.createElement('button');
    scrollButton.className = 'btn btn-primary position-fixed';
    scrollButton.style.cssText = 'bottom: 20px; right: 20px; z-index: 1000; border-radius: 50%; width: 50px; height: 50px; display: none;';
    scrollButton.innerHTML = '<i class="fas fa-arrow-up"></i>';
    
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

// Initialize scroll to top when page loads
window.addEventListener('load', function() {
    initializeScrollToTop();
    initializeLazyLoading();
});

// Project filtering by technology (additional functionality)
function filterProjectsByTechnology(tech) {
    const projectCards = document.querySelectorAll('.project-card');
    let visibleCount = 0;
    
    projectCards.forEach(card => {
        const technologies = card.getAttribute('data-tech')?.toLowerCase() || '';
        
        if (technologies.includes(tech.toLowerCase())) {
            card.classList.remove('hidden', 'filtered-out');
            card.style.display = 'block';
            visibleCount++;
        } else {
            card.classList.add('filtered-out');
            setTimeout(() => {
                card.classList.add('hidden');
                card.style.display = 'none';
            }, 300);
        }
    });
    
    toggleNoResultsMessage(visibleCount === 0);
}

// Reset all filters
function resetProjectFilters() {
    const projectCards = document.querySelectorAll('.project-card');
    const filterButtons = document.querySelectorAll('.projects-filter-buttons .filter-btn');
    const searchInput = document.getElementById('projectSearch');
    
    // Reset filter buttons
    filterButtons.forEach(btn => btn.classList.remove('active'));
    document.querySelector('[data-filter="all"]')?.classList.add('active');
    
    // Reset search input
    if (searchInput) searchInput.value = '';
    
    // Show all projects
    projectCards.forEach(card => {
        card.classList.remove('hidden', 'filtered-out');
        card.style.display = 'block';
    });
    
    toggleNoResultsMessage(false);
}