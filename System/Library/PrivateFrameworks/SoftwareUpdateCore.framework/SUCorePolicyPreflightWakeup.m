@interface SUCorePolicyPreflightWakeup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)performPhase;
- (NSDictionary)additionalOptions;
- (NSDictionary)basePreflightOptions;
- (SUCorePolicyPreflightWakeup)init;
- (SUCorePolicyPreflightWakeup)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setBasePreflightOptions:(id)a3;
- (void)setPerformPhase:(BOOL)a3;
@end

@implementation SUCorePolicyPreflightWakeup

- (SUCorePolicyPreflightWakeup)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCorePolicyPreflightWakeup;
  v2 = -[SUCorePolicyPreflightWakeup init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_performPhase = 0;
    additionalOptions = v2->_additionalOptions;
    v2->_additionalOptions = 0LL;

    basePreflightOptions = v3->_basePreflightOptions;
    v3->_basePreflightOptions = 0LL;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyPreflightWakeup)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyPreflightWakeup;
  v5 = -[SUCorePolicyPreflightWakeup init](&v9, sel_init);
  if (v5)
  {
    v5->_performPhase = [v4 decodeBoolForKey:@"PerformPhase"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0LL;

    basePreflightOptions = v5->_basePreflightOptions;
    v5->_basePreflightOptions = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyPreflightWakeup performPhase](self, "performPhase"),  @"PerformPhase");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setPerformPhase:", -[SUCorePolicyPreflightWakeup performPhase](self, "performPhase"));
  v6 = -[SUCorePolicyPreflightWakeup basePreflightOptions](self, "basePreflightOptions");
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBasePreflightOptions:v7];
  v8 = -[SUCorePolicyPreflightWakeup additionalOptions](self, "additionalOptions");
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAdditionalOptions:v9];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyPreflightWakeup *)a3;
  if (v4 == self)
  {
    LOBYTE(v6) = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      BOOL v5 = -[SUCorePolicyPreflightWakeup performPhase](v4, "performPhase");
      int v6 = v5 ^ -[SUCorePolicyPreflightWakeup performPhase](self, "performPhase") ^ 1;
    }

    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (id)description
{
  v3 = (void *)NSString;
  if (-[SUCorePolicyPreflightWakeup performPhase](self, "performPhase")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  -[SUCorePolicyPreflightWakeup basePreflightOptions](self, "basePreflightOptions");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SUCorePolicyPreflightWakeup basePreflightOptions](self, "basePreflightOptions");
    int v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v6 = @"none";
  }

  -[SUCorePolicyPreflightWakeup additionalOptions](self, "additionalOptions");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[SUCorePolicyPreflightWakeup additionalOptions](self, "additionalOptions");
    [v3 stringWithFormat:@"SUCorePolicyPreflightWakeup(performPhase:%@|basePreflightOptions:%@|additionalOptions:%@)", v4, v6, v8];
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v3 stringWithFormat:@"SUCorePolicyPreflightWakeup(performPhase:%@|basePreflightOptions:%@|additionalOptions:%@)", v4, v6, @"none"];
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v5) {
  return v9;
  }
}

- (id)summary
{
  if (-[SUCorePolicyPreflightWakeup performPhase](self, "performPhase"))
  {
    [&stru_18A0F22B0 stringByAppendingString:@"|performPhase"];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = &stru_18A0F22B0;
  }

  -[SUCorePolicyPreflightWakeup basePreflightOptions](self, "basePreflightOptions");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    BOOL v5 = @"|withBasePreflightOptions";
  }
  else {
    BOOL v5 = @"|noBasePreflightOptions";
  }
  -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v5);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicyPreflightWakeup additionalOptions](self, "additionalOptions");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    v8 = @"|withAdditionalOptions";
  }
  else {
    v8 = @"|noAdditionalOptions";
  }
  [v6 stringByAppendingString:v8];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v9 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v10 = [v9 stringByAppendingString:@"|"];

    objc_super v9 = (void *)v10;
  }

  return v9;
}

- (BOOL)performPhase
{
  return self->_performPhase;
}

- (void)setPerformPhase:(BOOL)a3
{
  self->_performPhase = a3;
}

- (NSDictionary)basePreflightOptions
{
  return self->_basePreflightOptions;
}

- (void)setBasePreflightOptions:(id)a3
{
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end