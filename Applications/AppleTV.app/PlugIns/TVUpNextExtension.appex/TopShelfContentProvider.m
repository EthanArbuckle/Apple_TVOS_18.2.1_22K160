@interface TopShelfContentProvider
+ (void)log:(id)a3;
- (_TtC17TVUpNextExtension23TopShelfContentProvider)init;
- (_TtP17TVUpNextExtension31TopShelfContentProviderDelegate_)delegate;
- (id)fetchRentalDetails;
- (id)getFeatureFlags;
- (id)localize:(id)a3 :(id)a4;
- (id)localizeWithCounts:(id)a3 :(id)a4;
- (void)cacheInvalidationEventOccurred;
- (void)fetchFeaturedContentWithCompletion:(id)a3;
- (void)fetchUpNextContentWithCompletion:(id)a3;
- (void)recordImpressionsWithCompletionHandler:(id)a3;
- (void)saveToTrackerWithUserInfo:(NSDictionary *)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startWithDeveloperMode:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation TopShelfContentProvider

- (_TtP17TVUpNextExtension31TopShelfContentProviderDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_delegate, v4, 0LL, 0LL);
  return (_TtP17TVUpNextExtension31TopShelfContentProviderDelegate_ *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_delegate, v5, 1LL, 0LL);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (_TtC17TVUpNextExtension23TopShelfContentProvider)init
{
  return (_TtC17TVUpNextExtension23TopShelfContentProvider *)sub_10000AEF4();
}

- (void)startWithDeveloperMode:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100008A20(&qword_100035F00);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_100032330, 40LL, 7LL);
  *(_BYTE *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_100032358, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1000362D8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_100032380, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1000362E0;
  v14[5] = v13;
  v15 = self;
  uint64_t v16 = sub_1000091C4((uint64_t)v9, (uint64_t)&unk_1000362E8, (uint64_t)v14);
  swift_release(v16);
}

- (void)recordImpressionsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100008A20(&qword_100035F00);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1000322B8, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_1000322E0, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1000362B8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_100032308, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1000362C0;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_1000091C4((uint64_t)v7, (uint64_t)&unk_1000362C8, (uint64_t)v12);
  swift_release(v14);
}

- (void)saveToTrackerWithUserInfo:(NSDictionary *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100008A20(&qword_100035F00);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_100032218, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_100032240, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100036280;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100032268, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100036290;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  uint64_t v17 = sub_1000091C4((uint64_t)v9, (uint64_t)&unk_1000362A0, (uint64_t)v14);
  swift_release(v17);
}

+ (void)log:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v5 = v4;
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(v3, v4);
  swift_bridgeObjectRelease(v5);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_impressionTracker));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_impressionsData));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_stack));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_objectGraph));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy));
}

- (void)cacheInvalidationEventOccurred
{
  v2 = self;
  sub_10000CFD4();
}

- (id)localize:(id)a3 :(id)a4
{
  return sub_10000D170( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t, uint64_t))_s17TVUpNextExtension23TopShelfContentProviderC8localizeyS2S_SayyXlGtF_0);
}

- (id)localizeWithCounts:(id)a3 :(id)a4
{
  return sub_10000D170( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t, uint64_t))_s17TVUpNextExtension23TopShelfContentProviderC18localizeWithCountsyS2S_SayyXlGtF_0);
}

- (id)fetchRentalDetails
{
  uint64_t v3 = v2;
  sub_100008A20(&qword_100036268);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (id)getFeatureFlags
{
  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___VUIFeatureManager);
  unint64_t v4 = self;
  id result = [v3 sharedInstance];
  if (result)
  {
    id v6 = result;
    id v7 = [result osFeatureFlagsJSON];

    if (v7)
    {
      uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v7,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v8);
      return isa;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

- (void)fetchUpNextContentWithCompletion:(id)a3
{
}

- (void)fetchFeaturedContentWithCompletion:(id)a3
{
}

@end