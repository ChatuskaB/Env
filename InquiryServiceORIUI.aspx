<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InquiryService.aspx.cs" Inherits="Enviro.InquiryService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <header>
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
        <form>

            <!-- Main content -->
            <section class="content ">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Inquiry - Service</h3>

                                <div class="card-tools">
                                  
                                   
                                </div>
                            </div>

                            <div class="card-body">

                                <div class="form-group">
                                    <label for="inputName">Referance No.</label>
                                    <label id="inqRefNumber" class="form-control">Random Ref No. will appier Here </label>
                                </div>

                                <div class="form-group">
                                    <label for="inputStatus">Type</label>
                                    <span>* </span>
                                    <select required class="form-control custom-select" onchange="java_script_:show(this.options[this.selectedIndex].value)">
                                        <option selected disabled>Select one</option>
                                        <option id="typeService">Service</option>
                                        <option id="typeBrakedown">Brakedown</option>
                                        <option id="typeSale">Sale</option>
                                        <option id="typeModification">Modification</option>
                                    </select>
                                </div>

                                <div class="form-group" id="hiddenTypeDiv" style="display: none">
                                    <label for="inputStatus">Specify Service type</label>
                                    <span>* </span>
                                    <select required class="form-control custom-select">
                                        <option selected disabled>Select one</option>
                                        <option>Free</option>
                                        <option>One Time</option>
                                        <option>Annual</option>
                                    </select>
                                </div>



                                <div class="form-group">
                                    <label for="inputClientCompany">Contact Number</label>
                                    <span>* </span>
                                    <input required type="text" id="contactNumber" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="inputProjectLeader">E-Mail</label>
                                    <span>* </span>
                                    <input required type="text" id="email" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="inputProjectLeader">Date</label>
                                    <span>* </span>
                                    <input required type="date" id="dateService" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="inputProjectLeader">Time</label>
                                    <span>* </span>
                                    <input required type="time" id="timeService" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="inputStatus">Customer Ref Number</label>
                                    <span>* </span>
                                    <select required class="form-control custom-select">
                                        <option selected disabled>Select one</option>
                                        <option>Customer Ref 1 </option>
                                        <option>Customer Ref 2 </option>
                                        <option>Customer Ref 3 </option>
                                        <option>Customer Ref 4</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="inputDescription">Inquiry</label>
                                    <span>* </span>
                                    <textarea required id="serviceInq" class="form-control" rows="4"></textarea>
                                </div>

                            </div>
                            <!-- /.card-body -->

                        </div>
                        <!-- /.card -->

                    </div>





                </div>

                <div class="row">
                    <div class="col-12">
                        <a href="#" class="btn btn-secondary">Cancel</a>
                        <input type="submit" value="Submit" class="btn btn-success float-right">
                    </div>
                </div>

            </section>
            <!-- /.content -->
        </form>
    </div>

    <script>

        function show(aval) {
            if (aval == "Service") {
                hiddenTypeDiv.style.display = 'inline-block';
                Form.fileURL.focus();
            }
            else {
                hiddenTypeDiv.style.display = 'none';
            }
        }


        /** add active class and stay opened when selected */
        var url = window.location;

        // for sidebar menu entirely but not cover treeview
        $('ul.nav-sidebar a').filter(function () {
            return this.href == url;
        }).addClass('active');

        // for treeview
        $('ul.nav-treeview a').filter(function () {
            return this.href == url;
        }).parentsUntil(".nav-sidebar > .nav-treeview").addClass('menu-open').prev('a').addClass('active');


    </script>

</asp:Content>
