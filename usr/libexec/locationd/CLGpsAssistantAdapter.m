@interface CLGpsAssistantAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLGpsAssistantAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)setDirectionOfTravelAssistance:(DirectionOfTravelAssistance *)a3;
- (void)setMapMatchedPositionAssistance:(MapMatchedPositionAssistance *)a3;
- (void)setTunnelBridgeAssistance:(TunnelBridgeAssistance *)a3;
- (void)setTunnelEndPointPositionAssistance:(TunnelEndPositionAssistance *)a3;
- (void)setVehicleGyroAssistance:(double)a3 vehicleGyro:(id *)a4;
- (void)setVehicleSpeedAssistance:(double)a3 vehicleSpeed:(id *)a4;
@end

@implementation CLGpsAssistantAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199F348 != -1) {
    dispatch_once(&qword_10199F348, &stru_10188AA80);
  }
  return (id)qword_10199F340;
}

- (CLGpsAssistantAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLGpsAssistantAdapter;
  return -[CLGpsAssistantAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLGpsAssistantProtocol,  &OBJC_PROTOCOL___CLGpsAssistantClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101276C3C();
  }
}

- (void)endService
{
  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result) {
  return result;
  }
}

- (void)doAsync:(id)a3
{
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)setVehicleSpeedAssistance:(double)a3 vehicleSpeed:(id *)a4
{
  double v4 = a3;
  sub_100ED0D0C((unsigned __int8 *)-[CLGpsAssistantAdapter adaptee](self, "adaptee"), &v4, (uint64_t)a4);
}

- (void)setVehicleGyroAssistance:(double)a3 vehicleGyro:(id *)a4
{
  double v4 = a3;
  sub_100ED103C((uint64_t)-[CLGpsAssistantAdapter adaptee](self, "adaptee"), &v4, &a4->var0);
}

- (void)setDirectionOfTravelAssistance:(DirectionOfTravelAssistance *)a3
{
}

- (void)setMapMatchedPositionAssistance:(MapMatchedPositionAssistance *)a3
{
}

- (void)setTunnelBridgeAssistance:(TunnelBridgeAssistance *)a3
{
}

- (void)setTunnelEndPointPositionAssistance:(TunnelEndPositionAssistance *)a3
{
}

@end