@interface BKMainDisplayObserver
- (BKMainDisplayObserver)init;
- (BKSHIDEventDisplay)display;
- (id)displayChangedHandler;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDisplayChangedHandler:(id)a3;
@end

@implementation BKMainDisplayObserver

- (BKMainDisplayObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BKMainDisplayObserver;
  v2 = -[BKMainDisplayObserver init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    [v3 addObserver:v2 forKeyPath:@"uniqueId" options:0 context:@"BKHIDKVOWindowServerDisplayUUID"];
  }

  return v2;
}

- (BKSHIDEventDisplay)display
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDisplay builtinDisplay](&OBJC_CLASS___BKSHIDEventDisplay, "builtinDisplay"));
  id v3 = sub_1000195F8();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueId]);
    if (v6)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( +[BKSHIDEventDisplay displayWithHardwareIdentifier:]( &OBJC_CLASS___BKSHIDEventDisplay,  "displayWithHardwareIdentifier:",  v6));

      v2 = (void *)v7;
    }
  }

  return (BKSHIDEventDisplay *)v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == @"BKHIDKVOWindowServerDisplayUUID" && self->_displayChangedHandler)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainDisplayObserver display](self, "display"));
    uint64_t v14 = (*((uint64_t (**)(void))self->_displayChangedHandler + 2))();
    uint64_t v15 = BKLogEventDelivery(v14);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      v18 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "_mainDisplay changed:%{public}@",  (uint8_t *)&v17,  0xCu);
    }
  }
}

- (id)displayChangedHandler
{
  return self->_displayChangedHandler;
}

- (void)setDisplayChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end