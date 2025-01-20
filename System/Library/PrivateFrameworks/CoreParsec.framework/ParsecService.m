@interface ParsecService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC7parsecd13ParsecService)init;
@end

@implementation ParsecService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000D33A0((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtC7parsecd13ParsecService)init
{
  return (_TtC7parsecd13ParsecService *)sub_1000D4C0C();
}

- (void).cxx_destruct
{
  sub_10004713C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7parsecd13ParsecService__assembly));
}

@end