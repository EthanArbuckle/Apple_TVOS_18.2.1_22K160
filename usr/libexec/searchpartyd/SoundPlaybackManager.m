@interface SoundPlaybackManager
- (_TtC12searchpartyd20SoundPlaybackManager)init;
- (uint64_t)findMyAccessoryManager:(uint64_t)a3 didSetObfuscatedIdentifierOnDevice:(uint64_t)a4 withError:;
- (uint64_t)findMyAccessoryManager:(void *)a3 didFetchFirmwareVersion:(void *)a4 fromDevice:(void *)a5 withError:(void *)a6;
- (void)findMyAccessoryManager:(id)a3 didCompletePlayingSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didCompletePlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4;
- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didFetchBatteryStatus:(unint64_t)a4 forDevice:(id)a5 withError:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didFetchUserStats:(id)a4 fromDevice:(id)a5 withError:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didStartPlayingSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didStartPlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didStopPlayingSoundOnDevice:(id)a4 withError:(id)a5;
@end

@implementation SoundPlaybackManager

- (void)findMyAccessoryManager:(id)a3 didStartPlayingSoundOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didStartPlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didCompletePlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didCompletePlayingSoundOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didStopPlayingSoundOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didFetchUserStats:(id)a4 fromDevice:(id)a5 withError:(id)a6
{
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  v18 = self;
  if (a4)
  {
    id v19 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    unint64_t v21 = v20;
  }

  else
  {
    unint64_t v21 = 0xF000000000000000LL;
  }

  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);

  sub_1000182F0((uint64_t)a4, v21);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  uint64_t v6 = sub_100004AEC(&qword_10099D8A0);
  __chkstk_darwin(v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v9 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v8, 0LL, 1LL, v9);
  }

  else
  {
    uint64_t v10 = type metadata accessor for UUID(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v8, 1LL, 1LL, v10);
  }

  sub_100015794((uint64_t)v8, &qword_10099D8A0);
}

- (void)findMyAccessoryManager:(id)a3 didFetchBatteryStatus:(unint64_t)a4 forDevice:(id)a5 withError:(id)a6
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (uint64_t)findMyAccessoryManager:(uint64_t)a3 didSetObfuscatedIdentifierOnDevice:(uint64_t)a4 withError:
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (uint64_t)findMyAccessoryManager:(void *)a3 didFetchFirmwareVersion:(void *)a4 fromDevice:(void *)a5 withError:(void *)a6
{
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a1;
  id v19 = a6;
  uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v22 = v21;

  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v17);
  sub_100016F9C(v20, v22);

  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (_TtC12searchpartyd20SoundPlaybackManager)init
{
  result = (_TtC12searchpartyd20SoundPlaybackManager *)_swift_stdlib_reportUnimplementedInitializer( "searchpartyd.SoundPlaybackManager",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd20SoundPlaybackManager_findMyCommandManager));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12searchpartyd20SoundPlaybackManager____lazy_storage___commandManager));
}

@end