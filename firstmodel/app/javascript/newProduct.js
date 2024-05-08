//Universal Functions

//This changes the navbar link to a given id
function changeNavSelect(id) {
  rm=document.querySelector(".active");
  rm.classList.remove("active");
  add=document.getElementById(id);
  add.classList.add("active");
}
