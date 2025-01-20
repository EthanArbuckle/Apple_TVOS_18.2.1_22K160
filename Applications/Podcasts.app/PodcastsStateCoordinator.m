@interface PodcastsStateCoordinator
+ (_TtC8Podcasts24PodcastsStateCoordinator)shared;
+ (void)setShared:(id)a3;
- (_TtC8Podcasts24PodcastsStateCoordinator)init;
- (id)currentPodcastStateDescriptionFrom:(id)a3;
- (void)disableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4;
- (void)disableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4 context:(id)a5;
- (void)disableSubscriptionsOnPodcastUUIDs:(id)a3 from:(int64_t)a4 context:(id)a5;
- (void)enableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4;
- (void)insertNewImplicitFollowIfNeededForPlayerItem:(id)a3 from:(int64_t)a4 completion:(id)a5;
- (void)unsafeBookmarkEpisode:(id)a3 onTimestamp:(double)a4 shouldDownloadEpisode:(BOOL)a5 from:(int64_t)a6;
- (void)unsafeDidBumpLastDatePlayedFor:(id)a3;
- (void)unsafeEnableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4 context:(id)a5;
- (void)unsafeEpisodePlayedBeyondThresholdForFirstTime:(id)a3 from:(int64_t)a4;
- (void)unsafeMark:(id)a3 as:(int64_t)a4 in:(id)a5 from:(int64_t)a6;
- (void)unsafeRemoveEpisodeFromBookmarks:(id)a3 from:(int64_t)a4;
@end

@implementation PodcastsStateCoordinator

+ (_TtC8Podcasts24PodcastsStateCoordinator)shared
{
  if (qword_1002B4860 != -1) {
    swift_once(&qword_1002B4860, sub_10016F6AC);
  }
  swift_beginAccess(&static PodcastsStateCoordinator.shared, v3, 0LL, 0LL);
  return (_TtC8Podcasts24PodcastsStateCoordinator *)(id)static PodcastsStateCoordinator.shared;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_1002B4860;
  id v4 = a3;
  if (v3 != -1) {
    swift_once(&qword_1002B4860, sub_10016F6AC);
  }
  swift_beginAccess(&static PodcastsStateCoordinator.shared, v6, 1LL, 0LL);
  v5 = (void *)static PodcastsStateCoordinator.shared;
  static PodcastsStateCoordinator.shared = (uint64_t)v4;
}

- (_TtC8Podcasts24PodcastsStateCoordinator)init
{
  result = (_TtC8Podcasts24PodcastsStateCoordinator *)_swift_stdlib_reportUnimplementedInitializer( "Podcasts.PodcastsStateCoordinator",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_subscriptions));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_downloadsGateway));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_episodeStateRepository));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_contextProvider));
  sub_100136648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateCoordinatorPersistentStore));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateTransitions));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_syncController));
}

- (void)enableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  v9 = self;
  PodcastsStateCoordinator.enableSubscription(onPodcastUUID:from:)(v6, v8, a4);

  swift_bridgeObjectRelease(v8);
}

- (void)unsafeEnableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4 context:(id)a5
{
  uint64_t v9 = v8;
  id v13 = a5;
  v10 = self;
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v13 podcastForUuid:v11];

  if (v12)
  {
    sub_100173360(v12, a4);
    [v13 saveInCurrentBlock];

    swift_bridgeObjectRelease(v9);
  }

  else
  {

    swift_bridgeObjectRelease(v9);
  }
}

- (void)disableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4
{
  uint64_t v7 = v6;
  uint64_t v8 = self;
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 =  [*(id *)((char *)&v8->super.isa + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_contextProvider) mainOrPrivateContext];
  -[PodcastsStateCoordinator disableSubscriptionOnPodcastUUID:from:context:]( v8,  "disableSubscriptionOnPodcastUUID:from:context:",  v9,  a4,  v10);

  swift_bridgeObjectRelease(v7);
}

- (void)disableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4 context:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  NSString v11 = (void *)swift_allocObject(&unk_100248718, 56LL, 7LL);
  v11[2] = a5;
  v11[3] = v8;
  v11[4] = v10;
  v11[5] = self;
  v11[6] = a4;
  v18[4] = sub_10017AB8C;
  v19 = v11;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256LL;
  v18[2] = sub_10013D2D8;
  v18[3] = &unk_100248730;
  id v12 = _Block_copy(v18);
  id v13 = v19;
  id v14 = a5;
  v15 = self;
  id v16 = v14;
  v17 = v15;
  swift_bridgeObjectRetain(v10);
  swift_release(v13);
  [v16 performBlockAndWaitWithSave:v12];
  _Block_release(v12);

  swift_bridgeObjectRelease(v10);
}

- (void)disableSubscriptionsOnPodcastUUIDs:(id)a3 from:(int64_t)a4 context:(id)a5
{
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v9 = (void *)swift_allocObject(&unk_1002486C8, 48LL, 7LL);
  v9[2] = a5;
  v9[3] = v8;
  v9[4] = self;
  v9[5] = a4;
  v16[4] = sub_10017C268;
  v17 = v9;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256LL;
  v16[2] = sub_10013D2D8;
  v16[3] = &unk_1002486E0;
  uint64_t v10 = _Block_copy(v16);
  NSString v11 = v17;
  id v12 = a5;
  id v13 = self;
  id v14 = v12;
  v15 = v13;
  swift_bridgeObjectRetain(v8);
  swift_release(v11);
  [v14 performBlockAndWaitWithSave:v10];
  _Block_release(v10);

  swift_bridgeObjectRelease(v8);
}

- (void)unsafeBookmarkEpisode:(id)a3 onTimestamp:(double)a4 shouldDownloadEpisode:(BOOL)a5 from:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  NSString v11 = self;
  sub_1001745BC(v10, *(void (**)(char *, uint64_t))&a4, 0, v7, a6);
}

- (void)unsafeRemoveEpisodeFromBookmarks:(id)a3 from:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = self;
  PodcastsStateCoordinator.unsafeRemoveEpisodeFromBookmarks(episode:from:)(v6, a4);
}

- (void)insertNewImplicitFollowIfNeededForPlayerItem:(id)a3 from:(int64_t)a4 completion:(id)a5
{
  id v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for PodcastPlayerItem(0LL);
  __chkstk_darwin();
  id v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for PlayerItem(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin();
  id v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v17 = _Block_copy(a5);
  id v18 = a3;
  _Block_copy(v17);
  v19 = self;
  sub_10016635C(v18);
  id v20 = v18;
  sub_1001664A4(v20, (uint64_t)v10);
  PlayerItem.init(podcast:episode:)(v12, v10);

  sub_10017AC70((uint64_t)v16, a4, (uint64_t)v19, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  _Block_release(v17);
}

- (void)unsafeEpisodePlayedBeyondThresholdForFirstTime:(id)a3 from:(int64_t)a4
{
  id v7 = a3;
  uint64_t v8 = self;
  PodcastsStateCoordinator.unsafeEpisodePlayedBeyondThresholdForFirstTime(_:from:)(a3, a4);
}

- (void)unsafeMark:(id)a3 as:(int64_t)a4 in:(id)a5 from:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = self;
  sub_10017B198(v10, (void *)a4, a6);
}

- (void)unsafeDidBumpLastDatePlayedFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  PodcastsStateCoordinator.unsafeDidBumpLastDatePlayed(for:)(v4);
}

- (id)currentPodcastStateDescriptionFrom:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  id v7 = self;
  _s8Podcasts0A16StateCoordinatorC014currentPodcastB11Description4fromS2S_tF_0(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease(v6);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

@end