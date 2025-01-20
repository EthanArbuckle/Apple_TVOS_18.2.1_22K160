@interface LACDTOLocationState
+ (id)nullInstance;
+ (id)strictLocationState;
- (BOOL)confirmed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInFamiliarLocation;
- (BOOL)isValid:(id)a3;
- (LACDTOLocationState)initWithRawValue:(int64_t)a3 confirmed:(BOOL)a4;
- (LACDTOLocationState)initWithRawValue:(int64_t)a3 confirmed:(BOOL)a4 createdAt:(id)a5;
- (NSDate)createdAt;
- (id)description;
- (int64_t)rawValue;
@end

@implementation LACDTOLocationState

- (LACDTOLocationState)initWithRawValue:(int64_t)a3 confirmed:(BOOL)a4
{
  BOOL v4 = a4;
  [MEMORY[0x189603F50] now];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LACDTOLocationState initWithRawValue:confirmed:createdAt:]( self,  "initWithRawValue:confirmed:createdAt:",  a3,  v4,  v7);

  return v8;
}

- (LACDTOLocationState)initWithRawValue:(int64_t)a3 confirmed:(BOOL)a4 createdAt:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___LACDTOLocationState;
  v10 = -[LACDTOLocationState init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_rawValue = a3;
    v10->_confirmed = a4;
    objc_storeStrong((id *)&v10->_createdAt, a5);
  }

  return v11;
}

+ (id)nullInstance
{
  return (id)[objc_alloc((Class)a1) initWithRawValue:0 confirmed:0];
}

+ (id)strictLocationState
{
  return (id)[objc_alloc((Class)a1) initWithRawValue:0 confirmed:0];
}

- (BOOL)isValid:(id)a3
{
  id v4 = a3;
  if (-[NSDate compare:](self->_createdAt, "compare:", v4) == NSOrderedDescending)
  {
    BOOL v5 = 0;
  }

  else
  {
    [v4 timeIntervalSinceDate:self->_createdAt];
    BOOL v5 = v6 <= 5.0;
  }

  return v5;
}

- (BOOL)isInFamiliarLocation
{
  return self->_rawValue == 1;
}

- (id)description
{
  v35[6] = *MEMORY[0x1895F89C0];
  int v3 = os_variant_allows_internal_security_policies();
  v32 = (void *)NSString;
  uint64_t v31 = objc_opt_class();
  id v4 = (void *)NSString;
  if (v3)
  {
    BOOL v5 = -[LACDTOLocationState isInFamiliarLocation](self, "isInFamiliarLocation");
    double v6 = @"OFF";
    if (v5) {
      double v6 = @"ON";
    }
  }

  else
  {
    double v6 = @"<private>";
  }

  [v4 stringWithFormat:@"DSLMode: %@", v6];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v33;
  v7 = (void *)NSString;
  int v34 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[LACDTOLocationState rawValue](self, "rawValue"));
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v8 = @"<private>";
  }

  v29 = (__CFString *)v8;
  [v7 stringWithFormat:@"rawValue: %@", v8];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v30;
  id v9 = (void *)NSString;
  BOOL v10 = -[LACDTOLocationState confirmed](self, "confirmed");
  v11 = @"NO";
  if (v10) {
    v11 = @"YES";
  }
  [v9 stringWithFormat:@"confirmed: %@", v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v12;
  objc_super v13 = (void *)NSString;
  v14 = -[LACDTOLocationState createdAt](self, "createdAt");
  [v13 stringWithFormat:@"createdAt: %@", v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v15;
  v16 = (void *)NSString;
  v17 = -[LACDTOLocationState createdAt](self, "createdAt");
  [v17 timeIntervalSince1970];
  [v16 stringWithFormat:@"createdAtTimestamp: %.2f", v18];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v19;
  v20 = (void *)NSString;
  [MEMORY[0x189603F50] now];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v22 = -[LACDTOLocationState isValid:](self, "isValid:", v21);
  v23 = @"NO";
  if (v22) {
    v23 = @"YES";
  }
  [v20 stringWithFormat:@"isValid: %@", v23];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v24;
  [MEMORY[0x189603F18] arrayWithObjects:v35 count:6];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 componentsJoinedByString:@"; "];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 stringWithFormat:@"<%@ %p; %@>", v31, self, v26];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34) {
  return v27;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    int v6 = -[LACDTOLocationState isInFamiliarLocation](self, "isInFamiliarLocation");
    if (v6 == [v5 isInFamiliarLocation])
    {
      v8 = -[LACDTOLocationState createdAt](self, "createdAt");
      [v5 createdAt];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v7 = v8 == v9;
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

  return v7;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (void).cxx_destruct
{
}

@end