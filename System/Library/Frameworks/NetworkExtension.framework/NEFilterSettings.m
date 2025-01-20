@interface NEFilterSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEFilterAction)defaultAction;
- (NEFilterSettings)initWithCoder:(id)a3;
- (NEFilterSettings)initWithRules:(NSArray *)rules defaultAction:(NEFilterAction)defaultAction;
- (NSArray)rules;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEFilterSettings

- (NEFilterSettings)initWithRules:(NSArray *)rules defaultAction:(NEFilterAction)defaultAction
{
  v6 = rules;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEFilterSettings;
  v7 = -[NEFilterSettings init](&v11, sel_init);
  if (v7)
  {
    uint64_t v8 = -[NSArray copy](v6, "copy");
    v9 = v7->_rules;
    v7->_rules = (NSArray *)v8;

    v7->_defaultAction = defaultAction;
  }

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  int64_t defaultAction = self->_defaultAction;
  if ((unint64_t)(defaultAction - 1) > 1)
  {
    int v7 = 1;
  }

  else
  {
    NSUInteger v6 = -[NSArray count](self->_rules, "count");
    int v7 = v6 != 0;
    if (!v6)
    {
      NEResourcesCopyLocalizedNSString(@"FILTER_SETTINGS_ERROR_INVALID", @"FILTER_SETTINGS_ERROR_INVALID");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 addObject:v8];
    }

    int64_t defaultAction = self->_defaultAction;
  }

  if (defaultAction == 3 || defaultAction == 0)
  {
    NEResourcesCopyLocalizedNSString( @"FILTER_SETTINGS_ERROR_INVALID_ACTION",  @"FILTER_SETTINGS_ERROR_INVALID_ACTION");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v10];

    int v7 = 0;
  }

  if (-[NSArray count](self->_rules, "count") >= 0x3E9)
  {
    id v11 = objc_alloc(NSString);
    NEResourcesCopyLocalizedNSString( @"FILTER_SETTINGS_ERROR_TOO_MANY_RULES",  @"FILTER_SETTINGS_ERROR_TOO_MANY_RULES");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", v12, 1000);
    [v4 addObject:v13];

    int v7 = 0;
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v14 = self->_rules;
  uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        v7 &= [*(id *)(*((void *)&v20 + 1) + 8 * i) checkValidityAndCollectErrors:v4];
      }

      uint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    }

    while (v16);
  }

  return v7;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  -[NEFilterSettings rules](self, "rules");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"rules" andIndent:v5 options:a4];
  v9 = +[NEFilterProvider descriptionForAction:]((uint64_t)&OBJC_CLASS___NEFilterProvider, self->_defaultAction);
  [v7 appendPrettyObject:v9 withName:@"defaultAction" andIndent:v5 options:a4];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  rules = self->_rules;
  id v5 = a3;
  [v5 encodeObject:rules forKey:@"rules"];
  [v5 encodeInteger:self->_defaultAction forKey:@"defaultAction"];
}

- (NEFilterSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEFilterSettings;
  id v5 = -[NEFilterSettings init](&v12, sel_init);
  if (v5)
  {
    NSUInteger v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"rules"];
    rules = v5->_rules;
    v5->_rules = (NSArray *)v9;

    v5->_int64_t defaultAction = [v4 decodeIntegerForKey:@"defaultAction"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NEFilterSettings initWithRules:defaultAction:]( +[NEFilterSettings allocWithZone:](&OBJC_CLASS___NEFilterSettings, "allocWithZone:", a3),  "initWithRules:defaultAction:",  self->_rules,  self->_defaultAction);
}

- (NSArray)rules
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (NEFilterAction)defaultAction
{
  return self->_defaultAction;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end