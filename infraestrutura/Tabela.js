class Tabelas {
    init(conexao) {
        this.conexao = conexao;
        this.criarTabelaAtendimentos();
    }

    criarTabelaAtendimentos() {
        const sql = 'CREATE TABLE IF NOT EXISTS ATENDIMENTOS ( ID INT NOT NULL AUTO_INCREMENT, ALUNO VARCHAR(50) NOT NULL, SIGLA_MATERIA VARCHAR(20), DATA DATETIME NOT NULL, DATACRIACAO DATETIME NOT NULL, TURMA VARCHAR(20) NOT NULL, STATUS VARCHAR(20) NOT NULL, OBSERVACOES TEXT, PRIMARY KEY(ID))';

        this.conexao.query(sql, (erro) => {
            if (erro) {
                console.log(erro)
            } else {
                console.log('Tabela atendimentos para horas complementares criada com sucesso!')
            }
        });
    }
}

module.exports = new Tabelas();