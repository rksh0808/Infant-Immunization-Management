<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Infant Immunization Management</title>
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous">   </script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <link href="css/Custome.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container ">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle " data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
                                class="icon-bar"></span><span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx"><span>
                            <img src="icons/vaccines.png" alt="MyEShoppoing" height="30" /></span>Infant Immunization Management
                        </a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="Default.aspx">Home</a> </li>
                            <li><a href="About.aspx">About</a> </li>
                            <%--<li><a href="#">Contact US</a> </li>--%>
                            <%--<li><a href="#">Blog-</a> </li>--%>
                            <li class="drodown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b
                                class="caret"></b></a>
                                <ul class="dropdown-menu ">
                                    <li><a href="Products.aspx">All Products</a></li>
                                    <li role="separator" class="divider "></li>
                                    <li><a href="Pregnant.aspx">For Pregnant Women</a></li>
                                    <li><a href="Infants.aspx">Infants</a></li>
                                    <li><a href="Child.aspx">Children</a></li>
                                    <li role="separator" class="divider "></li>
                                </ul>
                            </li>
                            <li>
                                <button id="btnCart" class="btn btn-primary navbar-btn " type="button">
                                    Cart <span class="badge " id="pCount" runat="server"></span>
                                </button>
                            </li>
                            <li id="btnSignUP" runat="server"><a href="SignUp.aspx">SignUp</a> </li>
                            <li id="btnSignIN" runat="server"><a href="SignIn.aspx">SignIn</a> </li>
                            <li>
                                <asp:Button ID="btnlogout" CssClass="btn btn-default navbar-btn " runat="server"
                                    Text="Sign Out" OnClick="btnlogout_Click" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!---image slider---->
            <div class="container">
                <h2>Carousel Example</h2>
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="ImgSlider/11.png" alt="Los Angeles" style="width: 100%;">
                            <div class="carousel-caption">
                                <p>
                                    <a class="btn btn-lg btn-primary" href="Products.aspx" role="button">Buy Now</a>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="ImgSlider/22.png" alt="Chicago" style="width: 100%;">
                            <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                            <img src="ImgSlider/33.png" alt="New york" style="width: 100%;">
                            <div class="carousel-caption">
                            </div>
                        </div>
                    </div>
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span><span class="sr-only">Previous</span> </a><a class="right carousel-control"
                        href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span><span class="sr-only">Next</span> </a>
                </div>
            </div>
            <!---image slider End---->
        </div>
        <!---Middle COntents start---->
        <hr />
        <div class="container center ">
            <div class="row ">
                <div class="col-lg-4">
                    <img class="img-circle " src="Images/mom.png" alt="thumb" width="140" height="140" />
                    <h2>Care for Mom</h2>
                    <p>
                        Vaccines are need for Pregnant mothers for welfare of both....
                    </p>
                    <p>
                        <a class="btn btn-default " href="#" role="button">View More &raquo;</a>
                    </p>
                </div>
                <div class="col-lg-4">
                    <img class="img-circle " src="Images/baby-boy.png" alt="thumb" width="140" height="140" />
                    <h2>Care for New Born</h2>
                    <p>
                        Vaccines are need for babies for their well being and security for their....
                    </p>
                    <p>
                        <a class="btn btn-default " href="#" role="button">View More &raquo;</a>
                    </p>
                </div>
                <div class="col-lg-4">
                    <img class="img-circle " src="Images/children.png" alt="thumb" width="140" height="140" />
                    <h2>Care for Young Child</h2>
                    <p>
                        Vaccines are need for Children reaching puberty to keep them healthy and....
                    </p>
                    <p>
                        <a class="btn btn-default " href="#" role="button">View More &raquo;</a>
                    </p>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    BLACK FRIDAY DEAL
                </div>
                <div class="panel-body">
                    <div class="row" style="padding-top: 50px">
                        <asp:Repeater ID="rptrProducts" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-3 col-md-3">
                                    <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                                        <div class="thumbnail">
                                            <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>"
                                                alt="<%# Eval("ImageName") %>" />
                                            <div class="caption">
                                                <div class="probrand">
                                                    <%# Eval ("BrandName") %>
                                                </div>
                                                <div class="proName">
                                                    <%# Eval ("PName") %>
                                                </div>
                                                <div class="proPrice">
                                                    <span class="proOgPrice">
                                                        <%# Eval ("PPrice","{0:0,00}") %>
                                                    </span>
                                                    <%# Eval ("PSelPrice","{0:c}") %>
                                                    <span class="proPriceDiscount">(<%# Eval("DiscAmount","{0:0,00}") %>
                                                    off) </span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="panel-footer">
                    50% Off on All Vaccines
                </div>
            </div>
        </div>
        <!---Middle COntents End---->
        <!---Footer COntents Start here---->
        <hr />
        <footer>
            <div class="container ">

                <p class="pull-right "><a href="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                <p>&copy;2022 RK<sup>2</sup> Company Pvt.Ltd. &middot; <a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot;<a href="#">Products</a> </p>
            </div>

        </footer>
        <!---Footer COntents End---->
    </form>
</body>
</html>
