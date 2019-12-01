    let getToken = $('#getToken').val();
    $('#reqGenerate').on('click', function() {
        if(getToken != null) {
            $.ajax({
              url: "/api/token/",
              type: "POST",
              data: {
                username: $("#username").val(),
                password: $("#password").val()
              },
              dataType: "json",
              headers: { "X-CSRFToken": csrftoken, 'csrftoken': csrftoken },
              success: function(response) {
                $("#getToken").val(response.token);
              }, error: function(request, status, error) {
                console.log("code = " + request.status + " message = " + request.responseText + " error = " + error);
              }
            });
        } else {
            $('#getToken').val('토큰값이 필요합니다. 회원가입 및 로그인을 해주세요.');
        }
    })

    $('#reqVerify').on('click', function() {
        getToken = $('#getToken').val();
        if(getToken != null) {
            $.ajax({
                url: "/api/token/verify/",
                type: 'POST',
                data: {'token': getToken },
                dataType:'json',
                headers: { "X-CSRFToken": csrftoken, 'csrftoken': csrftoken },
                success: function(response) {
                    $('#resVerify').val('사용할 수 있는 검증된 토큰입니다.');
                }, error: function(request, status, error) {
                    $('#resVerify').val('검증되지 않거나 유효기간이 지난 토큰입니다. 발급 및 갱신이 필요합니다.');
                    console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
                }
            });
        } else {
            $('#resVerify').val('토큰값이 필요합니다. 회원가입 및 로그인을 해주세요.');
        }
    })

    $('#reqRefresh').on('click', function() {
        if(getToken != null) {
            $.ajax({
                url: "/api/token/refresh/",
                type: 'POST',
                data: {'token': getToken },
                dataType:'json',
                headers: { "X-CSRFToken": csrftoken, 'csrftoken': csrftoken },
                success: function(response) {
                    $('#getRetoken').val(response.token);
                }, error: function(request, status, error) {
                    console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
                }
            });
        } else {
            $('#getRetoken').val('기존 토큰값이 필요합니다. 회원가입 및 로그인을 해주세요.');
        }
    })

    $('#reqData').on('click', function() {
        if($('#getReToken').val() == '') {
            getToken = $('#getToken').val();
        }
        if(getToken != null) {
            $.ajax({
                url: "/api/data/",
                type: 'GET',
                dataType:'json',
                headers: {
                    'Authorization': 'jwt ' + getToken,
                },
                success: function(response) {
                    let data = null;
                    $.each(response, function() {
                        data = this.fields;
                        $('#dataTable').append('<tr>');
                        $('#dataTable').append('<td>' + this.pk + '</td>');
                        $('#dataTable').append('<td>' + data.name + '</td>');
                        $('#dataTable').append('<td>' + data.symptom + '</td>');
                        $('#dataTable').append('<td>' + data.diagnosis + '</td>');
                        $('#dataTable').append('</tr>');
                    });
                    $('#collapseCardExample').collapse();
                    $('#resData').val('데이터 요청에 성공하였습니다. 아래 응답을 확인해주세요.');
                }, error: function(request, status, error) {
                    $('#resData').val('데이터 요청이 실패하였습니다. 토큰을 재확인해주세요.');
                    console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
                }
            });
        } else {
            $('#resData').val('토큰값이 필요합니다. 회원가입 및 로그인을 해주세요.');
        }
    })