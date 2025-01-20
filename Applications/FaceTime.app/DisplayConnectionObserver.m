@interface DisplayConnectionObserver
- (_TtC8FaceTime25DisplayConnectionObserver)init;
- (void)dealloc;
- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4;
@end

@implementation DisplayConnectionObserver

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime25DisplayConnectionObserver_provider);
  v3 = self;
  id v4 = [v2 removeStateObserver:v3];
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for DisplayConnectionObserver((uint64_t)v4, v5);
  -[DisplayConnectionObserver dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8FaceTime25DisplayConnectionObserver_provider));
}

- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4
{
  objc_super v6 = self;
  sub_10002AED4(a3);
  swift_unknownObjectRelease(a3);
}

- (_TtC8FaceTime25DisplayConnectionObserver)init
{
  result = (_TtC8FaceTime25DisplayConnectionObserver *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.DisplayConnectionObserver",  34LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end