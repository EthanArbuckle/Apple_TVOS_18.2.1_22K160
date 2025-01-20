@interface IdleScreenSceneComponent
- (UIScene)_scene;
- (_TtC10IdleScreen24IdleScreenSceneComponent)init;
- (_TtC10IdleScreen24IdleScreenSceneComponent)initWithScene:(id)a3;
- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5;
- (void)_setScene:(id)a3;
@end

@implementation IdleScreenSceneComponent

- (_TtC10IdleScreen24IdleScreenSceneComponent)initWithScene:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(void *)&self->delegate[OBJC_IVAR____TtC10IdleScreen24IdleScreenSceneComponent_delegate] = 0LL;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10IdleScreen24IdleScreenSceneComponent_scene) = (Class)a3;
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v6 = a3;
  v7 = -[IdleScreenSceneComponent init](&v9, "init");

  return v7;
}

- (_TtC10IdleScreen24IdleScreenSceneComponent)init
{
  result = (_TtC10IdleScreen24IdleScreenSceneComponent *)_swift_stdlib_reportUnimplementedInitializer( "IdleScreen.IdleScreenSceneComponent",  35LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (UIScene)_scene
{
  return (UIScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC10IdleScreen24IdleScreenSceneComponent_scene));
}

- (void)_setScene:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10IdleScreen24IdleScreenSceneComponent_scene);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10IdleScreen24IdleScreenSceneComponent_scene) = (Class)a3;
  id v3 = a3;
}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  unsigned int v5 = a5;
  id v8 = a3;
  objc_super v9 = self;
  sub_100005824(a4, v5);
}

@end