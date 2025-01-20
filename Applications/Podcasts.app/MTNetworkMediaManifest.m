@interface MTNetworkMediaManifest
+ (id)activityTypeSuffix;
+ (int64_t)playerFetchLimit;
+ (void)fetchPlayerItemsFor:(id)a3 completion:(id)a4;
- (BOOL)hasOnlyPaidEpisodesWithoutSubscription;
- (BOOL)parsePodcastAssetInfo:(id)a3 error:(id *)a4;
- (BOOL)parseStationAssetInfo:(id)a3 error:(id *)a4;
- (MTNetworkMediaManifest)init;
- (MTNetworkMediaManifest)initWithAssetInfo:(id)a3;
- (MTNetworkMediaManifest)initWithEpisodeAdamId:(id)a3 assetInfo:(id)a4;
- (MTNetworkMediaManifest)initWithEpisodeAdamIds:(id)a3 assetInfo:(id)a4;
- (MTNetworkMediaManifest)initWithItems:(id)a3;
- (MTNetworkMediaManifest)initWithPodcastAdamId:(id)a3 assetInfo:(id)a4;
- (MTNetworkMediaManifest)initWithStationId:(id)a3 assetInfo:(id)a4;
- (NSArray)initialEpisodeUuids;
- (NSArray)itemIdsDebug;
- (NSString)initialPodcastUuid;
- (id)parseEpisodeAssetInfo:(id)a3 error:(id *)a4;
- (int64_t)episodeFetchLimit;
- (int64_t)forwardItemCount;
- (unint64_t)currentIndex;
- (void)load:(id)a3;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setEpisodeFetchLimit:(int64_t)a3;
- (void)setForwardItemCount:(int64_t)a3;
- (void)setHasOnlyPaidEpisodesWithoutSubscription:(BOOL)a3;
@end

@implementation MTNetworkMediaManifest

+ (int64_t)playerFetchLimit
{
  return 20LL;
}

- (int64_t)forwardItemCount
{
  return *(void *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_forwardItemCount];
}

- (void)setForwardItemCount:(int64_t)a3
{
  *(void *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_forwardItemCount] = a3;
}

- (int64_t)episodeFetchLimit
{
  return *(void *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_episodeFetchLimit];
}

- (void)setEpisodeFetchLimit:(int64_t)a3
{
  *(void *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_episodeFetchLimit] = a3;
}

- (BOOL)hasOnlyPaidEpisodesWithoutSubscription
{
  return self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_hasOnlyPaidEpisodesWithoutSubscription];
}

- (void)setHasOnlyPaidEpisodesWithoutSubscription:(BOOL)a3
{
  self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_hasOnlyPaidEpisodesWithoutSubscription] = a3;
}

- (MTNetworkMediaManifest)initWithAssetInfo:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v5 = v4;
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  v7 = -[MTNetworkMediaManifest initWithPodcastAdamId:assetInfo:](self, "initWithPodcastAdamId:assetInfo:", 0LL, v6);

  return v7;
}

- (MTNetworkMediaManifest)initWithEpisodeAdamId:(id)a3 assetInfo:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0LL;
    uint64_t v7 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0LL;
    uint64_t v10 = 0LL;
    return (MTNetworkMediaManifest *)sub_10012A5B4(v5, v7, v8, v10);
  }

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v10 = v9;
  return (MTNetworkMediaManifest *)sub_10012A5B4(v5, v7, v8, v10);
}

- (MTNetworkMediaManifest)initWithEpisodeAdamIds:(id)a3 assetInfo:(id)a4
{
  id v4 = a4;
  if (!a3)
  {
    uint64_t v6 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0LL;
    goto LABEL_6;
  }

  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  id v4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v8 = v7;
LABEL_6:
  id v9 = objc_allocWithZone((Class)type metadata accessor for NetworkMediaManifest(0LL));
  uint64_t v10 = (MTNetworkMediaManifest *)sub_10012A9A8(0LL, 0LL, v6, 0LL, 0LL, (uint64_t)v4, v8);
  uint64_t ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance( self,  ObjectType,  *(unsigned int *)((swift_isaMask & *(void *)self->super.super.IMPlayerManifest_opaque) + 0x30LL),  *(unsigned __int16 *)((swift_isaMask & *(void *)self->super.super.IMPlayerManifest_opaque) + 0x34LL));
  return v10;
}

- (MTNetworkMediaManifest)initWithPodcastAdamId:(id)a3 assetInfo:(id)a4
{
  id v4 = a4;
  if (!a3)
  {
    uint64_t v6 = 0LL;
    uint64_t v8 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0LL;
    goto LABEL_6;
  }

  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  id v4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v10 = v9;
LABEL_6:
  id v11 = objc_allocWithZone((Class)type metadata accessor for NetworkMediaManifest(0LL));
  v12 = (MTNetworkMediaManifest *)sub_10012A9A8(v6, v8, 0LL, 0LL, 0LL, (uint64_t)v4, v10);
  uint64_t ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance( self,  ObjectType,  *(unsigned int *)((swift_isaMask & *(void *)self->super.super.IMPlayerManifest_opaque) + 0x30LL),  *(unsigned __int16 *)((swift_isaMask & *(void *)self->super.super.IMPlayerManifest_opaque) + 0x34LL));
  return v12;
}

