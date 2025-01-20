@interface CSDNeighborhoodActivityConduit
- (CSDNeighborhoodActivityConduit)init;
- (CSDNeighborhoodActivityConduit)initWithConversationManager:(id)a3 callCenter:(id)a4;
- (_TtP44com_apple_NeighborhoodActivityConduitService27CSDFaceTimeProviderDelegate_)faceTimeProviderDelegate;
- (void)dealloc;
- (void)setFaceTimeProviderDelegate:(id)a3;
@end

@implementation CSDNeighborhoodActivityConduit

- (_TtP44com_apple_NeighborhoodActivityConduitService27CSDFaceTimeProviderDelegate_)faceTimeProviderDelegate
{
  return (_TtP44com_apple_NeighborhoodActivityConduitService27CSDFaceTimeProviderDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___CSDNeighborhoodActivityConduit_faceTimeProviderDelegate, a2);
}

- (void)setFaceTimeProviderDelegate:(id)a3
{
}

- (CSDNeighborhoodActivityConduit)initWithConversationManager:(id)a3 callCenter:(id)a4
{
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_stateHandle);
  v5 = self;
  os_state_remove_handler(v4);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[CSDNeighborhoodActivityConduit dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  sub_10000F2F0((Class *)((char *)&self->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_conversationServerBag));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDNeighborhoodActivityConduit_vouchingEnablement));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDNeighborhoodActivityConduit_voucherManager));
  sub_10001D15C((uint64_t)self + OBJC_IVAR___CSDNeighborhoodActivityConduit_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDNeighborhoodActivityConduit_featureFlags));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_publisherService));
  sub_10000BFC8((uint64_t)self + OBJC_IVAR___CSDNeighborhoodActivityConduit_handoffState, &qword_1000CDE48);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_handoffStateSubject));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_captureDeviceManager);
  uint64_t v4 = *(void **)&self->deviceManager[OBJC_IVAR___CSDNeighborhoodActivityConduit_captureDeviceManager];

  swift_release(v3);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_continuitySessionClient));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_bleDiscoveryAssertion));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_joinEventSubject));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDNeighborhoodActivityConduit_nearbyConversationInfos));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_pullRequestService));
  sub_10001D15C((uint64_t)self + OBJC_IVAR___CSDNeighborhoodActivityConduit_faceTimeProviderDelegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDNeighborhoodActivityConduit_proxyMessageDeduplicator));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDNeighborhoodActivityConduit_idsProxyCleanupTimer));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___CSDNeighborhoodActivityConduit_conversationUIStateObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDNeighborhoodActivityConduit_faceTimeProcessAssertionReasons));
}

- (CSDNeighborhoodActivityConduit)init
{
  result = (CSDNeighborhoodActivityConduit *)_swift_stdlib_reportUnimplementedInitializer( "com_apple_NeighborhoodActivityConduitService.NeighborhoodActivityConduit",  72LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end