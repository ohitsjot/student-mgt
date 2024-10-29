from django.db import models

class Department(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    status = models.BooleanField(default=True)  # True for active, False for inactive

    def __str__(self):
        return self.name

class Course(models.Model):
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    status = models.BooleanField(default=True)

    def __str__(self):
        return self.name

class Instructor(models.Model):
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    status = models.BooleanField(default=True)

    def __str__(self):
        return self.name

class Student(models.Model):
    student_id = models.CharField(max_length=20, unique=True)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Subject(models.Model):
    name = models.CharField(max_length=100)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    instructor = models.ForeignKey(Instructor, on_delete=models.CASCADE)
    school_level = models.CharField(max_length=50)
    school_year = models.CharField(max_length=50)
    students = models.ManyToManyField(Student, related_name='subjects', blank=True)

    def __str__(self):
        return self.name