@interface TVMusicMotionAudioSessionManager
+ (NSString)invalidatedSessionNotification;
+ (_TtC7TVMusic32TVMusicMotionAudioSessionManager)sharedManager;
- (_TtC7TVMusic32TVMusicMotionAudioSessionManager)init;
- (void)createSessionIfNeeded;
- (void)getSession:(id)a3;
- (void)mediaServicesWereReset;
@end

@implementation TVMusicMotionAudioSessionManager

+ (_TtC7TVMusic32TVMusicMotionAudioSessionManager)sharedManager
{
  if (qword_1002B71B0 != -1) {
    swift_once(&qword_1002B71B0, sub_10012413C);
  }
  return (_TtC7TVMusic32TVMusicMotionAudioSessionManager *)(id)swift_retain(qword_1002C5E38);
}

+ (NSString)invalidatedSessionNotification
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC7TVMusic32TVMusicMotionAudioSessionManager)init
{
  return (_TtC7TVMusic32TVMusicMotionAudioSessionManager *)sub_100124218();
}

- (void)createSessionIfNeeded
{
}

- (void)getSession:(id)a3
{
  uint64_t v5 = sub_1000DFE10(&qword_1002BB500);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject(&unk_100273108, 24LL, 7LL);
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 1LL, 1LL, v11);
  v12 = (void *)swift_allocObject(&unk_100273130, 56LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = self;
  v12[5] = sub_1001137D0;
  v12[6] = v10;
  swift_retain_n(self, 2LL);
  swift_retain(v10);
  uint64_t v13 = sub_100125950((uint64_t)v8, (uint64_t)&unk_1002BA710, (uint64_t)v12);
  swift_release(self);
  swift_release(v10);
  swift_release(v13);
}

- (void)mediaServicesWereReset
{
}

@end