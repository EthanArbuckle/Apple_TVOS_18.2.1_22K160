@interface URLBagTimer
+ (id)subscriptionRenewTimer;
- (NSString)bagKey;
- (NSString)cellularBagKey;
- (URLBagTimer)initWithIdentifier:(id)a3;
- (double)_readTimeIntervalFromUserDefaultsKey:(id)a3;
- (double)_timerInterval;
- (double)_timerIntervalWithBagKey:(id)a3 userDefaultsKey:(id)a4;
- (double)_windowWithUserDefaultsKey:(id)a3;
- (double)defaultInterval;
- (double)defaultWindow;
- (id)_nextFireDateWithInterval:(double)a3;
- (id)_userDefaultsKeyCellularOverride;
- (id)_userDefaultsKeyLastTimeCheck;
- (id)_userDefaultsKeyWiFiOverride;
- (id)_userDefaultsKeyWindowOverride;
- (id)eventBlock;
- (id)preconditionsBlock;
- (void)_addJobWithDate:(id)a3 window:(double)a4 allowsCellular:(BOOL)a5;
- (void)_attemptFireForJob:(id)a3 withName:(id)a4;
- (void)_fireTimer;
- (void)_resetBackgroundTaskJobs;
- (void)_setLastFireDate:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)reset;
- (void)setBagKey:(id)a3;
- (void)setCellularBagKey:(id)a3;
- (void)setDefaultInterval:(double)a3;
- (void)setDefaultWindow:(double)a3;
- (void)setEventBlock:(id)a3;
- (void)setPreconditionsBlock:(id)a3;
- (void)start;
@end

@implementation URLBagTimer

- (URLBagTimer)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___URLBagTimer;
  v5 = -[URLBagTimer init](&v16, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;

    objc_initWeak(&location, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    id v9 = [v4 copy];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000C31EC;
    v13[3] = &unk_10034BF60;
    objc_copyWeak(&v14, &location);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 addObserverForBackgroundTaskWithIdentifierPrefix:v9 withBlock:v13]);
    id taskObserver = v5->_taskObserver;
    v5->_id taskObserver = (id)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  if (self->_taskObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v3 removeBackgroundTaskObserver:self->_taskObserver];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___URLBagTimer;
  -[URLBagTimer dealloc](&v4, "dealloc");
}

+ (id)subscriptionRenewTimer
{
  id v2 = [objc_alloc((Class)a1) initWithIdentifier:@"com.apple.itunesstored.subscription-poll"];
  [v2 setBagKey:@"subscription-status-refresh-interval-in-seconds"];
  [v2 setDefaultInterval:86400.0];
  [v2 setDefaultWindow:43200.0];
  return v2;
}

- (void)invalidate
{
  if (self->_taskObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v3 removeBackgroundTaskObserver:self->_taskObserver];

    id taskObserver = self->_taskObserver;
    self->_id taskObserver = 0LL;
  }

  if (self->_started)
  {
    self->_started = 0;
    if (-[NSString length](self->_identifier, "length"))
    {
      id v5 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingString:]( self->_identifier, "stringByAppendingString:", @".cell"));
      xpc_activity_unregister((const char *)[v5 UTF8String]);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](self->_identifier, "stringByAppendingString:", @".wifi"));

      id v15 = v6;
      xpc_activity_unregister((const char *)[v15 UTF8String]);

      return;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      v11 = (void *)objc_opt_class(self);
      identifier = self->_identifier;
      int v16 = 138412546;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = identifier;
      id v13 = v11;
      id v14 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Unable to invalidate due to lack of identifier: %@",  &v16,  22);

      if (!v14)
      {
LABEL_18:

        return;
      }

      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      SSFileLog(v7, @"%@");
    }

    goto LABEL_18;
  }

- (void)reset
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[URLBagTimer _setLastFireDate:](self, "_setLastFireDate:", v3);

  -[URLBagTimer _resetBackgroundTaskJobs](self, "_resetBackgroundTaskJobs");
}

