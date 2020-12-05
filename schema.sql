
CREATE TABLE legalEntity(
    id INT NOT NULL AUTO_INCREMENT,
    uuid VARCHAR(45), 
    entityName VARCHAR(45),
    type INT,
    mailingAddress VARCHAR(255),

);

CREATE TABLE horse (
    id INT NOT NULL AUTO_INCREMENT,
    uuid VARCHAR(45),
    commonName VARCHAR(20),
    registeredName VARCHAR(45),
    registrationNumber VARCHAR(30),
    registrationAssociation INT,
    dateOfBirth DATETIME,
    gender INT,
    color VARCHAR(45),
    sire INT,
    dam INT,
    breeder INT,
    horseOwner INT,
    rider INT,
    trainer INT,
    stable INT,
    FOREIGN KEY(registrationAssociation) REFERENCES legalEntity(id),
    FOREIGN KEY(sire) REFERENCES horse(id),
    FOREIGN KEY(dam) REFERENCES horse(id),
    FOREIGN KEY(breeder) REFERENCES legalEntity(id),
    FOREIGN KEY(breeder) REFERENCES legalEntity(id),
    FOREIGN KEY(horseowner) REFERENCES legalEntity(id),
    FOREIGN KEY(rider) REFERENCES legalEntity(id),
    FOREIGN KEY(trainer) REFERENCES legalEntity(id),
    FOREIGN KEY(stable) REFERENCES legalEntity(id),

);

CREATE TABLE genetic
(
    id INT NOT NULL AUTO_INCREMENT,
    uuid VARCHAR(45), 
    horseId int,
    geneName VARCHAR(45),
    result VARCHAR(255),
    FOREIGN KEY(horseId) REFERENCES horse(id);
    CONSTRAINT(horseId, geneName) UNIQUE,

);

CREATE TABLE eventMasterRecord (
    id INT NOT NULL AUTO_INCREMENT,
    uuid VARCHAR(45),
    title VARCHAR(255),
    eventLocation int,
    host int,
    association int,
    eventStartDate DATETIME,
    eventType int,

);

CREATE TABLE eventClassType (
    id INT NOT NULL AUTO_INCREMENT,
    specification VARCHAR(255),
    classDescription VARCHAR(255),
);

CREATE TABLE eventClassRecord (
    id INT NOT NULL AUTO_INCREMENT,
    uuid VARCHAR(45), 
    masterRecordId INT,
    eventClassType INT,
    horseId INT,
    eventRound INT, 
    eventOrder INT, 
    score INT,
    awards DOUBLE,
    recordData VARCHAR(255),
    eventRound INT,
    FOREIGN KEY horseId REFERENCES horse(id),
    FOREIGN KEY masterRecordId REFERENCES eventMasterRecord(id),
    FOREIGN KEY eventClassType REFERENCES eventClassType(id),

);                


