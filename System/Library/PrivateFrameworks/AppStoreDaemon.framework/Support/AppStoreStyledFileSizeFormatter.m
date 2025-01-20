@interface AppStoreStyledFileSizeFormatter
+ (id)fileSize:(double)a3;
- (_TtC9appstored31AppStoreStyledFileSizeFormatter)init;
@end

@implementation AppStoreStyledFileSizeFormatter

+ (id)fileSize:(double)a3
{
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

- (_TtC9appstored31AppStoreStyledFileSizeFormatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[AppStoreStyledFileSizeFormatter init](&v3, "init");
}

@end