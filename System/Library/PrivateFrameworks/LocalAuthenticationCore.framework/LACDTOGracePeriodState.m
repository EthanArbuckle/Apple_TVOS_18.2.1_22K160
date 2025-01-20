@interface LACDTOGracePeriodState
+ (BOOL)supportsSecureCoding;
+ (id)nullInstance;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (LACDTOGracePeriodState)initWithCoder:(id)a3;
- (LACDTOGracePeriodState)initWithTime:(double)a3 maxThreshold:(double)a4;
- (double)duration;
- (double)maxThreshold;
- (double)time;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACDTOGracePeriodState

- (LACDTOGracePeriodState)initWithTime:(double)a3 maxThreshold:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LACDTOGracePeriodState;
  result = -[LACDTOGracePeriodState init](&v7, sel_init);
  if (result)
  {
    result->_time = a3;
    result->_maxThreshold = a4;
  }

  return result;
}

- (BOOL)isActive
{
  if (v3 <= 0.0) {
    return 0;
  }
  -[LACDTOGracePeriodState time](self, "time");
  if (v4 <= 0.0) {
    return 0;
  }
  -[LACDTOGracePeriodState time](self, "time");
  double v6 = v5;
  -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold");
  return v6 <= v7;
}

- (double)duration
{
  BOOL v3 = -[LACDTOGracePeriodState isActive](self, "isActive");
  double result = 0.0;
  if (v3)
  {
    -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold", 0.0);
    double v6 = v5;
    -[LACDTOGracePeriodState time](self, "time");
    return fmax(v6 - v7, 0.0);
  }

  return result;
}

+ (id)nullInstance
{
  return  -[LACDTOGracePeriodState initWithTime:maxThreshold:]( objc_alloc(&OBJC_CLASS___LACDTOGracePeriodState),  "initWithTime:maxThreshold:",  0.0,  0.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[LACDTOGracePeriodState time](self, "time");
  double v6 = v5;
  NSStringFromSelector(sel_time);
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeDouble:v7 forKey:v6];

  -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold");
  double v9 = v8;
  NSStringFromSelector(sel_maxThreshold);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeDouble:v10 forKey:v9];
}

- (LACDTOGracePeriodState)initWithCoder:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_time);
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeDoubleForKey:v5];
  double v7 = v6;

  NSStringFromSelector(sel_maxThreshold);
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeDoubleForKey:v8];
  double v10 = v9;

  return -[LACDTOGracePeriodState initWithTime:maxThreshold:](self, "initWithTime:maxThreshold:", v7, v10);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    -[LACDTOGracePeriodState time](self, "time");
    double v7 = v6;
    [v5 time];
    if (v7 == v8)
    {
      -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold");
      double v11 = v10;
      [v5 maxThreshold];
      BOOL v9 = v11 == v12;
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v25[4] = *MEMORY[0x1895F89C0];
  v24 = (void *)NSString;
  uint64_t v23 = objc_opt_class();
  BOOL v3 = (void *)NSString;
  id v4 = (void *)MEMORY[0x189607968];
  -[LACDTOGracePeriodState time](self, "time");
  objc_msgSend(v4, "numberWithDouble:");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"time: %@", v5];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  double v7 = (void *)NSString;
  double v8 = (void *)MEMORY[0x189607968];
  -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold");
  objc_msgSend(v8, "numberWithDouble:");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"maxThreshold: %@", v9];
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  double v11 = (void *)NSString;
  BOOL v12 = -[LACDTOGracePeriodState isActive](self, "isActive");
  v13 = @"NO";
  if (v12) {
    v13 = @"YES";
  }
  [v11 stringWithFormat:@"isActive: %@", v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v14;
  v15 = (void *)NSString;
  v16 = (void *)MEMORY[0x189607968];
  -[LACDTOGracePeriodState duration](self, "duration");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 stringWithFormat:@"duration: %@", v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v18;
  [MEMORY[0x189603F18] arrayWithObjects:v25 count:4];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 componentsJoinedByString:@"; "];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 stringWithFormat:@"<%@ %p; %@>", v23, self, v20];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (double)time
{
  return self->_time;
}

- (double)maxThreshold
{
  return self->_maxThreshold;
}

@end