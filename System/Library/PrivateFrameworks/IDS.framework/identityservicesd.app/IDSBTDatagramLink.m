@interface IDSBTDatagramLink
- (IDSBTDatagramLink)initWithPipe:(id)a3 withDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (NSString)cbuuid;
- (NSString)deviceUniqueID;
- (NSString)linkTypeString;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (void)_processIncomingPacket;
- (void)dealloc;
- (void)invalidate;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)start;
@end

@implementation IDSBTDatagramLink

- (IDSBTDatagramLink)initWithPipe:(id)a3 withDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___IDSBTDatagramLink;
  v12 = -[IDSBTDatagramLink init](&v22, "init");
  v13 = v12;
  if (!v12) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v12->_pipe, a3);
  v14 = (channel *)[v9 channel];
  v13->_channel = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v13->_cbuuid, kIDSDefaultPairedDeviceID);
    objc_storeStrong((id *)&v13->_deviceUniqueID, a4);
LABEL_4:
    v15 = v13;
    goto LABEL_12;
  }

  uint64_t v16 = OSLogHandleForTransportCategory("BTDatagramLink");
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "-init failed due to null channel",  (uint8_t *)v21,  2u);
  }

  uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
  if ((_DWORD)v19)
  {
    if (_IDSShouldLogTransport(v19))
    {
      _IDSLogTransport(@"BTDatagramLink", @"IDS", @"-init failed due to null channel");
    }
  }

  v15 = 0LL;
LABEL_12:

  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSBTDatagramLink;
  -[IDSBTDatagramLink dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  p_channel = &self->_channel;
  channel = self->_channel;
  if (channel) {
    uint64_t fd = os_channel_get_fd(channel, a2);
  }
  else {
    uint64_t fd = 0xFFFFFFFFLL;
  }
  uint64_t v6 = OSLogHandleForTransportCategory("BTDatagramLink");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_channel;
    rxRing = self->_rxRing;
    txRing = self->_txRing;
    *(_DWORD *)buf = 138413314;
    v13 = self;
    __int16 v14 = 2048;
    v15 = v8;
    __int16 v16 = 1024;
    int v17 = fd;
    __int16 v18 = 2048;
    uint64_t v19 = rxRing;
    __int16 v20 = 2048;
    v21 = txRing;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ -invalidate called. Channel %p fd %d rxRing %p txRing %p",  buf,  0x30u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport( @"BTDatagramLink",  @"IDS",  @"%@ -invalidate called. Channel %p fd %d rxRing %p txRing %p");
      if (_IDSShouldLog(0LL, @"BTDatagramLink")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"BTDatagramLink",  @"%@ -invalidate called. Channel %p fd %d rxRing %p txRing %p");
      }
    }
  }

  self->_state = 5LL;
  if ((_DWORD)fd != -1) {
    IDSTransportThreadRemoveSocket(fd);
  }
  _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTDatagramLink.m",  51LL,  self->_currentIncomingPacket);
  *(_OWORD *)p_channel = 0u;
  *((_OWORD *)p_channel + 1) = 0u;
  pipe = self->_pipe;
  self->_pipe = 0LL;
}

- (unint64_t)headerOverhead
{
  return -1LL;
}

- (NSString)linkTypeString
{
  return (NSString *)@"MagnetIso";
}

