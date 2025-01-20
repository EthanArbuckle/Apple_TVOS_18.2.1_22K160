@interface SUCorePolicyDocumentationScan
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsCellular;
- (BOOL)disableUI;
- (BOOL)discretionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)liveServerCatalogOnly;
- (BOOL)requiresPowerPluggedIn;
- (NSDictionary)additionalOptions;
- (NSDictionary)additionalServerParams;
- (SUCorePolicyDocumentationScan)init;
- (SUCorePolicyDocumentationScan)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (int)downloadTimeoutSecs;
- (int64_t)specifiedFields;
- (void)backToDefaults;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setAdditionalServerParams:(id)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setDisableUI:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadTimeoutSecs:(int)a3;
- (void)setLiveServerCatalogOnly:(BOOL)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setSpecifiedFields:(int64_t)a3;
@end

@implementation SUCorePolicyDocumentationScan

- (SUCorePolicyDocumentationScan)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SUCorePolicyDocumentationScan;
  v2 = -[SUCorePolicyDocumentationScan init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    -[SUCorePolicyDocumentationScan backToDefaults](v2, "backToDefaults");
  }
  return v3;
}

- (void)backToDefaults
{
  additionalServerParams = self->_additionalServerParams;
  self->_specifiedFields = 0LL;
  self->_additionalServerParams = 0LL;
  *(_DWORD *)&self->_allowsCellular = 0;
  self->_downloadTimeoutSecs = 120;
  self->_liveServerCatalogOnly = 0;

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
  self->_specifiedFields |= 0x40uLL;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
  self->_specifiedFields |= 8uLL;
}

- (void)setDownloadTimeoutSecs:(int)a3
{
  self->_downloadTimeoutSecs = a3;
  self->_specifiedFields |= 0x10uLL;
}

