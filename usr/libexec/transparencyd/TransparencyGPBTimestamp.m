@interface TransparencyGPBTimestamp
+ (id)descriptor;
- (NSDate)date;
- (TransparencyGPBTimestamp)initWithDate:(id)a3;
- (TransparencyGPBTimestamp)initWithTimeIntervalSince1970:(double)a3;
- (double)timeIntervalSince1970;
- (void)setDate:(id)a3;
- (void)setTimeIntervalSince1970:(double)a3;
@end

@implementation TransparencyGPBTimestamp

+ (id)descriptor
{
  id result = (id)qword_1002EE750;
  if (!qword_1002EE750)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBTimestamp,  @"Timestamp",  off_1002E3758,  &off_1002E3718,  2LL,  16LL,  v3);
    qword_1002EE750 = (uint64_t)result;
  }

  return result;
}

- (TransparencyGPBTimestamp)initWithDate:(id)a3
{
  return -[TransparencyGPBTimestamp initWithTimeIntervalSince1970:](self, "initWithTimeIntervalSince1970:");
}

- (TransparencyGPBTimestamp)initWithTimeIntervalSince1970:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TransparencyGPBTimestamp;
  v4 = -[TransparencyGPBMessage init](&v9, "init");
  if (v4)
  {
    double v10 = 0.0;
    double v5 = modf(a3, &v10);
    double v6 = v10;
    if (v5 < 0.0)
    {
      double v6 = v10 + -1.0;
      double v5 = v5 + 1.0;
    }

    uint64_t v7 = (int)(v5 * 1000000000.0);
    -[TransparencyGPBTimestamp setSeconds:](v4, "setSeconds:", (uint64_t)v6);
    -[TransparencyGPBTimestamp setNanos:](v4, "setNanos:", v7);
  }

  return v4;
}

- (NSDate)date
{
  return +[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:");
}

- (void)setDate:(id)a3
{
}

- (double)timeIntervalSince1970
{
  id v3 = -[TransparencyGPBTimestamp seconds](self, "seconds");
  return (double)(int)-[TransparencyGPBTimestamp nanos](self, "nanos") / 1000000000.0 + (double)(uint64_t)v3;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  double v7 = 0.0;
  double v4 = modf(a3, &v7);
  double v5 = v7;
  if (v4 < 0.0)
  {
    double v5 = v7 + -1.0;
    double v4 = v4 + 1.0;
  }

  uint64_t v6 = (int)(v4 * 1000000000.0);
  -[TransparencyGPBTimestamp setSeconds:](self, "setSeconds:", (uint64_t)v5);
  -[TransparencyGPBTimestamp setNanos:](self, "setNanos:", v6);
}

@end