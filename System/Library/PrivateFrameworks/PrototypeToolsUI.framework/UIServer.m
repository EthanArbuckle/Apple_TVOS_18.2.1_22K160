@interface UIServer
- (_TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer)init;
- (void)handlePrototypingEvent:(int64_t)a3;
- (void)launchForRemoteEditing;
@end

@implementation UIServer

- (void)handlePrototypingEvent:(int64_t)a3
{
  v4 = self;
  sub_10000A054(a3);
}

- (void)launchForRemoteEditing
{
  uint64_t v2 = qword_10001BEB0;
  v3 = self;
  if (v2 != -1) {
    swift_once(&qword_10001BEB0, sub_10000A8FC);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_10000B8F8(v4, (uint64_t)qword_10001C1C0);
  oslog = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v6, "launchForRemoteEditing", v7, 2u);
    swift_slowDealloc(v7, -1LL, -1LL);
  }
}

- (_TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer)init
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v4 = type metadata accessor for MainActor(0LL);
  uint64_t v5 = static MainActor.shared.getter(v4);
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  uint64_t v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/AppDelegate.swift", 28LL, 1LL, 63LL, v6, v8);
  }
  uint64_t v9 = OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer;
  id v10 = objc_allocWithZone(&OBJC_CLASS___PTDomainServer);
  v11 = self;
  *(Class *)((char *)&self->super.isa + v9) = (Class)[v10 init];
  *(Class *)((char *)&v11->super.isa
           + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer____lazy_storage___editingServer) = 0LL;

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[UIServer init](&v14, "init");
  swift_release(v5);
  return v12;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer____lazy_storage___editingServer));
}

@end