@interface BKDigitizerTouchStreamClient
- (BKDigitizerTouchStreamClient)init;
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
@end

@implementation BKDigitizerTouchStreamClient

- (BKDigitizerTouchStreamClient)init
{
  v5.receiver = self;
  v5.super_class = [BKDigitizerTouchStreamClient class];
  BKDigitizerTouchStreamClient *v2 = [[BKDigitizerTouchStreamClient alloc] init];
  v3 = v2;
  if (v2)
  {
    v2->_dispatchMode = 1;
    v2->_creationTime = BSContinuousMachTimeNow(v2);
    v3->_valid = 1;
  }

  return v3;
}

- (void)dealloc
{
  if (self && self->_valid)
  {
    v4 = [NSString stringWithFormat:@"dealloc without previous -invalidate"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      objc_super v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v8 = [self class];
      v9 = NSStringFromClass(v8);
      v10 = [v9 autorelease];
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BKDigitizerTouchStreamClient.m";
      __int16 v20 = 1024;
      int v21 = 45;
      __int16 v22 = 2114;
      v23 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
    JUMPOUT(0x100067314LL);
  }

  v11.receiver = self;
  v11.super_class = [BKDigitizerTouchStreamClient class];
  [v11 dealloc];
}

- (NSString)description
{
  return [BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000673CC;
  v3[3] = &unk_1000B8030;
  v3[4] = a3;
  v3[5] = self;
  [a3 appendProem:self block:v3];
}

- (void).cxx_destruct
{
}

@end