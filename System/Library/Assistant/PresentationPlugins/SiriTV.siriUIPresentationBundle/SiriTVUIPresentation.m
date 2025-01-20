@interface SiriTVUIPresentation
- (BOOL)canSaveConversations;
- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3;
- (BOOL)isPresentingUIFromRemoteDevice;
- (BOOL)shouldDismissForIdling;
- (BOOL)siriDidReceiveAdditionalContent:(id)a3;
- (BOOL)trustsURL:(id)a3;
- (SiriUIPresentationDataSource)dataSource;
- (SiriUIPresentationDelegate)delegate;
- (_TtC6SiriTV20SiriTVUIPresentation)init;
- (_TtC6SiriTV20SiriTVUIPresentation)initWithDelegate:(id)a3 dataSource:(id)a4;
- (_TtC6SiriTV20SiriTVUIPresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6;
- (double)idleTimerInterval;
- (id)dismissalUserInfo;
- (id)viewController;
- (void)cancelRequest;
- (void)clearContext;
- (void)configureForRequestOptions:(id)a3;
- (void)conversation:(id)a3 didInsertItemsAtIndexPaths:(id)a4;
- (void)conversation:(id)a3 didUpdateItemsAtIndexPaths:(id)a4;
- (void)dealloc;
- (void)didBeginProcessingConversationItems;
- (void)didChangeWithPeekMode:(unint64_t)a3;
- (void)didChangeWithVisualState:(unint64_t)a3;
- (void)didFinishTestWithTestName:(id)a3;
- (void)didPresentConversationItemsWithConversationItemIdentifiers:(id)a3;
- (void)didPresentDynamicSnippetWithInfoDict:(id)a3;
- (void)didPresentUserInterface;
- (void)didReceivePaginateListCommand:(id)a3 completion:(id)a4;
- (void)didReceiveRevealRecognizedSpeechCommand:(id)a3;
- (void)didReceiveShowNextSnippetCommand:(id)a3;
- (void)didScrollWithTimeInterval:(double)a3 metricsContext:(id)a4;
- (void)didShowAceViewWithIdentifier:(id)a3 aceViewClass:(Class)a4 metricsContext:(id)a5 forInterval:(double)a6;
- (void)disableIdleTimer;
- (void)dismissPresentationWithReason:(int64_t)a3;
- (void)dismissRecordingOverlayAndHideSnippets:(BOOL)a3;
- (void)enableIdleTimer;
- (void)failTestWithTestName:(id)a3 withReason:(id)a4;
- (void)keyboardViewDidAppear;
- (void)performWithAceCommand:(id)a3 conversationItemIdentifier:(id)a4 completion:(id)a5;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showRequestHandlingStatus:(id)a3;
- (void)siriAudioRecordingDidChangePowerLevel:(float)a3;
- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4;
- (void)siriNetworkAvailabilityDidChange;
- (void)siriWillDismissWithReason:(unint64_t)a3 completion:(id)a4;
- (void)startRequestWithText:(id)a3;
- (void)updateSuggestedUtterances:(id)a3 forLanguage:(id)a4;
- (void)viewDidAppearWithAceObject:(id)a3;
- (void)viewDidAppearWithClassDescriptorWithClassDescriptor:(id)a3 identifier:(id)a4;
- (void)viewDidDisappearWithClassDescriptorWithClassDescriptor:(id)a3 identifier:(id)a4;
- (void)willDiscardConversationItemsWithConversationItemIdentifiers:(id)a3;
- (void)willStartTestWithTestName:(id)a3;
@end

@implementation SiriTVUIPresentation

- (SiriUIPresentationDelegate)delegate
{
  return (SiriUIPresentationDelegate *)(id)sub_9B4C0();
}

- (void)setDelegate:(id)a3
{
  v5 = self;
  sub_9B5A0((uint64_t)a3, &OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_delegate);
}

- (SiriUIPresentationDataSource)dataSource
{
  return (SiriUIPresentationDataSource *)(id)sub_9B540();
}

- (void)setDataSource:(id)a3
{
  v5 = self;
  sub_9B5A0((uint64_t)a3, &OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_dataSource);
}

- (_TtC6SiriTV20SiriTVUIPresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  return (_TtC6SiriTV20SiriTVUIPresentation *)sub_9B604((uint64_t)a3, (uint64_t)a4);
}

- (_TtC6SiriTV20SiriTVUIPresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  v10 = v9;
  id v11 = a4;
  swift_unknownObjectRetain(a5);
  uint64_t v12 = swift_unknownObjectRetain(a6);
  sub_9B814(v12, v10, v11, a5, a6, v13, v14, v15);
  return result;
}

- (double)idleTimerInterval
{
  v2 = self;
  sub_9B974();
  double v4 = v3;

  return v4;
}

- (BOOL)shouldDismissForIdling
{
  return 1;
}

- (id)viewController
{
  v2 = self;
  id v3 = sub_9BA00((uint64_t)v2);

  return v3;
}

- (BOOL)canSaveConversations
{
  return 0;
}

- (id)dismissalUserInfo
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptyDictionarySingleton);
  return isa;
}

