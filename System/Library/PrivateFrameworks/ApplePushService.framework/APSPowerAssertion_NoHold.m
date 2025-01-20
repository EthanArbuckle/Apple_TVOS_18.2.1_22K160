@interface APSPowerAssertion_NoHold
+ (void)prepareForWake;
+ (void)setUseInteractivePowerAssertion:(BOOL)a3;
- (APSPowerAssertion_NoHold)initWithName:(id)a3 category:(int)a4;
- (APSPowerAssertion_NoHold)initWithName:(id)a3 category:(int)a4 holdDuration:(double)a5;
- (BOOL)isClear;
- (NSString)name;
- (int)category;
- (void)_clear;
- (void)_hold;
- (void)clear;
- (void)dealloc;
- (void)hold;
- (void)setCategory:(int)a3;
@end

@implementation APSPowerAssertion_NoHold

- (APSPowerAssertion_NoHold)initWithName:(id)a3 category:(int)a4
{
  return -[APSPowerAssertion_NoHold initWithName:category:holdDuration:]( self,  "initWithName:category:holdDuration:",  a3,  *(void *)&a4,  0.0);
}

- (APSPowerAssertion_NoHold)initWithName:(id)a3 category:(int)a4 holdDuration:(double)a5
{
  id v9 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___APSPowerAssertion_NoHold;
  v10 = -[APSPowerAssertion_NoHold init](&v22, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_timeout = a5;
    v11->_powerAssertion = 0;
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v11->_category = a4;
    if (a5 > 0.0)
    {
      dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
      timer = v11->_timer;
      v11->_timer = (OS_dispatch_source *)v14;

      dispatch_source_set_timer((dispatch_source_t)v11->_timer, 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CUTWeakReference weakRefWithObject:](&OBJC_CLASS___CUTWeakReference, "weakRefWithObject:", v11));
      v17 = (dispatch_source_s *)v11->_timer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10005DA64;
      handler[3] = &unk_10011E4F0;
      id v21 = v16;
      id v18 = v16;
      dispatch_source_set_event_handler(v17, handler);
      dispatch_resume((dispatch_object_t)v11->_timer);
    }
  }

  return v11;
}

- (void)dealloc
{
  queue = (dispatch_queue_s *)self->_queue;
  if (queue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DB20;
    block[3] = &unk_10011E4F0;
    block[4] = self;
    dispatch_sync(queue, block);
    timer = self->_timer;
    if (timer) {
      dispatch_source_cancel((dispatch_source_t)timer);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___APSPowerAssertion_NoHold;
  -[APSPowerAssertion_NoHold dealloc](&v5, "dealloc");
}

- (void)hold
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DB80;
  block[3] = &unk_10011E4F0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_hold
{
  p_unsigned int powerAssertion = &self->_powerAssertion;
  unsigned int powerAssertion = self->_powerAssertion;
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (powerAssertion)
  {
    if (v6) {
      sub_1000BEF0C();
    }
  }

  else
  {
    if (v6) {
      sub_1000BEEAC();
    }

    v28[0] = @"AssertType";
    v28[1] = @"AssertName";
    name = self->_name;
    v29[0] = off_10014DB80;
    v29[1] = name;
    v28[2] = @"TimeoutSeconds";
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_timeout));
    v29[2] = v8;
    v28[3] = @"Category";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_category));
    v29[3] = v9;
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  4LL));

    IOReturn v10 = IOPMAssertionCreateWithProperties(v5, p_powerAssertion);
    if (v10)
    {
      IOReturn v11 = v10;
      unsigned int *p_powerAssertion = 0;
      dispatch_queue_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v21 = self->_name;
        int v22 = 138412802;
        v23 = self;
        __int16 v24 = 2112;
        v25 = v21;
        __int16 v26 = 1024;
        IOReturn v27 = v11;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "%@: Failed to create power assertion %@ result = %d",  (uint8_t *)&v22,  0x1Cu);
      }
    }

    else
    {
      do
        unint64_t v13 = __ldaxr((unint64_t *)&qword_10014E850);
      while (__stlxr(v13 + 1, (unint64_t *)&qword_10014E850));
    }

    dispatch_source_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000BEE44();
    }
  }

  if (self->_timer)
  {
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000BEDD4();
    }

    timer = self->_timer;
    dispatch_time_t v17 = dispatch_time(0LL, (unint64_t)(self->_timeout * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)timer, v17, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }

  if (off_10014DB80 == @"InteractivePushServiceTask")
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[APSWakeStateManager wakeStateManager](&OBJC_CLASS___APSWakeStateManager, "wakeStateManager"));
    unsigned int v19 = [v18 isGoingToSleep];

    if (v19)
    {
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_1000BED64();
      }

      byte_10014E858 = 1;
    }
  }

+ (void)prepareForWake
{
  if (byte_10014E858 == 1)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if (v3 >= 20.0)
    {
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1000BEFD4((uint64_t)a1, v4, v12, v13, v14, v15, v16, v17);
      }
    }

    else
    {
      ++qword_10014E860;
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1000BEF6C();
      }
    }

    byte_10014E858 = 0;
  }

  else if (qword_10014E860)
  {
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000BF038((uint64_t)a1, v5, v6, v7, v8, v9, v10, v11);
    }

    qword_10014E860 = 0LL;
  }

+ (void)setUseInteractivePowerAssertion:(BOOL)a3
{
  if (a3) {
    double v3 = @"InteractivePushServiceTask";
  }
  else {
    double v3 = @"ApplePushServiceTask";
  }
  if (v3 != off_10014DB80)
  {
    BOOL v4 = a3;
    unint64_t v6 = qword_10014E860;
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
    uint64_t v8 = v7;
    if (v6 < 0xB || !v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1000BF09C((uint64_t)v3, v8, v10, v11, v12, v13, v14, v15);
      }

      off_10014DB80 = v3;
    }

    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = a1;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Sleep reverted too often, ignoring request to change power assertion type",  (uint8_t *)&v17,  0xCu);
      }
    }
  }

- (void)clear
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005E124;
  block[3] = &unk_10011E4F0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_clear
{
  if (self->_powerAssertion)
  {
    double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000BF1E0();
    }

    do
    {
      unint64_t v4 = __ldaxr((unint64_t *)&qword_10014E850);
      unint64_t v5 = v4 - 1;
    }

    while (__stlxr(v5, (unint64_t *)&qword_10014E850));
    if (!v5)
    {
      unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_1000BF160();
      }

      +[APSPowerAssertion_NoHold _lingerAfterLastPowerAssertionIsReleased]( &OBJC_CLASS___APSPowerAssertion,  "_lingerAfterLastPowerAssertionIsReleased");
    }

    if (self->_timer)
    {
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog power](&OBJC_CLASS___APSLog, "power"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1000BF100();
      }

      dispatch_source_set_timer((dispatch_source_t)self->_timer, 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    }

    IOPMAssertionRelease(self->_powerAssertion);
    self->_unsigned int powerAssertion = 0;
  }

- (BOOL)isClear
{
  return self->_powerAssertion == 0;
}

- (NSString)name
{
  return self->_name;
}

- (int)category
{
  return self->_category;
}

- (void)setCategory:(int)a3
{
  self->_category = a3;
}

- (void).cxx_destruct
{
}

@end