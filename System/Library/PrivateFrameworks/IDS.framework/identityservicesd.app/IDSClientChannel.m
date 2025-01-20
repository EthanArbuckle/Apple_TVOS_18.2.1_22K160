@interface IDSClientChannel
- (BOOL)clientReady;
- (BOOL)closed;
- (BOOL)connectWithTransportThread;
- (BOOL)hasMetadata;
- (BOOL)readDatagram:(const void *)a3 datagramSize:(unsigned int *)a4 metaData:(const void *)a5 metadataSize:(unsigned int *)a6;
- (BOOL)verboseFunctionalLogging;
- (BOOL)verbosePerformanceLogging;
- (BOOL)writable;
- (BOOL)writeBuffer:(char *)a3 bufferSize:(unsigned int)a4 metaData:(const void *)a5 metadataSize:(unsigned int)a6 moreComing:(BOOL)a7;
- (BOOL)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 metaData:(const void *)a5 metadataSize:(unsigned int)a6;
- (BOOL)writePacketBuffer:(id *)a3 metaData:(const void *)a4 metadataSize:(unsigned int)a5 moreComing:(BOOL)a6;
- (IDSClientChannel)initWithDestination:(id)a3;
- (NSMutableArray)cachedDataForClient;
- (NSString)destination;
- (NSUUID)uuid;
- (id)description;
- (id)packetBufferHandler;
- (id)readHandler;
- (id)writeHandler;
- (int)excessiveCachingCount;
- (int)excessiveCachingReportCounter;
- (int64_t)transportType;
- (unint64_t)clientUniquePID;
- (void)connectWithProtocoHandler;
- (void)dealloc;
- (void)invalidate;
- (void)osChannelInfoLog;
- (void)setCachedDataForClient:(id)a3;
- (void)setClientReady:(BOOL)a3;
- (void)setExcessiveCachingCount:(int)a3;
- (void)setExcessiveCachingReportCounter:(int)a3;
- (void)setPacketBufferHandler:(id)a3;
- (void)setReadHandler:(id)a3;
- (void)setUUID:(id)a3;
- (void)setVerboseFunctionalLogging:(BOOL)a3;
- (void)setVerbosePerformanceLogging:(BOOL)a3;
- (void)setWriteHandler:(id)a3;
@end

@implementation IDSClientChannel

- (IDSClientChannel)initWithDestination:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSClientChannel;
  v5 = -[IDSClientChannel init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    destination = v5->_destination;
    v5->_destination = v6;
  }

  return v5;
}

- (id)description
{
  destination = self->_destination;
  uuid = self->_uuid;
  id v5 = objc_retainBlock(self->_readHandler);
  id v6 = objc_retainBlock(self->_packetBufferHandler);
  id v7 = objc_retainBlock(self->_writeHandler);
  id v8 = objc_retainBlock(self->_connectHandler);
  objc_super v9 = v8;
  if (self->_hasMetadata) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IDSClientChannel %p destination %@ uuid %@ readHandler %p packetBufferHandler %p writeHandler %p connectHandler %p hasMetadata %@",  self,  destination,  uuid,  v5,  v6,  v7,  v8,  v10));

  return v11;
}

- (void)dealloc
{
  osChannelAttributes = self->_osChannelAttributes;
  if (osChannelAttributes)
  {
    os_channel_attr_destroy(osChannelAttributes, a2);
    self->_osChannelAttributes = 0LL;
  }

  free(self->_clientProtocol);
  path = self->_path;
  self->_path = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSClientChannel;
  -[IDSClientChannel dealloc](&v5, "dealloc");
}

- (BOOL)readDatagram:(const void *)a3 datagramSize:(unsigned int *)a4 metaData:(const void *)a5 metadataSize:(unsigned int *)a6
{
  return 1;
}

