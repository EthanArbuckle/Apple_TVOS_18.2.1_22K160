@interface ASCLockupFeatureSingleSignOn
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureSingleSignOn)initWithCoder:(id)a3;
- (ASCLockupFeatureSingleSignOn)initWithRequiresSSOEntitlement:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresSSOEntitlement;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureSingleSignOn

- (ASCLockupFeatureSingleSignOn)initWithRequiresSSOEntitlement:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ASCLockupFeatureSingleSignOn;
  result = -[ASCLockupFeatureSingleSignOn init](&v5, "init");
  if (result) {
    result->_requiresSSOEntitlement = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureSingleSignOn)initWithCoder:(id)a3
{
  return -[ASCLockupFeatureSingleSignOn initWithRequiresSSOEntitlement:]( self,  "initWithRequiresSSOEntitlement:",  [a3 decodeBoolForKey:@"requiresSSOEntitlement"]);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ASCLockupFeatureSingleSignOn requiresSSOEntitlement](self, "requiresSSOEntitlement"),  @"requiresSSOEntitlement");
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  -[ASCHasher combineBool:]( v3,  "combineBool:",  -[ASCLockupFeatureSingleSignOn requiresSSOEntitlement](self, "requiresSSOEntitlement"));
  unint64_t v4 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ASCLockupFeatureSingleSignOn *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupFeatureSingleSignOn);
    v6 = v4;
    v7 = v6;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
        v8 = v7;
      }
      else {
        v8 = 0LL;
      }
    }

    else
    {
      v8 = 0LL;
    }

    v10 = v8;

    if (v10)
    {
      unsigned int v11 = -[ASCLockupFeatureSingleSignOn requiresSSOEntitlement](self, "requiresSSOEntitlement");
      unsigned int v9 = v11 ^ -[ASCLockupFeatureSingleSignOn requiresSSOEntitlement](v10, "requiresSSOEntitlement") ^ 1;
    }

    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCLockupFeatureSingleSignOn requiresSSOEntitlement](self, "requiresSSOEntitlement"),  @"requiresSSOEntitlement");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));

  return (NSString *)v4;
}

- (BOOL)requiresSSOEntitlement
{
  return self->_requiresSSOEntitlement;
}

@end