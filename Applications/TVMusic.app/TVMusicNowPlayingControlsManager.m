@interface TVMusicNowPlayingControlsManager
- (TVMusicMPSongMediaItem)currentMediaItem;
- (TVMusicNowPlayingControlsManager)init;
- (TVMusicNowPlayingControlsManager)initWithUpdateHandler:(id)a3;
- (void)resultInvalidated;
- (void)setCurrentMediaItem:(id)a3;
@end

@implementation TVMusicNowPlayingControlsManager

- (TVMusicNowPlayingControlsManager)initWithUpdateHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject(&unk_1002734D8, 24LL, 7LL);
  *(void *)(v4 + 16) = v3;
  return (TVMusicNowPlayingControlsManager *)sub_10012A7F8((uint64_t)sub_10012B7D8, v4);
}

- (TVMusicMPSongMediaItem)currentMediaItem
{
  return (TVMusicMPSongMediaItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___TVMusicNowPlayingControlsManager_currentMediaItem));
}

- (void)setCurrentMediaItem:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingControlsManager_currentMediaItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicNowPlayingControlsManager_currentMediaItem) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_10012AA54(v4);
}

- (void)resultInvalidated
{
  v2 = self;
  sub_10012AE38();
}

- (TVMusicNowPlayingControlsManager)init
{
  result = (TVMusicNowPlayingControlsManager *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.NowPlayingControlsManager",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end