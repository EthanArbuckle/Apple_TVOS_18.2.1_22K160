@interface RefetchKeybag
- (RefetchKeybag)init;
@end

@implementation RefetchKeybag

- (RefetchKeybag)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RefetchKeybag;
  v2 = -[RefetchKeybag init](&v9, "init");
  if (v2)
  {
    id v3 = sub_1001F4ADC((uint64_t)&OBJC_CLASS___AMSProcessInfo);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    clientInfo = v2->_clientInfo;
    v2->_clientInfo = (AMSProcessInfo *)v4;

    v6 = -[LogKey initWithCategory:](objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey), "initWithCategory:", @"RK");
    logKey = v2->_logKey;
    v2->_logKey = v6;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end