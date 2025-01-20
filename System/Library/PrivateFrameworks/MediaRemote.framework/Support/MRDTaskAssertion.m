@interface MRDTaskAssertion
+ (OS_dispatch_queue)workerQueue;
- (BOOL)invalidateInDuration:(double)a3;
- (BOOL)isValid;
- (MRDTaskAssertion)initWithType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6;
- (MRDTaskAssertion)initWithType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6 invalidationHandler:(id)a7;
- (MRSingleShotTimer)invalidationTimer;
- (NSString)bundleID;
- (NSString)name;
- (RBSAssertion)assertion;
- (RBSAssertion)hostAssertion;
- (double)remainingDuration;
- (id)_assertionForType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6;
- (id)_hostAssertionForType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6;
- (id)description;
- (id)invalidationHandler;
- (int)pid;
- (int64_t)type;
- (void)_acquire;
- (void)callInvalidationHandlerWithReason:(id)a3;
- (void)dealloc;
- (void)invalidateWithReason:(id)a3;
- (void)setAssertion:(id)a3;
- (void)setHostAssertion:(id)a3;
- (void)setInvalidationTimer:(id)a3;
@end

@implementation MRDTaskAssertion

- (MRDTaskAssertion)initWithType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6
{
  return -[MRDTaskAssertion initWithType:pid:bundleID:name:invalidationHandler:]( self,  "initWithType:pid:bundleID:name:invalidationHandler:",  a3,  *(void *)&a4,  a5,  a6,  0LL);
}

- (MRDTaskAssertion)initWithType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6 invalidationHandler:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MRDTaskAssertion;
  v15 = -[MRDTaskAssertion init](&v31, "init");
  if (v15)
  {
    if (!v12)
    {
      v16 = sub_10013D19C(v9);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v16);
    }

    v15->_pid = v9;
    objc_storeStrong((id *)&v15->_bundleID, v12);
    v15->_type = a3;
    objc_storeStrong((id *)&v15->_name, a6);
    id v17 = [v14 copy];
    id invalidationHandler = v15->_invalidationHandler;
    v15->_id invalidationHandler = v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue( -[MRDTaskAssertion _assertionForType:pid:bundleID:name:]( v15,  "_assertionForType:pid:bundleID:name:",  a3,  v9,  v12,  v13));
    assertion = v15->_assertion;
    v15->_assertion = (RBSAssertion *)v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue( -[MRDTaskAssertion _hostAssertionForType:pid:bundleID:name:]( v15,  "_hostAssertionForType:pid:bundleID:name:",  a3,  v9,  v12,  v13));
    hostAssertion = v15->_hostAssertion;
    v15->_hostAssertion = (RBSAssertion *)v21;

    objc_initWeak(&location, v15);
    v23 = v15->_assertion;
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    v27 = sub_1000E7C78;
    v28 = &unk_1003A0260;
    objc_copyWeak(&v29, &location);
    -[RBSAssertion setInvalidationHandler:](v23, "setInvalidationHandler:", &v25);
    -[MRDTaskAssertion _acquire](v15, "_acquire", v25, v26, v27, v28);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (id)_hostAssertionForType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a6;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  v6));
  uint64_t v21 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v9,  &v21));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 hostProcess]);
  id v12 = v11;
  if (!v11 || [v11 pid] == -1)
  {
    uint64_t v19 = 0LL;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 identifier]);
    v15 = (void *)v14;
    v16 = @"none";
    if (v14) {
      v16 = (__CFString *)v14;
    }
    id v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue( [v8 stringByAppendingFormat:@" host process: %@(%d)", v17, objc_msgSend(v12, "pid")]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[MRDTaskAssertion _assertionForType:pid:bundleID:name:]( self,  "_assertionForType:pid:bundleID:name:",  self->_type,  [v12 pid],  v17,  v18));
  }

  return v19;
}

