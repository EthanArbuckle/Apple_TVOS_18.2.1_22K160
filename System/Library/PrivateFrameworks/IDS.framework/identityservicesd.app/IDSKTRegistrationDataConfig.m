@interface IDSKTRegistrationDataConfig
- (IDSKTRegistrationData)registeredKTData;
- (IDSKTRegistrationData)unregisteredKTData;
- (IDSKTRegistrationDataConfig)init;
- (void)setRegisteredKTData:(id)a3;
- (void)setUnregisteredKTData:(id)a3;
@end

@implementation IDSKTRegistrationDataConfig

- (IDSKTRegistrationDataConfig)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSKTRegistrationDataConfig;
  v2 = -[IDSKTRegistrationDataConfig init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    unregisteredKTData = v2->_unregisteredKTData;
    v2->_unregisteredKTData = 0LL;

    registeredKTData = v3->_registeredKTData;
    v3->_registeredKTData = 0LL;
  }

  return v3;
}

- (IDSKTRegistrationData)unregisteredKTData
{
  return self->_unregisteredKTData;
}

- (void)setUnregisteredKTData:(id)a3
{
}

- (IDSKTRegistrationData)registeredKTData
{
  return self->_registeredKTData;
}

- (void)setRegisteredKTData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end