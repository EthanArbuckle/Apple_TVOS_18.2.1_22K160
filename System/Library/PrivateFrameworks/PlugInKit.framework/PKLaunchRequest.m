@interface PKLaunchRequest
+ (id)launchRequestWithUUID:(id)a3 launchPersona:(id)a4;
- (NSUUID)uuid;
- (PKPersona)launchPersona;
- (id)_initWithUUID:(id)a3 launchPersona:(id)a4;
- (void)setLaunchPersona:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PKLaunchRequest

- (id)_initWithUUID:(id)a3 launchPersona:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PKLaunchRequest;
  v12 = -[PKLaunchRequest init](&v16, sel_init);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v6, v8, v9, v10, v11);
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_launchPersona, a4);
  }

  return v12;
}

+ (id)launchRequestWithUUID:(id)a3 launchPersona:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  uint64_t v11 = (void *)objc_msgSend__initWithUUID_launchPersona_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);

  return v11;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (PKPersona)launchPersona
{
  return (PKPersona *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLaunchPersona:(id)a3
{
}

- (void).cxx_destruct
{
}

@end