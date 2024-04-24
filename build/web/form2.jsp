<%-- 
    Document   : home
    Created on : 10 Apr, 2024, 12:14:37 AM
    Author     : harsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Sign Up Form</title>

  <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
  <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="css/style.css">
  <meta name="robots" content="noindex, follow">
</head>

                 <% 
               String username = null;
               String rcamp = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        // Iterate through cookies to find the username cookie
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                // Found the username cookie, get its value
                username = cookie.getValue();
                break;
            }
             if (cookie.getName().equals("rcamp")) {
                // Found the username cookie, get its value
                rcamp = cookie.getValue();
                break;
            }
        }
    }
    System.out.println("Value of rcamp is "+rcamp);
            %>
            

<body>
  <div class="main">
    <div class="container">
      <div class="signup-content">
<!--        <div class="signup-img">
          <img src="images/form-img2.jpg" alt>
          <div class="signup-img-content">
            <h2>Register now </h2>
            <p>To experience something Adventurous!</p>
          </div>
        </div>-->
        <div class="signup-form">
          <form method="POST" class="register-form" action="/Java_Project/inq" id="register-form">
              

              
              <input type="hidden" name="org" id="hiddenfield">
              
            <div class="form-row">
              <div class="form-group">
                <div class="form-input">
                  <label for="full_name" class="required">Full Name</label>
                  <input type="text" name="full_name" id="full_name" />
                </div>
                <div class="form-input">
                  <label for="DOB" class="required">Date of Birth</label>
                  <input type="text" name="DOB" id="DOB" />
                </div>
                <div class="form-input">
                  <label for="nationality" class="required">Nationality</label>
                  <input type="text" name="nationality" id="nationality" />
                </div>
                <div class="form-input">
                  <label for="email" class="required">Email</label>
                  <input type="text" name="email" id="email" />
                </div>
                <div class="form-input">
                  <label for="phone_number" class="required">Phone number</label>
                  <input type="text" name="phone_number" id="phone_number" />
                </div>
              </div>
                
                
              <div class="form-group">
                   <div class="form-input">
                  <label for="gen" class="required">Gender</label>
                  <input type="text" name="gender" id="gen" />
                </div>
               
                <div class="form-radio">
                  <div class="label-flex">
                    <label for="payment">Payment Mode</label>
                    <a href="#" class="form-link">Payment Detail</a>
                  </div>
                  <div class="form-radio-group">
                    <div class="form-radio-item">
                      <input type="radio" name="payment_mode" id="cash" checked>
                      <label for="cash">Cash</label>
                      <span class="check"></span>
                    </div>
                    <div class="form-radio-item">
                      <input type="radio" name="payment_mode" id="cheque">
                      <label for="cheque">Cheque</label>
                      <span class="check"></span>
                    </div>
                    <div class="form-radio-item">
                      <input type="radio" name="payment_mode" id="demand">
                      <label for="demand">Demand Draf</label>
                      <span class="check"></span>
                    </div>
                  </div>
                </div>
                <div class="form-input">
                  <label for="medicalinfo">Medical Information (if any)</label>
                  <input type="text" name="medical_info" id="medicalinfo" />
                </div>
                <div class="form-input">
                  <label for="trackinginfo">Previous tracking information (if any)</label>
                  <input type="text" name="tracking_info" id="trackinginfo" />
                </div>
                <div class="form-input">
                  <label for="Dietinfo">Dietary Restictions</label>
                  <input type="text" name="dietary_restrictions" id="Dietinfo" />
                </div>
              </div>
            </div>
            <div class="donate-us">
              <label for="Dietinfo">Fitness level [1 - 10 ]</label>
                  <input type="text" name="fitness_level" id="Dietinfo" />
              
            </div>
            <div class="form-submit">
              <input type="submit" value="Submit" class="submit" id="submit" name="submit" />
              <a href="/Java_Project/">
              <input type="" value="Cancle" class="submit" id="reset" name="reset" />
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  <script>
      document.getElementById("hiddenfield").value = "<%= rcamp %>";
  </script>
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/nouislider/nouislider.min.js"></script>
  <script src="vendor/wnumb/wNumb.js"></script>
  <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
  <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>
  <script src="js/main.js"></script>


  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-23581568-13');
  </script>
</body>
 
</html>
