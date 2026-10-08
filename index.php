<?php
require_once 'services/config.php';

$query = "SELECT 
            game.namaGame AS judul_game, 
            developer.namaDeveloper AS nama_developer, 
            genre.genre AS nama_genre, 
            genre.deskripsi
            FROM game
            JOIN developer ON game.idDeveloper = developer.idDeveloper
            JOIN genre ON game.idGenre = genre.idGenre";

$result = mysqli_query($conn, $query);

if (!$result) {
    die("Query Error: " . mysqli_error($conn));
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Game PC</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header class="navbar">
        <h1>Library Game PC</h1>
        <span class="subtitle">Katalog game dari database</span>
    </header>

    <main class="container">
        <h2 class="page-title">Semua Game</h2>

        <div class="card-container">
            <?php while ($row = mysqli_fetch_assoc($result)) { ?>

                <div class="card">
                    <h3 class="game-title"><?php echo htmlspecialchars($row['judul_game']); ?></h3>
                    <p class="game-developer"><strong>Developer:</strong> <?php echo htmlspecialchars($row['nama_developer']); ?></p>
                    <p class="game-genre"><strong>Genre:</strong> <span class="badge"><?php echo htmlspecialchars($row['nama_genre']); ?></span></p>
                    <p class="game-desc"><?php echo htmlspecialchars($row['deskripsi']); ?></p>
                </div>

            <?php } ?>
        </div>
    </main>

</body>
</html>
