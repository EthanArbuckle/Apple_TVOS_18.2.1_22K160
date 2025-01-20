@interface DMDPowerAssertion
+ (id)assertionForOperation:(id)a3;
- (BOOL)isParked;
- (NSString)operation;
- (id)initForOperation:(id)a3;
- (void)_release;
- (void)_retain;
- (void)dealloc;
- (void)park;
- (void)setIsParked:(BOOL)a3;
- (void)setOperation:(id)a3;
- (void)unpark;
@end

@implementation DMDPowerAssertion

+ (id)assertionForOperation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v4, &v8);
  }

  else
  {
    v5 = @"unknown";
  }

  id v6 = [objc_alloc((Class)a1) initForOperation:v5];

  return v6;
}

- (id)initForOperation:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DMDPowerAssertion;
  id v6 = -[DMDPowerAssertion init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operation, a3);
    id v8 = _assertionQueue();
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100050E64;
    block[3] = &unk_10009E070;
    v12 = v7;
    dispatch_sync(v9, block);
  }

  return v7;
}

- (void)dealloc
{
  if (!self->_isParked)
  {
    id v3 = _assertionQueue();
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100050EFC;
    block[3] = &unk_10009E070;
    void block[4] = self;
    dispatch_sync(v4, block);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DMDPowerAssertion;
  -[DMDPowerAssertion dealloc](&v5, "dealloc");
}

- (void)park
{
  id v3 = _assertionQueue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100050F74;
  block[3] = &unk_10009E070;
  void block[4] = self;
  dispatch_sync(v4, block);
}

- (void)unpark
{
  id v3 = _assertionQueue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100051048;
  block[3] = &unk_10009E070;
  void block[4] = self;
  dispatch_sync(v4, block);
}

- (void)_retain
{
  uint64_t v3 = qword_1000CCE30;
  if (!qword_1000CCE30)
  {
    IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  @"dmd activity",  0LL,  0LL,  0LL,  3600.0,  @"TimeoutActionTurnOff",  (IOPMAssertionID *)&dword_1000CCE38);
    uint64_t v3 = qword_1000CCE30;
  }

  qword_1000CCE30 = v3 + 1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPowerAssertion operation](self, "operation"));
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Beginning power assertion, operation: %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[DMDUserSwitchStakeholder sharedStakeholder]( &OBJC_CLASS___DMDUserSwitchStakeholder,  "sharedStakeholder"));
  [v5 inEDUMode];
}

- (void)_release
{
  if (!--qword_1000CCE30) {
    IOPMAssertionRelease(dword_1000CCE38);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPowerAssertion operation](self, "operation"));
    int v5 = 138543362;
    int v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Ending power assertion, operation: %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[DMDUserSwitchStakeholder sharedStakeholder]( &OBJC_CLASS___DMDUserSwitchStakeholder,  "sharedStakeholder"));
  [v4 inEDUMode];
}

- (BOOL)isParked
{
  return self->_isParked;
}

- (void)setIsParked:(BOOL)a3
{
  self->_isParked = a3;
}

- (NSString)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end