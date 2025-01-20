@interface BKAccelerometerClientBKSAccelerometer
- (BOOL)_deathByPid;
- (BOOL)_deathBySendRight;
- (void)_queue_invalidate;
- (void)handleAccelerometerEventWithTimestamp:(double)a3 x:(float)a4 y:(float)a5 z:(float)a6 samplingInterval:(double)a7;
@end

@implementation BKAccelerometerClientBKSAccelerometer

- (BOOL)_deathByPid
{
  return 0;
}

- (BOOL)_deathBySendRight
{
  return 1;
}

- (void)_queue_invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___BKAccelerometerClientBKSAccelerometer;
  -[BKAccelerometerClient _queue_invalidate](&v2, "_queue_invalidate");
}

- (void)handleAccelerometerEventWithTimestamp:(double)a3 x:(float)a4 y:(float)a5 z:(float)a6 samplingInterval:(double)a7
{
  if (-[BKAccelerometerClient wantsAccelerometerEvents](self, "wantsAccelerometerEvents"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDEventClient sendRight](self, "sendRight"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10002DB38;
    v14[3] = &unk_1000B6518;
    v14[4] = self;
    float v15 = a4;
    float v16 = a5;
    float v17 = a6;
    *(double *)&v14[5] = a3;
    *(double *)&v14[6] = a7;
    [v13 accessPort:v14];
  }

@end