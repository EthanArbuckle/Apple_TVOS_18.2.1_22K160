@interface DefaultCoreTelephonyDataSource
+ (id)sharedInstance;
- (BOOL)isCellularServiceAvailable;
- (BOOL)subscriberCountryCodeDidChange;
- (CoreTelephonyClient)coreTelephonyClient;
- (DefaultCoreTelephonyDataSource)init;
- (NSArray)allRelevantISOCountryCodes;
- (OS_dispatch_queue)coreTelephonyClientQueue;
- (id)isSuperboxEnabled;
- (id)isoCountryCodeOverride;
- (void)setIsSuperboxEnabled:(id)a3;
- (void)setSubscriberCountryCodeDidChange:(BOOL)a3;
- (void)subscriberCountryCodeDidChange:(id)a3;
@end

@implementation DefaultCoreTelephonyDataSource

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005450;
  block[3] = &unk_100034610;
  block[4] = a1;
  if (qword_10003E588 != -1) {
    dispatch_once(&qword_10003E588, block);
  }
  return (id)qword_10003E580;
}

- (DefaultCoreTelephonyDataSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DefaultCoreTelephonyDataSource;
  v2 = -[DefaultCoreTelephonyDataSource init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.TelephonyUtilities.PhoneIntentHandler.%@",  objc_opt_class(v2));
    id v5 = objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
    coreTelephonyClientQueue = v3->_coreTelephonyClientQueue;
    v3->_coreTelephonyClientQueue = (OS_dispatch_queue *)v6;

    id isSuperboxEnabled = v3->_isSuperboxEnabled;
    v3->_id isSuperboxEnabled = &stru_100034650;
  }

  return v3;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (!coreTelephonyClient)
  {
    v4 = objc_alloc(&OBJC_CLASS___CoreTelephonyClient);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DefaultCoreTelephonyDataSource coreTelephonyClientQueue](self, "coreTelephonyClientQueue"));
    dispatch_queue_t v6 = -[CoreTelephonyClient initWithQueue:](v4, "initWithQueue:", v5);
    v7 = self->_coreTelephonyClient;
    self->_coreTelephonyClient = v6;

    -[CoreTelephonyClient setDelegate:](self->_coreTelephonyClient, "setDelegate:", self);
    coreTelephonyClient = self->_coreTelephonyClient;
  }

  return coreTelephonyClient;
}

- (NSArray)allRelevantISOCountryCodes
{
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[DefaultCoreTelephonyDataSource isoCountryCodeOverride](self, "isoCountryCodeOverride"));
  if (v3)
  {
    id v4 = IntentHandlerDefaultLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Using ISO Country Code Override: %@",  buf,  0xCu);
    }

    dispatch_queue_t v6 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v3, 0LL);
  }

  else
  {
    if (!self->_allRelevantISOCountryCodes
      || -[DefaultCoreTelephonyDataSource subscriberCountryCodeDidChange](self, "subscriberCountryCodeDidChange"))
    {
      v7 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DefaultCoreTelephonyDataSource coreTelephonyClient](self, "coreTelephonyClient"));
      id v48 = 0LL;
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getSubscriptionInfoWithError:&v48]);
      id v10 = v48;

      if (v9)
      {
        id v42 = v10;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 subscriptionsInUse]);
        id v12 = [v11 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v12)
        {
          id v13 = v12;
          v41 = v9;
          uint64_t v14 = *(void *)v45;
          do
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v45 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)i);
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[DefaultCoreTelephonyDataSource coreTelephonyClient](self, "coreTelephonyClient"));
              id v43 = 0LL;
              v18 = (NSArray *)[v17 copyMobileCountryCode:v16 error:&v43];
              v19 = (NSArray *)v43;

              if (-[NSArray length](v18, "length"))
              {
                uint64_t v20 = TUISOCountryCodeForMCC(v18);
                v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
                if ([v21 length])
                {
                  -[NSMutableOrderedSet addObject:](v7, "addObject:", v21);
                }

                else
                {
                  id v23 = IntentHandlerDefaultLog();
                  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v51 = v18;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Could not determine ISO Country Code from Mobile Country Code: %@",  buf,  0xCu);
                  }
                }
              }

              else
              {
                id v22 = IntentHandlerDefaultLog();
                v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
                if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v51 = v19;
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "Could not determine mobile country code from Core Telephony Subscription Context. Error: %@",  buf,  0xCu);
                }
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v44 objects:v49 count:16];
          }

          while (v13);
          v9 = v41;
          v3 = 0LL;
        }

        id v10 = v42;
      }

      else
      {
        id v25 = IntentHandlerDefaultLog();
        v11 = (void *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
          sub_10001FFEC((uint64_t)v10, (os_log_s *)v11, v26, v27, v28, v29, v30, v31);
        }
      }

      uint64_t v32 = TUHomeCountryCode();
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      if ([v33 length]) {
        -[NSMutableOrderedSet addObject:](v7, "addObject:", v33);
      }
      -[DefaultCoreTelephonyDataSource setSubscriberCountryCodeDidChange:]( self,  "setSubscriberCountryCodeDidChange:",  0LL);
      v34 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v7, "array"));
      allRelevantISOCountryCodes = self->_allRelevantISOCountryCodes;
      self->_allRelevantISOCountryCodes = v34;

      id v36 = IntentHandlerDefaultLog();
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = self->_allRelevantISOCountryCodes;
        *(_DWORD *)buf = 138412290;
        v51 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Resolved relevant ISO country codes: %@",  buf,  0xCu);
      }
    }

    dispatch_queue_t v6 = self->_allRelevantISOCountryCodes;
  }

  v39 = v6;

  return v39;
}

