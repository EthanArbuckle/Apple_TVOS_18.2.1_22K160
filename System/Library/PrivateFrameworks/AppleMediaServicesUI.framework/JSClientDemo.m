@interface JSClientDemo
- (BOOL)inStoreDemoMode;
- (NSDictionary)options;
- (NSString)storeId;
- (_TtC14amsengagementd12JSClientDemo)init;
- (int64_t)deviceType;
@end

@implementation JSClientDemo

- (_TtC14amsengagementd12JSClientDemo)init
{
  return (_TtC14amsengagementd12JSClientDemo *)sub_100085D80();
}

- (int64_t)deviceType
{
  v2 = self;
  sub_100085E00();
  int64_t v4 = v3;

  return v4;
}

- (BOOL)inStoreDemoMode
{
  v2 = self;
  unsigned __int8 v3 = sub_100085F04();

  return v3 & 1;
}

- (NSDictionary)options
{
  v2 = self;
  sub_100085F8C();

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (NSString)storeId
{
  v2 = self;
  sub_100086120();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

@end