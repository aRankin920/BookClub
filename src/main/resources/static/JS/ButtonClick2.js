var count = 0;
function increaseCtr(t) {
	console.log("inside of increaseCtr file");
    count++;
    t.innerHTML = "count " +count ;
    document.getElementById("#countValue").innerHTML = count;
}

var count = 0;
function decreaseCtr(t) {
	console.log("inside of decreaseCtr file");
	count--;
	if (count <= 0){count = 0; }
    
    t.innerHTML = "count " +count ;
    document.getElementById("countValue1").innerHTML = count;
    document.getElementById("#countValue").innerHTML = count;
     
  /*  [... document.querySelectorAll(".countValue3")].map(i => i.value = '');*/

}

function rotate(arrList){
	console.log("inside of rotate ");
	
	return arrList = rotateArr(arrList, 4);
	
}

/**** rotateArr()    *****/
function rotateArr(arrList, moveBy) {


let max = arrList.length -1;
if (moveBy > 0) {

    for (var i = 0; i < moveBy; i++) {
        var temp = arrList[max];
        for (var j = max - 1; j >= 0; j--) {
            arrList[j+1] = arrList[j];
        }
        arrList[0] = temp; 
    }
} else {

    for (var i = 0; i < moveBy; i++) {
        var temp = arrList[0];
        for (var k = 1; k < max+1; k++) {
            arrList[k-1] = arrList[k];
        }
        arrList[max] = temp; 
    }
    return arrList;
}//rotateArr

/*
function toggle(t) {
    if (t.innerHTML == "Login") {
        t.innerHTML = "Logout";
    } else {
        t.innerHTML = "Login";
    }
}

function change_text(){
    document.getElementById().innerHTML = "Sign In";
}

function remove(t) {
    t.parentNode.removeChild(t);
}




var i = 0;
function buttonClick(t) {
    i+=1;
    t.innerHTML = i + " Likes";
}



*/






/*




function remove(t) {
    div.parentNode.removeChild(div);

var up = document.getElementById('GFG_UP');
var down = document.getElementById('GFG_DOWN');
var div = document.getElementById('GFG_DIV');
up.innerHTML = "Click on button to remove the element.";
  

    div.parentNode.removeChild(div);
    down.innerHTML = "Element is removed."; 
}


<p id="demo">I am sample paragraph.</p>
<button onclick="change_text()">Click me</button>

<script>

function change_text(){
    document.getElementById("demo").innerHTML = "Sign In";
}
</script>
------------------------------------------------------
<p id="demo">I am sample paragraph.</p>


<div class="ISHide" onclick="toggle(this)"><a href="#" >Hide Products</a></div>
<script type="text/javascript">
    function toggle (t) {
    if (t.childNodes[0].innerHTML == "Hide Products") {
        t.childNodes[0].innerHTML = "Show Products";
    } else {
        t.childNodes[0].innerHTML = "Hide Products";
    }
    }
    </script>


                        <p id="demo">I am sample paragraph.</p>
                        <button onclick="change_text()">Click me</button>

                        <script>
                            function change_text() {
                                document.getElementById("demo").innerHTML = "Sign In";
                            }
                        </script>

    */