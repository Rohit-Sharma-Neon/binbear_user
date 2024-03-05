import 'package:get/get.dart';

class BaseLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      // Welcome Screen
      "Don’t Forget Trash\nDay Again": 'Don’t Forget Trash\nDay Again',
      "Let Us Take Your\nTrash Cans Out\nFor You!": 'Let Us Take Your\nTrash Cans Out\nFor You!',
      "Sign Up For Services!": 'Sign Up For Services!',
      "Already have and account?": 'Already have and account?',
      "Log in": 'Log in',
      // Login Screen
      "Welcome to": 'Welcome to',
      "Email Address": 'Email Address',
      "Password": 'Password',
      "Enter Password": 'Enter Password',
      "Login": 'Login',
      "Forgot Password?": 'Forgot Password?',
      "Don’t have an account?": 'Don’t have an account?',
      "Sign up": 'Sign up',
      // Forgot Password
      "Forget Password?": 'Forget Password?',
      "Please enter your email address\nto send link for reset password": 'Please enter your email address\nto send link for reset password',
      "Send": 'Send',
      // Sign Up Screen
      "Let’s Get Started!": 'Let’s Get Started!',
      "Create an account by filling in the\ninformation below": 'Create an account by filling in the\ninformation below',
      "Name": 'Name',
      "Enter Full Name": 'Enter Full Name',
      "Mobile Number": 'Mobile Number',
      "Enter Mobile Number": 'Enter Mobile Number',
      "Confirm password": 'Confirm password',
      "Enter Password Again": 'Enter Password Again',
      "Already have an account?": 'Already have an account?',
      // OTP Screen
      "OTP Verification": 'OTP Verification',
      "Please enter the code that was\nsent to your phone number.": 'Please enter the code that was\nsent to your phone number.',
      "Verify": 'Verify',
      "Didn't receive OTP?": 'Didnt receive OTP?',
      "Resend Code": 'Resend Code',
      // Sign Up Success Screen
      "Welcome Jeck!": 'Welcome Jeck!',
      "Homepage": 'Homepage',
      "You have successfully created\nyour BinBear account! You can\nnow access your account and\nschedule services.": 'You have successfully created\nyour BinBear account! You can\nnow access your account and\nschedule services.',
      // Location Screen
      "Address": 'Address',
      "Please allow us to fetch your\nlocation, or you can add your\nlocation manually.": 'Please allow us to fetch your\nlocation, or you can add your\nlocation manually.',
      "Enable Location": 'Enable Location',
      "Add Location Manually": 'Add Location Manually',
      "Skip": 'Skip',
      // Manual Address
      "Use Current Location": 'Use Current Location',
      "Saved Address": 'Saved Address',
      "Powered By Google": 'Powered By Google',
      // Map View Screen
      "Select Delivery Location": 'Select Delivery Location',
      "LOCATE ME": 'LOCATE ME',
      "Change": 'Change',
      "Confirm Location": 'Confirm Location',
      // Dashboard
      "Home": 'Home',
      "Bookings": 'Bookings',
      "Chat": 'Chat',
      "Account": 'Account',
      // Dashboard -> Home Tab
      "Services": 'Services',
      "Upcoming Bookings": 'Upcoming Bookings',
      "See All": 'See All',
      "Schedule Pick-up": 'Schedule Pick-up',
      "Book Now": 'Book Now',
      // Dashboard -> Bookings Tab
      "My Bookings": 'My Bookings',
      "Upcoming": 'Upcoming',
      "Past": 'Past',
      // Dashboard -> Chat Tab
      "Type here": 'Type here',
      // Dashboard -> Profile Tab
      "My Account": 'My Account',
      "Edit Profile": 'Edit Profile',
      "Settings": 'Settings',
      // Edit Profile
      "Gender": 'Gender',
      "Male": 'Male',
      "Female": 'Female',
      "Save": 'Save',
      // Drawer
      "Our Story": 'Our Story',
      "Contact Us": 'Contact Us',
      "Introductory Videos": 'Introductory Videos',
      "Privacy Policy": 'Privacy Policy',
      "Terms & Conditions": 'Terms & Conditions',
      "Log Out": 'Log Out',
      // Booking Details
      "Booking Detail": 'Booking Detail',
      "Service": 'Service',
      "Time": 'Time',
      "No. of Cans": 'No. of Cans',
      "Pick-up Location": 'Pick-up Location',
      "Paid Amount": 'Paid Amount',
      "On The Way": 'On The Way',
      "Download Invoice": 'Download Invoice',
      "Re-Book": 'Re-Book',
      "Give Rating": 'Give Rating',
      "Rate your BinBear!": 'Rate your BinBear!',
      "Submit": 'Submit',
      // Settings
      "Notification": 'Notification',
      "Turn on your notification alert": 'Turn on your notification alert',
      "Change Password": 'Change Password',
      // Change Password
      "Old Password": 'Old Password',
      "New Password": 'New Password',
      "Enter New Password": 'Enter New Password',
      "Confirm Password": 'Confirm Password',
      "Welcome to Binbear": 'Welcome to Binbear',
      // Service Booking
      "1x Can2curb service":'1x Can2curb service',
      "Weekly Service":'Weekly Service',
      "Select the Service\nThat Best Meets your Needs":'Select the Service\nThat Best Meets your Needs',
      "Monthly Service":'Monthly Service',
      "Next":'Next',
      "Your cans will be placed on your curb\nduring the evening prior to service day\nor the morning of service day before\n6am. Then they will be returned once\nthey are emptied.":'Your cans will be placed on your curb\nduring the evening prior to service day\nor the morning of service day before\n6am. Then they will be returned once\nthey are emptied.',
      "Payment Amount":'Payment Amount',
      "Confirm & Pay":'Confirm & Pay',
      "Make Payment":'Make Payment',
      "Name on Card":'Name on Card',
      "Enter Name":'Enter Name',
      "Card Number":'Card Number',
      "Enter Card Number":'Enter Card Number',
      "Expiry Date":'Expiry Date',
      "MM/YY":'MM/YY',
      "Security Code":'Security Code',
      "CVV":'CVV',
      "Pay Now":'Pay Now',
      "Wow! Thank You For Allowing\nBinbear The Opportunity To Help\nMake Your Life Easier.":'Wow! Thank You For Allowing\nBinbear The Opportunity To Help\nMake Your Life Easier.',
      "Done":'Done',
      "Please select the appropriate\nload size":'Please select the appropriate\nload size',
      "Medium":'Medium',
      "Large":'Large',
      "XL - Multiple: ":'XL - Multiple',
      "Please upload 3 photos of the trash you\nwould like to picked-up":'Please upload 3 photos of the trash you\nwould like to picked-up',
      "Upload a picture":'Upload a picture',
      "You don't have to take your trash cans to the street. We'll collect them, clean them, and return them to your home.":"You don't have to take your trash cans to the street. We'll collect them, clean them, and return them to your home.",
      "/Month":'/Month',
    },

    'de_DE': {
      "Create an account by filling in the\ninformation below": 'jsd fksdahklfhdkslflksadflksd fl',
    }
  };
}