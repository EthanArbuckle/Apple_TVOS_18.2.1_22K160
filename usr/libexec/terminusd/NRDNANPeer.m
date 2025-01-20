@interface NRDNANPeer
- (BOOL)hasActiveDataSession;
- (BOOL)isInitiator;
- (NRDNANPeer)init;
- (NSString)remoteIDSDeviceID;
- (NSString)serviceName;
- (NWAddressEndpoint)peerEndpoint;
- (WiFiAwareDataSession)initiatorDataSession;
- (WiFiAwareDiscoveryResult)initiatorDiscoveryResult;
- (WiFiAwarePublisherDataSessionHandle)responderDataSession;
- (id)description;
- (unsigned)identifier;
- (unsigned)localInterfaceIndex;
- (unsigned)peerInstanceID;
- (void)setInitiatorDataSession:(id)a3;
- (void)setInitiatorDiscoveryResult:(id)a3;
- (void)setIsInitiator:(BOOL)a3;
- (void)setLocalInterfaceIndex:(unsigned int)a3;
- (void)setPeerEndpoint:(id)a3;
- (void)setPeerInstanceID:(unsigned __int8)a3;
- (void)setRemoteIDSDeviceID:(id)a3;
- (void)setResponderDataSession:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation NRDNANPeer

- (NRDNANPeer)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NRDNANPeer;
  result = -[NRDNANPeer init](&v12, "init");
  if (!result)
  {
    id v3 = sub_10010F4BC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 16LL);

    if (IsLevelEnabled)
    {
      id v5 = sub_10010F4BC();
      _NRLogWithArgs(v5, 16LL, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRDNANPeer init]"", 141);
    }

    uint64_t v6 = _os_log_pack_size(12LL);
    v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v8 = __error();
    uint64_t v9 = _os_log_pack_fill(v7, v6, *v8, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v9 = 136446210;
    *(void *)(v9 + 4) = "-[NRDNANPeer init]";
    id v10 = sub_10010F4BC();
    _NRLogAbortWithPack(v10, v7);
  }

  result->_identifier = ++dword_1001DCAE0;
  return result;
}

- (id)description
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (self->_isInitiator) {
    v4 = "I";
  }
  else {
    v4 = "R";
  }
  uint64_t peerInstanceID = self->_peerInstanceID;
  uint64_t identifier = self->_identifier;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NWAddressEndpoint hostname](self->_peerEndpoint, "hostname"));
  v8 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"NRDNANPeer[%u, %s, id %u, %@]",  identifier,  v4,  peerInstanceID,  v7);

  return v8;
}

- (BOOL)hasActiveDataSession
{
  return self->_localInterfaceIndex != 0;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (void)setIsInitiator:(BOOL)a3
{
  self->_isInitiator = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NWAddressEndpoint)peerEndpoint
{
  return self->_peerEndpoint;
}

- (void)setPeerEndpoint:(id)a3
{
}

- (unsigned)peerInstanceID
{
  return self->_peerInstanceID;
}

- (void)setPeerInstanceID:(unsigned __int8)a3
{
  self->_uint64_t peerInstanceID = a3;
}

- (unsigned)localInterfaceIndex
{
  return self->_localInterfaceIndex;
}

- (void)setLocalInterfaceIndex:(unsigned int)a3
{
  self->_localInterfaceIndex = a3;
}

- (WiFiAwareDiscoveryResult)initiatorDiscoveryResult
{
  return self->_initiatorDiscoveryResult;
}

- (void)setInitiatorDiscoveryResult:(id)a3
{
}

- (WiFiAwareDataSession)initiatorDataSession
{
  return self->_initiatorDataSession;
}

- (void)setInitiatorDataSession:(id)a3
{
}

- (WiFiAwarePublisherDataSessionHandle)responderDataSession
{
  return self->_responderDataSession;
}

- (void)setResponderDataSession:(id)a3
{
}

- (NSString)remoteIDSDeviceID
{
  return self->_remoteIDSDeviceID;
}

- (void)setRemoteIDSDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end