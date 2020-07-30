document.getElementById("toastr").addEventListener("click", function() {
  // Swal.fire("Good job!", "You clicked the button!", "success");
  const Toast = Swal.mixin({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 8000,
    timerProgressBar: true,
    onOpen: toast => {
      toast.addEventListener("mouseenter", Swal.stopTimer);
      toast.addEventListener("mouseleave", Swal.resumeTimer);
    }
  });

  Toast.fire({
    icon: "success",
    title: "Signed in successfully"
  });
});
