
function validate() {  
    var fname = document.reg_form.fname;
    var lname = document.reg_form.lname;
    var address = document.reg_form.address; 
    var zip = document.reg_form.zip;       
    var email = document.reg_form.email;    
    var mobile = document.reg_form.mobile;    
  
    if (fname.value.length <= 0) {    
        alert("First Name is required");    
        fname.focus();    
        return false;    
    } 

    if (lname.value.length <= 0) {    
        alert("Last Name is required");    
        lname.focus();    
        return false;    
    } 

    if (address.value.length <= 0) {    
        alert("Address is required");    
        address.focus();    
        return false;    
    }  
    
    if (zip.value.length <= 0) {    
        alert("Zip code is required");    
        zip.focus();    
        return false;    
    }
        
    if (email.value.length <= 0) {    
        alert("Email Id is required");    
        email.focus();    
        return false;    
    }    
    if (mobile.value.length <= 0) {    
        alert("Mobile number is required");    
        mobile.focus();    
        return false;    
    }        
    return false;    
}      


