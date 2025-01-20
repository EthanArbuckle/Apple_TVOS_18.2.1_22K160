@interface CSDAnalyticsReporter
+ (void)sendDualSIMRingtoneStateEvent:(BOOL)a3;
+ (void)sendManualLaunchAttemptEventWithActivitySession:(id)a3;
+ (void)sendManualLaunchNeededEventWithActivitySession:(id)a3;
+ (void)sendSessionServerTerminatedEventWithActivitySession:(id)a3 code:(unsigned int)a4;
- (CSDAnalyticsReporter)init;
- (void)reportingController:(id)a3 pickedRoute:(id)a4 updatedByAnyTriggerForCall:(id)a5;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
@end

@implementation CSDAnalyticsReporter

+ (void)sendManualLaunchNeededEventWithActivitySession:(id)a3
{
  id v4 = a3;
  sub_1002A8008(v4);
}

+ (void)sendManualLaunchAttemptEventWithActivitySession:(id)a3
{
  id v4 = a3;
  sub_1002A8064(v4);
}

+ (void)sendSessionServerTerminatedEventWithActivitySession:(id)a3 code:(unsigned int)a4
{
  id v6 = a3;
  sub_1002A8278((uint64_t)v6, a4);
}

+ (void)sendDualSIMRingtoneStateEvent:(BOOL)a3
{
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1002A89F0(v7, v8);
}

- (void)reportingController:(id)a3 pickedRoute:(id)a4 updatedByAnyTriggerForCall:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1002A93E4((int)v11, v9, v10);
}

- (CSDAnalyticsReporter)init
{
  return (CSDAnalyticsReporter *)sub_1002AB1B4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDAnalyticsReporter_callToStartTransportType));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDAnalyticsReporter_callToAudioRoutesTracker));
}

@end