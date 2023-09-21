package staffManagement;

import ballerina.http;

public service StaffManagementService {

    private map<int, Lecturer> lecturers;

    public StaffManagementService() {
        lecturers = new map<int, Lecturer>();
    }

    @http:Endpoint(method = http:HttpMethod.GET, path = "/staff")
    public Lecturer[] getAllLecturers() {
        return lecturers.values().toArray();
    }

    @http:Endpoint(method = http:HttpMethod.POST, path = "/staff")
    public Lecturer addLecturer(Lecturer lecturer) {
        lecturers.put(lecturer.getStaffNumber(), lecturer);
        return lecturer;
    }

    @http:Endpoint(method = http:HttpMethod.GET, path = "/staff/{staffNumber}")
    public Lecturer getLecturer(int staffNumber) {
        return lecturers.get(staffNumber);
    }

    @http:Endpoint(method = http:HttpMethod.PUT, path = "/staff/{staffNumber}")
    public Lecturer updateLecturer(int staffNumber, Lecturer lecturer) {
        lecturers.put(staffNumber, lecturer);
        return lecturer;
    }

    @http:Endpoint(method = http:HttpMethod.DELETE, path = "/staff/{staffNumber}")
    public void deleteLecturer(int staffNumber) {
        lecturers.remove(staffNumber);
    }

    @http:Endpoint(method = http:HttpMethod.GET, path = "/staff/course/{courseCode}")
    public Lecturer[] getLecturersForCourse(string courseCode) {
        List<Lecturer> lecturersForCourse = new List<Lecturer>();
        for (Lecturer lecturer : lecturers.values()) {
            if (lecturer.getCoursesTaught().contains(courseCode)) {
                lecturersForCourse.add(lecturer);
            }
        }
        return lecturersForCourse.toArray();
    }

    @http:Endpoint(method = http:HttpMethod.GET, path = "/staff/office/{officeNumber}")
    public Lecturer[] getLecturersForOffice(int officeNumber) {
        List<Lecturer> lecturersForOffice = new List<Lecturer>();
        for (Lecturer lecturer : lecturers.values()) {
            if (lecturer.getOfficeNumber() == officeNumber) {
                lecturersForOffice.add(lecturer);
            }
        }
        return lecturersForOffice.toArray();
    }
}
