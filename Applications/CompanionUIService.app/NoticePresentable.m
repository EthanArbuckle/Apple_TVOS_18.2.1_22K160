@interface NoticePresentable
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (_TtC18CompanionUIService17NoticePresentable)init;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)setRequestIdentifier:(id)a3;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
@end

@implementation NoticePresentable

- (NSString)requestIdentifier
{
  return (NSString *)sub_100005F34( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_requestIdentifier);
}

- (void)setRequestIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_requestIdentifier);
  uint64_t v6 = *(void *)&self->requestIdentifier[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_requestIdentifier];
  uint64_t *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (NSString)requesterIdentifier
{
  return (NSString *)sub_100005F34( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_requesterIdentifier);
}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
}

- (void)presentableDidAppearAsBanner:(id)a3
{
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
}

- (_TtC18CompanionUIService17NoticePresentable)init
{
  result = (_TtC18CompanionUIService17NoticePresentable *)_swift_stdlib_reportUnimplementedInitializer( "CompanionUIService.NoticePresentable",  36LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000737C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_didDisappear),  *(void *)&self->requestIdentifier[OBJC_IVAR____TtC18CompanionUIService17NoticePresentable_didDisappear]);
}

@end