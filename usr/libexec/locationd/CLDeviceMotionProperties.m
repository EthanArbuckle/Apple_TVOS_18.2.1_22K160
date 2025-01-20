@interface CLDeviceMotionProperties
- (CLDeviceMotionProperties)initWithMode:(int)a3;
- (id)description;
- (int)mode;
- (void)setMode:(int)a3;
@end

@implementation CLDeviceMotionProperties

- (CLDeviceMotionProperties)initWithMode:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLDeviceMotionProperties;
  result = -[CLDeviceMotionProperties init](&v5, "init");
  if (result) {
    result->_mode = a3;
  }
  return result;
}

- (id)description
{
  v2 = 0LL;
  int mode = self->_mode;
  if (mode > 14)
  {
    v4 = @"3AxisDynamicGyro";
    objc_super v5 = @"6AxisThrottledGyro";
    if (mode != 67) {
      objc_super v5 = 0LL;
    }
    if (mode != 34) {
      v4 = v5;
    }
    if (mode == 19) {
      v2 = @"BuildGYTT";
    }
    if (mode == 15) {
      v2 = @"9AxisWithNorthReference";
    }
    if (mode > 33) {
      v2 = v4;
    }
  }

  else
  {
    switch(mode)
    {
      case 0:
        v2 = @"Unknown";
        break;
      case 2:
        v2 = @"GyroOnly";
        break;
      case 3:
        v2 = @"6Axis";
        break;
      case 7:
        v2 = @"9Axis";
        break;
      default:
        return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CLDeviceMotionProperties<DeviceMotion=%@>",  v2);
    }
  }

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CLDeviceMotionProperties<DeviceMotion=%@>",  v2);
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_int mode = a3;
}

@end