- (void)start
{
  uint64_t fd = os_channel_get_fd(self->_channel, a2);
  uint64_t v4 = os_channel_ring_id(self->_channel, 2LL);
  self->_rxRing = (channel_ring_desc *)os_channel_rx_ring(self->_channel, v4);
  uint64_t v5 = os_channel_ring_id(self->_channel, 0LL);
  self->_txRing = (channel_ring_desc *)os_channel_tx_ring(self->_channel, v5);
  uint64_t v6 = OSLogHandleForTransportCategory("BTDatagramLink");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    channel = self->_channel;
    rxRing = self->_rxRing;
    txRing = self->_txRing;
    *(_DWORD *)buf = 134218752;
    v15 = channel;
    __int16 v16 = 1024;
    int v17 = fd;
    __int16 v18 = 2048;
    uint64_t v19 = rxRing;
    __int16 v20 = 2048;
    v21 = txRing;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "-start called. Channel %p fd %d rxRing %p txRing %p",  buf,  0x26u);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      _IDSLogTransport( @"BTDatagramLink",  @"IDS",  @"-start called. Channel %p fd %d rxRing %p txRing %p");
      if (_IDSShouldLog(0LL, @"BTDatagramLink")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"BTDatagramLink",  @"-start called. Channel %p fd %d rxRing %p txRing %p");
      }
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000091A8;
  v13[3] = &unk_1008F6010;
  v13[4] = self;
  IDSTransportThreadAddSocket(fd, v13, 0LL);
  self->_state = 4LL;
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_channel)
  {
    if (a3->var2 >= 676)
    {
      uint64_t v10 = OSLogHandleForTransportCategory("BTDatagramLink");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int64_t var2 = a3->var2;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = var2;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "DLW 0/%d (packet size too large for link)",  buf,  8u);
      }

      uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
      if ((_DWORD)v14)
      {
        if (_IDSShouldLogTransport(v14))
        {
          _IDSLogTransport(@"BTDatagramLink", @"IDS", @"DLW 0/%d (packet size too large for link)");
          if (_IDSShouldLog(0LL, @"BTDatagramLink")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"BTDatagramLink",  @"DLW 0/%d (packet size too large for link)");
          }
        }
      }

      _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTDatagramLink.m",  97LL,  a3);
LABEL_21:
      unint64_t v15 = 4LL;
      goto LABEL_43;
    }

    txRing = self->_txRing;
    if (os_channel_available_slot_count(txRing)
      || (os_channel_sync(self->_channel, 0LL), os_channel_available_slot_count(txRing)))
    {
      *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v45 = v17;
      __int128 v46 = v17;
      *(_OWORD *)buf = v17;
      *(_OWORD *)__dst = v17;
      uint64_t next_slot = os_channel_get_next_slot(txRing, 0LL, buf);
      int64_t v19 = a3->var2;
      if (v19 > *(unsigned __int16 *)&buf[2])
      {
        uint64_t v20 = OSLogHandleForTransportCategory("BTDatagramLink");
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v22 = a3->var2;
          *(_DWORD *)v39 = 67109376;
          int v40 = v22;
          __int16 v41 = 1024;
          int v42 = *(unsigned __int16 *)&buf[2];
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "DLW 0/%d (slot %d too small)", v39, 0xEu);
        }

        uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
        if ((_DWORD)v24)
        {
          if (_IDSShouldLogTransport(v24))
          {
            _IDSLogTransport(@"BTDatagramLink", @"IDS", @"DLW 0/%d (slot %d too small)");
          }
        }

        _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTDatagramLink.m",  115LL,  a3);
        goto LABEL_21;
      }

      uint64_t v25 = next_slot;
      *(_WORD *)buf = 0;
      *(_WORD *)&buf[2] = v19;
      memcpy(__dst[0], a3->var0, v19);
      os_channel_set_slot_properties(txRing, v25, buf);
      int v26 = os_channel_advance_slot(txRing, v25);
      if (v26)
      {
        uint64_t v27 = OSLogHandleForTransportCategory("BTDatagramLink");
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v39 = 67109120;
          int v40 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "advance_slot failed for write %d",  v39,  8u);
        }

        if (((uint64_t (*)(void))os_log_shim_legacy_logging_enabled)())
        {
          if (((uint64_t (*)(void))_IDSShouldLogTransport)())
          {
            _IDSLogTransport(@"BTDatagramLink", @"IDS", @"advance_slot failed for write %d");
          }
        }
      }

      os_channel_sync(self->_channel, 0LL);
      uint64_t v29 = OSLogHandleForTransportCategory("BTDatagramLink");
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v31 = a3->var2;
        *(_DWORD *)v39 = 67109120;
        int v40 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "DLW %d", v39, 8u);
      }

      uint64_t v33 = os_log_shim_legacy_logging_enabled(v32);
      if ((_DWORD)v33)
      {
        if (_IDSShouldLogTransport(v33))
        {
          _IDSLogTransport(@"BTDatagramLink", @"IDS", @"DLW %d");
        }
      }

      int64x2_t v34 = vdupq_n_s64(1uLL);
      v34.i64[0] = a3->var2;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v34);
      _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTDatagramLink.m",  137LL,  a3);
      unint64_t v15 = 0LL;
    }

    else
    {
      uint64_t v35 = OSLogHandleForTransportCategory("BTDatagramLink");
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v37 = a3->var2;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "DLW 0/%d (no space)", buf, 8u);
      }

      if (((uint64_t (*)(void))os_log_shim_legacy_logging_enabled)())
      {
        if (((uint64_t (*)(void))_IDSShouldLogTransport)())
        {
          _IDSLogTransport(@"BTDatagramLink", @"IDS", @"DLW 0/%d (no space)");
        }
      }

      _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTDatagramLink.m",  133LL,  a3);
      unint64_t v15 = 14LL;
    }
  }

  else
  {
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTDatagramLink.m",  91LL,  a3);
    unint64_t v15 = 6LL;
  }

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  return 12LL;
}

