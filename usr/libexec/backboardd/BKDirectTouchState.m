@interface BKDirectTouchState
- (BKDirectTouchState)init;
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)invalidate;
@end

@implementation BKDirectTouchState

- (BKDirectTouchState)init
{
  uint64_t v4 = objc_opt_class(self, a2);
  if (v4 != objc_opt_class(&OBJC_CLASS___BKDirectTouchState, v5))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclasses not allowed"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
      v11 = (objc_class *)objc_opt_class(self, v10);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138544642;
      id v16 = v9;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2114;
      v22 = @"BKDirectTouchState.mm";
      __int16 v23 = 1024;
      int v24 = 183;
      __int16 v25 = 2114;
      v26 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
    JUMPOUT(0x100056014LL);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___BKDirectTouchState;
  return -[BKDirectTouchState init](&v14, "init");
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:",  self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100058CB0;
  v3[3] = &unk_1000B8030;
  v3[4] = self;
  v3[5] = a3;
  [a3 appendProem:self block:v3];
}

- (void)invalidate
{
  uint64_t v3 = BKLogTouchEvents(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "invalidate: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  sub_1000562B0(self, 0LL, 0LL);
  sub_1000563FC((uint64_t)self, 0LL, 0LL);
  -[BKDirectTouchStateHitTester invalidate](self->_hitTester, "invalidate");
  hitTester = self->_hitTester;
  self->_hitTester = 0LL;

  -[BKDirectTouchUpdateEvents invalidate](self->_updateEvents, "invalidate");
  updateEvents = self->_updateEvents;
  self->_updateEvents = 0LL;

  -[BSCompoundAssertion invalidate](self->_suppressTouchesAssertion, "invalidate");
  suppressTouchesAssertion = self->_suppressTouchesAssertion;
  self->_suppressTouchesAssertion = 0LL;
}

- (void).cxx_destruct
{
}

@end