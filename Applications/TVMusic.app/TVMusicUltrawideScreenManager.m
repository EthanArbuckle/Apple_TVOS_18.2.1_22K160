@interface TVMusicUltrawideScreenManager
- (TVMusicUltrawideScreenManager)init;
- (TVMusicUltrawideScreenManager)initWithUltrawideStateChangeCompletion:(id)a3;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)viewDidAppear:(id)a3;
- (void)viewWillDisappear:(id)a3;
- (void)willDeallocView;
@end

@implementation TVMusicUltrawideScreenManager

- (TVMusicUltrawideScreenManager)initWithUltrawideStateChangeCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_100278998, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_1001B2178;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicUltrawideScreenManager_ultrawideFullscreenAssertion) = 0LL;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TVMusicUltrawideScreenManager_ultrawideStateChangeCompletion);
  void *v6 = v4;
  v6[1] = v5;
  v7 = self;
  sub_10011418C((uint64_t)v4, v5);
  sub_1000E03F0(0LL, 0LL);
  *((_BYTE *)&v7->super.isa + OBJC_IVAR___TVMusicUltrawideScreenManager_isCurrentlyUltrawide) = 0;

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for UltrawideScreenManager();
  v8 = -[TVMusicUltrawideScreenManager init](&v10, "init");
  sub_1000E03F0((uint64_t)v4, v5);
  return v8;
}

- (void)viewDidAppear:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001B19DC(v4);
  sub_1001B1B9C(v4);
}

- (void)viewWillDisappear:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001B17D0(v4);
}

- (void)willDeallocView
{
  v2 = self;
  sub_1001B18F0();
}

- (TVMusicUltrawideScreenManager)init
{
  result = (TVMusicUltrawideScreenManager *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.UltrawideScreenManager",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___TVMusicUltrawideScreenManager_ultrawideFullscreenAssertion));
  sub_1000E03F0( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TVMusicUltrawideScreenManager_ultrawideStateChangeCompletion),  *(void *)&self->ultrawideFullscreenAssertion[OBJC_IVAR___TVMusicUltrawideScreenManager_ultrawideStateChangeCompletion]);
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = self;
  sub_1001B1FC8(a4);
}

@end