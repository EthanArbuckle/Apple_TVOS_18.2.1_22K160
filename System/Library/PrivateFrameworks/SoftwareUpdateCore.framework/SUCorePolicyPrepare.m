@interface SUCorePolicyPrepare
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)skipPhase;
- (NSDictionary)additionalOptions;
- (NSDictionary)basePrepareOptions;
- (SUCorePolicyPrepare)initWithCoder:(id)a3;
- (SUCorePolicyPrepare)initWithSkipPhaseSet:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int64_t)specifiedFields;
- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setBasePrepareOptions:(id)a3;
- (void)setSkipPhase:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicyPrepare

- (SUCorePolicyPrepare)initWithSkipPhaseSet:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCorePolicyPrepare;
  v4 = -[SUCorePolicyPrepare init](&v7, sel_init);
  v5 = v4;
  if (v4) {
    -[SUCorePolicyPrepare backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  }
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  self->_specifiedFields = 0LL;
  self->_skipPhase = a3;
  additionalOptions = self->_additionalOptions;
  self->_additionalOptions = 0LL;

  basePrepareOptions = self->_basePrepareOptions;
  self->_basePrepareOptions = 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyPrepare)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyPrepare;
  v5 = -[SUCorePolicyPrepare init](&v9, sel_init);
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_skipPhase = [v4 decodeBoolForKey:@"SkipPhase"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0LL;

    basePrepareOptions = v5->_basePrepareOptions;
    v5->_basePrepareOptions = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUCorePolicyPrepare specifiedFields](self, "specifiedFields"),  @"SpecifiedFields");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyPrepare skipPhase](self, "skipPhase"), @"SkipPhase");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicyPrepare skipPhase](self, "skipPhase"));
  v6 = -[SUCorePolicyPrepare basePrepareOptions](self, "basePrepareOptions");
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBasePrepareOptions:v7];
  v8 = -[SUCorePolicyPrepare additionalOptions](self, "additionalOptions");
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAdditionalOptions:v9];

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyPrepare specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyPrepare *)a3;
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
      BOOL v6 = -[SUCorePolicyPrepare skipPhase](v5, "skipPhase");
      if (v6 == -[SUCorePolicyPrepare skipPhase](self, "skipPhase"))
      {
        uint64_t v8 = -[SUCorePolicyPrepare specifiedFields](v5, "specifiedFields");
        BOOL v7 = v8 == -[SUCorePolicyPrepare specifiedFields](self, "specifiedFields");
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
  int64_t v4 = -[SUCorePolicyPrepare specifiedFields](self, "specifiedFields");
  if (-[SUCorePolicyPrepare skipPhase](self, "skipPhase")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  -[SUCorePolicyPrepare basePrepareOptions](self, "basePrepareOptions");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SUCorePolicyPrepare basePrepareOptions](self, "basePrepareOptions");
    BOOL v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v7 = @"none";
  }

  -[SUCorePolicyPrepare additionalOptions](self, "additionalOptions");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SUCorePolicyPrepare additionalOptions](self, "additionalOptions");
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stringWithFormat:@"SUCorePolicySuspend(specifiedFields:0x%llX|skipPhase:%@|basePrepareOptions:%@|additionalOptions:%@)", v4, v5, v7, v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v3 stringWithFormat:@"SUCorePolicySuspend(specifiedFields:0x%llX|skipPhase:%@|basePrepareOptions:%@|additionalOptions:%@)", v4, v5, v7, @"none"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v6) {
  return v10;
  }
}

- (id)summary
{
  if (-[SUCorePolicyPrepare specifiedFields](self, "specifiedFields"))
  {
    BOOL v3 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"|fields=%llX",  -[SUCorePolicyPrepare specifiedFields](self, "specifiedFields"));
    [&stru_18A0F22B0 stringByAppendingString:v3];
    int64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v4 = &stru_18A0F22B0;
  }

  if (-[SUCorePolicyPrepare skipPhase](self, "skipPhase"))
  {
    uint64_t v5 = -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"|skipPhase");

    int64_t v4 = (__CFString *)v5;
  }

  -[SUCorePolicyPrepare basePrepareOptions](self, "basePrepareOptions");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    BOOL v7 = @"|withBasePrepareOptions";
  }
  else {
    BOOL v7 = @"|noBasePrepareOptions";
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicyPrepare additionalOptions](self, "additionalOptions");
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

- (NSDictionary)basePrepareOptions
{
  return self->_basePrepareOptions;
}

- (void)setBasePrepareOptions:(id)a3
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