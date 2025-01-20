@interface SRCarPlayPresentation
- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)shouldAllowTouchPassThrough;
- (BOOL)shouldProceedToNextCommandAtSpeechSynthesisEnd;
- (BOOL)shouldResumeInterruptedAudioPlayback;
- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3;
- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates;
- (SRCarPlayPresentation)init;
- (SRCarPlayPresentation)initWithDelegate:(id)a3 dataSource:(id)a4;
- (SRCarPlayPresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6;
- (SiriUIPresentationDataSource)dataSource;
- (SiriUIPresentationDelegate)delegate;
- (id)viewController;
- (int64_t)options;
- (void)autodismiss;
- (void)configureForRequestOptions:(id)a3;
- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4;
- (void)dealloc;
- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4;
- (void)handleRequestToCeaseAttending;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)siriDidDeactivateWithCompletion:(id)a3;
- (void)siriDidOpenURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5;
- (void)siriDidStartSpeakingWithIdentifier:(id)a3;
- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4;
- (void)siriDidUpdateASRWithRecognition:(id)a3;
- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4;
- (void)siriRequestWillStartWithRequestOptions:(id)a3;
- (void)siriWillBePresented:(int64_t)a3;
@end

@implementation SRCarPlayPresentation

- (SiriUIPresentationDelegate)delegate
{
  return (SiriUIPresentationDelegate *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR___SRCarPlayPresentation_delegate,  a2);
}

- (void)setDelegate:(id)a3
{
}

- (SiriUIPresentationDataSource)dataSource
{
  return (SiriUIPresentationDataSource *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR___SRCarPlayPresentation_dataSource,  a2);
}

- (void)setDataSource:(id)a3
{
}

- (SRCarPlayPresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  return (SRCarPlayPresentation *)sub_10004E6A8((uint64_t)a3, (uint64_t)a4, v6);
}

- (SRCarPlayPresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  v11 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  void *v11 = 0LL;
  v11[1] = 0LL;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_siriIsIdleAndQuiet) = 2;
  id v12 = a4;
  swift_unknownObjectRetain(a5);
  swift_unknownObjectRetain(a6);

  result = (SRCarPlayPresentation *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0x6C706D6920746F4ELL,  0xEF6465746E656D65LL,  "Siri/SRCarPlayPresentation.swift",  32LL,  2LL,  56LL,  0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  v3 = (void *)objc_opt_self(&OBJC_CLASS___NSObject);
  v4 = self;
  [v3 cancelPreviousPerformRequestsWithTarget:v4];
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for SRCarPlayPresentation();
  -[SRCarPlayPresentation dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
}

- (void)autodismiss
{
  v2 = self;
  sub_10004EAC0();
}

- (SRCarPlayPresentation)init
{
  result = (SRCarPlayPresentation *)_swift_stdlib_reportUnimplementedInitializer( "Siri.SRCarPlayPresentation",  26LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_10004FE98(a3, a4);
}

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1000504F4((uint64_t)a3);

  return 1;
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  return 0;
}

- (int64_t)options
{
  return 2LL;
}

- (BOOL)shouldProceedToNextCommandAtSpeechSynthesisEnd
{
  v2 = self;
  sub_10005063C();
  char v4 = v3;

  return v4 & 1;
}

- (BOOL)shouldAllowTouchPassThrough
{
  return 0;
}

- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates
{
  return 1;
}

- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_siriIsIdleAndQuiet) = a3;
  id v5 = self;
  sub_100050718(a3);
}

- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100050B1C(v6, a4);
}

- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  if (a3) {
    return *((_BYTE *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_shouldResumeMediaOnIdle);
  }
  else {
    return 1;
  }
}

- (BOOL)shouldResumeInterruptedAudioPlayback
{
  return 1;
}

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  char v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject(&unk_1000BB6F0, 24LL, 7LL);
    *(void *)(v6 + 16) = v5;
    id v7 = sub_10005324C;
  }

  else
  {
    id v7 = 0LL;
    uint64_t v6 = 0LL;
  }

  id v8 = self;
  sub_100050E38((void (*)(void))v7);
  sub_100053218((uint64_t)v7, v6);
}

- (void)siriWillBePresented:(int64_t)a3
{
  char v4 = self;
  sub_100050F7C(a3);
}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = v7;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v8 = 0LL;
  }

  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (v9)
  {
    uint64_t v10 = self;
    id v11 = v9;
    sub_100060A98(v6, v8, a4);

    swift_bridgeObjectRelease(v8);
  }

  else
  {
    __break(1u);
  }

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1000512D4(a3);
}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
}

- (void)siriDidOpenURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5
{
  uint64_t v8 = sub_10004A8E8((uint64_t *)&unk_1000D9880);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v11 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v10, 0LL, 1LL, v11);
  }

  else
  {
    uint64_t v12 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v10, 1LL, 1LL, v12);
  }

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v13;
  }

  v14 = self;
  sub_100053000((uint64_t)v10);

  swift_bridgeObjectRelease(a4);
  sub_100053190((uint64_t)v10);
}

- (id)viewController
{
  id result = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (void)handleRequestToCeaseAttending
{
  char v3 = self;
  sub_1000516FC((uint64_t)v3, v2);
}

- (void)configureForRequestOptions:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100051AB8(v4);
}

@end