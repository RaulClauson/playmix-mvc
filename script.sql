/*

Banco de dados relacionado a app de Java - Playmix MVC

Bianca Leticia Román Caldeira - RM552267 - Turma : 2TDSPH
Charlene Aparecida Estevam Mendes Fialho - RM552252 - Turma : 2TDSPH
Lais Alves Da Silva Cruz - RM:552258 - Turma : 2TDSPH
Fabrico Torres Antonio - RM:97916 - Turma : 2TDSPH

------------------ ESSE SCRIPT CONTEM OS DDL E OS DEMAIS SOLICITADOS EM DEVOPS PARA DEPLOY NO AZURE ------------------

*/

/*DROPS*/
IF OBJECT_ID('playlist_music', 'U') IS NOT NULL DROP TABLE playlist_music;
IF OBJECT_ID('playlist', 'U') IS NOT NULL DROP TABLE playlist;
IF OBJECT_ID('music', 'U') IS NOT NULL DROP TABLE music;


/*DDL*/
-- Tabela MUSIC
CREATE TABLE music (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ano_lancamento INT NOT NULL,
    album NVARCHAR(100) NOT NULL,
    artista NVARCHAR(100) NOT NULL,
    titulo NVARCHAR(100) NOT NULL,
    album_art_url NVARCHAR(255) NOT NULL,
    genero NVARCHAR(255) NOT NULL CHECK (genero IN ('BLUES','CLASSICAL','COUNTRY','ELECTRONIC','FUNK','GOSPEL','HIP_HOP','INDIE','JAZZ','METAL','POP','REGGAE','ROCK','SOUL'))
    -- Comentário: Tabela de musica.
    -- Chave primária: id
);

-- Tabela PLAYLIST
CREATE TABLE playlist (
    id INT IDENTITY(1,1) PRIMARY KEY,
    data_criacao DATETIME NOT NULL,
    nome NVARCHAR(100) NOT NULL
    -- Comentário: Tabela de playlists.
    -- Chave primária: id
);

-- tabela de Junção PLAYLIST_MUSIC 
CREATE TABLE playlist_music (
    music_id INT NOT NULL,
    playlist_id INT NOT NULL,
    PRIMARY KEY (music_id, playlist_id),
    CONSTRAINT FK_playlist_music_music FOREIGN KEY (music_id) REFERENCES music(id),
    CONSTRAINT FK_playlist_music_playlist FOREIGN KEY (playlist_id) REFERENCES playlist(id)
    -- Comentário: Tabela que relaciona músicas e playlists.
    -- Chave primária: (music_id, playlist_id)
);


/* INSERTS DE DADOS */

/* Inserir dados na tabela MUSIC */
INSERT INTO music (ano_lancamento, album, artista, genero, titulo, album_art_url) VALUES (1996, 'All Eyez on Me', '2Pac', 'HIP_HOP', 'California Love', 'https://abrir.link/ZjOqm');
 
INSERT INTO music (ano_lancamento, album, artista, genero, titulo, album_art_url) VALUES (2020, 'Future Nostalgia', 'Dua Lipa', 'POP', 'Dont Start Now', 'https://abrir.link/fltfI');
 
INSERT INTO music (ano_lancamento, album, artista, genero, titulo, album_art_url) VALUES (2019, 'Lover', 'Taylor Swift', 'POP', 'You Need to Calm Down', 'https://abrir.link/MVajI');
 
INSERT INTO music (ano_lancamento, album, artista, genero, titulo, album_art_url) VALUES (2018, 'Scorpion', 'Drake', 'HIP_HOP', 'In My Feelings', 'https://abrir.link/cxgTc');
 
INSERT INTO music (ano_lancamento, album, artista, genero, titulo, album_art_url) VALUES (2022, 'Planet Her', 'Doja Cat', 'POP', 'Kiss Me More', 'https://abrir.link/xRmKc');


/* Inserir dados na tabela PLAYLIST */
INSERT INTO playlist (data_criacao, nome) VALUES (GETDATE(), 'Minhas Favoritas');
INSERT INTO playlist (data_criacao, nome) VALUES (GETDATE(), 'Para Relaxar');
INSERT INTO playlist (data_criacao, nome) VALUES (GETDATE(), 'Workout Playlist');
INSERT INTO playlist (data_criacao, nome) VALUES (GETDATE(), 'Top Hits 2023');

/* Inserção de Dados na Tabela de Junção PLAYLIST_MUSIC */
INSERT INTO playlist_music (music_id, playlist_id) VALUES (1, 1);
INSERT INTO playlist_music (music_id, playlist_id) VALUES (2, 1);
INSERT INTO playlist_music (music_id, playlist_id) VALUES (3, 2);
INSERT INTO playlist_music (music_id, playlist_id) VALUES (4, 3);
INSERT INTO playlist_music (music_id, playlist_id) VALUES (5, 4);
 
-- No SQL Server não é necessário COMMIT explícito para DDL e DML simples

/* Verificações Finais */

-- Selecionar todas as músicas
SELECT * FROM music;
 
-- Selecionar todas as playlists
SELECT * FROM playlist;
 
-- Selecionar todas as relações playlist_music
SELECT * FROM playlist_music;
