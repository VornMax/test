window.onload = function() {
  document.querySelectorAll(".btn").forEach(function(el) {
    el.addEventListener("click", function(e) {
      const theId = e.target.dataset.commentId;

      content = document.getElementById(`comment-${theId}`);
      // console.log(content.classList);

      if (content.classList.contains("hidden")) {
        e.target.textContent = "-";
      } else {
        e.target.textContent = "Reply";
      }
      content.classList.toggle("hidden");
    })
  })
}