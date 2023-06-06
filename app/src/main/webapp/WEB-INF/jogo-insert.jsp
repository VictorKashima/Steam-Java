<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <title>Novo Jogo | Steam Fatec</title>

    <link rel="stylesheet" href="../css/main.css">
</head>
<body>

    <h1>Novo jogo</h1>
    <form action="/jogo/insert" method="post">
        <div class="form-group">
            <label for="titulo">Título</label>
            <input type="text" name="titulo" required />
        </div>

        <div class="form-group">
            <label for="descricao">Ano de Lançamento</label>
            <input type="number" min="1958" max="2024" name="anoDeLancamento" required />
        </div>

        <br />
        
        <div class="bottom-menu">
            <a href="/jogo/list" class="button back">Voltar</a>
            <a href="/" class="button home">Home</a>
            <button type="submit" class="button submit">Salvar</button>
        </div>
    </form>

</body>
</html>