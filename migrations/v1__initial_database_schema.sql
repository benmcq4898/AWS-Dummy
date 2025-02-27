-- Create the Employees table
CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    job_title_id INT NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT fk_job_title FOREIGN KEY (job_title_id) REFERENCES job_titles (job_title_id)
);

-- Create the Programming Languages table
CREATE TABLE programming_languages (
    language_id SERIAL PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL,
    created_date DATE DEFAULT CURRENT_DATE
);

-- Create the Job Titles table
CREATE TABLE job_titles (
    job_title_id SERIAL PRIMARY KEY,
    title_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employee_languages (
    employee_id INT NOT NULL,
    language_id INT NOT NULL,
    PRIMARY KEY (employee_id, language_id),
    CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    CONSTRAINT fk_language FOREIGN KEY (language_id) REFERENCES programming_languages (language_id)
);

-- Insert example data into Job Titles
INSERT INTO job_titles (title_name) VALUES
('Software Engineer'),
('Frontend Developer'),
('Backend Developer');

-- Insert example data into Programming Languages
INSERT INTO programming_languages (language_name) VALUES
('JavaScript'),
('Python'),
('TypeScript');

-- Example data for Employees (optional)
INSERT INTO employees (first_name, last_name, email, job_title_id, hire_date) VALUES
('John', 'Doe', 'john.doe@example.com', 1, '2023-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', 2, '2022-08-22'),
('Alice', 'Johnson', 'alice.johnson@example.com', 3, '2021-11-10');

INSERT INTO employee_languages (employee_id, language_id) VALUES
(1, 1), -- John Doe knows JavaScript
(1, 3), -- John Doe knows TypeScript
(2, 1), -- Jane Smith knows JavaScript
(2, 2), -- Jane Smith knows Python
(3, 2), -- Alice Johnson knows Python
(3, 3); -- Alice Johnson knows TypeScript