- (void)start
{
  if (!self->_started)
  {
    self->_started = 1;
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[URLBagTimer _userDefaultsKeyLastTimeCheck](self, "_userDefaultsKeyLastTimeCheck"));
    CFPropertyListRef v4 = CFPreferencesCopyAppValue(v3, kSSUserDefaultsIdentifier);
    id v5 = (void *)v4;
    if (v4
      && (CFTypeID v6 = CFGetTypeID(v4), v6 == CFDateGetTypeID())
      && (([v5 timeIntervalSinceNow],
           double v8 = v7,
           -[URLBagTimer _timerInterval](self, "_timerInterval"),
           v9 <= 0.0)
       || v8 >= -v9)
      || (preconditionsBlock = (unsigned int (**)(void))self->_preconditionsBlock) != 0LL && !preconditionsBlock[2]())
    {
      -[URLBagTimer _resetBackgroundTaskJobs](self, "_resetBackgroundTaskJobs");
      if (!v5) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v12 = [v11 shouldLog];
    else {
      LODWORD(v13) = v12;
    }
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      id v15 = (void *)objc_opt_class(self);
      identifier = self->_identifier;
      int v19 = 138412546;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = identifier;
      id v17 = v15;
      __int16 v18 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  1LL,  "%@: Firing timer for start: %@",  &v19,  22);

      if (!v18) {
        goto LABEL_20;
      }
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
      free(v18);
      SSFileLog(v11, @"%@");
    }

LABEL_20:
    -[URLBagTimer _fireTimer](self, "_fireTimer");
    if (!v5)
    {
LABEL_22:
      CFRelease(v3);
      return;
    }

- (void)_addJobWithDate:(id)a3 window:(double)a4 allowsCellular:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  [v7 timeIntervalSinceNow];
  double v9 = v8;
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, !v5);
  xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, (uint64_t)v9);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  v11 = -[BackgroundTaskRequest initWithBackgroundTaskAgentJob:]( objc_alloc(&OBJC_CLASS___BackgroundTaskRequest),  "initWithBackgroundTaskAgentJob:",  v10);
  if (v5) {
    unsigned int v12 = @".cell";
  }
  else {
    unsigned int v12 = @".wifi";
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](self->_identifier, "stringByAppendingString:", v12));
  -[BackgroundTaskRequest setRequestIdentifier:](v11, "setRequestIdentifier:", v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v14) {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v15 = [v14 shouldLog];
  else {
    LODWORD(v16) = v15;
  }
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
    uint64_t v16 = v16;
  }
  else {
    v16 &= 2u;
  }
  if (!(_DWORD)v16) {
    goto LABEL_15;
  }
  int v21 = 138412802;
  id v22 = (id)objc_opt_class(self);
  __int16 v23 = 2112;
  v24 = v13;
  __int16 v25 = 2112;
  id v26 = v7;
  id v18 = v22;
  int v19 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "%@: Schedule timer: %@ to fire at: %@",  &v21,  32);

  if (v19)
  {
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
    free(v19);
    SSFileLog(v14, @"%@");
LABEL_15:
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v20 addBackgroundTaskWithRequest:v11];
}

- (void)_attemptFireForJob:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_started)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance"));
    id v9 = [v8 networkType];

    if ([v7 hasSuffix:@"cell"])
    {
      if ((SSNetworkTypeIsCellularType(v9) & 1) == 0)
      {
LABEL_22:
        -[URLBagTimer _resetBackgroundTaskJobs](self, "_resetBackgroundTaskJobs");
        goto LABEL_23;
      }
    }

    else if (![v7 hasSuffix:@"wifi"] || v9 != (id)1000)
    {
      goto LABEL_22;
    }

    preconditionsBlock = (unsigned int (**)(void))self->_preconditionsBlock;
    if (preconditionsBlock && !preconditionsBlock[2]()) {
      goto LABEL_22;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v12 = [v11 shouldLog];
    else {
      LODWORD(v13) = v12;
    }
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      int v17 = 138412546;
      id v18 = (id)objc_opt_class(self);
      __int16 v19 = 2112;
      id v20 = v7;
      id v15 = v18;
      uint64_t v16 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  1LL,  "%@: Firing background timer: %@",  &v17,  22);

      if (!v16)
      {
LABEL_21:

        -[URLBagTimer _fireTimer](self, "_fireTimer");
        goto LABEL_23;
      }

      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
      free(v16);
      SSFileLog(v11, @"%@");
    }

    goto LABEL_21;
  }

