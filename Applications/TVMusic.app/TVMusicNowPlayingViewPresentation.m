@interface TVMusicNowPlayingViewPresentation
- (BOOL)alwaysHideContainerText;
- (BOOL)isRestMode;
- (BOOL)isShowingInfo;
- (BOOL)isShowingLyrics;
- (BOOL)isShowingVocalBufferingText;
- (BOOL)shouldShowCamera;
- (BOOL)shouldShowEffects;
- (BOOL)shouldShowLyrics;
- (NSString)containerText;
- (TVMusicNowPlayingViewPresentation)init;
- (TVMusicNowPlayingViewPresentationDelegate)delegate;
- (double)vaButtonOffset;
- (int64_t)style;
- (void)cameraControllerConnectionDidChange:(id)a3;
- (void)cameraControllerEnabledDidChange:(id)a3;
- (void)dealloc;
- (void)setAlwaysHideContainerText:(BOOL)a3;
- (void)setContainerText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsRestMode:(BOOL)a3;
- (void)setIsShowingInfo:(BOOL)a3;
- (void)setIsShowingLyrics:(BOOL)a3;
- (void)setIsShowingVocalBufferingText:(BOOL)a3;
- (void)setShouldShowCamera:(BOOL)a3;
- (void)setShouldShowEffects:(BOOL)a3;
- (void)setShouldShowLyrics:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setVaButtonOffset:(double)a3;
@end

@implementation TVMusicNowPlayingViewPresentation

- (TVMusicNowPlayingViewPresentationDelegate)delegate
{
  return (TVMusicNowPlayingViewPresentationDelegate *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)style
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EF9C0);
  uint64_t v4 = swift_getKeyPath(&unk_1001EF9E8);
  v5 = self;
  static Published.subscript.getter(&v7, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  return v7;
}

- (void)setStyle:(int64_t)a3
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EF9C0);
  uint64_t v6 = swift_getKeyPath(&unk_1001EF9E8);
  int64_t v8 = a3;
  int64_t v7 = self;
  static Published.subscript.setter(&v8, v7, KeyPath, v6);
  sub_10019A86C();
}

- (BOOL)isShowingLyrics
{
  return sub_10019B358(self, (uint64_t)a2, (uint64_t)&unk_1001EFA08, (uint64_t)&unk_1001EFA30);
}

- (void)setIsShowingLyrics:(BOOL)a3
{
}

- (BOOL)shouldShowLyrics
{
  return sub_10019B358(self, (uint64_t)a2, (uint64_t)&unk_1001EF298, (uint64_t)&unk_1001EF2C0);
}

- (void)setShouldShowLyrics:(BOOL)a3
{
}

- (BOOL)shouldShowCamera
{
  return sub_10019B358(self, (uint64_t)a2, (uint64_t)&unk_1001EF208, (uint64_t)&unk_1001EF230);
}

- (void)setShouldShowCamera:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10019ABA0(a3);
}

- (BOOL)shouldShowEffects
{
  return sub_10019B358(self, (uint64_t)a2, (uint64_t)&unk_1001EFA58, (uint64_t)&unk_1001EFA80);
}

- (void)setShouldShowEffects:(BOOL)a3
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EFA58);
  uint64_t v6 = swift_getKeyPath(&unk_1001EFA80);
  int64_t v7 = self;
  static Published.subscript.getter(&v12, v7, KeyPath, v6);
  swift_release(KeyPath);
  swift_release(v6);
  LOBYTE(KeyPath) = v12;
  uint64_t v8 = swift_getKeyPath(&unk_1001EFA58);
  uint64_t v9 = swift_getKeyPath(&unk_1001EFA80);
  BOOL v11 = a3;
  v10 = v7;
  static Published.subscript.setter(&v11, v10, v8, v9);
  sub_10019ACB4(KeyPath);
}

- (BOOL)isRestMode
{
  return sub_10019B358(self, (uint64_t)a2, (uint64_t)&unk_1001EF370, (uint64_t)&unk_1001EF398);
}

- (void)setIsRestMode:(BOOL)a3
{
}

- (BOOL)isShowingInfo
{
  return sub_10019B358(self, (uint64_t)a2, (uint64_t)&unk_1001EF448, (uint64_t)&unk_1001EF470);
}

- (void)setIsShowingInfo:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10019AF48(a3);
}

