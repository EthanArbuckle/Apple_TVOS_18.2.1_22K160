@interface LACDTOFeatureEnablementMode
+ (id)disabled;
+ (id)enabled;
+ (id)enabledWithGracePeriod;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGracePeriodEnabled;
- (LACDTOFeatureEnablementMode)initWithIsEnabled:(BOOL)a3 isGracePeriodEnabled:(BOOL)a4 rawValue:(int64_t)a5;
- (id)description;
- (int64_t)rawValue;
@end

@implementation LACDTOFeatureEnablementMode

- (LACDTOFeatureEnablementMode)initWithIsEnabled:(BOOL)a3 isGracePeriodEnabled:(BOOL)a4 rawValue:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACDTOFeatureEnablementMode;
  result = -[LACDTOFeatureEnablementMode init](&v9, sel_init);
  if (result)
  {
    result->_isEnabled = a3;
    result->_isGracePeriodEnabled = a4;
    result->_rawValue = a5;
  }

  return result;
}

+ (id)disabled
{
  return  -[LACDTOFeatureEnablementMode initWithIsEnabled:isGracePeriodEnabled:rawValue:]( objc_alloc(&OBJC_CLASS___LACDTOFeatureEnablementMode),  "initWithIsEnabled:isGracePeriodEnabled:rawValue:",  0LL,  0LL,  0LL);
}

+ (id)enabled
{
  return  -[LACDTOFeatureEnablementMode initWithIsEnabled:isGracePeriodEnabled:rawValue:]( objc_alloc(&OBJC_CLASS___LACDTOFeatureEnablementMode),  "initWithIsEnabled:isGracePeriodEnabled:rawValue:",  1LL,  0LL,  1LL);
}

+ (id)enabledWithGracePeriod
{
  return  -[LACDTOFeatureEnablementMode initWithIsEnabled:isGracePeriodEnabled:rawValue:]( objc_alloc(&OBJC_CLASS___LACDTOFeatureEnablementMode),  "initWithIsEnabled:isGracePeriodEnabled:rawValue:",  1LL,  1LL,  2LL);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    int v6 = -[LACDTOFeatureEnablementMode isEnabled](self, "isEnabled");
    if (v6 == [v5 isEnabled]
      && (int v7 = -[LACDTOFeatureEnablementMode isGracePeriodEnabled](self, "isGracePeriodEnabled"),
          v7 == [v5 isGracePeriodEnabled]))
    {
      int64_t v9 = -[LACDTOFeatureEnablementMode rawValue](self, "rawValue");
      BOOL v8 = v9 == [v5 rawValue];
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v18[3] = *MEMORY[0x1895F89C0];
  v17 = (void *)NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = (void *)NSString;
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[LACDTOFeatureEnablementMode isEnabled](self, "isEnabled"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"isEnabled: %@", v5];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  int v7 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACDTOFeatureEnablementMode isGracePeriodEnabled](self, "isGracePeriodEnabled"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"isGracePeriodEnabled: %@", v8];
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)NSString;
  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[LACDTOFeatureEnablementMode rawValue](self, "rawValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stringWithFormat:@"rawValue: %@", v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 componentsJoinedByString:@"; "];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isGracePeriodEnabled
{
  return self->_isGracePeriodEnabled;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

@end