@interface ContinuitySessionManager
- (_TtC8FaceTime24ContinuitySessionManager)init;
- (void)neighborhoodActivityConduit:(id)a3 updatedCurrentContinuitySession:(id)a4;
@end

@implementation ContinuitySessionManager

- (_TtC8FaceTime24ContinuitySessionManager)init
{
  result = (_TtC8FaceTime24ContinuitySessionManager *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.ContinuitySessionManager",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8FaceTime24ContinuitySessionManager_activeContinuitySessionSubject));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime24ContinuitySessionManager____lazy_storage___recentCallsProvider));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime24ContinuitySessionManager_neighborhoodActivityConduit));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime24ContinuitySessionManager_continuitySessionQueue));
}

- (void)neighborhoodActivityConduit:(id)a3 updatedCurrentContinuitySession:(id)a4
{
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8FaceTime24ContinuitySessionManager_activeContinuitySessionSubject);
  id v10 = a4;
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  swift_retain(v6);
  CurrentValueSubject.send(_:)(&v10);

  swift_release(v6);
}

@end