@interface LACDTOMutableFeatureState
+ (id)nullInstance;
- (BOOL)isAvailable;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStrictModeEnabled;
- (BOOL)isSupported;
- (LACDTOFeatureRequirements)requirements;
- (NSString)description;
- (void)setIsAvailable:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsStrictModeEnabled:(BOOL)a3;
- (void)setIsSupported:(BOOL)a3;
- (void)setRequirements:(id)a3;
@end

@implementation LACDTOMutableFeatureState

+ (id)nullInstance
{
  v2 = objc_alloc_init(&OBJC_CLASS___LACDTOMutableFeatureState);
  -[LACDTOMutableFeatureState setIsSupported:](v2, "setIsSupported:", 0LL);
  -[LACDTOMutableFeatureState setIsAvailable:](v2, "setIsAvailable:", 0LL);
  -[LACDTOMutableFeatureState setIsEnabled:](v2, "setIsEnabled:", 0LL);
  -[LACDTOMutableFeatureState setIsStrictModeEnabled:](v2, "setIsStrictModeEnabled:", 0LL);
  v3 = +[LACDTOMutableFeatureRequirements nullInstance](&OBJC_CLASS___LACDTOMutableFeatureRequirements, "nullInstance");
  -[LACDTOMutableFeatureState setRequirements:](v2, "setRequirements:", v3);

  return v2;
}

- (NSString)description
{
  v24[5] = *MEMORY[0x1895F89C0];
  v23 = (void *)NSString;
  uint64_t v3 = objc_opt_class();
  v4 = (void *)NSString;
  if (-[LACDTOMutableFeatureState isSupported](self, "isSupported")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v4 stringWithFormat:@"isSupported: %@", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v7 = (void *)NSString;
  if (-[LACDTOMutableFeatureState isAvailable](self, "isAvailable")) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v7 stringWithFormat:@"isAvailable: %@", v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v10 = (void *)NSString;
  if (-[LACDTOMutableFeatureState isEnabled](self, "isEnabled")) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  [v10 stringWithFormat:@"isEnabled: %@", v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v12;
  v13 = (void *)NSString;
  if (-[LACDTOMutableFeatureState isStrictModeEnabled](self, "isStrictModeEnabled")) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  [v13 stringWithFormat:@"isStrictModeEnabled: %@", v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v15;
  v16 = (void *)NSString;
  v17 = -[LACDTOMutableFeatureState requirements](self, "requirements");
  [v16 stringWithFormat:@"requirements: %@", v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  [MEMORY[0x189603F18] arrayWithObjects:v24 count:5];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 componentsJoinedByString:@"; "];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 stringWithFormat:@"<%@ %p; %@>", v3, self, v20];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    int v6 = -[LACDTOMutableFeatureState isSupported](self, "isSupported");
    if (v6 == [v5 isSupported]
      && (int v7 = -[LACDTOMutableFeatureState isAvailable](self, "isAvailable"),
          v7 == [v5 isAvailable])
      && (int v8 = -[LACDTOMutableFeatureState isEnabled](self, "isEnabled"),
          v8 == [v5 isEnabled])
      && (int v9 = -[LACDTOMutableFeatureState isStrictModeEnabled](self, "isStrictModeEnabled"),
          v9 == [v5 isStrictModeEnabled]))
    {
      v12 = -[LACDTOMutableFeatureState requirements](self, "requirements");
      uint64_t v13 = [v5 requirements];
      if (v12 == (void *)v13)
      {
        char v10 = 1;
        v14 = v12;
      }

      else
      {
        v14 = (void *)v13;
        v15 = -[LACDTOMutableFeatureState requirements](self, "requirements");
        [v5 requirements];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        char v10 = [v15 isEqual:v16];
      }
    }

    else
    {
      char v10 = 0;
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isStrictModeEnabled
{
  return self->_isStrictModeEnabled;
}

- (void)setIsStrictModeEnabled:(BOOL)a3
{
  self->_isStrictModeEnabled = a3;
}

- (LACDTOFeatureRequirements)requirements
{
  return self->_requirements;
}

- (void)setRequirements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end