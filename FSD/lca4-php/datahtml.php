<?php

include "conn.php";

$sql = "SELECT * FROM employee1";

$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html>

<head>

    <title>View Data</title>
    <link rel="stylesheet" href="style.css">
   <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

</head>

<body>
    
    <div class="container">
    <a class="btn btn-primary" href="form1.php"><button>Add Employee </button> </a>
    <!-- <button  class="btn btn-primary" href = "form1.php">Add Employee</button> -->

        <h1>Employee Data</h1>

        <table class="table">

            <thead>

                <tr>

                    <th>EMP ID</th>

                    <th>First Name</th>

                    <th>Last Name</th>

                    <th>Password</th>

                    <th>Action</th>

                </tr>

            </thead>

            <tbody>

                <?php

                if ($result->num_rows > 0) {

                    while ($row = $result->fetch_assoc()) {

                ?>

                        <tr>

                            <td><?php echo $row['empid']; ?></td>

                            <td><?php echo $row['firstname']; ?></td>

                            <td><?php echo $row['lastname']; ?></td>

                            <td><?php echo $row['password']; ?></td>

                            <td><a class="btn btn-info" href="update.php?empid=<?php echo $row['empid']; ?>"><button type="button" class="btn btn-primary">Edit</button></a>&nbsp;&nbsp;&nbsp;<a class="btn btn-danger" href="delete.php?del=<?php echo $row['empid']; ?>"><button>Delete</button></a></td>

                        </tr>

                <?php       }
                }

                ?>

            </tbody>

        </table>

    </div>

</body>

</html>