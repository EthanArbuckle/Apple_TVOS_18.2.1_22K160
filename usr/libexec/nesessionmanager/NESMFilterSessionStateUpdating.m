@interface NESMFilterSessionStateUpdating
- (NESMFilterSessionStateUpdating)init;
- (void)enterWithSession:(id)a3;
- (void)handleStop;
@end

@implementation NESMFilterSessionStateUpdating

- (NESMFilterSessionStateUpdating)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateUpdating;
  return -[NESMFilterSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 5LL, 300LL);
}

- (void)enterWithSession:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateUpdating;
  -[NESMFilterSessionState enterWithSession:](&v8, "enterWithSession:", a3);
  if (self)
  {
    Property = objc_getProperty(self, v4, 16LL, 1);
    if (Property)
    {
      v6 = Property;
      sub_100070430(Property, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 server]);
      [v7 requestUninstallForSession:v6];
    }
  }

- (void)handleStop
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    v7 = (objc_class *)objc_opt_class(self);
    objc_super v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ ignoring stop message in state %@",  (uint8_t *)&v10,  0x16u);
  }
}

@end