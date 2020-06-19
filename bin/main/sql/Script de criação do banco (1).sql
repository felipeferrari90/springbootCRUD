
DELETE FROM tb_segment;
DROP TABLE tb_segment CASCADE CONSTRAINTS;
DROP TABLE tb_bot;
DROP SEQUENCE tb_bot_seq;
DROP SEQUENCE tb_segment_seq;




CREATE TABLE tb_bot (
    id_bot          NUMBER(11) NOT NULL,
    name_bot            VARCHAR2(255) NOT NULL,
    welcome_msg     VARCHAR2(255) NOT NULL,
    farewell_msg    VARCHAR2(255) NOT NULL,
    downtime        NUMBER(11) NOT NULL,
    default_answer  VARCHAR2(255) NOT NULL
);

ALTER TABLE tb_bot ADD CONSTRAINT tb_bot_pk PRIMARY KEY ( id_bot );

CREATE SEQUENCE tb_bot_seq START WITH 0 MINVALUE 0 MAXVALUE 99999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_bot_seq_trg BEFORE
    INSERT ON tb_bot
    FOR EACH ROW
    WHEN ( new.id_bot IS NULL )
BEGIN
    :new.id_bot := tb_bot_seq.nextval;
END;
/

CREATE TABLE tb_segment (
    id_segment       NUMBER(11) NOT NULL,
    name             VARCHAR2(255) NOT NULL,
    tb_bot           NUMBER(1) NOT NULL
);

ALTER TABLE tb_segment ADD CONSTRAINT tb_segment_pk PRIMARY KEY ( id_segment );

ALTER TABLE tb_segment
    ADD CONSTRAINT tb_bot_id_fk FOREIGN KEY ( tb_bot )
        REFERENCES tb_bot ( id_bot );



CREATE SEQUENCE tb_segment_seq START WITH 0 MINVALUE 0 MAXVALUE 99999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_segment_seq_trg BEFORE
    INSERT ON tb_segment
    FOR EACH ROW
    WHEN ( new.id_segment IS NULL )
BEGIN
    :new.id_segment := tb_segment_seq.nextval;
END;
/

DESCRIBE tb_bot;
DESCRIBE tb_segment;