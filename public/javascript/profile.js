
var passcheck = document.getElementById('passcheck')
var password1 = document.getElementById('password1');
var updateP = document.getElementById('update_pword')
passcheck.addEventListener('click', function(){
	console.log(password1.value)

		
			let number1 = password1.value;
			if(number1.match(/\d+/g)){
				updateP.submit()
			}else {
				alert('need a numbers')
			}
})