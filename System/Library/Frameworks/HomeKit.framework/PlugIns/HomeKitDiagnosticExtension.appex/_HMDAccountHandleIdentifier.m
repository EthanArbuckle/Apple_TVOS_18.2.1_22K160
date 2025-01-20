@interface _HMDAccountHandleIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDAccountHandle)accountHandle;
- (_HMDAccountHandleIdentifier)initWithAccountHandle:(id)a3;
- (_HMDAccountHandleIdentifier)initWithCoder:(id)a3;
- (_HMDAccountHandleIdentifier)initWithIdentifier:(id)a3;
- (id)identifier;
- (id)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDAccountHandleIdentifier

- (_HMDAccountHandleIdentifier)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v6));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v7,  0LL));

  objc_exception_throw(v8);
  return -[_HMDAccountHandleIdentifier initWithAccountHandle:](v9, v10, v11);
}

- (_HMDAccountHandleIdentifier)initWithAccountHandle:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS____HMDAccountHandleIdentifier;
    v7 = -[_HMDAccountIdentifier initWithIdentifier:](&v12, "initWithIdentifier:", v6);

    if (v7)
    {
      id v8 = (HMDAccountHandle *)[v5 copy];
      accountHandle = v7->_accountHandle;
      v7->_accountHandle = v8;
    }

    self = v7;
    SEL v10 = self;
  }

  else
  {
    SEL v10 = 0LL;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (_HMDAccountHandleIdentifier *)a3;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS____HMDAccountHandleIdentifier, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      v7 = v5;
    }
    else {
      v7 = 0LL;
    }
    id v8 = v7;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDAccountHandleIdentifier accountHandle](self, "accountHandle"));
      SEL v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDAccountHandleIdentifier accountHandle](v8, "accountHandle"));
      unsigned __int8 v11 = [v9 isEqual:v10];
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (id)kind
{
  return @"AH";
}

- (id)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDAccountHandleIdentifier accountHandle](self, "accountHandle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return v3;
}

- (_HMDAccountHandleIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____HMDAccountHandleIdentifier;
  uint64_t v6 = -[_HMDAccountIdentifier initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(HMDAccountHandle, v5),  @"HM.handle");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    accountHandle = v6->_accountHandle;
    v6->_accountHandle = (HMDAccountHandle *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____HMDAccountHandleIdentifier;
  id v4 = a3;
  -[_HMDAccountIdentifier encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDAccountHandleIdentifier accountHandle](self, "accountHandle", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"HM.handle"];
}

- (HMDAccountHandle)accountHandle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end