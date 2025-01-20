@interface SplashScreenViewModel
- (_TtC8FaceTime21SplashScreenViewModel)init;
- (void)dealloc;
- (void)neighborhoodActivityConduitNearbyConversationsChanged:(id)a3;
- (void)willEnterForegroundNotification:(id)a3;
@end

@implementation SplashScreenViewModel

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel_neighborhoodActivityConduit);
  v3 = self;
  [v2 removeDelegate:v3];
  id v5 = objc_msgSend((id)objc_opt_self(NSNotificationCenter, v4), "defaultCenter");
  [v5 removeObserver:v3];

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for SplashScreenViewModel(0LL);
  -[SplashScreenViewModel dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel_nearbyConversationInfos));
  v3 = (char *)self + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel__nearbyConversationViewModels;
  uint64_t v4 = sub_100018A04(&qword_100115860);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel__isContinuityPickerVisible;
  uint64_t v6 = sub_100018A04(&qword_100115868);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel__hideSplashScreenContent, v6);
  v8 = (char *)self + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel__connectingConversationViewModel;
  uint64_t v9 = sub_100018A04((uint64_t *)&unk_100115870);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel_neighborhoodActivityConduit));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel_captureDeviceManager));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel_profilePictureObservers));
}

- (void)willEnterForegroundNotification:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v14 = 0LL;
  uint64_t v9 = self;
  Transaction.disablesAnimations.setter(1LL);
  uint64_t v10 = v14;
  v13 = v9;
  __n128 v11 = swift_retain(v14);
  withTransaction<A>(_:_:)(v11);

  swift_release_n(v10, 2LL);
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC8FaceTime21SplashScreenViewModel)init
{
  result = (_TtC8FaceTime21SplashScreenViewModel *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SplashScreenViewModel",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)neighborhoodActivityConduitNearbyConversationsChanged:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel_neighborhoodActivityConduit);
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = [v4 nearbyConversationInfos];
  uint64_t v8 = sub_10001C5D0(0LL, (unint64_t *)&unk_100112DE0, &OBJC_CLASS___TUNearbyConversationInfo_ptr);
  unint64_t v9 = sub_100090988();
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v7, v8, v9);

  uint64_t v11 = *(uint64_t *)((char *)&v6->super.isa + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel_nearbyConversationInfos);
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC8FaceTime21SplashScreenViewModel_nearbyConversationInfos) = (Class)v10;
  sub_10008D4AC(v11);

  swift_bridgeObjectRelease(v11);
}

@end