@interface RemoteDisplayManager
- (_TtC8FaceTime20RemoteDisplayManager)init;
- (void)dealloc;
@end

@implementation RemoteDisplayManager

- (_TtC8FaceTime20RemoteDisplayManager)init
{
  return (_TtC8FaceTime20RemoteDisplayManager *)sub_100079C00();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime20RemoteDisplayManager_remoteDisplayDiscovery);
  v5 = self;
  [v4 invalidate];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[RemoteDisplayManager dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
}

@end