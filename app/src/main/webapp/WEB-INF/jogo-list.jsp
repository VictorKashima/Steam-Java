<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <title>Lista de Jogos | Steam Fatec</title>
    
    <link rel="stylesheet" href="../css/main.css">
</head>

<body>

    <h1>Jogos disponíveis</h1>

    <table>
        <tr>
            <th>Id</th>
            <th>Título</th>
            <th>Ano de Lançamento</th>
            <th>&nbsp;</th>
        </tr>

        <c:forEach var="game" items="${jogos}">
            <tr>
                <td>${game.id}</td>
                <td>${game.titulo}</td>
                <td>${game.anoDeLancamento}</td>
                <td>
                    <a href="/jogo/update?id=${game.id}" class="button update">Editar</a>
                    <a href="/jogo/delete?id=${game.id}" class="button delete">Deletar</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div class="bottom-menu">
        <a href="/" class="button home">Home</a>
        <a href="/jogo/insert" class="button insert">Novo Jogo</a>
    </div>

</body>
</html>