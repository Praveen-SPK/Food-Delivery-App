<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS_Files/Register.css">
    <script src="../JS_Files/Register.js" defer></script>
    <title>Registration Page</title>
</head>

<body>
    <div class="wrapper" >
        <div class="form-wrapper signup" id="signup-section">
            
            <form action="../Signup" method="post" id="signup-form">

                <h3>Sign Up</h3>
                <div class="form-input">
                    <input  type="text" name="name" required />
                    <label for="name">Name</label>
                </div>
                <div class="form-input">
                    
                    <input  type="email" name="email" required />
                    <label for="email">Email-Id</label>
                </div>
                
                <div class="form-input">
                    
                    <input  type="text" name="mobile" maxlength="10" minlength="10" required />
                    <label for="mobile">Mobile-No</label>
                </div>
                <div class="form-input">
                    
                    <input  type="password" name="password" required />
                    <label for="password">Password</label>
                </div>
                <div class="remember-me">
                    <label><input type="checkbox" class="checkbox" required> I agree to the terms & conditions</label>
                </div>
                <div class="btn">
                    <button type="submit">Sign Up</button>
                </div>
                <div class="form-changer">
                    <span>Already have an Account ?</span>
                    <a href="#" class="signInBtn-link">Sign In</a>
                </div>
                
            </form>
        </div>


        <div class="form-wrapper signin" id="signin-section" >
            <form action="../Signin" id="signin-form">

                <h3>Sign In</h3>
                <div class="form-input">
                    <input type="text" name="email-username" required />
                    <label for="name">Email or UserName</label>
                </div>
                <div class="form-input">
                    <input type="password" name="password" required />
                    <label for="password">Password</label>
                </div>
                <div class="remember-me">
                    <label><input type="checkbox" class="checkbox">Remember Me</label>
                    <a href="#" class="forgetlink">Forget Password</a>
                </div>
                <div class="btn">
                
                <button type="submit">Sign In</button>
                
                
                </div>
                <div class="form-changer">
                    <span>Don't have an account ?</span>
                    <a href="#" class="signUpBtn-fromsignin">Sign Up</a>
                </div>
            </form>
        </div>

        
      	<div class="form-wrapper forget-password" id="forget-section" >
            <form action="../Forgetpage" id="forget-password">

                <h3>Forget Password</h3>
                
                <div class="form-input">
                    <input type="email" name="email" required />
                    <label for="email">Email-Id</label>
                </div>
                <div class="form-input">
                    <input type="password" name="newpassword" required />
                    <label for="newpassword">New Password</label>
                </div>
                <div class="form-input">
                    <input type="password" name="confirmpassword" required />
                    <label for="confirmpassword">Confirm Password</label>
                </div>
                <div class="btn" style="padding-top: 30px;">
                <button type="submit" class="forget-submit">Submit</button>
                </div>
                 <div class="form-changer" style="padding-top: 20px; padding-left: 18px;">
                    <span>Don't have an account ?</span>
                    <a href="#" class="signUpBtn-fromforgetpassword">Sign Up</a>
                </div>

            </form>
        </div>
        

        <div class="form-wrapper change-password" id="change-section" >
            <form action="../Changepassword" id="change-password">

                <h3>Reset Password</h3>
                <div class="form-input">
                    <input type="password" name="oldpassword" required />
                    <label for="oldpassword">Old Password</label>
                </div>
                <div class="form-input">
                    <input type="password" name="newpassword" required />
                    <label for="newpassword">New Password</label>
                </div>
                <div class="form-input">
                    <input type="password" name="confirmpassword" required />
                    <label for="confirmpassword">Confirm Password</label>
                </div>
                <div class="btn" style="padding-top: 30px;">
                <button type="submit">Submit</button>
                </div>
                <div class="form-changer" style="padding-top: 20px; padding-left: 18px;">
                    <span>Don't have an account ?</span>
                    <a href="#" class="signUpBtn-fromchangepassword">Sign Up</a>
                </div>
                
            </form>
        </div>
    </div>
    

</body>

</html>