- (void)_fireTimer
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  CFPropertyListRef v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C3D74;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(v4, block);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[URLBagTimer _setLastFireDate:](self, "_setLastFireDate:", v5);

  -[URLBagTimer _resetBackgroundTaskJobs](self, "_resetBackgroundTaskJobs");
}

- (id)_nextFireDateWithInterval:(double)a3
{
  BOOL v5 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[URLBagTimer _userDefaultsKeyLastTimeCheck](self, "_userDefaultsKeyLastTimeCheck"));
  id v6 = (void *)CFPreferencesCopyAppValue(v5, kSSUserDefaultsIdentifier);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v8 = v7;
  if (v6)
  {
    CFTypeID v9 = CFGetTypeID(v6);
    if (v9 != CFDateGetTypeID() || ([v6 timeIntervalSinceNow], v10 > 2.22044605e-16))
    {
      id v11 = v8;
      -[URLBagTimer _setLastFireDate:](self, "_setLastFireDate:", v11);
      goto LABEL_8;
    }

    id v12 = v6;
  }

  else
  {
    id v12 = v7;
  }

  id v11 = v12;
LABEL_8:
  uint64_t v13 = -[NSDate initWithTimeInterval:sinceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeInterval:sinceDate:",  v11,  a3);
  id v14 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate earlierDate:](v13, "earlierDate:", v8));

  if (v14 == v13)
  {
    id v15 = -[NSDate initWithTimeInterval:sinceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeInterval:sinceDate:",  v8,  a3);

    uint64_t v13 = v15;
  }

  if (v6) {
    CFRelease(v6);
  }
  CFRelease(v5);

  return v13;
}

- (double)_readTimeIntervalFromUserDefaultsKey:(id)a3
{
  double valuePtr = 0.0;
  v3 = (__CFString *)a3;
  CFPropertyListRef v4 = (const __CFNumber *)CFPreferencesCopyAppValue(v3, kSSUserDefaultsIdentifier);
  if (v4)
  {
    BOOL v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v5, kCFNumberDoubleType, &valuePtr);
    }

    else
    {
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID())
      {
        -[__CFNumber doubleValue](v5, "doubleValue");
        double valuePtr = v8;
      }
    }

    CFRelease(v5);
  }

  CFRelease(v3);
  double v9 = valuePtr;

  return v9;
}

- (void)_resetBackgroundTaskJobs
{
  if (self->_started)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[URLBagTimer _userDefaultsKeyWindowOverride](self, "_userDefaultsKeyWindowOverride"));
    -[URLBagTimer _windowWithUserDefaultsKey:](self, "_windowWithUserDefaultsKey:", v3);
    double v5 = v4;

    bagKey = self->_bagKey;
    CFTypeID v7 = (void *)objc_claimAutoreleasedReturnValue(-[URLBagTimer _userDefaultsKeyWiFiOverride](self, "_userDefaultsKeyWiFiOverride"));
    -[URLBagTimer _timerIntervalWithBagKey:userDefaultsKey:]( self,  "_timerIntervalWithBagKey:userDefaultsKey:",  bagKey,  v7);
    double defaultInterval = v8;

    if (defaultInterval < 2.22044605e-16) {
      double defaultInterval = self->_defaultInterval;
    }
    if (defaultInterval > 2.22044605e-16)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[URLBagTimer _nextFireDateWithInterval:](self, "_nextFireDateWithInterval:", defaultInterval));
      -[URLBagTimer _addJobWithDate:window:allowsCellular:]( self,  "_addJobWithDate:window:allowsCellular:",  v10,  0LL,  v5);
    }

    cellularBagKey = self->_cellularBagKey;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[URLBagTimer _userDefaultsKeyCellularOverride](self, "_userDefaultsKeyCellularOverride"));
    -[URLBagTimer _timerIntervalWithBagKey:userDefaultsKey:]( self,  "_timerIntervalWithBagKey:userDefaultsKey:",  cellularBagKey,  v12);
    double v14 = v13;

    if (v14 < 2.22044605e-16 && !self->_cellularBagKey) {
      double v14 = defaultInterval;
    }
    if (v14 > 2.22044605e-16)
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[URLBagTimer _nextFireDateWithInterval:](self, "_nextFireDateWithInterval:", v14));
      -[URLBagTimer _addJobWithDate:window:allowsCellular:]( self,  "_addJobWithDate:window:allowsCellular:",  v15,  1LL,  v5);
    }
  }

