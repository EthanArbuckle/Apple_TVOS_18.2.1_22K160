@interface XPCServiceProvider
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14amsengagementd18XPCServiceProvider)init;
- (void)dealloc;
@end

@implementation XPCServiceProvider

- (void)dealloc
{
  v2 = self;
  sub_100154150();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14amsengagementd18XPCServiceProvider_remoteObjectInterface));
}

- (_TtC14amsengagementd18XPCServiceProvider)init
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10015453C((uint64_t)v8, v7);

  return v9 & 1;
}

@end