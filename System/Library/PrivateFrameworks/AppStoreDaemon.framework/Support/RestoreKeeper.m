@interface RestoreKeeper
+ (BOOL)activeRestoreSupportEnabled;
+ (_TtC9appstored13RestoreKeeper)shared;
- (BOOL)hasRestoringCoordinatorForBundleID:(id)a3 logKey:(id)a4;
- (_TtC9appstored13RestoreKeeper)init;
- (id)installForBundleID:(id)a3;
- (id)restoringCoordinatorForBundleID:(id)a3 logKey:(id)a4;
- (void)displayDeleteActiveRestoreDialogWithBundleID:(id)a3 logKey:(id)a4 completion:(id)a5;
- (void)handleActiveRestoreWithCoordinator:(id)a3 userInitiated:(BOOL)a4 logKey:(id)a5;
@end

@implementation RestoreKeeper

+ (_TtC9appstored13RestoreKeeper)shared
{
  if (qword_100458038 != -1) {
    swift_once(&qword_100458038, sub_1000277A8);
  }
  return (_TtC9appstored13RestoreKeeper *)(id)qword_1004628C8;
}

+ (BOOL)activeRestoreSupportEnabled
{
  uint64_t v2 = type metadata accessor for FeatureFlag(0LL, a2);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v6 = (void *)objc_opt_self(&OBJC_CLASS___AMSDevice);
  if (([v6 deviceIsAppleTV] & 1) != 0
    || [v6 deviceIsAudioAccessory])
  {
    char v7 = 0;
  }

  else
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for FeatureFlag.activeRestore(_:), v2);
    char v7 = asd_isFeatureEnabled(_:)(v5);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  return v7 & 1;
}

- (void)displayDeleteActiveRestoreDialogWithBundleID:(id)a3 logKey:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v11 = v10;
  _Block_copy(v8);
  id v12 = a4;
  v13 = self;
  sub_100029B30(v9, v11, v12, (char *)v13, (void (**)(const void *, void *))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
}

- (void)handleActiveRestoreWithCoordinator:(id)a3 userInitiated:(BOOL)a4 logKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  sub_10002AA70(v8, a4, v9);
}

- (BOOL)hasRestoringCoordinatorForBundleID:(id)a3 logKey:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  LOBYTE(v6) = sub_10002B64C(v6, v8, v9);

  swift_bridgeObjectRelease(v8);
  return v6 & 1;
}

- (id)installForBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_10002A518(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (id)restoringCoordinatorForBundleID:(id)a3 logKey:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  uint64_t v11 = sub_10002B2B8(v6, v8, v9);

  swift_bridgeObjectRelease(v8);
  return v11;
}

- (_TtC9appstored13RestoreKeeper)init
{
  uint64_t v3 = OBJC_IVAR____TtC9appstored13RestoreKeeper_lockedRestores;
  uint64_t v4 = sub_1000079A0(&qword_100458EE8);
  uint64_t v5 = swift_allocObject(v4, 28LL, 7LL);
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = &_swiftEmptyDictionarySingleton;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v5;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RestoreKeeper();
  return -[RestoreKeeper init](&v7, "init");
}

- (void).cxx_destruct
{
}

@end