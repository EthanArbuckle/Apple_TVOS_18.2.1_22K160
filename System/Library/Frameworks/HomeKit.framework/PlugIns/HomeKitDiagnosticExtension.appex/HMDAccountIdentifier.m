@interface HMDAccountIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)accountIdentifierForAccountHandle:(id)a3;
+ (id)accountIdentifierForAppleAccountContext:(id)a3;
+ (id)accountIdentifierForMessageContext:(id)a3;
+ (id)accountIdentifierForSenderCorrelationIdentifier:(id)a3;
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (HMDAccountIdentifier)init;
- (HMDAccountIdentifier)initWithCoder:(id)a3;
- (HMDAccountIdentifier)initWithInternal:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)senderCorrelationIdentifier;
- (NSString)shortDescription;
- (NSUUID)identifier;
- (_HMDAccountIdentifier)internal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAccountIdentifier

- (HMDAccountIdentifier)init
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return -[HMDAccountIdentifier initWithInternal:](v6, v7, v8);
}

- (HMDAccountIdentifier)initWithInternal:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___HMDAccountIdentifier;
    v6 = -[HMDAccountIdentifier init](&v10, "init");
    SEL v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_internal, a3);
    }
    self = v7;
    id v8 = self;
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier internal](self, "internal"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HMDAccountIdentifier *)a3;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMDAccountIdentifier, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      SEL v7 = v5;
    }
    else {
      SEL v7 = 0LL;
    }
    id v8 = v7;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier internal](self, "internal"));
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier internal](v8, "internal"));
      unsigned __int8 v11 = [v9 isEqual:v10];
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (NSString)shortDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier internal](self, "internal"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 kind]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier identifier](self, "identifier"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@)%@", v4, v6));

  return (NSString *)v7;
}

- (NSArray)attributeDescriptions
{
  id v3 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier internal](self, "internal"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 kind]);
  id v6 = [v3 initWithName:@"KN" value:v5];
  id v7 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier identifier](self, "identifier", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  id v10 = [v7 initWithName:@"ID" value:v9];
  v16[1] = v10;
  id v11 = objc_alloc(&OBJC_CLASS___HMFAttributeDescription);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier senderCorrelationIdentifier](self, "senderCorrelationIdentifier"));
  id v13 = [v11 initWithName:@"MID" value:v12];
  v16[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));

  return (NSArray *)v14;
}

- (NSUUID)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier internal](self, "internal"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return (NSUUID *)v3;
}

- (BOOL)isAuthenticated
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier internal](self, "internal"));
  unsigned __int8 v3 = [v2 isAuthenticated];

  return v3;
}

- (NSString)senderCorrelationIdentifier
{
  return -[_HMDAccountIdentifier senderCorrelationIdentifier](self->_internal, "senderCorrelationIdentifier");
}

- (HMDAccountIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(_HMDAccountIdentifier, v5),  @"HM.internal");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = -[HMDAccountIdentifier initWithInternal:](self, "initWithInternal:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[HMDAccountIdentifier internal](self, "internal"));
  [v4 encodeObject:v5 forKey:@"HM.internal"];
}

- (_HMDAccountIdentifier)internal
{
  return (_HMDAccountIdentifier *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)accountIdentifierForAccountHandle:(id)a3
{
  id v4 = a3;
  id v5 = -[_HMDAccountHandleIdentifier initWithAccountHandle:]( objc_alloc(&OBJC_CLASS____HMDAccountHandleIdentifier),  "initWithAccountHandle:",  v4);

  id v6 = [objc_alloc((Class)a1) initWithInternal:v5];
  return v6;
}

+ (id)accountIdentifierForAppleAccountContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS____HMDAppleAccountIdentifier);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  id v6 = -[_HMDAppleAccountIdentifier initWithIdentifierString:](v4, "initWithIdentifierString:", v5);
  id v7 = -[HMDAccountIdentifier initWithInternal:]( objc_alloc(&OBJC_CLASS___HMDAccountIdentifier),  "initWithInternal:",  v6);

  return v7;
}

+ (id)accountIdentifierForMessageContext:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 senderCorrelationIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 accountIdentifierForSenderCorrelationIdentifier:v4]);

  return v5;
}

+ (id)accountIdentifierForSenderCorrelationIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = -[_HMDIDSAccountIdentifier initWithIdentifierString:]( objc_alloc(&OBJC_CLASS____HMDIDSAccountIdentifier),  "initWithIdentifierString:",  v3);
    id v5 = -[HMDAccountIdentifier initWithInternal:]( objc_alloc(&OBJC_CLASS___HMDAccountIdentifier),  "initWithInternal:",  v4);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end