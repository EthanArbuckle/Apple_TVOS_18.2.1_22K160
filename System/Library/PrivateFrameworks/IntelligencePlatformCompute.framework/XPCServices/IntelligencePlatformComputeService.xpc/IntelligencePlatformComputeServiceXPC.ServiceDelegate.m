@interface IntelligencePlatformComputeServiceXPC.ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC34IntelligencePlatformComputeService37IntelligencePlatformComputeServiceXPC15ServiceDelegate)init;
@end

@implementation IntelligencePlatformComputeServiceXPC.ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10000EDF0(v7);

  return v9 & 1;
}

- (_TtCC34IntelligencePlatformComputeService37IntelligencePlatformComputeServiceXPC15ServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntelligencePlatformComputeServiceXPC.ServiceDelegate();
  return -[IntelligencePlatformComputeServiceXPC.ServiceDelegate init](&v3, "init");
}

@end