- (void)setLiveServerCatalogOnly:(BOOL)a3
{
  self->_liveServerCatalogOnly = a3;
  self->_specifiedFields |= 0x20uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyDocumentationScan)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyDocumentationScan;
  objc_super v5 = -[SUCorePolicyDocumentationScan init](&v9, sel_init);
  if (v5)
  {
    v5->_specifiedFields = [v4 decodeInt64ForKey:@"SpecifiedFields"];
    v5->_allowsCellular = [v4 decodeBoolForKey:@"AllowsCellular"];
    v5->_discretionary = [v4 decodeBoolForKey:@"Discretionary"];
    v5->_disableUI = [v4 decodeBoolForKey:@"DisableUI"];
    v5->_requiresPowerPluggedIn = [v4 decodeBoolForKey:@"RequiresPowerPluggedIn"];
    v5->_downloadTimeoutSecs = [v4 decodeIntForKey:@"DownloadTimeoutSecs"];
    v5->_liveServerCatalogOnly = [v4 decodeBoolForKey:@"LiveServerCatalogOnly"];
    additionalServerParams = v5->_additionalServerParams;
    v5->_additionalServerParams = 0LL;

    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"),  @"SpecifiedFields");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular"),  @"AllowsCellular");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyDocumentationScan discretionary](self, "discretionary"),  @"Discretionary");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyDocumentationScan disableUI](self, "disableUI"),  @"DisableUI");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"),  @"RequiresPowerPluggedIn");
  objc_msgSend( v4,  "encodeInt:forKey:",  -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"),  @"DownloadTimeoutSecs");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly"),  @"LiveServerCatalogOnly");
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicyDocumentationScan discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicyDocumentationScan disableUI](self, "disableUI"));
  objc_msgSend( v5,  "setRequiresPowerPluggedIn:",  -[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend( v5,  "setDownloadTimeoutSecs:",  -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  objc_msgSend( v5,  "setLiveServerCatalogOnly:",  -[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly"));
  v6 = -[SUCorePolicyDocumentationScan additionalServerParams](self, "additionalServerParams");
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setAdditionalServerParams:v7];
  v8 = -[SUCorePolicyDocumentationScan additionalOptions](self, "additionalOptions");
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAdditionalOptions:v9];

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyDocumentationScan *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_super v5 = v4;
      BOOL v6 = -[SUCorePolicyDocumentationScan allowsCellular](v5, "allowsCellular");
      if (v6 == -[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular")
        && (BOOL v7 = -[SUCorePolicyDocumentationScan discretionary](v5, "discretionary"),
            v7 == -[SUCorePolicyDocumentationScan discretionary](self, "discretionary"))
        && (BOOL v8 = -[SUCorePolicyDocumentationScan disableUI](v5, "disableUI"),
            v8 == -[SUCorePolicyDocumentationScan disableUI](self, "disableUI"))
        && (BOOL v9 = -[SUCorePolicyDocumentationScan requiresPowerPluggedIn](v5, "requiresPowerPluggedIn"),
            v9 == -[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
        && (int v10 = -[SUCorePolicyDocumentationScan downloadTimeoutSecs](v5, "downloadTimeoutSecs"),
            v10 == -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"))
        && (BOOL v11 = -[SUCorePolicyDocumentationScan liveServerCatalogOnly](v5, "liveServerCatalogOnly"),
            v11 == -[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly")))
      {
        uint64_t v14 = -[SUCorePolicyDocumentationScan specifiedFields](v5, "specifiedFields");
        BOOL v12 = v14 == -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields");
      }

      else
      {
        BOOL v12 = 0;
      }
    }

    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  v17 = (void *)NSString;
  int64_t v16 = -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields");
  v3 = @"NO";
  if (-[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v15 = v4;
  if (-[SUCorePolicyDocumentationScan discretionary](self, "discretionary")) {
    objc_super v5 = @"YES";
  }
  else {
    objc_super v5 = @"NO";
  }
  if (-[SUCorePolicyDocumentationScan disableUI](self, "disableUI")) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  if (-[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn")) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  uint64_t v8 = -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs");
  if (-[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly")) {
    v3 = @"YES";
  }
  -[SUCorePolicyDocumentationScan additionalServerParams](self, "additionalServerParams");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = @"none";
  if (v9)
  {
    -[SUCorePolicyDocumentationScan additionalServerParams](self, "additionalServerParams");
    int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  -[SUCorePolicyDocumentationScan additionalOptions](self, "additionalOptions");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SUCorePolicyDocumentationScan additionalOptions](self, "additionalOptions");
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringWithFormat:@"SUCorePolicyDocumentationScan(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|liveServerCatalogOnly:%@|additionalServerParams:%@|additionalOptions:%@)", v16, v15, v5, v6, v7, v8, v3, v10, v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v17 stringWithFormat:@"SUCorePolicyDocumentationScan(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|liveServerCatalogOnly:%@|additionalServerParams:%@|additionalOptions:%@)", v16, v15, v5, v6, v7, v8, v3, v10, @"none"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v9) {
  return v13;
  }
}

- (id)summary
{
  if (-[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"))
  {
    v3 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"|fields=%llX",  -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"));
    [&stru_18A0F22B0 stringByAppendingString:v3];
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = &stru_18A0F22B0;
  }

  if (-[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular"))
  {
    uint64_t v5 = -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"|cellular");

    id v4 = (__CFString *)v5;
  }

  if (-[SUCorePolicyDocumentationScan discretionary](self, "discretionary")) {
    BOOL v6 = @"|discretionary";
  }
  else {
    BOOL v6 = @"|non-discretionary";
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyDocumentationScan disableUI](self, "disableUI")) {
    uint64_t v8 = @"|UIDisabled";
  }
  else {
    uint64_t v8 = @"|UIEnabled";
  }
  [v7 stringByAppendingString:v8];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
  {
    uint64_t v10 = [v9 stringByAppendingString:@"|power"];

    BOOL v9 = (void *)v10;
  }

  if (-[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs") != 120)
  {
    BOOL v11 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"|catalogTimeout=%d",  -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
    uint64_t v12 = [v9 stringByAppendingString:v11];

    BOOL v9 = (void *)v12;
  }

  if (-[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly"))
  {
    uint64_t v13 = [v9 stringByAppendingString:@"|liveServerCatalogOnly"];

    BOOL v9 = (void *)v13;
  }

  -[SUCorePolicyDocumentationScan additionalServerParams](self, "additionalServerParams");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14) {
    v15 = @"|withAdditionalServerParams";
  }
  else {
    v15 = @"|noAdditionalServerParams";
  }
  [v9 stringByAppendingString:v15];
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SUCorePolicyDocumentationScan additionalOptions](self, "additionalOptions");
  if (v17) {
    v18 = @"|withAdditionalOptions";
  }
  else {
    v18 = @"|noAdditionalOptions";
  }
  [v16 stringByAppendingString:v18];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v19 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v20 = [v19 stringByAppendingString:@"|"];

    v19 = (void *)v20;
  }

  return v19;
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

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (int)downloadTimeoutSecs
{
  return self->_downloadTimeoutSecs;
}

- (BOOL)liveServerCatalogOnly
{
  return self->_liveServerCatalogOnly;
}

- (NSDictionary)additionalServerParams
{
  return self->_additionalServerParams;
}

- (void)setAdditionalServerParams:(id)a3
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