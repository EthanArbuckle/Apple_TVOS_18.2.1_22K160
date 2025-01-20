@interface IDSSenderKeySendContext
+ (NSString)handleDonation;
+ (NSString)iMessageReceive;
+ (NSString)iMessageSend;
+ (NSString)idstool;
+ (NSString)keyRecovery;
+ (NSString)keyRoll;
+ (NSString)remoteDeviceUpdate;
- (_TtC17identityservicesd23IDSSenderKeySendContext)init;
@end

@implementation IDSSenderKeySendContext

+ (NSString)idstool
{
  return (NSString *)sub_10040B640( (uint64_t)a1,  (uint64_t)a2,  &qword_1009C3EF0,  (uint64_t)&qword_1009C7690,  (uint64_t *)algn_1009C7698,  (uint64_t)sub_10046CE0C);
}

+ (NSString)iMessageSend
{
  return (NSString *)sub_10040B640( (uint64_t)a1,  (uint64_t)a2,  &qword_1009C3EF8,  (uint64_t)&qword_1009C76A0,  (uint64_t *)algn_1009C76A8,  (uint64_t)sub_10046CE50);
}

+ (NSString)iMessageReceive
{
  return (NSString *)sub_10040B640( (uint64_t)a1,  (uint64_t)a2,  &qword_1009C3F00,  (uint64_t)&qword_1009C76B0,  (uint64_t *)algn_1009C76B8,  (uint64_t)sub_10046CE9C);
}

+ (NSString)handleDonation
{
  return (NSString *)sub_10040B640( (uint64_t)a1,  (uint64_t)a2,  &qword_1009C3F08,  (uint64_t)&qword_1009C76C0,  (uint64_t *)algn_1009C76C8,  (uint64_t)sub_10046CEEC);
}

+ (NSString)keyRoll
{
  return (NSString *)sub_10040B640( (uint64_t)a1,  (uint64_t)a2,  &qword_1009C3F10,  (uint64_t)&qword_1009C76D0,  (uint64_t *)algn_1009C76D8,  (uint64_t)sub_10046CF3C);
}

+ (NSString)keyRecovery
{
  return (NSString *)sub_10040B640( (uint64_t)a1,  (uint64_t)a2,  &qword_1009C3F18,  (uint64_t)&qword_1009C76E0,  (uint64_t *)algn_1009C76E8,  (uint64_t)sub_10046CF80);
}

+ (NSString)remoteDeviceUpdate
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC17identityservicesd23IDSSenderKeySendContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IDSSenderKeySendContext();
  return -[IDSSenderKeySendContext init](&v3, "init");
}

@end