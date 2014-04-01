Appsflyer iOS SDK Titanium Module
=================================

## Description

Enable to use Appsflyer Tracking service using Appcelerator

## Accessing the appsflyer Module

To access this module from JavaScript, you would do the following:

	var appsflyer = require("com.shopmium.appsflyer");

The appsflyer variable is a reference to the Module object.

## Usage

1. Initialization (mandatory)
var appsflyer = require('com.shopmium.appsflyer');
appsflyer.startTracker('APPSFLYER_APP_ID', 'APPSFLYER_DEV_KEY');

2. Set install id (optional)
appsflyer.setInstallId('unique_user_id');

3. Track app launch/installation (mandatory)
appsflyer.trackAppLaunch();

4. Track custom events (optional)
appsflyer.trackEvent('register', '');
appsflyer.trackEvent('purchase', '$3.75');

## Author

Shopmium
Arnaud Besnier
arnaud.besnier@shopmium.com

## License

no licence
