@interface MTFeedManager
+ (MTFeedManager)sharedInstance;
- (BOOL)abortUpdatesIfNetworkUnreachable:(BOOL)a3;
- (BOOL)isUpdating;
- (BOOL)isUpdatingShowWithUrl:(id)a3 storeID:(int64_t)a4;
- (MTFeedManager)init;
- (void)handleEventsForBackgroundURLSessionFor:(id)a3 completionHandler:(id)a4;
- (void)updateFeedForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 forceBootstrap:(BOOL)a8 useBackgroundFetch:(BOOL)a9 source:(int64_t)a10 completion:(id)a11;
- (void)updateFeedForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 forceBootstrap:(BOOL)a8 useBackgroundFetch:(BOOL)a9 source:(int64_t)a10 isSubscribing:(BOOL)a11 feedDownloadedHook:(id)a12 preProcessFeedHook:(id)a13 postProcessFeedHook:(id)a14 completion:(id)a15;
@end

@implementation MTFeedManager

+ (MTFeedManager)sharedInstance
{
  if (qword_1002B4808 != -1) {
    swift_once(&qword_1002B4808, sub_10013D304);
  }
  return (MTFeedManager *)(id)static FeedManager.shared;
}

- (MTFeedManager)init
{
  return (MTFeedManager *)sub_10013D3F4();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___MTFeedManager_systemFuture;
  uint64_t v4 = sub_100126450(&qword_1002B5450);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  sub_100142038( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__system),  *(void *)&self->queue[OBJC_IVAR___MTFeedManager__system],  *(void *)&self->_system[OBJC_IVAR___MTFeedManager__system]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__pendingRequests));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__pendingBlocks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__subscriptions));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager_downloadManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTFeedManager__feedIngesterProvider));
  v5 = (char *)self + OBJC_IVAR___MTFeedManager_signpostID;
  uint64_t v6 = type metadata accessor for OSSignpostID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

- (void)updateFeedForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 forceBootstrap:(BOOL)a8 useBackgroundFetch:(BOOL)a9 source:(int64_t)a10 completion:(id)a11
{
  BOOL v32 = a7;
  BOOL v33 = a8;
  uint64_t v30 = a5;
  uint64_t v15 = sub_100126450(&qword_1002B4DB8);
  __chkstk_darwin(v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for URL(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v22 = (uint64_t (*)())_Block_copy(a11);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v23 = 0LL;
  }

  else
  {
    uint64_t v23 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, v23, 1LL, v18);
  uint64_t v31 = v18;
  if (!a6)
  {
    uint64_t v24 = 0LL;
    int64_t v26 = a10;
    if (v22) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v27 = 0LL;
    goto LABEL_9;
  }

  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  a6 = v25;
  int64_t v26 = a10;
  if (!v22) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v27 = swift_allocObject(&unk_100246D00, 24LL, 7LL);
  *(void *)(v27 + 16) = v22;
  v22 = sub_100142F18;
LABEL_9:
  v28 = self;
  FeedManager.updateFeed(forFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:forceBootstrap:useBackgroundFetch:source:completion:)( (uint64_t)v21,  (uint64_t)v17,  v30,  v24,  a6,  v32,  v33,  a9,  v26,  (uint64_t)v22,  v27);
  sub_1001341FC((uint64_t)v22, v27);

  swift_bridgeObjectRelease(a6);
  sub_10012A4A0((uint64_t)v17, &qword_1002B4DB8);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v31);
}

- (void)updateFeedForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 forceBootstrap:(BOOL)a8 useBackgroundFetch:(BOOL)a9 source:(int64_t)a10 isSubscribing:(BOOL)a11 feedDownloadedHook:(id)a12 preProcessFeedHook:(id)a13 postProcessFeedHook:(id)a14 completion:(id)a15
{
  unsigned int v52 = a7;
  unsigned int v53 = a8;
  v50 = self;
  uint64_t v51 = a5;
  uint64_t v18 = sub_100126450(&qword_1002B4DB8);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for URL(0LL);
  uint64_t v57 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = _Block_copy(a12);
  v25 = _Block_copy(a13);
  int64_t v26 = _Block_copy(a14);
  uint64_t v27 = _Block_copy(a15);
  v56 = v23;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v28 = 0LL;
  }

  else
  {
    uint64_t v28 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v20, v28, 1LL, v21);
  if (a6)
  {
    uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    uint64_t v49 = v29;
    if (v24) {
      goto LABEL_6;
    }
LABEL_9:
    v47 = 0LL;
    uint64_t v45 = 0LL;
    if (v25) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }

  uint64_t v48 = 0LL;
  uint64_t v49 = 0LL;
  if (!v24) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v45 = swift_allocObject(&unk_100246CD8, 24LL, 7LL);
  *(void *)(v45 + 16) = v24;
  v47 = sub_100142C40;
  if (v25)
  {
LABEL_7:
    uint64_t v30 = swift_allocObject(&unk_100246CB0, 24LL, 7LL);
    *(void *)(v30 + 16) = v25;
    uint64_t v31 = sub_100142C10;
    goto LABEL_11;
  }

- (BOOL)abortUpdatesIfNetworkUnreachable:(BOOL)a3
{
  return _s8Podcasts11FeedManagerC32abortUpdatesIfNetworkUnreachable13userInitiatedS2b_tF_0(a3) & 1;
}

- (BOOL)isUpdatingShowWithUrl:(id)a3 storeID:(int64_t)a4
{
  uint64_t v7 = sub_100126450(&qword_1002B4DB8);
  __chkstk_darwin(v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v10 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v9, 0LL, 1LL, v10);
  }

  else
  {
    uint64_t v11 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v9, 1LL, 1LL, v11);
  }

  v12 = self;
  char v13 = FeedManager.isUpdatingShow(url:storeID:)((uint64_t)v9, a4);

  sub_10012A4A0((uint64_t)v9, &qword_1002B4DB8);
  return v13 & 1;
}

- (void)handleEventsForBackgroundURLSessionFor:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject(&unk_100246C10, 24LL, 7LL);
  *(void *)(v10 + 16) = v6;
  uint64_t v11 = (void *)swift_allocObject(&unk_100246C38, 56LL, 7LL);
  v11[2] = self;
  v11[3] = v7;
  v11[4] = v9;
  v11[5] = sub_1001278BC;
  v11[6] = v10;
  v12 = self;
  swift_bridgeObjectRetain(v9);
  swift_retain(v10);
  sub_10013DD34((uint64_t)sub_100142068, (uint64_t)v11);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
  swift_release(v11);
}

- (BOOL)isUpdating
{
  v2 = self;
  char v3 = FeedManager.isUpdating.getter();

  return v3 & 1;
}

@end