- (id)_assertionForType:(int64_t)a3 pid:(int)a4 bundleID:(id)a5 name:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a6;
  else {
    v11 = *(&off_1003A0308 + a3);
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.mediaremote",  v11));
  if ((int)v7 < 1)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentity identityForApplicationJobLabel:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForApplicationJobLabel:",  v9));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithProcessIdentity:](&OBJC_CLASS___RBSTarget, "targetWithProcessIdentity:", v14));
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](&OBJC_CLASS___RBSTarget, "targetWithPid:", v7));
  }

  v15 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  uint64_t v19 = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  id v17 = -[RBSAssertion initWithExplanation:target:attributes:]( v15,  "initWithExplanation:target:attributes:",  v10,  v13,  v16);

  return v17;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  unint64_t v4 = self->_type - 1;
  if (v4 > 7) {
    v5 = @"UnknownType";
  }
  else {
    v5 = *(&off_1003A02C8 + v4);
  }
  unint64_t type = self->_type;
  if (type > 8) {
    uint64_t v7 = @"Command";
  }
  else {
    uint64_t v7 = *(&off_1003A0308 + type);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@:%p> %@-%u:%@:%@",  v3,  self,  self->_bundleID,  self->_pid,  v5,  v7));
  id v9 = v8;
  if (self->_hostAssertion) {
    [v8 appendFormat:@"hostAssertion=%@", self->_hostAssertion];
  }
  id v10 = self;
  objc_sync_enter(v10);
  invalidationTimer = v10->_invalidationTimer;
  if (invalidationTimer)
  {
    -[MRSingleShotTimer remainingDuration](invalidationTimer, "remainingDuration");
    objc_msgSend(v9, "appendFormat:", @"<%lf more seconds", v12);
  }

  objc_sync_exit(v10);

  [v9 appendString:@">"];
  return v9;
}

- (void)dealloc
{
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;

  -[MRDTaskAssertion invalidateWithReason:](self, "invalidateWithReason:", @"Dealloc");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDTaskAssertion;
  -[MRDTaskAssertion dealloc](&v4, "dealloc");
}

- (BOOL)isValid
{
  else {
    return -[RBSAssertion isValid](self->_hostAssertion, "isValid");
  }
}

- (void)invalidateWithReason:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  invalidationTimer = v5->_invalidationTimer;
  v5->_invalidationTimer = 0LL;

  objc_sync_exit(v5);
  -[MRDTaskAssertion callInvalidationHandlerWithReason:](v5, "callInvalidationHandlerWithReason:", v4);
  if (-[RBSAssertion isValid](v5->_assertion, "isValid"))
  {
    uint64_t v8 = _MRLogForCategory(0LL, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Releasing assertion %@ %@",  (uint8_t *)&v13,  0x16u);
    }

    -[RBSAssertion invalidate](v5->_assertion, "invalidate");
  }

  if (-[RBSAssertion isValid](v5->_hostAssertion, "isValid"))
  {
    uint64_t v11 = _MRLogForCategory(0LL, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Releasing host assertion %@ %@",  (uint8_t *)&v13,  0x16u);
    }

    -[RBSAssertion invalidate](v5->_hostAssertion, "invalidate");
  }
}

