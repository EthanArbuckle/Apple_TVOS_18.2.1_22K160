@interface SUCorePolicyPreflightDownloadSU
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsCellular;
- (BOOL)disableUI;
- (BOOL)discretionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)skipPhase;
- (NSDictionary)additionalOptions;
- (NSDictionary)basePreflightOptions;
- (SUCorePolicyPreflightDownloadSU)initWithCoder:(id)a3;
- (SUCorePolicyPreflightDownloadSU)initWithSkipPhaseSet:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int64_t)specifiedFields;
- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setBasePreflightOptions:(id)a3;
- (void)setDisableUI:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setSkipPhase:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicyPreflightDownloadSU

- (SUCorePolicyPreflightDownloadSU)initWithSkipPhaseSet:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCorePolicyPreflightDownloadSU;
  v4 = -[SUCorePolicyPreflightDownloadSU init](&v7, sel_init);
  v5 = v4;
  if (v4) {
    -[SUCorePolicyPreflightDownloadSU backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  }
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  basePreflightOptions = self->_basePreflightOptions;
  self->_specifiedFields = 0LL;
  self->_basePreflightOptions = 0LL;
  *(_WORD *)&self->_allowsCellular = 0;
  self->_disableUI = 0;
  self->_skipPhase = a3;

  additionalOptions = self->_additionalOptions;
  self->_additionalOptions = 0LL;
}

- (void)setAllowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
  self->_specifiedFields |= 2uLL;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
  self->_specifiedFields |= 4uLL;
}

