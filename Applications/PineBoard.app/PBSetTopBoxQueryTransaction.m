@interface PBSetTopBoxQueryTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)isFresh;
- (BOOL)shouldWatchdog:(id *)a3;
- (BSWatchdog)watchdog;
- (NSDate)completionDate;
- (NSString)bundleIdentifier;
- (NSString)previousBundleIdentifier;
- (PBSetTopBoxQueryTransaction)init;
- (PBSetTopBoxQueryTransaction)initWithLog:(id)a3 identityProviderInfoCenter:(id)a4 currentBundleIdentifier:(id)a5;
- (VSIdentityProviderInfoCenter)identityProviderInfoCenter;
- (double)watchdogTimeout;
- (void)_begin;
- (void)_didComplete;
@end

@implementation PBSetTopBoxQueryTransaction

- (PBSetTopBoxQueryTransaction)initWithLog:(id)a3 identityProviderInfoCenter:(id)a4 currentBundleIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PBSetTopBoxQueryTransaction;
  v12 = -[PBSetTopBoxQueryTransaction init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_log, a3);
    objc_storeStrong((id *)&v13->_identityProviderInfoCenter, a4);
    objc_storeStrong((id *)&v13->_previousBundleIdentifier, a5);
    -[PBSetTopBoxQueryTransaction _addDebugLogCategory:](v13, "_addDebugLogCategory:", v9);
  }

  return v13;
}

- (PBSetTopBoxQueryTransaction)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[VSIdentityProviderInfoCenter sharedCenter]( &OBJC_CLASS___VSIdentityProviderInfoCenter,  "sharedCenter"));
  v4 = -[PBSetTopBoxQueryTransaction initWithLog:identityProviderInfoCenter:currentBundleIdentifier:]( self,  "initWithLog:identityProviderInfoCenter:currentBundleIdentifier:",  &_os_log_default,  v3,  0LL);

  return v4;
}

- (BOOL)isFresh
{
  unsigned int v3 = -[PBSetTopBoxQueryTransaction isComplete](self, "isComplete");
  if (v3)
  {
    if ((-[PBSetTopBoxQueryTransaction isFailed](self, "isFailed") & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }

    else
    {
      -[NSDate timeIntervalSinceNow](self->_completionDate, "timeIntervalSinceNow");
      LOBYTE(v3) = v4 + 4.0 > 0.0;
    }
  }

  return v3;
}

- (BOOL)shouldWatchdog:(id *)a3
{
  return 1;
}

- (double)watchdogTimeout
{
  return 1.0;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PBSetTopBoxQueryTransaction;
  -[PBSetTopBoxQueryTransaction _begin](&v18, "_begin");
  -[PBSetTopBoxQueryTransaction addMilestone:](self, "addMilestone:", @"InfoQuery");
  if (self) {
    log = self->_log;
  }
  else {
    log = 0LL;
  }
  double v4 = log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    identityProviderInfoCenter = self->_identityProviderInfoCenter;
    *(_DWORD *)buf = 134217984;
    v20 = identityProviderInfoCenter;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Requesting identity provider info {infoCenter=%p}",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6 = self->_identityProviderInfoCenter;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000F1BE0;
  v15[3] = &unk_1003D6B68;
  objc_copyWeak(&v17, (id *)buf);
  v7 = v4;
  v16 = v7;
  -[VSIdentityProviderInfoCenter enqueueInfoQueryWithCompletion:](v6, "enqueueInfoQueryWithCompletion:", v15);
  v8 = objc_alloc(&OBJC_CLASS___BSWatchdog);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBSetTopBoxQueryTransaction queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000F1DE0;
  v13[3] = &unk_1003D1228;
  objc_copyWeak(&v14, (id *)buf);
  id v10 = -[BSWatchdog initWithProvider:queue:completion:](v8, "initWithProvider:queue:completion:", self, v9, v13);
  p_watchdog = (id *)&self->_watchdog;
  id v12 = *p_watchdog;
  id *p_watchdog = v10;

  [*p_watchdog start];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)_didComplete
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBSetTopBoxQueryTransaction;
  -[PBSetTopBoxQueryTransaction _didComplete](&v10, "_didComplete");
  -[BSWatchdog invalidate](self->_watchdog, "invalidate");
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[PBSetTopBoxQueryTransaction error](self, "error"));
  if (v3)
  {
    double v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v5 isEqualToString:BSTransactionErrorDomain])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeStringForKey:", BSTransactionErrorReasonKey));
      unsigned int v8 = [v7 isEqualToString:BSTransactionErrorReasonTimeout];

      if (v8)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT)) {
          sub_10027FA78(log);
        }
      }
    }

    else
    {
    }
  }

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)previousBundleIdentifier
{
  return self->_previousBundleIdentifier;
}

- (VSIdentityProviderInfoCenter)identityProviderInfoCenter
{
  return self->_identityProviderInfoCenter;
}

- (BSWatchdog)watchdog
{
  return self->_watchdog;
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void).cxx_destruct
{
}

@end