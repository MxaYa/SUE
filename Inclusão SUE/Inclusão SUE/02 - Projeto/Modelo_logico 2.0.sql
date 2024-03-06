CREATE DATABASE SUE_PJ;

USE SUE_PJ;

CREATE TABLE endereco(
	id INT AUTO_INCREMENT PRIMARY KEY,
    Rua VARCHAR (255),
    Bairro VARCHAR (255),
    Cidade VARCHAR (255),
    Estado VARCHAR (255),
    País VARCHAR(255),
    Cep VARCHAR (255)
);

CREATE TABLE USUARIO(
	id INT AUTO_INCREMENT PRIMARY KEY,
    Nome Varchar(255),
    Telefone Varchar (255),
    email varchar(255),
    cpf varchar (255),
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES endereço(id) 
);


CREATE TABLE coordenador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login_id int,
    unidade Varchar(255),
    FOREIGN KEY (login_id) REFERENCES USUARIO(id)
);



CREATE TABLE professor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login_id int,
    FOREIGN KEY (login_id) REFERENCES USUARIO(id),
    area_de_ensino VARCHAR(255)
);

CREATE TABLE curso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT
);

CREATE TABLE disciplina (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    valor_disciplina DECIMAL(10, 2)
);



CREATE TABLE turma (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT,
    disciplina_id INT,
    professor_id INT,
    horario VARCHAR(50),
    FOREIGN KEY (curso_id) REFERENCES curso(id),
    FOREIGN KEY (disciplina_id) REFERENCES disciplina(id),
    FOREIGN KEY (professor_id) REFERENCES professor(id)
);


CREATE TABLE valor_curso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT,
    valor DECIMAL(10, 2),
    turno VARCHAR(50),
    FOREIGN KEY (curso_id) REFERENCES curso(id)
);

CREATE TABLE rep_financeiro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login_id int,
    data_transacao DATE,
    descricao TEXT,
    FOREIGN KEY (login_id) REFERENCES USUARIO(id)
);

CREATE TABLE aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login_id int,
    rep_financeiro_id int,
    ativo TINYINT DEFAULT 1,
    pagamento_curso DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (login_id) REFERENCES USUARIO(id),
    FOREIGN KEY (rep_financeiro_id) REFERENCES rep_financeiro(id)
);

CREATE TABLE pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Rep_financeiro_id int,
    valor_pago DECIMAL(10, 2),
    data_pago DATE,
    descricao TEXT,
    tipo_desconto VARCHAR(100),
    numero_parcela INT,
    FOREIGN KEY (Rep_financeiro_id) REFERENCES rep_financeiro(id)
);

CREATE TABLE Notas (
	id int AUTO_INCREMENT PRIMARY KEY ,
    aluno_id int,
	turma_id int,
    descrição_da_nota Text,
    Valor_da_nota double,
    Data_Da_Nota DATETIME,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (turma_id) REFERENCES turma(id)
);

CREATE TABLE Frequencia (
	id int AUTO_INCREMENT PRIMARY KEY,
    aluno_id int,
    turma_id int,
    Data_Frenquecia DATETIME,
    Presente Boolean,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (turma_id) REFERENCES turma(id)
);

CREATE TABLE Status_de_aprovacao (
	id int AUTO_INCREMENT PRIMARY KEY,
    Drescricao text
);

CREATE TABLE Aluno_Turma_Associativa (
	Aluno_id Int,
    Turma_id Int,
    Status_id int,
    Primary KEY (Aluno_id,Turma_id),
    FOREIGN KEY (Aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (Turma_id) REFERENCES turma(id),
    FOREIGN KEY (Status_id) REFERENCES Status_de_aprovacao(id)
);

CREATE TABLE tabela_associativa_coordenador(
    curso_id INT,
    coordenador_id INT,
    PRIMARY KEY (coordenador_id, curso_id),
    FOREIGN KEY (curso_id) REFERENCES curso(id),
    FOREIGN KEY (coordenador_id) REFERENCES coordenador(id)
);

CREATE TABLE tabela_associativa_curso_disciplina(
    curso_id INT,
    disciplina_id INT,
    PRIMARY KEY (curso_id, disciplina_id),
    FOREIGN KEY (curso_id) REFERENCES curso(id),
    FOREIGN KEY (disciplina_id) REFERENCES disciplina(id)
);