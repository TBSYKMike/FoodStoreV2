<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FoodStoreV2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     
    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            max-width: 50%;
            max-height: 100%;
            margin: auto;
            transform: scale(2.41);
        }
    </style>
    <div class="col-sm-12">

        <div class="col-sm-1"></div>

        <div class="container">
            <br>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <div class="item active">
                        <img src="https://www.w3schools.com/bootstrap/img_chania.jpg" alt="Chania" width="460" height="345">
                        <div class="carousel-caption">
                            <h3>Chania</h3>
                            <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="https://www.w3schools.com/bootstrap/img_chania2.jpg" alt="Chania" width="460" height="345">
                        <div class="carousel-caption">
                            <h3>Chania</h3>
                            <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="https://www.w3schools.com/bootstrap/img_flower.jpg" alt="Flower" width="460" height="345">
                        <div class="carousel-caption">
                            <h3>Flowers</h3>
                            <p>Beatiful flowers in Kolymbari, Crete.</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="https://www.w3schools.com/bootstrap/img_flower2.jpg" alt="Flower" width="460" height="345">
                        <div class="carousel-caption">
                            <h3>Flowers</h3>
                            <p>Beatiful flowers in Kolymbari, Crete.</p>
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="col-sm-1"></div>
    </div>

    <div class="jumbotron col-sm-12">
        <h1>FoodForEveryone</h1>
        <p class="lead">FoodForEveryone is a Shop for food lovers and food haters. Haters will hate and lovers will love. 
            <br /> We welcome everyone from age of 0 to 100+.</p>
        <p><a href="https://www.facebook.com/Foodforeveryone-354846188242297/" class="btn btn-primary btn-lg">Visit Our Facebook Page &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>The Shop</h2>
            <p>
                In our shop you can find all sorts of groceries fitting for everyone! Foods from A-Z, but mostly fish and PPAP.
            </p>
            <p>
                <a class="btn btn-default" href="http://localhost:53559/WebForms/ShoppingPage_WebForm">To the Shop! &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Search</h2>
            <p>
                Our search function lets you serach for the foods you love!
            </p>
            <p>
                <a class="btn btn-default" href="http://localhost:53559/WebForms/SearchPage_WebForm">Let's Search! &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Register</h2>
            <p>
                Before you can use this site in all of it's glory you need to have an account.
            </p>
            <p>
                <a class="btn btn-default" href="http://localhost:53559/WebForms/Register_WebForm">Register me! &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
