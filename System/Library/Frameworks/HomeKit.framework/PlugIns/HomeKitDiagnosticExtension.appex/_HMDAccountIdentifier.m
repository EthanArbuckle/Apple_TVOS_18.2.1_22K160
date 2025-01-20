@interface _HMDAccountIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (NSString)kind;
- (NSString)senderCorrelationIdentifier;
- (NSUUID)identifier;
- (_HMDAccountIdentifier)init;
- (_HMDAccountIdentifier)initWithCoder:(id)a3;
- (_HMDAccountIdentifier)initWithIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDAccountIdentifier

- (_HMDAccountIdentifier)init
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return -[_HMDAccountIdentifier initWithIdentifier:](v6, v7, v8);
}

- (_HMDAccountIdentifier)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS____HMDAccountIdentifier;
    id v5 = -[_HMDAccountIdentifier init](&v10, "init");
    if (v5)
    {
      v6 = (NSUUID *)[v4 copy];
      identifier = v5->_identifier;
      v5->_identifier = v6;
    }

    self = v5;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDAccountIdentifier identifier](self, "identifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (_HMDAccountIdentifier *)a3;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS____HMDAccountIdentifier, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      SEL v7 = v5;
    }
    else {
      SEL v7 = 0LL;
    }
    id v8 = v7;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDAccountIdentifier identifier](self, "identifier"));
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDAccountIdentifier identifier](v8, "identifier"));
      unsigned __int8 v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (NSString)kind
{
  v2 = NSStringFromSelector(a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return (NSString *)-[_HMDAccountIdentifier isAuthenticated](v6, v7);
}

- (BOOL)isAuthenticated
{
  return 0;
}

- (NSString)senderCorrelationIdentifier
{
  return 0LL;
}

- (_HMDAccountIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____HMDAccountIdentifier;
  uint64_t v6 = -[_HMDAccountIdentifier init](&v11, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSUUID, v5),  @"HM.identifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[_HMDAccountIdentifier identifier](self, "identifier"));
  [v4 encodeObject:v5 forKey:@"HM.identifier"];
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end