@interface FeedbackLoggerService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC11FlusherUtil21FeedbackLoggerService)init;
@end

@implementation FeedbackLoggerService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_10008C184((uint64_t)v8, v7);

  return v9;
}

- (_TtC11FlusherUtil21FeedbackLoggerService)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11FlusherUtil21FeedbackLoggerService_openConnections));
}

@end