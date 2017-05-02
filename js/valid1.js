function chkusn1(){
	var dom=document.getElementById("USN1");

	var usn=dom.value;
	var ok=usn.search(/^[1-4][A-Z]{2}\d{2}[A-Z]{2}\d{3}$/);

	if(ok == 0)
	{
		return true;
	}
	else
	{	
		alert("incorrect USN format\n");
		dom.focus();
		dom.select();
		return false;
	}
}

function chksem1(){
	var dom=document.getElementById("Sem1");

	var usn=dom.value;
	var ok=usn.search(/^[1-8]{1}$/);

	if(ok == 0)
	{
		return true;
	}
	else
	{	
		alert("incorrect Semester\n");
		dom.focus();
		dom.select();
		return false;
	}
}