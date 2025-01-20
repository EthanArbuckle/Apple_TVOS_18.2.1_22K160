@interface SiriQuickTypeGestureActivationManager
- (_TtC4Siri37SiriQuickTypeGestureActivationManager)init;
- (void)canActivateWithCompletionHandler:(id)a3;
- (void)cancelPrewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3;
- (void)prewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3;
@end

@implementation SiriQuickTypeGestureActivationManager

- (_TtC4Siri37SiriQuickTypeGestureActivationManager)init
{
  return (_TtC4Siri37SiriQuickTypeGestureActivationManager *)SiriQuickTypeGestureActivationManager.init()();
}

- (void)prewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10004A8E8(&qword_1000D93F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1000BB958, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1000BB980, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1000D9460;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1000BB9A8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1000D9468;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_100057E10((uint64_t)v7, (uint64_t)&unk_1000D9470, (uint64_t)v12);
  swift_release(v13);
}

- (void)cancelPrewarmForFirstTapOfQuickTypeToSiriGestureWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10004A8E8(&qword_1000D93F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1000BB8E0, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1000BB908, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1000D9440;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1000BB930, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1000D9448;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_100057E10((uint64_t)v7, (uint64_t)&unk_1000D9450, (uint64_t)v12);
  swift_release(v13);
}

- (void)canActivateWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10004A8E8(&qword_1000D93F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1000BB840, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1000BB868, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1000D9400;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1000BB890, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1000D9410;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_100057E10((uint64_t)v7, (uint64_t)&unk_1000D9420, (uint64_t)v12);
  swift_release(v13);
}

@end