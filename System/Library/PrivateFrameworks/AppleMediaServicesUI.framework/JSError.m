@interface JSError
- (NSDictionary)export;
- (NSString)message;
- (NSString)title;
- (_TtC14amsengagementd7JSError)initWithCoder:(id)a3;
- (_TtC14amsengagementd7JSError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation JSError

- (NSString)message
{
  return (NSString *)sub_10008F374(self, (uint64_t)a2, (void (*)(void))sub_10008F35C);
}

- (NSString)title
{
  return (NSString *)sub_10008F374(self, (uint64_t)a2, (void (*)(void))sub_10008F3DC);
}

- (NSDictionary)export
{
  v2 = self;
  sub_10008F4BC();

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (_TtC14amsengagementd7JSError)initWithCoder:(id)a3
{
}

- (_TtC14amsengagementd7JSError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  if (a5) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  sub_10008F97C();
}

@end