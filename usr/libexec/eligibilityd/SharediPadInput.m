@interface SharediPadInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSharediPad;
- (SharediPadInput)init;
- (SharediPadInput)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SharediPadInput

- (BOOL)isSharediPad
{
  return 0;
}

- (SharediPadInput)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SharediPadInput;
  return -[EligibilityInput initWithInputType:status:process:]( &v3,  "initWithInputType:status:process:",  12LL,  0LL,  @"eligibilityd");
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SharediPadInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (SharediPadInput)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SharediPadInput;
  return -[EligibilityInput initWithCoder:](&v4, "initWithCoder:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SharediPadInput;
  return -[EligibilityInput copyWithZone:](&v4, "copyWithZone:", a3);
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SharediPadInput;
  return -[EligibilityInput hash](&v3, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (SharediPadInput *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SharediPadInput;
  if (-[EligibilityInput isEqual:](&v8, "isEqual:", v4))
  {
    if (v4 == self)
    {
      char isKindOfClass = 1;
    }

    else
    {
      uint64_t v5 = objc_opt_class(self);
      char isKindOfClass = objc_opt_isKindOfClass(v4, v5);
    }
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)description
{
  if (-[SharediPadInput isSharediPad](self, "isSharediPad")) {
    objc_super v3 = @"Y";
  }
  else {
    objc_super v3 = @"N";
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SharediPadInput;
  id v4 = -[EligibilityInput description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[SharediPadInput isSharediPad:%@ %@]",  v3,  v5));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end