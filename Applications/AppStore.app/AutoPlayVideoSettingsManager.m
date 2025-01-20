@interface AutoPlayVideoSettingsManager
- (BOOL)isAutoPlayAllowed;
- (BOOL)isVideoAudioEnabled;
- (_TtC8AppStore28AutoPlayVideoSettingsManager)init;
- (void)dealloc;
- (void)restoreFullScreenAudioSettings;
- (void)saveFullScreenAudioSettings;
- (void)updateAutoPlayVideoSettings;
@end

@implementation AutoPlayVideoSettingsManager

- (_TtC8AppStore28AutoPlayVideoSettingsManager)init
{
  return (_TtC8AppStore28AutoPlayVideoSettingsManager *)sub_100122E18();
}

- (void)dealloc
{
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore28AutoPlayVideoSettingsManager_networkObservation;
  swift_beginAccess( (char *)self + OBJC_IVAR____TtC8AppStore28AutoPlayVideoSettingsManager_networkObservation,  v13,  0LL,  0LL);
  if (*((void *)v3 + 3))
  {
    sub_100011C30((uint64_t)v3, (uint64_t)v9);
    uint64_t v4 = v10;
    uint64_t v5 = v11;
    sub_1000112B0(v9, v10);
    v6 = self;
    dispatch thunk of NetworkObservation.invalidate()(v4, v5);
    _s8AppStore17PillOverlayLayoutVwxx_0(v9);
  }

  else
  {
    v7 = self;
  }

  v8 = (objc_class *)type metadata accessor for AutoPlayVideoSettingsManager();
  v12.receiver = self;
  v12.super_class = v8;
  -[AutoPlayVideoSettingsManager dealloc](&v12, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8AppStore28AutoPlayVideoSettingsManager_autoPlayUserSetting));
  _s8AppStore17PillOverlayLayoutVwxx_0((Class *)((char *)&self->super.isa
                                               + OBJC_IVAR____TtC8AppStore28AutoPlayVideoSettingsManager_networkInquiry));
  sub_1000077E0( (uint64_t)self + OBJC_IVAR____TtC8AppStore28AutoPlayVideoSettingsManager_networkObservation,  &qword_1002EAC78);
}

- (void)updateAutoPlayVideoSettings
{
  v2 = self;
  sub_100123654();
}

- (BOOL)isAutoPlayAllowed
{
  v2 = self;
  char v3 = sub_100122844();

  return v3 & 1;
}

- (BOOL)isVideoAudioEnabled
{
  return 0;
}

- (void)restoreFullScreenAudioSettings
{
  uint64_t v0 = sub_1000038E8(&qword_1002E58E8);
  __chkstk_darwin(v0);
  v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for Date(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  v9 = (char *)&v21 - v8;
  __chkstk_darwin(v10);
  objc_super v12 = (char *)&v21 - v11;
  id v13 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  sub_10008435C((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1LL, v3) == 1)
  {
    sub_1000077E0((uint64_t)v2, &qword_1002E58E8);
    NSString v14 = String._bridgeToObjectiveC()();
    [v13 setBool:0 forKey:v14];
  }

  else
  {
    uint64_t v15 = (*(uint64_t (**)(char *, char *, uint64_t))(v4 + 32))(v12, v2, v3);
    uint64_t v16 = Date.addingTimeInterval(_:)(v15, 480.0);
    Date.init()(v16);
    uint64_t v17 = sub_100004288( &qword_1002EAC70,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    char v18 = dispatch thunk of static Comparable.< infix(_:_:)(v9, v6, v3, v17);
    v19 = *(void (**)(char *, uint64_t))(v4 + 8);
    v19(v6, v3);
    NSString v20 = String._bridgeToObjectiveC()();
    [v13 setBool:(v18 & 1) == 0 forKey:v20];

    v19(v9, v3);
    v19(v12, v3);
  }

- (void)saveFullScreenAudioSettings
{
  uint64_t v0 = sub_1000038E8(&qword_1002E58E8);
  __chkstk_darwin(v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v3 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  id v4 = sub_100084394();
  if ((v4 & 1) != 0)
  {
    Date.init()(v4);
    uint64_t v5 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))(v2, 0LL, 1LL, v5);
  }

  else
  {
    uint64_t v6 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v2, 1LL, 1LL, v6);
  }

  sub_100084378((uint64_t)v2);
}

@end