/* Set the width of the side navigation to 250px */
function openNav() {
  console.log('openNav')
    // document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("mySidenav").style.transform = "translateX(100%)";
  }
  
  /* Set the width of the side navigation to 0 */
  function closeNav() {
  console.log('closeNav')
    // document.getElementById("mySidenav").style.width = "0";
    document.getElementById("mySidenav").style.transform = "translateX(-100%)";
  }