- (void)configureForRequestOptions:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_9C508(a3, (void (*)(void *))sub_1778C);
}

- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4
{
  v6 = self;
  sub_9BD28(a3, a4);
}

- (BOOL)trustsURL:(id)a3
{
  uint64_t v5 = sub_9E24((uint64_t *)&unk_E0280);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = type metadata accessor for URL(0LL);
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    uint64_t v9 = 1LL;
  }

  sub_9E64((uint64_t)v7, v9, 1LL, v8);
  v10 = self;
  BOOL v11 = sub_9BD90((uint64_t)v7);

  sub_22EC4((uint64_t)v7, (uint64_t *)&unk_E0280);
  return v11;
}

- (void)siriAudioRecordingDidChangePowerLevel:(float)a3
{
  double v4 = self;
  sub_9BFE0(a3);
}

- (void)updateSuggestedUtterances:(id)a3 forLanguage:(id)a4
{
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v7);
}

- (void)dismissRecordingOverlayAndHideSnippets:(BOOL)a3
{
  id v3 = self;
  sub_9C0C4();
}

- (void)showRequestHandlingStatus:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_9C144(a3);
}

- (BOOL)siriDidReceiveAdditionalContent:(id)a3
{
  return 1;
}

- (void)siriWillDismissWithReason:(unint64_t)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  if (v5)
  {
    uint64_t v6 = swift_allocObject(&unk_CDEA8, 24LL, 7LL);
    *(void *)(v6 + 16) = v5;
    id v5 = sub_9DEAC;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = self;
  sub_9C374();
  sub_1A7D0((uint64_t)v5, v6);
}

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  id v5 = a3;
  uint64_t v6 = self;
  LOBYTE(v3) = sub_9C464(v3);

  return v3 & 1;
}

- (void)didReceiveShowNextSnippetCommand:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_9C508(a3, sub_16F90);
}

- (void)didReceivePaginateListCommand:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject(&unk_CDE58, 24LL, 7LL);
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_9DE5C;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  id v8 = a3;
  uint64_t v9 = self;
  sub_9C5C4(a3, (uint64_t)v6, v7);
  sub_1A7D0((uint64_t)v6, v7);
}

- (BOOL)isPresentingUIFromRemoteDevice
{
  return 0;
}

- (void)conversation:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
}

- (void)didReceiveRevealRecognizedSpeechCommand:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_9C738(a3);
}

- (void)conversation:(id)a3 didUpdateItemsAtIndexPaths:(id)a4
{
}

- (void)siriNetworkAvailabilityDidChange
{
  v2 = self;
  sub_9CA3C();
}

- (void)dealloc
{
  v2 = self;
  sub_9CAA8();
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6SiriTV20SiriTVUIPresentation_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

- (_TtC6SiriTV20SiriTVUIPresentation)init
{
}

- (void)performWithAceCommand:(id)a3 conversationItemIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v9 = sub_9E24(&qword_E0370);
  __chkstk_darwin(v9);
  BOOL v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v13 = type metadata accessor for UUID(0LL);
    uint64_t v14 = 0LL;
  }

  else
  {
    uint64_t v13 = type metadata accessor for UUID(0LL);
    uint64_t v14 = 1LL;
  }

  sub_9E64((uint64_t)v11, v14, 1LL, v13);
  if (v12)
  {
    uint64_t v15 = swift_allocObject(&unk_CDE08, 24LL, 7LL);
    *(void *)(v15 + 16) = v12;
    uint64_t v12 = sub_9DE30;
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  id v16 = a3;
  v17 = self;
  sub_9CC9C((uint64_t)v16, (uint64_t)v11, v12, v15);
  sub_1A7D0((uint64_t)v12, v15);

  sub_22EC4((uint64_t)v11, &qword_E0370);
}