- (MTNetworkMediaManifest)initWithStationId:(id)a3 assetInfo:(id)a4
{
  id v4 = a4;
  if (!a3)
  {
    uint64_t v6 = 0LL;
    uint64_t v8 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0LL;
    goto LABEL_6;
  }

  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  id v4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v10 = v9;
LABEL_6:
  id v11 = objc_allocWithZone((Class)type metadata accessor for NetworkMediaManifest(0LL));
  v12 = (MTNetworkMediaManifest *)sub_10012A9A8(0LL, 0LL, 0LL, v6, v8, (uint64_t)v4, v10);
  uint64_t ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance( self,  ObjectType,  *(unsigned int *)((swift_isaMask & *(void *)self->super.super.IMPlayerManifest_opaque) + 0x30LL),  *(unsigned __int16 *)((swift_isaMask & *(void *)self->super.super.IMPlayerManifest_opaque) + 0x34LL));
  return v12;
}

- (void)load:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject(&unk_1002464E0, 24LL, 7LL);
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_1001278BC;
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v6 = 0LL;
  }

  uint64_t v8 = self;
  sub_10012B544((uint64_t (*)(id))v7, v6);
  sub_1001341FC((uint64_t)v7, v6);
}

+ (void)fetchPlayerItemsFor:(id)a3 completion:(id)a4
{
  uint64_t v7 = type metadata accessor for MediaRequest.ContentType(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v11 = _Block_copy(a4);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  if (v11)
  {
    uint64_t v13 = swift_allocObject(&unk_1002465D0, 24LL, 7LL);
    *(void *)(v13 + 16) = v11;
    id v11 = sub_1001343F0;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  swift_getObjCClassMetadata(a1);
  id v14 = [objc_allocWithZone((Class)type metadata accessor for MediaRequestController(0)) init];
  (*(void (**)(char *, void, uint64_t))(v8 + 104))( v10,  enum case for MediaRequest.ContentType.podcastEpisode(_:),  v7);
  v15 = (void *)swift_allocObject(&unk_1002465A8, 40LL, 7LL);
  v15[2] = v14;
  v15[3] = v11;
  v15[4] = v13;
  id v16 = v14;
  sub_10013397C((uint64_t)v11, v13);
  sub_10012B760( 0LL,  v12,  v16,  (uint64_t)v10,  0x7FFFFFFFFFFFFFFFLL,  20LL,  (uint64_t)_swiftEmptyArrayStorage,  0,  (uint64_t (*)(uint64_t, void))sub_1001343C8,  (uint64_t)v15);

  swift_release(v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_1001341FC((uint64_t)v11, v13);
  swift_bridgeObjectRelease(v12);
}

- (NSArray)initialEpisodeUuids
{
  v2 = self;
  uint64_t v3 = sub_10012D4C4();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    v4.super.isa = 0LL;
  }

  return (NSArray *)v4.super.isa;
}

- (NSString)initialPodcastUuid
{
  v2 = self;
  sub_10012D6F4();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (BOOL)parseStationAssetInfo:(id)a3 error:(id *)a4
{
  return sub_10012EB58( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t))sub_10012D8E0);
}

- (id)parseEpisodeAssetInfo:(id)a3 error:(id *)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v7 = 0LL;
  }

  uint64_t v8 = self;
  uint64_t v9 = sub_10012DCC0(v5, v7);

  swift_bridgeObjectRelease(v7);
  type metadata accessor for ServerPodcastEpisode(0LL);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (BOOL)parsePodcastAssetInfo:(id)a3 error:(id *)a4
{
  return sub_10012EB58( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (void (*)(uint64_t, uint64_t))sub_10012E1F8);
}

- (unint64_t)currentIndex
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NetworkMediaManifest(0LL);
  return -[MTNetworkMediaManifest currentIndex](&v3, "currentIndex");
}

- (void)setCurrentIndex:(unint64_t)a3
{
  uint64_t v4 = self;
  if (-[MTNetworkMediaManifest currentIndex](v4, "currentIndex") == a3)
  {
  }

  else
  {
    v5.receiver = v4;
    v5.super_class = (Class)type metadata accessor for NetworkMediaManifest(0LL);
    -[MTNetworkMediaManifest setCurrentIndex:](&v5, "setCurrentIndex:", a3);
    sub_100133738(0LL, 0LL);
  }

+ (id)activityTypeSuffix
{
  return String._bridgeToObjectiveC()();
}

- (NSArray)itemIdsDebug
{
  v2 = self;
  objc_super v3 = sub_100131A8C();

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (MTNetworkMediaManifest)initWithItems:(id)a3
{
  result = (MTNetworkMediaManifest *)_swift_stdlib_reportUnimplementedInitializer( "Podcasts.NetworkMediaManifest",  29LL,  "init(items:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (MTNetworkMediaManifest)init
{
  result = (MTNetworkMediaManifest *)_swift_stdlib_reportUnimplementedInitializer( "Podcasts.NetworkMediaManifest",  29LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(void *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_initialIds]);
  objc_super v3 = &self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_contentType];
  uint64_t v4 = type metadata accessor for MediaRequest.ContentType(0LL);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_inProgressRefreshHandlers]);
}

@end