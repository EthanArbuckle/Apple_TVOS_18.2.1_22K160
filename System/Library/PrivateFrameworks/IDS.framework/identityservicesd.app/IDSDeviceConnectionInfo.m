@interface IDSDeviceConnectionInfo
- (BOOL)linkLayerConnected;
- (BOOL)shouldUseIPsecLink;
- (BOOL)suspendTraffic;
- (IDSDeviceConnectionInfo)init;
- (IDSPortMap)portMap;
- (IDSSockAddrWrapper)localSA;
- (IDSSockAddrWrapper)remoteSA;
- (IDSUTunControlChannel)controlChannel;
- (NEVirtualInterface_s)vifRef;
- (NSData)controlChannelCachedSYN;
- (NSMutableDictionary)connectionsByID;
- (NSMutableDictionary)serviceConnectionCache;
- (NSMutableSet)highPriorityConnectionSendingSet;
- (NSString)cbuuid;
- (NSString)controlChannelVersion;
- (NSString)deviceUniqueID;
- (NSString)vifName;
- (OS_nw_service_connector)cloudServiceConnector;
- (OS_nw_service_connector)serviceConnector;
- (SimpleUInt32ToObjectTable)connectionsTableByLocalRemotePortKey;
- (SimpleUInt32ToObjectTable)incomingEncryptionTableBySSRC;
- (SimpleUInt32ToObjectTable)outgoingEncryptionTableBySSRC;
- (channel)utunChannel;
- (channel_ring_desc)utunChannelRxRing;
- (channel_ring_desc)utunChannelTxRing;
- (double)linkLayerDisconnectTime;
- (double)suspendTrafficCheckTime;
- (double)utunChannelLastNoSlotTime;
- (id)description;
- (int)utunSocket;
- (unint64_t)capabilityFlags;
- (unsigned)instanceID;
- (unsigned)nextAvailableLocalCID;
- (unsigned)selfInstanceID;
- (unsigned)serviceMinCompatibilityVersion;
- (unsigned)utunChannelMaxSlotSize;
- (unsigned)utunChannelRxCount;
- (unsigned)utunChannelRxRingSize;
- (unsigned)utunNexusUUID;
- (void)addBlocksOnLinkConnect:(id)a3;
- (void)cancelBlockOnLinkConnectWithID:(id)a3 cancelSucceeded:(BOOL *)a4;
- (void)cancelBlocksOnLinkConnect;
- (void)clearLocalCID:(unsigned __int16)a3;
- (void)dealloc;
- (void)invalidate;
- (void)performBlocksOnLinkConnect;
- (void)setCapabilityFlags:(unint64_t)a3;
- (void)setCbuuid:(id)a3;
- (void)setCloudServiceConnector:(id)a3;
- (void)setControlChannel:(id)a3;
- (void)setControlChannelCachedSYN:(id)a3;
- (void)setControlChannelVersion:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setHighPriorityConnectionSendingSet:(id)a3;
- (void)setInstanceID:(unsigned __int8 *)(a3;
- (void)setLinkLayerConnected:(BOOL)a3;
- (void)setLinkLayerDisconnectTime:(double)a3;
- (void)setLocalSA:(id)a3;
- (void)setRemoteSA:(id)a3;
- (void)setServiceConnector:(id)a3;
- (void)setServiceMinCompatibilityVersion:(unsigned __int16)a3;
- (void)setShouldUseIPsecLink:(BOOL)a3;
- (void)setSuspendTraffic:(BOOL)a3;
- (void)setSuspendTrafficCheckTime:(double)a3;
- (void)setUtunChannel:(channel *)a3;
- (void)setUtunChannelLastNoSlotTime:(double)a3;
- (void)setUtunChannelMaxSlotSize:(unsigned int)a3;
- (void)setUtunChannelRxCount:(unsigned int)a3;
- (void)setUtunChannelRxRing:(channel_ring_desc *)a3;
- (void)setUtunChannelRxRingSize:(unsigned int)a3;
- (void)setUtunChannelTxRing:(channel_ring_desc *)a3;
- (void)setUtunNexusUUID:(unsigned __int8 *)(a3;
- (void)setUtunSocket:(int)a3;
- (void)setVifName:(id)a3;
- (void)setVifRef:(NEVirtualInterface_s *)a3;
@end

@implementation IDSDeviceConnectionInfo

- (IDSDeviceConnectionInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSDeviceConnectionInfo;
  v2 = -[IDSDeviceConnectionInfo init](&v4, "init");
  if (v2)
  {
    *((void *)v2 + 4) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *((void *)v2 + 8) = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    if (qword_1009BE5D0 != -1) {
      dispatch_once(&qword_1009BE5D0, &stru_1008F66B0);
    }
    *((double *)v2 + 1036) = *(double *)&qword_1009BE5D8 * (double)mach_continuous_time();
    sub_1001BFD7C(v2 + 72);
    sub_1001BFD2C(0LL, (uint64_t)(v2 + 72));
    sub_1002A3CC8((uint64_t)(v2 + 8320));
    sub_1002A4408((uint64_t)(v2 + 8320), 0x400u);
    sub_1002A4408((uint64_t)(v2 + 8320), 0x401u);
    sub_1003BB06C((uint64_t)(v2 + 16528), 32);
    sub_1003BB06C((uint64_t)(v2 + 16552), 32);
    sub_1003BB06C((uint64_t)(v2 + 16576), 32);
    *((void *)v2 + 2075) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *((_DWORD *)v2 + 4152) = -1;
    uuid_generate((unsigned __int8 *)v2 + 21968);
    *((void *)v2 + 2079) = 0LL;
    *((_DWORD *)v2 + 4160) = 0;
    uuid_clear((unsigned __int8 *)v2 + 16612);
    *(_OWORD *)(v2 + 16648) = 0u;
    *((void *)v2 + 2083) = 0LL;
    *((void *)v2 + 2745) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return (IDSDeviceConnectionInfo *)v2;
}

- (IDSPortMap)portMap
{
  return &self->_portMap;
}

- (SimpleUInt32ToObjectTable)connectionsTableByLocalRemotePortKey
{
  return &self->_connectionsTableByLocalRemotePortKey;
}

- (SimpleUInt32ToObjectTable)outgoingEncryptionTableBySSRC
{
  return &self->_outgoingEncryptionTableBySSRC;
}

- (SimpleUInt32ToObjectTable)incomingEncryptionTableBySSRC
{
  return &self->_incomingEncryptionTableBySSRC;
}

- (unsigned)utunNexusUUID
{
  return (unsigned __int8 (*)[16])self->_utunNexusUUID;
}

- (void)setUtunNexusUUID:(unsigned __int8 *)(a3
{
  *(_OWORD *)self->_utunNexusUUID = *(_OWORD *)a3;
}

- (unsigned)selfInstanceID
{
  return (unsigned __int8 (*)[16])self->_selfInstanceID;
}

- (unsigned)instanceID
{
  return (unsigned __int8 (*)[16])self->_instanceID;
}

- (void)setInstanceID:(unsigned __int8 *)(a3
{
  *(_OWORD *)self->_instanceID = *(_OWORD *)a3;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%p>: name[%@] cbuuid[%@] deviceUniqueID[%@] vifRef[%p] sa[%@]",  self,  self->_vifName,  self->_cbuuid,  self->_deviceUniqueID,  self->_vifRef,  self->_remoteSA);
}

- (void)dealloc
{
  p_utunSocket = &self->_utunSocket;
  vifRef = self->_vifRef;
  if (vifRef)
  {
    NEVirtualInterfaceInvalidate(vifRef);
    v5 = self->_vifRef;
    if (v5)
    {
      CFRelease(v5);
      self->_vifRef = 0LL;
    }
  }

  sub_1003BB694((uint64_t)&self->_connectionsTableByLocalRemotePortKey, (uint64_t)&stru_1008F6650);
  sub_1003BB09C((uint64_t)&self->_connectionsTableByLocalRemotePortKey);
  sub_1003BB694((uint64_t)&self->_outgoingEncryptionTableBySSRC, (uint64_t)&stru_1008F6670);
  sub_1003BB09C((uint64_t)&self->_outgoingEncryptionTableBySSRC);
  sub_1003BB694((uint64_t)&self->_incomingEncryptionTableBySSRC, (uint64_t)&stru_1008F6690);
  sub_1003BB09C((uint64_t)&self->_incomingEncryptionTableBySSRC);

  utunChannel = self->_utunChannel;
  if (utunChannel)
  {
    os_channel_destroy(utunChannel, v6);
    self->_utunChannel = 0LL;
  }

  p_numPackets = &self->regularPackets.numPackets;
  p_utunSocket[8] = 0;
  uuid_clear(self->_utunNexusUUID);
  *(_OWORD *)&self->_utunChannelTxRing = 0u;
  *(void *)&self->_utunChannelRxCount = 0LL;
  if (*p_utunSocket != -1)
  {
    close(*p_utunSocket);
    int *p_utunSocket = -1;
  }

  unint64_t v9 = p_utunSocket[675];
  if (v9 < p_utunSocket[674])
  {
    v10 = &self->urgentPackets.genericConnection[v9];
    do
    {
      objc_storeWeak(v10, 0LL);
      ++v9;
      ++v10;
    }

    while (v9 < p_utunSocket[674]);
  }

  unint64_t nextPacket = self->regularPackets.nextPacket;
  if (nextPacket < *p_numPackets)
  {
    v12 = &self->regularPackets.genericConnection[nextPacket];
    do
    {
      objc_storeWeak(v12, 0LL);
      ++nextPacket;
      ++v12;
    }

    while (nextPacket < *p_numPackets);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  serviceConnectionCache = self->_serviceConnectionCache;
  id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( serviceConnectionCache,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(serviceConnectionCache);
        }
        nw_connection_cancel((nw_connection_t)-[NSMutableDictionary objectForKeyedSubscript:]( self->_serviceConnectionCache,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i)));
      }

      id v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( serviceConnectionCache,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v15);
  }

  -[NSMutableDictionary removeAllObjects](self->_serviceConnectionCache, "removeAllObjects");

  if (self->_serviceConnector)
  {
    nw_service_connector_cancel();
    nw_release(self->_serviceConnector);
    self->_serviceConnector = 0LL;
  }

  if (self->_cloudServiceConnector)
  {
    nw_service_connector_cancel();
    nw_release(self->_cloudServiceConnector);
    self->_cloudServiceConnector = 0LL;
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSDeviceConnectionInfo;
  -[IDSDeviceConnectionInfo dealloc](&v18, "dealloc");
}

- (unsigned)nextAvailableLocalCID
{
  int v2 = 0;
  localCIDSet = self->_localCIDSet;
  while (sub_1001BFD64((unsigned __int16)v2, (uint64_t)localCIDSet))
  {
    if (++v2 == 0xFFFF)
    {
      LOWORD(v2) = -1;
      return v2;
    }
  }

  objc_super v4 = (os_log_s *)+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Assign localCID(%04x) from CID set",  (uint8_t *)v6,  8u);
  }

  sub_1001BFD2C((unsigned __int16)v2, (uint64_t)localCIDSet);
  return v2;
}

- (void)clearLocalCID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = (os_log_s *)+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v3)
  {
    if (v6)
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Clear localCID(%04x) from CID set",  (uint8_t *)v7,  8u);
    }

    sub_1001BFD48(v3, (uint64_t)self->_localCIDSet);
  }

  else if (v6)
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Attempt to clear reserved CID 0, skip.",  (uint8_t *)v7,  2u);
  }

