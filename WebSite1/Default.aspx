<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>News</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
</head>
<body style="background-color:#eeeeee;color:#252832;font-family: 'Oswald', sans-serif;">
    <div class="col-md-4 col-md-offset-4 container">
        <hr /><code id="datetime"></code><h1><b>DG</b> News<small> - Derek Gray</small></h1><hr />
        <div class="form-group" style="padding-bottom: 50px;">
            <div class="col-md-8">
                 <input class="form-control" type="text" id="searchBox" />
            </div>
            <div class="col-md-4">
                 <button type="button" id="searchGo" class="btn btn-inverse dropdown-toggle btn-block">Search</button>
            </div>
        </div>
        
        <form id="form1" runat="server">
            <div>
                <div class="" id="txter"></div>
            </div>
        </form>
    </div>
</body>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script>
    $('#datetime').html(new Date($.now()));
    var test = $('#testin').val();
    $.ajax({
        type: "POST",
        url: "WebService.asmx/HelloWorld",
        data: "{ test: '" + test + "' }",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (result) {
            //success
            var myResult = jQuery.parseJSON(result.d);
            var res = "";
            $.each(myResult, function (key, val) {
                res += '<h1>' + val.Title + '</h1><br/><img src="' + val.Image + '"/>' + "<h2>" + val.Summary + "</h2>" + "<p>" + val.Description + "</p><br/><hr><br/>";
            });
            $('#txter').html(res);

            //console.log(myResult);
            // $('#txter').html(result.d);
        },
        error: function (request, status, error) {
            //error
            $('#txter').html("fail");
        }
    });
    $('#searchGo').click(function () {
        var searchText = $('#searchBox').val();
        $.ajax({
            type: "POST",
            url: "WebService.asmx/SearchEntry",
            data: "{ query: '" + searchText + "' }",
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
                //success
                var myResult = jQuery.parseJSON(result.d);
                var res = "";
                $.each(myResult, function (key, val) {
                    res += '<h1>' + val.Title + '</h1><br/><img src="' + val.Image + '"/>' + "<h2>" + val.Summary + "</h2>" + "<p>" + val.Description + "</p><br/><hr><br/>";
                });


                if (res == "") {
                    res = "Error: No entries found. Please try another search term."
                }

                $('#txter').html(res);

                //console.log(myResult);
                // $('#txter').html(result.d);
            },
            error: function (request, status, error) {
                //error
                $('#txter').html("fail");
            }
        });
    })
</script>
</html>
