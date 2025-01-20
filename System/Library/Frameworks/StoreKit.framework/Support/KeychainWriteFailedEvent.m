@interface KeychainWriteFailedEvent
+ (NSString)name;
- (BOOL)canCreatePayload;
- (NSString)errorDomain;
- (_TtC9storekitd24KeychainWriteFailedEvent)init;
- (_TtC9storekitd24KeychainWriteFailedEvent)initWithError:(id)a3;
- (int64_t)errorCode;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
@end

@implementation KeychainWriteFailedEvent

+ (NSString)name
{
  return (NSString *)sub_1000CE8A8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1000CE8E4);
}

- (NSString)errorDomain
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setErrorDomain:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  sub_1000CE9B8(v4, v6);
}

- (int64_t)errorCode
{
  return sub_1000CE9E4();
}

- (void)setErrorCode:(int64_t)a3
{
}

- (_TtC9storekitd24KeychainWriteFailedEvent)initWithError:(id)a3
{
  return (_TtC9storekitd24KeychainWriteFailedEvent *)sub_1000CEA20(a3);
}

- (_TtC9storekitd24KeychainWriteFailedEvent)init
{
  return (_TtC9storekitd24KeychainWriteFailedEvent *)sub_1000CEBDC();
}

- (BOOL)canCreatePayload
{
  uint64_t v2 = self;
  BOOL v3 = sub_1000CECBC();

  return v3;
}

- (void).cxx_destruct
{
}

@end