<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <title>Deletar Jogo | Steam Fatec</title>

    <link rel="stylesheet" href="../css/main.css">
</head>
<body>

    <h1>Deletar Jogo</h1>
    <form action="/jogo/delete" method="post">
        <input type="hidden" name="id" value="${jogo.id}" />
        <div class="form-group">
            <h3>Deseja realmente excluir o jogo ${jogo.titulo} lançado em ${jogo.anoDeLancamento}?</h3>
        </div>

        <br />

        <div class="bottom-menu">
            <a href="/jogo/list" class="button back">Voltar</a>
            <a href="/" class="button home">Home</a>
            <button type="submit" class="button delete">Excluir</button>
        </div>
    </form>

</body>
</html>