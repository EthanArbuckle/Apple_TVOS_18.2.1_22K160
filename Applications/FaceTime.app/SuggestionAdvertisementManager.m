@interface SuggestionAdvertisementManager
- (_TtC8FaceTime30SuggestionAdvertisementManager)init;
- (void)dealloc;
- (void)neighborhoodActivityConduit:(id)a3 suggestionAdvertisementUpdated:(id)a4 fromDevice:(id)a5;
@end

@implementation SuggestionAdvertisementManager

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8FaceTime30SuggestionAdvertisementManager_neighborhoodActivityConduit);
  v3 = self;
  [v2 removeDelegate:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for SuggestionAdvertisementManager(0LL);
  -[SuggestionAdvertisementManager dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  sub_10001BFEC((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8FaceTime30SuggestionAdvertisementManager_bulletinManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime30SuggestionAdvertisementManager_neighborhoodActivityConduit));
  sub_10001BFEC((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8FaceTime30SuggestionAdvertisementManager_userNotificationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime30SuggestionAdvertisementManager_suggestionAdvertisementQueue));
}

- (_TtC8FaceTime30SuggestionAdvertisementManager)init
{
  result = (_TtC8FaceTime30SuggestionAdvertisementManager *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SuggestionAdvertisementManager",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)neighborhoodActivityConduit:(id)a3 suggestionAdvertisementUpdated:(id)a4 fromDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100022118(a4, v10);
}

@end