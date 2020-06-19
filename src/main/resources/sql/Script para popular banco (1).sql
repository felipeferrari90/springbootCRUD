
INSERT INTO tb_bot (name_bot, welcome_msg, farewell_msg, downtime, default_answer) VALUES 
('Nilton 2.0', 'Bem vindo', 'Você está ai?', 40, 'Desculpe, não entendi!');
INSERT INTO tb_bot (name_bot, welcome_msg, farewell_msg, downtime, default_answer) VALUES 
('Regina 3.0', 'welcome', 'alo?', 30, 'não entendi!');
INSERT INTO tb_bot (name_bot, welcome_msg, farewell_msg, downtime, default_answer) VALUES 
('bia 4.0', 'oi tudo bem', 'cade voce?', 33, 'nao compreendi!');
INSERT INTO tb_bot (name_bot, welcome_msg, farewell_msg, downtime, default_answer) VALUES 
('barbara 2.0', 'bom dia', 'Você está ai?', 34, 'repita por favor');
INSERT INTO tb_bot (name_bot, welcome_msg, farewell_msg, downtime, default_answer) VALUES 
('Neilton 5.5', 'Bem vindo', 'Você está ai?', 40, 'Desculpe, não entendi!');
INSERT INTO tb_bot (name_bot, welcome_msg, farewell_msg, downtime, default_answer) VALUES 
('Felipe 18.0', 'Bem vindo', 'Você está ai?', 40, 'Desculpe, não entendi!');

DESC tb_segment;

SELECT * FROM tb_segment;
INSERT INTO tb_segment (name, tb_bot) VALUES ('Opções', 0);
INSERT INTO tb_segment (name, tb_bot) VALUES ('Tratamento', 0);
INSERT INTO tb_segment (name, tb_bot) VALUES ('Opções', 1);
INSERT INTO tb_segment (name, tb_bot) VALUES ('Forma de tratar', 1);
