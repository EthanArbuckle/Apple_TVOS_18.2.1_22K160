@interface UpdatesManager_Swift
+ (_TtC9appstored20UpdatesManager_Swift)shared;
- (_TtC9appstored20UpdatesManager_Swift)init;
- (void)autoUpdateEnabled:(id)a3;
- (void)confirmAgentRequestedUpdateAll:(id)a3;
- (void)dropAllUpdatesIncludingVPP:(BOOL)a3;
- (void)getManagedUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4;
- (void)getUpdateMetadataForBundleID:(NSString *)a3 replyHandler:(id)a4;
- (void)getUpdatesWithContext:(id)a3;
- (void)getUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4;
- (void)handleAccountChangeNotification;
- (void)hidePendingUpdatesBadge;
- (void)isTVProviderApp:(int64_t)a3 withReplyHandler:(id)a4;
- (void)noteUpdatesStateChanged:(id)a3 logKey:(id)a4;
- (void)performBackgroundSoftwareUpdateCheck;
- (void)postProcessBackgroundUpdateMetrics;
- (void)refreshUpdateCountWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4;
- (void)refreshUpdateForApp:(int64_t)a3 token:(XPCRequestToken *)a4 replyHandler:(id)a5;
- (void)reloadApplicationBadgeWithReason:(id)a3;
- (void)reloadFromServerInBackgroundWithToken:(XPCRequestToken *)a3 completionBlock:(id)a4;
- (void)reloadFromServerWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4;
- (void)reloadManagedUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4;
- (void)reloadUpdatesWithContext:(id)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4;
- (void)setupFollowingMigration;
- (void)showPendingUpdatesBadge;
- (void)updateAllWithOrder:(NSArray *)a3 requestToken:(XPCRequestToken *)a4 replyHandler:(id)a5;
- (void)verifyAllPendingUpdates;
@end

@implementation UpdatesManager_Swift

+ (_TtC9appstored20UpdatesManager_Swift)shared
{
  if (qword_100458058 != -1) {
    swift_once(&qword_100458058, sub_100038A24);
  }
  return (_TtC9appstored20UpdatesManager_Swift *)(id)swift_retain(qword_1004628F8);
}

- (_TtC9appstored20UpdatesManager_Swift)init
{
  return (_TtC9appstored20UpdatesManager_Swift *)sub_100038F00();
}

- (void)autoUpdateEnabled:(id)a3
{
  uint64_t v5 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1003DEC08, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1003DEC30, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_100459748;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1003DEC58, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100459750;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_100083C10((uint64_t)v7, (uint64_t)&unk_100459758, (uint64_t)v12);
  swift_release(v13);
}

- (void)confirmAgentRequestedUpdateAll:(id)a3
{
  uint64_t v5 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1003DEB90, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1003DEBB8, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_100459728;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1003DEBE0, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100459730;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_100083C10((uint64_t)v7, (uint64_t)&unk_100459738, (uint64_t)v12);
  swift_release(v13);
}

- (void)dropAllUpdatesIncludingVPP:(BOOL)a3
{
}

- (void)getUpdatesWithContext:(id)a3
{
}

- (void)hidePendingUpdatesBadge
{
}

- (void)isTVProviderApp:(int64_t)a3 withReplyHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1003DE988, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1003DE9B0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1004596F8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1003DE9D8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100459700;
  v14[5] = v13;
  swift_retain(self);
  uint64_t v15 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_100459708, (uint64_t)v14);
  swift_release(v15);
}

- (void)getManagedUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1003DE910, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1003DE938, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1004596D8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1003DE960, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1004596E0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain(self);
  uint64_t v16 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_1004596E8, (uint64_t)v14);
  swift_release(v16);
}

- (void)noteUpdatesStateChanged:(id)a3 logKey:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v12 = v11;
  id v13 = objc_allocWithZone((Class)type metadata accessor for UpdatesContext());
  id v14 = a4;
  swift_retain(self);
  id v15 = sub_10006D4CC(0LL, 0LL, a4, 0LL, 0LL, 0, 0, 0, 0LL, 1);

  uint64_t v16 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v9, 1LL, 1LL, v16);
  uint64_t v17 = (void *)swift_allocObject(&unk_1003DE8E8, 64LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = self;
  v17[5] = v15;
  v17[6] = v10;
  v17[7] = v12;
  swift_retain(self);
  swift_bridgeObjectRetain(v12);
  uint64_t v18 = sub_10004DA7C((uint64_t)v9, (uint64_t)&unk_1004596C8, (uint64_t)v17);
  swift_release(v18);
  swift_bridgeObjectRelease(v12);
  swift_release(self);
}

- (void)performBackgroundSoftwareUpdateCheck
{
}

