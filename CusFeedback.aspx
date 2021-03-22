<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CusFeedback.aspx.cs" Inherits="Enviro.CusFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    
        <header>
        <style>

             .contentCustomer {
                padding: 10px;
                padding-top: 50px;
            }

        

        </style>
    </header>







    
    <div class="content-wrapper contentCustomer">

        <%--Start of Main Page --%>
        <form id="mainform" novalidate method="post">

            <section class="content ">

                <div class="row">

                    <div class="col-md-12">

                        <br />
                        <br />

                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Customer Feed Back</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body">

     <div class="card-body p-0">
                <table id="tableAns" class="table table-striped">
                  <thead>
                    <tr>
                      <th>QUESTION</th>
                      <th>YES  &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160;  NO</th>
                    </tr>
                  </thead>
                  <tbody>
             
                  </tbody>
                </table>
              </div>



      <hr />
             
                                <div class="card-footer">
                                    <div class="col-12">
                                        <input id="btnSubmit" type="submit" value="Submit" class="btn btn-success ">
                                        <input id="btnCancel" type="reset" value="Cancel" class="btn btn-danger float-right"> 
                                    </div>
                                </div>

                            </div>    


                        </div>

                    </div>

                </div>
            </section>

        </form>

    </div>
<%--   End of my Main Page --%>

    <script>


        $(document).ready(function () {
            loadquestions();
        });



        function loadquestions() {

            $("#btnCancel").removeAttr('disabled');
            $("#btnSubmit").removeAttr('disabled');

            $.ajax({
                type: 'POST',
                url: 'CusFeedback.aspx/GetQuestions',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    $("#tableAns tbody").empty();

                    var myData = JSON.parse(response.d)
                    if (myData == "") {
                        return;
                    }

                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {

                        tr.push('<tr>')
                        tr.push("<td>" + myData[i].question + "</td>");
                        tr.push("<td><fieldset id=\"" + myData[i].id + "\"><input type=\"radio\" id=\"radio1\" name=\"group" + myData[i].id + "\ value=\"1\">  &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; <input type=\"radio\" id=\"radio2\" name=\"group" + myData[i].id + "\ value=\"2\"></fieldset></td > ");


                        //tr.push("<td><div class=\"icheck-primary d-inline\" > <input type=\"radio\" id=\"radio1\" name=\"r1\" value=\"1\"><label for=\"radio1\" onclick=\"SaveQuestionsfunc('" + myData[i]["id"] + "')\"></label></div></td > ");
                        //tr.push("<td><div class=\"icheck-primary d-inline\" > <input type=\"radio\" id=\"radio2\" name=\"r1\" value=\"2\"><label for=\"radio2\" onclick=\"SaveQuestionsfunc('" + myData[i]["id"] + "')\"></label></div></td > ");
                        tr.push('</tr>');
                    }

                    $("#tableAns tbody").empty();
                    $('#tableAns').append($(tr.join('')));

                },
                error: function (error) {

                    console.log(error);

                }
            });

        }





                  <%-- Save Answers --%>


        $(function () {

            $("#btnSubmit").click(function (e) {

            e.preventDefault();

            $("#btnSubmit").removeAttr('disabled');

                    $.ajax({
                        type: 'POST',
                        url: 'CusFeedback.aspx/SaveAnswers',
                        dataType: 'json',
                        data: '{"quesid":"' + id + '","quotationdate":"' + $("#quatationDate").val() + '"   }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var myData = JSON.parse(response.d)

                            console.log(myData);

                            swal("Success", "FeedBack Has Been Saved Successfully!", "success");

                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });


        });









    </script>

</asp:Content>
