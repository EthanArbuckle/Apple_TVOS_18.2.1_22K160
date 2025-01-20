@interface NISystemConfiguration
+ (BOOL)supportsSecureCoding;
+ (NISystemConfiguration)new;
- (BOOL)_internalOsTransactionRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)prewarmSecureElementChannel;
- (BOOL)prewarmUWB;
- (NISystemConfiguration)init;
- (NISystemConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPrewarmSecureElementChannel:(BOOL)a3;
- (void)setPrewarmUWB:(BOOL)a3;
@end

@implementation NISystemConfiguration

- (NISystemConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NISystemConfiguration;
  result = -[NIConfiguration initInternal](&v3, "initInternal");
  if (result)
  {
    result->_prewarmUWB = 0;
    result->_prewarmSecureElementChannel = 0;
  }

  return result;
}

+ (NISystemConfiguration)new
{
  return objc_alloc_init(&OBJC_CLASS___NISystemConfiguration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NISystemConfiguration;
  id v4 = -[NIConfiguration copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setPrewarmUWB:self->_prewarmUWB];
  [v4 setPrewarmSecureElementChannel:self->_prewarmSecureElementChannel];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NISystemConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  [v4 encodeBool:self->_prewarmUWB forKey:@"prewarmUWB"];
  [v4 encodeBool:self->_prewarmSecureElementChannel forKey:@"prewarmSecureElementChannel"];
}

- (NISystemConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NISystemConfiguration;
  objc_super v5 = -[NIConfiguration initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    unsigned __int8 v6 = [v4 decodeBoolForKey:@"prewarmUWB"];
    unsigned __int8 v7 = [v4 decodeBoolForKey:@"prewarmSecureElementChannel"];
    v5->_prewarmUWB = v6;
    v5->_prewarmSecureElementChannel = v7;
    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    unsigned __int8 v7 = (NISystemConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      BOOL v13 = 1;
    }

    else
    {
      unsigned int v9 = -[NISystemConfiguration prewarmUWB](v7, "prewarmUWB");
      int prewarmUWB = self->_prewarmUWB;
      unsigned int v11 = -[NISystemConfiguration prewarmSecureElementChannel](v8, "prewarmSecureElementChannel");
      BOOL v13 = prewarmUWB == v9 && self->_prewarmSecureElementChannel == v11;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_prewarmUWB ^ self->_prewarmSecureElementChannel ^ 0x1Fu;
}

- (id)description
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NISystemConfiguration descriptionInternal](self, "descriptionInternal"));
  unsigned int v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<prewarm [UWB: %d, secureElementChannel: %d]>",  self->_prewarmUWB,  self->_prewarmSecureElementChannel);
}

- (BOOL)_internalOsTransactionRequired
{
  return 0;
}

- (BOOL)prewarmUWB
{
  return self->_prewarmUWB;
}

- (void)setPrewarmUWB:(BOOL)a3
{
  self->_int prewarmUWB = a3;
}

- (BOOL)prewarmSecureElementChannel
{
  return self->_prewarmSecureElementChannel;
}

- (void)setPrewarmSecureElementChannel:(BOOL)a3
{
  self->_prewarmSecureElementChannel = a3;
}

@end