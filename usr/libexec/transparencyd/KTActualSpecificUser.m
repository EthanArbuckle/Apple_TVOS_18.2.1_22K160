@interface KTActualSpecificUser
- (KTActualSpecificUser)initWithACAccount:(id)a3;
- (NSString)altDSID;
- (NSString)contextID;
- (NSString)dsid;
- (void)setAltDSID:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDsid:(id)a3;
@end

@implementation KTActualSpecificUser

- (KTActualSpecificUser)initWithACAccount:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___KTActualSpecificUser;
  v5 = -[KTActualSpecificUser init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));
    -[KTActualSpecificUser setDsid:](v5, "setDsid:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID"));
    -[KTActualSpecificUser setAltDSID:](v5, "setAltDSID:", v7);

    -[KTActualSpecificUser setContextID:](v5, "setContextID:", @"default");
    v8 = v5;
  }

  return v5;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setContextID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end