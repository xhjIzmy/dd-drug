<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Drug</title>
    <%@include file="quote.jsp"%>
    <style>
        .top_ul{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
        }
        .top_a{
            text-decoration: none;
            font-size: 18px;
            color: white;
            margin-left: 60px;
        }
        a{
            color: #CF5A11;
        }
        td{
            height: 30px;
        }
    </style>
    <script>
        function showNetWork() {
            var drugName = $("#drugName").val();
            var type = $('#type').val();
            window.location.href="${pageContext.request.contextPath}/drugGraph.action?drugName="+drugName+"&type="+type;
        }
    </script>
</head>
<body>
    <jsp:include page="top.jsp"/>
    <div style="width: 940px;margin: 0 auto;">
        <img id="typeImg" style="display: inline;">
        <h3 style="display: inline;margin-left: 150px;font-size: 25px;color: #C55A11;vertical-align: bottom">Search Result - ${resultDrug.drugName}</h3>
        <hr>
    </div>
    <table border="1px" align="center" style="margin-top: 20px;width: 600px">
        <tr>
            <td align="center" width="100px" style="font-weight: bold">Drug Name</td>
            <td width="300px">${resultDrug.drugBank}</td>
            <input type="hidden" value="${resultDrug.drugName}" id="drugName">
            <input type="hidden" value="${resultDrug.type}" id="type">
        </tr>
        <tr>
            <td colspan="2" style="background-color: #DEEBF7;font-weight: bold" align="center">Related Proteins</td>
        </tr>
        <c:forEach items="${resultDrug.proteins}" var="protein" varStatus="vs1">
            <tr>
                <td colspan="2" style="text-align: left"><a href="https://www.ncbi.nlm.nih.gov/gene/?term=${protein.eg_id}">${vs1.index+1}.${protein.pname}</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2"><a href="${pageContext.request.contextPath}/listProtein.action?drugName=${resultDrug.drugName}&type=${resultDrug.type}">(more......)</a></td>
        </tr>
        <tr>
            <td colspan="2" style="background-color: #DEEBF7;font-weight: bold" align="center">Metabolites</td>
        </tr>
        <c:forEach items="${resultDrug.metabolites}" var="metabolite" varStatus="vs2">
            <tr>
                <td colspan="2" align="left"><a href="http://www.hmdb.ca/metabolites/${metabolite.hmdb}">${vs2.index+1}.${metabolite.mname}</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2"><a href="${pageContext.request.contextPath}/listMe.action?drugName=${resultDrug.drugName}&type=${resultDrug.type}">(more......)</a></td>
        </tr>
        <tr>
            <td colspan="2" style="background-color: #DEEBF7;font-weight: bold" align="center">Reference(PubMed)</td>
        </tr>
        <tr>
            <td colspan="2">
                <c:forEach items="${resultDrug.references}" var="reference" varStatus="vs3">
                    <a href="https://www.ncbi.nlm.nih.gov/pubmed/?term=${reference.pmid}">${reference.pmid}</a>,
                </c:forEach><a href="${pageContext.request.contextPath}/listReference.action?drugName=${resultDrug.drugName}&type=${resultDrug.type}">(more......)</a>
            </td>
        </tr>
    </table>
    <div style="margin: 0 auto;width: 250px;margin-top: 20px">
        <input type="button" onclick="showNetWork()" style="background-image: url(${pageContext.request.contextPath}/images/ShowNetWork.png);
                width: 185px;height: 40px">
    </div>
    <div style="text-align: center;margin-top: 50px">
        <img src="${pageContext.request.contextPath}/images/bottom.png">
    </div>
<script>
    var type = $('#type').val();
    if("hepatotoxicity" == type){
        $('#typeImg').attr("src","images/Hepatotoxicity.png");
    }
    if("nephrotoxicity" == type){
        $('#typeImg').attr("src","images/Nephrotoxicity.jpg");
    }
</script>
</body>
</html>
