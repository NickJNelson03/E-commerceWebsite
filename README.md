# E-commerce Website

## Description
This repository contains the source code for my e-commerce website built with Ruby on Rails. It includes functionalities such as product listings, a shopping cart, and order management.

## System Requirements
To run this project, you will need the following installed on your system:
- Ruby (Version 3.0.0 or later)
- Ruby on Rails (Version 6.1.4 or later)

## Setup
Follow these steps to get the project running on your local machine:

### 1. Clone the Repository
Clone the project to your local machine:
```bash
git clone git@github.com:NickJNelson03/E-commerceWebsite.git
cd your-repository-name
```

## Implementation within the Gemfile
### Devise Implementation:
- Devise is a popular authentication solution for Rails applications.
- Add gem 'devise' to your Gemfile.
- Run bundle install to install the gem.
- Run rails generate devise:install to install Devise in your application.
- Follow the instructions provided by Devise to set up user authentication, such as generating models and views.
- Customize Devise views and configurations as needed for your e-commerce website.
### Stripe Integration:
- Stripe is a payment processing platform that allows you to accept payments securely.
- Add gem 'stripe' to your Gemfile or nano Gemfile and put gem 'stripe' inside.
- Run bundle install to install the gem.
- Sign up for a Stripe account if you haven't already.
- Obtain your Stripe API keys from the Stripe dashboard (test and live keys).
- Configure Stripe in your Rails application by adding your API keys to the appropriate environment files (config/environments/development.rb) or whatever your filename.rb is.
