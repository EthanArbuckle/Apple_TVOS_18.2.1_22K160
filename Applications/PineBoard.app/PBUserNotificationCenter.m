@interface PBUserNotificationCenter
+ (id)sharedInstance;
+ (void)initializeNotificationCenterWithDelegate:(id)a3;
- (BOOL)isConnected;
- (NSMutableDictionary)registeredOperationClasses;
- (PBUserNotificationDelegate)delegate;
- (SSErrorHandler)errorHandler;
- (id)cfUserNotificationForToken:(int)a3;
- (void)_didHandleCFUserNotification:(id)a3;
- (void)_handle2SVCheck:(id)a3;
- (void)_handleCVVCheck:(id)a3;
- (void)_handleCarMCheck:(id)a3;
- (void)errorHandler:(id)a3 handleSession:(id)a4;
- (void)errorHandlerDidDisconnect:(id)a3;
- (void)initializeStoreErrorHandler;
- (void)registerOperationClass:(Class)a3 forFailureType:(int64_t)a4;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setRegisteredOperationClasses:(id)a3;
- (void)startErrorHandler;
- (void)startUserNotificationCenter;
- (void)stopErrorHandler;
@end

@implementation PBUserNotificationCenter

+ (id)sharedInstance
{
  return (id)qword_100470ED0;
}

+ (void)initializeNotificationCenterWithDelegate:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100101248;
  block[3] = &unk_1003CFF08;
  id v6 = a3;
  uint64_t v3 = qword_100470ED8;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_100470ED8, block);
  }
}

- (void)startUserNotificationCenter
{
  mach_port_t portNum = 0;
  if (bootstrap_check_in2(bootstrap_port, "com.apple.SBUserNotification", &portNum, 0LL))
  {
    id v2 = sub_100084428();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_100280BC8(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  else
  {
    v11 = CFMachPortCreateWithPort(0LL, portNum, (CFMachPortCallBack)sub_100101388, 0LL, 0LL);
    RunLoopSource = CFMachPortCreateRunLoopSource(0LL, v11, 0LL);
    CFRelease(v11);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopCommonModes);
    CFRelease(RunLoopSource);
  }

- (id)cfUserNotificationForToken:(int)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)qword_100470EC8;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "token", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (void)_didHandleCFUserNotification:(id)a3
{
  if (a3) {
    objc_msgSend((id)qword_100470EC8, "removeObject:");
  }
}

- (void)registerOperationClass:(Class)a3 forFailureType:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationCenter registeredOperationClasses](self, "registeredOperationClasses"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  [v6 setObject:a3 forKey:v7];
}

- (void)initializeStoreErrorHandler
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  -[PBUserNotificationCenter setRegisteredOperationClasses:](self, "setRegisteredOperationClasses:", v3);

  id v4 = objc_opt_new(&OBJC_CLASS___SSErrorHandler);
  errorHandler = self->_errorHandler;
  self->_errorHandler = v4;

  -[SSErrorHandler setDelegate:](self->_errorHandler, "setDelegate:", self);
  id v6 = self->_errorHandler;
  v8[0] = @"machineVerificationFailed";
  v8[1] = @"highSecurityAccountVerificationFailed";
  v8[2] = @"carrierBillingVerificationFailed";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));
  -[SSErrorHandler setFailureTypes:](v6, "setFailureTypes:", v7);

  -[PBUserNotificationCenter startErrorHandler](self, "startErrorHandler");
}

- (void)startErrorHandler
{
  if (!-[PBUserNotificationCenter isConnected](self, "isConnected"))
  {
    errorHandler = self->_errorHandler;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100101A60;
    v4[3] = &unk_1003D28B0;
    v4[4] = self;
    -[SSErrorHandler startWithCompletionBlock:](errorHandler, "startWithCompletionBlock:", v4);
  }

- (void)stopErrorHandler
{
  errorHandler = self->_errorHandler;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100101BE8;
  v3[3] = &unk_1003CFF08;
  v3[4] = self;
  -[SSErrorHandler stopWithCompletionBlock:](errorHandler, "stopWithCompletionBlock:", v3);
}

- (void)errorHandlerDidDisconnect:(id)a3
{
  id v4 = sub_100084428();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = (id)objc_opt_class(self);
    id v6 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: disconnected from daemon",  (uint8_t *)&v8,  0xCu);
  }

  -[PBUserNotificationCenter startErrorHandler](self, "startErrorHandler");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
  [v7 reload];
}

