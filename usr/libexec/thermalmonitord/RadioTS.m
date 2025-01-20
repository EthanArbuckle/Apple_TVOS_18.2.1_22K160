@interface RadioTS
+ (id)sharedInstance;
- (BOOL)hasBaseBandTempSensors;
- (RadioTS)init;
@end

@implementation RadioTS

+ (id)sharedInstance
{
  if (qword_10007C488 != -1) {
    dispatch_once(&qword_10007C488, &stru_100061758);
  }
  return (id)qword_10007C490;
}

- (RadioTS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RadioTS;
  return -[RadioTS init](&v3, "init");
}

- (BOOL)hasBaseBandTempSensors
{
  return self->_hasBaseBandTempSensors;
}

@end