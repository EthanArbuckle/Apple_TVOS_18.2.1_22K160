@interface XPCServer.Listener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC11homeeventsd9XPCServer8Listener)init;
@end

@implementation XPCServer.Listener

- (_TtCC11homeeventsd9XPCServer8Listener)init
{
  result = (_TtCC11homeeventsd9XPCServer8Listener *)_swift_stdlib_reportUnimplementedInitializer( "homeeventsd.Listener",  20LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtCC11homeeventsd9XPCServer8Listener_hmDelegate);
  if (Strong)
  {
    uint64_t v8 = Strong;
    id v9 = a3;
    id v10 = a4;
    v11 = self;
    char v12 = sub_100037C48((uint64_t)v11, v10, v8);

    swift_unknownObjectRelease(v8);
  }

  else
  {
    char v12 = 0;
  }

  return v12 & 1;
}

@end