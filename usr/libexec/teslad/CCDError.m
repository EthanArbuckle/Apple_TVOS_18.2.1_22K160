@interface CCDError
+ (id)_cloudConfigErrorResponses;
+ (id)_errorStringForResponse:(id)a3;
+ (id)badFormatError;
+ (id)cleanNSError:(id)a3;
+ (id)cloudConfigErrorInResponse:(id)a3;
+ (id)deviceAlreadyEnrolledError;
+ (id)deviceNotEnrolledError;
+ (id)deviceNotFoundError;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 errorType:(id)a6;
+ (id)internalErrorWithCode:(int64_t)a3;
+ (id)invalidDeviceError;
+ (id)invalidProfileError;
+ (id)invalidSignatureError;
+ (id)maxRetriesExceededErrorWithUnderlyingError:(id)a3;
+ (id)nonceExpiredError;
+ (id)profileNotActiveError;
+ (id)profileNotFoundError;
+ (id)serverTrustError;
+ (id)serviceBusyError;
+ (id)teslaServiceDownError;
@end

@implementation CCDError

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 errorType:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v13 = v12;
  if (!v10)
  {
    v16 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"Unknown error" value:&stru_100019A88 table:0]);
    [v13 setObject:v18 forKey:NSLocalizedDescriptionKey];

    if (!v11) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  [v12 setObject:v10 forKey:NSLocalizedDescriptionKey];
  if (v11) {
LABEL_3:
  }
    [v13 setObject:v11 forKey:@"CloudConfigurationErrorType"];
LABEL_4:
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  a4,  v13));

  return v14;
}

+ (id)internalErrorWithCode:(int64_t)a3
{
  v5 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"The device failed to request configuration from the cloud." value:&stru_100019A88 table:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:a3 description:v7 errorType:@"CloudConfigurationFatalError"]);

  return v8;
}

+ (id)badFormatError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"The cloud configuration for this device is invalid." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:34003 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)maxRetriesExceededErrorWithUnderlyingError:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"The cloud configuration server is unavailable." value:&stru_100019A88 table:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:34006 description:v7 errorType:@"CloudConfigurationFatalError"]);

  if (v4)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 userInfo]);
    id v10 = (void *)v9;
    if (v9) {
      id v11 = (void *)v9;
    }
    else {
      id v11 = &__NSDictionary0__struct;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue([a1 cleanNSError:v4]);
    [v12 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];

    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v14,  [v8 code],  v12));

    v8 = (void *)v15;
  }

  return v8;
}

+ (id)invalidDeviceError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"The cloud configuration service could not verify the identity of this device." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33023 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)teslaServiceDownError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"The cloud configuration server is unavailable or busy." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:34004 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)serviceBusyError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"The cloud configuration server is busy. Please try again later." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:34005 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)serverTrustError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"The cloud configuration server could not be verified." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:34008 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)invalidSignatureError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"Invalid signature." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33016 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)invalidProfileError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"Invalid Device Enrollment Program configuration." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33002 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)profileNotActiveError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"Device Enrollment Program configuration is not active." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33017 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)profileNotFoundError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"Device Enrollment Program configuration can not be found." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33024 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)deviceNotFoundError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"Device can not be found." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33025 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)deviceAlreadyEnrolledError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"This device is already enrolled in the Device Enrollment Program." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33018 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)deviceNotEnrolledError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"This device is not enrolled in the Device Enrollment Program." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33005 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)nonceExpiredError
{
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CCDGatekeeper));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"Nonce expired." value:&stru_100019A88 table:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"MCCloudConfigurationErrorDomain" code:33014 description:v5 errorType:@"CloudConfigurationFatalError"]);

  return v6;
}

+ (id)_errorStringForResponse:(id)a3
{
  id v3 = a3;
  if (v3
    && (id v4 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v3, 4LL)) != 0LL)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](v5, "stringByTrimmingCharactersInSet:", v6));

    id v11 = *(os_log_s **)(DEPLogObjects(v8, v9, v10) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Error response for request: %{public}@",  (uint8_t *)&v13,  0xCu);
    }
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (id)cloudConfigErrorInResponse:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _errorStringForResponse:a3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _cloudConfigErrorResponses]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

+ (id)_cloudConfigErrorResponses
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006CB4;
  block[3] = &unk_100018838;
  block[4] = a1;
  if (qword_100021600 != -1) {
    dispatch_once(&qword_100021600, block);
  }
  return (id)qword_100021608;
}

+ (id)cleanNSError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v21 = 0LL;
    goto LABEL_23;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);

  if (!v5)
  {
    id v21 = v4;
    goto LABEL_23;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);

  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v9) {
    goto LABEL_18;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v25;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      int v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v13]);

      if ([v13 isEqualToString:NSUnderlyingErrorKey])
      {
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSError);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v17 = objc_claimAutoreleasedReturnValue([a1 cleanNSError:v15]);

        uint64_t v15 = (void *)v17;
      }

      else
      {
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v15, v18) & 1) == 0)
        {
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v15, v19) & 1) == 0) {
            goto LABEL_15;
          }
        }
      }

      if (!v15) {
        continue;
      }
      [v6 setObject:v15 forKeyedSubscript:v13];
LABEL_15:
    }

    id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }

  while (v10);
LABEL_18:

  if (![v6 count])
  {

    v6 = 0LL;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v20,  [v4 code],  v6));

LABEL_23:
  return v21;
}

@end