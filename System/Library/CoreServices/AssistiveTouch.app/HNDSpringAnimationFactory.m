@interface HNDSpringAnimationFactory
+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5;
- (CAMediaTimingFunction)timingFunction;
- (HNDSpringAnimationFactory)init;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimation;
- (void)setTimingFunction:(id)a3;
@end

@implementation HNDSpringAnimationFactory

- (CAMediaTimingFunction)timingFunction
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HNDSpringAnimationFactory_timingFunction);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDSpringAnimationFactory_timingFunction, v4, 0LL, 0LL);
  return (CAMediaTimingFunction *)*v2;
}

- (void)setTimingFunction:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___HNDSpringAnimationFactory_timingFunction);
  swift_beginAccess((char *)self + OBJC_IVAR___HNDSpringAnimationFactory_timingFunction, v7, 1LL, 0LL);
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5
{
  v8 = (objc_class *)type metadata accessor for SpringAnimationFactory();
  v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR___HNDSpringAnimationFactory_timingFunction] = 0LL;
  *(void *)&v9[OBJC_IVAR___HNDSpringAnimationFactory____lazy_storage___springAnimation] = 0LL;
  *(double *)&v9[OBJC_IVAR___HNDSpringAnimationFactory_mass] = a3;
  *(double *)&v9[OBJC_IVAR___HNDSpringAnimationFactory_stiffness] = a4;
  *(double *)&v9[OBJC_IVAR___HNDSpringAnimationFactory_damping] = a5;
  v11.receiver = v9;
  v11.super_class = v8;
  return objc_msgSendSuper2(&v11, "init");
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  id v8 = a3;
  v9 = self;
  id v10 = sub_1000AE544();

  swift_bridgeObjectRelease(v7);
  return v10;
}

- (id)_timingFunctionForAnimation
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xC0);
  v3 = self;
  id v4 = (id)v2();
  if (v4) {
    goto LABEL_4;
  }
  uint64_t v5 = static os_log_type_t.info.getter();
  id result = (id)ASTLogCommon(v5);
  if (result)
  {
    id v7 = result;

    id v4 = [objc_allocWithZone(CAMediaTimingFunction) init];
LABEL_4:
    id v8 = v4;

    return v8;
  }

  __break(1u);
  return result;
}

- (HNDSpringAnimationFactory)init
{
  id result = (HNDSpringAnimationFactory *)_swift_stdlib_reportUnimplementedInitializer( "assistivetouchd.SpringAnimationFactory",  38LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end