@interface BKDirectTouchStateHitTester
- (void)dealloc;
- (void)invalidate;
@end

@implementation BKDirectTouchStateHitTester

- (void)dealloc
{
  if (self->_state)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"must invoke -invalidate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      id v13 = v6;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BKDirectTouchHitTesting.mm";
      __int16 v20 = 1024;
      int v21 = 70;
      __int16 v22 = 2114;
      v23 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
    JUMPOUT(0x100068ABCLL);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___BKDirectTouchStateHitTester;
  -[BKDirectTouchStateHitTester dealloc](&v11, "dealloc");
}

- (void)invalidate
{
  state = self->_state;
  if (state)
  {
    self->_state = 0LL;

    eventProcessor = self->_eventProcessor;
    self->_eventProcessor = 0LL;

    displayInfo = self->_displayInfo;
    self->_displayInfo = 0LL;

    touchDeliveryPolicyServer = self->_touchDeliveryPolicyServer;
    self->_touchDeliveryPolicyServer = 0LL;
  }

- (void).cxx_destruct
{
}

@end