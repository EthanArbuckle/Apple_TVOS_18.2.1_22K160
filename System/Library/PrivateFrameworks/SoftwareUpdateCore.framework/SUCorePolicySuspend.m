@interface SUCorePolicySuspend
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)skipPhase;
- (NSDictionary)additionalOptions;
- (SUCorePolicySuspend)initWithCoder:(id)a3;
- (SUCorePolicySuspend)initWithSkipPhaseSet:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int64_t)specifiedFields;
- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setSkipPhase:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicySuspend

- (SUCorePolicySuspend)initWithSkipPhaseSet:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCorePolicySuspend;
  v4 = -[SUCorePolicySuspend init](&v7, sel_init);
  v5 = v4;
  if (v4) {
    -[SUCorePolicySuspend backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  }
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  additionalOptions = self->_additionalOptions;
  self->_specifiedFields = 0LL;
  self->_additionalOptions = 0LL;
  self->_skipPhase = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicySuspend)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SUCorePolicySuspend;
  v5 = -[SUCorePolicySuspend init](&v8, sel_init);
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_skipPhase = [v4 decodeBoolForKey:@"SkipPhase"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUCorePolicySuspend specifiedFields](self, "specifiedFields"),  @"SpecifiedFields");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySuspend skipPhase](self, "skipPhase"), @"SkipPhase");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicySuspend skipPhase](self, "skipPhase"));
  v6 = -[SUCorePolicySuspend additionalOptions](self, "additionalOptions");
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setAdditionalOptions:v7];

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicySuspend specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicySuspend *)a3;
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
      BOOL v6 = -[SUCorePolicySuspend skipPhase](v5, "skipPhase");
      if (v6 == -[SUCorePolicySuspend skipPhase](self, "skipPhase"))
      {
        uint64_t v8 = -[SUCorePolicySuspend specifiedFields](v5, "specifiedFields");
        BOOL v7 = v8 == -[SUCorePolicySuspend specifiedFields](self, "specifiedFields");
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
  int64_t v4 = -[SUCorePolicySuspend specifiedFields](self, "specifiedFields");
  if (-[SUCorePolicySuspend skipPhase](self, "skipPhase")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  -[SUCorePolicySuspend additionalOptions](self, "additionalOptions");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SUCorePolicySuspend additionalOptions](self, "additionalOptions");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stringWithFormat:@"SUCorePolicySuspend(specifiedFields:0x%llX|skipPhase:%@|additionalOptions:%@)", v4, v5, v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v3 stringWithFormat:@"SUCorePolicySuspend(specifiedFields:0x%llX|skipPhase:%@|additionalOptions:%@)", v4, v5, @"none"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)summary
{
  if (-[SUCorePolicySuspend specifiedFields](self, "specifiedFields"))
  {
    BOOL v3 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"|fields=%llX",  -[SUCorePolicySuspend specifiedFields](self, "specifiedFields"));
    [&stru_18A0F22B0 stringByAppendingString:v3];
    int64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v4 = &stru_18A0F22B0;
  }

  if (-[SUCorePolicySuspend skipPhase](self, "skipPhase"))
  {
    uint64_t v5 = -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"|skipPhase");

    int64_t v4 = (__CFString *)v5;
  }

  -[SUCorePolicySuspend additionalOptions](self, "additionalOptions");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    BOOL v7 = @"|withAdditionalOptions";
  }
  else {
    BOOL v7 = @"|noAdditionalOptions";
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v8 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v9 = [v8 stringByAppendingString:@"|"];

    uint64_t v8 = (void *)v9;
  }

  return v8;
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

- (void).cxx_destruct
{
}

@end