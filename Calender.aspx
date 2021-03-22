<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calender.aspx.cs" Inherits="Enviro.Calender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <header>

          <%--  Calender--%>

       <link href="Styles/fullcalendar.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/fullcalendar.js" type="text/javascript"></script>

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
                                <h3 class="card-title">Service Schedule Calender</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body">



                                <div id="fullcal">
                                </div>

                            </div>


                        </div>

                    </div>

                </div>
            </section>

        </form>

    </div>
<%--   End of my Main Page --%>
    
    <script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            data: "{}",
            url: "Calender.aspx/GetEvents",
            dataType: "json",
            success: function (data) {
                $('div[id*=fullcal]').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        //right: 'month,agendaWeek,agendaDay'
                        right: 'month'
                    },
                    editable: true,
                    events: $.map(data.d, function (item, i) {
                        var event = new Object();
                        event.id = item.EventID;
                        event.start = new Date(item.StartDate);
                        event.end = new Date(item.EndDate);
                        event.title = item.EventName;
                        event.url = item.Url;
                        event.ImageType = item.ImageType;
                        return event;
                    }),
                    eventRender: function (event, eventElement) {
                        if (event.ImageType) {
                            if (eventElement.find('span.fc-event-time').length) {
                                eventElement.find('span.fc-event-time').before($(GetImage(event.ImageType)));
                            }
                            else {
                                eventElement.find('span.fc-event-title').before($(GetImage(event.ImageType)));
                            }
                        }
                    },
                    loading: function (bool) {
                        if (bool) $('#loading').show();
                        else $('#loading').hide();
                    }
                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown)
            { debugger; }
        }); $('#loading').hide(); $('div[id*=fullcal]').show();
        });


    function GetImage(type) {
        if (type == 0) {
            return "<br/><img src = 'Styles/Images/attendance.png' style='width:24px;height:24px'/><br/>"
        }
        else if (type == 1) {
            return "<br/><img src = 'Styles/Images/not_available.png' style='width:24px;height:24px'/><br/>"
        }
        else
            return "<br/><img src = 'Styles/Images/not_available.png' style='width:24px;height:24px'/><br/>"
        }


</script>







</asp:Content>