- (void)addBlocksOnLinkConnect:(id)a3
{
  if (a3)
  {
    id v4 = [a3 copy];
    -[NSMutableArray addObject:](self->_blocksOnLinkConnect, "addObject:", v4);
  }

- (void)performBlocksOnLinkConnect
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  blocksOnLinkConnect = self->_blocksOnLinkConnect;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( blocksOnLinkConnect,  "countByEnumeratingWithState:objects:count:",  &v13,  v19,  16LL);
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v14;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v12 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(blocksOnLinkConnect);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (v9)
        {
          v10 = (os_log_s *)+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            cbuuid = self->_cbuuid;
            *(_DWORD *)buf = v12;
            objc_super v18 = cbuuid;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Link is connected, perform a block for %@",  buf,  0xCu);
          }

          (*(void (**)(uint64_t, void, void, void))(v9 + 16))(v9, 0LL, 0LL, 0LL);
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( blocksOnLinkConnect,  "countByEnumeratingWithState:objects:count:",  &v13,  v19,  16LL);
    }

    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_blocksOnLinkConnect, "removeAllObjects", v12);
}

- (void)cancelBlockOnLinkConnectWithID:(id)a3 cancelSucceeded:(BOOL *)a4
{
  if (a3 && a4)
  {
    id v7 = -[NSMutableArray count](self->_blocksOnLinkConnect, "count");
    *a4 = 0;
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0LL;
      while (1)
      {
        v10 = (void (**)(id, void, id, BOOL *))-[NSMutableArray objectAtIndex:]( self->_blocksOnLinkConnect,  "objectAtIndex:",  v9);
        if (v10)
        {
          v10[2](v10, 0LL, a3, a4);
          if (*a4) {
            break;
          }
        }

        if (v8 == (id)++v9) {
          return;
        }
      }

      __int128 v12 = (os_log_s *)+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        cbuuid = self->_cbuuid;
        int v14 = 138412546;
        id v15 = a3;
        __int16 v16 = 2112;
        v17 = cbuuid;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Cancel block by ID succeeded: %@ for %@",  (uint8_t *)&v14,  0x16u);
      }

      -[NSMutableArray removeObjectAtIndex:](self->_blocksOnLinkConnect, "removeObjectAtIndex:", v9);
    }
  }

  else
  {
    v11 = (os_log_s *)+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Cancelling block by ID needs to pass in ID and success var.",  (uint8_t *)&v14,  2u);
    }
  }

