<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration Form</title>
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-hover: #3a56d4;
            --success-color: #2ecc71;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --light-bg: #f8f9fa;
            --dark-text: #2d3748;
            --gray-text: #718096;
            --border-color: #e2e8f0;
            --shadow-sm: 0 1px 3px rgba(0,0,0,0.12);
            --shadow-md: 0 4px 6px rgba(0,0,0,0.1);
            --shadow-lg: 0 10px 15px rgba(0,0,0,0.1);
            --radius: 8px;
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            color: var(--dark-text);
            line-height: 1.6;
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container {
            max-width: 700px;
            margin: 0 auto;
            background-color: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow-lg);
            overflow: hidden;
        }

        .form-header {
            background: linear-gradient(to right, var(--primary-color), #5e81f4);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .form-header h1 {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .form-header p {
            opacity: 0.9;
            font-size: 16px;
        }

        .form-body {
            padding: 40px 30px;
        }

        .form-section {
            margin-bottom: 24px;
        }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 16px;
            color: var(--primary-color);
            display: flex;
            align-items: center;
        }

        .section-title:after {
            content: '';
            flex: 1;
            height: 1px;
            background: var(--border-color);
            margin-left: 10px;
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
            min-width: 0;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 8px;
            color: var(--gray-text);
        }

        .required:after {
            content: " *";
            color: var(--danger-color);
        }

        input, select {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius);
            font-size: 16px;
            transition: var(--transition);
            background-color: white;
        }

        input:focus, select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
        }

        input.invalid {
            border-color: var(--danger-color);
            background-color: rgba(231, 76, 60, 0.05);
        }

        .error {
            color: var(--danger-color);
            font-size: 12px;
            margin-top: 6px;
            display: none;
        }

        .password-strength-container {
            margin-top: 8px;
        }

        .password-strength {
            height: 4px;
            background-color: #edf2f7;
            border-radius: 2px;
            overflow: hidden;
        }

        .password-strength-meter {
            height: 100%;
            width: 0;
            transition: var(--transition);
        }

        .password-status {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            margin-top: 6px;
        }

        .password-status span {
            color: var(--gray-text);
        }

        .form-footer {
            padding: 0 30px 40px;
        }

        .btn-submit {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 14px 20px;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            border-radius: var(--radius);
            cursor: pointer;
            transition: var(--transition);
            box-shadow: var(--shadow-sm);
        }

        .btn-submit:hover {
            background-color: var(--primary-hover);
            box-shadow: var(--shadow-md);
            transform: translateY(-1px);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                gap: 10px;
            }
        }

        .floating-label {
            position: relative;
        }

        .floating-label input {
            padding: 16px 16px 8px;
        }

        .floating-label label {
            position: absolute;
            top: 12px;
            left: 16px;
            transition: var(--transition);
            pointer-events: none;
        }

        .floating-label input:focus ~ label,
        .floating-label input:not(:placeholder-shown) ~ label {
            transform: translateY(-12px) scale(0.75);
            color: var(--primary-color);
        }

        .input-icon {
            position: relative;
        }

        .input-icon input {
            padding-left: 40px;
        }

        .input-icon i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray-text);
        }

        .form-instructions {
            background-color: var(--light-bg);
            border-left: 4px solid var(--primary-color);
            padding: 12px 16px;
            margin-bottom: 24px;
            border-radius: 0 var(--radius) var(--radius) 0;
            font-size: 14px;
            color: var(--gray-text);
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="form-header">
            <h1>Student Registration</h1>
            <p>Create your account to get started</p>
        </div>
        
        <form action="insertServlet" method="post" id="registrationForm" onsubmit="return validateForm()">
            <div class="form-body">
                <div class="form-instructions">
                    <i class="fas fa-info-circle"></i> Please fill out all required fields marked with an asterisk (*).
                </div>
                
                <div class="form-section">
                    <div class="section-title">Personal Information</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="std_Fname" class="required">First Name</label>
                            <div class="input-icon">
                                <i class="fas fa-user"></i>
                                <input type="text" id="std_Fname" name="std_Fname" placeholder="Enter your first name" required>
                            </div>
                            <div class="error" id="firstNameError">Please enter your first name</div>
                        </div>
                        
                        <div class="form-group">
                            <label for="std_Lname" class="required">Last Name</label>
                            <div class="input-icon">
                                <i class="fas fa-user"></i>
                                <input type="text" id="std_Lname" name="std_Lname" placeholder="Enter your last name" required>
                            </div>
                            <div class="error" id="lastNameError">Please enter your last name</div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="std_DOB" class="required">Date of Birth</label>
                            <div class="input-icon">
                                <i class="fas fa-calendar-alt"></i>
                                <input type="date" id="std_DOB" name="std_DOB" required>
                            </div>
                            <div class="error" id="dateOfBirthError">Please select your date of birth</div>
                        </div>
                        
                        <div class="form-group">
                            <label for="std_NIC" class="required">National ID Number</label>
                            <div class="input-icon">
                                <i class="fas fa-id-card"></i>
                                <input type="text" id="std_NIC" name="std_NIC" placeholder="Enter your national ID" required>
                            </div>
                            <div class="error" id="nationalIdError">Please enter a valid national ID number</div>
                        </div>
                    </div>
                </div>
                
                <div class="form-section">
                    <div class="section-title">Contact Information</div>
                    
                    <div class="form-group">
                        <label for="std_email" class="required">Email Address</label>
                        <div class="input-icon">
                            <i class="fas fa-envelope"></i>
                            <input type="email" id="std_email" name="std_email" placeholder="yourname@example.com" required>
                        </div>
                        <div class="error" id="emailError">Please enter a valid email address</div>
                    </div>
                    
                    <div class="form-group">
                        <label for="std_phone" class="required">Phone Number</label>
                        <div class="input-icon">
                            <i class="fas fa-phone"></i>
                            <input type="tel" id="std_phone" name="std_phone" placeholder="Enter your phone number" required>
                        </div>
                        <div class="error" id="phoneError">Please enter a valid phone number</div>
                    </div>
                    
                    <div class="form-group">
                        <label for="std_address" class="required">Address</label>
                        <div class="input-icon">
                            <i class="fas fa-home"></i>
                            <input type="text" id="std_address" name="std_address" placeholder="Enter your full address" required>
                        </div>
                        <div class="error" id="addressError">Please enter your address</div>
                    </div>
                </div>
                
                <div class="form-section">
                    <div class="section-title">Account Security</div>
                    
                    <div class="form-group">
                        <label for="std_password" class="required">Password</label>
                        <div class="input-icon">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="std_password" name="std_password" placeholder="Create a strong password" required>
                        </div>
                        <div class="password-strength-container">
                            <div class="password-strength">
                                <div class="password-strength-meter" id="passwordStrength"></div>
                            </div>
                            <div class="password-status">
                                <span id="passwordStrengthText">Password strength</span>
                                <span id="passwordStrengthValue">Weak</span>
                            </div>
                        </div>
                        <div class="error" id="passwordError">Password must be at least 8 characters with letters, numbers and symbols</div>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword" class="required">Confirm Password</label>
                        <div class="input-icon">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter your password" required>
                        </div>
                        <div class="error" id="confirmPasswordError">Passwords do not match</div>
                    </div>
                </div>
            </div>
            
            <div class="form-footer">
                <button type="submit" class="btn-submit">
                    <i class="fas fa-user-plus"></i> Create Account
                </button>
            </div>
        </form>
    </div>

    <script>
 // Password strength meter
    document.getElementById('std_password').addEventListener('input', function() {
        const password = this.value;
        const meter = document.getElementById('passwordStrength');
        const strengthText = document.getElementById('passwordStrengthValue');
        // Check password strength
        let strength = 0;
        if (password.length > 0) strength += 20;
        if (password.length >= 8) strength += 20;
        if (/[A-Z]/.test(password)) strength += 20;
        if (/[0-9]/.test(password)) strength += 20;
        if (/[^A-Za-z0-9]/.test(password)) strength += 20;
        // Update meter
        meter.style.width = strength + '%';
        // Update color and text based on strength
        if (strength < 40) {
            meter.style.backgroundColor = '#e74c3c'; // danger color
            strengthText.textContent = 'Weak';
            strengthText.style.color = '#e74c3c'; // danger color
        } else if (strength < 70) {
            meter.style.backgroundColor = '#f39c12'; // warning color
            strengthText.textContent = 'Moderate';
            strengthText.style.color = '#f39c12'; // warning color
        } else {
            meter.style.backgroundColor = '#2ecc71'; // success color
            strengthText.textContent = 'Strong';
            strengthText.style.color = '#2ecc71'; // success color
        }
    });

        // Real-time validation for each field
        const fields = [
            { id: 'std_Fname', errorId: 'firstNameError', validate: (value) => value.trim() !== '' },
            { id: 'std_Lname', errorId: 'lastNameError', validate: (value) => value.trim() !== '' },
            { 
                id: 'std_email', 
                errorId: 'emailError', 
                validate: (value) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value) 
            },
            { 
                id: 'std_phone', 
                errorId: 'phoneError', 
                validate: (value) => /^\d{10,15}$/.test(value.replace(/[^0-9]/g, '')) 
            },
            { id: 'std_address', errorId: 'addressError', validate: (value) => value.trim() !== '' },
            { id: 'std_NIC', errorId: 'nationalIdError', validate: (value) => value.trim() !== '' },
            { id: 'std_DOB', errorId: 'dateOfBirthError', validate: (value) => value !== '' },
            { 
                id: 'std_password', 
                errorId: 'passwordError', 
                validate: (value) => value.length >= 8 && /[A-Za-z]/.test(value) && /[0-9]/.test(value) 
            }
        ];

        // Add input event listeners for all fields
        fields.forEach(field => {
            const element = document.getElementById(field.id);
            if (element) {
                element.addEventListener('input', function() {
                    validateField(field.id, field.errorId, field.validate);
                });
                element.addEventListener('blur', function() {
                    if (this.value) {
                        validateField(field.id, field.errorId, field.validate);
                    }
                });
            }
        });

        // Real-time password match verification
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('std_password').value;
            const confirmPassword = this.value;
            validatePasswordMatch(password, confirmPassword);
        });

        function validatePasswordMatch(password, confirmPassword) {
            const error = document.getElementById('confirmPasswordError');
            const field = document.getElementById('confirmPassword');
            
            if (confirmPassword && password !== confirmPassword) {
                field.classList.add('invalid');
                error.style.display = 'block';
                return false;
            } else {
                field.classList.remove('invalid');
                error.style.display = 'none';
                return true;
            }
        }

        function validateField(id, errorId, validateFn) {
            const field = document.getElementById(id);
            const error = document.getElementById(errorId);
            const isValid = validateFn(field.value);
            
            if (!isValid) {
                field.classList.add('invalid');
                error.style.display = 'block';
                return false;
            } else {
                field.classList.remove('invalid');
                error.style.display = 'none';
                return true;
            }
        }

        // Form validation
        function validateForm() {
            let isValid = true;
            
            // Validate all fields
            fields.forEach(field => {
                if (!validateField(field.id, field.errorId, field.validate)) {
                    isValid = false;
                }
            });
            
            // Validate password match
            const password = document.getElementById('std_password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (!validatePasswordMatch(password, confirmPassword)) {
                isValid = false;
            }
            
            return isValid;
        }

        // Add visual feedback when fields gain focus
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.boxShadow = '0 0 0 2px rgba(67, 97, 238, 0.1)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.boxShadow = 'none';
            });
        });
    </script>
</body>
</html>