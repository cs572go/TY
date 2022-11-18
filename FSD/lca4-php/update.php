<?php

include "conn.php";

if (isset($_POST['update'])) {

    $emp_id = $_POST['empid'];
    
    $firstname = $_POST['firstname'];

    $lastname = $_POST['lastname'];

    $password = $_POST['password'];

    $sql = "UPDATE `employee1` SET `firstname`='$firstname',`lastname`='$lastname',`password`='$password' WHERE `empid`='$emp_id'";

    $result = $conn->query($sql);

    if ($result == TRUE) {

        echo "Record updated successfully.";
    } else {

        echo "Error:" . $sql . "<br>" . $conn->error;
    }
}

if (isset($_GET['empid'])) {

    $emp_id = $_GET['empid'];

    $sql = "SELECT * FROM `employee1` WHERE `empid`='$emp_id'";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {

        while ($row = $result->fetch_assoc()) {

            $emp_id = $row['empid'];

            $firstname = $row['firstname'];

            $lastname = $row['lastname'];

            $password  = $row['password'];
        }

?>




        <!DOCTYPE html>
        <html>

        <body>
            <h2>Employee Update Form</h2>

            <form action="" method="post">

                <fieldset>

                    First name:<br>

                    <input type="text" name="firstname" value="<?php echo $firstname; ?>">

                    <input type="hidden" name="empid" value="<?php echo $emp_id; ?>">

                    <br>

                    Last name:<br>

                    <input type="text" name="lastname" value="<?php echo $lastname; ?>">

                    <br>



                    Password:<br>

                    <input type="password" name="password" value="<?php echo $password; ?>">

                    <br>



                    <input type="submit" value="update" name="update">

                </fieldset>

            </form>
            <a class="btn btn-primary" href="datahtml.php">View Employee data</a>

        </body>

        </html>



<?php

    } else {

        header('Location: datahtml.php');
    }
}

?>