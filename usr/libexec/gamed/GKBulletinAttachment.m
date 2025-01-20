@interface GKBulletinAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)hiddenFromDefaultExpandedView;
- (GKBulletinAttachment)init;
- (GKBulletinAttachment)initWithCoder:(id)a3;
- (GKBulletinAttachment)initWithIdentifier:(id)a3 url:(id)a4 hiddenFromDefaultExpandedView:(BOOL)a5;
- (NSString)identifier;
- (NSURL)url;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GKBulletinAttachment

- (NSString)identifier
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3, v5);
  return (NSString *)v4;
}

- (NSURL)url
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100173708((uint64_t)v5);
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v8;
}

- (BOOL)hiddenFromDefaultExpandedView
{
  return sub_10017376C() & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKBulletinAttachment)initWithIdentifier:(id)a3 url:(id)a4 hiddenFromDefaultExpandedView:(BOOL)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v10);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (GKBulletinAttachment *)sub_100173784(v7, v9, (uint64_t)v12, a5);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001738D4(v4);
}

- (GKBulletinAttachment)initWithCoder:(id)a3
{
  return (GKBulletinAttachment *)sub_100173A14(a3);
}

- (GKBulletinAttachment)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___GKBulletinAttachment_url;
  uint64_t v4 = sub_1001640F8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end