- (BOOL)alwaysHideContainerText
{
  return sub_10019B358(self, (uint64_t)a2, (uint64_t)&unk_1001EF978, (uint64_t)&unk_1001EF9A0);
}

- (void)setAlwaysHideContainerText:(BOOL)a3
{
}

- (NSString)containerText
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EF930);
  uint64_t v4 = swift_getKeyPath(&unk_1001EF958);
  v5 = self;
  static Published.subscript.getter(&v9, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  uint64_t v6 = v10;
  if (!v10) {
    return (NSString *)0LL;
  }
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (void)setContainerText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  uint64_t KeyPath = swift_getKeyPath(&unk_1001EF930);
  uint64_t v8 = swift_getKeyPath(&unk_1001EF958);
  v9[0] = v4;
  v9[1] = v6;
  static Published.subscript.setter(v9, self, KeyPath, v8);
}

- (BOOL)isShowingVocalBufferingText
{
  return sub_10019B358(self, (uint64_t)a2, (uint64_t)&unk_1001EF2E0, (uint64_t)&unk_1001EF308);
}

- (void)setIsShowingVocalBufferingText:(BOOL)a3
{
}

- (double)vaButtonOffset
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EF250);
  uint64_t v4 = swift_getKeyPath(&unk_1001EF278);
  uint64_t v5 = self;
  static Published.subscript.getter(&v7, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  return v7;
}

- (void)setVaButtonOffset:(double)a3
{
  uint64_t KeyPath = swift_getKeyPath(&unk_1001EF250);
  uint64_t v6 = swift_getKeyPath(&unk_1001EF278);
  double v7 = a3;
  static Published.subscript.setter(&v7, self, KeyPath, v6);
}

- (TVMusicNowPlayingViewPresentation)init
{
  return (TVMusicNowPlayingViewPresentation *)sub_10019BA5C();
}

- (void)dealloc
{
  v2 = self;
  sub_10019C0C0();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__style;
  uint64_t v4 = sub_1000DFE10(&qword_1002BDEF8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__isShowingLyrics;
  uint64_t v6 = sub_1000DFE10(&qword_1002BA170);
  double v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__shouldShowLyrics, v6);
  v7((char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__shouldShowCamera, v6);
  v7((char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__shouldShowEffects, v6);
  v7((char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__isRestMode, v6);
  v7((char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__isShowingInfo, v6);
  v7((char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__alwaysHideContainerText, v6);
  uint64_t v8 = (char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__containerText;
  uint64_t v9 = sub_1000DFE10(&qword_1002BDEE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  v7((char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__isShowingVocalBufferingText, v6);
  uint64_t v10 = (char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__vaButtonOffset;
  uint64_t v11 = sub_1000DFE10(&qword_1002BDA78);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8LL))(v10, v11);
  uint64_t v12 = (char *)self + OBJC_IVAR___TVMusicNowPlayingViewPresentation__vocalControlState;
  uint64_t v13 = sub_1000DFE10(&qword_1002BDA90);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8LL))(v12, v13);
}

- (void)cameraControllerConnectionDidChange:(id)a3
{
  uint64_t v5 = sub_1000DFE10(&qword_1002BB500);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v8, 1LL, 1LL, v9);
  type metadata accessor for MainActor(0LL);
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = v10;
  uint64_t v13 = v11;
  uint64_t v14 = static MainActor.shared.getter(v13);
  v15 = (void *)swift_allocObject(&unk_100277E40, 48LL, 7LL);
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v12;
  v15[5] = v13;
  uint64_t v16 = sub_100125950((uint64_t)v8, (uint64_t)&unk_1002BDED8, (uint64_t)v15);

  swift_release(v16);
}

- (void)cameraControllerEnabledDidChange:(id)a3
{
  uint64_t v5 = sub_1000DFE10(&qword_1002BB500);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v8, 1LL, 1LL, v9);
  type metadata accessor for MainActor(0LL);
  id v10 = self;
  id v11 = a3;
  uint64_t v12 = static MainActor.shared.getter(v11);
  uint64_t v13 = (void *)swift_allocObject(&unk_100277E18, 40LL, 7LL);
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v10;
  uint64_t v14 = sub_100125950((uint64_t)v8, (uint64_t)&unk_1002BDEC8, (uint64_t)v13);

  swift_release(v14);
}

@end