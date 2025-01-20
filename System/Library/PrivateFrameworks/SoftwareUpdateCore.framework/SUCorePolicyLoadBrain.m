@interface SUCorePolicyLoadBrain
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsCellular;
- (BOOL)disableUI;
- (BOOL)discretionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)liveServerCatalogOnly;
- (BOOL)skipPhase;
- (NSDictionary)additionalOptions;
- (SUCorePolicyLoadBrain)initWithCoder:(id)a3;
- (SUCorePolicyLoadBrain)initWithSkipPhaseSet:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int64_t)specifiedFields;
- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setDisableUI:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setLiveServerCatalogOnly:(BOOL)a3;
- (void)setSkipPhase:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicyLoadBrain

- (SUCorePolicyLoadBrain)initWithSkipPhaseSet:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCorePolicyLoadBrain;
  v4 = -[SUCorePolicyLoadBrain init](&v7, sel_init);
  v5 = v4;
  if (v4) {
    -[SUCorePolicyLoadBrain backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  }
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  additionalOptions = self->_additionalOptions;
  self->_specifiedFields = 0LL;
  self->_additionalOptions = 0LL;
  *(_WORD *)&self->_allowsCellular = 0;
  self->_liveServerCatalogOnly = 0;
  self->_skipPhase = a3;
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

- (void)setLiveServerCatalogOnly:(BOOL)a3
{
  self->_liveServerCatalogOnly = a3;
  self->_specifiedFields |= 0x10uLL;
}

- (void)setDisableUI:(BOOL)a3
{
  self->_disableUI = a3;
  self->_specifiedFields |= 0x20uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyLoadBrain)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SUCorePolicyLoadBrain;
  v5 = -[SUCorePolicyLoadBrain init](&v8, sel_init);
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_allowsCellular = [v4 decodeBoolForKey:@"AllowsCellular"];
    v5->_discretionary = [v4 decodeBoolForKey:@"Discretionary"];
    v5->_disableUI = [v4 decodeBoolForKey:@"DisableUI"];
    v5->_liveServerCatalogOnly = [v4 decodeBoolForKey:@"LiveServerCatalogOnly"];
    v5->_skipPhase = [v4 decodeBoolForKey:@"SkipPhase"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields"),  @"SpecifiedFields");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyLoadBrain allowsCellular](self, "allowsCellular"),  @"AllowsCellular");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyLoadBrain discretionary](self, "discretionary"),  @"Discretionary");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyLoadBrain disableUI](self, "disableUI"), @"DisableUI");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyLoadBrain liveServerCatalogOnly](self, "liveServerCatalogOnly"),  @"LiveServerCatalogOnly");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyLoadBrain skipPhase](self, "skipPhase"), @"SkipPhase");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicyLoadBrain allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicyLoadBrain discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicyLoadBrain disableUI](self, "disableUI"));
  objc_msgSend( v5,  "setLiveServerCatalogOnly:",  -[SUCorePolicyLoadBrain liveServerCatalogOnly](self, "liveServerCatalogOnly"));
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicyLoadBrain skipPhase](self, "skipPhase"));
  v6 = -[SUCorePolicyLoadBrain additionalOptions](self, "additionalOptions");
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [v5 setAdditionalOptions:v7];

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyLoadBrain *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      BOOL v6 = -[SUCorePolicyLoadBrain allowsCellular](v5, "allowsCellular");
      if (v6 == -[SUCorePolicyLoadBrain allowsCellular](self, "allowsCellular")
        && (BOOL v7 = -[SUCorePolicyLoadBrain discretionary](v5, "discretionary"),
            v7 == -[SUCorePolicyLoadBrain discretionary](self, "discretionary"))
        && (BOOL v8 = -[SUCorePolicyLoadBrain disableUI](v5, "disableUI"),
            v8 == -[SUCorePolicyLoadBrain disableUI](self, "disableUI"))
        && (BOOL v9 = -[SUCorePolicyLoadBrain liveServerCatalogOnly](v5, "liveServerCatalogOnly"),
            v9 == -[SUCorePolicyLoadBrain liveServerCatalogOnly](self, "liveServerCatalogOnly"))
        && (BOOL v10 = -[SUCorePolicyLoadBrain skipPhase](v5, "skipPhase"),
            v10 == -[SUCorePolicyLoadBrain skipPhase](self, "skipPhase")))
      {
        uint64_t v13 = -[SUCorePolicyLoadBrain specifiedFields](v5, "specifiedFields");
        BOOL v11 = v13 == -[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields");
      }

      else
      {
        BOOL v11 = 0;
      }
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  BOOL v3 = (void *)NSString;
  int64_t v4 = -[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields");
  v5 = @"YES";
  if (-[SUCorePolicyLoadBrain allowsCellular](self, "allowsCellular")) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  if (-[SUCorePolicyLoadBrain discretionary](self, "discretionary")) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  if (-[SUCorePolicyLoadBrain disableUI](self, "disableUI")) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  if (-[SUCorePolicyLoadBrain liveServerCatalogOnly](self, "liveServerCatalogOnly")) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  if (!-[SUCorePolicyLoadBrain skipPhase](self, "skipPhase")) {
    v5 = @"NO";
  }
  -[SUCorePolicyLoadBrain additionalOptions](self, "additionalOptions");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SUCorePolicyLoadBrain additionalOptions](self, "additionalOptions");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stringWithFormat:@"SUCorePolicyLoadBrain(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|liveServerCatalogOnly:%@|skipPhase:%@|additionalOptions:%@)", v4, v6, v7, v8, v9, v5, v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v3 stringWithFormat:@"SUCorePolicyLoadBrain(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|liveServerCatalogOnly:%@|skipPhase:%@|additionalOptions:%@)", v4, v6, v7, v8, v9, v5, @"none"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)summary
{
  if (-[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields"))
  {
    BOOL v3 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"|fields=%llX",  -[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields"));
    [&stru_18A0F22B0 stringByAppendingString:v3];
    int64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v4 = &stru_18A0F22B0;
  }

  if (-[SUCorePolicyLoadBrain allowsCellular](self, "allowsCellular"))
  {
    uint64_t v5 = -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"|cellular");

    int64_t v4 = (__CFString *)v5;
  }

  if (-[SUCorePolicyLoadBrain discretionary](self, "discretionary")) {
    BOOL v6 = @"|discretionary";
  }
  else {
    BOOL v6 = @"|non-discretionary";
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyLoadBrain disableUI](self, "disableUI")) {
    BOOL v8 = @"UIDisabled";
  }
  else {
    BOOL v8 = @"UIEnabled";
  }
  [v7 stringByAppendingString:v8];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyLoadBrain liveServerCatalogOnly](self, "liveServerCatalogOnly"))
  {
    uint64_t v10 = [v9 stringByAppendingString:@"|liveServerCatalogOnly"];

    BOOL v9 = (void *)v10;
  }

  if (-[SUCorePolicyLoadBrain skipPhase](self, "skipPhase"))
  {
    uint64_t v11 = [v9 stringByAppendingString:@"|skipPhase"];

    BOOL v9 = (void *)v11;
  }
  v12 = -[SUCorePolicyLoadBrain additionalOptions](self, "additionalOptions");
  if (v12) {
    uint64_t v13 = @"|withAdditionalOptions";
  }
  else {
    uint64_t v13 = @"|noAdditionalOptions";
  }
  [v9 stringByAppendingString:v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v14 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v15 = [v14 stringByAppendingString:@"|"];

    v14 = (void *)v15;
  }

  return v14;
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

- (BOOL)liveServerCatalogOnly
{
  return self->_liveServerCatalogOnly;
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