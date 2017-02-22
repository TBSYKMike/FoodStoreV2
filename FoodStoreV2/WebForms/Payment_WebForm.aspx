<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.Payment_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<script src="https://www.paypalobjects.com/api/checkout.js"></script>

    <script>
                paypal.Button.render({
                    
                    //Set environment(env) to 'sandbox' for testing with fake accounts
                    env: 'sandbox',
                    
                    //Set client ID which is generated from PayPal sandbox 'create app' where you
                    //setup the app with which email that will receive the money and then you get the
                    //client ID which you set in sandbox in this case
                    client: {
                        sandbox: 'AfOQJBlfvuJxToq4xT8xKx9vLrHYMWbYGfWhYVsG_o23b6DWaV-Kc24-835kpXasneboV8YkU5jTOzUW', //Client id

                    },
                    //Payment calls a function that initialize two vars with the env which is sandbox
                    //and the client with the client ID. Then it returns to the PayPal API to create
                    //a payment with the env and client id as paprameter. The transaction takes two values
                    
                    payment: function () {
                        var env = this.props.env;
                        var client = this.props.client;
                        return paypal.rest.payment.create(env, client, {
                            transactions: [
                                {
                                    amount: {total: '10', currency: 'SEK'}
                                }
                            ]
                        });
                    },
                    commit: true,
                    
                    //Executes the payment when the person has approved the transaction
                    onAuthorize: function (data, actions) {
                        return actions.payment.execute().then(function () {
                            window.location = "OrderFinish_WebForm.aspx";
                        });
                    }

                }, '#paypal-button');
            </script>

            <div id="paypal-button"></div>
</asp:Content>
