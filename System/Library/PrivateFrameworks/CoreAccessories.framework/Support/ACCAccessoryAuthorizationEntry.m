@interface ACCAccessoryAuthorizationEntry
- (ACCAccessoryAuthorizationEntry)init;
- (BOOL)authorized;
- (NSString)certSerialString;
- (NSString)displayName;
- (id)description;
- (void)setAuthorized:(BOOL)a3;
- (void)setCertSerialString:(id)a3;
- (void)setDisplayName:(id)a3;
@end

@implementation ACCAccessoryAuthorizationEntry

- (ACCAccessoryAuthorizationEntry)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCAccessoryAuthorizationEntry;
  v2 = -[ACCAccessoryAuthorizationEntry init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    certSerialString = v2->_certSerialString;
    v2->_certSerialString = 0LL;

    displayName = v3->_displayName;
    v3->_displayName = 0LL;

    v3->_authorized = 0;
  }

  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCAccessoryAuthorizationEntry displayName](self, "displayName"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCAccessoryAuthorizationEntry certSerialString](self, "certSerialString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, displayName: %@, certSerialString: %@>",  v5,  self,  v6,  v7));

  return v8;
}

- (NSString)certSerialString
{
  return self->_certSerialString;
}

- (void)setCertSerialString:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)authorized
{
  return self->_authorized;
}

- (void)setAuthorized:(BOOL)a3
{
  self->_authorized = a3;
}

- (void).cxx_destruct
{
}

@end