@interface KTRebootTracker
- (id)getLastRebootTime;
@end

@implementation KTRebootTracker

- (id)getLastRebootTime
{
  v8[0] = 0LL;
  v8[1] = 0LL;
  *(void *)v9 = 0x1500000001LL;
  size_t v6 = 16LL;
  time_t v7 = 0LL;
  time(&v7);
  int v2 = sysctl(v9, 2u, v8, &v6, 0LL, 0LL);
  if (v8[0]) {
    BOOL v3 = v2 == -1;
  }
  else {
    BOOL v3 = 1;
  }
  double v4 = (double)v8[0];
  if (v3) {
    double v4 = 0.0;
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  v4,  v6));
}

@end