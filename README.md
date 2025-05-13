# README

branch main เอาไว้ทำ TDD

ทำขึ้นมาเพื่อ bypass ไปยัง keycloak คล้ายๆมี template ในการต่อ keycloak ให้ 

1. clone repo: https://github.com/thitinan147/rails-with-keycloak.git

2. switch branch to login-with-keycloak-without-using-gem
  - git switch login-with-keycloak-without-using-gem

3. docker-compose up ถ้าไม่ใช้แล้ว docker-compose down

4. ไปที่ http://localhost:8080
  - Manage realm -> Create realm -> Realm name: ชื่อ realm (ex. myrealm)
  <img width="1186" alt="image" src="https://github.com/user-attachments/assets/be89d430-321b-4fa9-944c-6da11df7247b" />

  - Client -> Create client
  <img width="829" alt="image" src="https://github.com/user-attachments/assets/233b452e-bc9b-4aec-8a60-cfe5dd3fee62" />

  - client authentication: on, Authorization: on
  <img width="898" alt="image" src="https://github.com/user-attachments/assets/5b295793-21fa-499e-8308-1199d7761d14" />

  - Root URL: http://localhost:3000, Valid post logout redirect URLs: http://localhost:3000/auth/callback
  <img width="767" alt="image" src="https://github.com/user-attachments/assets/d9f6ce56-037b-4238-8a50-dc1993be8b24" />

  - Users -> Add user
  <img width="1105" alt="image" src="https://github.com/user-attachments/assets/f2d6d313-d349-491f-a118-9092e2714796" />

  - Credentials -> set password
  <img width="1069" alt="image" src="https://github.com/user-attachments/assets/6e2edead-c202-400c-ae16-6af3e5ea5c7f" />

5. ไปแก้ไข code ที่ clone ลงมาในเครื่อง
   macOS ใช้คำสั่ง command + p (ค้นหา file)
   macOS ใช้คำสั่ง command + f (ค้นหา ตัวหนังสือในไฟล์)
   
  - sessions_controller.rb:
  - เปลี่ยนจาก myrealm => ชื่อ realm ที่สร้างเอง
  <img width="491" alt="image" src="https://github.com/user-attachments/assets/8e0bd1ee-d12b-4005-a5e4-03d2a8322000" />
  
  - เปลี่ยนจาก myclient => ชื่อ client ที่สร้างเอง
  <img width="757" alt="image" src="https://github.com/user-attachments/assets/8c284021-7a39-45cd-887b-fda3646bfed5" />

  - keycloak_service.rb:
  - เปลี่ยนจาก myrealm => ชื่อ realm ที่สร้างเอง
  <img width="816" alt="image" src="https://github.com/user-attachments/assets/933a2c0f-52e9-4fb1-9343-fb55a49cfe02" />
  
  - เปลี่ยนจาก myclient => ชื่อ client ที่สร้างเอง
  <img width="770" alt="image" src="https://github.com/user-attachments/assets/6567c677-f73d-41f3-a4ca-b17aca634564" />

  เปลี่ยนจาก client_secret => ชื่อ client_secret ตัวเองใน keycloak admin console
  <img width="1440" alt="image" src="https://github.com/user-attachments/assets/8456600e-086c-44e5-88b6-ca7c0867eed6" />
  <img width="686" alt="image" src="https://github.com/user-attachments/assets/1b3620f6-fd83-4d7d-b4cb-005e27b0b1dd" />

6. ไปที่ http://localhost:3000
  - login
    กรอก username, password ที่สร้างไว้ก่อนหน้านี้
    <img width="649" alt="image" src="https://github.com/user-attachments/assets/048ae0e0-c4f9-4aa1-a4dd-f84c0cf42823" />

    login สำเร็จ จะเห็นหน้าตาเว็บประมาณนี้
    <img width="782" alt="image" src="https://github.com/user-attachments/assets/0412138d-1462-42af-82da-503b3e34a9dc" />

  - logout

เสร็จแล้วจ้า

ใครอยากศึกษาต่อ
  การต่อ keycloak แกะ code ได้เลย

