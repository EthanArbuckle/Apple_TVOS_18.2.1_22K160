@interface MainServer
- (_TtC13MediaRemoteUI10MainServer)init;
@end

@implementation MainServer

- (_TtC13MediaRemoteUI10MainServer)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager) = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MainServer();
  v2 = -[MainServer init](&v5, "init");
  uint64_t v3 = static os_log_type_t.default.getter(v2);
  if (qword_100016320 != -1) {
    swift_once(&qword_100016320, sub_100008764);
  }
  os_log(_:dso:log:_:_:)( v3,  &_mh_execute_header,  qword_100016D90,  "[MainServer] init",  17LL,  2LL,  &_swiftEmptyArrayStorage);

  return v2;
}

- (void).cxx_destruct
{
}

@end