- (BOOL)invalidateInDuration:(double)a3
{
  if (a3 > 30.0)
  {
    uint64_t v5 = _MRLogForCategory(0LL, a2);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1002B8A14((uint64_t)self, v6, a3);
    }
  }

  uint64_t v7 = self;
  objc_sync_enter(v7);
  unsigned __int8 v8 = -[MRDTaskAssertion isValid](v7, "isValid");
  if ((v8 & 1) != 0)
  {
    -[MRSingleShotTimer remainingDuration](v7->_invalidationTimer, "remainingDuration");
    if (v10 < a3)
    {
      invalidationTimer = v7->_invalidationTimer;
      if (invalidationTimer)
      {
        uint64_t v12 = _MRLogForCategory(0LL, v9);
        int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          -[MRSingleShotTimer remainingDuration](v7->_invalidationTimer, "remainingDuration");
          *(_DWORD *)buf = 134218242;
          double v26 = v14;
          __int16 v27 = 2112;
          v28 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Replacing host assertion invalidation timer that was due to fire in %lf seconds %@",  buf,  0x16u);
        }

        invalidationTimer = v7->_invalidationTimer;
      }

      v7->_invalidationTimer = 0LL;

      __int16 v15 = objc_alloc(&OBJC_CLASS___MRSingleShotTimer);
      id v16 = [(id)objc_opt_class(v7) workerQueue];
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000E8528;
      v24[3] = &unk_1003A0288;
      v24[4] = v7;
      v18 = -[MRSingleShotTimer initWithInterval:queue:block:](v15, "initWithInterval:queue:block:", v17, v24, a3);
      uint64_t v19 = v7->_invalidationTimer;
      v7->_invalidationTimer = v18;

      uint64_t v21 = _MRLogForCategory(0LL, v20);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        double v26 = a3;
        __int16 v27 = 2112;
        v28 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Setting host assertion invalidation timer to fire in %lf seconds %@",  buf,  0x16u);
      }
    }
  }

  objc_sync_exit(v7);

  return v8;
}

- (double)remainingDuration
{
  v2 = self;
  objc_sync_enter(v2);
  -[MRSingleShotTimer remainingDuration](v2->_invalidationTimer, "remainingDuration");
  double v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (id)invalidationHandler
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [v2->_invalidationHandler copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)callInvalidationHandlerWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void (**)(id, MRDTaskAssertion *, id))[v5->_invalidationHandler copy];
  id invalidationHandler = v5->_invalidationHandler;
  v5->_id invalidationHandler = 0LL;

  objc_sync_exit(v5);
  if (v6)
  {
    uint64_t v9 = _MRLogForCategory(0LL, v8);
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Calling assertion invalidation handler %@ %@",  (uint8_t *)&v11,  0x16u);
    }

    v6[2](v6, v5, v4);
  }
}

+ (OS_dispatch_queue)workerQueue
{
  if (qword_1003FDEE8 != -1) {
    dispatch_once(&qword_1003FDEE8, &stru_1003A02A8);
  }
  return (OS_dispatch_queue *)(id)qword_1003FDEE0;
}

- (void)_acquire
{
  assertion = self->_assertion;
  if (assertion && (-[RBSAssertion isValid](assertion, "isValid") & 1) == 0)
  {
    id v4 = self->_assertion;
    id v32 = 0LL;
    unsigned __int8 v5 = -[RBSAssertion acquireWithError:](v4, "acquireWithError:", &v32);
    id v6 = v32;
    uint64_t v8 = _MRLogForCategory(0LL, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    double v10 = v9;
    if ((v5 & 1) != 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Acquired assertion: %@", buf, 0xCu);
      }
    }

    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_1002B8AF4((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  hostAssertion = self->_hostAssertion;
  if (hostAssertion && (-[RBSAssertion isValid](hostAssertion, "isValid") & 1) == 0)
  {
    v18 = self->_hostAssertion;
    id v31 = 0LL;
    unsigned __int8 v19 = -[RBSAssertion acquireWithError:](v18, "acquireWithError:", &v31);
    id v20 = v31;
    uint64_t v22 = _MRLogForCategory(0LL, v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    v24 = v23;
    if ((v19 & 1) != 0)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = self;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Acquired host assertion: %@", buf, 0xCu);
      }
    }

    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sub_1002B8A90((uint64_t)self, v24, v25, v26, v27, v28, v29, v30);
    }
  }

- (int64_t)type
{
  return self->_type;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)name
{
  return self->_name;
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (RBSAssertion)hostAssertion
{
  return self->_hostAssertion;
}

- (void)setHostAssertion:(id)a3
{
}

- (MRSingleShotTimer)invalidationTimer
{
  return self->_invalidationTimer;
}

- (void)setInvalidationTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end