@interface SuggestedRoutePresentable
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (_TtC13MediaRemoteUI25SuggestedRoutePresentable)init;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
@end

@implementation SuggestedRoutePresentable

- (NSString)requesterIdentifier
{
  return (NSString *)sub_10000AEE8( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requesterIdentifier);
}

- (NSString)requestIdentifier
{
  return (NSString *)sub_10000AEE8( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requestIdentifier);
}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_delegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_delegate);
  if (Strong)
  {
    uint64_t v7 = Strong;
    uint64_t v8 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = *(uint64_t *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requestIdentifier);
    uint64_t v11 = *(void *)&self->requesterIdentifier[OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requestIdentifier];
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8);
    swift_unknownObjectRetain(a3);
    v13 = self;
    v12(v10, v11, ObjectType, v8);
    swift_unknownObjectRelease(a3);

    swift_unknownObjectRelease(v7);
  }

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v7 = a4;
  uint64_t v8 = self;
  sub_10000C4F4((uint64_t)a4);
  swift_unknownObjectRelease(a3);
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v7 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_delegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_delegate);
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t v10 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v12 = *(uint64_t *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requestIdentifier);
    uint64_t v13 = *(void *)&self->requesterIdentifier[OBJC_IVAR____TtC13MediaRemoteUI25SuggestedRoutePresentable_requestIdentifier];
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16);
    swift_unknownObjectRetain(a3);
    id v15 = a4;
    v16 = self;
    v14(v12, v13, ObjectType, v10);
    swift_unknownObjectRelease(a3);

    swift_unknownObjectRelease(v9);
  }

- (_TtC13MediaRemoteUI25SuggestedRoutePresentable)init
{
  result = (_TtC13MediaRemoteUI25SuggestedRoutePresentable *)_swift_stdlib_reportUnimplementedInitializer( "MediaRemoteUI.SuggestedRoutePresentable",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end