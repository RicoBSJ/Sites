<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 01/05/2020
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create_Route</title>
    <link type="text/css" rel="stylesheet" href="/WEB-INF/inc/creation.css"/>
</head>
<body>
    <div id="newPlace">

            <c:import url="create_place.jsp"/>

    </div>
    <div id="newSector">
        <form method="post" action="<c:url value="/registred/create_sector"/> ">
            <fieldset>
                <legend>Créez un nouveau secteur</legend>
                <label for="placeListe">Choisissez un site</label>
                <select name="placeList" id="placeListe">
                    <c:forEach items="${ sessionScope.places }" var="listPlace">
                        <option value="${ listPlace.placeId }">${ listPlace.placeName }</option>
                    </c:forEach>
                </select>

                <c:import url="create_sector.jsp"/>
                <br />
                <input type="submit" value="Valider">
            </fieldset>
        </form>
    </div>
    <div>

</div>
    <div>

        <fieldset>

            <legend>Renseignez les différents champs selon le type de voie choisie</legend>
            <form method="post" action="<c:url value="/registred/create_route"/>" >

                    <label for="liste1" >Choisissez un site</label>
                    <select name="liste1" id="liste1" onchange="this.form.submit()" >
                        <option value="choix">Choisissez un site</option>
                        <c:forEach items="${ sessionScope.places }" var="listPlace">
                            <option value="${ listPlace.placeId }">${ listPlace.placeName }</option>
                        </c:forEach>
                    </select>
            </form>


            <select name="routeType" id="routeType" onchange="chose_route_type()">
                <option >Choisissez un type de voie</option>
                <option value="boulder">Bloc</option>
                <option value="singlePitch">Voie sportive</option>
                <option value="multiPitch">Grande voie</option>
            </select>
            <div id="boulder" style="display: none">
                <c:import url="create_boulder.jsp"/>
            </div>
            <div id="singlePitch" style="display: none">
                <c:import url="create_singlePitch.jsp"/>
            </div>
            <div id="multiPitch" style="display: none">
                <c:import url="create_multiPitch.jsp"/>
            </div>

        </fieldset>

    </div>


<script type="text/javascript">
    function chose_route_type() {

        document.getElementById("boulder").style.display="none";
        document.getElementById("singlePitch").style.display="none";
        document.getElementById("multiPitch").style.display="none";
        var choosen_route = document.getElementById("routeType").value;
        switch (choosen_route) {
            case 'boulder':
                document.getElementById("boulder").style.display="block";
                break;
            case 'singlePitch' :
                document.getElementById("singlePitch").style.display="block";
                break;
            case 'multiPitch':
                document.getElementById("multiPitch").style.display="block";
                break;
        }
    }


</script>

</body>
</html>
