@interface XPCMessages
+ (NSString)fetchDeviceList;
+ (NSString)fetchNicknameDevice;
+ (NSString)nicknameDevice;
+ (NSString)purgeCloudData;
+ (NSString)removeDeviceNickname;
+ (NSString)resetCachedData;
- (_TtC15audioaccessoryd11XPCMessages)init;
@end

@implementation XPCMessages

+ (NSString)fetchDeviceList
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)fetchNicknameDevice
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)nicknameDevice
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)removeDeviceNickname
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)purgeCloudData
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)resetCachedData
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC15audioaccessoryd11XPCMessages)init
{
  return (_TtC15audioaccessoryd11XPCMessages *)sub_1000DD5DC(self, (uint64_t)a2, type metadata accessor for XPCMessages);
}

@end