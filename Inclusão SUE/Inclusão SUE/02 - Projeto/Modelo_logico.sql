CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    ativo TINYINT DEFAULT 1,
    pagamento_curso DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE coordenador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE professor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    especialidade VARCHAR(100)
);

CREATE TABLE curso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    coordenador_id INT,
    FOREIGN KEY (coordenador_id) REFERENCES coordenador(id)
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
    aluno_id INT,
    horario VARCHAR(50),
    FOREIGN KEY (curso_id) REFERENCES curso(id),
    FOREIGN KEY (disciplina_id) REFERENCES disciplina(id),
    FOREIGN KEY (professor_id) REFERENCES professor(id),
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);

CREATE TABLE pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    valor_pago DECIMAL(10, 2),
    data_pago DATE,
    descricao TEXT,
    tipo_desconto VARCHAR(100),
    numero_parcela INT,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
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
    tipo_transacao VARCHAR(100),
    valor DECIMAL(10, 2),
    data_transacao DATE,
    descricao TEXT,
    pagamento_id INT,
    FOREIGN KEY (pagamento_id) REFERENCES pagamento(id)
);

