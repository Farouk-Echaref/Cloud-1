# Cloud-1

![alt text](ansible_playbooks-scaled.jpg)

Each play in a playbook defines a set of hosts and executes tasks to achieve a specific goal. Within a play, tasks are organized into roles or defined directly, with each task invoking an Ansible module to perform an action.

## **Ansible Modular Approach**

Ansible's **modular approach** revolves around using reusable, self-contained components called **modules** to perform automation tasks. These modules handle specific functions like installing packages, managing files, configuring services, or deploying applications.  

### Key Aspects:
- **Idempotency**: Ensures tasks only change the system when necessary.
- **Declarative Syntax**: Users define the desired state, and Ansible enforces it.
- **Reusability**: Modules can be used across multiple playbooks and roles.
- **Extensibility**: Custom modules can be written in Python, Bash, or other languages.
- **Role-based Organization**: Roles structure tasks, handlers, templates, and variables into reusable units.

Ansible provides **built-in modules** (e.g., `yum`, `apt`, `copy`, `service`, `shell`) and supports **custom modules** for specialized tasks, making automation flexible and scalable.

### **Example: Using a Built-in Ansible Module (`copy`)**
The `copy` module is used to transfer files from the control node to managed hosts.

#### **Playbook Using the `copy` Module**
```yaml
- name: Copy a file to remote host
  hosts: all
  tasks:
    - name: Copy a file to /tmp directory
      copy:
        src: myfile.txt
        dest: /tmp/myfile.txt
        owner: root
        group: root
        mode: '0644'
```
👉 This ensures `myfile.txt` is copied to `/tmp` on all target hosts with the correct permissions.

---

### **Example: Custom Ansible Module (Python)**
A simple custom module (`hello.py`) that prints a message.

#### **Step 1: Create the Custom Module (`library/hello.py`)**
```python
#!/usr/bin/python

from ansible.module_utils.basic import AnsibleModule

def main():
    module = AnsibleModule(
        argument_spec={
            "name": {"type": "str", "required": False, "default": "World"},
        }
    )

    name = module.params["name"]
    message = f"Hello, {name}!"

    module.exit_json(changed=False, message=message)

if __name__ == "__main__":
    main()
```

#### **Step 2: Use the Custom Module in a Playbook**
```yaml
- name: Test Custom Module
  hosts: localhost
  tasks:
    - name: Run custom hello module
      hello:
        name: "Ansible User"
      register: result

    - debug:
        msg: "{{ result.message }}"
```

👉 This will output:
```
TASK [debug] 
ok: [localhost] => {
    "msg": "Hello, Ansible User!"
}
```

### **Key Points**
- **Built-in modules** (like `copy`) simplify common automation tasks.
- **Custom modules** allow adding functionality that isn't available in built-in modules.
- Custom modules are stored in the `library/` directory and used like built-in ones.

- resource: https://www.redhat.com/en/topics/automation/what-is-an-ansible-module
- resource for ansible playbooks: https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html

## **Ansible Roles Approach**

Ansible's **roles** provide a structured way to organize and reuse automation tasks. Roles group related tasks, variables, templates, files, and handlers into independent units, making playbooks cleaner, more maintainable, and reusable.

### **Key Concepts of Roles:**
- **Directory Structure**: Roles are organized into a predefined directory structure for easy management.
- **Reusability**: A role can be reused across different playbooks and projects.
- **Modularity**: Roles encapsulate related components, making the playbook more readable and maintainable.

#### **Role Directory Structure**  
A typical role directory looks like this:
```
my_role/
├── defaults/
│   └── main.yml        # Default variables
├── files/
│   └── myfile.txt      # Files to be copied to target hosts
├── handlers/
│   └── main.yml        # Handlers (e.g., restart service)
├── meta/
│   └── main.yml        # Metadata (e.g., dependencies)
├── tasks/
│   └── main.yml        # Main tasks (the core functionality of the role)
├── templates/
│   └── mytemplate.j2   # Jinja2 templates
└── vars/
    └── main.yml        # Variables specific to this role
```

---

### **Example: Using Roles**

#### **Step 1: Define a Simple Role**

In the `tasks/main.yml` of a role, you define the tasks:
```yaml
# my_role/tasks/main.yml
- name: Install Nginx
  apt:
    name: nginx
    state: present

- name: Start Nginx service
  service:
    name: nginx
    state: started
    enabled: yes
```

#### **Step 2: Use the Role in a Playbook**
```yaml
- name: Setup Web Server
  hosts: web_servers
  roles:
    - my_role
```

#### **Step 3: Role with Default Variables**

In `defaults/main.yml`:
```yaml
# my_role/defaults/main.yml
nginx_port: 80
```

You can use this variable in the role’s tasks:
```yaml
# my_role/tasks/main.yml
- name: Configure Nginx to listen on custom port
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
  notify: Restart Nginx
```

#### **Step 4: Handlers for Restarting Nginx**

In `handlers/main.yml`:
```yaml
# my_role/handlers/main.yml
- name: Restart Nginx
  service:
    name: nginx
    state: restarted
```

---

### **Benefits of Using Roles**
- **Separation of Concerns**: Roles group related tasks and components, making them easier to manage and understand.
- **Modular**: Roles can be reused in multiple playbooks.
- **Scalable**: Easily scale automation by adding new tasks or modifying existing ones within roles without changing the overall structure of the playbook.


- resource: https://spacelift.io/blog/ansible-roles
- resource: https://docs.ansible.com/ansible/2.9/user_guide/playbooks_reuse_roles.html?highlight=roles
- resource: https://docs.ansible.com/ansible/2.9/user_guide/playbooks_reuse_roles.html?highlight=roles
