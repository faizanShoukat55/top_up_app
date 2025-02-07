# Top Up App

This is a Mobile Top Up App Using Flutter for (Android,IOS and WEB)

## Assuming
1. **User Balance**: Assuming static user profile and 4000 AED as a starting balance and profile is verified. You can change this static data and test the validations.
2. **Mock API**: [MockUp-API](https://mockapi.io/) - I am using mock data 


## Features
1. **Home**: On Home page, user can view Top Up history and avialble balance.
2. **Beneficiary**: Users can add up to 5 beneficiaries.
4. **Top-Up Validations**:
   - Verified users can top up - upto **1000 AED** per month.
   - Unverified users can top up - upto **500 AED** per month.
5. **Monthly Limit**: Users can transfer up to **3000 AED** to all beneficiaries per month.
6. **Top Up Fees**: **3 AED** fee is applied per top up.



## Getting Started

To start the project, run the following commands:

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Build the project:
   ```bash
   dart run build_runner build
   # or
   flutter pub run build_runner build
   ```


