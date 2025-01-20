@interface TVMNowPlayingMotionArtwork
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPlay;
- (NSString)uniqueIdentifier;
- (TVMNowPlayingMotionArtwork)init;
- (TVMNowPlayingMotionArtwork)initWithMediaItem:(id)a3;
- (id)copy;
- (void)dealloc;
- (void)reclamationController:(id)a3 didReclaimObjectsWithEvent:(id)a4;
- (void)setShouldPlay:(BOOL)a3;
@end

@implementation TVMNowPlayingMotionArtwork

- (NSString)uniqueIdentifier
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMNowPlayingMotionArtwork_mediaItem);
  v3 = self;
  id v4 = [v2 uniqueIdentifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (BOOL)shouldPlay
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TVMNowPlayingMotionArtwork_shouldPlay);
}

- (void)setShouldPlay:(BOOL)a3
{
  id v4 = self;
  sub_1000DA1A8(a3);
}

- (TVMNowPlayingMotionArtwork)initWithMediaItem:(id)a3
{
  id v5 = objc_allocWithZone((Class)swift_getObjectType(self));
  uint64_t v6 = sub_1000DA5AC(a3, 0LL, 0LL);
  uint64_t ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance( self,  ObjectType,  *(unsigned int *)((swift_isaMask & (uint64_t)self->super.isa) + 0x30),  *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.isa) + 0x34));
  return (TVMNowPlayingMotionArtwork *)v6;
}

- (void)dealloc
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TVMNowPlayingMotionArtwork_loadingTask);
  id v5 = self;
  if (v4)
  {
    swift_retain(v4);
    Task.cancel()();
    swift_release(v4);
  }

  v6.receiver = self;
  v6.super_class = ObjectType;
  -[TVMNowPlayingMotionArtwork dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___TVMNowPlayingMotionArtwork_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___TVMNowPlayingMotionArtwork_applicationWillResignActiveSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___TVMNowPlayingMotionArtwork_applicationDidBecomeActiveSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___TVMNowPlayingMotionArtwork_didInvalidateSessionSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___TVMNowPlayingMotionArtwork_reduceMotionStatusDidChangeSubscription));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___TVMNowPlayingMotionArtwork_resourceReclaimedObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___TVMNowPlayingMotionArtwork_applicationSuspendedNotification));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMNowPlayingMotionArtwork_loadingTask));
  id v5 = (char *)self + OBJC_IVAR___TVMNowPlayingMotionArtwork__keyframeArtworkToken;
  uint64_t v6 = sub_1000DFE10(&qword_1002B7818);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  sub_1000DFF10( *(void **)((char *)&self->super.isa + OBJC_IVAR___TVMNowPlayingMotionArtwork_current),  *(void **)&self->mediaItem[OBJC_IVAR___TVMNowPlayingMotionArtwork_current]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___TVMNowPlayingMotionArtwork_updatedScriptedLooperHandlers));
}

- (id)copy
{
  v2 = self;
  sub_1000DD7B4(v7);

  uint64_t v3 = v8;
  uint64_t v4 = sub_1000E0518(v7, v8);
  id v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  sub_1000E053C(v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v9, 0, sizeof(v9));
    uint64_t v6 = self;
  }

  char v7 = sub_1000DDA3C((uint64_t)v9);

  sub_1000E03B4((uint64_t)v9, &qword_1002B7850);
  return v7 & 1;
}

- (TVMNowPlayingMotionArtwork)init
{
  result = (TVMNowPlayingMotionArtwork *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.NowPlayingMotionArtwork",  31LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)reclamationController:(id)a3 didReclaimObjectsWithEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1000DFDAC(v7);
}

@end