/* Lógico_1: */

CREATE TABLE Clientes (
    Cod_Cliente INTEGER(FK) PRIMARY KEY,
    Sobrenome VARCHAR(50),
    Nome VARCHAR(50),
    Inicial CHAR(1),
    DDD INTEGER,
    Telefone VARCHAR(15),
    Saldo DECIMAL(10,2)
);

CREATE TABLE Faturas (
    Num_Fatura INTEGER(FK) PRIMARY KEY,
    Data_fatura DATE,
    fk_Clientes_Cod_Cliente INTEGER(FK)
);

CREATE TABLE Linhas (
    Num_linha INTEGER(PK) PRIMARY KEY,
    Unidades INTEGER,
    Valor DECIMAL(10,2),
    fk_Faturas_Num_Fatura INTEGER(FK),
    fk_Produtos_Cod_Produto INTEGER(PK)
);

CREATE TABLE Produtos (
    Cod_Produto INTEGER(PK) PRIMARY KEY,
    Descricao VARCHAR(200),
    Data_Compra DATE,
    Quantidade INTEGER,
    Valor DECIMAL(10,2),
    fk_Fornecedores_Cod_Fornecedor INTEGER(PK)
);

CREATE TABLE Fornecedores (
    Cod_Fornecedor INTEGER(PK) PRIMARY KEY,
    Nome VARCHAR(100),
    Contato VARCHAR(100),
    DDD INTEGER,
    Telefone VARCHAR(15),
    Estado CHAR(2)
);
 
ALTER TABLE Faturas ADD CONSTRAINT FK_Faturas_2
    FOREIGN KEY (fk_Clientes_Cod_Cliente)
    REFERENCES Clientes (Cod_Cliente)
    ON DELETE CASCADE;
 
ALTER TABLE Linhas ADD CONSTRAINT FK_Linhas_2
    FOREIGN KEY (fk_Faturas_Num_Fatura)
    REFERENCES Faturas (Num_Fatura)
    ON DELETE RESTRICT;
 
ALTER TABLE Linhas ADD CONSTRAINT FK_Linhas_3
    FOREIGN KEY (fk_Produtos_Cod_Produto)
    REFERENCES Produtos (Cod_Produto)
    ON DELETE CASCADE;
 
ALTER TABLE Produtos ADD CONSTRAINT FK_Produtos_2
    FOREIGN KEY (fk_Fornecedores_Cod_Fornecedor)
    REFERENCES Fornecedores (Cod_Fornecedor)
    ON DELETE CASCADE;