- (BOOL)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 metaData:(const void *)a5 metadataSize:(unsigned int)a6
{
  if (self->_clientReady)
  {
    if (!self->_nwChannel)
    {
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannel]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannel",  a3,  *(void *)&a4,  a5));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v32 = a4;
        __int16 v33 = 2048;
        uint64_t v34 = a6;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "writeDatagram: attempt to send client data %lu metadata %lu but no channel",  buf,  0x16u);
      }

      return 0;
    }

    if (self->_closed)
    {
      objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannel]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannel",  a3,  *(void *)&a4,  a5));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v10 = "writeDatagram: channel closed";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
        goto LABEL_9;
      }

      goto LABEL_9;
    }

    uint64_t protocol_handler = nw_channel_get_protocol_handler();
    if (self->_verboseFunctionalLogging)
    {
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannel](&OBJC_CLASS___IDSFoundationLog, "ClientChannel"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(protocol_handler + 56);
        *(_DWORD *)buf = 134218752;
        uint64_t v32 = a4;
        __int16 v33 = 2048;
        uint64_t v34 = a6;
        __int16 v35 = 2048;
        uint64_t v36 = protocol_handler;
        __int16 v37 = 2048;
        uint64_t v38 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "writeDatagram: have data %lu metadata %lu to send to client protocol %p context %p",  buf,  0x2Au);
      }
    }

    v30[0] = 0xAAAAAAAAAAAAAAAALL;
    v30[1] = 0xAAAAAAAAAAAAAAAALL;
    if (!(*(unsigned int (**)(uint64_t, nw_protocol *, uint64_t, uint64_t, uint64_t, void *))(*(void *)(protocol_handler + 24) + 88LL))( protocol_handler,  self->_clientProtocol,  1LL,  0xFFFFFFFFLL,  1LL,  v30)) {
      return 0;
    }
    uint64_t v19 = nw_frame_array_first(v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    unsigned int v29 = 0;
    v21 = (_WORD *)nw_frame_unclaimed_bytes(v20, &v29);
    BOOL hasMetadata = self->_hasMetadata;
    unsigned int v23 = a6 + 2;
    if (!self->_hasMetadata) {
      unsigned int v23 = 0;
    }
    uint64_t v24 = v23 + a4;
    BOOL v12 = v29 >= v24;
    if (v29 < v24)
    {
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannel](&OBJC_CLASS___IDSFoundationLog, "ClientChannel"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        uint64_t v32 = a4;
        __int16 v33 = 2048;
        uint64_t v34 = a6;
        __int16 v35 = 2048;
        uint64_t v36 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "writeDatagram: have data %lu metadata %lu to send to client but not enough bytes (%lu) in frame",  buf,  0x20u);
      }

      nw_frame_array_foreach(v30, 1LL, &stru_1008F7828);
      goto LABEL_36;
    }

    v25 = v21;
    if (hasMetadata)
    {
      _WORD *v21 = bswap32(a6) >> 16;
      if (a6) {
        memcpy(v21 + 1, a5, a6);
      }
      if (!a4) {
        goto LABEL_35;
      }
      v21 = (_WORD *)((char *)v25 + a6 + 2);
      size_t v26 = a4;
    }

    else
    {
      if (!a4)
      {
LABEL_35:
        nw_frame_claim(v20, protocol_handler, v24, 0LL);
        nw_frame_collapse(v20);
        nw_frame_unclaim(v20, protocol_handler, v24, 0LL);
        (*(void (**)(uint64_t, void *))(*(void *)(protocol_handler + 24) + 96LL))(protocol_handler, v30);
LABEL_36:

        return v12;
      }

      size_t v26 = a4;
    }

    memcpy(v21, a3, v26);
    goto LABEL_35;
  }

  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannel]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannel",  a3,  *(void *)&a4,  a5,  *(void *)&a6));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v10 = "writeDatagram: client not ready yet - return NO for caller to cache";
    goto LABEL_8;
  }

- (BOOL)writePacketBuffer:(id *)a3 metaData:(const void *)a4 metadataSize:(unsigned int)a5 moreComing:(BOOL)a6
{
  if (!self->_clientReady)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannel]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannel",  a3,  a4,  *(void *)&a5,  a6));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "writePacketBuffer: client not ready yet - return NO for caller to cache";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }

- (BOOL)writeBuffer:(char *)a3 bufferSize:(unsigned int)a4 metaData:(const void *)a5 metadataSize:(unsigned int)a6 moreComing:(BOOL)a7
{
  if (!self->_clientReady)
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ClientChannel]( &OBJC_CLASS___IDSFoundationLog,  "ClientChannel",  a3,  *(void *)&a4,  a5,  *(void *)&a6,  a7));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "writeBuffer: client not ready yet - return NO for caller to cache";
      goto LABEL_10;
    }

- (void)setWriteHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (!self->_clientReady)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannel](&OBJC_CLASS___IDSFoundationLog, "ClientChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "setWriteHandler: client not ready yet - will not set writeHandler";
      id v8 = buf;
      goto LABEL_7;
    }

- (BOOL)writable
{
  return 1;
}