- (void)_setLastFireDate:(id)a3
{
  id v4 = a3;
  double v5 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[URLBagTimer _userDefaultsKeyLastTimeCheck](self, "_userDefaultsKeyLastTimeCheck"));
  CFTypeID v6 = (const __CFString *)kITunesStoreDaemonDefaultsID;
  CFPreferencesSetAppValue(v5, v4, kITunesStoreDaemonDefaultsID);

  CFPreferencesAppSynchronize(v6);
  CFRelease(v5);
}

- (double)_timerInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance"));
  id v4 = [v3 networkType];

  if (v4 == (id)1000)
  {
    bagKey = self->_bagKey;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[URLBagTimer _userDefaultsKeyWiFiOverride](self, "_userDefaultsKeyWiFiOverride"));
  }

  else
  {
    bagKey = self->_cellularBagKey;
    if (!bagKey) {
      bagKey = self->_bagKey;
    }
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[URLBagTimer _userDefaultsKeyCellularOverride](self, "_userDefaultsKeyCellularOverride"));
  }

  CFTypeID v7 = (void *)v6;
  -[URLBagTimer _timerIntervalWithBagKey:userDefaultsKey:]( self,  "_timerIntervalWithBagKey:userDefaultsKey:",  bagKey,  v6);
  double v9 = v8;

  if (v9 < 2.22044605e-16) {
    return self->_defaultInterval;
  }
  return v9;
}

- (double)_timerIntervalWithBagKey:(id)a3 userDefaultsKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[URLBagTimer _readTimeIntervalFromUserDefaultsKey:](self, "_readTimeIntervalFromUserDefaultsKey:", v7);
    double v9 = v8;
    if (!v6) {
      goto LABEL_7;
    }
  }

  else
  {
    double v9 = 0.0;
    if (!v6) {
      goto LABEL_7;
    }
  }

  if (v9 < 2.22044605e-16)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagCache sharedCache](&OBJC_CLASS___ISURLBagCache, "sharedCache"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 URLBagForContext:v11]);

    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForKey:v6]);
    [v13 doubleValue];
    double v9 = v14;
  }

- (id)_userDefaultsKeyCellularOverride
{
  return -[NSString stringByAppendingString:](self->_identifier, "stringByAppendingString:", @":CellularOverride");
}

- (id)_userDefaultsKeyLastTimeCheck
{
  return -[NSString stringByAppendingString:](self->_identifier, "stringByAppendingString:", @":LastCheckTime");
}

- (id)_userDefaultsKeyWiFiOverride
{
  return -[NSString stringByAppendingString:](self->_identifier, "stringByAppendingString:", @":WiFiOverride");
}

- (id)_userDefaultsKeyWindowOverride
{
  return -[NSString stringByAppendingString:](self->_identifier, "stringByAppendingString:", @":WindowOverride");
}

- (double)_windowWithUserDefaultsKey:(id)a3
{
  id v4 = a3;
  if (!v4
    || (-[URLBagTimer _readTimeIntervalFromUserDefaultsKey:](self, "_readTimeIntervalFromUserDefaultsKey:", v4),
        defaultWindow < 2.22044605e-16))
  {
    double defaultWindow = self->_defaultWindow;
  }

  if (defaultWindow >= 2.22044605e-16) {
    double v6 = defaultWindow;
  }
  else {
    double v6 = 604800.0;
  }

  return v6;
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
}

- (NSString)cellularBagKey
{
  return self->_cellularBagKey;
}

- (void)setCellularBagKey:(id)a3
{
}

- (double)defaultInterval
{
  return self->_defaultInterval;
}

- (void)setDefaultInterval:(double)a3
{
  self->_double defaultInterval = a3;
}

- (double)defaultWindow
{
  return self->_defaultWindow;
}

- (void)setDefaultWindow:(double)a3
{
  self->_double defaultWindow = a3;
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)setEventBlock:(id)a3
{
}

- (id)preconditionsBlock
{
  return self->_preconditionsBlock;
}

- (void)setPreconditionsBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end