@interface MTSwiftEpisodeListManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
- (MTSwiftEpisodeListManifest)initWithInitialEpisodeUuid:(id)a3 fetchRequest:(id)a4;
- (NSUserActivity)activity;
@end

@implementation MTSwiftEpisodeListManifest

- (MTSwiftEpisodeListManifest)initWithInitialEpisodeUuid:(id)a3 fetchRequest:(id)a4
{
  id v4 = a4;
  result = (MTSwiftEpisodeListManifest *)_swift_stdlib_reportUnimplementedInitializer( "Podcasts.EpisodeListManifest",  28LL,  "init(initialEpisodeUuid:fetchRequest:)",  38LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = &self->super.super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTSwiftEpisodeListManifest_settings];
  uint64_t v3 = type metadata accessor for EpisodeListSettings(0LL, a2);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

- (NSUserActivity)activity
{
  v2 = self;
  uint64_t v3 = sub_10013C654();

  return (NSUserActivity *)v3;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_100246A58, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(ObjCClassMetadata);
  v10 = (void *)swift_allocObject(&unk_100246A80, 40LL, 7LL);
  v10[2] = a3;
  v10[3] = sub_10013D120;
  v10[4] = v7;
  v14[4] = sub_10013D15C;
  v15 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256LL;
  v14[2] = sub_10013CF44;
  v14[3] = &unk_100246A98;
  v11 = _Block_copy(v14);
  v12 = v15;
  id v13 = a3;
  swift_retain(v7);
  swift_release(v12);
  [ObjCClassFromMetadata episodeUuidForActivity:v13 completion:v11];
  _Block_release(v11);

  swift_release(v7);
}

+ (id)activityTypeSuffix
{
  return String._bridgeToObjectiveC()();
}

@end