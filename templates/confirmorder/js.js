function data() {
  var email = document.getElementById("email").value;
  var name = document.getElementById("name").value;
  var address = document.getElementById("address").value;
  var number = document.getElementById("number").value;

  if(name === "" || address === "" || number === "" || email === "") {
    document.getElementById("errorMessage").innerHTML = "*Please add your details to place order";
  }

  if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email) == false) {
   let mail =  document.getElementById("e");
   mail.style.color = "red";
   mail.innerHTML = "*You have entered an invalid email address!";
  }


  if(number.length != 8) {
    let phone = document.getElementById("n");
    phone.style.color = "red";
    phone.innerHTML = "*Phone number is not valid";
  }

  else{
    window.localStorage.clear();
    window.location.href="thankyou.html";
  }
}


document.getElementById("checkBtn").addEventListener('click', ()=>{
      
  data();
    
});