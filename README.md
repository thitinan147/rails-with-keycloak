# 🔐 Rails + Keycloak Authentication (No Gem)

โปรเจกต์นี้สร้างขึ้นเพื่อใช้ Keycloak ทำระบบ Login ใน Rails แบบไม่ใช้ Gem โดยมีตัวอย่าง Template และสามารถศึกษาโค้ดเพื่อใช้งานต่อได้ทันที

> 🧪 Branch `main` เอาไว้ทำ TDD  
> ✅ Branch ที่ใช้ Keycloak: `login-with-keycloak-without-using-gem`

---

## 🚀 เริ่มต้นใช้งาน

### 1. Clone โปรเจกต์

```bash
git clone https://github.com/thitinan147/rails-with-keycloak.git
cd rails-with-keycloak
```bash
2. เปลี่ยนไปที่ Branch สำหรับ Keycloak
bash
Copy
Edit
git switch login-with-keycloak-without-using-gem
3. รันด้วย Docker
bash
Copy
Edit
docker-compose up
เมื่อเลิกใช้งาน:

bash
Copy
Edit
docker-compose down
⚙️ ตั้งค่า Keycloak
เปิดเบราว์เซอร์ที่ http://localhost:8080 แล้วทำตามขั้นตอนนี้:

▶️ สร้าง Realm ใหม่
เข้าไปที่ Manage realm → Create realm

ตั้งชื่อ (เช่น: myrealm)

<img width="1186" alt="image" src="https://github.com/user-attachments/assets/be89d430-321b-4fa9-944c-6da11df7247b" />
▶️ สร้าง Client ใหม่
เข้าเมนู Clients → Create client

<img width="829" alt="image" src="https://github.com/user-attachments/assets/233b452e-bc9b-4aec-8a60-cfe5dd3fee62" />
เปิด Client authentication และ Authorization ให้เป็น ON

<img width="898" alt="image" src="https://github.com/user-attachments/assets/5b295793-21fa-499e-8308-1199d7761d14" />
กำหนดค่าดังนี้:

Root URL: http://localhost:3000

Valid Post Logout Redirect URLs: http://localhost:3000/auth/callback

<img width="767" alt="image" src="https://github.com/user-attachments/assets/d9f6ce56-037b-4238-8a50-dc1993be8b24" />
▶️ สร้าง User
เข้าเมนู Users → Add user

<img width="1105" alt="image" src="https://github.com/user-attachments/assets/f2d6d313-d349-491f-a118-9092e2714796" />
ไปที่ Credentials → ตั้งรหัสผ่าน และปิด Temporary (เปลี่ยนเป็น OFF)

<img width="1069" alt="image" src="https://github.com/user-attachments/assets/6e2edead-c202-400c-ae16-6af3e5ea5c7f" />
🛠 แก้ไขโค้ดให้ตรงกับ Realm / Client ที่ตั้งไว้
เปิดโปรเจกต์ใน Editor ที่ชอบ เช่น VSCode
(กด ⌘ + P เพื่อค้นหาไฟล์, ⌘ + F เพื่อค้นหาข้อความ)

📁 sessions_controller.rb
แก้ชื่อ Realm จาก myrealm → ชื่อ Realm ของคุณ

<img width="491" alt="image" src="https://github.com/user-attachments/assets/8e0bd1ee-d12b-4005-a5e4-03d2a8322000" />
แก้ชื่อ Client จาก myclient → ชื่อ Client ของคุณ

<img width="757" alt="image" src="https://github.com/user-attachments/assets/8c284021-7a39-45cd-887b-fda3646bfed5" />
📁 keycloak_service.rb
เปลี่ยน myrealm → ชื่อ Realm ที่ตั้งไว้

<img width="816" alt="image" src="https://github.com/user-attachments/assets/933a2c0f-52e9-4fb1-9343-fb55a49cfe02" />
เปลี่ยน myclient → ชื่อ Client

<img width="770" alt="image" src="https://github.com/user-attachments/assets/6567c677-f73d-41f3-a4ca-b17aca634564" />
กรอก client_secret จาก Keycloak → Admin Console → Credentials

<img width="1440" alt="image" src="https://github.com/user-attachments/assets/8456600e-086c-44e5-88b6-ca7c0867eed6" /> <img width="686" alt="image" src="https://github.com/user-attachments/assets/1b3620f6-fd83-4d7d-b4cb-005e27b0b1dd" />
🌐 ทดสอบระบบ Login
เปิดเบราว์เซอร์: http://localhost:3000

🔑 Login
กดปุ่ม Login

กรอก username และ password จาก Keycloak ที่สร้างไว้

<img width="649" alt="image" src="https://github.com/user-attachments/assets/048ae0e0-c4f9-4aa1-a4dd-f84c0cf42823" />
✅ Login สำเร็จ
หน้าเว็บจะเปลี่ยนเป็นแบบนี้

<img width="782" alt="image" src="https://github.com/user-attachments/assets/0412138d-1462-42af-82da-503b3e34a9dc" />
🔓 Logout
คลิกปุ่ม Logout เพื่อออกจากระบบ

📚 แนะนำเพิ่มเติม
ผู้ที่สนใจสามารถศึกษาโค้ดทั้งหมดต่อได้เลย โครงสร้างง่าย ไม่มี Gem แฝง

ต่อ Keycloak เองได้อย่างชัดเจน เหมาะกับการใช้งานจริง

ขอบคุณที่ใช้งาน 🙏
หากโปรเจกต์นี้มีประโยชน์ อย่าลืม ⭐️ ให้กำลังใจกันนะครับ