- (void)didPresentDynamicSnippetWithInfoDict:(id)a3
{
  uint64_t v4 = (_TtC6SiriTV27ConversationViewCoordinator *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  id v5 = self;
  sub_9CF38();

  swift_bridgeObjectRelease(v4, v6, v7, v8, v9, v10, v11, v12);
}

- (void)keyboardViewDidAppear
{
  v2 = self;
  sub_9DB48((SEL *)&selRef_siriPresentationKeyboardViewDidAppear_);
}

- (void)didShowAceViewWithIdentifier:(id)a3 aceViewClass:(Class)a4 metricsContext:(id)a5 forInterval:(double)a6
{
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v17 = v16;
  uint64_t v18 = self;
  sub_9D08C(a6, (uint64_t)v14, ObjCClassMetadata);

  swift_bridgeObjectRelease(v17, v19, v20, v21, v22, v23, v24, v25);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)didPresentConversationItemsWithConversationItemIdentifiers:(id)a3
{
  uint64_t v4 = (_TtC6SiriTV27ConversationViewCoordinator *)static Array._unconditionallyBridgeFromObjectiveC(_:)( a3,  (char *)&type metadata for Any + 8);
  id v5 = self;
  sub_9D240();

  swift_bridgeObjectRelease(v4, v6, v7, v8, v9, v10, v11, v12);
}

- (void)startRequestWithText:(id)a3
{
  id v5 = v4;
  SEL v6 = self;
  sub_9D2F8();

  swift_bridgeObjectRelease(v5, v7, v8, v9, v10, v11, v12, v13);
}

- (void)willDiscardConversationItemsWithConversationItemIdentifiers:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  SEL v6 = (_TtC6SiriTV27ConversationViewCoordinator *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  SEL v7 = self;
  sub_9D3A4();

  swift_bridgeObjectRelease(v6, v8, v9, v10, v11, v12, v13, v14);
}

- (void)didScrollWithTimeInterval:(double)a3 metricsContext:(id)a4
{
  SEL v7 = v6;
  SEL v8 = self;
  sub_9D454(a3);

  swift_bridgeObjectRelease(v7, v9, v10, v11, v12, v13, v14, v15);
}

- (void)didChangeWithPeekMode:(unint64_t)a3
{
  uint64_t v4 = self;
  sub_9DBD0(a3, (SEL *)&selRef_siriPresentation_didChangePeekMode_);
}

- (void)didChangeWithVisualState:(unint64_t)a3
{
  uint64_t v3 = self;
  sub_9D588();
}

- (void)viewDidAppearWithAceObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_9DBD0((uint64_t)v4, (SEL *)&selRef_siriPresentation_viewDidAppearWithAceObject_);
}

- (void)viewDidDisappearWithClassDescriptorWithClassDescriptor:(id)a3 identifier:(id)a4
{
}

- (void)willStartTestWithTestName:(id)a3
{
}

- (void)didFinishTestWithTestName:(id)a3
{
}

- (void)failTestWithTestName:(id)a3 withReason:(id)a4
{
  SEL v7 = v6;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  SEL v9 = v8;
  id v10 = self;
  sub_9D7BC();

  swift_bridgeObjectRelease(v7, v11, v12, v13, v14, v15, v16, v17);
  swift_bridgeObjectRelease(v9, v18, v19, v20, v21, v22, v23, v24);
}

- (void)viewDidAppearWithClassDescriptorWithClassDescriptor:(id)a3 identifier:(id)a4
{
}

- (void)didPresentUserInterface
{
  v2 = self;
  sub_9DB48((SEL *)&selRef_siriPresentationDidPresentUserInterface_);
}

- (void)enableIdleTimer
{
  v2 = self;
  sub_9DB48((SEL *)&selRef_enableIdleTimerForSiriPresentation_);
}

- (void)disableIdleTimer
{
  v2 = self;
  sub_9DB48((SEL *)&selRef_disableIdleTimerForSiriPresentation_);
}

- (void)cancelRequest
{
  v2 = self;
  sub_9DB48((SEL *)&selRef_cancelRequestForSiriPresentation_);
}

- (void)clearContext
{
  v2 = self;
  sub_9DB48((SEL *)&selRef_siriPresentationClearContext_);
}

- (void)dismissPresentationWithReason:(int64_t)a3
{
  id v4 = self;
  sub_9DBD0(a3, (SEL *)&selRef_dismissSiriPresentation_withReason_);
}

- (void)didBeginProcessingConversationItems
{
  v2 = self;
  sub_9DC60();
}

@end