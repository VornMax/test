document.addEventListener("turbolinks:load", () =>  {
  document.querySelectorAll(".comment-reply").forEach(function(el) {
    el.addEventListener("click", function(e) {
      const theId = e.target.dataset.commentId;

      content = document.getElementById(`comment-${theId}`);

      if (content.classList.contains("hidden")) {
        e.target.textContent = "-";
      } else {
        e.target.textContent = "Reply";
      }
      content.classList.toggle("hidden");
    })
  })

  document.querySelectorAll(".comment-edit").forEach(function(elem) {
    elem.addEventListener("click", function(el) {
      
      const theId = el.target.dataset.commentEditId;

      content = document.getElementById(`comment-edit-${theId}`);
      

      if (content.classList.contains("hidden-edit")) {
        el.target.textContent = "-";
      } else {
        el.target.textContent = "Edit";
      }
      content.classList.toggle("hidden-edit");
    })
  })
})
