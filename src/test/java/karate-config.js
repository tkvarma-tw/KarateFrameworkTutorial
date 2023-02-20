function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
  env = 'dev';
  karate.log('No karate.env system property was passed hence default value:', env);
  }
  var config = {
	appBaseURL: 'http://localhost:9898',
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

  return config;
}