- (BOOL)connectWithTransportThread
{
  if (self->_closed)
  {
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannel](&OBJC_CLASS___IDSFoundationLog, "ClientChannel"));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "connectWithTransportThread: channel closed",  v6,  2u);
    }

    return 0;
  }

  else
  {
    id v4 = self;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSClientChannelManager sharedInstance](&OBJC_CLASS___IDSClientChannelManager, "sharedInstance"));
    LOBYTE(v4) = [v5 connectTransportThreadForClient:v4];

    return (char)v4;
  }

- (void)connectWithProtocoHandler
{
  if (self->_closed)
  {
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannel](&OBJC_CLASS___IDSFoundationLog, "ClientChannel"));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "connectWithProtocoHandler: channel closed",  buf,  2u);
    }
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[IDSClientChannelManager sharedInstance](&OBJC_CLASS___IDSClientChannelManager, "sharedInstance"));
    [v4 connectProtocolHandlerForClient:self];
  }

- (void)invalidate
{
  id writeHandler = self->_writeHandler;
  self->_id writeHandler = 0LL;

  id readHandler = self->_readHandler;
  self->_id readHandler = 0LL;

  self->_closed = 1;
}

- (void)osChannelInfoLog
{
  osChannel = self->_osChannel;
  if (!osChannel)
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannel](&OBJC_CLASS___IDSFoundationLog, "ClientChannel"));
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v17) = 0;
    v10 = "osChannelInfoLog: _osChannel is NULL.";
    uint64_t v11 = v15;
    uint32_t v12 = 2;
    goto LABEL_13;
  }

  uint64_t v4 = os_channel_ring_id(osChannel, 2LL);
  uint64_t v5 = os_channel_rx_ring(self->_osChannel, v4);
  uint64_t v6 = os_channel_ring_id(self->_osChannel, 0LL);
  uint64_t v7 = os_channel_tx_ring(self->_osChannel, v6);
  uint64_t v8 = v7;
  if (v5) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannel](&OBJC_CLASS___IDSFoundationLog, "ClientChannel"));
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v17 = 134218240;
    *(void *)uint64_t v18 = v5;
    *(_WORD *)&v18[8] = 2048;
    uint64_t v19 = v8;
    v10 = "osChannelInfoLog: os_channel ring is NULL (_osChannelRXRing %p, _osChannelTXRing %p)";
    uint64_t v11 = v15;
    uint32_t v12 = 22;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
    goto LABEL_14;
  }

  int v13 = os_channel_available_slot_count(v5);
  int v14 = os_channel_available_slot_count(v8);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ClientChannel](&OBJC_CLASS___IDSFoundationLog, "ClientChannel"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109376;
    *(_DWORD *)uint64_t v18 = v13;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = v14;
    v10 = "osChannelInfoLog: os_channel rx slot count %u tx slot count %u";
    uint64_t v11 = v15;
    uint32_t v12 = 14;
    goto LABEL_13;
  }

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUUID:(id)a3
{
}

- (id)readHandler
{
  return self->_readHandler;
}

- (void)setReadHandler:(id)a3
{
}

- (id)writeHandler
{
  return self->_writeHandler;
}

- (BOOL)hasMetadata
{
  return self->_hasMetadata;
}

- (int)excessiveCachingReportCounter
{
  return self->_excessiveCachingReportCounter;
}

- (void)setExcessiveCachingReportCounter:(int)a3
{
  self->_excessiveCachingReportCounter = a3;
}

- (int)excessiveCachingCount
{
  return self->_excessiveCachingCount;
}

- (void)setExcessiveCachingCount:(int)a3
{
  self->_excessiveCachingCount = a3;
}

- (BOOL)clientReady
{
  return self->_clientReady;
}

- (void)setClientReady:(BOOL)a3
{
  self->_clientReady = a3;
}

- (NSString)destination
{
  return self->_destination;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (BOOL)closed
{
  return self->_closed;
}

- (BOOL)verboseFunctionalLogging
{
  return self->_verboseFunctionalLogging;
}

- (void)setVerboseFunctionalLogging:(BOOL)a3
{
  self->_verboseFunctionalLogging = a3;
}

- (BOOL)verbosePerformanceLogging
{
  return self->_verbosePerformanceLogging;
}

- (void)setVerbosePerformanceLogging:(BOOL)a3
{
  self->_verbosePerformanceLogging = a3;
}

- (id)packetBufferHandler
{
  return self->_packetBufferHandler;
}

- (void)setPacketBufferHandler:(id)a3
{
}

- (NSMutableArray)cachedDataForClient
{
  return self->_cachedDataForClient;
}

- (void)setCachedDataForClient:(id)a3
{
}

- (unint64_t)clientUniquePID
{
  return self->_clientUniquePID;
}

- (void).cxx_destruct
{
}

@end