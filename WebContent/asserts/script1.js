function validateForm() {
    var regno = document.getElementById("regno").value;
    var fullname = document.getElementById("fullname").value;
    var date = document.getElementById("date").value;

    if (regno === '' || fullname === '' || date === '') {
        return false; // Prevent form submission
    } else {
        return true; // Allow form submission
    }
}
