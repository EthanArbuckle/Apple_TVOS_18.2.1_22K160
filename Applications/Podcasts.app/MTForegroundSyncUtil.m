@interface MTForegroundSyncUtil
+ (MTForegroundSyncUtil)sharedInstance;
- (MTForegroundSyncUtil)init;
- (NSDate)lastExpectedFeedsUpdateDate;
- (void)feedUpdateAllPodcastsOnForeground;
- (void)setLastExpectedFeedsUpdateDate:(id)a3;
- (void)setNeedsSyncing;
- (void)startCloudSyncAfterPrivacy;
- (void)syncEverythingIfNeeded;
- (void)updatePlaybackSettingIfNeeded;
@end

@implementation MTForegroundSyncUtil

+ (MTForegroundSyncUtil)sharedInstance
{
  if (qword_1002B4818 != -1) {
    swift_once(&qword_1002B4818, sub_10014B308);
  }
  return (MTForegroundSyncUtil *)(id)static ForegroundSyncUtil.shared;
}

- (void)setNeedsSyncing
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___MTForegroundSyncUtil_needsSyncing) = 1;
}

- (void)syncEverythingIfNeeded
{
  v2 = self;
  ForegroundSyncUtil.syncEverythingIfNeeded()();
}

- (NSDate)lastExpectedFeedsUpdateDate
{
  uint64_t v3 = type metadata accessor for Date(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  v7 = (char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate;
  swift_beginAccess(v7, v11, 0LL, 0LL);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)isa;
}

- (void)setLastExpectedFeedsUpdateDate:(id)a3
{
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate;
  swift_beginAccess((char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate, v13, 33LL, 0LL);
  v10 = *(void (**)(char *, _BYTE *, uint64_t))(v6 + 40);
  v11 = self;
  v10(v9, v8, v5);
  swift_endAccess(v13);
}

- (void)startCloudSyncAfterPrivacy
{
  v2 = self;
  ForegroundSyncUtil.startCloudSyncAfterPrivacy()();
}

- (void)feedUpdateAllPodcastsOnForeground
{
  v2 = self;
  ForegroundSyncUtil.feedUpdateAllPodcastsOnForeground()();
}

- (void)updatePlaybackSettingIfNeeded
{
  v2 = self;
  ForegroundSyncUtil.updatePlaybackSettingIfNeeded()();
}

- (MTForegroundSyncUtil)init
{
  return (MTForegroundSyncUtil *)ForegroundSyncUtil.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTForegroundSyncUtil_syncController));
  uint64_t v3 = (char *)self + OBJC_IVAR___MTForegroundSyncUtil_lastExpectedFeedsUpdateDate;
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end