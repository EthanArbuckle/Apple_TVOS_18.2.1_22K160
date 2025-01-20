@interface SDAirDropPeerMetric
- (NSNumber)bluetoothDiscovery;
- (NSNumber)bonjourPTRDiscovery;
- (NSNumber)bonjourResolveComplete;
- (NSNumber)bonjourTXTRecordDiscovery;
- (NSNumber)identityQueryComplete;
- (NSNumber)tcpConnectionComplete;
- (NSNumber)tlsHandshakeComplete;
- (NSNumber)totalDiscovery;
- (NSNumber)verifiableIdentity;
- (NSString)accountID;
- (NSString)modelName;
- (NSString)sessionID;
- (void)setAccountID:(id)a3;
- (void)setBluetoothDiscovery:(id)a3;
- (void)setBonjourPTRDiscovery:(id)a3;
- (void)setBonjourResolveComplete:(id)a3;
- (void)setBonjourTXTRecordDiscovery:(id)a3;
- (void)setIdentityQueryComplete:(id)a3;
- (void)setModelName:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setTcpConnectionComplete:(id)a3;
- (void)setTlsHandshakeComplete:(id)a3;
- (void)setTotalDiscovery:(id)a3;
- (void)setVerifiableIdentity:(id)a3;
@end

@implementation SDAirDropPeerMetric

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAccountID:(id)a3
{
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSessionID:(id)a3
{
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setModelName:(id)a3
{
}

- (NSNumber)bluetoothDiscovery
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setBluetoothDiscovery:(id)a3
{
}

- (NSNumber)bonjourPTRDiscovery
{
  return (NSNumber *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setBonjourPTRDiscovery:(id)a3
{
}

- (NSNumber)bonjourTXTRecordDiscovery
{
  return (NSNumber *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setBonjourTXTRecordDiscovery:(id)a3
{
}

- (NSNumber)bonjourResolveComplete
{
  return (NSNumber *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setBonjourResolveComplete:(id)a3
{
}

- (NSNumber)tcpConnectionComplete
{
  return (NSNumber *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setTcpConnectionComplete:(id)a3
{
}

- (NSNumber)tlsHandshakeComplete
{
  return (NSNumber *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setTlsHandshakeComplete:(id)a3
{
}

- (NSNumber)identityQueryComplete
{
  return (NSNumber *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setIdentityQueryComplete:(id)a3
{
}

- (NSNumber)totalDiscovery
{
  return (NSNumber *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setTotalDiscovery:(id)a3
{
}

- (NSNumber)verifiableIdentity
{
  return (NSNumber *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setVerifiableIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end