// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

var appsflyer = require('com.shopmium.appsflyer');
Ti.API.info("module is => " + appsflyer);

appsflyer.startTracker('APPSFLYER_DEV_KEY', 'APPSFLYER_APP_ID');
appsflyer.setInstallId('unique_user_id');

appsflyer.trackAppLaunch();
appsflyer.trackAction('register', '');
appsflyer.trackAction('purchase', '$3.75');



