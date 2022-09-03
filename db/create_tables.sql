CREATE TABLE IF NOT EXISTS projects (
	project_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	created DATETIME DEFAULT CURRENT_TIMESTAMP,
	last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (project_id)
);

CREATE TABLE IF NOT EXISTS contexts (
	context_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
	created DATETIME DEFAULT CURRENT_TIMESTAMP,
	last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (context_id)
);

CREATE TABLE IF NOT EXISTS todos (
	todo_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	is_complete BOOLEAN,
	priority INT,
	context_id INT,
	project_id INT,
	created DATETIME DEFAULT CURRENT_TIMESTAMP,
	last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (todo_id),
	FOREIGN KEY (project_id) REFERENCES projects(project_id),
	FOREIGN KEY (context_id) REFERENCES contexts(context_id)
);

CREATE TABLE IF NOT EXISTS tags (
	tag_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
	created DATETIME DEFAULT CURRENT_TIMESTAMP,
	last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (tag_id)
);

CREATE TABLE IF NOT EXISTS todos_tags (
	todo_tag_id INT NOT NULL AUTO_INCREMENT,
	todo_id INT NOT NULL,
	tag_id INT NOT NULL,
	created DATETIME DEFAULT CURRENT_TIMESTAMP,
	last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (todo_tag_id),
	FOREIGN KEY (todo_id) REFERENCES todos(todo_id),
	FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

CREATE TABLE IF NOT EXISTS groceries (
	grocery_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	location VARCHAR(255),
	created DATETIME DEFAULT CURRENT_TIMESTAMP,
	last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (grocery_id)
);

CREATE TABLE IF NOT EXISTS media_types (
	media_type_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	created DATETIME DEFAULT CURRENT_TIMESTAMP,
	last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (media_type_id)
);

CREATE TABLE IF NOT EXISTS media_content (
	content_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	media_type_id INT,
	recommended_by VARCHAR(255) NOT NULL,
	started BOOLEAN,
	started_on DATETIME,
	finished BOOLEAN,
	finished_on DATETIME,
	created DATETIME DEFAULT CURRENT_TIMESTAMP,
	last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (content_id),
	FOREIGN KEY (media_type_id) REFERENCES media_types(media_type_id)
);
