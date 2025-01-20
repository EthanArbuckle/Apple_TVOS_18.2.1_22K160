@interface PBCoordinatedTransitionToken
- (NSDictionary)transitionHints;
- (NSSet)coordinatedFragmentTypes;
- (PBCoordinatedTransitionFragmentDescriptor)respondingFragmentDescriptor;
- (PBCoordinatedTransitionToken)init;
- (void)addTransitionHint:(id)a3;
- (void)setCoordinatedFragmentTypes:(id)a3;
- (void)setRespondingFragmentDescriptor:(id)a3;
- (void)setTransitionHints:(id)a3;
@end

@implementation PBCoordinatedTransitionToken

- (NSSet)coordinatedFragmentTypes
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionToken_coordinatedFragmentTypes);
  type metadata accessor for PBCoordinatedTransitionFragmentType(0LL);
  sub_10022E6B4();
  swift_bridgeObjectRetain(v2);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSSet *)isa;
}

- (void)setCoordinatedFragmentTypes:(id)a3
{
  uint64_t v6 = v5;
  sub_10022E6B4();
  v7 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionToken_coordinatedFragmentTypes);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionToken_coordinatedFragmentTypes) = v7;
  swift_bridgeObjectRelease(v8);
}

- (PBCoordinatedTransitionFragmentDescriptor)respondingFragmentDescriptor
{
  return (PBCoordinatedTransitionFragmentDescriptor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR___PBCoordinatedTransitionToken_respondingFragmentDescriptor));
}

- (void)setRespondingFragmentDescriptor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionToken_respondingFragmentDescriptor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionToken_respondingFragmentDescriptor) = (Class)a3;
  id v3 = a3;
}

- (NSDictionary)transitionHints
{
  uint64_t v2 = (uint64_t *)((char *)self + OBJC_IVAR___PBCoordinatedTransitionToken_transitionHints);
  swift_beginAccess((char *)self + OBJC_IVAR___PBCoordinatedTransitionToken_transitionHints, v6, 0LL, 0LL);
  uint64_t v3 = *v2;
  type metadata accessor for PBCoordinatedTransitionFragmentType(0LL);
  swift_bridgeObjectRetain(v3);
  sub_100214624(&qword_10046F190);
  sub_10022E6B4();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (void)setTransitionHints:(id)a3
{
  uint64_t v6 = v5;
  uint64_t v7 = sub_100214624(&qword_10046F190);
  unint64_t v8 = sub_10022E6B4();
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, v6, v7, v8);
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___PBCoordinatedTransitionToken_transitionHints);
  swift_beginAccess(v10, v12, 1LL, 0LL);
  uint64_t v11 = *v10;
  uint64_t *v10 = v9;
  swift_bridgeObjectRelease(v11);
}

- (PBCoordinatedTransitionToken)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionToken_coordinatedFragmentTypes) = (Class)&_swiftEmptySetSingleton;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionToken_respondingFragmentDescriptor) = 0LL;
  uint64_t v3 = OBJC_IVAR___PBCoordinatedTransitionToken_transitionHints;
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_10022C078((uint64_t)_swiftEmptyArrayStorage);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for CoordinatedTransitionToken(v5, v6);
  return -[PBCoordinatedTransitionToken init](&v8, "init");
}

- (void)addTransitionHint:(id)a3
{
  uint64_t v5 = self;
  sub_10022C438(a3);
  swift_unknownObjectRelease(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___PBCoordinatedTransitionToken_coordinatedFragmentTypes));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___PBCoordinatedTransitionToken_transitionHints));
}

@end