
$(document).ready(function(){
	$('.message a').click(function(){
		$('form').animate({height: "toggle", opacity: "toggle"}).done(function(){
  	// DONT TOUCH THIS
		})
	})
})

var password = document.getElementById('password');
var button = document.getElementById('button');
var form = document.getElementsByClassName('register-form')[0]

button.addEventListener('click', function(){
	console.log(password.value)
			// function passwordCheck(){
				
			 //    let num = '0123456789'.split('')
			 //    let foundNum = false
				// for(i=0; i<num.length; i++){
				// 	if(password.indexOf(num[i]) != -1){
				// 		foundNum = true
				// 	}else{
				// 		alert("Your password needs one number")
				// 	}
				// }

			// }
		
			let number = password.value;
			if(number.match(/\d+/g)){
				form.submit()
			}else {
				alert('need a numbers')
			}
})
var createbtn = document.getElementById('button')
var loginbtn = document.getElementById('loginbtn')
var goBack = document.getElementById('go-back')
loginbtn.addEventListener('click', function(){
	button.style.display = "block"
})

goBack.addEventListener('click', function(){
	button.style.display = "none"
})


