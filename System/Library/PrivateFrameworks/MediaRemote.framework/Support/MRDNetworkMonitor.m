@interface MRDNetworkMonitor
- (BOOL)isUsingWifi;
- (BOOL)isUsingWiredEthernet;
- (MRDNetworkMonitor)init;
- (void)cancel;
- (void)startWithQueue:(id)a3;
@end

@implementation MRDNetworkMonitor

- (void)startWithQueue:(id)a3
{
  id v4 = a3;
  v5 = self;
  NWPathMonitor.start(queue:)(v4);
}

- (void)cancel
{
  v2 = self;
  NWPathMonitor.cancel()();
}

- (BOOL)isUsingWifi
{
  return sub_1002B2284(self, (uint64_t)a2, &enum case for NWInterface.InterfaceType.wifi(_:));
}

- (BOOL)isUsingWiredEthernet
{
  return sub_1002B2284(self, (uint64_t)a2, &enum case for NWInterface.InterfaceType.wiredEthernet(_:));
}

- (MRDNetworkMonitor)init
{
  uint64_t v3 = OBJC_IVAR___MRDNetworkMonitor_monitor;
  uint64_t v4 = type metadata accessor for NWPathMonitor(0LL, a2);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)NWPathMonitor.init()();

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for NetworkMonitor();
  return -[MRDNetworkMonitor init](&v7, "init");
}

- (void).cxx_destruct
{
}

@end