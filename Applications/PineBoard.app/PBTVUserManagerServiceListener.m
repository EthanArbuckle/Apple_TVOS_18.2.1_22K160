@interface PBTVUserManagerServiceListener
- (_TtC9PineBoard30PBTVUserManagerServiceListener)init;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation PBTVUserManagerServiceListener

- (void)activate
{
  v2 = self;
  sub_100212DA8();
}

- (void)invalidate
{
  v2 = self;
  sub_100212FF8();
}

- (_TtC9PineBoard30PBTVUserManagerServiceListener)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PineBoard30PBTVUserManagerServiceListener_listener) = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PBTVUserManagerServiceListener((uint64_t)self, (uint64_t)a2);
  return -[PBTVUserManagerServiceListener init](&v3, "init");
}

- (void).cxx_destruct
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_100214160(v9);

  swift_unknownObjectRelease(a5);
}

@end