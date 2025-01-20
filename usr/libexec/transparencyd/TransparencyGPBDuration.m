@interface TransparencyGPBDuration
+ (id)descriptor;
- (TransparencyGPBDuration)initWithTimeInterval:(double)a3;
- (TransparencyGPBDuration)initWithTimeIntervalSince1970:(double)a3;
- (double)timeInterval;
- (double)timeIntervalSince1970;
- (void)setTimeInterval:(double)a3;
- (void)setTimeIntervalSince1970:(double)a3;
@end

@implementation TransparencyGPBDuration

+ (id)descriptor
{
  id result = (id)qword_1002EE6E8;
  if (!qword_1002EE6E8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBDuration,  @"Duration",  off_1002E3498,  &off_1002E3458,  2LL,  16LL,  v3);
    qword_1002EE6E8 = (uint64_t)result;
  }

  return result;
}

- (TransparencyGPBDuration)initWithTimeInterval:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TransparencyGPBDuration;
  v4 = -[TransparencyGPBMessage init](&v7, "init");
  if (v4)
  {
    double v8 = 0.0;
    uint64_t v5 = (int)(modf(a3, &v8) * 1000000000.0);
    -[TransparencyGPBDuration setSeconds:](v4, "setSeconds:", (uint64_t)v8);
    -[TransparencyGPBDuration setNanos:](v4, "setNanos:", v5);
  }

  return v4;
}

- (TransparencyGPBDuration)initWithTimeIntervalSince1970:(double)a3
{
  return -[TransparencyGPBDuration initWithTimeInterval:](self, "initWithTimeInterval:", a3);
}

- (double)timeInterval
{
  id v3 = -[TransparencyGPBDuration seconds](self, "seconds");
  return (double)(int)-[TransparencyGPBDuration nanos](self, "nanos") / 1000000000.0 + (double)(uint64_t)v3;
}

- (void)setTimeInterval:(double)a3
{
  double v5 = 0.0;
  uint64_t v4 = (int)(modf(a3, &v5) * 1000000000.0);
  -[TransparencyGPBDuration setSeconds:](self, "setSeconds:", (uint64_t)v5);
  -[TransparencyGPBDuration setNanos:](self, "setNanos:", v4);
}

- (double)timeIntervalSince1970
{
  return result;
}

- (void)setTimeIntervalSince1970:(double)a3
{
}

@end