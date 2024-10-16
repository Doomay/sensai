# SensAI

Mobile application for the SensAI team.

## Getting Started

Ensure you have the proper dependencies downloaded:
- [Flutter](https://flutter.dev/docs/get-started/install)
- [NodeJS](https://nodejs.org/en/download/prebuilt-installer)
- [PostgreSQL](https://www.postgresql.org/download/)

If you want to use an emulator, ensure you have these installed:
> Android / IOS SDK
> Emulator

To set up the PostgreSQL database, follow these steps:
1. Ensure PostgreSQL is installed and running.
2. Create a new database (e.g., sensai):
```bash
psql -U your_username -c CREATE DATABASE sensai;
```
Use the provided sensai.sql file to create the necessary schema:
```bash
psql -U your_username -d sensai -f sensai.sql
```

On first startup, run the following commands:
```bash
1. npm init -y
2. npm install express pg body-parser cors
3. flutter clean
4. flutter build windows
5. node server.js #NOTE: Change in server.js the settings according to your name/password
```


After that you can run the application using an emulator or the web browser.

# NOTE:
Emulator applications use a different local ip-adress than a Windows application. If it's set to localhost:3000, it's set up for web browser.
This is only an issue in an development setting because of differences in using an emulator or web browser.
> You can change the values for IP in:
lib\modules\SignUp\controller\signUpController.dart & lib\modules\SignUp\controller\logInController.dart