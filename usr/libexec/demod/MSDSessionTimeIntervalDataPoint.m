@interface MSDSessionTimeIntervalDataPoint
- (MSDSessionTimeIntervalDataPoint)initWithStartTime:(id)a3 endTime:(id)a4;
- (double)getTimeIntervalWithStart:(id)a3 end:(id)a4;
- (double)interval;
- (id)print;
- (void)setInterval:(double)a3;
@end

@implementation MSDSessionTimeIntervalDataPoint

- (MSDSessionTimeIntervalDataPoint)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MSDSessionTimeIntervalDataPoint;
  v8 = -[MSDSessionTimeIntervalDataPoint init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDSessionTimeIntervalDataPoint getTimeIntervalWithStart:end:](v8, "getTimeIntervalWithStart:end:", v6, v7);
    -[MSDSessionTimeIntervalDataPoint setInterval:](v9, "setInterval:");
  }

  return v9;
}

- (double)getTimeIntervalWithStart:(id)a3 end:(id)a4
{
  if (!a3 || !a4) {
    return -1.0;
  }
  objc_msgSend(a4, "timeIntervalSinceDate:");
  return result;
}

- (id)print
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lf", v2);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

@end