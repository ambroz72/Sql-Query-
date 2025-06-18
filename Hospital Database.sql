CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address TEXT,
    eGKNumber VARCHAR(20),
    InsuranceType VARCHAR(20),
    ConsentStatus BOOLEAN
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Role VARCHAR(50),
    Specialty VARCHAR(100),
    DepartmentID INT,
    Qualifications TEXT,
    ShiftSchedule TEXT,
    LicenseNumber VARCHAR(50),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Floor INT
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    StaffID INT,
    AppointmentType VARCHAR(50),
    Date DATE,
    Time TIME,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Bed (
    BedID INT PRIMARY KEY,
    RoomNumber VARCHAR(10),
    Ward VARCHAR(50),
    Status VARCHAR(20)
);

CREATE TABLE Admission (
    AdmissionID INT PRIMARY KEY,
    PatientID INT,
    BedID INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    DailyCareLevel VARCHAR(50),
    MealPreferences TEXT,
    VisitationStatus VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (BedID) REFERENCES Bed(BedID)
);

CREATE TABLE MedicalRecord (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    Date DATE,
    ICD10_Code VARCHAR(20),
    TreatmentPlan TEXT,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

CREATE TABLE MedicationOrder (
    OrderID INT PRIMARY KEY,
    RecordID INT,
    MedicationName VARCHAR(100),
    Dosage VARCHAR(50),
    Frequency VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    IsNarcotic BOOLEAN,
    FOREIGN KEY (RecordID) REFERENCES MedicalRecord(RecordID)
);

CREATE TABLE Billing (
    BillingID INT PRIMARY KEY,
    PatientID INT,
    InsuranceType VARCHAR(50),
    TotalAmount DECIMAL(10,2),
    DRGCode VARCHAR(20),
    CoPayment DECIMAL(10,2),
    BillingStatus VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

CREATE TABLE StaffSchedule (
    ScheduleID INT PRIMARY KEY,
    StaffID INT,
    Date DATE,
    ShiftType VARCHAR(50),
    HoursWorked INT,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);


CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    DepartmentID INT,
    LastMaintenance DATE,
    NextMaintenance DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,
    GeneratedBy VARCHAR(100),
    Type VARCHAR(50),
    DateGenerated DATE,
    IsAnonymized BOOLEAN
);
