/*Criação das tabelas do esquema*/

-- Criação da tabela skills

CREATE TABLE public.skills (
                skill_id INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                tipo VARCHAR(4) NOT NULL,
                CONSTRAINT skills_pk PRIMARY KEY (skill_id)
);
-- Comentários nos metadados da tabela:
COMMENT ON TABLE public.skills IS 'tabela que lista todas as skills';
COMMENT ON COLUMN public.skills.skill_id IS 'identificador unico da skill';
COMMENT ON COLUMN public.skills.nome IS 'nome da skill';
COMMENT ON COLUMN public.skills.tipo IS 'tipo da skill, se é hard skill ou soft skill';


-- Criação da tabela interesses
CREATE TABLE public.interesses (
                interesse_id INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT interesses_pk PRIMARY KEY (interesse_id)
);
--Comentários nos metadados da tabela:
COMMENT ON TABLE public.interesses IS 'tabela que lista todos os interesses';
COMMENT ON COLUMN public.interesses.interesse_id IS 'identificador unico do interesse';
COMMENT ON COLUMN public.interesses.nome IS 'nome do interesse';


-- Criação da tabela hobbies
CREATE TABLE public.hobbies (
                hobby_id INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT hobbies_pk PRIMARY KEY (hobby_id)
);
-- Comentários nos metadados da tabela:
COMMENT ON TABLE public.hobbies IS 'tabela que lista todos os hobbies';
COMMENT ON COLUMN public.hobbies.hobby_id IS 'identificador unico do hobby';
COMMENT ON COLUMN public.hobbies.nome IS 'nome do hobbie';


-- Criação da tabela enderecos
CREATE TABLE public.enderecos (
                endereco_id INTEGER NOT NULL,
                cep NUMERIC(8) NOT NULL,
                complemento VARCHAR(50) NOT NULL,
                CONSTRAINT enderecos_pk PRIMARY KEY (endereco_id)
);
--Comentários nos metadados da tabela:
COMMENT ON TABLE public.enderecos IS 'cep e complemento dos endereços';
COMMENT ON COLUMN public.enderecos.endereco_id IS 'identificador unico do endereço';
COMMENT ON COLUMN public.enderecos.cep IS 'cep do endereço, apenas digitos numericos.';
COMMENT ON COLUMN public.enderecos.complemento IS 'complemento do endereço';

-- Criação da tabela usuario
CREATE TABLE public.usuario (
                user_id INTEGER NOT NULL,
                prim_nome VARCHAR(32) NOT NULL,
                sobrenomes VARCHAR(40) NOT NULL,
                departamento INTEGER NOT NULL,
                nascimento DATE NOT NULL,
                endereco_id INTEGER NOT NULL,
                genero VARCHAR NOT NULL,
                cargo_id INTEGER NOT NULL,
                contratacao DATE NOT NULL,
                email VARCHAR NOT NULL,
                CONSTRAINT usuario_pk PRIMARY KEY (user_id)
);
--Comentários nos metadados da tabela:
COMMENT ON TABLE public.usuario IS 'Tabela que listará informações gerais dos funcionários';
COMMENT ON COLUMN public.usuario.user_id IS 'identificador unico do funcionario';
COMMENT ON COLUMN public.usuario.prim_nome IS 'primeiro nome do funcionário';
COMMENT ON COLUMN public.usuario.sobrenomes IS 'sobrenomes (talvez dividir em 1ºsobrenome e resto do sobrenome e permitir null)';
COMMENT ON COLUMN public.usuario.departamento IS 'identificador do departamento';
COMMENT ON COLUMN public.usuario.nascimento IS 'data de nascimento do funcionario';
COMMENT ON COLUMN public.usuario.endereco_id IS 'identificador unico do endereço';
COMMENT ON COLUMN public.usuario.genero IS 'genero do funcionário';
COMMENT ON COLUMN public.usuario.cargo_id IS 'identificador unico do cargo';
COMMENT ON COLUMN public.usuario.contratacao IS 'data de contratação do funcionário';
COMMENT ON COLUMN public.usuario.email IS 'email do usuario';


