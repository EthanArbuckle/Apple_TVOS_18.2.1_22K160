@interface NetworkMonitor
- (_TtC12searchpartyd14NetworkMonitor)init;
@end

@implementation NetworkMonitor

- (_TtC12searchpartyd14NetworkMonitor)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor_monitorBlock);
  void *v2 = 0LL;
  v2[1] = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor_evaluator) = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor____lazy_storage___callbackQueue) = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NetworkMonitor();
  return -[NetworkMonitor init](&v4, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor____lazy_storage___callbackQueue));
}

@end