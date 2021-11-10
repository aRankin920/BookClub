
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

console.log("inside of js file");
var count = 0;
function counter(t) {
    count++;
    t.innerHTML = count;
    document.getElementById("countValue").innerHTML = count;
}

var count = 0;
function counter(t) {
    count++;
    t.innerHTML = count;
    document.getElementById("countValue").innerHTML = count;
}


var i = 0;
function buttonClick(t) {
    i+=1;
    t.innerHTML = i + " Likes";
}










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