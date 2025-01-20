@interface MRDSleepAssertion
- (MRDSleepAssertion)initWithName:(id)a3 timeout:(double)a4;
- (void)invalidate;
@end

@implementation MRDSleepAssertion

- (MRDSleepAssertion)initWithName:(id)a3 timeout:(double)a4
{
  v7 = (__CFString *)a3;
  uint64_t v9 = _MRLogForCategory(0LL, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initialization sleep assertion %@", buf, 0xCu);
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MRDSleepAssertion;
  v11 = -[MRDSleepAssertion init](&v22, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_unsigned int assertionID = 0;
    IOReturn v13 = IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  @"com.apple.mediaremote.powerassertion",  0LL,  v7,  0LL,  a4,  @"TimeoutActionRelease",  &v12->_assertionID);
    unsigned int assertionID = v12->_assertionID;
    uint64_t v16 = _MRLogForCategory(0LL, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (assertionID) {
      BOOL v19 = v13 == 0;
    }
    else {
      BOOL v19 = 0;
    }
    if (v19)
    {
      if (v18)
      {
        name = v12->_name;
        *(_DWORD *)buf = 138412546;
        v24 = (__CFString *)name;
        __int16 v25 = 2048;
        double v26 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Taking sleep assertion %@ for a max of %lf seconds",  buf,  0x16u);
      }
    }

    else
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Could not take sleep assertion", buf, 2u);
      }

      v17 = (os_log_s *)v12;
      v12 = 0LL;
    }
  }

  return v12;
}

- (void)invalidate
{
  IOReturn v3 = IOPMAssertionRelease(self->_assertionID);
  uint64_t v5 = _MRLogForCategory(0LL, v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      name = self->_name;
      int v11 = 138412290;
      v12 = name;
      uint64_t v9 = "Could not release sleep assertion %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
    }
  }

  else if (v7)
  {
    v10 = self->_name;
    int v11 = 138412290;
    v12 = v10;
    uint64_t v9 = "Releasing sleep assertion %@";
    goto LABEL_6;
  }
}

- (void).cxx_destruct
{
}

@end