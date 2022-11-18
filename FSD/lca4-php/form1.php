<?php

include "conn.php";
$empid="";
$firstname="";
$lastname="";
$password="";
if (isset($_POST['submit'])) {
  if(empty($_POST['empid']) || empty($_POST['firstname']) || empty($_POST['lastname']) || empty($_POST['password'] )){
    echo "Please fill all details";
  }
  else{

  

  $empid = $_POST['empid'];

  $firstname = $_POST['firstname'];

  $lastname = $_POST['lastname'];
  
  $password = $_POST['password'];
 
  

  $sql = "INSERT INTO `employee1`(`empid`,`firstname`, `lastname`, `password`) VALUES ('$empid','$firstname','$lastname','$password')";
  $result = "FALSE";
  $result = mysqli_query($conn, $sql);

  if ($result == TRUE) {

    echo "New record created successfully.";
  } else {

    echo "Error: Employee ID already exists...";
  }

  $conn->close();
}
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Employee Registration</title>
  <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body style="margin: 50px;">


  <h2>Employee Data</h2>

  <form action="" method="POST" style="background-color:aliceblue ;">

    <fieldset style="margin-left: 50px;">
      

      Employee ID:<br>

      <input type="text" name="empid">
      <br>

      First name:<br>

      <input type="text" name="firstname">

      <br>

      Last name:<br>

      <input type="text" name="lastname">

      <br>


      Password: <br>

      <input type="password" name="password">

      <br>
      <br>

      
      

      <input class="btn btn-success" type="submit" name="submit" value="submit" style="margin-left: 5px;">
      
    </fieldset>

  </form>
  <br>
  <a class="btn btn-secondary" href="datahtml.php"> <button> Click here to view employee data </button></a>

</body>

</html>