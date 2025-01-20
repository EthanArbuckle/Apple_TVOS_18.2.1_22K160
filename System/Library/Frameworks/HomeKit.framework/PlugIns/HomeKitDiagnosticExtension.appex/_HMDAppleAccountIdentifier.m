@interface _HMDAppleAccountIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)namespace;
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (NSString)identifierString;
- (_HMDAppleAccountIdentifier)initWithCoder:(id)a3;
- (_HMDAppleAccountIdentifier)initWithIdentifier:(id)a3;
- (_HMDAppleAccountIdentifier)initWithIdentifierString:(id)a3;
- (id)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDAppleAccountIdentifier

- (_HMDAppleAccountIdentifier)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v6));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v7,  0LL));

  objc_exception_throw(v8);
  return -[_HMDAppleAccountIdentifier initWithIdentifierString:](v9, v10, v11);
}

- (_HMDAppleAccountIdentifier)initWithIdentifierString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___NSUUID);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_HMDAppleAccountIdentifier namespace](&OBJC_CLASS____HMDAppleAccountIdentifier, "namespace"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
    id v8 = -[NSUUID initWithNamespace:data:](v5, "initWithNamespace:data:", v6, v7);

    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS____HMDAppleAccountIdentifier;
    v9 = -[_HMDAccountIdentifier initWithIdentifier:](&v14, "initWithIdentifier:", v8);
    if (v9)
    {
      SEL v10 = (NSString *)[v4 copy];
      identifierString = v9->_identifierString;
      v9->_identifierString = v10;
    }

    self = v9;

    v12 = self;
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)kind
{
  return @"AA";
}

- (BOOL)isEqual:(id)a3
{
  v5 = (_HMDAppleAccountIdentifier *)a3;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS____HMDAppleAccountIdentifier, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      v7 = v5;
    }
    else {
      v7 = 0LL;
    }
    id v8 = v7;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDAppleAccountIdentifier identifierString](self, "identifierString"));
      SEL v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDAppleAccountIdentifier identifierString](v8, "identifierString"));
      unsigned __int8 v11 = [v9 isEqualToString:v10];
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (BOOL)isAuthenticated
{
  return 0;
}

- (_HMDAppleAccountIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____HMDAppleAccountIdentifier;
  uint64_t v6 = -[_HMDAccountIdentifier initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"HM.string");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    identifierString = v6->_identifierString;
    v6->_identifierString = (NSString *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____HMDAppleAccountIdentifier;
  -[_HMDAccountIdentifier encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  os_unfair_lock_lock_with_options(&self->_lock, 0LL);
  [v4 encodeObject:self->_identifierString forKey:@"HM.string"];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)identifierString
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)namespace
{
  if (qword_100032C38 != -1) {
    dispatch_once(&qword_100032C38, &stru_1000287D0);
  }
  return (id)qword_100032C30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end