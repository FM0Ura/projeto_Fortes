
CREATE TABLE public.talentos (
                talento_id INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT talentos_pk PRIMARY KEY (talento_id)
);
COMMENT ON TABLE public.talentos IS 'tabela que lista todas os talentos';
COMMENT ON COLUMN public.talentos.talento_id IS 'identificador unico do talento';
COMMENT ON COLUMN public.talentos.nome IS 'nome do talento';


CREATE TABLE public.hard_skills (
                hskill_id INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT hard_skills_pk PRIMARY KEY (hskill_id)
);
COMMENT ON TABLE public.hard_skills IS 'tabela que lista todas as hard skills';
COMMENT ON COLUMN public.hard_skills.hskill_id IS 'identificador unico da soft skill';
COMMENT ON COLUMN public.hard_skills.nome IS 'nome da skill';


CREATE TABLE public.soft_skills (
                sskill_id INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT soft_skills_pk PRIMARY KEY (sskill_id)
);
COMMENT ON TABLE public.soft_skills IS 'tabela que lista todas as soft skills';
COMMENT ON COLUMN public.soft_skills.sskill_id IS 'identificador unico da soft skill';
COMMENT ON COLUMN public.soft_skills.nome IS 'nome da skill';


CREATE TABLE public.enderecos (
                endereco_id INTEGER NOT NULL,
                cep NUMERIC(8) NOT NULL,
                complemento VARCHAR(50),
                CONSTRAINT enderecos_pk PRIMARY KEY (endereco_id)
);
COMMENT ON TABLE public.enderecos IS 'cep e complemento dos endere�os';
COMMENT ON COLUMN public.enderecos.endereco_id IS 'identificador unico do endere�o';
COMMENT ON COLUMN public.enderecos.cep IS 'cep do endere�o, apenas digitos numericos.';
COMMENT ON COLUMN public.enderecos.complemento IS 'complemento do endere�o';


CREATE TABLE public.usuario (
                user_id INTEGER NOT NULL,
                Column_1_nome VARCHAR(32) NOT NULL,
                sobrenomes VARCHAR(40) NOT NULL,
                departamento INTEGER NOT NULL,
                nascimento DATE NOT NULL,
                endereco_id INTEGER NOT NULL,
                genero VARCHAR NOT NULL,
                cargo_id INTEGER NOT NULL,
                contratacao DATE NOT NULL,
                CONSTRAINT usuario_pk PRIMARY KEY (user_id)
);
COMMENT ON TABLE public.usuario IS 'Tabela que listar� informa��es gerais dos funcion�rios';
COMMENT ON COLUMN public.usuario.user_id IS 'identificador unico do funcionario';
COMMENT ON COLUMN public.usuario.Column_1_nome IS 'primeiro nome do funcion�rio';
COMMENT ON COLUMN public.usuario.sobrenomes IS 'sobrenomes (talvez dividir em 1�sobrenome e resto do sobrenome e permitir null)';
COMMENT ON COLUMN public.usuario.departamento IS 'identificador do departamento';
COMMENT ON COLUMN public.usuario.nascimento IS 'data de nascimento do funcionario';
COMMENT ON COLUMN public.usuario.endereco_id IS 'identificador unico do endere�o';
COMMENT ON COLUMN public.usuario.genero IS 'genero do funcion�rio';
COMMENT ON COLUMN public.usuario.cargo_id IS 'identificador unico do cargo';
COMMENT ON COLUMN public.usuario.contratacao IS 'data de contrata��o do funcion�rio';


CREATE TABLE public.hskill_user (
                user_id INTEGER NOT NULL,
                hskill_id INTEGER NOT NULL,
                CONSTRAINT hskill_user_pk PRIMARY KEY (user_id, hskill_id)
);
COMMENT ON TABLE public.hskill_user IS 'tabela intermedi�ria que listar� as hard skills dos usu�rios';
COMMENT ON COLUMN public.hskill_user.user_id IS 'identificador unico do funcionario';
COMMENT ON COLUMN public.hskill_user.hskill_id IS 'identificador unico da hard skill';


CREATE TABLE public.sskill_user (
                user_id INTEGER NOT NULL,
                sskill_id INTEGER NOT NULL,
                CONSTRAINT sskill_user_pk PRIMARY KEY (user_id, sskill_id)
);
COMMENT ON TABLE public.sskill_user IS 'tabela intermedi�ria que listar� as soft skills dos usu�rios';
COMMENT ON COLUMN public.sskill_user.user_id IS 'identificador unico do funcionario';
COMMENT ON COLUMN public.sskill_user.sskill_id IS 'identificador unico da soft skill';


CREATE TABLE public.talento_user (
                user_id INTEGER NOT NULL,
                talento_id INTEGER NOT NULL,
                CONSTRAINT talento_user_pk PRIMARY KEY (user_id, talento_id)
);
COMMENT ON TABLE public.talento_user IS 'tabela intermedi�ria que listar� os talentos dos usuarios';
COMMENT ON COLUMN public.talento_user.user_id IS 'identificador unico do funcionario';
COMMENT ON COLUMN public.talento_user.talento_id IS 'identificador unico do talento';


ALTER TABLE public.talento_user ADD CONSTRAINT talentos_talento_user_fk
FOREIGN KEY (talento_id)
REFERENCES public.talentos (talento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.hskill_user ADD CONSTRAINT hard_skills_hskill_user_fk
FOREIGN KEY (hskill_id)
REFERENCES public.hard_skills (hskill_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.sskill_user ADD CONSTRAINT soft_skills_sskill_user_fk
FOREIGN KEY (sskill_id)
REFERENCES public.soft_skills (sskill_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.usuario ADD CONSTRAINT enderecos_usuario_fk
FOREIGN KEY (endereco_id)
REFERENCES public.enderecos (endereco_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.talento_user ADD CONSTRAINT usuario_talento_user_fk
FOREIGN KEY (user_id)
REFERENCES public.usuario (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.sskill_user ADD CONSTRAINT usuario_sskill_user_fk
FOREIGN KEY (user_id)
REFERENCES public.usuario (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.hskill_user ADD CONSTRAINT usuario_hskill_user_fk
FOREIGN KEY (user_id)
REFERENCES public.usuario (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
