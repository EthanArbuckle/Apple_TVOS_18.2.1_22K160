@interface LaunchActivityManager
- (_TtC8FaceTime21LaunchActivityManager)init;
- (void)conversationManager:(id)a3 conversation:(id)a4 launchStateChanged:(unint64_t)a5 forActivitySession:(id)a6;
- (void)dealloc;
@end

@implementation LaunchActivityManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime21LaunchActivityManager_displayLayoutMonitor);
  uint64_t v5 = *(void *)&self->queue[OBJC_IVAR____TtC8FaceTime21LaunchActivityManager_displayLayoutMonitor];
  uint64_t v6 = swift_getObjectType(v4);
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v8 = self;
  swift_unknownObjectRetain(v4);
  v7(v6, v5);
  swift_unknownObjectRelease(v4);
  v9.receiver = v8;
  v9.super_class = ObjectType;
  -[LaunchActivityManager dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTime21LaunchActivityManager_neighborhoodActivityConduit));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8FaceTime21LaunchActivityManager_displayLayoutMonitor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8FaceTime21LaunchActivityManager_sessionsToLaunchAppBulletinUUIDs));
}

- (void)conversationManager:(id)a3 conversation:(id)a4 launchStateChanged:(unint64_t)a5 forActivitySession:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  sub_10008C1D8(v11, a5, v12);
}

- (_TtC8FaceTime21LaunchActivityManager)init
{
  result = (_TtC8FaceTime21LaunchActivityManager *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.LaunchActivityManager",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end