# Car Rental App
The Car Rental App is a Flutter-based mobile application that allows users to easily rent cars. The app provides a simple, intuitive user interface and seamless integration with Firebase for secure authentication and database storage.

## Features
* Sign in using email and password authentication provided by Firebase
* View profile information and two lists of cars on the home screen
* List of popular cars in Saudi Arabia with details such as car company name, model name, year, and daily rental price
* List of currently available cars for rent
* Rent cars by selecting a specific car and inputting start and end dates of rental period
* Generate an invoice for the selected car, including car information, user information, and total price for the specified duration
* Store invoice data in the database as a new invoice
## Getting Started
### Prerequisites
To run the Car Rental App on your local machine, you'll need to have the following installed:

- Flutter SDK (v2.8.1 or higher)
- Android Studio
- Firebase tools

### Installation
1. Clone the repository:
```
git clone https://github.com/[YamenAlrehaili]/car-rental-app.git
```
2. Navigate to the project directory:
```
cd car-rental-app
```
3. Install the required packages:
```
flutter pub get
```
4. Configure Firebase by following the instructions in the [Firebase documentation](https://firebase.flutter.dev/docs/overview/).
### Usage
1. Run the app on your emulator or physical device using the following command:
```
flutter run
```
2. Sign in using your email and password.

3. Browse the list of popular cars and available cars.

4. Select a car and input the start and end dates of the rental period.

5. Review the invoice for the selected car, including car information, user information, and total price for the specified duration.

6. Confirm the rental by submitting the invoice.

### Credits
- Flutter
- Dart
- Firebase
