# Cloud-1

![alt text](ansible_playbooks-scaled.jpg)

Each play in a playbook defines a set of hosts and executes tasks to achieve a specific goal. Within a play, tasks are organized into roles or defined directly, with each task invoking an Ansible module to perform an action.

## using ansible modular approach

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


## Ansible roles:
