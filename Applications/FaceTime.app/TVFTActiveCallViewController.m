@interface TVFTActiveCallViewController
+ (NSSet)dismissalAssertions;
- (BOOL)isFullScreen;
- (BOOL)isMicIndicatorVisible;
- (BOOL)isShowing6UP;
- (BOOL)isShowingHUD;
- (CGSize)preferredPIPContentAspectRatio;
- (NSArray)preferredFocusEnvironments;
- (TVFTActiveCallViewController)initWithCoder:(id)a3;
- (TVFTActiveCallViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIImage)audioRouteGlyphForDevice;
- (id)audioRouteGlyphFor:(id)a3;
- (id)audioRouteGlyphFor:(id)a3 buttonStyle:(int64_t)a4;
- (id)audioRouteMenu;
- (id)bottomControlsViewForViewController:(id)a3;
- (id)callParticipantLabelsViewForViewController:(id)a3;
- (id)pipSourceProvider;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 resolvedAudioVideoModeChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)dealloc;
- (void)didTapMenuButton:(id)a3;
- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingState:(BOOL)a4;
- (void)viewController:(id)a3 captioningStateDidChange:(BOOL)a4;
- (void)viewController:(id)a3 fullScreenFocusedParticipantAspectRatioChanged:(CGSize)a4 participantGridIsFullScreen:(BOOL)a5;
- (void)viewController:(id)a3 fullScreenFocusedParticipantOrientationChanged:(int64_t)a4;
- (void)viewController:(id)a3 pipSourceProviderNeedsUpdate:(id)a4;
- (void)viewControllerDidRequestAddParticipants:(id)a3;
- (void)viewControllerDidRequestScreenShareRelaunch:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVFTActiveCallViewController

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_100018A04(&qword_1001142B0);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_1000C3FD0;
  *(void *)(v4 + 32) = self;
  uint64_t v8 = v4;
  specialized Array._endMutation()(v4);
  v5 = self;
  sub_100018A04(&qword_100112990);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return (NSArray *)isa;
}

- (TVFTActiveCallViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100027B70();
}

  ;
}

- (void)dealloc
{
  v2 = self;
  sub_100023660();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFTActiveCallViewController_multiwayViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFTActiveCallViewController_screenSharingContainerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFTActiveCallViewController_audioCallViewController));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFTActiveCallViewController____lazy_storage___pipShroudView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFTActiveCallViewController_screenSharingStateMonitor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFTActiveCallViewController_bannerPresentationManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___TVFTActiveCallViewController_idleTimerAssertion));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___TVFTActiveCallViewController_observerCancellables));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___TVFTActiveCallViewController_featureFlags));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TVFTActiveCallViewController_conversationManagerQueue));
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000238A8();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100023BA8(a3);
}

- (TVFTActiveCallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (TVFTActiveCallViewController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.ActiveCallViewController",  33LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (UIImage)audioRouteGlyphForDevice
{
  return (UIImage *)0LL;
}

- (void)viewControllerDidRequestAddParticipants:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100027EC8();
}

- (void)viewController:(id)a3 fullScreenFocusedParticipantOrientationChanged:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_100028034(a4);
}

- (void)viewController:(id)a3 fullScreenFocusedParticipantAspectRatioChanged:(CGSize)a4 participantGridIsFullScreen:(BOOL)a5
{
  id v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVFTActiveCallViewController_pipController);
  id v7 = a3;
  uint64_t v8 = self;
  [v6 updatePIPSize];
  [v6 updatePIPFrame];
}

- (void)viewController:(id)a3 pipSourceProviderNeedsUpdate:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain(a4);
  id v7 = self;
  sub_100028398();

  swift_unknownObjectRelease(a4);
}

- (id)audioRouteMenu
{
  return 0LL;
}

- (id)audioRouteGlyphFor:(id)a3
{
  return 0LL;
}

- (id)audioRouteGlyphFor:(id)a3 buttonStyle:(int64_t)a4
{
  return 0LL;
}

- (id)callParticipantLabelsViewForViewController:(id)a3
{
  return 0LL;
}

- (id)bottomControlsViewForViewController:(id)a3
{
  return 0LL;
}

- (void)viewControllerDidRequestScreenShareRelaunch:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100028480();
}

- (void)viewController:(id)a3 captioningStateDidChange:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100028698(a4);
}

- (id)pipSourceProvider
{
  v2 = self;
  id v3 = sub_1000287AC();
  swift_unknownObjectRetain(v3);

  return v3;
}

+ (NSSet)dismissalAssertions
{
  return (NSSet *)Set._bridgeToObjectiveC()().super.isa;
}

- (CGSize)preferredPIPContentAspectRatio
{
  v2 = self;
  double v3 = MultiwayViewController.preferredPiPContentAspectRatio()();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)isShowingHUD
{
  return 0;
}

- (BOOL)isShowing6UP
{
  return 0;
}

- (BOOL)isFullScreen
{
  return 0;
}

- (BOOL)isMicIndicatorVisible
{
  return 0;
}

- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingState:(BOOL)a4
{
  double v7 = self;
  sub_100026D50((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);
}

- (void)didTapMenuButton:(id)a3
{
  id v4 = a3;
  double v6 = self;
  sub_10002886C((uint64_t)v6, v5);
}

- (void)conversationManager:(id)a3 resolvedAudioVideoModeChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100028E9C(v9, v10, (uint64_t)&unk_1000F7E18, (uint64_t)sub_1000294A4, (uint64_t)&unk_1000F7E30);
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100028E9C(v9, v10, (uint64_t)&unk_1000F7DC8, (uint64_t)sub_100029460, (uint64_t)&unk_1000F7DE0);
}

@end