@interface LACDTOBiometryWatchdog
+ (BOOL)supportsSecureCoding;
+ (id)nullInstance;
- (BOOL)isBarking;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRunning;
- (LACDTOBiometryWatchdog)initWithCoder:(id)a3;
- (LACDTOBiometryWatchdog)initWithIsRunning:(BOOL)a3 time:(double)a4 minThreshold:(double)a5 maxThreshold:(double)a6;
- (double)maxThreshold;
- (double)minThreshold;
- (double)time;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACDTOBiometryWatchdog

- (LACDTOBiometryWatchdog)initWithIsRunning:(BOOL)a3 time:(double)a4 minThreshold:(double)a5 maxThreshold:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LACDTOBiometryWatchdog;
  result = -[LACDTOBiometryWatchdog init](&v11, sel_init);
  if (result)
  {
    result->_isRunning = a3;
    result->_time = a4;
    result->_minThreshold = a5;
    result->_maxThreshold = a6;
  }

  return result;
}

+ (id)nullInstance
{
  return  -[LACDTOBiometryWatchdog initWithIsRunning:time:minThreshold:maxThreshold:]( objc_alloc(&OBJC_CLASS___LACDTOBiometryWatchdog),  "initWithIsRunning:time:minThreshold:maxThreshold:",  0LL,  0.0,  0.0,  0.0);
}

- (BOOL)isBarking
{
  BOOL v3 = -[LACDTOBiometryWatchdog isRunning](self, "isRunning");
  if (v3)
  {
    -[LACDTOBiometryWatchdog time](self, "time");
    double v5 = v4;
    -[LACDTOBiometryWatchdog minThreshold](self, "minThreshold");
    if (v5 >= v6)
    {
      -[LACDTOBiometryWatchdog time](self, "time");
      double v8 = v7;
      -[LACDTOBiometryWatchdog maxThreshold](self, "maxThreshold");
      LOBYTE(v3) = v8 <= v9;
    }

    else
    {
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[LACDTOBiometryWatchdog isRunning](self, "isRunning");
  NSStringFromSelector(sel_isRunning);
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v5 forKey:v6];

  -[LACDTOBiometryWatchdog time](self, "time");
  double v8 = v7;
  NSStringFromSelector(sel_time);
  double v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeDouble:v9 forKey:v8];

  -[LACDTOBiometryWatchdog minThreshold](self, "minThreshold");
  double v11 = v10;
  NSStringFromSelector(sel_minThreshold);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeDouble:v12 forKey:v11];

  -[LACDTOBiometryWatchdog maxThreshold](self, "maxThreshold");
  double v14 = v13;
  NSStringFromSelector(sel_maxThreshold);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeDouble:v15 forKey:v14];
}

- (LACDTOBiometryWatchdog)initWithCoder:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_isRunning);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 decodeBoolForKey:v5];

  NSStringFromSelector(sel_time);
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeDoubleForKey:v7];
  double v9 = v8;

  NSStringFromSelector(sel_minThreshold);
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeDoubleForKey:v10];
  double v12 = v11;

  NSStringFromSelector(sel_maxThreshold);
  double v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeDoubleForKey:v13];
  double v15 = v14;

  return -[LACDTOBiometryWatchdog initWithIsRunning:time:minThreshold:maxThreshold:]( self,  "initWithIsRunning:time:minThreshold:maxThreshold:",  v6,  v9,  v12,  v15);
}

- (id)description
{
  v22[4] = *MEMORY[0x1895F89C0];
  BOOL v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = (void *)NSString;
  BOOL v6 = -[LACDTOBiometryWatchdog isRunning](self, "isRunning");
  double v7 = @"NO";
  if (v6) {
    double v7 = @"YES";
  }
  [v5 stringWithFormat:@"isRunning: %@", v7];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  double v9 = (void *)NSString;
  -[LACDTOBiometryWatchdog time](self, "time");
  [v9 stringWithFormat:@"time: %.2f", v10];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  double v12 = (void *)NSString;
  -[LACDTOBiometryWatchdog minThreshold](self, "minThreshold");
  [v12 stringWithFormat:@"minThreshold: %.2f", v13];
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  double v15 = (void *)NSString;
  -[LACDTOBiometryWatchdog maxThreshold](self, "maxThreshold");
  [v15 stringWithFormat:@"maxThreshold: %.2f", v16];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  [MEMORY[0x189603F18] arrayWithObjects:v22 count:4];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 componentsJoinedByString:@"; "];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v19];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    int v6 = -[LACDTOBiometryWatchdog isRunning](self, "isRunning");
    if (v6 == [v5 isRunning]
      && (-[LACDTOBiometryWatchdog time](self, "time"), double v8 = v7, [v5 time], v8 == v9)
      && (-[LACDTOBiometryWatchdog minThreshold](self, "minThreshold"),
          double v11 = v10,
          [v5 minThreshold],
          v11 == v12))
    {
      -[LACDTOBiometryWatchdog maxThreshold](self, "maxThreshold");
      double v16 = v15;
      [v5 maxThreshold];
      BOOL v13 = v16 == v17;
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (double)time
{
  return self->_time;
}

- (double)minThreshold
{
  return self->_minThreshold;
}

- (double)maxThreshold
{
  return self->_maxThreshold;
}

@end