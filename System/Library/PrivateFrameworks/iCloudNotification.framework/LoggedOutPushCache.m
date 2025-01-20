@interface LoggedOutPushCache
+ (BOOL)wasDeviceRegistered;
+ (NSDate)expirationDate;
+ (void)registeredDeviceWithExpirationDate:(id)a3;
+ (void)unregisteredDevice;
- (_TtC3ind18LoggedOutPushCache)init;
@end

@implementation LoggedOutPushCache

- (_TtC3ind18LoggedOutPushCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LoggedOutPushCache();
  return -[LoggedOutPushCache init](&v3, "init");
}

+ (BOOL)wasDeviceRegistered
{
  return _s3ind18LoggedOutPushCacheC19wasDeviceRegisteredSbvgZ_0();
}

+ (NSDate)expirationDate
{
  objc_super v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static LoggedOutPushCache.expirationDate.getter((uint64_t)v3);
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1LL, v4) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
  }

  return (NSDate *)isa;
}

+ (void)registeredDeviceWithExpirationDate:(id)a3
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (qword_10002C240 != -1) {
    swift_once(&qword_10002C240, sub_10000EDB4);
  }
  uint64_t v8 = (void *)qword_10002C248;
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  NSString v10 = String._bridgeToObjectiveC()();
  [v8 setObject:isa forKey:v10];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

+ (void)unregisteredDevice
{
  if (qword_10002C240 != -1) {
    swift_once(&qword_10002C240, sub_10000EDB4);
  }
  uint64_t v2 = (void *)qword_10002C248;
  id v3 = String._bridgeToObjectiveC()();
  [v2 setURL:0 forKey:v3];
}

@end