- (void)setDisableUI:(BOOL)a3
{
  self->_disableUI = a3;
  self->_specifiedFields |= 0x10uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyPreflightDownloadSU)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyPreflightDownloadSU;
  v5 = -[SUCorePolicyPreflightDownloadSU init](&v9, sel_init);
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_allowsCellular = [v4 decodeBoolForKey:@"AllowsCellular"];
    v5->_discretionary = [v4 decodeBoolForKey:@"Discretionary"];
    v5->_disableUI = [v4 decodeBoolForKey:@"DisableUI"];
    v5->_skipPhase = [v4 decodeBoolForKey:@"SkipPhase"];
    basePreflightOptions = v5->_basePreflightOptions;
    v5->_basePreflightOptions = 0LL;

    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields"),  @"SpecifiedFields");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyPreflightDownloadSU allowsCellular](self, "allowsCellular"),  @"AllowsCellular");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyPreflightDownloadSU discretionary](self, "discretionary"),  @"Discretionary");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyPreflightDownloadSU disableUI](self, "disableUI"),  @"DisableUI");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyPreflightDownloadSU skipPhase](self, "skipPhase"),  @"SkipPhase");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicyPreflightDownloadSU allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicyPreflightDownloadSU discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicyPreflightDownloadSU disableUI](self, "disableUI"));
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicyPreflightDownloadSU skipPhase](self, "skipPhase"));
  v6 = -[SUCorePolicyPreflightDownloadSU basePreflightOptions](self, "basePreflightOptions");
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBasePreflightOptions:v7];
  v8 = -[SUCorePolicyPreflightDownloadSU additionalOptions](self, "additionalOptions");
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAdditionalOptions:v9];

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyPreflightDownloadSU *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      BOOL v6 = -[SUCorePolicyPreflightDownloadSU allowsCellular](v5, "allowsCellular");
      if (v6 == -[SUCorePolicyPreflightDownloadSU allowsCellular](self, "allowsCellular")
        && (BOOL v7 = -[SUCorePolicyPreflightDownloadSU discretionary](v5, "discretionary"),
            v7 == -[SUCorePolicyPreflightDownloadSU discretionary](self, "discretionary"))
        && (BOOL v8 = -[SUCorePolicyPreflightDownloadSU disableUI](v5, "disableUI"),
            v8 == -[SUCorePolicyPreflightDownloadSU disableUI](self, "disableUI"))
        && (BOOL v9 = -[SUCorePolicyPreflightDownloadSU skipPhase](v5, "skipPhase"),
            v9 == -[SUCorePolicyPreflightDownloadSU skipPhase](self, "skipPhase")))
      {
        uint64_t v12 = -[SUCorePolicyPreflightDownloadSU specifiedFields](v5, "specifiedFields");
        BOOL v10 = v12 == -[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields");
      }

      else
      {
        BOOL v10 = 0;
      }
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  v14 = (void *)NSString;
  int64_t v3 = -[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields");
  if (-[SUCorePolicyPreflightDownloadSU allowsCellular](self, "allowsCellular")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if (-[SUCorePolicyPreflightDownloadSU discretionary](self, "discretionary")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (-[SUCorePolicyPreflightDownloadSU disableUI](self, "disableUI")) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  if (-[SUCorePolicyPreflightDownloadSU skipPhase](self, "skipPhase")) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  -[SUCorePolicyPreflightDownloadSU basePreflightOptions](self, "basePreflightOptions");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = @"none";
  if (v8)
  {
    -[SUCorePolicyPreflightDownloadSU basePreflightOptions](self, "basePreflightOptions");
    BOOL v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  -[SUCorePolicyPreflightDownloadSU additionalOptions](self, "additionalOptions");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[SUCorePolicyPreflightDownloadSU additionalOptions](self, "additionalOptions");
    [v14 stringWithFormat:@"SUCorePolicyPreflightDownloadSU(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|skipPhase:%@|basePreflightOptions:%@|additionalOptions:%@)", v3, v4, v5, v6, v7, v9, v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v14 stringWithFormat:@"SUCorePolicyPreflightDownloadSU(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|skipPhase:%@|basePreflightOptions:%@|additionalOptions:%@)", v3, v4, v5, v6, v7, v9, @"none"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v8) {
  return v12;
  }
}

- (id)summary
{
  if (-[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields"))
  {
    int64_t v3 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"|fields=%llX",  -[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields"));
    [&stru_18A0F22B0 stringByAppendingString:v3];
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = &stru_18A0F22B0;
  }

  if (-[SUCorePolicyPreflightDownloadSU allowsCellular](self, "allowsCellular"))
  {
    uint64_t v5 = -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"|cellular");

    id v4 = (__CFString *)v5;
  }

  if (-[SUCorePolicyPreflightDownloadSU discretionary](self, "discretionary")) {
    BOOL v6 = @"|discretionary";
  }
  else {
    BOOL v6 = @"|non-discretionary";
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyPreflightDownloadSU disableUI](self, "disableUI")) {
    BOOL v8 = @"|UIDisabled";
  }
  else {
    BOOL v8 = @"|UIEnabled";
  }
  [v7 stringByAppendingString:v8];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyPreflightDownloadSU skipPhase](self, "skipPhase"))
  {
    uint64_t v10 = [v9 stringByAppendingString:@"|skipPhase"];

    BOOL v9 = (void *)v10;
  }
  v11 = -[SUCorePolicyPreflightDownloadSU basePreflightOptions](self, "basePreflightOptions");
  if (v11) {
    uint64_t v12 = @"|withBasePreflightOptions";
  }
  else {
    uint64_t v12 = @"|noBasePreflightOptions";
  }
  [v9 stringByAppendingString:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SUCorePolicyPreflightDownloadSU additionalOptions](self, "additionalOptions");
  if (v14) {
    v15 = @"|withAdditionalOptions";
  }
  else {
    v15 = @"|noAdditionalOptions";
  }
  [v13 stringByAppendingString:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v16 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v17 = [v16 stringByAppendingString:@"|"];

    v16 = (void *)v17;
  }

  return v16;
}

- (int64_t)specifiedFields
{
  return self->_specifiedFields;
}

- (void)setSpecifiedFields:(int64_t)a3
{
  self->_specifiedFields = a3;
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (BOOL)disableUI
{
  return self->_disableUI;
}

- (BOOL)skipPhase
{
  return self->_skipPhase;
}

- (void)setSkipPhase:(BOOL)a3
{
  self->_skipPhase = a3;
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