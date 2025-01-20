@interface IDSBTLELink
- (IDSBTLELink)initWithWPLinkManager:(id)a3 withIdentifier:(id)a4;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (NSString)cbuuid;
- (NSString)deviceUniqueID;
- (NSString)linkID;
- (NSString)linkTypeString;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (void)_didReceiveData:(id)a3;
- (void)dealloc;
- (void)didReceiveData:(id)a3;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setHasSpaceAvailable:(BOOL)a3;
- (void)start;
@end

@implementation IDSBTLELink

- (IDSBTLELink)initWithWPLinkManager:(id)a3 withIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IDSBTLELink;
  v9 = -[IDSBTLELink init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wpLinkManager, a3);
    v11 = (NSString *)[v8 copy];
    linkID = v10->_linkID;
    v10->_linkID = v11;

    v13 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v10->_linkID);
    peerID = v10->_peerID;
    v10->_peerID = v13;

    objc_storeStrong((id *)&v10->_cbuuid, v10->_linkID);
    v10->_state = 0LL;
    if (qword_1009BE9D0 != -1) {
      dispatch_once(&qword_1009BE9D0, &stru_1008FA240);
    }
    v10->_previousReportTime = *(double *)&qword_1009BE9D8 * (double)mach_continuous_time();
  }

  return v10;
}

- (void)dealloc
{
  incomingPacketBuffer = self->_incomingPacketBuffer;
  if (incomingPacketBuffer) {
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLELink.m",  34LL,  incomingPacketBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSBTLELink;
  -[IDSBTLELink dealloc](&v4, "dealloc");
}

- (void)start
{
  if (self->_state <= 5)
  {
    self->_hasSpaceAvailable = 1;
    self->_state = 4LL;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained link:self didConnectForDeviceUniqueID:0 cbuuid:self->_cbuuid];
  }

- (unint64_t)headerOverhead
{
  return 2LL;
}

- (NSString)linkTypeString
{
  return (NSString *)@"BTLE";
}

- (id)copyLinkStatsDict
{
  v3 = objc_alloc(&OBJC_CLASS___NSDictionary);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytesReceived));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytesSent));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsReceived));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsSent));
  id v8 = -[NSDictionary initWithObjectsAndKeys:]( v3,  "initWithObjectsAndKeys:",  v4,  @"bytesReceived",  v5,  @"bytesSent",  v6,  @"packetsReceived",  v7,  @"packetsSent",  0LL);

  return v8;
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v9 && ([v9 isEqualToString:self->_cbuuid] & 1) == 0)
  {
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLELink.m",  91LL,  a3);
    unint64_t v11 = 10LL;
  }

  else if (self->_state == 4)
  {
    if (self->_outgoingData)
    {
      _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLELink.m",  101LL,  a3);
      unint64_t v11 = 1LL;
      self->_shouldSendHasSpaceAvailable = 1;
    }

    else
    {
      int64_t var2 = a3->var2;
      if (var2 <= 0)
      {
        _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLELink.m",  108LL,  a3);
        unint64_t v11 = 15LL;
      }

      else
      {
        int v13 = *a3->var0;
        if (v13 < 0)
        {
          __int16 v14 = bufferChecksum(a3->var0 + 1, var2 - 1, *(unsigned __int8 *)a3->var0);
          IDSLinkPacketBufferAddBufferStart(a3, 4294967294LL);
          *a3->var0 = v13;
          a3->var0[1] = HIBYTE(v14);
          a3->var0[2] = v14;
        }

        if (self->_hasSpaceAvailable)
        {
          int64x2_t v15 = vdupq_n_s64(1uLL);
          v15.i64[0] = a3->var2;
          *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v15);
          self->_hasSpaceAvailable = 0;
          objc_super v16 = objc_autoreleasePoolPush();
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a3->var0,  a3->var2,  0LL));
          unint64_t v11 = (unint64_t)-[IDSWPPacketSendingProtocol sendData:peerID:]( self->_wpLinkManager,  "sendData:peerID:",  v17,  self->_peerID);

          objc_autoreleasePoolPop(v16);
        }

        else
        {
          v18 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  a3->var0,  a3->var2);
          outgoingData = self->_outgoingData;
          self->_outgoingData = v18;

          self->_shouldSendHasSpaceAvailable = 1;
          unint64_t v11 = 13LL;
        }

        _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLELink.m",  142LL,  a3);
      }
    }
  }

  else
  {
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLELink.m",  96LL,  a3);
    unint64_t v11 = 6LL;
  }

  return v11;
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  return 12LL;
}

- (void)setHasSpaceAvailable:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000F5980;
  v3[3] = &unk_1008F8960;
  BOOL v4 = a3;
  v3[4] = self;
  IDSTransportThreadAddBlock(v3, a2);
}

- (void)didReceiveData:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F5BD8;
  v5[3] = &unk_1008F8800;
  v5[4] = self;
  id v6 = a3;
  id v3 = v6;
  IDSTransportThreadAddBlock(v5, v4);
}

