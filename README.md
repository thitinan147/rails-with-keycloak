# README

branch main เอาไว้ทำ TDD

ทำขึ้นมาเพื่อ bypass ไปยัง keycloak คล้ายๆมี template ในการต่อ keycloak ให้ 

1. clone repo: https://github.com/thitinan147/rails-with-keycloak.git

2. switch branch to login-with-keycloak-without-using-gem
  - git switch login-with-keycloak-without-using-gem

3. docker-compose up ถ้าไม่ใช้แล้ว docker-compose down

4. ไปที่ http://localhost:8080
  - Manage realm -> Create realm -> Realm name: ชื่อ realm ex. myrealm
  - create client
  - client authentication: on
  - Authorization: on
  - Root URL: http://localhost:3000
  - Valid post logout redirect URLs: http://localhost:3000/auth/callback
  - create uesr 
    - username:
    - credentials -> set password 

5. ไปแก้ไข code 
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

