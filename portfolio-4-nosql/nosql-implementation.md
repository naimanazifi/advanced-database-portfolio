# Portfolio 4: NoSQL and Advanced Data Models

## 1. Introduction

This portfolio extends the University Student Management System by demonstrating how a NoSQL database can store student information in a flexible document format. The relational MySQL database remains suitable for structured records such as registrations and results, while MongoDB can support student profiles containing optional or changing information.

## 2. Selected NoSQL Database

**Database:** MongoDB  
**Data model:** Document-oriented  
**Collection:** `student_profiles`

MongoDB stores records as BSON documents, which are similar to JSON objects. Unlike a relational table, a document can contain nested objects and arrays. This is useful when student profiles contain information that varies between students.

## 3. Sample Student Documents

The following documents represent fictional students from the selected case study.

```javascript
db.student_profiles.insertMany([
  {
    student_id: 1001,
    first_name: "Amina",
    last_name: "Yusuf",
    email: "amina.yusuf@example.com",
    programme: {
      programme_id: 101,
      programme_name: "BSc Computer Science"
    },
    skills: ["SQL", "Python"],
    contact: {
      preferred_method: "email"
    }
  },
  {
    student_id: 1002,
    first_name: "Maryam",
    last_name: "Bello",
    email: "maryam.bello@example.com",
    programme: {
      programme_id: 101,
      programme_name: "BSc Computer Science"
    },
    skills: ["Java", "Database Design"],
    contact: {
      preferred_method: "phone"
    }
  },
  {
    student_id: 1003,
    first_name: "Ibrahim",
    last_name: "Sani",
    email: "ibrahim.sani@example.com",
    programme: {
      programme_id: 102,
      programme_name: "BSc Mathematics"
    },
    skills: ["Python", "Statistics"],
    contact: {
      preferred_method: "email"
    }
  }
]);
```

## 4. Querying the Documents

### Query 1: Retrieve all Computer Science students

```javascript
db.student_profiles.find(
  { "programme.programme_id": 101 },
  { _id: 0, student_id: 1, first_name: 1, last_name: 1 }
);
```

This query filters documents by the nested programme ID and returns selected student details.

### Query 2: Find students with Python skills

```javascript
db.student_profiles.find(
  { skills: "Python" },
  { _id: 0, student_id: 1, first_name: 1, skills: 1 }
);
```

MongoDB can match an array element directly, making it straightforward to search students by skill.

### Query 3: Update a student's contact preference

```javascript
db.student_profiles.updateOne(
  { student_id: 1001 },
  { $set: { "contact.preferred_method": "phone" } }
);
```

This updates a nested field without replacing the entire student document.

## 5. Data Modelling and Design Considerations

The design embeds programme details and contact preferences within each student document. Embedding is useful when related information is commonly retrieved with the student profile. However, programme information may be repeated across many documents. If programme details change frequently, storing only `programme_id` and retrieving the programme separately may reduce duplication.

The `student_id` field should be unique to avoid duplicate student profiles. The following index can enforce this rule:

```javascript
db.student_profiles.createIndex(
  { student_id: 1 },
  { unique: true }
);
```

Email uniqueness should also be enforced if email is used as a unique identifier. Production systems should validate required fields and data types.

## 6. Comparison with MySQL

| Feature | MySQL | MongoDB |
|---|---|---|
| Data structure | Tables and rows | Collections and documents |
| Schema | Defined columns and constraints | Flexible document structure |
| Relationships
