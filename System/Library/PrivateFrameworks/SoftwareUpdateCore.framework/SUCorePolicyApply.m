@interface SUCorePolicyApply
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)skipPhase;
- (NSDictionary)additionalOptions;
- (NSDictionary)baseApplyOptions;
- (SUCorePolicyApply)initWithCoder:(id)a3;
- (SUCorePolicyApply)initWithSkipPhaseSet:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int64_t)specifiedFields;
- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setBaseApplyOptions:(id)a3;
- (void)setSkipPhase:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicyApply

- (SUCorePolicyApply)initWithSkipPhaseSet:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCorePolicyApply;
  v4 = -[SUCorePolicyApply init](&v7, sel_init);
  v5 = v4;
  if (v4) {
    -[SUCorePolicyApply backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  }
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  additionalOptions = self->_additionalOptions;
  self->_specifiedFields = 0LL;
  self->_additionalOptions = 0LL;
  self->_skipPhase = a3;

  baseApplyOptions = self->_baseApplyOptions;
  self->_baseApplyOptions = 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyApply)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyApply;
  v5 = -[SUCorePolicyApply init](&v9, sel_init);
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_skipPhase = [v4 decodeBoolForKey:@"SkipPhase"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0LL;

    baseApplyOptions = v5->_baseApplyOptions;
    v5->_baseApplyOptions = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUCorePolicyApply specifiedFields](self, "specifiedFields"),  @"SpecifiedFields");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyApply skipPhase](self, "skipPhase"), @"SkipPhase");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicyApply skipPhase](self, "skipPhase"));
  v6 = -[SUCorePolicyApply baseApplyOptions](self, "baseApplyOptions");
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBaseApplyOptions:v7];
  v8 = -[SUCorePolicyApply additionalOptions](self, "additionalOptions");
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAdditionalOptions:v9];

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyApply specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyApply *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      BOOL v6 = -[SUCorePolicyApply skipPhase](v5, "skipPhase");
      if (v6 == -[SUCorePolicyApply skipPhase](self, "skipPhase"))
      {
        uint64_t v8 = -[SUCorePolicyApply specifiedFields](v5, "specifiedFields");
        BOOL v7 = v8 == -[SUCorePolicyApply specifiedFields](self, "specifiedFields");
      }

      else
      {
        BOOL v7 = 0;
      }
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  BOOL v3 = (void *)NSString;
  int64_t v4 = -[SUCorePolicyApply specifiedFields](self, "specifiedFields");
  if (-[SUCorePolicyApply skipPhase](self, "skipPhase")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  -[SUCorePolicyApply baseApplyOptions](self, "baseApplyOptions");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SUCorePolicyApply baseApplyOptions](self, "baseApplyOptions");
    BOOL v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v7 = @"none";
  }

  -[SUCorePolicyApply additionalOptions](self, "additionalOptions");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SUCorePolicyApply additionalOptions](self, "additionalOptions");
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stringWithFormat:@"SUCorePolicyApply(specifiedFields:0x%llX|skipPhase:%@|baseApplyOptions:%@|additionalOptions:%@)", v4, v5, v7, v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v3 stringWithFormat:@"SUCorePolicyApply(specifiedFields:0x%llX|skipPhase:%@|baseApplyOptions:%@|additionalOptions:%@)", v4, v5, v7, @"none"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v6) {
  return v10;
  }
}

- (id)summary
{
  if (-[SUCorePolicyApply specifiedFields](self, "specifiedFields"))
  {
    BOOL v3 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"|fields=%llX",  -[SUCorePolicyApply specifiedFields](self, "specifiedFields"));
    [&stru_18A0F22B0 stringByAppendingString:v3];
    int64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v4 = &stru_18A0F22B0;
  }

  if (-[SUCorePolicyApply skipPhase](self, "skipPhase"))
  {
    uint64_t v5 = -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"|skipPhase");

    int64_t v4 = (__CFString *)v5;
  }

  -[SUCorePolicyApply baseApplyOptions](self, "baseApplyOptions");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    BOOL v7 = @"|withBaseApplyOptions";
  }
  else {
    BOOL v7 = @"|noBaseApplyOptions";
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicyApply additionalOptions](self, "additionalOptions");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9) {
    v10 = @"|withAdditionalOptions";
  }
  else {
    v10 = @"|noAdditionalOptions";
  }
  [v8 stringByAppendingString:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v11 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v12 = [v11 stringByAppendingString:@"|"];

    v11 = (void *)v12;
  }

  return v11;
}

- (int64_t)specifiedFields
{
  return self->_specifiedFields;
}

- (void)setSpecifiedFields:(int64_t)a3
{
  self->_specifiedFields = a3;
}

- (BOOL)skipPhase
{
  return self->_skipPhase;
}

- (void)setSkipPhase:(BOOL)a3
{
  self->_skipPhase = a3;
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
}

- (NSDictionary)baseApplyOptions
{
  return self->_baseApplyOptions;
}

- (void)setBaseApplyOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end