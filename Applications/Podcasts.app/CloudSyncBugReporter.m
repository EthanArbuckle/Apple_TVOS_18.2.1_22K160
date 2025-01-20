@interface CloudSyncBugReporter
- (_TtC8Podcasts20CloudSyncBugReporter)init;
- (void)report:(int64_t)a3 userInfo:(id)a4;
- (void)reportBookmarksSyncIssue:(int64_t)a3 bookmarksSyncType:(int64_t)a4 version:(id)a5 userInfo:(id)a6;
- (void)reportInterestSyncIssue:(int64_t)a3 version:(id)a4 userInfo:(id)a5;
- (void)reportNonFollowedShowsSyncIssue:(int64_t)a3 version:(id)a4 userInfo:(id)a5;
- (void)reportSubscriptionsSyncIssue:(int64_t)a3 subscriptionSyncType:(int64_t)a4 version:(id)a5 userInfo:(id)a6;
- (void)reportSyncAuthenticationErrorFor:(id)a3 error:(id)a4;
@end

@implementation CloudSyncBugReporter

- (void)report:(int64_t)a3 userInfo:(id)a4
{
  if (a4) {
    unint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    unint64_t v6 = 0LL;
  }
  v7 = self;
  sub_10015968C(a3, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)reportNonFollowedShowsSyncIssue:(int64_t)a3 version:(id)a4 userInfo:(id)a5
{
}

- (void)reportInterestSyncIssue:(int64_t)a3 version:(id)a4 userInfo:(id)a5
{
}

- (void)reportSubscriptionsSyncIssue:(int64_t)a3 subscriptionSyncType:(int64_t)a4 version:(id)a5 userInfo:(id)a6
{
  id v6 = a6;
  if (a5)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    unint64_t v12 = v11;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v10 = 0LL;
  unint64_t v12 = 0LL;
  if (a6) {
LABEL_3:
  }
    id v6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v6,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
LABEL_4:
  v13 = self;
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v12);
}

- (void)reportBookmarksSyncIssue:(int64_t)a3 bookmarksSyncType:(int64_t)a4 version:(id)a5 userInfo:(id)a6
{
  id v6 = a6;
  if (a5)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    unint64_t v11 = v10;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v9 = 0LL;
  unint64_t v11 = 0LL;
  if (a6) {
LABEL_3:
  }
    id v6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v6,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
LABEL_4:
  if (a4)
  {
    if (a4 != 1)
    {
      v14 = self;
      goto LABEL_12;
    }

    unint64_t v12 = 3LL;
  }

  else
  {
    unint64_t v12 = 2LL;
  }

  v13 = self;
  sub_100159990(a3, v12, v9, v11, (unint64_t)v6);
LABEL_12:
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v11);
}

- (void)reportSyncAuthenticationErrorFor:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10015A128(v6, v7);
}

- (_TtC8Podcasts20CloudSyncBugReporter)init
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts20CloudSyncBugReporter_bugReporter);
  v5 = (void *)objc_opt_self(&OBJC_CLASS___PFAutoBugCaptureBugReporter);
  id v6 = self;
  id v7 = [v5 sharedInstance];
  v4[3] = sub_10015AA14();
  v4[4] = &protocol witness table for PFAutoBugCaptureBugReporter;
  void *v4 = v7;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return -[CloudSyncBugReporter init](&v9, "init");
}

- (void).cxx_destruct
{
}

@end