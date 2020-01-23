<%@ page import="com.example.demo.Model.Category" %>
<%@ page import="java.util.List" %>




<%
    List<Category>  categoryList=(List<Category>) request.getAttribute("categoryList");
%>


<div style="width: 20%;text-align : center;margin-top: 50px">
    Top Growing Community

    <div class="card" style="width: 30%;">
        <img class="card-img-top" src="..." alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
        <ul class="list-group list-group-flush">
            <%  int i=1;
                for(Category category : categoryList){%>
            <li class="list-group-item"><i class="fa fa-reddit" aria-hidden="true" style="font-size: 20px">  </i>&nbsp;&nbsp;<%=category.getSubReddit()%></li>
            <%}%>
        </ul>
    </div>

<%--    <div class="card" style="width: 30rem;">--%>
<%--        &lt;%&ndash;            <img class="card-img-top" src="..." alt="Card image cap">&ndash;%&gt;--%>
<%--        <ul class="list-group list-group-flush">--%>
<%--                <%  int i=1;--%>
<%--                    for(Category category : categoryList){%>--%>
<%--            <a href="#" id="catlist">--%>
<%--                    <li class="list-group-item"> <%=i++%>&nbsp;&nbsp;&nbsp;  <i class="fa fa-reddit" aria-hidden="true" style="font-size: 20px">  </i>&nbsp;&nbsp;<%=category.getSubReddit()%></li>--%>
<%--            </a>--%>


