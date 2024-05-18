CREATE DATABASE bdLivrariaBrasileira

CREATE TABLE tbAutor(
   idAutor INT PRIMARY KEY IDENTITY(1,1)
   ,nomeAutor VARCHAR (70) NOT NULL
   )

CREATE TABLE tbEditora(
   idEditora INT PRIMARY KEY IDENTITY(1,1)
   ,nomeEditora VARCHAR (70) NOT NULL
   )

CREATE TABLE tbGenero(
   idGenero INT PRIMARY KEY IDENTITY(1,1)
   ,nomeGenero VARCHAR (70) NOT NULL
   )

CREATE TABLE tbLivro(
   idLivro INT PRIMARY KEY IDENTITY(1,1)
   ,nomeLivro VARCHAR (70) NOT NULL
   ,numPaginas INT NOT NULL
   ,idGenero INT FOREIGN KEY REFERENCES tbGenero(idGenero)
   ,idAutor INT FOREIGN KEY REFERENCES tbAutor(idAutor)
   ,idEditora INT FOREIGN KEY REFERENCES tbEditora(idEditora)
   )
-- Executado até aqui
-- Inserts

INSERT INTO tbAutor
    (nomeAutor)
	  VALUES
	   ('Chico Buarque')
	   ,('Jorge Amado')
	   ,('J.K. Rowling')
	   ,('William Shakespeare')
	   ,('Monteiro Lobato')
	   ,('Cora Coralina')
	   ,('Clarice Lispector')
   INSERT INTO tbEditora
    (nomeEditora)
	  VALUES
	   ('Melhoramentos')
	   ,('Globo')
	   ,('Ática')
	   ,('Companhia das Letras')
	   ,('Abril')

   INSERT INTO tbGenero
     (nomeGenero)
	   VALUES
	     ('Ficção')
		 ,('Romance')
		 ,('Tragédia')
	
   INSERT INTO tbLivro (nomeLivro, numPaginas, idGenero, idEditora, idAutor)
    VALUES 
     ('Budapeste', 176, 2, 4, 1),
     ('O Brilho da Seda', 454, 2, 5, 3),
     ('Gabriela, Cravo e Canela', 214, 1, 2, 2),
     ('Reinações de Narizinho', 143, 2, 2, 5),
     ('Romeu e Julieta', 421, 1, 3, 4),
     ('O Irmão Alemão', 478, 1, 4, 1),
     ('Terra Sem Fim', 125, 1, 3, 2),
     ('Animais Fantásticos e Onde Habitam', 267, 2, 4, 3);
-- Executado até aqui
-- Joins

	-- Questão A) A quantidade de livros agrupado [agrupada] pelo nome do gênero
	SELECT COUNT(tbLivro.idLivro) AS 'Quantidade de livros',
	nomeGenero AS 'Gênero' FROM tbLivro
		FULL JOIN tbGenero ON tbLivro.idGenero = tbGenero.idGenero
		GROUP BY nomeGenero

	-- Questão B) A soma das páginas agrupada pelo nome do autor
	SELECT SUM(tbLivro.numPaginas) AS 'Soma das páginas',
	nomeAutor 'Autor' FROM tbLivro
		FULL JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		GROUP BY nomeAutor

	-- Questão C) A média de páginas agrupada pelo nome do autorem ordem alfabética (de A a Z)
	SELECT AVG(tbLivro.numPaginas) AS 'Média das páginas',
	nomeAutor 'Autor' FROM tbLivro
		FULL JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		GROUP BY nomeAutor

	-- Questão D) A quantidade de livros agrupada pelo nome da editoraem ordem alfabética inversa (de Z a A)
	SELECT COUNT(tbLivro.idLivro) AS 'Quantidade de livros',
	nomeEditora AS 'Editora'  FROM tbLivro
		FULL JOIN tbEditora ON tbLivro.idEditora = tbEditora.idEditora
		GROUP BY nomeEditora 			-- NÃO CONCLUÍDA

	-- Questão E) A soma de páginas dos livros agrupados pelo nome de autores cujo nome comece com a letra “C”
	SELECT SUM(numPaginas) AS 'Soma das páginas',
	nomeAutor 'Autor de inicial C ' FROM tbLivro
		FULL JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		WHERE tbAutor.nomeAutor = 'C%'
		GROUP BY nomeAutor		-- NÃO CONCLUÍDA

	-- Questão F) A  quantidade  de  livros  agrupados  pelo  nome  do  autor,  
	--cujo  nome  do  autor  seja “Machado de Assis”, “Cora Coralina”, “Graciliano Ramos”, “Clarice Lispector”
	SELECT SUM(tbLivro.numPaginas) AS 'Soma das páginas',
	nomeAutor 'Autor' FROM tbLivro
		FULL JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		WHERE nomeAutor = 'Machado de Assis' OR 'Graciliano Ramos' OR 'Clarisce Lispector' OR 'Cora Coralina'
		GROUP BY nomeAutor		-- NÃO CONCLUI´´DA


-- PARTE DO GUI
		
	/* I O nome dos livros ao lado dos nomes do autor somente daqueles cujo nome da editora
	for "Cia das Letra" + */

	SELECT tbLivro.nomeLivro AS 'Livro', 
	nomeAutor As 'Autor' FROM tbAutor INNER JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor
	WHERE idEditora = 4

	/* J O nome dos livros ao lado dos nomes dos autores, somente dos livros que não forem do autor 
	“Érico Veríssimo”  + */

	SELECT tbLivro.nomeLivro AS 'Livro', 
	nomeAutor As 'Autor' FROM tbAutor INNER JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor
	WHERE NOT nomeAutor <> 'Érico Veríssimo'

	/*K Os nomes  dos  autores  ao  lado  dos  nomes dos  livros,  inclusive  daqueles  que  não  
	tem livros cadastrados + */

	SELECT tbAutor.nomeAutor AS 'Autor', 
	nomeLivro As 'Livro' FROM tbAutor FULL JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor

	/*L Os nomes  dos  autores  ao  lado  dos  nomes dos  livros,  inclusive  daqueles  que  não 
	tem autores cadastrados =+ */

    SELECT tbAutor.nomeAutor AS 'Autor', 
	nomeLivro As 'Livro' FROM tbAutor FULL JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor 

	/*M O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou não livro 
	publicado, e indiferente do livro pertencer a algum autor + */

	SELECT tbAutor.nomeAutor AS 'Autor', 
	nomeLivro As 'Livro' FROM tbAutor CROSS JOIN tbLivro

	/*N A editora Ática irá publicar todos os títulos dessa livraria. Criar um select que associe 
	os nomes de todos os livros ao lado do nome da editora Ática. + */

    SELECT tbEditora.nomeEditora AS 'Editora Ática',
	nomeLivro AS 'Livro' FROM tbLivro CROSS JOIN tbEditora
	WHERE tbEditora.idEditora = 3

	/*O Somente os nomes dos autores que não tem livros cadastrados +~ */

	SELECT nomeAutor AS 'Autor',
	tbLivro.nomeLivro AS 'Livro' FROM tbAutor LEFT JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor
	WHERE tbLivro.idAutor IS NULL

	/*P Os nomes dos gêneros que não possuem nenhum livro cadastrado + */

	SELECT tbGenero.nomeGenero AS 'Gênero',
	tbLivro.nomeLivro AS 'Livro' FROM tbGenero LEFT JOIN tbLivro ON tbLivro.idGenero = tbGenero.idGenero
	WHERE tbLivro.idGenero IS NULL
