@interface ServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC9storekitd15ServiceListener)init;
@end

@implementation ServiceListener

- (_TtC9storekitd15ServiceListener)init
{
  return (_TtC9storekitd15ServiceListener *)sub_10007C0B4((uint64_t)self);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10007C27C((uint64_t)v8, v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
}

@end