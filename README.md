Rails with Keycloak (Without Using Gem)
⚙️ ตัวอย่างโปรเจกต์ Ruby on Rails ที่เชื่อมต่อกับ Keycloak โดย ไม่ใช้ Gem เสริม
📌 เหมาะสำหรับผู้ที่ต้องการเรียนรู้วิธีเชื่อมต่อ Keycloak ด้วยตัวเองแบบ manual พร้อม TDD บน branch main

📦 Clone และ Setup โปรเจกต์
bash
Copy
Edit
git clone https://github.com/thitinan147/rails-with-keycloak.git
cd rails-with-keycloak
git switch login-with-keycloak-without-using-gem
docker-compose up
เสร็จแล้ว กด CTRL+C เพื่อหยุด และใช้ docker-compose down เพื่อปิด container

🔐 ตั้งค่า Keycloak
เข้าใช้งาน Keycloak ที่ http://localhost:8080

➤ สร้าง Realm
ไปที่ Manage Realms → Create Realm

ตั้งชื่อ Realm (เช่น myrealm)


➤ สร้าง Client
ไปที่ Clients → Create Client

เปิด Client authentication และ Authorization

ตั้งค่า:

Field	Value
Client ID	myclient (หรือชื่อที่ต้องการ)
Root URL	http://localhost:3000
Valid Redirect URIs	http://localhost:3000/auth/callback





➤ สร้าง User
ไปที่ Users → Add User

สร้างชื่อผู้ใช้ แล้วไปที่แท็บ Credentials เพื่อกำหนดรหัสผ่าน




🛠 แก้ไขค่าในโปรเจกต์
1. เปิดไฟล์ต่อไปนี้ใน Editor
app/controllers/sessions_controller.rb

app/services/keycloak_service.rb

ใช้คำสั่งบน macOS:

Cmd + P : ค้นหาไฟล์

Cmd + F : ค้นหาคำในไฟล์

2. แก้ไขค่าต่อไปนี้
ใน sessions_controller.rb และ keycloak_service.rb
สิ่งที่ต้องแก้	ตัวอย่างค่าใหม่
myrealm	ชื่อ Realm ที่คุณสร้างไว้
myclient	ชื่อ Client ที่คุณสร้างไว้
client_secret	ดูได้จาก Keycloak Admin Console

🔑 ดู client_secret ได้ที่หน้า Client → Credentials


🚀 ทดสอบ Login
เปิด http://localhost:3000

กด Login → กรอก username & password ที่สร้างไว้

จะเข้าสู่หน้าเว็บหลัง login สำเร็จ


สามารถกด Logout ได้ตามปกติ

🎓 ศึกษาต่อ
สามารถแกะโค้ดเพื่อศึกษาวิธีเชื่อมต่อกับ Keycloak ได้เพิ่มเติม โดยไม่ต้องใช้ gem เสริมใด ๆ

🧪 หมายเหตุเกี่ยวกับ Branch
main → ใช้สำหรับเขียน TDD

login-with-keycloak-without-using-gem → ตัวอย่างการเชื่อมต่อ Keycloak แบบ manual
