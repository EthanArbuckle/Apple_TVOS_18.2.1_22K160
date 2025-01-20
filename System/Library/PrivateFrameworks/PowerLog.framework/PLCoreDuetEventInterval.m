@interface PLCoreDuetEventInterval
- (BOOL)intersects:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)description;
- (id)joinWithInterval:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PLCoreDuetEventInterval

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[PLCoreDuetEventInterval startDate](self, "startDate");
  [v4 timeIntervalSince1970];
  uint64_t v6 = v5;
  v7 = -[PLCoreDuetEventInterval endDate](self, "endDate");
  [v7 timeIntervalSince1970];
  objc_msgSend(v3, "stringWithFormat:", @"(%f, %f)", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)intersects:(id)a3
{
  id v4 = a3;
  -[PLCoreDuetEventInterval startDate](self, "startDate");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 endDate];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 timeIntervalSinceDate:v6];
  if (v7 >= 5.0)
  {
    BOOL v11 = 0;
  }

  else
  {
    [v4 startDate];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PLCoreDuetEventInterval endDate](self, "endDate");
    [v8 timeIntervalSinceDate:v9];
    BOOL v11 = v10 < 5.0;
  }

  return v11;
}

- (id)joinWithInterval:(id)a3
{
  id v4 = a3;
  if (-[PLCoreDuetEventInterval intersects:](self, "intersects:", v4))
  {
    uint64_t v5 = (void *)objc_opt_new();
    -[PLCoreDuetEventInterval startDate](self, "startDate");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 startDate];
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 earlierDate:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setStartDate:v8];
    v9 = -[PLCoreDuetEventInterval endDate](self, "endDate");
    [v4 endDate];
    double v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 laterDate:v10];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setEndDate:v11];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end