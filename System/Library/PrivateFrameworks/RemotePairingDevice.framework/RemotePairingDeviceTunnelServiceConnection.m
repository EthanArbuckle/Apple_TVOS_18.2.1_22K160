@interface RemotePairingDeviceTunnelServiceConnection
- (_TtC19RemotePairingDevice42RemotePairingDeviceTunnelServiceConnection)init;
- (id)copyRemoteUnlockDeviceKeyForTunnelWithTunnelName:(id)a3 error:(id *)a4;
@end

@implementation RemotePairingDeviceTunnelServiceConnection

- (_TtC19RemotePairingDevice42RemotePairingDeviceTunnelServiceConnection)init
{
  return (_TtC19RemotePairingDevice42RemotePairingDeviceTunnelServiceConnection *)RemotePairingDeviceTunnelServiceConnection.init()();
}

- (id)copyRemoteUnlockDeviceKeyForTunnelWithTunnelName:(id)a3 error:(id *)a4
{
  v5 = self;
  uint64_t v6 = RemotePairingDeviceTunnelServiceConnection.copyRemoteUnlockDeviceKeyForTunnel(tunnelName:)();
  unint64_t v8 = v7;
  swift_bridgeObjectRelease();

  v9 = (void *)sub_1884C971C();
  sub_18842A58C(v6, v8);
  return v9;
}

- (void).cxx_destruct
{
}

@end