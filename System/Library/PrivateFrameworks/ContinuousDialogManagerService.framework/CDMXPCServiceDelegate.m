@interface CDMXPCServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14assistant_cdmd21CDMXPCServiceDelegate)init;
@end

@implementation CDMXPCServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000039D0((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtC14assistant_cdmd21CDMXPCServiceDelegate)init
{
}

- (void).cxx_destruct
{
}

@end