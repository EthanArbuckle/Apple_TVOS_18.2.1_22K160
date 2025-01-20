@interface _NSKeyValueObservation
- (_NSKeyValueObservation)init;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _NSKeyValueObservation

- (void)invalidate
{
  v3 = (void *)MEMORY[0x186E20F44]((char *)self + OBJC_IVAR____NSKeyValueObservation_helper, a2);
  v4 = self;
  if (v3)
  {
    NSKeyValueObservation.Helper.invalidate()();
  }

  swift_unknownObjectWeakAssign();
}

- (void)dealloc
{
  v3 = (void *)MEMORY[0x186E20F44]((char *)self + OBJC_IVAR____NSKeyValueObservation_helper, a2);
  v4 = self;
  if (v3)
  {
    NSKeyValueObservation.Helper.invalidate()();
  }

  swift_unknownObjectWeakAssign();
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for NSKeyValueObservation();
  -[_NSKeyValueObservation dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (_NSKeyValueObservation)init
{
  result = (_NSKeyValueObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end