@interface KDevice
- (BOOL)hasSignature;
- (BOOL)isEqual:(id)a3;
- (KDevice)initWithPushToken:(id)a3 registrationData:(id)a4;
- (NSData)pushToken;
- (NSData)registrationData;
- (NSMutableSet)apps;
- (NSString)state;
- (unint64_t)hash;
- (void)addApplication:(id)a3;
- (void)markedSigned;
- (void)setApps:(id)a3;
- (void)setHasSignature:(BOOL)a3;
- (void)setPushToken:(id)a3;
- (void)setRegistrationData:(id)a3;
@end

@implementation KDevice

- (KDevice)initWithPushToken:(id)a3 registrationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___KDevice;
  v8 = -[KDevice init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    -[KDevice setPushToken:](v8, "setPushToken:", v6);
    -[KDevice setRegistrationData:](v9, "setRegistrationData:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[KDevice setApps:](v9, "setApps:", v10);

    v11 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___KDevice, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KDevice pushToken](self, "pushToken"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 pushToken]);
    if ([v7 isEqual:v8])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KDevice registrationData](self, "registrationData"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 registrationData]);
      unsigned __int8 v11 = [v9 isEqual:v10];
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KDevice pushToken](self, "pushToken"));
  id v4 = (char *)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KDevice registrationData](self, "registrationData"));
  uint64_t v6 = &v4[(void)[v5 hash]];

  return (unint64_t)v6;
}

- (void)addApplication:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[KDevice apps](self, "apps"));
  [v5 addObject:v4];
}

- (void)markedSigned
{
}

- (NSString)state
{
  if (-[KDevice hasSignature](self, "hasSignature")) {
    return (NSString *)@"signed";
  }
  else {
    return (NSString *)@"initial";
  }
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPushToken:(id)a3
{
}

- (NSData)registrationData
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRegistrationData:(id)a3
{
}

- (NSMutableSet)apps
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setApps:(id)a3
{
}

- (BOOL)hasSignature
{
  return self->_hasSignature;
}

- (void)setHasSignature:(BOOL)a3
{
  self->_hasSignature = a3;
}

- (void).cxx_destruct
{
}

@end