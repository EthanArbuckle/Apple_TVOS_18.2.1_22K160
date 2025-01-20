@interface CSDDemoModeCallFilter
- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4;
- (CSDDemoModeCallFilter)initWithQueue:(id)a3;
@end

@implementation CSDDemoModeCallFilter

- (CSDDemoModeCallFilter)initWithQueue:(id)a3
{
  return (CSDDemoModeCallFilter *)sub_100267FC4(a3);
}

- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1002681B0(v6);

  return v9 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(OS_dispatch_queue **)((char *)&self->super._queue
                                                  + OBJC_IVAR___CSDDemoModeCallFilter_regexAllowedHandleFormat));
}

@end