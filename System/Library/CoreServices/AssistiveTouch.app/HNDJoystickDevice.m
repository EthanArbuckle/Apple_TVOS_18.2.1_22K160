@interface HNDJoystickDevice
- (void)dealloc;
- (void)handleReportCallback:(int)a3 report:(char *)a4 reportLength:(int64_t)a5;
@end

@implementation HNDJoystickDevice

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HNDJoystickDevice;
  -[HNDDevice dealloc](&v3, "dealloc");
}

- (void)handleReportCallback:(int)a3 report:(char *)a4 reportLength:(int64_t)a5
{
  if (!self->_repeatTimer)
  {
    v11 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    repeatTimer = self->_repeatTimer;
    self->_repeatTimer = v11;
  }

  LOBYTE(v5) = *a4;
  LOBYTE(v6) = a4[1];
  double v13 = (self->super._maxX - self->super._minX) * 0.5;
  double v14 = ((double)v5 - v13) / v13;
  double v15 = (self->super._maxY - self->super._minY) * 0.5;
  double v16 = ((double)v6 - v15) / v15;
  id v17 = [objc_allocWithZone((Class)HNDEvent) init];
  [v17 setType:3];
  [v17 setDeltaX:v14 * 15.0];
  [v17 setDeltaY:v16 * 15.0];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDevice delegate](self, "delegate"));
  [v18 device:self didPostEvent:v17];

  -[AXDispatchTimer cancel](self->_repeatTimer, "cancel");
  if (fabs(v14) > 0.1 || fabs(v16) > 0.1)
  {
    v23[0] = 0LL;
    v23[1] = v23;
    v23[2] = 0x2020000000LL;
    v24 = malloc(a5);
    memcpy(v24, a4, a5);
    v19 = self->_repeatTimer;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000432E0;
    v21[3] = &unk_100123438;
    int v22 = a3;
    v21[4] = self;
    v21[5] = v23;
    v21[6] = a5;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100043330;
    v20[3] = &unk_100123460;
    v20[4] = v23;
    -[AXDispatchTimer afterDelay:processBlock:cancelBlock:](v19, "afterDelay:processBlock:cancelBlock:", v21, v20, 0.02);
    _Block_object_dispose(v23, 8);
  }
}

- (void).cxx_destruct
{
}

@end