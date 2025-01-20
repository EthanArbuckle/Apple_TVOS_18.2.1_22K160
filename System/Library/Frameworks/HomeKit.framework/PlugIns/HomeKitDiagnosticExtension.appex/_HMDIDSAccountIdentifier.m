@interface _HMDIDSAccountIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)namespace;
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (NSString)identifierString;
- (_HMDIDSAccountIdentifier)initWithCoder:(id)a3;
- (_HMDIDSAccountIdentifier)initWithIdentifier:(id)a3;
- (_HMDIDSAccountIdentifier)initWithIdentifierString:(id)a3;
- (id)kind;
- (id)senderCorrelationIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDIDSAccountIdentifier

- (_HMDIDSAccountIdentifier)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v6));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v7,  0LL));

  objc_exception_throw(v8);
  return -[_HMDIDSAccountIdentifier initWithIdentifierString:](v9, v10, v11);
}

- (_HMDIDSAccountIdentifier)initWithIdentifierString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___NSUUID);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_HMDIDSAccountIdentifier namespace](&OBJC_CLASS____HMDIDSAccountIdentifier, "namespace"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
    id v8 = -[NSUUID initWithNamespace:data:](v5, "initWithNamespace:data:", v6, v7);

    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS____HMDIDSAccountIdentifier;
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

- (BOOL)isEqual:(id)a3
{
  v5 = (_HMDIDSAccountIdentifier *)a3;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS____HMDIDSAccountIdentifier, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      v7 = v5;
    }
    else {
      v7 = 0LL;
    }
    id v8 = v7;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDIDSAccountIdentifier identifierString](self, "identifierString"));
      SEL v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDIDSAccountIdentifier identifierString](v8, "identifierString"));
      unsigned __int8 v11 = [v9 isEqualToString:v10];
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
  return @"IDS";
}

- (BOOL)isAuthenticated
{
  return 1;
}

- (id)senderCorrelationIdentifier
{
  return self->_identifierString;
}

- (_HMDIDSAccountIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____HMDIDSAccountIdentifier;
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
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____HMDIDSAccountIdentifier;
  id v4 = a3;
  -[_HMDAccountIdentifier encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HMDIDSAccountIdentifier identifierString](self, "identifierString", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"HM.string"];
}

- (NSString)identifierString
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)namespace
{
  if (qword_100032C48 != -1) {
    dispatch_once(&qword_100032C48, &stru_1000287F0);
  }
  return (id)qword_100032C40;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end