- (BOOL)isCellularServiceAvailable
{
  if ((*((unsigned int (**)(void))self->_isSuperboxEnabled + 2))())
  {
    id v3 = IntentHandlerDefaultLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Superbox is enabled, returning YES", buf, 2u);
    }

    BOOL v5 = 1;
  }

  else
  {
    dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DefaultCoreTelephonyDataSource coreTelephonyClient](self, "coreTelephonyClient"));
    id v40 = 0LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getSubscriptionInfoWithError:&v40]);
    id v4 = (os_log_s *)v40;

    if (v7)
    {
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 subscriptionsInUse]);
      id v9 = [v8 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v9)
      {
        id v11 = v9;
        uint64_t v32 = v7;
        v33 = v4;
        uint64_t v12 = *(void *)v37;
        uint64_t v13 = kCTRegistrationStatusRegisteredHome;
        uint64_t v34 = kCTRegistrationStatusRegisteredRoaming;
        *(void *)&__int128 v10 = 138412290LL;
        __int128 v31 = v10;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v37 != v12) {
              objc_enumerationMutation(v8);
            }
            uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[DefaultCoreTelephonyDataSource coreTelephonyClient](self, "coreTelephonyClient", v31));
            id v35 = 0LL;
            id v17 = [v16 copyRegistrationStatus:v15 error:&v35];
            id v18 = v35;

            if ([v17 length])
            {
              if (([v17 isEqualToString:v13] & 1) != 0
                || ([v17 isEqualToString:v34] & 1) != 0)
              {

                BOOL v5 = 1;
                v7 = v32;
                id v4 = v33;
                goto LABEL_27;
              }

              id v19 = IntentHandlerDefaultLog();
              uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v42 = v17;
                __int16 v43 = 2112;
                uint64_t v44 = v15;
                _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] Cellular service is not available for SIM. Registration Status: %@ Subscription context: %@",  buf,  0x16u);
              }
            }

            else
            {
              id v21 = IntentHandlerDefaultLog();
              uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v31;
                id v42 = v18;
                _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Could not determine registration status from Core Telephony Subscription Context. Error: %@",  buf,  0xCu);
              }
            }
          }

          id v11 = [v8 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v11) {
            continue;
          }
          break;
        }

        v7 = v32;
        id v4 = v33;
      }
    }

    else
    {
      id v22 = IntentHandlerDefaultLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        sub_10001FFEC((uint64_t)v4, (os_log_s *)v8, v23, v24, v25, v26, v27, v28);
      }
    }

    id v29 = IntentHandlerDefaultLog();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Determined cellular service is unavailable.",  buf,  2u);
    }

    BOOL v5 = 0;
LABEL_27:
  }

  return v5;
}

- (void)subscriberCountryCodeDidChange:(id)a3
{
}

- (id)isoCountryCodeOverride
{
  if (_TUIsInternalInstall(self, a2))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tu_defaults](&OBJC_CLASS___NSUserDefaults, "tu_defaults"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:@"IntentHandlerISOCountryCodeInternalOverride"]);

    if (v3)
    {
      id v4 = IntentHandlerDefaultLog();
      BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100020050((uint64_t)v3, v5);
      }
    }
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (id)isSuperboxEnabled
{
  return self->_isSuperboxEnabled;
}

- (void)setIsSuperboxEnabled:(id)a3
{
}

- (OS_dispatch_queue)coreTelephonyClientQueue
{
  return self->_coreTelephonyClientQueue;
}

- (BOOL)subscriberCountryCodeDidChange
{
  return self->_subscriberCountryCodeDidChange;
}

- (void)setSubscriberCountryCodeDidChange:(BOOL)a3
{
  self->_subscriberCountryCodeDidChange = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end