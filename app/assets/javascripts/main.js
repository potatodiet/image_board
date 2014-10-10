$(function(){
  document.onkeyup = function(e) {
    e = e || window.event

    currentPage = document.getElementsByClassName('pagination pagination')[0].getElementsByClassName('current')[0];

    if (e.keyCode === 37) { // Left arrow key
      currentPage.previousSibling.previousSibling.firstChild.click();
    } else if (e.keyCode === 39) { // Right arrow key
      currentPage.nextSibling.nextSibling.firstChild.click();
    }
  }
});