- (void)_didReceiveData:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 length];
  uint64_t v6 = OSLogHandleForIDSCategory("IDSBTLELink");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&__int128 v42 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "didReceiveData length %luB", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8) && _IDSShouldLog(2LL, @"IDSBTLELink"))
  {
    v36 = v5;
    _IDSLogV(2LL, @"IDSFoundation", @"IDSBTLELink", @"didReceiveData length %luB");
  }

  int64x2_t v9 = vdupq_n_s64(1uLL);
  v9.i64[0] = (uint64_t)v5;
  *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(*(int64x2_t *)&self->_totalBytesReceived, v9);
  if ((unint64_t)objc_msgSend(v4, "length", v36) >= 0x7D1)
  {
    uint64_t v10 = OSLogHandleForIDSCategory("BTLELink");
    unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v4 length];
      *(_DWORD *)buf = 134217984;
      *(void *)&__int128 v42 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received data too big (%lu) - rejecting",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v13) && _IDSShouldLog(0LL, @"BTLELink"))
    {
      [v4 length];
      _IDSLogV(0LL, @"IDSFoundation", @"BTLELink", @"Received data too big (%lu) - rejecting");
    }

    goto LABEL_44;
  }

  if ([v4 length])
  {
    incomingPacketBuffer = self->_incomingPacketBuffer;
    if (!incomingPacketBuffer) {
      incomingPacketBuffer = ($54F6A343B951227605E470F4B19DD8D1 *)_IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServic es_Swift/IDSAgent/IDSBTLELink.m",  207LL);
    }
    [v4 getBytes:incomingPacketBuffer->var0 length:v5];
    incomingPacketBuffer->int64_t var2 = (int64_t)v5;
    int v15 = *incomingPacketBuffer->var0;
    if ((v15 & 0x80000000) == 0) {
      goto LABEL_16;
    }
    if ((unint64_t)[v4 length] > 2)
    {
      unsigned int v29 = *(unsigned __int16 *)(incomingPacketBuffer->var0 + 1);
      uint64_t v30 = bufferChecksum(incomingPacketBuffer->var0 + 3, v5 - 3, v15);
      v31 = (char *)__rev16(v29);
      if ((_DWORD)v31 != (_DWORD)v30)
      {
        uint64_t v32 = OSLogHandleForTransportCategory("BTLELink");
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109890;
          LODWORD(v42) = (_DWORD)v31;
          WORD2(v42) = 1024;
          *(_DWORD *)((char *)&v42 + 6) = v30;
          WORD5(v42) = 1024;
          HIDWORD(v42) = (_DWORD)v5;
          __int16 v43 = 2112;
          id v44 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Data corruption! Checksum check failed (old:%04x new:%04x) data(%d): %@",  buf,  0x1Eu);
        }

        uint64_t v35 = os_log_shim_legacy_logging_enabled(v34);
        if ((_DWORD)v35)
        {
          if (_IDSShouldLogTransport(v35))
          {
            v39 = v5;
            id v40 = v4;
            v37 = v31;
            id v38 = (id)v30;
            _IDSLogTransport( @"BTLELink",  @"IDS",  @"Data corruption! Checksum check failed (old:%04x new:%04x) data(%d): %@");
            if (_IDSShouldLog(0LL, @"BTLELink"))
            {
              v39 = v5;
              id v40 = v4;
              v37 = v31;
              id v38 = (id)v30;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLELink",  @"Data corruption! Checksum check failed (old:%04x new:%04x) data(%d): %@");
            }
          }
        }

        goto LABEL_42;
      }

      IDSLinkPacketBufferAddBufferStart(incomingPacketBuffer, 2LL);
      *incomingPacketBuffer->var0 = v15;
LABEL_16:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v17 = [WeakRetained link:self didReceivePacket:incomingPacketBuffer fromDeviceUniqueID:0 cbuuid:self->_cbuuid];

      if ((v17 & 1) != 0)
      {
LABEL_43:
        IDSLinkPacketBufferResetBufferStart(incomingPacketBuffer, 15LL);
        self->_incomingPacketBuffer = incomingPacketBuffer;
        goto LABEL_44;
      }

      uint64_t v18 = OSLogHandleForTransportCategory("BTLELink");
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v42) = (_DWORD)v5;
        WORD2(v42) = 2112;
        *(void *)((char *)&v42 + 6) = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Data corruption! This data did not decode(%d): %@",  buf,  0x12u);
      }

      uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
      if ((_DWORD)v21)
      {
        if (_IDSShouldLogTransport(v21))
        {
          v37 = v5;
          id v38 = v4;
          _IDSLogTransport(@"BTLELink", @"IDS", @"Data corruption! This data did not decode(%d): %@");
          if (_IDSShouldLog(0LL, @"BTLELink"))
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLELink",  @"Data corruption! This data did not decode(%d): %@");
            -[IDSBTLELink _localDetectedCorruption](self, "_localDetectedCorruption", v5, v4, v39, v40);
            goto LABEL_43;
          }
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
      id v12 = "UnexpectedState";
    }
    else {
      id v12 = (const char *)_IDSLinkStateStrings[state];
    }
    uint64_t v35 = v12;
    unint64_t v34 = self->_totalPacketsSent - self->_previousPacketsSent;
    uint64_t v14 = formattedBytes(v9, a2);
    int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = formattedSpeed((unint64_t)((double)(8 * v9) / v7 + 0.5));
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    unint64_t totalPacketsSent = self->_totalPacketsSent;
    uint64_t v20 = formattedBytes(self->_totalBytesSent, v19);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    unint64_t v22 = self->_totalPacketsReceived - self->_previousPacketsReceived;
    uint64_t v24 = formattedBytes(v10, v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = formattedSpeed((unint64_t)((double)(8 * v10) / v7 + 0.5));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    unint64_t totalPacketsReceived = self->_totalPacketsReceived;
    uint64_t v30 = formattedBytes(self->_totalBytesReceived, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c BTLE      (%s) Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n",  v36,  v35,  v34,  v15,  v17,  totalPacketsSent,  v21,  v22,  v25,  v27,  totalPacketsReceived,  v31));
  }

  self->_double previousReportTime = a3;
  __int128 v32 = *(_OWORD *)&self->_totalBytesReceived;
  *(_OWORD *)&self->_previousBytesSent = *(_OWORD *)&self->_totalBytesSent;
  *(_OWORD *)&self->_previousBytesReceived = v32;
  return v13;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)linkID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
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