- (void)cancelBlocksOnLinkConnect
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  blocksOnLinkConnect = self->_blocksOnLinkConnect;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( blocksOnLinkConnect,  "countByEnumeratingWithState:objects:count:",  &v13,  v19,  16LL);
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v14;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v12 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(blocksOnLinkConnect);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (v9)
        {
          v10 = (os_log_s *)+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            cbuuid = self->_cbuuid;
            *(_DWORD *)buf = v12;
            objc_super v18 = cbuuid;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Link is connected, cancel a block for %@",  buf,  0xCu);
          }

          (*(void (**)(uint64_t, uint64_t, void, void))(v9 + 16))(v9, 1LL, 0LL, 0LL);
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( blocksOnLinkConnect,  "countByEnumeratingWithState:objects:count:",  &v13,  v19,  16LL);
    }

    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_blocksOnLinkConnect, "removeAllObjects", v12);
}

- (void)invalidate
{
  p_utunSocket = &self->_utunSocket;
  utunChannel = self->_utunChannel;
  if (utunChannel)
  {
    os_channel_destroy(utunChannel, a2);
    self->_utunChannel = 0LL;
  }

  p_utunSocket[8] = 0;
  uuid_clear(self->_utunNexusUUID);
  *(_OWORD *)&self->_utunChannelTxRing = 0u;
  *(void *)&self->_utunChannelRxCount = 0LL;
  NEVirtualInterfaceInvalidate(self->_vifRef);
  vifRef = self->_vifRef;
  if (vifRef) {
    CFRelease(vifRef);
  }
  self->_vifRef = 0LL;
  if (*p_utunSocket != -1)
  {
    close(*p_utunSocket);
    int *p_utunSocket = -1;
  }

  if (self->_serviceConnector)
  {
    nw_service_connector_cancel();
    nw_release(self->_serviceConnector);
    self->_serviceConnector = 0LL;
  }

  if (self->_cloudServiceConnector)
  {
    nw_service_connector_cancel();
    nw_release(self->_cloudServiceConnector);
    self->_cloudServiceConnector = 0LL;
  }

- (NSString)cbuuid
{
  return self->_cbuuid;
}

- (void)setCbuuid:(id)a3
{
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (IDSSockAddrWrapper)remoteSA
{
  return self->_remoteSA;
}

- (void)setRemoteSA:(id)a3
{
}

- (NSMutableDictionary)connectionsByID
{
  return self->_connectionsByID;
}

- (IDSUTunControlChannel)controlChannel
{
  return self->_controlChannel;
}

- (void)setControlChannel:(id)a3
{
}

- (NSData)controlChannelCachedSYN
{
  return self->_controlChannelCachedSYN;
}

- (void)setControlChannelCachedSYN:(id)a3
{
}

- (NSMutableSet)highPriorityConnectionSendingSet
{
  return self->_highPriorityConnectionSendingSet;
}

- (void)setHighPriorityConnectionSendingSet:(id)a3
{
}

- (BOOL)suspendTraffic
{
  return self->_suspendTraffic;
}

- (void)setSuspendTraffic:(BOOL)a3
{
  self->_suspendTraffic = a3;
}

- (double)suspendTrafficCheckTime
{
  return self->_suspendTrafficCheckTime;
}

- (void)setSuspendTrafficCheckTime:(double)a3
{
  self->_suspendTrafficCheckTime = a3;
}

- (BOOL)linkLayerConnected
{
  return self->_linkLayerConnected;
}

- (void)setLinkLayerConnected:(BOOL)a3
{
  self->_linkLayerConnected = a3;
}

- (double)linkLayerDisconnectTime
{
  return self->_linkLayerDisconnectTime;
}

- (void)setLinkLayerDisconnectTime:(double)a3
{
  self->_linkLayerDisconnectTime = a3;
}

- (NEVirtualInterface_s)vifRef
{
  return self->_vifRef;
}

- (void)setVifRef:(NEVirtualInterface_s *)a3
{
  self->_vifRef = a3;
}

- (channel)utunChannel
{
  return self->_utunChannel;
}

- (void)setUtunChannel:(channel *)a3
{
  self->_utunChannel = a3;
}

- (unsigned)utunChannelMaxSlotSize
{
  return self->_utunChannelMaxSlotSize;
}

- (void)setUtunChannelMaxSlotSize:(unsigned int)a3
{
  self->_utunChannelMaxSlotSize = a3;
}

- (channel_ring_desc)utunChannelTxRing
{
  return self->_utunChannelTxRing;
}

- (void)setUtunChannelTxRing:(channel_ring_desc *)a3
{
  self->_utunChannelTxRing = a3;
}

- (channel_ring_desc)utunChannelRxRing
{
  return self->_utunChannelRxRing;
}

- (void)setUtunChannelRxRing:(channel_ring_desc *)a3
{
  self->_utunChannelRxRing = a3;
}

- (unsigned)utunChannelRxCount
{
  return self->_utunChannelRxCount;
}

- (void)setUtunChannelRxCount:(unsigned int)a3
{
  self->_utunChannelRxCount = a3;
}

- (unsigned)utunChannelRxRingSize
{
  return self->_utunChannelRxRingSize;
}

- (void)setUtunChannelRxRingSize:(unsigned int)a3
{
  self->_utunChannelRxRingSize = a3;
}

- (double)utunChannelLastNoSlotTime
{
  return self->_utunChannelLastNoSlotTime;
}

- (void)setUtunChannelLastNoSlotTime:(double)a3
{
  self->_utunChannelLastNoSlotTime = a3;
}

- (NSString)vifName
{
  return self->_vifName;
}

- (void)setVifName:(id)a3
{
}

- (IDSSockAddrWrapper)localSA
{
  return self->_localSA;
}

- (void)setLocalSA:(id)a3
{
}

- (int)utunSocket
{
  return self->_utunSocket;
}

- (void)setUtunSocket:(int)a3
{
  self->_utunSocket = a3;
}

- (unint64_t)capabilityFlags
{
  return self->_capabilityFlags;
}

- (void)setCapabilityFlags:(unint64_t)a3
{
  self->_capabilityFlags = a3;
}

- (unsigned)serviceMinCompatibilityVersion
{
  return self->_serviceMinCompatibilityVersion;
}

- (void)setServiceMinCompatibilityVersion:(unsigned __int16)a3
{
  self->_serviceMinCompatibilityVersion = a3;
}

- (BOOL)shouldUseIPsecLink
{
  return self->_shouldUseIPsecLink;
}

- (void)setShouldUseIPsecLink:(BOOL)a3
{
  self->_shouldUseIPsecLink = a3;
}

- (OS_nw_service_connector)serviceConnector
{
  return self->_serviceConnector;
}

- (void)setServiceConnector:(id)a3
{
}

- (OS_nw_service_connector)cloudServiceConnector
{
  return self->_cloudServiceConnector;
}

- (void)setCloudServiceConnector:(id)a3
{
}

- (NSString)controlChannelVersion
{
  return self->_controlChannelVersion;
}

- (void)setControlChannelVersion:(id)a3
{
}

- (NSMutableDictionary)serviceConnectionCache
{
  return self->_serviceConnectionCache;
}

@end