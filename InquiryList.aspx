<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InquiryList.aspx.cs" Inherits="Enviro.InquiryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <header>
        <style>
            .contentInq {
                padding: 10px;
                /*padding-top: 100px;*/
                padding-top: 50px;
            }

            .inqListSubActive {
                background-color: rgba(255,255,255,.9);
                color: #343a40;
            }

            .InqListMainActive {
                background-color: #007bff;
                color: #fff;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 9999; /* Sit on top */
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




            /* The Modal (background) */
            .modal1 {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 9999; /* Sit on top */
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
            .modal-content1 {
                background-color: #fefefe;
                margin: 5% auto; /* 15% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button */
            .close1 {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

                .close1:hover,
                .close1:focus {
                    color: black;
                    text-decoration: none;
                    cursor: pointer;
                }
        </style>


        <style>
            .contentCustomer {
                padding: 10px;
                padding-top: 100px;
            }




            .inqServiceSubActive {
                background-color: rgba(255,255,255,.9);
                color: #343a40;
            }

            .InqServiceMainActive {
                background-color: #007bff;
                color: #fff;
            }
        </style>




    </header>

    <div class="content-wrapper contentCustomer">

        <%--Start of Main Page --%>

        <form id="maninform">
            <section class="content ">
                <div class="row">
                    <div class="col-12">

                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Inquiry - Service</h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>

                            </div>

                            <div class="card-body">

                                <input id="hidid" type="hidden" />
                                <div class="form-group">
                                    <label for="LabelName">Referance No.</label>
                                    <label id="inqRefNumber" class="form-control">Random Ref No. will appier Here </label>
                                </div>

                      
                                <div class="form-group">
                                    <label for="LabelCustomerid">Customer Name</label>
                                    <span>* </span>
                                    <select required id="selectcustomerid" class="form-control custom-select">
                                        <option selected="selected" value="">Select Customer Name</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="LabelType">Type</label>
                                    <span>* </span>
                                    <%--<select required id="selecttype" class="form-control custom-select" onchange="java_script_:show(this.options[this.selectedIndex].value)">--%>
                                    <select required id="selecttype" class="form-control custom-select">
                                        <option selected value=""></option>
                                        <option value="FreeService">Free Service</option>
                                        <option value="AnualService">Anual Service</option>
                                        <option value="OneTimeService">One Time Service</option>
                                        <option value="typeBrakedown">Brakedown</option>
                                        <option value="typeSale">Sale</option>
                                        <option value="typeModification">Modification</option>
                                    </select>
                                </div>


                                <div class="form-group">
                                    <label for="LabelContactNumber">Contact Number</label>
                                    <span>* </span>
                                    <input required type="number" id="txtcontactnumber" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="LabelEmail">E-Mail</label>
                                    <span>* </span>
                                    <input required type="email" id="txtemail" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="LabelDate">Date</label>
                                    <span>* </span>
                                    <input required type="date" id="date" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="LabelTime">Time</label>
                                    <span>* </span>
                                    <input required type="time" id="time" class="form-control">
                                </div>


                                <div class="form-group">
                                    <label for="inputDescription">Inquiry</label>
                                    <span>* </span>
                                    <textarea required id="txtinquiry" class="form-control" rows="4"></textarea>
                                </div>


                                <div class="row">
                                    <div class="col-12">
                                        <input id="btnSubmit" type="submit" value="Submit" class="btn btn-success ">
                                        <input id="btnCancel" type="reset" value="Cancel" class="btn btn-danger float-right">
                                        <input id="btnUpdate" type="button" value="Update" class="btn btn-warning">
                                    </div>
                                </div>

                            </div>


                        </div>


                    </div>

                </div>



            </section>


        </form>

        <%--Start of Main Inquiry Table --%>

        <div>
            <form>

                <br />
                <section>

                    <div class="card-body hiddenTable" id="mylist" style="background-color: #fff;">

                        <input type="hidden" id="oldVehno" value="0" />

                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Inquiry Details</h3>
                            </div>

                            <div class="card">
                                <div class="card-body">

                                    <div class="search-container">
                                        <input id="searchtype" type="text" placeholder="Search User Name.." name="search">
                                        <button id="searchbtn" type="button"><i class="fa fa-search"></i></button>
                                    </div>

                                    <table id="tblinquirylist" class="table table-bordered table-hover" style="display: inline-table">
                                        <thead>
                                            <tr>
                                                <th>Type</th>
                                                <th>Contact NO:</th>
                                                <th>Email</th>
                                                <th>Date</th>
                                                <th>Time</th>
                                                <th>Cus.Name:</th>
                                                <th>Inquiry</th>
                                                <th>Edit</th>
                                                <th>Close</th>
                                                <th>Quota.</th>
                                                <th>S.Visit</th>
                                                <th>Job</th>
                                            </tr>
                                        </thead>


                                        <tbody></tbody>


                                        <tfoot>
                                            <tr>
                                                <th>Type</th>
                                                <th>Contact NO:</th>
                                                <th>Email</th>
                                                <th>Date</th>
                                                <th>Time</th>
                                                <th>Cus.Name:</th>
                                                <th>Inquiry</th>
                                                <th>Edit</th>
                                                <th>Close</th>
                                                <th>Quota.</th>
                                                <th>S.Visit</th>
                                                <th>Job</th>
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
        <%--End of Main Inquiry Table --%>
        <%--End of my Main Page --%>
    </div>

    
    <%--Start of Close Model--%>

    <div id="myModal" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclose" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                <br />
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">

                            <div class="card-header">
                                <h3 class="card-title">Close - Details</h3>
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
                                        <label for="selecttype">
                                            Type <span class="required">:</span>
                                        </label>

                                        <label id="selecttypepopup" class="form-control"></label>

                                    </div>


                                    <div class="form-group ">
                                        <label for="txtcontactnumber">
                                            Contact Number <span class="required">:</span>
                                        </label>

                                        <label id="contactnumberpopup" class="form-control"></label>

                                    </div>

                                    <div class="form-group ">
                                        <label for="txtemail">
                                            Email <span class="required">:</span>
                                        </label>

                                        <label id="txtemailpopup" class="form-control"></label>
                                    </div>

                                    <div class="form-group ">
                                        <label for="date">
                                            Date <span class="required">:</span>
                                        </label>

                                        <label id="datepopup" class="form-control"></label>

                                    </div>

                                    <div class="form-group ">
                                        <label for="time">
                                            Time  <span class="required">:</span>
                                        </label>

                                        <label id="timepopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group ">
                                        <label for="txtinquiry">
                                            Inquiry <span class="required">:</span>
                                        </label>

                                        <label id="inquirypopup" class="form-control"></label>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btncloseyes" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;
                   
                    <button type="button" class="btn btn-danger closemodelClose">Cancel</button>
                </div>

            </section>
        </div>

    </div>
    <%--End of Close Model--%>


    <%--Start of Quotation Modal--%>

    <div id="myModalQuatation" class="modal">

        <div class="modal-content">
            <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclose" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

            <br />
            <br />
            <form id="QuatatioForm">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Quotation</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body">

                                <input type="hidden" id="txtTransIdQuotation" />

                                <div class="form-group">
                                    <label for="LabelCustomerid">Customer Name.</label>
                                    <span>* </span>
                                    <label id="customeridpopupqua" class="form-control"></label>
                                </div>


                                <div class="form-group">
                                    <label for="inputStatus">Inquiry Ref No.</label>
                                    <span>* </span>
                                    <label id="inqrefnoinquatation" class="form-control"></label>
                                </div>

                                <div class="form-group">
                                    <label for="jobno">Quotation Ref:No.</label>
                                    <label id="quotationfer" class="form-control">Random Quotation Ref:No. will appier Here </label>
                                </div>

                                <div class="form-group">
                                    <label for="LabelQuaDate">Date</label>
                                    <span>* </span>
                                    <input required type="date" id="quatationDate" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="LabelUploadQua">Upload Quotation</label>
                                    <input type="file" id="quatationUpload" required>
                                </div>

                                <div class="form-group">
                                    <label for="LabelStatus">Status</label>
                                    <span>* </span>
                                    <select required id="quatationStatus" class="form-control custom-select">
                                        <option selected value="">-Select Status-</option>
                                        <option value="1">Pending</option>
                                        <option value="2">Done</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="LabelNotes">Notes</label>
                                    <span>* </span>
                                    <textarea id="quatationNotes" class="form-control" rows="4"></textarea>
                                </div>

                            </div>


                        </div>


                    </div>

                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <input id="btnquatationsave" type="submit" value="Save" class="btn btn-success">
                    &nbsp;&nbsp;
                           <input id="btnUpdateQuotation" type="button" value="Update" class="btn btn-warning">
                    &nbsp;&nbsp;
                    <button type="reset" class="btn btn-danger closemodelQuatation">Cancel</button>

                </div>
            </form>

            <br />

            <%--start of Quotation table--%>
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Quotation Details</h3>
                </div>

                <br />

                <div class="card-body">
                    <table id="QuotationTable" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Customer Name</th>
                                <th>Status</th>
                                <th>Notes</th>
                            <%--    <th>Edit</th>--%>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr>
                                <th>Date</th>
                                <th>Customer Name</th>
                                <th>Status</th>
                                <th>Notes</th>
                           <%--     <th>Edit</th>--%>
                                <th>Delete</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>

            </div>
            <%--     end of Quotation table--%>
        </div>

    </div>
    <%--End of Quotation Modal--%>








        
    <%--Start of Quotation Delete Model--%>

    <div id="myModalQuotationDelete" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclose" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                <br />
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">

                            <div class="card-header">
                                <h3 class="card-title">Delete - Quotation</h3>
                            </div>

                            <div class="card-body">
                                <div id="frmSeasonsQuotation" data-parsley-validate="" class="form-horizontal form-label-left">
                                    <input type="hidden" id="txtQuotation" />


                                    <div class="form-group ">
                                        <label for="selectcustomerid">
                                            Customer Name <span class="required">:</span>
                                        </label>
                                        <label id="selectQuotationcustomeridpopup" class="form-control"></label>
                                    </div>

                               
                                    <div class="form-group ">
                                        <label for="selectQuodate">
                                            Date <span class="required">:</span>
                                        </label>
                                        <label id="selectQuotationdatepopup" class="form-control"></label>
                                    </div>

                                    
                                    <div class="form-group ">
                                        <label for="selectQuostatus">
                                            Status <span class="required">:</span>
                                        </label>
                                        <label id="selectQuotationstatuspopup" class="form-control"></label>
                                    </div>

                                    
                                    <div class="form-group ">
                                        <label for="selectQuonotes">
                                            Notes <span class="required">:</span>
                                        </label>
                                        <label id="selectQuotationnotespopup" class="form-control"></label>
                                    </div>

                                        <div class="form-group ">
                                        <label for="selectQuoref">
                                           Quotation Ref.NO <span class="required">:</span>
                                        </label>
                                        <label id="selectQuotationrefpopup" class="form-control"></label>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btnQuotationDeleteyes" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;
                   
                    <button type="button" class="btn btn-danger closemodelClose">Cancel</button>
                </div>

            </section>
        </div>

    </div>




    <%--Start of Job Model--%>

    <div id="myModalJob" class="modal">
        <div class="modal-content">
            <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclose" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>
            <br />
            <br />
            <form id="JobForm">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Job</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body">


                                <div class="form-group">
                                    <label for="customerid">Customer Name</label>
                                    <span>* </span>
                                    <label id="customerid" class="form-control"></label>
                                </div>

                                <div class="form-group">
                                    <label for="jobno">Job No.</label>
                                    <label id="jobno" class="form-control">Random Job No. will appier Here </label>
                                </div>

                                <div class="form-group">
                                    <label for="date">Date</label>
                                    <span>* </span>
                                    <input required type="date" id="jobDate" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="Notes">Notes</label>
                                    <span>* </span>
                                    <textarea id="jobNotes" class="form-control" rows="4"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="UploadJobCost">Job Cost</label>
                                    <input required type="file" id="jobCostUpload">
                                </div>

                                <br />

                                <div class="card-header">
                                    <h3 class="card-title"><b>JOB ITEMS</b></h3>
                                </div>

                                <br />

                                <div class="form-group">
                                    <label>Description</label>
                                    <span>* </span>
                                    <textarea id="jobdescription" class="form-control" rows="5"></textarea>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <input id="btnJobSave" type="submit" value="Save" class="btn btn-success">
                    &nbsp;&nbsp;
                         <input id="btnUpdateJob" type="button" value="Update" class="btn btn-warning">
                    &nbsp;&nbsp;
                    <button class="btn btn-danger closemodelJob" type="reset">Cancel</button>
                </div>

            </form>

            <br />


            <%-- Start of Job Table--%>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Job Details</h3>
                </div>

                <br />

                <div class="card-body">
                    <table id="example5" class="table table-bordered table-hover">
                        <thead>
                            <tr>

                                <th>Date</th>
                                <th>Customer Name</th>
                                <th>Job Ref No.</th>
                                <th>Notes</th>
                                <th>Description</th>
                       <%--         <th>Edit</th>--%>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr>
                                <th>Date</th>
                                <th>Customer Name</th>
                                <th>Job Ref No.</th>
                                <th>Notes</th>
                                <th>Description</th>
                        <%--        <th>Edit</th>--%>
                                <th>Delete</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>

            </div>

            <%-- End of Job Table--%>
        </div>

    </div>


    <%-- End of Job Model--%>





    <%--Start of Site Visit Model--%>
    <div id="myModalSiteVisit" class="modal">
        <div class="modal-content">
            <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclose" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>
            <br />
            <br />
            <form id="SiteVisitForm">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Site Visit</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body">

                                <input type="hidden" id="txtTransIdSiteVisit" />

                                <div class="form-group">
                                    <label for="LabelCustomeridVisit">Customer Name</label>
                                    <span>* </span>
                                    <label id="customeridvisit" class="form-control"></label>
                                </div>


                                <div class="form-group">
                                    <label for="LabelInquiryrid">Inquiry Ref No.</label>
                                    <span>* </span>
                                    <label id="inquiryrefnovisit" class="form-control"></label>
                                </div>

                                <div class="form-group">
                                    <label for="jobno">Site Visit Ref:No.</label>
                                    <label id="sitevisitfer" class="form-control">Random Quotation Site Visit Ref:No. will appier Here </label>
                                </div>


                                <div class="form-group">
                                    <label for="LabelPlant">Plant</label>
                                    <span>* </span>
                                    <select required id="plantvisit" class="form-control custom-select">
                                        <option selected value="">-Select Plant-</option>
                                        <option value="1">Plant 1</option>
                                        <option value="2">Plant 2</option>
                                        <option value="3">Plant 3</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="LabelJObDate">Date</label>
                                    <span>* </span>
                                    <input required type="date" id="SiteVisitDate" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="LabelPumps">Pumps, floaters and electrical controllers</label>
                                    <span>* </span>
                                    <textarea id="pumpsandotherdetails" class="form-control" rows="4"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="LabelTanks">Tanks and civil construction</label>
                                    <span>* </span>
                                    <textarea id="tanksandotherdetails" class="form-control" rows="4"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="LabelOthers">Quotation and other requests</label>
                                    <span>* </span>
                                    <textarea id="requestsdetails" class="form-control" rows="4"></textarea>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <input id="btnSitevisitSave" type="submit" value="Save" class="btn btn-success">
                    &nbsp;&nbsp;
                    <input id="btnUpdateSitevisit" type="button" value="Update" class="btn btn-warning">
                    &nbsp;&nbsp;
                    <button id="btnCancelSitevisit" class="btn btn-danger closemodelSitevisit" type="reset">Cancel</button>
                </div>

            </form>

            <br />

            <%--Start of Site Visit Table--%>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Site Visit Details</h3>
                </div>

                <br />

                <div class="card-body">
                    <table id="example6" class="table table-bordered table-hover">

                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Customer Name</th>
                                <th>Pumps, floaters and electrical controllers</th>
                                <th>Tanks and civil construction</th>
                                <th>Quotation and other requests</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>

                        <tbody></tbody>

                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Customer Name</th>
                                <th>Pumps, floaters and electrical controllers</th>
                                <th>Tanks and civil construction</th>
                                <th>Quotation and other requests</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>


                    </table>
                </div>

            </div>

            <%--End of Site Visit Table--%>
        </div>

    </div>
    <%--End of Site Visit Model--%>


        <%--Start of Site Visit Delete Model--%>

    <div id="myModalSiteVisitDelete" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclose" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                <br />
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">

                            <div class="card-header">
                                <h3 class="card-title">Delete - SiteVisit</h3>
                            </div>

                            <div class="card-body">
                                <div id="frmSitevisit" data-parsley-validate="" class="form-horizontal form-label-left">
                                    <input type="hidden" id="txtSiteVisit" />

                                    <div class="form-group ">
                                        <label for="selectSitvisDate">
                                            Date <span class="required">:</span>
                                        </label>
                                        <label id="selectsitvistdate" class="form-control"></label>
                                    </div>

                                    
                                    <div class="form-group ">
                                        <label for="selectsitvistpumpu">
                                            Pumps, floaters and electrical controllers <span class="required">:</span>
                                        </label>
                                        <label id="selectsitvistpumppopup" class="form-control"></label>
                                    </div>

                                    
                                    <div class="form-group ">
                                        <label for="selectsitvisttank">
                                            Tanks and civil construction <span class="required">:</span>
                                        </label>
                                        <label id="selectsitvisttankpopup" class="form-control"></label>
                                    </div>

                                    <div class="form-group ">
                                        <label for="selectsitvistothers">
                                            Quotation and other requests  <span class="required">:</span>
                                        </label>
                                        <label id="selectsitvistotherspopup" class="form-control"></label>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btnSiteVisitDeleteyes" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;
                   
                    <button type="button" class="btn btn-danger closemodelClose">Cancel</button>
                </div>

            </section>
        </div>

    </div>

      <%--End of Site Visit Delete Model--%>


    <script>

        $(document).ready(function () {
            loadgrid();
            loadcusname();
        });


        $(".closemodelJob").click(function () {
            $("#myModalJob").modal('toggle');
        });

        $(".closemodelQuatation").click(function () {
            $("#myModalQuatation").modal('toggle');
        });

        $(".closemodelSitevisit").click(function () {
            $("#myModalSiteVisit").modal('toggle');
        });

        $(".closemodelClose").click(function () {
            $("#myModal").modal('toggle');
        });

        $("#btnUpdate").click(function () {

            $("#btnCancel").removeAttr('disabled');
            $("#btnUpdate").removeAttr('disabled');
        });

        $("#btnCancel").click(function () {

            $("#btnSubmit").removeAttr('disabled');
            $("#btnEdit").removeAttr('disabled');
        });

        $("#btnUpdateSitevisit").click(function () {

            $("#btnCancelSitevisit").removeAttr('disabled');
            $("#btnUpdateSitevisit").removeAttr('disabled');
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

            $('#example6').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });


        $(function () {

            $('#example5').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });


        $(function () {

            $('#QuotationTable').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });


        var ID = 0;
        var delID = 1;
        var quaID = 0;
        var jobID = 0;
        var sitevisitID = 0;
        var quaIDedit = 0;
        var sitevisitIDedit = 0;
        var sitevisitIDloadtable = 0;
        var quotationIDloadtable = 0;
        var jobIDloadtable = 0;
        var delQuotationID = 0;
        var delSiteVisitID = 0;



        function loadcusname() {
            var selectcustomerid = $('#selectcustomerid');
            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/GetCustomerNames',
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



         <%--Load the Datatable on Mainpage--%>
        function loadgrid() {

            $("#btncancel").removeAttr('disabled');
            $("#btnsubmit").removeAttr('disabled');

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/Gridchange',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    $("#tblinquirylist tbody").empty();

                    var myData = JSON.parse(response.d)
                    if (myData == "") {
                        return;
                    }

                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {

                        var Date = myData[i].date;
                        var newdate = Date.replace('T00:00:00', ' ');

                        tr.push('<tr>')
                        tr.push("<td>" + myData[i].type + "</td>");
                        tr.push("<td>" + myData[i].contact_no + "</td>");
                        tr.push("<td>" + myData[i].email + "</td>");
                        tr.push("<td>" + newdate + "</td>");
                        tr.push("<td>" + myData[i].time + "</td>");
                        tr.push("<td>" + myData[i].name + "</td>");
                        tr.push("<td>" + myData[i].inquiry + "</td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"updateFunction('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"closepopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnQuatation\" type=\"button\" onclick=\"SaveQuatationpopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-money-bill-wave\" ></i> </a></td>");
                        tr.push("<td><a id=\"btnSitevisit\" type=\"button\" onclick=\"sitevisitpopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fas fa-industry\" ></i> </a></td>");
                        tr.push("<td><a id=\"btnJob\" type=\"button\" onclick=\"jobpopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-business-time\" ></i> </a></td>");
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


        //start of search records and gride change 

        $("#searchbtn").click(function () {

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/SearchGridchange',
                dataType: 'json',
                data: '{"type":"' + $("#searchtype").val() + '" }',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                    $("#tblinquirylist tbody").empty();

                    var myData = JSON.parse(response.d)
                    if (myData == "") {
                        return;
                    }

                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {


                        var customerid = myData[i].customer_id;

                        switch (customerid) {
                            case 1:
                                customerid = "Abans-Seeduwa";
                                break;
                            case 2:
                                customerid = "Brandix-Girithale";
                                break;
                            case 3:
                                customerid = "Brandix-Minuwangoda";
                                break;
                            case 4:
                                customerid = "Crown City-Seeduwa";
                                break;
                            default:
                        }

                        var Date = myData[i].date;
                        var newdate = Date.replace('T00:00:00', ' ');

                        tr.push('<tr>')
                        tr.push("<td>" + myData[i].type + "</td>");
                        tr.push("<td>" + myData[i].contact_no + "</td>");
                        tr.push("<td>" + myData[i].email + "</td>");
                        tr.push("<td>" + newdate + "</td>");
                        tr.push("<td>" + myData[i].time + "</td>");
                        tr.push("<td>" + customerid + "</td>");
                        tr.push("<td>" + myData[i].inquiry + "</td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"updateFunction('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"closepopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnQuatation\" type=\"button\" onclick=\"SaveQuatationpopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-money-bill-wave\" ></i> </a></td>");
                        tr.push("<td><a id=\"btnSitevisit\" type=\"button\" onclick=\"sitevisitpopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fas fa-industry\" ></i> </a></td>");
                        tr.push("<td><a id=\"btnJob\" type=\"button\" onclick=\"jobpopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-business-time\" ></i> </a></td>");
                        tr.push('</tr>');
                    }

                    $("#tblinquirylist tbody").empty();
                    $('#tblinquirylist').append($(tr.join('')));


                },
                error: function (error) {

                    console.log(error);

                }
            });

        });

        //end of search records and gride change 


         <%--Pass data to Inq form on Edit--%>
        function updateFunction(id) {
            ID = id;

            $("html").scrollTop(0)

            $("#btnSubmit").attr('disabled', 'disabled');
            $("#btnUpdate").removeAttr('disabled');

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/GetInquirydtl',
                dataType: 'json',
                data: '{"id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    var now = new Date(myData[0]["date"]);

                    var day = ("0" + now.getDate()).slice(-2);
                    var month = ("0" + (now.getMonth() + 1)).slice(-2);
                    var newdate = now.getFullYear() + "-" + (month) + "-" + (day);

                    document.getElementById("date").valueAsDate = new Date(newdate);


                    $('#selecttype').val(myData[0]["type"]);
                    $('#txtcontactnumber').val(myData[0]["contact_no"]);
                    $('#txtemail').val(myData[0]["email"]);
                    $('#time').val(myData[0]["time"]);
                    $('#selectcustomerid').val(myData[0]["customer_id"]);
                    $('#txtinquiry').val(myData[0]["inquiry"]);
                },
                error: function (error) {
                    console.log(error);
                }
            });

        }


          <%-- Save Inquiry --%>

        $("#maninform").on('submit', function (e) {
            e.preventDefault();
            $("#selecttype").attr('contenteditable', false);
            $("#txtcontactnumber").attr('contenteditable', false);
            $("#txtemail").attr('contenteditable', false);
            $("#date").attr('contenteditable', false);
            $("#time").attr('contenteditable', false);
            $("#selectcustomerid").attr('contenteditable', false);
            $("#txtinquiry").attr('contenteditable', false);

            $("#btncancel").removeAttr('disabled');
            $("#btnsubmit").removeAttr('disabled');



            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/SaveInquiry',
                dataType: 'json',
                data: '{"type":"' + $("#selecttype").val() + '","contact_no":"' + $("#txtcontactnumber").val() + '","email":"' + $("#txtemail").val() + '","date":"' + $("#date").val() + '","time":"' + $("#time").val() + '","customer_id":"' + $("#selectcustomerid").val() + '","inquiry":"' + $("#txtinquiry").val() + '" }',
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

            $('#maninform')[0].reset();
        });


          <%-- Update Inquiry --%>

        $(function () {

            $("#btnUpdate").click(function () {

                var type = $("#selecttype").val();
                var contactno = $("#txtcontactnumber").val();
                var email = $("#txtemail").val();
                var date = $("#date").val();
                var time = $("#time").val();
                var customerid = $("#selectcustomerid").val();
                var inquiry = $("#txtinquiry").val();


                if (type.trim() == "") {
                    swal("Service Type Required!");
                    return;
                } else if (contactno.trim() == "" || contactno == null) {
                    swal("Contact Number required!");
                    return;
                } else if (email.trim() == "" || email == null) {
                    swal("Email Required!");
                    return;
                } else if (date.trim() == "" || date == null) {
                    swal("Date required!");
                    return;
                } else if (time.trim() == "" || time == null) {
                    swal("Time required!");
                    return;
                } else if (customerid.trim() == "") {
                    swal("Customer Name Required!");
                    return;
                } else if (inquiry.trim() == "" || inquiry == null) {
                    swal("Inquiry required!");
                    return;
                } else {



                    $.ajax({
                        type: 'POST',
                        url: 'InquiryList.aspx/UpdateInquiry',
                        dataType: 'json',
                        data: '{"type":"' + $("#selecttype").val() + '","contact_no":"' + $("#txtcontactnumber").val() + '","email":"' + $("#txtemail").val() + '","date":"' + $("#date").val() + '","time":"' + $("#time").val() + '","customer_id":"' + $("#selectcustomerid").val() + '","inquiry":"' + $("#txtinquiry").val() + '","id":"' + ID + '" }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var myData = JSON.parse(response.d)
                            loadgrid();
                            swal("Success", "Data Has Been Updated Successfully!", "success");


                            $('#selecttype').val("");
                            $('#txtcontactnumber').val("");
                            $('#txtemail').val("");
                            $('#date').val("");
                            $('#time').val("");
                            $('#selectcustomerid').val("");
                            $('#txtinquiry').val("");


                        },

                        error: function (error) {
                            console.log(error);
                        }

                    });
                }


            });
        });

          <%-- Pass Data to Close Inquiry Model --%>
        function closepopupfunc(id) {
            delID = id;

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/GetInquirydtl',
                dataType: 'json',
                data: '{"id":"' + delID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModal").modal('show');

                    var Date = myData[0]["date"];
                    var newdate = Date.replace('T00:00:00', ' ');

                    $('#selecttypepopup').html(myData[0]["type"]);
                    $('#contactnumberpopup').html(myData[0]["contact_no"]);
                    $('#txtemailpopup').html(myData[0]["email"]);
                    $('#datepopup').html(newdate);
                    $('#timepopup').html(myData[0]["time"]);
                    $('#selectcustomeridpopup').html(myData[0]["name"]);
                    $('#inquirypopup').html(myData[0]["inquiry"]);

                },
                error: function (error) {
                    console.log(error);
                }
            });
        }


          <%-- Close Inquiry --%>

        $(function () {

            $("#btncloseyes").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'InquiryList.aspx/popupclose',
                    dataType: 'json',
                    data: '{"id":"' + delID + '" }',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)
                        loadgrid();

                        $("#myModal").modal('toggle');
                        swal("Success", "Record Has Been Closed Successfully!", "success");

                    },

                    error: function (error) {
                        console.log(error);
                    }

                });

            });

        });


         <%-- Pass Data to Save Quatation Model --%>

        function SaveQuatationpopupfunc(id) {
            quaID = id;

            Quotationloadgrid(id);

            $('#quatationUpload').val("");

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/GetInquirydtl',
                dataType: 'json',
                data: '{"id":"' + quaID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModalQuatation").modal('show');

                    sessionStorage.setItem('inqidfrmtablewhnclickquatation', myData[0].id);
                    sessionStorage.setItem('uidfrmtablewhnclickquatation', myData[0].customer_id);

                    $('#customeridpopupqua').html(myData[0]["name"]);

                    $('#inqrefnoinquatation').html(myData[0]["inq_refno"]);

                },
                error: function (error) {
                    console.log(error);
                }
            });

        }

          <%-- Save Quatation --%>

        $("#QuatatioForm").on('submit', function (e) {
            e.preventDefault();

            $("#btnquatationsave").removeAttr('disabled');

            var uid = sessionStorage.getItem('uidfrmtablewhnclickquatation');
            var qid = sessionStorage.getItem('inqidfrmtablewhnclickquatation');


            var fileUpload = $("#quatationUpload").get(0);
            var files = fileUpload.files;
            var test = new FormData();

            for (var i = 0; i < files.length; i++) {
                test.append(files[i].name, files[i]);
            }

            $.ajax({
                url: "UploadHandler.ashx",
                type: "POST",
                contentType: false,
                processData: false,
                data: test,
                success: function (result) {

                    var imgSavedPath = result.replace(/\\/g, "\\\\");
                    console.log(imgSavedPath);

                    $.ajax({
                        type: 'POST',
                        url: 'InquiryList.aspx/SaveQuotation',
                        dataType: 'json',
                        data: '{"customer_id":"' + uid + '","quotationdate":"' + $("#quatationDate").val() + '" , "quatationSavedPath":"' + imgSavedPath + '" , "qid":"' + qid + '" , "status":"' + $("#quatationStatus").val() + '","notes":"' + $("#quatationNotes").val() + '" }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var myData = JSON.parse(response.d)

                            $('#customeridpopupqua').text("");
                            $('#quatationDate').val("");
                            $('#quatationStatus').val("");
                            $('#quatationNotes').val("");

                            $("#myModalQuatation").modal('toggle');
                            console.log(myData);

                            swal("Success", "Quatation Has Been Saved Successfully!", "success");

                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });

                },
                error: function (err) {
                    swal("Error", "File Upload Failed", "error");
                }
            });

        });


                  <%-- Load Quotation Data Table --%>

        function Quotationloadgrid(id) {

            quotationIDloadtable = id;

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/QuotaionGridchange',
                data: '{"id":"' + quotationIDloadtable + '"}',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    $("#QuotationTable tbody").empty();

                    var myData = JSON.parse(response.d)
                    if (myData == "") {
                        return;
                    }


                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {


                        var selectQuoStatus = myData[i].status;

                        if (selectQuoStatus == 1) {
                            selectQuoStatus = "Pending"
                        } else {
                            selectQuoStatus = "Done"
                        }

                        var date1 = myData[i].quotationdate;
                        var date2 = date1.replace('T00:00:00', ' ');

                        tr.push('<tr>')
                        tr.push("<td>" + date2 + "</td>");
                        tr.push("<td>" + myData[i].name + "</td>");
                        tr.push("<td>" + selectQuoStatus + "</td>");
                        tr.push("<td>" + myData[i].notes + "</td>");
                        //tr.push("<td><a id=\"btnEditQuotaion\" type=\"button\"  onclick=\"updateFunctionQuotaion('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnCloseQuotaion\" type=\"button\" onclick=\"deletePopupfuncQuotaion('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
                        tr.push('</tr>');

                    }

                    $("#QuotationTable tbody").empty();
                    $('#QuotationTable').append($(tr.join('')));

                },
                error: function (error) {

                    console.log(error);

                }
            });
        }


                 <%--Pass data to Quotation form on Edit--%>
        //function updateFunctionQuotaion(id) {
        //    quaIDedit = id;

        //    SaveQuatationpopupfunc(id);


        //    $("html").scrollTop(0)

        //    $("#btnquatationsave").attr('disabled', 'disabled');
        //    $("#btnUpdateQuotation").removeAttr('disabled');

        //    $.ajax({
        //        type: 'POST',
        //        url: 'InquiryList.aspx/GetQuotaiondtl',
        //        dataType: 'json',
        //        data: '{"id":"' + quaIDedit + '"}',
        //        contentType: 'application/json; charset=utf-8',
        //        success: function (response) {

        //            var myData = JSON.parse(response.d)



        //            $('#quatationDate').val(myData[0]["quotationdate"]);
        //            $('#quatationStatus').val(myData[0]["status"]);
        //            $('#quatationNotes').val(myData[0]["notes"]);





        //        },
        //        error: function (error) {
        //            console.log(error);
        //        }
        //    });

        //}



                          <%-- Pass Data to Delete Quotation Model --%>
        function deletePopupfuncQuotaion(id) {
            delQuotationID = id;

          

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/GetQuotaiondtl',
                dataType: 'json',
                data: '{"id":"' + delQuotationID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)
                    
                   
                    $("#myModalQuotationDelete").modal('show');
                   
                    var Date = myData[0]["quotationdate"];
                    var newdate = Date.replace('T00:00:00', ' ');

                    var selectQuoStatus = myData[0]["status"];

                    if (selectQuoStatus == 1) {
                        selectQuoStatus = "Pending"
                    } else{
                        selectQuoStatus = "Done"
                    }

                    $('#selectQuotationcustomeridpopup').html(myData[0]["name"]);
                    $('#selectQuotationdatepopup').html(newdate);
                    $('#selectQuotationstatuspopup').html(selectQuoStatus);
                    //$('#selectQuotationdatepopup').html(myData[0]["quotationdate"]);
                    //$('#selectQuotationstatuspopup').html(myData[0]["status"]);
                    $('#selectQuotationnotespopup').html(myData[0]["notes"]);
                    $('#selectQuotationrefpopup').html(myData[0]["quatation_refno"]);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }





                          <%-- Delete Yes Quotation --%>

        $(function () {

            $("#btnQuotationDeleteyes").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'InquiryList.aspx/QuotaionPopupDelete',
                    dataType: 'json',
                    data: '{"id":"' + delQuotationID + '" }',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)
                     
                        $("#myModalQuotationDelete").modal('toggle');

                        $("#myModalQuatation").modal('toggle');
                      
                        swal("Success", "Record Has Been Deleted Successfully!", "success");

                    },

                    error: function (error) {
                        console.log(error);
                    }

                });

            });

        });







          <%-- Pass Data to Job Model --%>

        function jobpopupfunc(id) {

            Jobloadgrid(id);

            jobID = id;

            $('#jobCostUpload').val("");

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/GetInquirydtl',
                dataType: 'json',
                data: '{"id":"' + jobID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)


                    $("#myModalJob").modal('show');

                    sessionStorage.setItem('inqIdFrmTableWhnClickJob', myData[0].id);
                    sessionStorage.setItem('uidFrmTableWhnClickJob', myData[0].customer_id);

                    $('#customerid').html(myData[0]["name"]);
                },
                error: function (error) {
                    console.log(error);
                }
            });

        }

          <%-- Save Job data --%>

        $("#JobForm").on('submit', function (e) {
            e.preventDefault();

            $("#btnJobSave").removeAttr('disabled');

            var uid = sessionStorage.getItem('uidFrmTableWhnClickJob');
            var qid = sessionStorage.getItem('inqIdFrmTableWhnClickJob');


            var fileUpload = $("#jobCostUpload").get(0);
            var files = fileUpload.files;
            var test = new FormData();

            for (var i = 0; i < files.length; i++) {
                test.append(files[i].name, files[i]);
            }


            $.ajax({
                url: "UploadHandlerJob.ashx",
                type: "POST",
                contentType: false,
                processData: false,
                data: test,
                success: function (result) {

                    var jobcostsheet = result.replace(/\\/g, "\\\\");
                    console.log(jobcostsheet);

                    var uid = sessionStorage.getItem('uidFrmTableWhnClickJob');
                    var qid = sessionStorage.getItem('inqIdFrmTableWhnClickJob');


                    $.ajax({
                        type: 'POST',
                        url: 'InquiryList.aspx/SaveJob',
                        dataType: 'json',
                        data: '{"jobdate":"' + $("#jobDate").val() + '", "jobcostsheet":"' + jobcostsheet + '" , "customer_id":"' + uid + '" ,"notes":"' + $("#jobNotes").val() + '","discription":"' + $("#jobdescription").val() + '", "qid":"' + qid + '" }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var myData = JSON.parse(response.d)

                            $('#jobDate').val("");
                            $('#jobNotes').val("");


                            $('#jobdescription').val("");
                            $('#customerid').text("");


                            $("#myModalJob").modal('toggle');
                            console.log(myData);

                            swal("Success", "Site Visit Has Been Saved Successfully!", "success");

                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });

                },
                error: function (err) {
                    swal("Error", "File Upload Failed", "error");
                }
            });

            //$('#JobForm')[0].reset();

        });


          <%-- Load Job Data Table --%>

        function Jobloadgrid(id) {

            jobIDloadtable = id;

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/JobGridchange',
                data: '{"id":"' + jobIDloadtable + '"}',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    $("#example5 tbody").empty();

                    var myData = JSON.parse(response.d)
                    if (myData == "") {
                        return;
                    }

                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {


                        var date1 = myData[i].jobdate;
                        var date2 = date1.replace('T00:00:00', ' ');

                        tr.push('<tr>')
                        tr.push("<td>" + date2 + "</td>");
                        tr.push("<td>" + myData[i].name + "</td>");
                        tr.push("<td>" + myData[i].jobrefno + "</td>");
                        tr.push("<td>" + myData[i].notes + "</td>");
                        tr.push("<td>" + myData[i].discription + "</td>");
                        //tr.push("<td><a id=\"btnEditJob\" type=\"button\"  onclick=\"updateFunctionJob('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnCloseJob\" type=\"button\" onclick=\"closepopupfuncJob('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
                        tr.push('</tr>');

                    }

                    $("#example5 tbody").empty();
                    $('#example5').append($(tr.join('')));

                },
                error: function (error) {

                    console.log(error);

                }
            });
        }

          <%-- Pass Data to Site Visit Model --%>

        function sitevisitpopupfunc(id) {

            SiteVisitloadgrid(id);

            sitevisitID = id;

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/GetInquirydtl',
                dataType: 'json',
                data: '{"id":"' + sitevisitID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

               

                    $("#myModalSiteVisit").modal('show');

                    sessionStorage.setItem('inqidfrmtablewhnclicksitevisit', myData[0].id);
                    sessionStorage.setItem('uidfrmtablewhnclickqsitevisit', myData[0].customer_id);

                    $('#customeridvisit').html(myData[0]["name"]);

                    $('#inquiryrefnovisit').html(myData[0]["inq_refno"]);

                },
                error: function (error) {
                    console.log(error);
                }
            });

        }

          <%-- Save Site Visit Data --%>

        $("#SiteVisitForm").on('submit', function (e) {
            e.preventDefault();

            $("#btnSitevisitSave").removeAttr('disabled');

            var uid = sessionStorage.getItem('uidfrmtablewhnclickqsitevisit');
            var qid = sessionStorage.getItem('inqidfrmtablewhnclicksitevisit');

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/SaveSitevisit',
                dataType: 'json',
                data: '{"customer_id":"' + uid + '","plant_id":"' + $("#plantvisit").val() + '","sitevisitdate":"' + $("#SiteVisitDate").val() + '", "qid":"' + qid + '","pumps":"' + $("#pumpsandotherdetails").val() + '","tanks":"' + $("#tanksandotherdetails").val() + '","others":"' + $("#requestsdetails").val() + '" }',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $('#customeridvisit').text("");
                    $('#pumpsandotherdetails').val("");
                    $('#tanksandotherdetails').val("");
                    $('#requestsdetails').val("");
                    $('#plantvisit').val("");
                    $('#SiteVisitDate').val("");

                    $("#myModalSiteVisit").modal('toggle');
                    console.log(myData);

                    swal("Success", "Site Visit Has Been Saved Successfully!", "success");

                },
                error: function (error) {
                    swal("Error", "File Upload Failed", "error");
                    console.log(error);
                }

            });

        });

         <%-- Load Site Visit Data Table --%>

        function SiteVisitloadgrid(id) {

            sitevisitIDloadtable = id;

            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/SiteVisitGridchange',
                data: '{"id":"' + sitevisitIDloadtable + '"}',
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

                        var date1 = myData[i].sitevisitdate;
                        var date2 = date1.replace('T00:00:00', ' ');

                        tr.push('<tr>')
                        tr.push("<td>" + date2 + "</td>");
                        tr.push("<td>" + myData[i].name + "</td>");
                        tr.push("<td>" + myData[i].pumps + "</td>");
                        tr.push("<td>" + myData[i].tanks + "</td>");
                        tr.push("<td>" + myData[i].others + "</td>");
                        tr.push("<td><a id=\"btnEditSiteVisit\" type=\"button\"  onclick=\"updateFunctionSiteVisit('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnDeleteSiteVisit\" type=\"button\" onclick=\"deletePopupfuncSiteVisit('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
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




      <%--Pass data to Site visit form on Edit--%>

        function updateFunctionSiteVisit(id) {

            sitevisitIDedit = id;

            //$('myModalSiteVisit').scrollTop(0);

            $("#btnSitevisitSave").attr('disabled', 'disabled');
            $("#btnUpdateSitevisit").removeAttr('disabled');


            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/GetSitevisitdtl',
                dataType: 'json',
                data: '{"id":"' + sitevisitIDedit + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)


                    var now = new Date(myData[0]["sitevisitdate"]);

                    var day = ("0" + now.getDate()).slice(-2);
                    var month = ("0" + (now.getMonth() + 1)).slice(-2);
                    var newdate = now.getFullYear() + "-" + (month) + "-" + (day);

                    document.getElementById("SiteVisitDate").valueAsDate = new Date(newdate);


                    $('#pumpsandotherdetails').val(myData[0]["pumps"]);
                    $('#tanksandotherdetails').val(myData[0]["tanks"]);
                    $('#requestsdetails').val(myData[0]["others"]);
                    $('#plantvisit').val(myData[0]["plant_id"]);

                },
                error: function (error) {
                    console.log(error);
                }
            });

        }

                  <%-- Update Sitevisit --%>

        $(function () {

            $("#btnUpdateSitevisit").click(function () {

                var date = $('#SiteVisitDate').val();
                var pumps = $('#pumpsandotherdetails').val();
                var tanks = $('#tanksandotherdetails').val();
                var others = $('#requestsdetails').val();
                var plant = $('#plantvisit').val();


                if (date.trim() == "" || date == null) {
                    swal("Date Required!");
                    return;
                } else if (pumps.trim() == "" || pumps == null) {
                    swal("Pumps, floaters and electrical controllers required!");
                    return;
                } else if (tanks.trim() == "" || tanks == null) {
                    swal("Tanks and civil construction Required!");
                    return;
                } else if (others.trim() == "" || others == null) {
                    swal("Quotation and other requests required!");
                    return;
                } else if (plant.trim() == "") {
                    swal("Plant required!");
                    return;
                } else {



                $.ajax({
                    type: 'POST',
                    url: 'InquiryList.aspx/UpdateSitevisit',
                    dataType: 'json',
                    data: '{"sitevisitdate":"' + $("#SiteVisitDate").val() + '","pumps":"' + $("#pumpsandotherdetails").val() + '","tanks":"' + $("#tanksandotherdetails").val() + '","others":"' + $("#requestsdetails").val() + '","plant_id":"' + $("#plantvisit").val() + '","id":"' + sitevisitIDedit + '" }',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)

                        swal("Success", "Data Has Been Updated Successfully!", "success");


                        $('#SiteVisitDate').val("");
                        $('#pumpsandotherdetails').val("");
                        $('#tanksandotherdetails').val("");
                        $('#requestsdetails').val("");
                        $('#plantvisit').val("");

                        $("#myModalSiteVisit").modal('toggle');

                        swal("Success", "Site Visit Has Been Updated Successfully!", "success");

                    },

                    error: function (error) {
                        console.log(error);
                    }

                });
                }


            });
        });



                          <%-- Pass Data to Delete Site Visit Model --%>
        function deletePopupfuncSiteVisit(id) {
            delSiteVisitID = id;



            $.ajax({
                type: 'POST',
                url: 'InquiryList.aspx/GetSiteVisitdtl',
                dataType: 'json',
                data: '{"id":"' + delSiteVisitID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)


                    $("#myModalSiteVisitDelete").modal('show');

             

                    var Date = myData[0]["sitevisitdate"];
                    var newdate = Date.replace('T00:00:00', ' ');
 
                    $('#selectsitvistdate').html(newdate);
                    $('#selectsitvistpumppopup').html(myData[0]["pumps"]);
                    $('#selectsitvisttankpopup').html(myData[0]["tanks"]);
                    $('#selectsitvistotherspopup').html(myData[0]["others"]);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }


                                  <%-- Delete Yes Site Visit --%>

        $(function () {

            $("#btnSiteVisitDeleteyes").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'InquiryList.aspx/SiteVisitPopupDelete',
                    dataType: 'json',
                    data: '{"id":"' + delSiteVisitID + '" }',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)

                        $("#myModalSiteVisitDelete").modal('toggle');

                        $("#myModalSiteVisit").modal('toggle');

                        swal("Success", "Record Has Been Deleted Successfully!", "success");

                    },

                    error: function (error) {
                        console.log(error);
                    }

                });

            });

        });
















    </script>


</asp:Content>
