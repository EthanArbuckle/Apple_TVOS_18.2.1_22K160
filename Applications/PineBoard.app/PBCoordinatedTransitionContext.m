@interface PBCoordinatedTransitionContext
- (PBCoordinatedTransitionContext)init;
- (PBCoordinatedTransitionHint)transitionHint;
- (void)setTransitionHint:(id)a3;
@end

@implementation PBCoordinatedTransitionContext

- (PBCoordinatedTransitionHint)transitionHint
{
  return (PBCoordinatedTransitionHint *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionContext_transitionHint));
}

- (void)setTransitionHint:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionContext_transitionHint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionContext_transitionHint) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (PBCoordinatedTransitionContext)init
{
  result = (PBCoordinatedTransitionContext *)_swift_stdlib_reportUnimplementedInitializer( "PineBoard.CoordinatedTransitionContext",  38LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___PBCoordinatedTransitionContext_transitionHint));
}

@end