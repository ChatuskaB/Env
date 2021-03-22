<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Enviro.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <header>
        <style>
            .contentCustomer {
                padding: 10px;
                padding-top: 100px;
            }

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
        <form id="mainform" novalidate method="post">

            <!-- Main content -->
         
            <div class="row">
                <div class="col-md-6">

                    <%-- Start of General Information Form --%>
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">General Information</h3>

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
                                <input type="text" id="customerName" class="form-control" placeholder="Customer Name" contenteditable="false" required />


                            </div>

                            <div class="form-group">
                                <label for="inputDescription">Address</label>
                                <span>* </span>
                                <textarea id="address" class="form-control" rows="2" placeholder="Address" contenteditable="false" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="inputClientCompany">Contact Number</label>
                                <span>* </span>
                                <input type="number" id="contactNumber" class="form-control" placeholder="Contact Number" contenteditable="false" required />
                            </div>

                            <div class="form-group">
                                <label for="inputProjectLeader">E-Mail</label>
                                <span>* </span>
                                <input type="text" id="email" class="form-control" placeholder="Email" contenteditable="false" required />
                            </div>

                            <br />
                            <br />
                            <br />
                            <br />

                        </div>

                    </div>
                    <%-- End of General Information Form  --%>

                </div>


                <%-- Start Of Plant Information Form --%>

                <div class="col-md-6">
                    <div class="card card-secondary">

                        <div class="card-header">
                            <h3 class="card-title">Plant Information</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">

                            <div class="form-group">
                                <label for="inputClientCompany">Plant Name</label>
                                <span>* </span>
                                <input type="text" id="plantName" class="form-control" placeholder="Plant Name" contenteditable="false" required />
                            </div>

                            <div class="form-group">
                                <label for="inputStatus">Plant Type</label>
                                <span>* </span>
                                <input type="text" id="planttype" class="form-control" placeholder="Plant Type" contenteditable="false" required />
                                <%--<select required class="form-control custom-select">
                                        <option selected disabled>Select one</option>
                                        <option>On Hold</option>
                                        <option>Canceled</option>
                                        <option>Success</option>
                                    </select>--%>
                            </div>

                            <div class="form-group">
                                <label for="inputClientCompany">Plant Contact Number</label>
                                <span>* </span>
                                <input type="number" id="plantContactNumber" class="form-control" placeholder="Plant Contact Number" contenteditable="false" required />
                            </div>
                            <div class="form-group">
                                <label for="inputEstimatedBudget">Plant Location / Site</label>
                                <span>* </span>
                                <textarea id="plantAddress" class="form-control" rows="2" placeholder="Plant Location" contenteditable="false" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="inputSpentBudget">Plant Capacity</label>
                                <span>* </span>
                                <input type="text" id="plantCapacity" class="form-control" placeholder="Plant Capacity" contenteditable="false" required>
                            </div>

                        </div>


                    </div>
                </div>
                <%-- End Of Plant Information Form --%>
            </div>


            <div class="card-footer">
                <button id="btnSave" type="submit" class="btn btn-success">Save</button>
                <button id="btnUpdate" type="button" class="btn btn-warning">Update</button>
                &nbsp;&nbsp; &nbsp;&nbsp;
                <button id="btnCancel" type="reset" class="btn btn-default float-right">Cancel</button>
            </div>

        </form>

        <br />
        <br />

        <%-- Start Of Customer n Plant Grid --%>

        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Customers</h3>
            </div>

            <div class="card-body">

                <table id="tblinquirylist" class="table table-bordered table-hover" style="display: inline-table">
                    <thead>
                        <tr>
                            <th>Customer Name</th>
                            <th>Mobile Number</th>
                            <th>Email</th>
                            <th>Plant Name</th>
                            <th>Plant Type</th>
                            <th>Edit</th>
                            <th>Delete</th>
                            <th>Plant Eq:</th>
                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                            <th>Customer Name</th>
                            <th>Mobile Number</th>
                            <th>Email</th>
                            <th>Plant Name</th>
                            <th>Plant Type</th>
                            <th>Edit</th>
                            <th>Delete</th>
                            <th>Plant Eq:</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <%-- End Of Customer n Plant Grid --%>
    </div>

   <%-- Start Of Plant Equipment Form --%>

    <div id="myModal1" class="modal">

        <div class="modal-content" >


            <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

            <br />
            <br />

            <form id="equipform">

                <input type="hidden" id="equipmntPlantId" />
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">



                            <div class="card-header">
                                <h3 class="card-title">Plant Equipment</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>


                            <div class="card-body">


                                <div class="form-group">
                                    <label for="inputClientCompany">
                                      --  Name Of The Plant --  <span class="required"></span>
                                    </label>
                                    <label id="plantnamepopup1" class="form-control"></label>
                                </div>

                        

                                <div class="form-group">
                                    <label for="inputStatus">Type</label>
                                    <span>* </span>
                                    <select required id="EType" class="form-control custom-select">
                                        <option selected disabled>Select one</option>
                                        <option id="typePipe">Pipe</option>
                                        <option id="typeElectronic">Electronic</option>
                                    </select>
                                </div>




                                <div class="form-group">
                                    <label for="inputDescription">Discription</label>
                                    <span>* </span>
                                    <textarea required id="equipmentDiscription" class="form-control" rows="4"></textarea>
                                </div>



                                <div class="form-group">
                                    <label for="inputClientCompany">Unit ID</label>
                                    <span>* </span>
                                    <input required type="text" id="unitID" class="form-control">
                                </div>



                                <div class="form-group">
                                    <label for="inputProjectLeader">Serial No.</label>
                                    <span>* </span>
                                    <input required type="number" id="serial" class="form-control">
                                </div>



                                <div class="form-group">
                                    <label for="inputProjectLeader">Module</label>
                                    <span>* </span>
                                    <input required type="text" id="module" class="form-control">
                                </div>


                            </div>


                            <div class="row float-right" style="padding-right: 8px;">
                                <button id="btnCancel1" type="reset" class="btn btn-success">Cancel</button>
                                &nbsp;&nbsp;
                                    <input id="Save1" type="submit" value="Save" class="btn btn-success">
                                &nbsp;&nbsp; &nbsp;&nbsp;
                                    <button id="btnUpdate1" type="button" class="btn btn-warning">Update</button>
                            </div>





               <%--Start Of Plant Equipment Grid --%>



                            <div class="card">


                                <div class="card-header">
                                    <h3 class="card-title">Details</h3>
                                </div>


                                <div class="card-body">


                                    <table id="tbleqipmentlist" class="table table-bordered table-hover" style="display: inline-table">
                                        <thead>
                                            <tr>
                                                <th>Type</th>
                                                <th>Discription</th>
                                                <th>Unit ID</th>
                                                <th>Serial No</th>
                                                <th>Module</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>

                                        <tfoot>
                                            <tr>
                                                <th>Type</th>
                                                <th>Discription</th>
                                                <th>Unit ID</th>
                                                <th>Serial No</th>
                                                <th>Module</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </tfoot>
                                    </table>



                                </div>
                            </div>
                        </div>


                    </div>

                </div>



            </form>

        </div>
    </div>



    <%--Start Of Customer n Plant Popup Grid --%>

    <div id="myModal" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelcloseCusPlant" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                <br />
                <br />

                <div class="row">

                    <div class="col-12">

                        <div class="card card-primary">

                            <div class="card-header">
                                <h3 class="card-title">Details</h3>
                            </div>


                            <div class="card-body">

                                <form id="frmSeasons" data-parsley-validate="" class="form-horizontal form-label-left">

                                    <input type="hidden" id="txtTransId" />

                                    <div class="form-group">
                                        <label for="inputName">
                                            Customer Name <span class="required">:</span>
                                        </label>
                                        <label id="cusnamepopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="inputClientCompany">
                                            Mobile Number <span class="required">:</span>
                                        </label>
                                        <label id="mobilepopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="inputProjectLeader">
                                            E-Mail <span class="required">:</span>
                                        </label>
                                        <label id="emailpopup" class="form-control"></label>
                                    </div>



                                    <div class="form-group">
                                        <label for="inputClientCompany">
                                            Plant Name <span class="required">:</span>
                                        </label>
                                        <label id="plantnamepopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="inputStatus">
                                            Plant Type <span class="required">:</span>
                                        </label>
                                        <label id="planttypepopup" class="form-control"></label>
                                    </div>


                                </form>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btndeleteyes" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;
                    <button id="btndeletecancel" type="reset" class="btn btn-danger modelcloseCusPlant">Cancel</button>
                </div>


            </section>
        </div>
    </div>



    <%-- Start Of Plant Equipment Popup Grid --%>


    <div id="myModal2" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelcloseEquip " style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                <br />
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">


                            <div class="card-header">
                                <h3 class="card-title">Details</h3>
                            </div>


                            <div class="card-body">

                                <form id="frmSeasons1" data-parsley-validate="" class="form-horizontal form-label-left">

                                    <input type="hidden" id="txtTransId1" />


                                    <div class="form-group">
                                        <label for="inputName">
                                            Type <span class="required">:</span>
                                        </label>
                                        <label id="Typepopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="inputClientCompany">
                                            Discription <span class="required">:</span>
                                        </label>
                                        <label id="discriptionpopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="inputProjectLeader">
                                            Unit ID <span class="required">:</span>
                                        </label>
                                        <label id="unitIDpopup" class="form-control"></label>
                                    </div>



                                    <div class="form-group">
                                        <label for="inputClientCompany">
                                            Seiriol No <span class="required">:</span>
                                        </label>
                                        <label id="Seiriolpopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="inputStatus">
                                            Module <span class="required">:</span>
                                        </label>
                                        <label id="modulepopup" class="form-control"></label>
                                    </div>



                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btndeleteyes1" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;
                    <button id="btndeletecancel1" type="reset" class="btn btn-danger modelcloseEquip">Cancel</button>
                </div>


            </section>
        </div>
    </div>


    <script>

        var ID = 0;
        var delID = 0;
        var delEqID = 0;
        var planteq = 0;
        var eqGrid = 0;
       

     
        $(document).ready(function () {
            loadgrid();
        });


        <%--Data Load Function Of Customer n Plant Grid --%>

        function loadgrid() {
            $("#btnCancel").removeAttr('disabled');
            $("#btnSave").removeAttr('disabled');
            $("#btnUpdate").attr('disabled', 'disabled');

            $.ajax({
                type: 'POST',
                url: 'Customer.aspx/gridchange',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                    $("#tblinquirylist tbody").empty();



                    var customerData = JSON.parse(response.d);
                    if (customerData == "") {
                        return;
                    }
                    var tr = [];
                    for (var i = 0; i < customerData.length; i++) {

                        tr.push('<tr>')
                        tr.push("<td> " + customerData[i].name + " </td>");
                        tr.push("<td> " + customerData[i].contact_no + "</td>");
                        tr.push("<td> " + customerData[i].email + "</td>");
                        tr.push("<td> " + customerData[i].plantname + "</td>");
                        tr.push("<td> " + customerData[i].planttype + "</td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"updateFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
                        tr.push("<td><a id=\"addPlantEquipButton\" type=\"button\" onclick=\"addplanteqfunc('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-tools\"></i>  </a></td>");
                        tr.push('</tr>');


                    }

                    $("#tblinquirylist tbody").empty();
                    $('#tblinquirylist').append($(tr.join('')));

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }



        $(".modelcloseCusPlant").click(function () {
            $("#myModal").modal('toggle');
        });


   <%-- Save Function Of Customer n Plant Form --%> 

        $("#mainform").on('submit', function (e) {
            e.preventDefault();

            $("#customerName").attr('contenteditable', false);
            $("#contactNumber").attr('contenteditable', false);
            $("#email").attr('contenteditable', false);
            $("#plantName").attr('contenteditable', false);
            $("#planttype").attr('contenteditable', false);


            $("#btnSave").attr('disabled', 'disabled');
            $("#btnCancel").removeAttr('disabled');
            $("#btnSave").removeAttr('disabled');
            $("#addPlantEquipButton").attr('disabled', 'disabled');

            var customerName = $("#customerName").val();
            var address = $("#address").val();
            var contactNumber = $("#contactNumber").val();
            var email = $("#email").val();
            var plantName = $("#plantName").val();
            var planttype = $("#planttype").val();
            var plantContactNumber = $("#plantContactNumber").val();
            var plantAddress = $("#plantAddress").val();
            var plantCapacity = $("#plantCapacity").val();

           

            if (customerName.trim() == "" || customerName == null) {
                swal("Customer Name Required!");
                return;
            } else if (address.trim() == "" || address == null) {
                swal(" Address Required!");
                return;
            } else if (contactNumber.trim() == "" || contactNumber == null) {
                swal("Contact Number required!");
                return;
            } else if (!validateEmail(email) || email.trim() == "" || email == null) {
                swal(" Valid Email  Required!");
                return;
            } else if (plantName.trim() == "" || plantName == null) {
                swal("Plant Name required!");
                return;
            } else if (planttype.trim() == "" || planttype == null) {
                swal("Plant Type required!");
                return;
            } else if (plantContactNumber.trim() == "" || plantContactNumber == null) {
                swal("Plant Contact Number required!");
                return;
            } else if (plantAddress.trim() == "" || plantAddress == null) {
                swal("Plant Address required!");
                return;
            } else if (plantCapacity.trim() == "" || plantCapacity == null) {
                swal("Plant Capacity required!");
                return;

            } else {

            

                $.ajax({
                    type: 'POST',
                    url: 'Customer.aspx/SaveCustomer',
                    dataType: 'json',
                    data: '{"name":"' + $("#customerName").val() + '","address":"' + $("#address").val() + '","contact_no":"' + $("#contactNumber").val() + '","email":"' + $("#email").val() + '","plantname":"' + $("#plantName").val() + '","planttype":"' + $("#planttype").val() + '","plant_contactno":"' + $("#plantContactNumber").val() + '","plant_location":"' + $("#plantAddress").val() + '","plant_capacity":"' + $("#plantCapacity").val() + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var customerData = JSON.parse(response.d)
                        console.log(customerData);


                        loadgrid();

                        swal("Success", "Data Has Been Saved Successfully!", "success");
                     

                    },
                    error: function (error) {
                        console.log(error);
                    }


                });

          
            }
            $('#mainform')[0].reset();



        });



        <%-- Update  (Edit) Function Of Customer n Plant  Form / Load Customer n Plant Details --%>

        function updateFunction(id) {

            $("html").scrollTop(0)

            ID = id;


            $("#btnSave").removeAttr('disabled');
            $("#btnCancel").removeAttr('disabled');
            $("#btnSave").attr('disabled', 'disabled');
            $("#btnUpdate").removeAttr('disabled');
            $("#addPlantEquipButton").removeAttr('disabled');



            $.ajax({
                type: 'POST',
                url: 'Customer.aspx/getcustomerdtl',
                dataType: 'json',
                data: '{"id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {



                    var customerData = JSON.parse(response.d)

                    $('#customerName').val(customerData[0]["name"]);
                    $('#address').val(customerData[0]["address"]);
                    $('#contactNumber').val(customerData[0]["contact_no"]);
                    $('#email').val(customerData[0]["email"]);
                    $('#plantName').val(customerData[0]["plantname"]);
                    $('#planttype').val(customerData[0]["planttype"]);
                    $('#plantContactNumber').val(customerData[0]["plant_contactno"]);
                    $('#customerRefNumber').val(customerData[0]["customer_id"]);
                    $('#plantAddress').val(customerData[0]["plant_location"]);
                    $('#plantCapacity').val(customerData[0]["plant_capacity"]);
                    $("#txtTransId").val(customerData[0]["id"]);



                },
                error: function (error) {
                    console.log(error);
                }
            });


        }
        <%-- Delete Yes Function Of Customer n Plant Form --%>


        $(function () {

            $("#btndeleteyes").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'Customer.aspx/popupdelete',
                    dataType: 'json',
                    data: '{"id":"' + delID + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var customerData = JSON.parse(response.d)
                        loadgrid();
                        $("#myModal").modal('toggle');


                        swal("Success", "Data Has Been Deleted Successfully!", "success");



                    },
                    error: function (error) {
                        console.log(error);
                    }
                });

            });


        });

        <%-- Function For The Delete Popup Of Customer n Plant Form --%> 

       

        function deletepopupfunc(id) {
            delID = id;

            $.ajax({
                type: 'POST',
                url: 'Customer.aspx/getcustomerdtl',
                dataType: 'json',
                data: '{"id":"' + delID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var customerData = JSON.parse(response.d)

                    $("#myModal").modal('show');


                    $('#cusnamepopup').html(customerData[0]["name"]);
                    $('#mobilepopup').html(customerData[0]["contact_no"]);
                    $('#emailpopup').html(customerData[0]["email"]);
                    $('#plantnamepopup').html(customerData[0]["plantname"]);
                    $('#planttypepopup').html(customerData[0]["planttype"]);




                },
                error: function (error) {
                    console.log(error);
                }

            });
        }



        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(email).toLowerCase());

        }


        <%-- Function for the Update Of Customer n Plant Form --%>



        $(function () {
            $("#btnUpdate").click(function () {

                $("#btnCancel").removeAttr('disabled');
                $("#btnUpdate").removeAttr('disabled');
                $("#btnSave").removeAttr('disabled');
                $("#addPlantEquipButton").removeAttr('disabled');

                var customerName = $("#customerName").val();
                var address = $("#address").val();
                var contactNumber = $("#contactNumber").val();
                var email = $("#email").val();
                var plantName = $("#plantName").val();
                var planttype = $("#planttype").val();
                var plantContactNumber = $("#plantContactNumber").val();
                var plantAddress = $("#plantAddress").val();
                var plantCapacity = $("#plantCapacity").val();



                if (customerName.trim() == "" || customerName == null) {
                    swal("Customer Name Required!");
                    return;
                } else if (address.trim() == "" || address == null) {
                    swal(" Address Required!");
                    return;
                } else if (contactNumber.trim() == "" || contactNumber == null) {
                    swal("Contact Number required!");
                    return;
                } else if (!validateEmail(email) || email.trim() == "" || email == null) {
                    swal(" Valid Email  Required!");
                    return;
                } else if (plantName.trim() == "" || plantName == null) {
                    swal("Plant Name required!");
                    return;
                } else if (planttype.trim() == "" || planttype == null) {
                    swal("Plant Type required!");
                    return;
                } else if (plantContactNumber.trim() == "" || plantContactNumber == null) {
                    swal("Plant Contact Number required!");
                    return;
                } else if (plantAddress.trim() == "" || plantAddress == null) {
                    swal("Plant Address required!");
                    return;
                } else if (plantCapacity.trim() == "" || plantCapacity == null) {
                    swal("Plant Capacity required!");
                    return;

                } else {


                    $.ajax({
                        type: 'POST',
                        url: 'Customer.aspx/UpdateCustomer',
                        dataType: 'json',
                        data: '{"name":"' + $("#customerName").val() + '","contact_no":"' + $("#contactNumber").val() + '","email":"' + $("#email").val() + '","plantname":"' + $("#plantName").val() + '","planttype":"' + $("#planttype").val() + '","id":"' + ID + '"  }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {


                            var customerData = JSON.parse(response.d)
                            loadgrid();

                            swal("Success", "Data Has Been Updated Successfully!", "success");

                            $('#customerName').val("");
                            $('#address').val("");
                            $('#contactNumber').val("");
                            $('#email').val("");
                            $('#plantName').val("");
                            $('#planttype').val("");
                            $('#plantContactNumber').val("");
                            $('#plantAddress').val("");
                            $('#plantCapacity').val("");





                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });


                }

            });
        });


        $("#btnCancel").click(function () {

            $("#btnSave").removeAttr('disabled');
            $("#btnUpdate").removeAttr('disabled');
            
        });


                                ///////////////////////////// <%-- PLANT  EQUIPMENT FORM --%> ////////////////////////////////////


      

          <%--Update (Edit) Function Of Equipmnt Form / Load Equipmnt Details --%>


         function addplanteqfunc(id) {
             planteq = id;

            

         

            $("#btnCancel1").removeAttr('disabled');
            $("#btnSave1").removeAttr('disabled');
            $("#btnUpdate1").attr('disabled', 'disabled');

            $.ajax({
                type: 'POST',
                url: 'Customer.aspx/getcustomerdtl',
                dataType: 'json',
                data: '{"id":"' + planteq + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var customerData = JSON.parse(response.d)

                    $("#myModal1").modal('show');
                    loadgrid1(id)
                   
                    $('#plantnamepopup1').html(customerData[0]["plantname"]);
                    $('#equipmntPlantId').val(customerData[0]["pid"]);

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }




        <%-- Function For The Equipment Grid Data Load  --%>

        function loadgrid1(id) {

            eqGrid = id;
         
            $("#btnCancel1").removeAttr('disabled');
            $("#btnSave1").removeAttr('disabled');
            $("#btnUpdate1").attr('disabled', 'disabled');


            $.ajax({
                type: 'POST',
                url: 'Customer.aspx/gridchange1',
                data: '{"id":"' + eqGrid + '"}',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                    $("#tbleqipmentlist tbody").empty();



                    var customerData = JSON.parse(response.d);
                    if (customerData == "") {
                        return;
                    }
                    var tr = [];
                    for (var i = 0; i < customerData.length; i++) {

                        tr.push('<tr>')
                        tr.push("<td> " + customerData[i].type + " </td>");
                        tr.push("<td> " + customerData[i].discription + "</td>");
                        tr.push("<td> " + customerData[i].unit_id + "</td>");
                        tr.push("<td> " + customerData[i].serial_no + "</td>");
                        tr.push("<td> " + customerData[i].module + "</td>");
                       
                        tr.push("<td><a id=\"btnEdit1\" type=\"button\"  onclick=\"updateEquipFunction('" + customerData[i]["id"] + "')\">  <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnClose1\" type=\"button\" onclick=\"deletepopupfunc1('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");

                        tr.push('</tr>');

                    }

                    $("#tbleqipmentlist tbody").empty();
                    $('#tbleqipmentlist').append($(tr.join('')));

                },
                error: function (error) {
                    console.log(error);
                }

            });

         }

         
        $(".modelcloseEquip").click(function () {
            $("#myModal2").modal('toggle');
        });


          <%-- Function For The Save Equipment Form --%>


          $("#equipform").on('submit', function (e){
            e.preventDefault();

        


            $("#EType").attr('contenteditable', false);
            $("#equipmentDiscription").attr('contenteditable', false);
            $("#unitID").attr('contenteditable', false);
            $("#serial").attr('contenteditable', false);
            $("#module").attr('contenteditable', false);


            $("#btnSave1").attr('disabled', 'disabled');
            $("#btnCancel1").removeAttr('disabled');
            $("#btnSave1").removeAttr('disabled');


            var EType = $("#EType").val();
            var equipmentDiscription = $("#equipmentDiscription").val();
            var unitID = $("#unitID").val();
            var serial = $("#serial").val();
            var module = $("#module").val();


            if (EType.trim() !== "" || EType !== null && equipmentDiscription.trim() !== "" || equipmentDiscription !== null && unitID.trim() !== "" || unitID !== null && serial.trim() !== "" || serial !== null && module.trim() !== "" || module !== null) {
            

        
       

                $.ajax({
                    type: 'POST',
                    url: 'Customer.aspx/SaveEquipment',
                    dataType: 'json',

                    data: '{"type":"' + $("#EType").val() + '","discription":"' + $("#equipmentDiscription").val() + '","unit_id":"' + $("#unitID").val() + '","serial_no":"' + $("#serial").val() + '","module":"' + $("#module").val() + '","plant_id":"' + $("#equipmntPlantId").val() + '" }',
                     


                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var customerData = JSON.parse(response.d)
                        console.log(customerData);

                        swal("Success", "Data Has Been Saved Successfully!", "success");
                        loadgrid1($("#equipmntPlantId").val() );

                    },
                    error: function (error) {
                        console.log(error);
                    }


                });

            } else {
                swal("Oops...", "Somthing went wrong!", "error");
            }
            $('#equipform')[0].reset();
        });


          <%-- Update Function Of Equipmnt Form --%>

          function updateEquipFunction(id) {

              $('#myModal1').scrollTop(0);

              planteq = id;


              $("#btnSave1").removeAttr('disabled');
              $("#btnCancel1").removeAttr('disabled');
              $("#btnSave1").attr('disabled', 'disabled');
              $("#btnUpdate1").removeAttr('disabled');





                  $.ajax({
                      type: 'POST',
                      url: 'Customer.aspx/getequipdtl',
                      dataType: 'json',
                      data: '{"id":"' + planteq + '"}',
                      contentType: 'application/json; charset=utf-8',
                      success: function (response) {



                          var customerData = JSON.parse(response.d);

                          $('#EType').val(customerData[0]["type"]);
                          $('#equipmentDiscription').val(customerData[0]["discription"]);
                          $('#unitID').val(customerData[0]["unit_id"]);
                          $('#serial').val(customerData[0]["serial_no"]);
                          $('#module').val(customerData[0]["module"]);

                          $("#txtTransId1").val(customerData[0]["id"]);
                          //addplanteqfunc( $("#equipmntPlantId").val());




                      },
                      error: function (error) {
                          console.log(error);
                      }
                  });


         
             
          }


        <%-- Function For The Popup Delete Yes Equipmnt Form --%>


          $(function () {


              $("#btndeleteyes1").click(function () {


                  //loadgrid1($("#equipmntPlantId").val());

                  $.ajax({
                      type: 'POST',
                      url: 'Customer.aspx/popupdelete1',
                      dataType: 'json',
                      data: '{"id":"' + delEqID + '"}',
                      contentType: 'application/json; charset=utf-8',
                      success: function (response) {

                          var customerData = JSON.parse(response.d)
                        
                          $("#myModal2").modal('toggle');


                          swal("Success", "Data Has Been Deleted Successfully!", "success");
                          loadgrid1($("#equipmntPlantId").val() );


                      },
                      error: function (error) {
                          console.log(error);
                      }
                  });

              });



          });




        <%-- Function For The Popup Delete  Equipmnt Form --%>

        function deletepopupfunc1(id) {
            delEqID = id;

            $.ajax({
                type: 'POST',
                url: 'Customer.aspx/getequipdtl',
                dataType: 'json',
                data: '{"id":"' + delEqID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var customerData = JSON.parse(response.d)

                    $("#myModal2").modal('show');


                    $('#Typepopup').html(customerData[0]["type"]);
                    $('#discriptionpopup').html(customerData[0]["discription"]);
                    $('#unitIDpopup').html(customerData[0]["unit_id"]);
                    $('#Seiriolpopup').html(customerData[0]["serial_no"]);
                    $('#modulepopup').html(customerData[0]["module"]);




                },
                error: function (error) {
                    console.log(error);
                }

            });
        }

           




              <%-- Update Click Function Of Equipmnt Form --%>

        $(function () {
           
            
            $("#btnUpdate1").click(function () {
                 //planteq =  $("#equipmntPlantId").val(); 
               

                $("#btnCancel1").removeAttr('disabled');
                $("#btnUpdate1").removeAttr('disabled');
                $("#btnSave1").removeAttr('disabled');
              

                var EType = $("#EType").val();
                var equipmentDiscription = $("#equipmentDiscription").val();
                var unitID = $("#unitID").val();
                var serial = $("#serial").val();
                var module = $("#module").val();



                if (EType.trim() == "" || EType == null) {
                    swal("Equipment Type Required!");
                    return;
                } else if (equipmentDiscription.trim() == "" || equipmentDiscription == null) {
                    swal(" Discription Required!");
                    return;
                } else if (unitID.trim() == "" || unitID == null) {
                    swal("Unit ID required!");
                    return;

                } else if (serial.trim() == "" || serial == null) {
                    swal("serial No required!");
                    return;
                } else if (module.trim() == "" || module == null) {
                    swal("Module required!");
                    return;


                } else {

                      
                    $.ajax({
                        type: 'POST',
                        url: 'Customer.aspx/UpdateEquipCustomer',
                        dataType: 'json',
                        data: '{"type":"' + $("#EType").val() + '","discription":"' + $("#equipmentDiscription").val() + '","unit_id":"' + $("#unitID").val() + '","serial_no":"' + $("#serial").val() + '","module":"' + $("#module").val() + '","id":"' + planteq + '"  }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var customerData = JSON.parse(response.d)
                            //loadgrid1(planteq);


                            swal("Success", "Data Has Been Updated Successfully!", "success");
                            loadgrid1($("#equipmntPlantId").val() );

                            $('#EType').val("");
                            $('#equipmentDiscription').val("");
                            $('#unitID').val("");
                            $('#serial').val("");
                            $('#module').val("");



                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });



                }

            });

        });





        $("#btnCancel1").click(function () {

            $("#btnSave1").removeAttr('disabled');
            $("#btnUpdate1").removeAttr('disabled');

        });

       

        $(function () {
            $('#tblinquirylist').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });


        $(function () {
            $('#tbleqipmentlist').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });



    </script>


</asp:Content>
