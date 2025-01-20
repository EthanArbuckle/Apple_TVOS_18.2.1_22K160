@interface SUCoreConnectVersion
+ (BOOL)supportsSecureCoding;
- (NSString)selectorString;
- (SUCoreConnectVersion)initWithCoder:(id)a3;
- (SUCoreConnectVersion)initWithSelector:(SEL)a3;
- (SUCoreConnectVersion)initWithString:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUCoreConnectVersion

- (SUCoreConnectVersion)initWithSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SUCoreConnectVersion;
  v4 = -[SUCoreConnectVersion init](&v8, sel_init);
  if (v4)
  {
    uint64_t v5 = NSStringFromSelector(a3);
    selectorString = v4->_selectorString;
    v4->_selectorString = (NSString *)v5;
  }

  return v4;
}

- (SUCoreConnectVersion)initWithString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCoreConnectVersion;
  v6 = -[SUCoreConnectVersion init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_selectorString, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SUCoreConnectVersion selectorString](self, "selectorString");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"SelectorString"];
}

- (SUCoreConnectVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCoreConnectVersion;
  id v5 = -[SUCoreConnectVersion init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SelectorString"];
    selectorString = v5->_selectorString;
    v5->_selectorString = (NSString *)v6;
  }

  return v5;
}

- (id)description
{
  v2 = (void *)NSString;
  v3 = -[SUCoreConnectVersion selectorString](self, "selectorString");
  [v2 stringWithFormat:@"SUCoreConnectVersion(selectorString:%@)", v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)selectorString
{
  return self->_selectorString;
}

- (void).cxx_destruct
{
}

@end