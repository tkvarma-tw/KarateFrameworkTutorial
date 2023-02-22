function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
  env = 'dev';
  karate.log('No karate.env system property was passed hence default value:', env);
  }
  var config = {
	appBaseURL: 'http://localhost:9898',
	authToken: '0ec04e5ba83cb12a9c72d80b6ab6c9aa797a1ee60932ebfb9b5e21ab2da383be',
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.appBaseURL = 'https://reqres.in/api/';
  } else if (env == 'qa') {
	  config.appBaseURL = 'https://reqres.in/api/';
  } else if (env == 'staging') {
	  config.appBaseURL = 'https://reqres.in/api/';
  } else if (env == 'preprod') {
  } else if (env == 'prod') {
  }
  var result= karate.callSingle('GetUserDetails.feature');
  config.userInfo = result;
  return config;
}