-- Criação da tabela intermediária skills_user
CREATE TABLE public.skills_user (
                user_id INTEGER NOT NULL,
                skill_id INTEGER NOT NULL,
                CONSTRAINT skills_user_pk PRIMARY KEY (user_id, skill_id)
);
--Comentários nos metadados da tabela:
COMMENT ON TABLE public.skills_user IS 'tabela intermediária que listará todas as skills dos usuarios';
COMMENT ON COLUMN public.skills_user.user_id IS 'identificador unico do funcionario';
COMMENT ON COLUMN public.skills_user.skill_id IS 'identificador unico da skill';


-- Criação da tabela intermediária interesses_usuario
CREATE TABLE public.interesses_usuario (
                user_id INTEGER NOT NULL,
                interesse_id INTEGER NOT NULL,
                CONSTRAINT interesses_usuario_pk PRIMARY KEY (user_id, interesse_id)
);
--Comentários nos metadados da tabela:
COMMENT ON TABLE public.interesses_usuario IS 'tabela intermediária que listará os interesses de um usuário';
COMMENT ON COLUMN public.interesses_usuario.user_id IS 'identificador unico do funcionario';
COMMENT ON COLUMN public.interesses_usuario.interesse_id IS 'identificador unico do interesse';


-- Criação da tabela intermediária hobbies_user
CREATE TABLE public.hobbies_user (
                user_id INTEGER NOT NULL,
                hobby_id INTEGER NOT NULL,
                CONSTRAINT hobbies_user_pk PRIMARY KEY (user_id, hobby_id)
);
--Comentários nos metadados da tabela:
COMMENT ON TABLE public.hobbies_user IS 'tabela intermediária que listará os hobbies de um usuário';
COMMENT ON COLUMN public.hobbies_user.user_id IS 'identificador unico do funcionario';
COMMENT ON COLUMN public.hobbies_user.hobby_id IS 'identificador unico do hobby';


/*Criação dos relacionamentos entre as tabelas*/


-- Relacionamento entre as tabelas 'skills_user' e 'skills'
ALTER TABLE public.skills_user ADD CONSTRAINT skills_skills_user_fk
FOREIGN KEY (skill_id)
REFERENCES public.skills (skill_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Relacionamento entre as tabelas 'interesses_usuario' e 'interesses'
ALTER TABLE public.interesses_usuario ADD CONSTRAINT interesses_interesses_usuario_fk
FOREIGN KEY (interesse_id)
REFERENCES public.interesses (interesse_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Relacionamento entre as tabelas 'hobbies_user' e 'hobbies'
ALTER TABLE public.hobbies_user ADD CONSTRAINT hobbies_hobbies_user_fk
FOREIGN KEY (hobby_id)
REFERENCES public.hobbies (hobby_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Relacionamento entre as tabelas 'usuario' e 'enderecos'
ALTER TABLE public.usuario ADD CONSTRAINT enderecos_usuario_fk
FOREIGN KEY (endereco_id)
REFERENCES public.enderecos (endereco_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Relacionamento entre as tabelas 'hobbies_user' e 'usuario'
ALTER TABLE public.hobbies_user ADD CONSTRAINT usuario_hobbies_user_fk
FOREIGN KEY (user_id)
REFERENCES public.usuario (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Relacionamento entre as tabelas 'interesses_usuario' e 'usuario'
ALTER TABLE public.interesses_usuario ADD CONSTRAINT usuario_interesses_usuario_fk
FOREIGN KEY (user_id)
REFERENCES public.usuario (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Relacionamento entre as tabelas 'skills_user' e 'usuario'
ALTER TABLE public.skills_user ADD CONSTRAINT usuario_skills_user_fk
FOREIGN KEY (user_id)
REFERENCES public.usuario (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


/*Restrições diversas para o funcionamento do banco de dados*/


-- Para um e-mail ser válido, precisa conter um '@'.
ALTER TABLE public.usuario 
ADD CONSTRAINT email_correto CHECK (email LIKE '%@%');

-- A coluna 'genero' só aceita os valores 'M', 'F' e 'NB' referentes a masculino, feminino e não-binários
ALTER TABLE public.usuario
ADD CONSTRAINT genero_3 CHECK (genero IN ('M', 'F', 'NB'));

-- Ao inserir uma skill é necessário informar se ela é hard skill ou soft skill.
ALTER TABLE public.skills
ADD CONSTRAINT tipo_skill CHECK (tipo IN ('hard', 'soft'));




