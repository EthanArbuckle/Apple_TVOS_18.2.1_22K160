@interface BKAccelerometerClientUIApp
- (BKAccelerometerClientUIApp)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_queue_invalidate;
- (void)handleOrientationEvent:(int64_t)a3 orientationLocked:(BOOL)a4;
- (void)setWantsAccelerometerEvents:(BOOL)a3;
@end

@implementation BKAccelerometerClientUIApp

- (BKAccelerometerClientUIApp)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BKAccelerometerClientUIApp;
  v5 = -[BKHIDEventClient initWithPid:sendRight:queue:](&v8, "initWithPid:sendRight:queue:", *(void *)&a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[BKAccelerometerClient setPassiveOrientationEvents:](v5, "setPassiveOrientationEvents:", 0LL);
    *(double *)((char *)&v6->super._lastAccelerometerEventTimestamp + 6) = 0.0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BKAccelerometerClientUIApp;
  id v4 = -[BKAccelerometerClient descriptionBuilderWithMultilinePrefix:]( &v8,  "descriptionBuilderWithMultilinePrefix:",  a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 =  [v5 appendInt:*(unsigned int *)((char *)&self->super._lastAccelerometerEventTimestamp + 6) withName:@"lastOrientation"];
  return v5;
}

- (void)setWantsAccelerometerEvents:(BOOL)a3
{
  if (a3)
  {
    id v3 = sub_10003F450();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "BKAccelerometerClientUIApp doesn't support accelerometer events",  v5,  2u);
    }
  }

- (void)_queue_invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___BKAccelerometerClientUIApp;
  -[BKAccelerometerClient _queue_invalidate](&v2, "_queue_invalidate");
}

- (void)handleOrientationEvent:(int64_t)a3 orientationLocked:(BOOL)a4
{
  if (-[BKAccelerometerClient wantsOrientationEvents](self, "wantsOrientationEvents") && !a4)
  {
    else {
      uint64_t v7 = (a3 + 100);
    }
    uint64_t v8 = mach_absolute_time();
    DeviceOrientationEventWithUsage = (const void *)IOHIDEventCreateDeviceOrientationEventWithUsage(0LL, v8, v7, 0LL);
    uint64_t v10 = BKLogOrientationDevice(DeviceOrientationEventWithUsage);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = BSDeviceOrientationDescription(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      __int16 v18 = 2114;
      v19 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Sending orientation: %{public}@ event to %{public}@",  buf,  0x16u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100053638;
    v15[3] = &unk_1000B7630;
    v15[4] = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeferringResolution build:]( &OBJC_CLASS___BKSHIDEventDeferringResolution,  "build:",  v15));
    BKSendHIDEventToClientWithDestination(DeviceOrientationEventWithUsage, v14);
    CFRelease(DeviceOrientationEventWithUsage);
    *(void *)((char *)&self->super._lastAccelerometerEventTimestamp + 6) = a3;
  }

@end