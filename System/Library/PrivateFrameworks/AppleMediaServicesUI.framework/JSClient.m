@interface JSClient
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)locale;
- (NSString)userAgent;
- (_TtC14amsengagementd8JSClient)init;
- (_TtP14amsengagementd19JSClientDemoExports_)demo;
- (void)setDemo:(id)a3;
@end

@implementation JSClient

- (_TtP14amsengagementd19JSClientDemoExports_)demo
{
  return (_TtP14amsengagementd19JSClientDemoExports_ *)(id)sub_10008581C();
}

- (void)setDemo:(id)a3
{
  v5 = self;
  sub_100085878((uint64_t)a3);
}

- (NSString)clientIdentifier
{
  return (NSString *)sub_100085B84(self, (uint64_t)a2, sub_10008595C);
}

- (NSString)clientVersion
{
  return (NSString *)sub_100085B84(self, (uint64_t)a2, sub_100085974);
}

- (NSString)locale
{
  v2 = self;
  sub_100085A18();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)userAgent
{
  return (NSString *)sub_100085B84(self, (uint64_t)a2, sub_100085BDC);
}

- (_TtC14amsengagementd8JSClient)init
{
}

- (void).cxx_destruct
{
}

@end