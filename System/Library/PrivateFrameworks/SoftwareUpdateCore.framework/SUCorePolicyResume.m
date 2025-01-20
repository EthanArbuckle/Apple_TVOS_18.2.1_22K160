@interface SUCorePolicyResume
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)skipPhase;
- (NSDictionary)additionalOptions;
- (NSDictionary)baseResumeOptions;
- (SUCorePolicyResume)initWithCoder:(id)a3;
- (SUCorePolicyResume)initWithSkipPhaseSet:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int64_t)specifiedFields;
- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setBaseResumeOptions:(id)a3;
- (void)setSkipPhase:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicyResume

- (SUCorePolicyResume)initWithSkipPhaseSet:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCorePolicyResume;
  v4 = -[SUCorePolicyResume init](&v7, sel_init);
  v5 = v4;
  if (v4) {
    -[SUCorePolicyResume backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  }
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  baseResumeOptions = self->_baseResumeOptions;
  self->_specifiedFields = 0LL;
  self->_baseResumeOptions = 0LL;
  self->_skipPhase = a3;

  additionalOptions = self->_additionalOptions;
  self->_additionalOptions = 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyResume)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyResume;
  v5 = -[SUCorePolicyResume init](&v9, sel_init);
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_skipPhase = [v4 decodeBoolForKey:@"SkipPhase"];
    baseResumeOptions = v5->_baseResumeOptions;
    v5->_baseResumeOptions = 0LL;

    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUCorePolicyResume specifiedFields](self, "specifiedFields"),  @"SpecifiedFields");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyResume skipPhase](self, "skipPhase"), @"SkipPhase");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicyResume skipPhase](self, "skipPhase"));
  v6 = -[SUCorePolicyResume baseResumeOptions](self, "baseResumeOptions");
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBaseResumeOptions:v7];
  v8 = -[SUCorePolicyResume additionalOptions](self, "additionalOptions");
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAdditionalOptions:v9];

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyResume specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyResume *)a3;
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
      BOOL v6 = -[SUCorePolicyResume skipPhase](v5, "skipPhase");
      if (v6 == -[SUCorePolicyResume skipPhase](self, "skipPhase"))
      {
        uint64_t v8 = -[SUCorePolicyResume specifiedFields](v5, "specifiedFields");
        BOOL v7 = v8 == -[SUCorePolicyResume specifiedFields](self, "specifiedFields");
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
  int64_t v4 = -[SUCorePolicyResume specifiedFields](self, "specifiedFields");
  if (-[SUCorePolicyResume skipPhase](self, "skipPhase")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  uint64_t v6 = -[SUCorePolicyResume baseResumeOptions](self, "baseResumeOptions");
  BOOL v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (const __CFString *)v6;
  }
  else {
    uint64_t v8 = @"none";
  }
  uint64_t v9 = -[SUCorePolicyResume additionalOptions](self, "additionalOptions");
  v10 = (void *)v9;
  if (v9) {
    v11 = (const __CFString *)v9;
  }
  else {
    v11 = @"none";
  }
  [v3 stringWithFormat:@"SUCorePolicyResume(specifiedFields:0x%llX|skipPhase:%@|baseResumeOptions:%@|additionalOptions:%@)", v4, v5, v8, v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)summary
{
  if (-[SUCorePolicyResume specifiedFields](self, "specifiedFields"))
  {
    BOOL v3 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"|fields=%llX",  -[SUCorePolicyResume specifiedFields](self, "specifiedFields"));
    [&stru_18A0F22B0 stringByAppendingString:v3];
    int64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v4 = &stru_18A0F22B0;
  }

  if (-[SUCorePolicyResume skipPhase](self, "skipPhase"))
  {
    uint64_t v5 = -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"|skipPhase");

    int64_t v4 = (__CFString *)v5;
  }

  -[SUCorePolicyResume baseResumeOptions](self, "baseResumeOptions");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    BOOL v7 = @"|withBaseResumeOptions";
  }
  else {
    BOOL v7 = @"|noBaseResumeOptions";
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicyResume additionalOptions](self, "additionalOptions");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
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

- (NSDictionary)baseResumeOptions
{
  return self->_baseResumeOptions;
}

- (void)setBaseResumeOptions:(id)a3
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