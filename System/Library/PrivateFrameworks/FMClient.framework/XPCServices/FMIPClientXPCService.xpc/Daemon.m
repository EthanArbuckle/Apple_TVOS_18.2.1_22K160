@interface Daemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC20FMIPClientXPCService6Daemon)init;
@end

@implementation Daemon

- (_TtC20FMIPClientXPCService6Daemon)init
{
  uint64_t v2 = OBJC_IVAR____TtC20FMIPClientXPCService6Daemon_xpcManager;
  uint64_t v3 = qword_100076AF0;
  v4 = self;
  if (v3 != -1) {
    swift_once(&qword_100076AF0, sub_10000558C);
  }
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_1000798B8;
  swift_retain();

  uint64_t v5 = sub_1000079C8(0LL, (unint64_t *)&qword_100076C18, &OBJC_CLASS___OS_os_log_ptr);
  v6 = (void *)static OS_os_log.default.getter(v5);
  uint64_t v7 = static os_log_type_t.default.getter(v6);
  os_log(_:dso:log:type:_:)("Daemon initializing", 19LL, 2LL, &_mh_execute_header, v6, v7, _swiftEmptyArrayStorage);

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for Daemon();
  return -[Daemon init](&v9, "init");
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000534F4(v7);

  return v9 & 1;
}

@end