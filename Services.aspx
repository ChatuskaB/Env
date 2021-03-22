<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Enviro.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    
        <header>
        <style>

             .contentCustomer {
                padding: 10px;
                padding-top: 50px;
            }

            .contentInq {
                padding: 10px;
                padding-top: 50px;
            }*/

            .customerMainActive {
                background-color: #007bff;
                color: #fff;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1059; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-left: 5em;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto; /* 15% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

                .close:hover,
                .close:focus {
                    color: black;
                    text-decoration: none;
                    cursor: pointer;
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
                                <h3 class="card-title">Service Schedule</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body">


                                <div class="form-group">
                                    <label for="inputName">Customer Name</label>
                                    <span>* </span>
                                    <select required id="selectcustomerid" class="form-control custom-select">
                                        <option selected="selected" value="">Select Customer Name</option>
                                    </select>
                                </div>


                                 <div class="form-group">
                                    <label for="LabelServiceSchedueid">Service Schedule Ref No.</label>
                                    <span>* </span>
                                    <label id="serviceschedulerefno" class="form-control">Random Service Service Schedule Ref No. will appier Here</label>
                                </div>

                                <div class="form-group">
                                    <label for="LabelPlant">Plant Name</label>
                                    <span>* </span>
                                    <select required id="SelectServiceScheduleplant" class="form-control custom-select">
                                        <option selected value="">-Select Plant-</option>
                                        <option value="1">Plant 1</option>
                                        <option value="2">Plant 2</option>
                                        <option value="3">Plant 3</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="LabelType">Service Type</label>
                                    <span>* </span>
                                    <select required id="SelectServiceScheduletype" class="form-control custom-select">
                                        <option selected value="">-Select Type-</option>
                                        <option value="OneTimeService">One Time Service</option>
                                        <option value="MonthlyService">Monthly Service</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <span>* </span>
                                    <textarea required id="ServiceScheduledescription" class="form-control" rows="5" placeholder="Write Description"></textarea>
                                </div>

                                <div class="card-footer">
                                    <div class="col-12">
                                        <input id="btnSubmit" type="submit" value="Submit" class="btn btn-success ">
                                        <input id="btnUpdate" type="button" value="Update" class="btn btn-warning">
                                        <input id="btnCancel" type="reset" value="Cancel" class="btn btn-danger float-right"> 
                                    </div>
                                </div>

                            </div>


                        </div>

                    </div>

                </div>
            </section>

        </form>


           <%-- Start of Main Services Table --%>

    <div>
        <form>

            <br />
            <section>

                <div class="card-body hiddenTable" id="mylist" style="background-color: #fff;">

                    <input type="hidden" id="oldVehno" value="0" />

                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Services Records Details</h3>
                        </div>

                        <div class="card">
                            <div class="card-body">

                                <div class="search-container">
                                    <input  id="searchtype" type="text" placeholder="Search User Name.." name="search">
                                    <button id="searchbtn" type="button"><i class="fa fa-search"></i></button>
                                </div>
                                <br />
                                <table id="ServiceSchedulelist" class="table table-bordered table-hover" style="display: inline-table">
                                    <thead>
                                        <tr>
                                            <th>Customer Name</th>
                                            <th>Plant Name</th>
                                            <th>Service Type</th>
                                            <th>Description</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                              <th>Add Service Details.</th>
                                        </tr>
                                    </thead>


                                    <tbody></tbody>


                                    <tfoot>
                                        <tr>
                                            <th>Customer Name</th>
                                            <th>Plant Name</th>
                                            <th>Service Type</th>
                                            <th>Description</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                          <th>Add Service Details.</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>

                        </div>

                    </div>

                </div>

            </section>
        </form>
    </div>
   <%-- End of Main Services Table --%>
    </div>
<%--   End of my Main Page --%>
    


        <%--Start of Delete Service Details Model--%>

    <div id="myServiceScheduleDeleteModal" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclose" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                <br />
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">

                            <div class="card-header">
                                <h3 class="card-title">Delete - Details</h3>
                            </div>

                            <div class="card-body">
                                <div id="frmSerDel" data-parsley-validate="" class="form-horizontal form-label-left">
                                    <input type="hidden" id="txtSerDel" />


                                    <div class="form-group ">
                                        <label for="selectcustomerid">
                                            Customer Name <span class="required">:</span>
                                        </label>
                                        <label id="selectcustomerpopup" class="form-control"></label>
                                    </div>

                                  

                                      <div class="form-group ">
                                        <label for="selectplant">
                                            Plant <span class="required">:</span>
                                        </label>
                                        <label id="selectplantpopup" class="form-control"></label>
                                    </div>

                                      <div class="form-group ">
                                        <label for="selectdescription">
                                            Service Type <span class="required">:</span>
                                        </label>
                                        <label id="servicetypepopup" class="form-control"></label>
                                    </div>

                                      <div class="form-group ">
                                        <label for="selectdescription">
                                            Description <span class="required">:</span>
                                        </label>
                                        <label id="selectdescription" class="form-control"></label>
                                    </div>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btnServiceScheduleDeleteYes" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;
                    <button type="button" class="btn btn-danger closemodelClose">Cancel</button>
                </div>

            </section>
        </div>

    </div>
    <%--End of Delete Service Details Model--%>











    <%--Start of Service  Details Model--%>
    <div id="ModalServiceScheduleDetails" class="modal">
        <div class="modal-content">
            <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclose" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>
            <br />
            <br />
            <form id="ServiceSheduleDetailsForm">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Service Schedule Details</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body">

                                <input type="hidden" id="txtTransIdSiteVisit" />

                                <div class="form-group">
                                    <label for="LabelCustomeridServiceScheduleDetails">Customer Name</label>
                                    <span>* </span>
                                    <label id="customeridServiceSheduleDetails" class="form-control"></label>
                                </div>


                                <div class="form-group">
                                    <label for="LabelServiceScheduleDetailsid">Service Schedule Ref No.</label>
                                    <span>* </span>
                                    <label id="ServiceShedulefnovisit" class="form-control"></label>
                                </div>

                                <div class="form-group">
                                    <label for="ServiceSchedulerefnolbl">Service Schedule Detail Ref:No.</label>
                                    <label id="ServiceSchedulerefno" class="form-control">Random Service Schedule Detail Ref:No. will appier Here </label>
                                </div>

                                <div class="form-group">
                                    <label for="LabelScheduleDate">Schedule Date</label>
                                    <span>* </span>
                                    <input required type="date" id="ScheduleDate" class="form-control">
                                </div>

                                 <div class="form-group">
                                    <label for="LabelStatus">Status</label>
                                    <span>* </span>
                                    <select required id="ServiceScheduleDetailStatus" class="form-control custom-select">
                                        <option selected value="">-Select Status-</option>
                                        <option value="1">Done</option>
                                        <option value="2">Pending</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="LabelDes">Description</label>
                                    <span>* </span>
                                    <textarea  id="description" class="form-control" rows="4"></textarea>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <input id="btnServiceScheduleDetailSave" type="submit" value="Save" class="btn btn-success">
                    &nbsp;&nbsp;
                    <input id="btnUpdateServiceScheduleDetail" type="button" value="Update" class="btn btn-warning">
                    &nbsp;&nbsp;
                    <button id="btnCancelServiceScheduleDetail" class="btn btn-danger closemodelSitevisit" type="reset">Cancel</button>
                </div>

            </form>

            <br />

            <%--Start of  Service Shedule Details Model Table--%>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Site Visit Details</h3>
                </div>

                <br />

                <div class="card-body">
                    <table id="example6" class="table table-bordered table-hover">

                        <thead>
                            <tr>
                                <th>Customer Name</th>
                                <th>Schedule Date</th>
                                <th>Status</th>
                                <th>Description</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>

                        <tbody></tbody>

                        <thead>
                            <tr>
                                <th>Customer Name</th>
                                <th>Schedule Date</th>
                                <th>Status</th>
                                <th>Description</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>


                    </table>
                </div>

            </div>

         <%--   End of Service Shedule Details Table--%>
        </div>

    </div>
  <%--  End of Service Shedule Details Model--%>



    


        <%--Start of Delete Service Details Model--%>

    <div id="myDeleteServiceDetailsModal" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclose" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                <br />
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">

                            <div class="card-header">
                                <h3 class="card-title">Delete - Details</h3>
                            </div>

                            <div class="card-body">
                                <div id="frmSeasons" data-parsley-validate="" class="form-horizontal form-label-left">
                                    <input type="hidden" id="txtTransId" />


                                    <div class="form-group ">
                                        <label for="selectcustomerid">
                                            Customer Name <span class="required">:</span>
                                        </label>
                                        <label id="selectcustomeridpopup" class="form-control"></label>
                                    </div>

                                      <div class="form-group ">
                                        <label for="selectstStrDetaatuslab">
                                            Status <span class="required">:</span>
                                        </label>
                                        <label id="selectSerDetastatus" class="form-control"></label>
                                    </div>



                                    <div class="form-group ">
                                        <label for="selectdescription">
                                            Description <span class="required">:</span>
                                        </label>
                                        <label id="selectdescriptionpopup" class="form-control"></label>
                                    </div>

                                     <div class="form-group ">
                                        <label for="selectdate">
                                            Schedule Date <span class="required">:</span>
                                        </label>
                                            <label id="selectdatepopup" class="form-control"></label>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btnServiceDetailsDeleteYes" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;
                    <button type="button" class="btn btn-danger closemodelClose">Cancel</button>
                </div>

            </section>
        </div>

    </div>
    <%--End of Delete Service Details Model--%>



    <script>

        var ID = 0;
        var delID = 0;
        var servicedetailID = 0;
        var servisedetailsIDloadtable = 0;
        var servicedetailsIDedit = 0;
        var delServiceDetailsID = 0;



        $(function () {

            $('#ServiceScheduleTable').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });

        $(document).ready(function () {
            loadgrid();
            loadcusname();

            var mstdtlid = getUrlVars()["id"];

            if (mstdtlid != "") {

                ServiceDetailpopupfunc(mstdtlid);

            }

        });


        function loadcusname() {
            var selectcustomerid = $('#selectcustomerid');
            $.ajax({
                type: 'POST',
                url: 'Services.aspx/GetCustomerNames',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $.each(myData, function () {
                        selectcustomerid.append($("<option />").val(this.id).text(this.name));
                    });

                },
                error: function (error) {
                    console.log(error);
                }
            });

        }




 
                  <%-- Save Service Schedule --%>

        $("#mainform").on('submit', function (e) {
            e.preventDefault();

            $("#selectcustomerid").attr('contenteditable', false);
            $("#SelectServiceScheduleplant").attr('contenteditable', false);
            $("#SelectServiceScheduletype").attr('contenteditable', false);
            $("#ServiceScheduledescription").attr('contenteditable', false);

            $("#btnSubmit").removeAttr('disabled');
            $("#btnCancel").removeAttr('disabled');
            $("#btnUpdate").attr('disabled', 'disabled');
  
            $.ajax({
                type: 'POST',
                url: 'Services.aspx/SaveServiceSchedule',
                dataType: 'json',
                data: '{"customer_id":"' + $("#selectcustomerid").val() + '","plant_id":"' + $("#SelectServiceScheduleplant").val() + '","servicetype":"' + $("#SelectServiceScheduletype").val() + '","description":"' + $("#ServiceScheduledescription").val() + '" }',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)
                    loadgrid();

                    console.log(myData);

                    swal("Success", "Data Has Been Saved Successfully!", "success");

                },
                error: function (error) {
                    console.log(error);
                }
            });

            $('#mainform')[0].reset();
        });



                 <%--Load the Datatable on Mainpage--%>
        function loadgrid() {

            $("#btnCancel").removeAttr('disabled');
            $("#btnSubmit").removeAttr('disabled');

            $.ajax({
                type: 'POST',
                url: 'Services.aspx/Gridchange',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    $("#ServiceSchedulelist tbody").empty();

                    var myData = JSON.parse(response.d)
                    if (myData == "") {
                        return;
                    }

                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {



                        var plant = myData[i].plant_id;

                        switch (plant) {
                            case 1:
                                plant = "Plant One";
                                break;
                            case 2:
                                plant = "Plant Two";
                                break;
                            case 3:
                                plant = "Plant Three";
                                break;
                            default:
                        }


                        tr.push('<tr>')
                        tr.push("<td>" + myData[i].name + "</td>");
                        tr.push("<td>" + plant + "</td>");
                        tr.push("<td>" + myData[i].servicetype + "</td>");
                        tr.push("<td>" + myData[i].description + "</td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"updateFunction('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnDelete\" type=\"button\" onclick=\"deletepopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnServiceDetails\" type=\"button\" onclick=\"ServiceDetailpopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-business-time\" ></i> </a></td>");
                        tr.push('</tr>');
                    }

                    $("#ServiceSchedulelist tbody").empty();
                    $('#ServiceSchedulelist').append($(tr.join('')));

                },
                error: function (error) {

                    console.log(error);

                }
            });

        }

         <%--Pass data to Service Schedule form on Edit--%>
        function updateFunction(id) {
            ID = id;

            $("html").scrollTop(0)

            $("#btnSubmit").attr('disabled', 'disabled');
            $("#btnUpdate").removeAttr('disabled');

            $.ajax({
                type: 'POST',
                url: 'Services.aspx/GetServiceScheduledtl',
                dataType: 'json',
                data: '{"id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)


                    $('#selectcustomerid').val(myData[0]["customer_id"]);
                    $('#SelectServiceScheduleplant').val(myData[0]["plant_id"]);
                    $('#SelectServiceScheduletype').val(myData[0]["servicetype"]);
                    $('#ServiceScheduledescription').val(myData[0]["description"]);

                },
                error: function (error) {
                    console.log(error);
                }
            });

        }

                  <%-- Update Service Schedule --%>

        $(function () {

            $("#btnUpdate").click(function () {

                var cusname = $("#selectcustomerid").val();
                var plantname = $("#SelectServiceScheduleplant").val();
                var servicetype = $("#SelectServiceScheduletype").val();
                var des = $("#ServiceScheduledescription").val();
    

                if (cusname.trim() == "") {
                    swal("Customer Name Required!");
                    return;
                } else if (plantname.trim() == "") {
                    swal("plant required!");
                    return;
                } else if (servicetype.trim() == "") {
                    swal("Service Type Required!");
                    return;
                } else if (des.trim() == "" || des == null) {
                    swal("Description required!");
                    return;
                } else {

                    $.ajax({
                        type: 'POST',
                        url: 'Services.aspx/UpdateServiceSchedule',
                        dataType: 'json',
                        data: '{"customer_id":"' + $("#selectcustomerid").val() + '","plant_id":"' + $("#SelectServiceScheduleplant").val() + '","servicetype":"' + $("#SelectServiceScheduletype").val() + '","description":"' + $("#ServiceScheduledescription").val() + '","id":"' + ID + '" }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var myData = JSON.parse(response.d)
                            loadgrid();
                            swal("Success", "Data Has Been Updated Successfully!", "success");


                            $('#selectcustomerid').val("");
                            $('#SelectServiceScheduleplant').val("");
                            $('#SelectServiceScheduletype').val("");
                            $('#ServiceScheduledescription').val("");




                            swal("Success", "Service Schedule Has Been Updated Successfully!", "success");

                        },

                        error: function (error) {
                            console.log(error);
                        }

                    });
                }


            });
        });



                  <%-- Pass Data to Delete Service Schedule Model --%>
        function deletepopupfunc(id) {
            delID = id;

            $.ajax({
                type: 'POST',
                url: 'Services.aspx/GetServiceScheduledtl',
                dataType: 'json',
                data: '{"id":"' + delID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myServiceScheduleDeleteModal").modal('show');

                    var plant = myData[0]["plant_id"];

                    switch (plant) {
                        case 1:
                            plant = "Plant One";
                            break;
                        case 2:
                            plant = "Plant Two";
                            break;
                        case 3:
                            plant = "Plant Three";
                            break;
                        default:
                    }

                   
                    $('#selectcustomerpopup').html(myData[0]["name"]);
                    $('#selectplantpopup').html(plant);
                    $('#servicetypepopup').html(myData[0]["servicetype"]);
                    $('#selectdescription').html(myData[0]["description"]);

                },
                error: function (error) {
                    console.log(error);
                }
            });
        }


                  <%-- Delete Yes Service Schedule --%>

        $(function () {

            $("#btnServiceScheduleDeleteYes").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'Services.aspx/popupdelete',
                    dataType: 'json',
                    data: '{"id":"' + delID + '" }',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)
                        loadgrid();

                        $("#myServiceScheduleDeleteModal").modal('toggle');
                        swal("Success", "Record Has Been Closed Successfully!", "success");

                    },

                    error: function (error) {
                        console.log(error);
                    }

                });

            });

        });


                <%-- Pass Data to Service Details Model --%>

        function ServiceDetailpopupfunc(id) {

            ServiceDetailsloadgrid(id);

            servicedetailID = id;


            $("#btnServiceScheduleDetailSave").removeAttr('disabled');
            $("#btnCancelServiceScheduleDetail").removeAttr('disabled');
            $("#btnUpdateServiceScheduleDetail").attr('disabled', 'disabled');

            $.ajax({
                type: 'POST',
                url: 'Services.aspx/GetServiceScheduledtl',
                dataType: 'json',
                data: '{"id":"' + servicedetailID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#ModalServiceScheduleDetails").modal('show');

                    sessionStorage.setItem('servicemasteridfrmtablewhnclickdetail', myData[0].id);
                    sessionStorage.setItem('uidfrmtablewhnclickdetails', myData[0].customer_id);

                    $('#customeridServiceSheduleDetails').html(myData[0]["name"]);

                    $('#ServiceShedulefnovisit').html(myData[0]["servicemaster_refno"]);

                },
                error: function (error) {
                    console.log(error);
                }
            });

        }

                  <%-- Save Service Details --%>

        $("#ServiceSheduleDetailsForm").on('submit', function (e) {
            e.preventDefault();

            $("#btnServiceScheduleDetailSave").removeAttr('disabled');

            var sermasid = sessionStorage.getItem('servicemasteridfrmtablewhnclickdetail');
            var uid = sessionStorage.getItem('uidfrmtablewhnclickdetails');
           

                    $.ajax({
                        type: 'POST',
                        url: 'Services.aspx/SaveServiceDetail',
                        dataType: 'json',
                        data: '{"customer_id":"' + uid + '","scheduledate":"' + $("#ScheduleDate").val() + '" ,  "sermasid":"' + sermasid + '" , "status":"' + $("#ServiceScheduleDetailStatus").val() + '","description":"' + $("#description").val() + '" }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var myData = JSON.parse(response.d)

                            $('#customeridServiceSheduleDetails').text("");
                            $('#ScheduleDate').val("");
                            $('#ServiceScheduleDetailStatus').val("");
                            $('#description').val("");

                            $("#ModalServiceScheduleDetails").modal('toggle');
                            console.log(myData);

                            swal("Success", "Service Schedule Details Has Been Saved Successfully!", "success");

                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });

        });

                 <%-- Load Service  Details Data Table --%>

        function ServiceDetailsloadgrid(id) {

            servisedetailsIDloadtable = id;

            $.ajax({
                type: 'POST',
                url: 'Services.aspx/ServiceDetailsGridchange',
                data: '{"id":"' + servisedetailsIDloadtable + '"}',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    $("#example6 tbody").empty();

                    var myData = JSON.parse(response.d)
                    if (myData == "") {
                        return;
                    }

                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {



                        var date1 = myData[i].scheduledate;
                        var date2 = date1.replace('T00:00:00', ' ');

                        var serdestatus = myData[i].status;

                        if (serdestatus==1) {
                            serdestatus = "Done";
                        } else {
                            serdestatus = "Pending";
                        }

                  
                        tr.push('<tr>')
                        tr.push("<td>" + myData[i].name + "</td>");
                        tr.push("<td>" + date2 + "</td>");
                        tr.push("<td>" + serdestatus + "</td>");
                        tr.push("<td>" + myData[i].description + "</td>");
                        tr.push("<td><a id=\"btnEditServiceDetails\" type=\"button\"  onclick=\"updateFunctionServiceDetails('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnCloseServiceDetails\" type=\"button\" onclick=\"deletePopupfuncServiceDetails('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
                        tr.push('</tr>');

                    }

                    $("#example6 tbody").empty();
                    $('#example6').append($(tr.join('')));

                },
                error: function (error) {

                    console.log(error);

                }
            });
        }




      <%--Pass data to Service Details form on Edit--%>

        function updateFunctionServiceDetails(id) {

            servicedetailsIDedit = id;

          

            $("#btnServiceScheduleDetailSave").attr('disabled', 'disabled');
            $("#btnUpdateServiceScheduleDetail").removeAttr('disabled');


            $.ajax({
                type: 'POST',
                url: 'Services.aspx/GetServiceDetailsdtl',
                dataType: 'json',
                data: '{"id":"' + servicedetailsIDedit + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)


                    var now = new Date(myData[0]["scheduledate"]);

                    var day = ("0" + now.getDate()).slice(-2);
                    var month = ("0" + (now.getMonth() + 1)).slice(-2);
                    var newdate = now.getFullYear() + "-" + (month) + "-" + (day);

                    document.getElementById("ScheduleDate").valueAsDate = new Date(newdate);

                    $('#ServiceScheduleDetailStatus').val(myData[0]["status"]);
                    $('#description').val(myData[0]["description"]);
                
                },
                error: function (error) {
                    console.log(error);
                }
            });

        }



                         <%-- Update Service Details --%>

        $(function () {

            $("#btnUpdateServiceScheduleDetail").click(function () {

                var date = $('#ScheduleDate').val();
                var stat = $('#ServiceScheduleDetailStatus').val();
                var des = $('#description').val();


                if (date.trim() == "" || date == null) {
                    swal("Date Required!");
                    return;
                } else if (stat.trim() == "") {
                    swal("status required!");
                    return;
                } else if (des.trim() == "" || des == null) {
                    swal("Description Required!");
                    return;
                } else {


                    $.ajax({
                        type: 'POST',
                        url: 'Services.aspx/UpdateServiceDetails',
                        dataType: 'json',
                        data: '{"scheduledate":"' + $("#ScheduleDate").val() + '","status":"' + $("#ServiceScheduleDetailStatus").val() + '","description":"' + $("#description").val() + '","id":"' + servicedetailsIDedit + '" }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var myData = JSON.parse(response.d)

                            $('#ScheduleDate').val("");
                            $('#ServiceScheduleDetailStatus').val("");
                            $('#description').val("");

                            $("#ModalServiceScheduleDetails").modal('toggle');

                            swal("Success", "Site Visit Has Been Updated Successfully!", "success");

                        },

                        error: function (error) {
                            console.log(error);
                        }

                    });
                }


            });
        });


                          <%-- Pass Data to Delete Service Details Model --%>
        function deletePopupfuncServiceDetails(id) {
            delServiceDetailsID = id;

            $.ajax({
                type: 'POST',
                url: 'Services.aspx/GetServiceDetailsdtl',
                dataType: 'json',
                data: '{"id":"' + delServiceDetailsID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)


                    $("#myDeleteServiceDetailsModal").modal('show');

                    var Date = myData[0]["scheduledate"];
                    var newdate = Date.replace('T00:00:00', ' ');

                    var selectStatus = myData[0]["status"];

                    if (selectStatus == 1) {
                        selectStatus = "Done"
                    } else {
                        selectStatus = "Pending"
                    }

                    $('#selectcustomeridpopup').html(myData[0]["name"]);
                    $('#selectdatepopup').html(newdate);
                    $('#selectSerDetastatus').html(selectStatus);
                    $('#selectdescriptionpopup').html(myData[0]["description"]);
                },
                error: function (error) {
                    console.log(error);
                }
            });

        }


                          <%-- Delete Yes Service Details --%>

        $(function () {

            $("#btnServiceDetailsDeleteYes").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'Services.aspx/ServiceDetailsPopupDelete',
                    dataType: 'json',
                    data: '{"id":"' + delServiceDetailsID + '" }',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)

                        $("#myDeleteServiceDetailsModal").modal('toggle');

                        $("#ModalServiceScheduleDetails").modal('toggle');

                        swal("Success", "Record Has Been Deleted Successfully!", "success");

                    },

                    error: function (error) {
                        console.log(error);
                    }

                });

            });

        });



        function getUrlVars() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }






            $("#btnCancelServiceScheduleDetail").click(function () {

                $("#btnServiceScheduleDetailSave").removeAttr('disabled');
                $("#btnCancelServiceScheduleDetail").removeAttr('disabled');
                $("#btnUpdateServiceScheduleDetail").attr('disabled', 'disabled');

            });

     

    </script>

</asp:Content>