- (void)postProcessBackgroundUpdateMetrics
{
  uint64_t v3 = type metadata accessor for Date(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___AppDefaultsManager);
  uint64_t v8 = swift_retain(self);
  Date.init()(v8);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1002FA2E0(v7, isa);
  swift_release(self);
}

- (void)refreshUpdateCountWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1003DE870, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  id v13 = (void *)swift_allocObject(&unk_1003DE898, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1004596A8;
  v13[5] = v11;
  id v14 = (void *)swift_allocObject(&unk_1003DE8C0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1004596B0;
  v14[5] = v13;
  id v15 = a3;
  swift_retain(self);
  uint64_t v16 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_1004596B8, (uint64_t)v14);
  swift_release(v16);
}

- (void)refreshUpdateForApp:(int64_t)a3 token:(XPCRequestToken *)a4 replyHandler:(id)a5
{
  uint64_t v9 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject(&unk_1003DE7D0, 48LL, 7LL);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  id v15 = (void *)swift_allocObject(&unk_1003DE7F8, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_100459670;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject(&unk_1003DE820, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_100459678;
  v16[5] = v15;
  uint64_t v17 = a4;
  swift_retain(self);
  uint64_t v18 = sub_100083C10((uint64_t)v11, (uint64_t)&unk_100459680, (uint64_t)v16);
  swift_release(v18);
}

- (void)reloadApplicationBadgeWithReason:(id)a3
{
  uint64_t v5 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v7, 1LL, 1LL, v11);
  uint64_t v12 = (void *)swift_allocObject(&unk_1003DE7A8, 56LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = self;
  v12[5] = v8;
  v12[6] = v10;
  swift_retain_n(self, 2LL);
  swift_bridgeObjectRetain(v10);
  uint64_t v13 = sub_10004DA9C((uint64_t)v7, (uint64_t)&unk_100459660, (uint64_t)v12);
  swift_release(v13);
  swift_bridgeObjectRelease(v10);
  swift_release(self);
}

- (void)reloadFromServerWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1003DE730, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1003DE758, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100459640;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1003DE780, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100459648;
  v14[5] = v13;
  id v15 = a3;
  swift_retain(self);
  uint64_t v16 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_100459650, (uint64_t)v14);
  swift_release(v16);
}

- (void)reloadFromServerInBackgroundWithToken:(XPCRequestToken *)a3 completionBlock:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1003DE6B8, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1003DE6E0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100459620;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1003DE708, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100459628;
  v14[5] = v13;
  id v15 = a3;
  swift_retain(self);
  uint64_t v16 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_100459630, (uint64_t)v14);
  swift_release(v16);
}

- (void)reloadManagedUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1003DE640, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1003DE668, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100459600;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1003DE690, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_100459608;
  v14[5] = v13;
  id v15 = a3;
  swift_retain(self);
  uint64_t v16 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_100459610, (uint64_t)v14);
  swift_release(v16);
}

- (void)reloadUpdatesWithContext:(id)a3
{
}

- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_1003DE5A0, 40LL, 7LL);
  *(_BYTE *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1003DE5C8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1004595D8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1003DE5F0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1004595E0;
  v14[5] = v13;
  swift_retain(self);
  uint64_t v15 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_1004595E8, (uint64_t)v14);
  swift_release(v15);
}

- (void)setupFollowingMigration
{
}

- (void)showPendingUpdatesBadge
{
}

- (void)updateAllWithOrder:(NSArray *)a3 requestToken:(XPCRequestToken *)a4 replyHandler:(id)a5
{
  uint64_t v9 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject(&unk_1003DE528, 48LL, 7LL);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  uint64_t v15 = (void *)swift_allocObject(&unk_1003DE550, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_1004595B8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject(&unk_1003DE578, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_1004595C0;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain(self);
  uint64_t v19 = sub_100083C10((uint64_t)v11, (uint64_t)&unk_1004595C8, (uint64_t)v16);
  swift_release(v19);
}

- (void)getUpdateMetadataForBundleID:(NSString *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1003DE4B0, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1003DE4D8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100459598;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1003DE500, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1004595A0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain(self);
  uint64_t v16 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_1004595A8, (uint64_t)v14);
  swift_release(v16);
}

- (void)getUpdatesWithRequestToken:(XPCRequestToken *)a3 replyHandler:(id)a4
{
  uint64_t v7 = sub_1000079A0(&qword_100458488);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1003DE438, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1003DE460, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100459570;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1003DE488, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1004584A0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain(self);
  uint64_t v16 = sub_100083C10((uint64_t)v9, (uint64_t)&unk_100459580, (uint64_t)v14);
  swift_release(v16);
}

- (void)verifyAllPendingUpdates
{
}

- (void)handleAccountChangeNotification
{
}

@end