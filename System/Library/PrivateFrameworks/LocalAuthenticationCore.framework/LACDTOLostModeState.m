@interface LACDTOLostModeState
+ (id)nullInstance;
- (BOOL)confirmed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInLostMode;
- (BOOL)isValid:(id)a3;
- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3;
- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3 confirmed:(BOOL)a4;
- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3 confirmed:(BOOL)a4 createdAt:(id)a5;
- (NSDate)createdAt;
- (id)description;
@end

@implementation LACDTOLostModeState

- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x189603F50] now];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LACDTOLostModeState initWithIsInLostMode:confirmed:createdAt:]( self,  "initWithIsInLostMode:confirmed:createdAt:",  v3,  0LL,  v5);

  return v6;
}

- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3 confirmed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [MEMORY[0x189603F50] now];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LACDTOLostModeState initWithIsInLostMode:confirmed:createdAt:]( self,  "initWithIsInLostMode:confirmed:createdAt:",  v5,  v4,  v7);

  return v8;
}

- (LACDTOLostModeState)initWithIsInLostMode:(BOOL)a3 confirmed:(BOOL)a4 createdAt:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___LACDTOLostModeState;
  v10 = -[LACDTOLostModeState init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_isInLostMode = a3;
    objc_storeStrong((id *)&v10->_createdAt, a5);
    v11->_confirmed = a4;
  }

  return v11;
}

+ (id)nullInstance
{
  return  -[LACDTOLostModeState initWithIsInLostMode:]( objc_alloc(&OBJC_CLASS___LACDTOLostModeState),  "initWithIsInLostMode:",  1LL);
}

- (BOOL)isValid:(id)a3
{
  id v4 = a3;
  if (self->_confirmed && -[NSDate compare:](self->_createdAt, "compare:", v4) != NSOrderedDescending)
  {
    uint64_t v6 = [v4 timeIntervalSinceDate:self->_createdAt];
    BOOL v5 = v7 <= LACDTOLostModeStateMaxAgeSeconds(v6);
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    int v6 = [v5 isInLostMode];
    if (v6 == -[LACDTOLostModeState isInLostMode](self, "isInLostMode")
      && (int v7 = [v5 confirmed], v7 == -[LACDTOLostModeState confirmed](self, "confirmed")))
    {
      [v5 createdAt];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[LACDTOLostModeState createdAt](self, "createdAt");
      BOOL v8 = v9 == v10;
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
  v29[6] = *MEMORY[0x1895F89C0];
  int v3 = os_variant_allows_internal_security_policies();
  id v4 = (void *)NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (v3)
  {
    int v7 = (void *)NSString;
    if (-[LACDTOLostModeState isInLostMode](self, "isInLostMode")) {
      BOOL v8 = @"YES";
    }
    else {
      BOOL v8 = @"NO";
    }
    [v7 stringWithFormat:@"isInLostMode: %@", v8];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v28;
    id v9 = (void *)NSString;
    if (-[LACDTOLostModeState confirmed](self, "confirmed")) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    [v9 stringWithFormat:@"confirmed: %@", v10];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v27;
    v11 = (void *)NSString;
    v26 = -[LACDTOLostModeState createdAt](self, "createdAt");
    [v11 stringWithFormat:@"createdAt: %@", v26];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v25;
    v12 = (void *)NSString;
    -[LACDTOLostModeState createdAt](self, "createdAt");
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 timeIntervalSince1970];
    [v12 stringWithFormat:@"createdAtTimestamp: %.2f", v14];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v15;
    v16 = (void *)NSString;
    [MEMORY[0x189603F50] now];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[LACDTOLostModeState isValid:](self, "isValid:", v17)) {
      v18 = @"YES";
    }
    else {
      v18 = @"NO";
    }
    [v16 stringWithFormat:@"isValid: %@", v18];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v19;
    [NSString stringWithFormat:@"maxAge: %.2f", LACDTOLostModeStateMaxAgeSeconds((uint64_t)v19)];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[5] = v20;
    [MEMORY[0x189603F18] arrayWithObjects:v29 count:6];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 componentsJoinedByString:@"; "];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"<%@ %p; %@>", v6, self, v22];
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    return v23;
  }

  else
  {
    [v4 stringWithFormat:@"<%@ %p>", v5, self];
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (BOOL)isInLostMode
{
  return self->_isInLostMode;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (void).cxx_destruct
{
}

@end