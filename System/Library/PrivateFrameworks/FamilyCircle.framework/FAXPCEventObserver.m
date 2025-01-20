@interface FAXPCEventObserver
- (FAXPCEventObserver)init;
- (FAXPCEventObserver)initWithStream:(id)a3 delegate:(id)a4;
- (void)start;
@end

@implementation FAXPCEventObserver

- (FAXPCEventObserver)initWithStream:(id)a3 delegate:(id)a4
{
  uint64_t v7 = OBJC_IVAR___FAXPCEventObserver_handlers;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v8 = self;
  *(Class *)((char *)&self->super.isa + v7) = (Class)sub_10001B358((uint64_t)&_swiftEmptyArrayStorage);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___FAXPCEventObserver_delegate) = (Class)a4;
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___FAXPCEventObserver_stream) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for XPCEventObserver();
  v9 = -[FAXPCEventObserver init](&v11, "init");
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);
  return v9;
}

- (void)start
{
  v2 = self;
  sub_1000267F0();
}

- (FAXPCEventObserver)init
{
  result = (FAXPCEventObserver *)_swift_stdlib_reportUnimplementedInitializer( "familycircled.XPCEventObserver",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end