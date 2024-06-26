CREATE DATABASE bdEscolaIdiomasTwo

create table tbAluno(
	codAluno int primary key identity (1,1)
	, nomeAluno varchar (70) not null
	, rgAluno varchar (12) not null
	, cpfAluno varchar (15) not null
	, logradouro varchar (70) not null
	, numero varchar (20) not null
	, complemento varchar (50)
	, cep varchar (9) not null
	, bairro varchar (50) not null
	, cidade varchar (50) not null
	, dataNascAluno smalldatetime not null
)

create table tbTelefoneAluno(
	codTelAlu int primary key identity (1,1)
	, numTelAlu varchar (12) not null
	, codAluno int foreign key references tbAluno(codAluno)
)

create table tbCurso(
	codCurso int primary key identity (1,1)
	, nomeCurso varchar (50) not null
	, valorCurso smallmoney not null
)

create table tbNivel(
	codNivel int primary key identity (1,1)
	, descNivel varchar (50)
)

create table tbPeriodo(
	codPeriodo int primary key identity (1,1)
	, descPeriodo varchar (50) not null
)

create table tbTurma(
	codTurma int primary key identity (1,1)
	, descTurma varchar (50) not null
	, codCurso int foreign key references tbCurso(codCurso)
	, codNivel int foreign key references tbNivel(codNivel)
	, codPeriodo int foreign key references tbPeriodo(codPeriodo)
	, horario smalldatetime not null
	, diaSemana varchar (15) not null
)

create table tbMatricula(
	codMatricula int primary key identity (1,1)
	, dataMatricula smalldatetime not null
	, codAluno int foreign key references tbAluno(codAluno)
	, codTurma int foreign key references tbTurma(codTurma)
) 

INSERT INTO tbAluno(nomeAluno, rgAluno, cpfAluno, logradouro, numero, complemento, cep, bairro, cidade, dataNascAluno)
VALUES
	('Patrick Lessa Teixeira', '123456789', '12345678900', 'Rua Faultline', '10A', 'casa', '08121210', 'Silverchair Paulista', 'São Paulo', '03/05/2002')
	, ('Igor Morais Da Silva', '123456789', '12345678900', 'Rua Hardwired', '31', 'casa', '08120565', 'Nirvana Paulistano', 'Campo Grande', '10/02/2001')
	, ('Ana Silva', '123456789', '12345678900', 'Rua Blackened', 'Bloco B-10A', 'apartamento', '08121880', 'Bairro do Limoeiro', 'São Paulo', '11/11/2003')
	, ('Icaro Oliva', '123456789', '12345678900', 'Rua Shade', '654', 'casa', '08121770', 'Silverchair Paulista', 'São Paulo', '06/02/2001')
	, ('Beatriz Campos', '123456789', '12345678900', 'Rua Sirens', '789', 'casa', '08121990', 'Vadder Paulista', 'São Paulo', '23/08/2001')

INSERT INTO tbTelefoneAluno(numTelAlu, codAluno)
VALUES 
	('1125629643', 1)
	, ('35962925729', 2)
	, ('1186547998', 4)

INSERT INTO tbCurso(nomeCurso, valorCurso)
VALUES
	('Inglês', 150.99)
	, ('Espanhol', 99.99)

INSERT INTO tbNivel(descNivel)
VALUES
	('Iniciante')
	, ('Intermediário')
	, ('Avançado')

INSERT INTO tbPeriodo(descPeriodo)
VALUES
	('Manhã')
	, ('Tarde')

INSERT INTO tbTurma(descTurma, codCurso, codNivel, codPeriodo, horario, diaSemana)
VALUES 
	('Inglês 1A', 1, 1, 1, '07:00:00', 'Sábado')
	, ('Inglês 2A', 1, 2, 2, '13:00:00', 'Sábado')
	, ('Espanhol 1A', 2, 1, 2, '13:00:00', 'Sábado')

INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma)
VALUES
	('18/07/2019', 1, 1)
	, ('10/01/2019', 2, 2)
	, ('17/07/2019', 3, 3)
	, ('24/05/2019', 4, 1)
	, ('11/01/2019', 5, 2)
-- feito até aqui --

/* A) Criar uma consulta que retorne o nome e o preço dos cursos que 
custem abaixo do valor médio + */

   SELECT nomeCurso AS 'Curso',
   valorCurso AS 'Valor' FROM tbCurso 
   FULL JOIN tbTurma ON (tbCurso.valorCurso = tbTurma.codCurso)
   WHERE tbCurso.valorCurso < (SELECT AVG(tbCurso.valorCurso) FROM tbCurso)

/* B) Criar uma consulta que retorne o nome e o rg do aluno mais novo + */

   SELECT nomeAluno AS 'Aluno',
   rgAluno AS 'RG aluno' FROM tbAluno 
   FULL JOIN tbMatricula ON (tbAluno.rgAluno = tbMatricula.codAluno)
   WHERE tbAluno.dataNascAluno = (SELECT MAX(tbAluno.dataNascAluno) FROM tbAluno)

/* C) Criar uma consulta que retorne o nome do aluno mais velho + */

   SELECT nomeAluno AS 'Aluno'FROM tbAluno 
   LEFT JOIN tbMatricula ON (tbAluno.codAluno = tbMatricula.codAluno)
   WHERE tbAluno.dataNascAluno = (SELECT MIN(tbAluno.dataNascAluno) FROM tbAluno) 

/* D) Criar uma consulta que retorne o nome e o valor do curso mais caro + */

   SELECT nomeCurso AS 'Curso', 
   valorCurso AS 'Valor' FROM tbCurso
   FULL JOIN tbTurma ON (tbCurso.valorCurso = tbTurma.codCurso)
   WHERE tbCurso.valorCurso = (SELECT MAX(tbCurso.valorCurso) FROM tbCurso)

/* E) Criar uma consulta que retorne o nome do aluno e o nome do curso,
do aluno que fez a última matrícula + */

   SELECT nomeAluno AS 'Aluno',
   (tbMatricula.dataMatricula) AS 'Matrícula' FROM tbAluno
   INNER JOIN tbMatricula ON (tbMatricula.codAluno = tbAluno.codAluno)
   WHERE tbMatricula.dataMatricula = (SELECT MAX(dataMatricula) FROM tbMatricula) 

/* F) Criar uma consulta que retorne o nome do primeiro aluno a ser 
matrículado na escola de idiomas + */

   SELECT nomeAluno AS 'Aluno',
   (tbMatricula.dataMatricula) AS 'Matrícula' FROM tbAluno
   INNER JOIN tbMatricula ON (tbMatricula.codAluno = tbAluno.codAluno)
   WHERE tbMatricula.dataMatricula = (SELECT MIN(dataMatricula) FROM tbMatricula)  

/* G) Criar uma consulta que retorne o nome, rg e data de nascimento de 
todos os alunos que estejam matrículados no curso de inglês + */

   SELECT nomeAluno, rgAluno, dataNascAluno FROM tbAluno
    INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
	 WHERE tbTurma.codCurso = 1 

