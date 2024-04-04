var result=document.getElementById("result");
buttons=document.querySelectorAll("button")

for (var button of buttons) {
    button.addEventListener("click", function (e) {
        var value=e.target.getAttribute("id");
        console.log(value);
        if (!(value == "=" || value == "C")) { 
            result.innerHTML+=value;            
        }
    });
}
