# README

branch main เอาไว้ทำ TDD

ทำขึ้นมาเพื่อ bypass ไปยัง Keycloak คล้ายๆ มี template ในการเชื่อมต่อ Keycloak ให้

1. clone repo: https://github.com/thitinan147/rails-with-keycloak.git

2. switch branch ไปที่ login-with-keycloak-without-using-gem
   - git switch login-with-keycloak-without-using-gem

3. รันด้วย docker-compose
   - docker-compose up  
   - ถ้าเลิกใช้งานแล้ว ให้รัน docker-compose down

4. เปิด http://localhost:8080 แล้วตั้งค่า Keycloak ดังนี้

   - Manage realm → Create realm → Realm name: ตั้งชื่อ realm (เช่น myrealm)  
     <img width="1186" alt="image" src="https://github.com/user-attachments/assets/be89d430-321b-4fa9-944c-6da11df7247b" />

   - ไปที่ Clients → Create client  
     <img width="829" alt="image" src="https://github.com/user-attachments/assets/233b452e-bc9b-4aec-8a60-cfe5dd3fee62" />

   - เปิด client authentication: on, เปิด Authorization: on  
     <img width="898" alt="image" src="https://github.com/user-attachments/assets/5b295793-21fa-499e-8308-1199d7761d14" />

   - ตั้งค่า:
     - Root URL: http://localhost:3000  
     - Valid post logout redirect URLs: http://localhost:3000/auth/callback  
     <img width="767" alt="image" src="https://github.com/user-attachments/assets/d9f6ce56-037b-4238-8a50-dc1993be8b24" />

   - Users → Add user  
     <img width="1105" alt="image" src="https://github.com/user-attachments/assets/f2d6d313-d349-491f-a118-9092e2714796" />

   - ไปที่ Credentials → ตั้งรหัสผ่าน → ปิด Temporary เป็น off  
     <img width="1069" alt="image" src="https://github.com/user-attachments/assets/6e2edead-c202-400c-ae16-6af3e5ea5c7f" />

5. แก้ไขโค้ดในโปรเจกต์ที่ clone มาให้ตรงกับ realm/client ที่สร้างไว้

   macOS:
   - คำสั่ง Command + P = ค้นหาไฟล์
   - คำสั่ง Command + F = ค้นหาข้อความในไฟล์

   - sessions_controller.rb:
     - เปลี่ยนจาก myrealm → เป็นชื่อ realm ของคุณ  
       <img width="491" alt="image" src="https://github.com/user-attachments/assets/8e0bd1ee-d12b-4005-a5e4-03d2a8322000" />

     - เปลี่ยนจาก myclient → เป็นชื่อ client ของคุณ  
       <img width="757" alt="image" src="https://github.com/user-attachments/assets/8c284021-7a39-45cd-887b-fda3646bfed5" />

   - keycloak_service.rb:
     - เปลี่ยนจาก myrealm → เป็นชื่อ realm ของคุณ  
       <img width="816" alt="image" src="https://github.com/user-attachments/assets/933a2c0f-52e9-4fb1-9343-fb55a49cfe02" />

     - เปลี่ยนจาก myclient → เป็นชื่อ client ของคุณ  
       <img width="770" alt="image" src="https://github.com/user-attachments/assets/6567c677-f73d-41f3-a4ca-b17aca634564" />

     - เปลี่ยน client_secret → เป็น client_secret ของ client นั้น (ดูใน Keycloak Admin)  
       <img width="1440" alt="image" src="https://github.com/user-attachments/assets/8456600e-086c-44e5-88b6-ca7c0867eed6" />
       <img width="686" alt="image" src="https://github.com/user-attachments/assets/1b3620f6-fd83-4d7d-b4cb-005e27b0b1dd" />

6. เปิด http://localhost:3000 เพื่อใช้งาน

   - login:  
     กรอก username/password ของ user ที่สร้างไว้ใน Keycloak  
     <img width="649" alt="image" src="https://github.com/user-attachments/assets/048ae0e0-c4f9-4aa1-a4dd-f84c0cf42823" />

     เมื่อ login สำเร็จ จะเห็นหน้าตาเว็บแบบนี้  
     <img width="782" alt="image" src="https://github.com/user-attachments/assets/0412138d-1462-42af-82da-503b3e34a9dc" />

   - logout:  
     กด Logout เพื่อออกจากระบบ

เสร็จแล้วจ้า 🎉

ใครอยากศึกษาต่อ
- การต่อ Keycloak เพิ่มเติมสามารถแกะดูโค้ดได้เลย
