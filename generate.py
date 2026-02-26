# generate_hash.py
from passlib.context import CryptContext

pwd_context = CryptContext(schemes=['bcrypt'], deprecated='auto')

test_passwords = [
    ('admin123', 'admin'),
    ('operator123', 'operator'),
    ('staff123', 'staff'),
    ('viewer123', 'viewer'),
    ('dosen123', 'dosen'),
    ('mahasiswa123', 'mahasiswa')
]

print("=== GENERATED BCrypt HASHES ===")
for password, username in test_passwords:
    hashed = pwd_context.hash(password)
    print(f"\n-- {username.upper()} (password: {password}) --")
    print(f"HASH: {hashed}")
    print(f"VERIFY TEST: {pwd_context.verify(password, hashed)}")

print("\n=== SQL INSERT STATEMENTS ===")
print("-- Copy paste ini ke phpMyAdmin --")
print("DELETE FROM users;")
print("\nINSERT INTO users (username, password, name, role) VALUES")

for i, (password, username) in enumerate(test_passwords):
    hashed = pwd_context.hash(password)
    role = username if username != 'mahasiswa' else 'user'
    name = f"{username.capitalize()} User"
    
    if username == 'admin':
        name = "Administrator"
    elif username == 'operator':
        name = "System Operator"
    elif username == 'staff':
        name = "Staff Admin"
    elif username == 'viewer':
        name = "Viewer Only"
    elif username == 'dosen':
        name = "Dosen Contoh"
    
    comma = "," if i < len(test_passwords) - 1 else ";"
    print(f"  ('{username}', '{hashed}', '{name}', '{role}'){comma}")