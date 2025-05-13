# README

branch main เอาไว้ทำ TDD

ทำขึ้นมาเพื่อ bypass ไปยัง keycloak คล้ายๆมี template ในการต่อ keycloak ให้ 

1. clone repo: https://github.com/thitinan147/rails-with-keycloak.git

2. switch branch to login-with-keycloak-without-using-gem
  - git switch login-with-keycloak-without-using-gem

3. docker-compose up ถ้าไม่ใช้แล้ว docker-compose down

4. ไปที่ http://localhost:8080
  - Manage realm -> Create realm -> Realm name: ชื่อ realm (ex. myrealm)
  - <img width="1168" alt="image" src="https://github.com/user-attachments/assets/58178e45-80ad-4b1d-b9c2-995e4d1d31f4" />

  - Client -> Create client
  - <img width="829" alt="image" src="https://github.com/user-attachments/assets/233b452e-bc9b-4aec-8a60-cfe5dd3fee62" />

  - client authentication: on, Authorization: on
  - <img width="898" alt="image" src="https://github.com/user-attachments/assets/5b295793-21fa-499e-8308-1199d7761d14" />

  - Root URL: http://localhost:3000, Valid post logout redirect URLs: http://localhost:3000/auth/callback
  - <img width="767" alt="image" src="https://github.com/user-attachments/assets/d9f6ce56-037b-4238-8a50-dc1993be8b24" />

  - Users -> Add user
  - <img width="1105" alt="image" src="https://github.com/user-attachments/assets/f2d6d313-d349-491f-a118-9092e2714796" />

  - Credentials -> set password
  - <img width="1069" alt="image" src="https://github.com/user-attachments/assets/6e2edead-c202-400c-ae16-6af3e5ea5c7f" />

5. ไปแก้ไข code ที่ clone ลงมาในเครื่อง
  - sessions_controller.rb:
    - myrealm => ชื่อ realm ที่สร้างเอง
    - myclient => ชื่อ client ที่สร้างเอง
      
  - keycloak_service.rb
    - client_secret: "hQ5xv4TPvqeeht4K4e2zyxv40hNJ8dmb" เป็น client_secret: "จาก Credentials -> Client Secret"

6. ไปที่ http://localhost:3000
  - login
      - username:
      - password:
  - logout

เสร็จแล้วจ้า

ใครอยากศึกษาต่อ
  การต่อ keycloak แกะ code ได้เลย

