@interface TVRDSiriRemoteMonitor
- (TVRCSiriRemoteInfo)siriRemoteInfo;
- (TVRDSiriRemoteMonitor)init;
- (void)activate;
- (void)handleNotification:(id)a3;
- (void)invalidate;
@end

@implementation TVRDSiriRemoteMonitor

- (TVRCSiriRemoteInfo)siriRemoteInfo
{
  v5[2] = self;
  v2 = self;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TVRCSiriRemoteInfo?);
  OS_dispatch_queue.sync<A>(execute:)( &v6,  partial apply for closure #1 in SiriRemoteMonitor.siriRemoteInfo.getter,  v5,  v3);

  return (TVRCSiriRemoteInfo *)v6;
}

- (void)activate
{
  v2 = self;
  SiriRemoteMonitor.activate()();
}

- (void)invalidate
{
  v2 = self;
  SiriRemoteMonitor.invalidate()();
}

- (void)handleNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  SiriRemoteMonitor.handleNotification(_:)(v4);
}

- (TVRDSiriRemoteMonitor)init
{
  return (TVRDSiriRemoteMonitor *)SiriRemoteMonitor.init()();
}

- (void).cxx_destruct
{
}

@end