-- rodar o codigo em blocos!!
INSERT INTO master.`user` (ra,name,password,course_id) VALUES
	 (248701,'Carlos Pirico','aa1bf4646de67fd9086cf6c79007026c',NULL),
	 (248780,'Teste 31-10-2024','paodequeijo',NULL),
	 (248700,'Teste2 31-10-2024','paodequeijo',NULL),
	 (249257,'Murilo','7d94f57c71d653da782c037df1d38d78',NULL),
	 (221700,'Teste2 01-11-2024','odequeijo',NULL),
	 (249592,'Taynara','803b8c8816765e9da52433f96caef906',NULL),
	 (465465,'Lucas','09e66236109f39970792d6670763e477',NULL),
	 (987654,'Abimael','fc9aaec8b2630a263a3a58be2148d76e',NULL),
	 (987655,'Rodrioh','e53a848678658b91f300f106ff393f21',NULL);

INSERT INTO master.answer (answer_text,question_id,is_correct) VALUES
	 ('teste',2,0);

INSERT INTO master.question (question_text,level_id,subject_id,`level`) VALUES
	 ('Qual é a capital da França?',2,3,0);

INSERT INTO master.subject (name,abbreviation) VALUES
	 ('Português','PTG');
