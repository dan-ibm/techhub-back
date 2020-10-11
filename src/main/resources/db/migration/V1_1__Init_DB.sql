create sequence hibernate_sequence start 1 increment 1;

CREATE TABLE roles (
    role_id BIGINT AUTO_INCREMENT NOT NULL,
    role_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE users (
    user_id BIGINT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR (200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    email VARCHAR(200),
    phone VARCHAR(20),
    iin VARCHAR(12),
    username VARCHAR(200) NOT NULL,
    password VARCHAR(200) NOT NULL,
    profile_img TEXT,
    status VARCHAR(30),
    verified BOOLEAN,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY (user_id),
    UNIQUE email_unique (email)
);

CREATE TABLE user_roles (
    user_id BIGINT,
    role_id BIGINT
);

CREATE TABLE companies (
    company_id BIGINT AUTO_INCREMENT NOT NULL,
    company_name VARCHAR(255),
    verified BOOLEAN,
    director_id BIGINT,
    PRIMARY KEY (company_id)
);

ALTER TABLE user_roles ADD CONSTRAINT fk_user_roles_user_id FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE user_roles ADD CONSTRAINT fk_user_roles_role_id FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE companies ADD CONSTRAINT fk_company_user_id FOREIGN KEY (director_id) REFERENCES users(user_id);


INSERT INTO users (user_id, first_name, last_name, email, phone, iin, username, password, profile_img, updated, status, verified) VALUES (1, 'Admin', 'HUB', 'admin@techhub.kz', '87000000000', '001122001122', 'admin', '$2a$12$3jHJUtqTPpNTVTLwbyHT4OTxLDLwybJvUcUM7LlZZBajYVZgcXkOK', '-', '2020-01-01 00:00:01', 'ACTIVE', TRUE);
INSERT INTO roles VALUES (1, 'ROLE_USER'), (2, 'ROLE_ADMIN'), (3, 'ROLE_OPERATOR'), (4, 'ROLE_DIRECTOR');
INSERT INTO user_roles VALUES (1, 1), (1, 2);
INSERT INTO companies (company_id, company_name, verified, director_id) values (1, 'TOO SOMATIC', TRUE, 1);