- (void)errorHandler:(id)a3 handleSession:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForProperty:SSErrorSessionPropertyFailureType]);
  id v7 = sub_100084428();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = (id)objc_opt_class(self);
    __int16 v16 = 2112;
    v17 = v6;
    id v9 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: failureType %@", (uint8_t *)&v14, 0x16u);
  }

  if ([v6 isEqualToString:@"machineVerificationFailed"])
  {
    -[PBUserNotificationCenter _handleCVVCheck:](self, "_handleCVVCheck:", v5);
  }

  else if ([v6 isEqualToString:@"highSecurityAccountVerificationFailed"])
  {
    -[PBUserNotificationCenter _handle2SVCheck:](self, "_handle2SVCheck:", v5);
  }

  else if ([v6 isEqualToString:@"carrierBillingVerificationFailed"])
  {
    -[PBUserNotificationCenter _handleCarMCheck:](self, "_handleCarMCheck:", v5);
  }

  else
  {
    id v10 = sub_100084428();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v12 = (void *)objc_opt_class(self);
      int v14 = 138412290;
      id v15 = v12;
      id v13 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: skipping", (uint8_t *)&v14, 0xCu);
    }

    [v5 performDefaultHandling];
  }
}

- (void)_handleCVVCheck:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationCenter registeredOperationClasses](self, "registeredOperationClasses"));
  id v6 = [v5 objectForKey:&off_1003FDB60];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:SSErrorSessionPropertyCustomerMessageTitle]);
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:SSErrorSessionPropertyCustomerMessage]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:SSErrorSessionPropertyNextActionURL]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));
    v11 = (void *)objc_opt_new(v6);
    [v11 setCustomerTitle:v7];
    [v11 setCustomerMessage:v8];
    [v11 setVerifyURL:v10];
    objc_initWeak(&location, v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001020DC;
    v13[3] = &unk_1003D0418;
    objc_copyWeak(&v15, &location);
    id v14 = v4;
    [v11 setCompletionBlock:v13];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
    [v12 addOperation:v11];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  else
  {
    [v4 performDefaultHandling];
  }
}

- (void)_handle2SVCheck:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationCenter registeredOperationClasses](self, "registeredOperationClasses"));
  id v6 = [v5 objectForKey:&off_1003FDB78];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:SSErrorSessionPropertyCustomerMessageTitle]);
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:SSErrorSessionPropertyCustomerMessage]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:SSErrorSessionPropertyNextActionURL]);
    id v10 = (void *)objc_opt_new(v6);
    [v10 setCustomerTitle:v7];
    [v10 setCustomerMessage:v8];
    [v10 setSerializedURLs:v9];
    objc_initWeak(&location, v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001022F8;
    v12[3] = &unk_1003D0418;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    [v10 setCompletionBlock:v12];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
    [v11 addOperation:v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  else
  {
    [v4 performDefaultHandling];
  }
}

- (void)_handleCarMCheck:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationCenter registeredOperationClasses](self, "registeredOperationClasses"));
  id v6 = [v5 objectForKey:&off_1003FDB90];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:SSErrorSessionPropertyCustomerMessageTitle]);
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:SSErrorSessionPropertyCustomerMessage]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:SSErrorSessionPropertyFailureClientInfo]);
    id v10 = (void *)objc_opt_new(v6);
    [v10 setCustomerTitle:v7];
    [v10 setCustomerMessage:v8];
    [v10 setFailureClientInfo:v9];
    objc_initWeak(&location, v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100102514;
    v12[3] = &unk_1003D0418;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    [v10 setCompletionBlock:v12];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
    [v11 addOperation:v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  else
  {
    [v4 performDefaultHandling];
  }
}

- (PBUserNotificationDelegate)delegate
{
  return (PBUserNotificationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SSErrorHandler)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSMutableDictionary)registeredOperationClasses
{
  return self->_registeredOperationClasses;
}

- (void)setRegisteredOperationClasses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end