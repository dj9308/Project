$('#login').on('click', function() {
    $.ajax({
        url: '/rest-auth/login/',
        type: 'POST',
        data: {
            'username': $('#loginUsername').val(),
            'password': $('#loginPassword').val()
        },
        dataType:'json',
        headers: { 'X-CSRFToken': csrftoken },
        success: function(response) {
            sessionStorage.setItem('token', response.token);
            location.replace('/main/');
        }, error: function(request, status, error) {
            console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
        }
    });
})

$('#logout').on('click', function() {
    $.ajax({
        url: '/rest-auth/logout/',
        type: 'POST',
        headers: { 'X-CSRFToken': csrftoken },
        success: function(response) {
            sessionStorage.clear();
            location.replace('/main/');
        }, error: function(request, status, error) {
            console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
        }
    });
})

$('#register').on('click', function() {
    $.ajax({
        url: '/rest-auth/registration/',
        type: 'POST',
        data: {
            'username': $('#registerUsername').val(),
            'password1': $('#registerPassword').val(),
            'password2': $('#repeatPassword').val()
        },
        dataType:'json',
        headers: { 'X-CSRFToken': csrftoken },
        success: function(response) {
            location.replace('/main/login');
        }, error: function(request, status, error) {
            console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
        }
    });
})

