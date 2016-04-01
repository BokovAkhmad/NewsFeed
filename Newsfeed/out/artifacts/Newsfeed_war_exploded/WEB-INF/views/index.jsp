<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" language="java" %>

<html>
<head>

</head>
<body>
<style>
    h2 {font-size: 100%;}
</style>
<h2 align="right"><a href="/">Home</a></h2>

<form:form action="search" method="POST" modelAttribute="news" name="search" onsubmit="return checkCheckBoxes(this);">
    <p align="left"><input type="text" name="string"><br>
        <input type="checkbox" name="TitleSearching" value="TitleSearching">In title<br>
        <input type="checkbox" name="DescriptionSearching" value="DescriptionSearching">In description<br>
        <input type="submit" value="Search" /></p>
</form:form>

<table align="top">
    <style>
        h1 {
            text-decoration: underline;
            font-size: 100%;
        }
    </style>

    <tr>
        <td width="50" align="top"><h1><b>Categories</b></h1></td>
    </tr>

    <a href="newsByCategory">
        <c:forEach items="${newsCategoryList}" var="newsCategory">
            <table align="top">
                <tr>
                    <td width="50" align="top"><a href="newsByCategory?category=${newsCategory.title}">${newsCategory.title}</a>

                    </td>
                    <td>
                        {<a href="deleteCategory?id=${newsCategory.id}">delete</a>}&nbsp;
                    </td>
                </tr>
            </table>
        </c:forEach>
    </a>
</table>
<tr>
    <p align="top"><a href="addCategory">Add a news category</a></p>
</tr>
<tr>
    <p align="top"><a href="addNews">Add news</a></p>
</tr>


<c:forEach items="${newsList}" var="news">

<table align="center" border="1" cellpadding="1" cellspacing="1" style="width: 1000px">
    <tbody>
    <tr>
        <td rowspan="2" style="width: 50%;"><a href="open?id=${news.id}"><h1/>${news.title}</a>&nbsp;</td>
        <td rowspan="2" style="width: 100px;"><h1>Category:<br></h1>${news.newsCategory.title}</td>
        <td rowspan="2" style="width: 100px;"><h1>Date of creation:<br></h1>${news.date}&nbsp;</td>

        <td style="width: 100px;"><a href="editNews?id=${news.id}">edit</a>&nbsp;</td>
    </tr>
    <tr>
        <td><a href="delete?id=${news.id}">delete</a>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="4" style="width: 50%; height: 100px;">${news.getIntro()}&nbsp;</td>
    </tr>
    </tbody>
</table>

<p>&nbsp;</p>
</c:forEach>




<table align="center">
    <tr>
        <c:forEach begin="1" end="${pages}" step="1" var="i">
            <td><a href="pages?page=${i}">${i}</a></td>
        </c:forEach>
    </tr>
</table>


<br><br>


<script type="text/javascript" language="JavaScript">

    function checkCheckBoxes(theForm) {
        if (theForm.TitleSearching.checked == false && theForm.DescriptionSearching.checked == false)
        {
            alert ('You must choose a search type.');
            return false;
        } else {
            return true;
        }
    }

</script>

</body>
</html>