- (void)_processIncomingPacket
{
  currentIncomingPacket = self->_currentIncomingPacket;
  if (!currentIncomingPacket)
  {
    currentIncomingPacket = ($54F6A343B951227605E470F4B19DD8D1 *)_IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityService s_Swift/IDSAgent/IDSBTDatagramLink.m",  151LL);
    self->_currentIncomingPacket = currentIncomingPacket;
  }

  rxRing = self->_rxRing;
  int v5 = os_channel_available_slot_count(rxRing);
  if (v5)
  {
    int v6 = v5;
    uint64_t next_slot = 0LL;
    uint64_t v37 = vdupq_n_s64(1uLL).i64[1];
    while (1)
    {
      *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v44 = v8;
      __int128 v45 = v8;
      *(_OWORD *)__n = v8;
      *(_OWORD *)__src = v8;
      uint64_t next_slot = os_channel_get_next_slot(rxRing, next_slot, __n);
      if (currentIncomingPacket->var1 < WORD1(__n[0])) {
        break;
      }
      memcpy(currentIncomingPacket->var0, __src[0], WORD1(__n[0]));
      currentIncomingPacket->int64_t var2 = WORD1(__n[0]);
      uint64_t v9 = OSLogHandleForTransportCategory("BTDatagramLink");
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int64_t var2 = currentIncomingPacket->var2;
        *(_DWORD *)buf = 67109120;
        int v39 = var2;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DLR %d", buf, 8u);
      }

      uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
      if ((_DWORD)v13)
      {
        if (_IDSShouldLogTransport(v13))
        {
          _IDSLogTransport(@"BTDatagramLink", @"IDS", @"DLR %d");
        }
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v15 = [WeakRetained link:self didReceivePacket:currentIncomingPacket fromDeviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

      if ((v15 & 1) == 0)
      {
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  currentIncomingPacket->var0,  currentIncomingPacket->var2,  0LL));
        uint64_t v17 = OSLogHandleForTransportCategory("LinkManager");
        __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v19 = currentIncomingPacket->var2;
          *(_DWORD *)buf = 67109378;
          int v39 = v19;
          __int16 v40 = 2112;
          __int16 v41 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Magnet corruption? This packet(%dB) did not decode! data %@",  buf,  0x12u);
        }

        uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
        if ((_DWORD)v21)
        {
          if (_IDSShouldLogTransport(v21))
          {
            _IDSLogTransport( @"LinkManager",  @"IDS",  @"Magnet corruption? This packet(%dB) did not decode! data %@");
            if (_IDSShouldLog(0LL, @"LinkManager")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Magnet corruption? This packet(%dB) did not decode! data %@");
            }
          }
        }
      }

      v22.i64[1] = v37;
      v22.i64[0] = SLODWORD(currentIncomingPacket->var2);
      *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(v22, *(int64x2_t *)&self->_totalBytesReceived);
      IDSLinkPacketBufferResetBufferStart(currentIncomingPacket, 15LL);
      if (!--v6) {
        goto LABEL_34;
      }
    }

    uint64_t v27 = OSLogHandleForTransportCategory("BTDatagramLink");
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t var1 = currentIncomingPacket->var1;
      *(_DWORD *)buf = 67109376;
      int v39 = WORD1(__n[0]);
      __int16 v40 = 1024;
      LODWORD(v41) = var1;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "DLR 0/%d (packetBuffer %d too small)",  buf,  0xEu);
    }

    uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
    if ((_DWORD)v31)
    {
      if (_IDSShouldLogTransport(v31))
      {
        _IDSLogTransport(@"BTDatagramLink", @"IDS", @"DLR 0/%d (packetBuffer %d too small)");
      }
    }

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  double previousReportTime = self->_previousReportTime;
  if (previousReportTime == 0.0)
  {
    uint64_t v13 = 0LL;
  }

  else
  {
    double v7 = a3 - previousReportTime;
    unint64_t state = self->_state;
    unint64_t v9 = self->_totalBytesSent - self->_previousBytesSent;
    unint64_t v10 = self->_totalBytesReceived - self->_previousBytesReceived;
    if (a4) {
      uint64_t v11 = 42LL;
    }
    else {
      uint64_t v11 = 32LL;
    }
    uint64_t v36 = v11;
    if (state > 6) {
      uint64_t v12 = "UnexpectedState";
    }
    else {
      uint64_t v12 = (const char *)_IDSLinkStateStrings[state];
    }
    uint64_t v35 = v12;
    unint64_t v34 = self->_totalPacketsSent - self->_previousPacketsSent;
    uint64_t v14 = formattedBytes(v9, a2);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = formattedSpeed((unint64_t)((double)(8 * v9) / v7 + 0.5));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    unint64_t totalPacketsSent = self->_totalPacketsSent;
    uint64_t v20 = formattedBytes(self->_totalBytesSent, v19);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    unint64_t v22 = self->_totalPacketsReceived - self->_previousPacketsReceived;
    uint64_t v24 = formattedBytes(v10, v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = formattedSpeed((unint64_t)((double)(8 * v10) / v7 + 0.5));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    unint64_t totalPacketsReceived = self->_totalPacketsReceived;
    uint64_t v30 = formattedBytes(self->_totalBytesReceived, v29);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c MagnetIso(%s)  Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n",  v36,  v35,  v34,  v15,  v17,  totalPacketsSent,  v21,  v22,  v25,  v27,  totalPacketsReceived,  v31));
  }

  self->_double previousReportTime = a3;
  __int128 v32 = *(_OWORD *)&self->_totalBytesReceived;
  *(_OWORD *)&self->_previousBytesSent = *(_OWORD *)&self->_totalBytesSent;
  *(_OWORD *)&self->_previousBytesReceived = v32;
  return v13;
}

- (id)copyLinkStatsDict
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytesReceived));
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytesSent));
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsReceived));
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsSent));
  __int128 v8 = -[NSDictionary initWithObjectsAndKeys:]( v3,  "initWithObjectsAndKeys:",  v4,  @"bytesReceived",  v5,  @"bytesSent",  v6,  @"packetsReceived",  v7,  @"packetsSent",  0LL);

  return v8;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)cbuuid
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCbuuid:(id)a3
{
}

- (NSString)deviceUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (IDSLinkDelegate)delegate
{
  return (IDSLinkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (IDSLinkDelegate)alternateDelegate
{
  return (IDSLinkDelegate *)objc_loadWeakRetained((id *)&self->_alternateDelegate);
}

- (void)setAlternateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end