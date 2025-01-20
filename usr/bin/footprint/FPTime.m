@interface FPTime
- (FPTime)init;
@end

@implementation FPTime

- (FPTime)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___FPTime;
  v2 = -[FPTime init](&v7, "init");
  v3 = (double *)v2;
  if (v2 && !mach_get_times(&v2->_machAbsoluteTime, &v2->_machContinuousTime, v6))
  {
    v3[3] = (double)v6[0] - kCFAbsoluteTimeIntervalSince1970 + (double)v6[1] * 0.000000001;
    v4 = v3;
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

@end