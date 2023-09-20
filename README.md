# DSA612S
Distributed Systems and Applications Group Assignment 1

openapi: 3.0.0
info:
  title: Faculty API
  version: 1.0.0
paths:
  /lecturers:
    get:
      summary: Get all lecturers
      responses:
        '200':
          description: Successful response
    post:
      summary: Add a new lecturer
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Lecturer'
      responses:
        '201':
          description: Lecturer added successfully
  /lecturers/{staffNumber}:
    get:
      summary: Get lecturer by staff number
      parameters:
        - name: staffNumber
          in: path
          required: true
          description: Staff number of the lecturer
          schema:
            type: integer
      responses:
        '200':
          description: Successful response
        '404':
          description: Lecturer not found
    put:
      summary: Update lecturer information
      parameters:
        - name: staffNumber
          in: path
          required: true
          description: Staff number of the lecturer
          schema:
            type: integer
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Lecturer'
      responses:
        '200':
          description: Lecturer updated successfully
        '404':
          description: Lecturer not found
    delete:
      summary: Delete lecturer by staff number
      parameters:
        - name: staffNumber
          in: path
          required: true
          description: Staff number of the lecturer
          schema:
            type: integer
      responses:
        '204':
          description: Lecturer deleted successfully
        '404':
          description: Lecturer not found
  /courses/{courseCode}/lecturers:
    get:
      summary: Get lecturers by course code
      parameters:
        - name: courseCode
          in: path
          required: true
          description: Course code
          schema:
            type: string
      responses:
        '200':
          description: Successful response
  /offices/{officeNumber}/lecturers:
    get:
      summary: Get lecturers by office number
      parameters:
        - name: officeNumber
          in: path
          required: true
          description: Office number
          schema:
            type: integer
      responses:
        '200':
          description: Successful response
components:
  schemas:
    Lecturer:
      type: object
      properties:
        staffNumber:
          type: integer
          format: int32
          description: Staff number of the lecturer
        officeNumber:
          type: integer
          format: int32
          description: Office number of the lecturer
        staffName:
          type: string
          description: Name of the lecturer
        title:
          type: string
          description: Title of the lecturer
        courses:
          type: array
          items:
            $ref: '#/components/schemas/Course'
    Course:
      type: object
      properties:
        courseName:
          type: string
          description: Name of the course
        courseCode:
          type: string
          description: Course code
        nqfLevel:
          type: integer
          format: int32
          description: NQF level of the course
openapi: 3.0.0
info:
  title: Faculty API
  version: 1.0.0
paths:
  /lecturers:
    get:
      summary: Get all lecturers
      responses:
        '200':
          description: Successful response
    post:
      summary: Add a new lecturer
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Lecturer'
      responses:
        '201':
          description: Lecturer added successfully
  /lecturers/{staffNumber}:
    get:
      summary: Get lecturer by staff number
      parameters:
        - name: staffNumber
          in: path
          required: true
          description: Staff number of the lecturer
          schema:
            type: integer
      responses:
        '200':
          description: Successful response
        '404':
          description: Lecturer not found
    put:
      summary: Update lecturer information
      parameters:
        - name: staffNumber
          in: path
          required: true
          description: Staff number of the lecturer
          schema:
            type: integer
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Lecturer'
      responses:
        '200':
          description: Lecturer updated successfully
        '404':
          description: Lecturer not found
    delete:
      summary: Delete lecturer by staff number
      parameters:
        - name: staffNumber
          in: path
          required: true
          description: Staff number of the lecturer
          schema:
            type: integer
      responses:
        '204':
          description: Lecturer deleted successfully
        '404':
          description: Lecturer not found
  /courses/{courseCode}/lecturers:
    get:
      summary: Get lecturers by course code
      parameters:
        - name: courseCode
          in: path
          required: true
          description: Course code
          schema:
            type: string
      responses:
        '200':
          description: Successful response
  /offices/{officeNumber}/lecturers:
    get:
      summary: Get lecturers by office number
      parameters:
        - name: officeNumber
          in: path
          required: true
          description: Office number
          schema:
            type: integer
      responses:
        '200':
          description: Successful response
components:
  schemas:
    Lecturer:
      type: object
      properties:
        staffNumber:
          type: integer
          format: int32
          description: Staff number of the lecturer
        officeNumber:
          type: integer
          format: int32
          description: Office number of the lecturer
        staffName:
          type: string
          description: Name of the lecturer
        title:
          type: string
          description: Title of the lecturer
        courses:
          type: array
          items:
            $ref: '#/components/schemas/Course'
    Course:
      type: object
      properties:
        courseName:
          type: string
          description: Name of the course
        courseCode:
          type: string
          description: Course code
        nqfLevel:
          type: integer
          format: int32
          description: NQF level of the course