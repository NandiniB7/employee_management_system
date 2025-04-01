class Employee:
    def __init__(self, id, name, work_experience, domain, status, manager_id, email, photo):
        self.id = id
        self.name = name
        self.work_experience = work_experience
        self.domain = domain
        self.status = status
        self.manager_id = manager_id
        self.email = email
        self.photo = photo

class Project:
    def __init__(self, id, name, description, assigned_to):
        self.id = id
        self.name = name
        self.description = description
        self.assigned_to = assigned_to
