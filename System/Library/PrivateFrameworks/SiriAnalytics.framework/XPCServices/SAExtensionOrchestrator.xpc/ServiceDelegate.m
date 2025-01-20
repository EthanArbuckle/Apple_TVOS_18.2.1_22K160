@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC23SAExtensionOrchestrator15ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v10 = sub_100002334(v7, v9);

  return v10 & 1;
}

- (_TtC23SAExtensionOrchestrator15ServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ServiceDelegate();
  return -[ServiceDelegate init](&v3, "init");
}

@end