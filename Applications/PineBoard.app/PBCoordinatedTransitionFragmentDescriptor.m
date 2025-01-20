@interface PBCoordinatedTransitionFragmentDescriptor
- (NSString)type;
- (PBCoordinatedTransitionFragmentDescriptor)init;
- (PBCoordinatedTransitionFragmentDescriptor)initWithType:(id)a3 provider:(id)a4;
- (PBCoordinatedTransitionProviding)provider;
- (void)setProvider:(id)a3;
- (void)setType:(id)a3;
@end

@implementation PBCoordinatedTransitionFragmentDescriptor

- (NSString)type
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___PBCoordinatedTransitionFragmentDescriptor_type));
}

- (void)setType:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionFragmentDescriptor_type);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionFragmentDescriptor_type) = (Class)a3;
  id v3 = a3;
}

- (PBCoordinatedTransitionProviding)provider
{
  return (PBCoordinatedTransitionProviding *)(id)swift_unknownObjectWeakLoadStrong( (char *)self + OBJC_IVAR___PBCoordinatedTransitionFragmentDescriptor_provider,  a2);
}

- (void)setProvider:(id)a3
{
}

- (PBCoordinatedTransitionFragmentDescriptor)initWithType:(id)a3 provider:(id)a4
{
  uint64_t v7 = swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___PBCoordinatedTransitionFragmentDescriptor_provider, 0LL);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBCoordinatedTransitionFragmentDescriptor_type) = (Class)a3;
  uint64_t v8 = swift_unknownObjectWeakAssign(v7, a4);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CoordinatedTransitionFragmentDescriptor(v8, v9);
  id v10 = a3;
  return -[PBCoordinatedTransitionFragmentDescriptor init](&v12, "init");
}

- (PBCoordinatedTransitionFragmentDescriptor)init
{
  result = (PBCoordinatedTransitionFragmentDescriptor *)_swift_stdlib_reportUnimplementedInitializer( "PineBoard.CoordinatedTransitionFragmentDescriptor",  49LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end