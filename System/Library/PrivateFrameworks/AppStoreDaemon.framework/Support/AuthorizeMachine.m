@interface AuthorizeMachine
- (AuthorizeMachine)init;
@end

@implementation AuthorizeMachine

- (AuthorizeMachine)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AuthorizeMachine;
  v2 = -[AuthorizeMachine init](&v15, "init");
  if (v2)
  {
    id v3 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    bag = v2->_bag;
    v2->_bag = (AMSBagProtocol *)v4;

    id v6 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    device = v2->_device;
    v2->_device = (Device *)v7;

    id v9 = sub_1001F4ADC((uint64_t)&OBJC_CLASS___AMSProcessInfo);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    clientInfo = v2->_clientInfo;
    v2->_clientInfo = (AMSProcessInfo *)v10;

    v12 = -[LogKey initWithCategory:](objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey), "initWithCategory:", @"AM");
    logKey = v2->_logKey;
    v2->_logKey = v12;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end