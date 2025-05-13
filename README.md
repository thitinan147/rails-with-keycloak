# 🚀 Rails + Keycloak Authentication (No Gem)

ระบบ TDD แยกไว้ที่ branch: `main`  
Branch ปัจจุบัน: `login-with-keycloak-without-using-gem`

โปรเจกต์นี้สร้างขึ้นเพื่อใช้ Keycloak เป็นระบบ Login โดยไม่ต้องใช้ gem เสริมใดๆ สำหรับ Rails และสามารถศึกษาโค้ดต่อยอดได้ง่าย

---

## 📦 ขั้นตอนการติดตั้ง

### 1. Clone Repository
```bash
git clone https://github.com/thitinan147/rails-with-keycloak.git
cd rails-with-keycloak
2. สลับ Branch
bash
Copy
Edit
git switch login-with-keycloak-without-using-gem
3. รันด้วย Docker
bash
Copy
Edit
docker-compose up
# เมื่อต้องการหยุด:
# docker-compose down
⚙️ ตั้งค่า Keycloak
เปิด http://localhost:8080 แล้วทำตามขั้นตอนต่อไปนี้:

🔸 สร้าง Realm
เข้า "Manage Realm" → Create Realm

ตั้งชื่อ (เช่น: myrealm)



🔸 สร้าง Client
ไปที่ "Clients" → Create Client

เปิด Client Authentication และ Authorization



ตั้งค่า:

Root URL: http://localhost:3000

Valid Post Logout Redirect URIs: http://localhost:3000/auth/callback



🔸 เพิ่ม User
ไปที่ "Users" → Add User

ตั้ง Username และ Email ตามต้องการ



จากนั้นไปที่ "Credentials" → ตั้ง Password แล้วเปิด "Temporary" เป็น Off



✏️ แก้ไข Code ให้ตรงกับ Realm/Client ของคุณ
ใช้ VS Code หรือ Editor อื่น แล้วค้นหาตามด้านล่าง:

🔹 sessions_controller.rb
แก้ชื่อ Realm และ Client ให้ตรงกับที่ตั้งไว้

ruby
Copy
Edit
# เปลี่ยนจาก:
realm = 'myrealm'
client_id = 'myclient'


🔹 keycloak_service.rb
แก้ชื่อ Realm, Client และ client_secret ตาม Keycloak ของคุณ

ruby
Copy
Edit
# ตัวอย่าง
realm = 'myrealm'
client_id = 'myclient'
client_secret = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'


สามารถหา client secret ได้ที่ Keycloak → Client → Credentials



🔐 การใช้งาน
➤ Login
เปิด http://localhost:3000

คลิก Login → กรอก username/password จาก Keycloak



✅ Login สำเร็จ
หน้าตาเว็บจะประมาณนี้:



🔁 Logout
กด Logout เพื่อออกจากระบบ

📚 แนะนำเพิ่มเติม
อยากศึกษาเพิ่มเติมเกี่ยวกับการเชื่อมต่อ Keycloak สามารถไล่ดูโค้ดในโปรเจกต์ได้เลย

ไม่มี gem แฝง จัดการ OAuth2 โดยตรงผ่าน Keycloak

🧪 TDD
สามารถศึกษาการเขียน Test ได้ที่ branch: main

ขอบคุณที่ใช้โปรเจกต์นี้ 🙏
สามารถ Fork และปรับแต่งเพิ่มเติมตามความต้องการได้เลย
