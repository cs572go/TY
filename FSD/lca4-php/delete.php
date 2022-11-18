<?php 

include "conn.php"; 

if (isset($_GET['del'])) {

    $empid = $_GET['del'];

    $sql = "DELETE FROM `employee1` WHERE `empid`='$empid'";

     $result = $conn->query($sql);

     if ($result == TRUE) {

        echo "Record deleted successfully.";
        header("location : datahtml.php");

    }
    else{

        echo "Error:" . $sql . "<br>" . $conn->error;

    }

} 
else{
    header("location: datahtml.php");
}

?>