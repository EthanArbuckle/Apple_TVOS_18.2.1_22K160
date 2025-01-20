@interface TVFaceTimeRootViewController
- (NSArray)preferredFocusEnvironments;
- (TVFaceTimeRootViewController)initWithCoder:(id)a3;
- (TVFaceTimeRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cameraPreviewControllerCancelled:(id)a3 error:(id)a4;
- (void)cameraPreviewControllerCompleted:(id)a3;
- (void)dealloc;
@end

@implementation TVFaceTimeRootViewController

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  uint64_t v3 = sub_100056AD4();

  sub_100018A04(&qword_100112990);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (TVFaceTimeRootViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR___TVFaceTimeRootViewController_featureFlags;
  id v6 = objc_allocWithZone(&OBJC_CLASS___TUFeatureFlags);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___TVFaceTimeRootViewController_observerCancellables) = (Class)_swiftEmptyArrayStorage;
  v8 = (char *)self + OBJC_IVAR___TVFaceTimeRootViewController_state;
  uint64_t v9 = type metadata accessor for RootViewController.State(0LL);
  swift_storeEnumTagMultiPayload(v8, v9, 4LL);
  v10 = (char *)self + OBJC_IVAR___TVFaceTimeRootViewController_incomingHandoffContext;
  uint64_t v11 = type metadata accessor for IncomingHandoffContext(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v10, 1LL, 1LL, v11);

  result = (TVFaceTimeRootViewController *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/RootViewController.swift",  33LL,  2LL,  136LL,  0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_100056D24();
}

- (void).cxx_destruct
{
  sub_10001BFEC((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR___TVFaceTimeRootViewController_callManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR___TVFaceTimeRootViewController_continuitySessionManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR___TVFaceTimeRootViewController_captureDeviceManager));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVFaceTimeRootViewController_neighborhoodActivityConduit));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___TVFaceTimeRootViewController_observerCancellables));
  sub_10001C644( (uint64_t)self + OBJC_IVAR___TVFaceTimeRootViewController_state,  type metadata accessor for RootViewController.State);
  sub_10001C608((uint64_t)self + OBJC_IVAR___TVFaceTimeRootViewController_incomingHandoffContext, &qword_100114890);
}

- (TVFaceTimeRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (TVFaceTimeRootViewController *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.RootViewController",  27LL,  "init(nibName:bundle:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void)cameraPreviewControllerCancelled:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_10005FA70((uint64_t)a4);
}

- (void)cameraPreviewControllerCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10005FD4C();
}

@end