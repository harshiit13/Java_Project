<%-- 
    Document   : create_camp
    Created on : 5 Apr, 2024, 10:19:10 PM
    Author     : harsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
  <head>
      <style>
          body{
              margin-left: 25px;          }
      </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create Camp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
      
                  <% 
               String username = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        // Iterate through cookies to find the username cookie
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                // Found the username cookie, get its value
                username = cookie.getValue();
                break;
            }
        }
    }
            %>
      
      <div class="container mt-5">
    <div class="row">
        <div class="col">
            <div class="text-center mb-4">
                <h1 class="display-4">Welcome to Camp Registration</h1>
                <p class="lead">Please fill out the form below to register a camp.</p>
            </div>
        </div>
    </div>
          
          <hr>
      
   
      <form  enctype="multipart/form-data" action="/Java_Project/camp_ad" method="post">
          
          
          <input type="hidden" name ="organization" id="hiddenfield" value="<%= username %>">
        <div class="row m-5">
              <div class="col-3">
                  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Name of Camp</label>
    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
 
    
  </div>
              </div>
                  
    <div class="col-3">
        
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Date of camp</label>
    <input type="text" name="date" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    
  </div>

  

</div>
              
              <div class="col-3">
                    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Duration of camp</label>
    <input name="duration" type="number" class="form-control" id="exampleInputPassword1">
  </div>
              </div>
              
              <div class="col-3">
                    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Pickup Location </label>
    <input name="pickup" type="text" class="form-control" id="exampleInputPassword1">
  </div>
              </div>


</div>
          
          <hr>
          
          
          <div class="row m-5">
              <div class="col-3">
                          <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Camp Location</label>
    <input type="text" name="location" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    
  </div>
              </div>
                  
    <div class="col-3">
        
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Difficulty Level of Camp</label>
    <input type="text" name="difficulty" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    
  </div>

  

</div>
              
              <div class="col-3">
                    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Minimum Age </label>
    <input name="age" type="number" class="form-control" id="exampleInputPassword1">
  </div>
              </div>
              
              <div class="col-3">
                    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Price to participate in camp</label>
    <input name="price" type="number" class="form-control" id="exampleInputPassword1">
  </div>
              </div>


</div>
          <hr>
          
          <div class="row m-5">
              <div class="col-3">
                          <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Base Camp </label>
    <input type="text" name="base_camp" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    
  </div>
              </div>
                  
    <div class="col-3">
        
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Total Capacity of prople</label>
    <input type="number" name="capacity" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

  </div>


        
  

</div>
              
              <div class="col-3">
                    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Altitude of trek </label>
    <input name="altitude" type="number" class="form-control" id="exampleInputPassword1">
  </div>
              </div>
              
              <div class="col-3">
                    <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Select Photo </label>
    <input name="photo" type="file" class="form-control" id="exampleInputPassword1">
  </div>
              </div>


</div>
          <hr>
          <div class="row m-5">
              <div class="col-4">
          </div>
              <div class="col-4">
                               <div class="mb-3">
    <label for="description" class="form-label">Description of Camp</label>
         <textarea class="form-control" id="description" name="description" rows="5"></textarea>
  </div>
          </div>
              <div class="col-4">
                 
          </div>
               <button class="btn btn-primary" type="submit">Submit</button>
              </div>
          
          
          
          
          
          
</form>
<script>
      document.getElementById("hiddenfield").value = "<%= username %>";
  </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
