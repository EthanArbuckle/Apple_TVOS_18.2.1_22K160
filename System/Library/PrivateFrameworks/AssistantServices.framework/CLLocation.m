@interface CLLocation
- (BOOL)_af_isOlderThanAge:(id)a3;
- (BOOL)_af_isWithinAccuracy:(double)a3;
- (BOOL)ad_isNewerThan:(id)a3;
- (id)_af_age;
@end

@implementation CLLocation

- (BOOL)_af_isWithinAccuracy:(double)a3
{
  if (a3 <= 0.0) {
    return 0;
  }
  -[CLLocation horizontalAccuracy](self, "horizontalAccuracy");
  return v4 - a3 <= 2.22044605e-16;
}

- (id)_af_age
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CLLocation timestamp](self, "timestamp"));
  v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (int)-v4));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)_af_isOlderThanAge:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLLocation timestamp](self, "timestamp"));
  v6 = v5;
  BOOL v7 = 0;
  if (v4 && v5)
  {
    [v5 timeIntervalSinceNow];
    BOOL v7 = v8 < (double)-(int)[v4 intValue];
  }

  return v7;
}

- (BOOL)ad_isNewerThan:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLLocation timestamp](self, "timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 timestamp]);

  id v7 = [v5 compare:v6];
  return v7 == (id)1;
}

@end