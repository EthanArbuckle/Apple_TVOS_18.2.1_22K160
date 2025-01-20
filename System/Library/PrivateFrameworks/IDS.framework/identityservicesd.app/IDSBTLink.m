@interface IDSBTLink
- (BOOL)isLinkSuspended;
- (IDSBTLink)initWithPipe:(id)a3 useSkywalkChannel:(BOOL)a4 withDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (NSString)cbuuid;
- (NSString)deviceUniqueID;
- (NSString)linkID;
- (NSString)linkTypeString;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (int64_t)_readFromDataChannel:(void *)a3 size:(unint64_t)a4 withFlags:(int)a5 isSynced:(BOOL *)a6;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (void)_dumpLogs:(double)a3 isDownstream:(BOOL)a4;
- (void)_localDetectedCorruption;
- (void)_processIncomingPacket;
- (void)_processOutgoingPacket;
- (void)_resetMagnetCorruptionMetrics;
- (void)_submitMagnetCorruptionMetricsToAWD;
- (void)dealloc;
- (void)flushBuffer:(unint64_t)a3;
- (void)injectFakePacket:(id *)a3;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)remoteDetectedCorruption;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)start;
- (void)suspendLink:(BOOL)a3;
@end

@implementation IDSBTLink

- (unint64_t)headerOverhead
{
  return 2LL;
}

- (NSString)linkTypeString
{
  return (NSString *)@"Magnet";
}

- (id)copyLinkStatsDict
{
  v3 = objc_alloc(&OBJC_CLASS___NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytesReceived));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytesSent));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsReceived));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsSent));
  v8 = -[NSDictionary initWithObjectsAndKeys:]( v3,  "initWithObjectsAndKeys:",  v4,  @"bytesReceived",  v5,  @"bytesSent",  v6,  @"packetsReceived",  v7,  @"packetsSent",  0LL);

  return v8;
}

- (IDSBTLink)initWithPipe:(id)a3 useSkywalkChannel:(BOOL)a4 withDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___IDSBTLink;
  v14 = -[IDSBTLink init](&v49, "init");
  v15 = v14;
  if (v14)
  {
    p_pipe = (id *)&v14->_pipe;
    objc_storeStrong((id *)&v14->_pipe, a3);
    *(_DWORD *)buffer = -1;
    if (v8)
    {
      id v17 = [v11 channel];
      uint64_t v18 = OSLogHandleForTransportCategory("BTLink");
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = *p_pipe;
        *(_DWORD *)buf = 134218242;
        *(void *)v51 = v17;
        *(_WORD *)&v51[8] = 2112;
        *(void *)&v51[10] = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "retrieved os channel %p from pipe %@",  buf,  0x16u);
      }

      uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
      if ((_DWORD)v22)
      {
        if (_IDSShouldLogTransport(v22))
        {
          id v45 = v17;
          id v46 = *p_pipe;
          _IDSLogTransport(@"BTLink", @"IDS", @"retrieved os channel %p from pipe %@");
          if (_IDSShouldLog(0LL, @"BTLink"))
          {
            id v45 = v17;
            id v46 = *p_pipe;
            __n128 v23 = _IDSLogV(0LL, @"IDSFoundation", @"BTLink", @"retrieved os channel %p from pipe %@");
          }
        }
      }

      if (v17) {
        goto LABEL_20;
      }
    }

    v24 = (__CFWriteStream *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_pipe, "output", v45, v46));
    v25 = (const __CFData *)CFWriteStreamCopyProperty(v24, kCFStreamPropertySocketNativeHandle);

    if (v25)
    {
      v52.location = 0LL;
      v52.length = 4LL;
      CFDataGetBytes(v25, v52, buffer);
      CFRelease(v25);
      uint64_t v26 = OSLogHandleForTransportCategory("BTLink");
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = *p_pipe;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v51 = *(_DWORD *)buffer;
        *(_WORD *)&v51[4] = 2112;
        *(void *)&v51[6] = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "retrieved native socket %d from pipe %@",  buf,  0x12u);
      }

      uint64_t v30 = os_log_shim_legacy_logging_enabled(v29);
      if ((_DWORD)v30)
      {
        if (_IDSShouldLogTransport(v30))
        {
          id v47 = *p_pipe;
          _IDSLogTransport(@"BTLink", @"IDS", @"retrieved native socket %d from pipe %@");
          if (_IDSShouldLog(0LL, @"BTLink"))
          {
            id v47 = *p_pipe;
            *(void *)&double v31 = _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"retrieved native socket %d from pipe %@").n128_u64[0];
          }
        }
      }

      int v32 = fcntl(*(int *)buffer, 3, v31, 0LL, v47);
      if (v32 != -1 && fcntl(*(int *)buffer, 4, v32 | 4u) != -1)
      {
        id v17 = 0LL;
LABEL_20:
        v15->_dataChannel = (__IDSOSDataChannel *)IDSOSDataChannelCreate(*(unsigned int *)buffer, v17, v23);
        v15->_dataChannelPendingTx = 0;
        objc_storeStrong((id *)&v15->_cbuuid, kIDSDefaultPairedDeviceID);
        objc_storeStrong((id *)&v15->_deviceUniqueID, a5);
        v15->_state = 2LL;
        if (qword_1009C0D78 != -1) {
          dispatch_once(&qword_1009C0D78, &stru_1009043C0);
        }
        v15->_previousReportTime = *(double *)&qword_1009C0D80 * (double)mach_continuous_time();
        *(_WORD *)&v15->_remoteHostAwake = 1;
        v33 = (void *)objc_claimAutoreleasedReturnValue([v11 peer]);
        [v33 addObserver:v15 forKeyPath:@"hostState" options:0 context:0];

        goto LABEL_23;
      }

      uint64_t v35 = OSLogHandleForTransportCategory("BTLink");
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v51 = *(_DWORD *)buffer;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "fcntl failed with socket %d", buf, 8u);
      }

      uint64_t v38 = os_log_shim_legacy_logging_enabled(v37);
      if ((_DWORD)v38)
      {
        if (_IDSShouldLogTransport(v38))
        {
          _IDSLogTransport(@"BTLink", @"IDS", @"fcntl failed with socket %d");
        }
      }
    }

    else
    {
      uint64_t v39 = OSLogHandleForTransportCategory("BTLink");
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = *p_pipe;
        *(_DWORD *)buf = 138412290;
        *(void *)v51 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "CFWriteStreamCopyProperty(kCFStreamPropertySocketNativeHandle) failed with pipe %@",  buf,  0xCu);
      }

      uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
      if ((_DWORD)v43)
      {
        if (_IDSShouldLogTransport(v43))
        {
          _IDSLogTransport( @"BTLink",  @"IDS",  @"CFWriteStreamCopyProperty(kCFStreamPropertySocketNativeHandle) failed with pipe %@");
          if (_IDSShouldLog(0LL, @"BTLink")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"CFWriteStreamCopyProperty(kCFStreamPropertySocketNativeHandle) failed with pipe %@");
          }
        }
      }
    }

    v34 = 0LL;
    goto LABEL_37;
  }

- (void)dealloc
{
  currentIncomingPacket = self->_currentIncomingPacket;
  if (currentIncomingPacket)
  {
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  112LL,  currentIncomingPacket);
    self->_currentIncomingPacket = 0LL;
  }

  currentOutgoingPacket = self->_currentOutgoingPacket;
  if (currentOutgoingPacket)
  {
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  117LL,  currentOutgoingPacket);
    self->_currentOutgoingPacket = 0LL;
  }

  uint64_t v5 = OSLogHandleForTransportCategory("BTLink");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    pipe = self->_pipe;
    *(_DWORD *)buf = 138412290;
    v16 = pipe;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "releasing pipe %@", buf, 0xCu);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      id v13 = self->_pipe;
      _IDSLogTransport(@"BTLink", @"IDS", @"releasing pipe %@");
      if (_IDSShouldLog(0LL, @"BTLink"))
      {
        id v13 = self->_pipe;
        *(void *)&double v10 = _IDSLogV(0LL, @"IDSFoundation", @"BTLink", @"releasing pipe %@").n128_u64[0];
      }
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe peer](self->_pipe, "peer", v10, v13));
  [v11 removeObserver:self forKeyPath:@"hostState" context:0];

  id v12 = self->_pipe;
  self->_pipe = 0LL;

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSBTLink;
  -[IDSBTLink dealloc](&v14, "dealloc");
}

- (void)_localDetectedCorruption
{
  if (qword_1009C0D78 != -1) {
    dispatch_once(&qword_1009C0D78, &stru_1009043C0);
  }
  double v3 = *(double *)&qword_1009C0D80 * (double)mach_continuous_time();
  v4 = (void *)_IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  133LL);
  *(_BYTE *)void *v4 = 1;
  *(_BYTE *)(*v4 + 1LL) = 68;
  uint64_t v5 = v4[1] - 1LL;
  ++*v4;
  v4[1] = v5;
  v4[2] = 1LL;
  unint64_t v6 = -[IDSBTLink sendPacketBuffer:toDeviceUniqueID:cbuuid:]( self,  "sendPacketBuffer:toDeviceUniqueID:cbuuid:",  v4,  self->_deviceUniqueID,  self->_cbuuid);
  if (v6 == 13 || v6 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained link:self hasSpaceAvailable:0 deviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];
  }

  self->_resyncing = 1;
  self->_lastResyncTime = v3;
  if (!self->_magnetCorruptionRecoveryMode)
  {
    self->_lastNewMagnetCorruptionTime = v3;
    self->_magnetCorruptionRecoveryMode = 1;
  }

  -[IDSBTLink _dumpLogs:isDownstream:](self, "_dumpLogs:isDownstream:", 1LL, v3);
}

- (void)_dumpLogs:(double)a3 isDownstream:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 25LL;
  }
  else {
    uint64_t v5 = 26LL;
  }
  if (a3 - *(double *)&(&self->super.isa)[v5] > 60.0)
  {
    if (IMGetDomainBoolForKey(@"com.apple.ids", @"ReportDataCorruption"))
    {
      *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v19[3] = v8;
      v19[4] = v8;
      v19[1] = v8;
      v19[2] = v8;
      v19[0] = v8;
      snprintf((char *)v19, 0x50uLL, "/bin/cp /dev/uart.log /tmp/uart-%.06f.log", a3);
      IMPerformSystem(v19);
      dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
      uint64_t v11 = im_primary_queue(v9, v10);
      id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1003D2FF8;
      block[3] = &unk_1008FE710;
      BOOL v22 = a4;
      dispatch_after(v9, v12, block);
    }

    if (IMGetDomainBoolForKey(@"com.apple.ids", @"DontSubmitDataCorruptionToAggd"))
    {
      uint64_t v13 = OSLogHandleForIDSCategory("IDSBTLink");
      objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "DontSubmitDataCorruptionToAggd is set. Not submitting to aggd",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v15))
      {
        if (_IDSShouldLog(0LL, @"IDSBTLink")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSBTLink",  @"DontSubmitDataCorruptionToAggd is set. Not submitting to aggd");
        }
      }
    }

    else
    {
      uint64_t v16 = OSLogHandleForIDSCategory("IDSBTLink");
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "submitting aggd metric - MagnetDataCorruption",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v18) && _IDSShouldLog(1LL, @"IDSBTLink")) {
        _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSBTLink",  @"submitting aggd metric - MagnetDataCorruption");
      }
      IMSubmitSimpleAggegateMetric(@"com.apple.IDS.MagnetDataCorruption", 1LL);
      IMSubmitSimpleCoreAnalyticsMetric(@"com.apple.IDS.MagnetDataCorruption", 1LL);
    }

    IMSubmitSimpleAWDMetric(2555913LL, 1LL);
    *(double *)&(&self->super.isa)[v5] = a3;
  }

- (void)_resetMagnetCorruptionMetrics
{
  self->_discardedRawBytes = 0LL;
  self->_correctRawBytesSinceLastCorruption = 0LL;
  self->_correctFramesSinceLastCorruption = 0LL;
}

- (void)_submitMagnetCorruptionMetricsToAWD
{
  if (self->_previousCorruptionsDetected)
  {
    unint64_t v3 = (unint64_t)((self->_lastResyncTime - self->_lastNewMagnetCorruptionTime) * 1000.0);
    uint64_t v4 = OSLogHandleForIDSCategory("IDSBTLink");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t correctRawBytesSinceLastCorruption = self->_correctRawBytesSinceLastCorruption;
      unint64_t correctFramesSinceLastCorruption = self->_correctFramesSinceLastCorruption;
      unint64_t discardedRawBytes = self->_discardedRawBytes;
      *(_DWORD *)buf = 134218752;
      unint64_t v17 = correctFramesSinceLastCorruption;
      __int16 v18 = 2048;
      unint64_t v19 = correctRawBytesSinceLastCorruption;
      __int16 v20 = 2048;
      unint64_t v21 = discardedRawBytes;
      __int16 v22 = 2048;
      unint64_t v23 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "submitting IDSMagnetCorruptionDetailedEvent: unint64_t correctFramesSinceLastCorruption = %lld, correctRawBytesSinceLastCo rruption = %lld, discardedRawBytes = %lld, magnetDataCorruptionRecoveryTimeInMs = %lld ms",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v9))
    {
      if (_IDSShouldLog(0LL, @"IDSBTLink")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSBTLink",  @"submitting IDSMagnetCorruptionDetailedEvent: unint64_t correctFramesSinceLastCorruption = %lld, correctRawBytesSinceLastCorruption = %lld, discardedRawBytes = %lld, magnetDataCorruptionRecoveryTimeInMs = %lld ms");
      }
    }

    id v10 = objc_alloc(&OBJC_CLASS___IDSMagnetCorruptionMetric);
    unint64_t v12 = self->_correctFramesSinceLastCorruption;
    p_unint64_t correctFramesSinceLastCorruption = &self->_correctFramesSinceLastCorruption;
    id v13 = [v10 initWithCorrectFramesSinceLastCorruption:v12 correctRawBytesSinceLastCorruption:*(p_correctFramesSinceLastCorruption - 1) discardedRawBytes:*(p_correctFramesSinceLastCorruption - 2) recoveryTimeInMs:v3 linkType:1];
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v14 logMetric:v13];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    [v15 IDSMagnetCorruptionDetailedEvent:*p_correctFramesSinceLastCorruption correctRawBytesSinceLastCorruption:*(p_correctFramesSinceLastCorruption - 1) discardedRawBytes:*(p_correctFramesSinceLastCorruption - 2) recoveryTimeInMs:v3 linkType:1];
  }

  else
  {
    self->_previousCorruptionsDetected = 1;
  }

- (void)start
{
  uint64_t v3 = IDSOSDataChannelFd(self->_dataChannel, a2);
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003D347C;
  v5[3] = &unk_1008F6010;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003D3484;
  v4[3] = &unk_1008F6010;
  IDSTransportThreadAddSocket(v3, v5, v4);
  self->_writeSuspended = 0;
}

- (void)remoteDetectedCorruption
{
  uint64_t v3 = OSLogHandleForTransportCategory("BTLink");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote device detected data corruption", v7, 2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"BTLink", @"IDS", @"Remote device detected data corruption");
    }
  }

  if (qword_1009C0D78 != -1) {
    dispatch_once(&qword_1009C0D78, &stru_1009043C0);
  }
  -[IDSBTLink _dumpLogs:isDownstream:]( self,  "_dumpLogs:isDownstream:",  0LL,  *(double *)&qword_1009C0D80 * (double)mach_continuous_time());
}

- (void)invalidate
{
  dataChannel = self->_dataChannel;
  if (dataChannel)
  {
    uint64_t v4 = IDSOSDataChannelFd(dataChannel, a2);
    IDSTransportThreadRemoveSocket(v4);
    IDSOSDataChannelDestroy(self->_dataChannel);
    self->_dataChannel = 0LL;
    self->_dataChannelPendingTx = 0;
  }

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9 && ([v9 isEqualToString:self->_cbuuid] & 1) == 0)
  {
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  302LL,  a3);
    unint64_t v13 = 10LL;
    goto LABEL_11;
  }

  var0 = a3->var0;
  if (!a3->var0)
  {
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  314LL,  a3);
    unint64_t v13 = 9LL;
    goto LABEL_11;
  }

  if (self->_state != 4)
  {
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  319LL,  a3);
    unint64_t v13 = 6LL;
    goto LABEL_11;
  }

  if (self->_currentOutgoingPacket)
  {
    uint64_t v12 = 324LL;
LABEL_7:
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  v12,  a3);
    unint64_t v13 = 1LL;
    goto LABEL_11;
  }

  int v15 = *var0;
  if (v15 < 0)
  {
    __int16 v16 = bufferChecksum(var0 + 1, a3->var2 - 1, *var0);
    IDSLinkPacketBufferAddBufferStart(a3, 4294967294LL);
    *a3->var0 = v15;
    a3->var0[1] = HIBYTE(v16);
    a3->var0[2] = v16;
  }

  int64_t var2 = a3->var2;
  if (var2 > 127)
  {
    unsigned int v19 = (var2 >> 8) | 0xFFFFFF80;
    if (var2 + 2 <= a3->var1)
    {
      IDSLinkPacketBufferAddBufferStart(a3, 4294967294LL);
      *a3->var0 = v19;
      a3->var0[1] = var2;
    }

    else
    {
      __int16 v20 = ($54F6A343B951227605E470F4B19DD8D1 *)_IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  354LL);
      *v20->var0 = v19;
      v20->var0[1] = var2;
      memcpy(v20->var0 + 2, a3->var0, var2);
      v20->int64_t var2 = var2 + 2;
      _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  361LL,  a3);
      a3 = v20;
    }
  }

  else
  {
    __int16 v18 = a3->var0--;
    a3->int64_t var2 = var2 + 1;
    *(v18 - 1) = var2;
  }

  a3->var3 = a3->var2;
  a3->var9 = 1;
  uint64_t v21 = IDSOSDataChannelWrite(self->_dataChannel, a3->var0);
  int v22 = *__error();
  unint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog BTLink](&OBJC_CLASS___IDSFoundationLog, "BTLink"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v24 = a3->var2;
    char var26 = a3->var26;
    if (!var26) {
      char var26 = 42;
    }
    int var27 = a3->var27;
    *(_DWORD *)buf = 67110144;
    int v34 = v21;
    __int16 v35 = 1024;
    int v36 = v24;
    __int16 v37 = 1024;
    int v38 = 45;
    __int16 v39 = 1024;
    int v40 = var26;
    __int16 v41 = 1024;
    int v42 = var27;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "LMW %d/%d %c =%c (s:%d)", buf, 0x20u);
  }

  if (!v21)
  {
    uint64_t v12 = 376LL;
    goto LABEL_7;
  }

  if (v21 < 1)
  {
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog BTLink](&OBJC_CLASS___IDSFoundationLog, "BTLink"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      char v30 = a3->var26;
      if (!v30) {
        char v30 = 42;
      }
      int v31 = a3->var27;
      *(_DWORD *)buf = 67109632;
      int v34 = v22;
      __int16 v35 = 1024;
      int v36 = v30;
      __int16 v37 = 1024;
      int v38 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "LMW errno %d =%c (s:%d)", buf, 0x14u);
    }

    if (v22 != 35 && v22 != 55)
    {
      -[IDSBTLink invalidate](self, "invalidate");
      _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  398LL,  a3);
      unint64_t v13 = 11LL;
      goto LABEL_11;
    }
  }

  else
  {
    IDSLinkPacketBufferAddBufferStart(a3, v21);
    if (!a3->var2)
    {
      int64x2_t v28 = vdupq_n_s64(1uLL);
      v28.i64[0] = a3->var3;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v28);
      _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  386LL,  a3);
      if ((v15 & 0x20) != 0) {
        kdebug_trace(722010176LL, 0LL, 0LL, 0LL, 0LL);
      }
      unint64_t v13 = 0LL;
      goto LABEL_11;
    }
  }

  self->_currentOutgoingPacket = a3;
  if (self->_writeSuspended)
  {
    uint64_t v32 = IDSOSDataChannelFd(self->_dataChannel, v27);
    IDSTransportThreadResumeSocket(v32, 2LL);
    self->_writeSuspended = 0;
  }

  unint64_t v13 = 13LL;
LABEL_11:

  return v13;
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  return 12LL;
}

- (void)flushBuffer:(unint64_t)a3
{
  if (a3 >= 2) {
    sub_1006AC9B4();
  }
  IDSOSDataChannelSync(self->_dataChannel, a3 == 0, &self->_dataChannelPendingTx);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBScalablePipe peer](self->_pipe, "peer"));
  unint64_t v13 = v12;
  if (v12)
  {
    if ([v12 hostState])
    {
      id v14 = [v13 hostState];
      BOOL v15 = v14 != (id)1;
      if (v14 == (id)1) {
        __int16 v16 = @"asleep";
      }
      else {
        __int16 v16 = @"awake";
      }
    }

    else
    {
      BOOL v15 = 1;
      __int16 v16 = @"unknown";
    }
  }

  else
  {
    BOOL v15 = 1;
    __int16 v16 = @"nil peer";
  }

  uint64_t v17 = OSLogHandleForTransportCategory("BTLink");
  __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    cbuuid = self->_cbuuid;
    __int16 v20 = @"NO";
    *(_DWORD *)buf = 138412802;
    if (v15) {
      __int16 v20 = @"YES";
    }
    uint64_t v27 = cbuuid;
    __int16 v28 = 2112;
    uint64_t v29 = v16;
    __int16 v30 = 2112;
    int v31 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "BT reports %@ as (%@) interpreting as awake? %@.",  buf,  0x20u);
  }

  uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
  if ((_DWORD)v22)
  {
    if (_IDSShouldLogTransport(v22))
    {
      _IDSLogTransport(@"BTLink", @"IDS", @"BT reports %@ as (%@) interpreting as awake? %@.");
      if (_IDSShouldLog(0LL, @"BTLink")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"BT reports %@ as (%@) interpreting as awake? %@.");
      }
    }
  }

  if (self->_remoteHostAwake != v15 || !self->_postedFirstHostStateChange)
  {
    self->_remoteHostAwake = v15;
    self->_postedFirstHostStateChange = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v24 = objc_opt_respondsToSelector(WeakRetained, "link:hostAwakeDidChange:deviceUniqueID:cbuuid:");

    if ((v24 & 1) != 0)
    {
      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      [v25 link:self hostAwakeDidChange:self->_remoteHostAwake deviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];
    }
  }
}

- (int64_t)_readFromDataChannel:(void *)a3 size:(unint64_t)a4 withFlags:(int)a5 isSynced:(BOOL *)a6
{
  return IDSOSDataChannelRead(self->_dataChannel, a3, a4, *(void *)&a5, a6);
}

- (void)_processIncomingPacket
{
  currentIncomingPacket = self->_currentIncomingPacket;
  if (!currentIncomingPacket) {
    currentIncomingPacket = ($54F6A343B951227605E470F4B19DD8D1 *)_IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityService s_Swift/IDSAgent/IDSBTLink.m",  493LL);
  }
  if (self->_resyncing)
  {
    while (1)
    {
LABEL_4:
      char v127 = -86;
      unint64_t var1 = currentIncomingPacket->var1;
      uint64_t v5 = -[IDSBTLink _readFromDataChannel:size:withFlags:isSynced:]( self,  "_readFromDataChannel:size:withFlags:isSynced:",  currentIncomingPacket->var0,  var1,  0LL,  &v127,  v114,  v115,  v116,  v117,  v118,  v119,  v120);
      int v6 = *__error();
      uint64_t v7 = OSLogHandleForTransportCategory("BTLink");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        if (v127) {
          int v9 = 115;
        }
        else {
          int v9 = 45;
        }
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v129 = v5;
        *(_WORD *)&v129[4] = 1024;
        *(_DWORD *)&v129[6] = var1;
        *(_WORD *)v130 = 1024;
        *(_DWORD *)&v130[2] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Link manager read %d/%d bytes during resync %c",  buf,  0x14u);
      }

      uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
      if ((_DWORD)v11 && _IDSShouldLogTransport(v11))
      {
        uint64_t v12 = 115LL;
        if (!v127) {
          uint64_t v12 = 45LL;
        }
        uint64_t v115 = var1;
        uint64_t v116 = v12;
        uint64_t v114 = v5;
        _IDSLogTransport(@"BTLink", @"IDS", @"Link manager read %d/%d bytes during resync %c");
        if (_IDSShouldLog(0LL, @"BTLink"))
        {
          if (v127) {
            uint64_t v13 = 115LL;
          }
          else {
            uint64_t v13 = 45LL;
          }
          uint64_t v115 = var1;
          uint64_t v116 = v13;
          uint64_t v114 = v5;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"Link manager read %d/%d bytes during resync %c");
        }
      }

      self->_discardedRawBytes += v5;
      if (v5 < 0 && v6 != 35) {
        break;
      }
      BOOL v15 = v5 < 0 || v5 < var1;
      __int16 v16 = objc_autoreleasePoolPush();
      if (v15)
      {
        if (v5 < 1) {
          v91 = 0LL;
        }
        else {
          v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  currentIncomingPacket->var0,  v5,  0LL));
        }
        uint64_t v92 = OSLogHandleForTransportCategory("BTLink");
        v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v129 = v5;
          *(_WORD *)&v129[4] = 1024;
          *(_DWORD *)&v129[6] = var1;
          *(_WORD *)v130 = 2112;
          *(void *)&v130[2] = v91;
          _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "Magnet corruption! received %dB with %dB buffer. Resync incoming stream done! content = %@",  buf,  0x18u);
        }

        uint64_t v95 = os_log_shim_legacy_logging_enabled(v94);
        if ((_DWORD)v95)
        {
          if (_IDSShouldLogTransport(v95))
          {
            _IDSLogTransport( @"BTLink",  @"IDS",  @"Magnet corruption! received %dB with %dB buffer. Resync incoming stream done! content = %@");
            if (_IDSShouldLog(0LL, @"BTLink")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"Magnet corruption! received %dB with %dB buffer. Resync incoming stream done! content = %@");
            }
          }
        }

        objc_autoreleasePoolPop(v16);
        self->_resyncing = 0;
        IDSLinkPacketBufferResetBufferStart(currentIncomingPacket, 15LL);
        self->_currentIncomingPacket = currentIncomingPacket;
        if (qword_1009C0D78 != -1) {
          dispatch_once(&qword_1009C0D78, &stru_1009043C0);
        }
        double v96 = *(double *)&qword_1009C0D80 * (double)mach_continuous_time();
        double lastResyncTime = self->_lastResyncTime;
        self->_double lastResyncTime = v96;
        unint64_t v98 = (unint64_t)((v96 - lastResyncTime) * 1000.0);
        if (IMGetDomainBoolForKey(@"com.apple.ids", @"DontSubmitDataCorruptionToAggd"))
        {
          uint64_t v99 = OSLogHandleForIDSCategory("IDSBTLink");
          v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v129 = (unint64_t)((v96 - lastResyncTime) * 1000.0);
            _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "DontSubmitDataCorruptionToAggd is set. Not submitting MagnetDataCorruptionRecoveryTimeInMs = %lld ms to aggd",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v101)
            && _IDSShouldLog(0LL, @"IDSBTLink"))
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSBTLink",  @"DontSubmitDataCorruptionToAggd is set. Not submitting MagnetDataCorruptionRecoveryTimeInMs = %lld ms to aggd");
          }
        }

        else
        {
          id v102 = [[IDSMagnetDataCorruptionRecoveryTimeInMsMetric alloc] initWithRecoveryTime:v98];
          v103 = (void *)objc_claimAutoreleasedReturnValue( +[IDSCoreAnalyticsLogger defaultLogger]( &OBJC_CLASS___IDSCoreAnalyticsLogger,  "defaultLogger"));
          [v103 logMetric:v102];

          uint64_t v104 = OSLogHandleForIDSCategory("IDSBTLink");
          v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v129 = (unint64_t)((v96 - lastResyncTime) * 1000.0);
            _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "submitting aggd metric - MagnetDataCorruptionRecoveryTimeInMs = %lld ms",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v106)
            && _IDSShouldLog(0LL, @"IDSBTLink"))
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSBTLink",  @"submitting aggd metric - MagnetDataCorruptionRecoveryTimeInMs = %lld ms");
          }

          IMSubmitSimpleAggegateMetric(@"com.apple.IDS.MagnetDataCorruptionRecoveryTimeInMs", v98);
          IMSubmitSimpleAWDMetric(2588686LL, v98);
          IMSubmitSimpleCoreAnalyticsMetric(@"com.apple.IDS.MagnetDataCorruptionRecoveryTimeInMs", v98);
        }

        return;
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  currentIncomingPacket->var0,  v5,  0LL));
      uint64_t v18 = OSLogHandleForTransportCategory("BTLink");
      unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v129 = v5;
        *(_WORD *)&v129[4] = 1024;
        *(_DWORD *)&v129[6] = var1;
        *(_WORD *)v130 = 2112;
        *(void *)&v130[2] = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "received %dB with %dB buffer. Continue resyncing incoming stream. content = %@",  buf,  0x18u);
      }

      uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
      if ((_DWORD)v21 && _IDSShouldLogTransport(v21))
      {
        uint64_t v115 = var1;
        uint64_t v116 = (uint64_t)v17;
        uint64_t v114 = v5;
        _IDSLogTransport( @"BTLink",  @"IDS",  @"received %dB with %dB buffer. Continue resyncing incoming stream. content = %@");
        if (_IDSShouldLog(0LL, @"BTLink"))
        {
          uint64_t v115 = var1;
          uint64_t v116 = (uint64_t)v17;
          uint64_t v114 = v5;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"received %dB with %dB buffer. Continue resyncing incoming stream. content = %@");
        }
      }

      objc_autoreleasePoolPop(v16);
    }

    uint64_t v87 = OSLogHandleForTransportCategory("BTLink");
    v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v129 = v5;
      *(_WORD *)&v129[8] = 1024;
      *(_DWORD *)v130 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "Link manager recv(resync) %zd errno %d - closing connection",  buf,  0x12u);
    }

    uint64_t v90 = os_log_shim_legacy_logging_enabled(v89);
    if ((_DWORD)v90)
    {
      if (_IDSShouldLogTransport(v90))
      {
        _IDSLogTransport( @"BTLink",  @"IDS",  @"Link manager recv(resync) %zd errno %d - closing connection");
        if (_IDSShouldLog(0LL, @"BTLink")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"Link manager recv(resync) %zd errno %d - closing connection");
        }
      }
    }

    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  510LL,  currentIncomingPacket);
    self->_currentIncomingPacket = 0LL;
    -[IDSBTLink invalidate](self, "invalidate");
    return;
  }

  __dst = &currentIncomingPacket->var38[15];
  uint64_t v123 = vdupq_n_s64(1uLL).i64[1];
  while (1)
  {
    int64_t var2 = currentIncomingPacket->var2;
    unint64_t v122 = currentIncomingPacket->var1 - var2;
    uint64_t v124 = -[IDSBTLink _readFromDataChannel:size:withFlags:isSynced:]( self,  "_readFromDataChannel:size:withFlags:isSynced:",  &currentIncomingPacket->var0[var2],  v114,  v115,  v116,  v117,  v118,  v119,  v120);
    unint64_t v23 = __error();
    if (v124 <= 0)
    {
      int v109 = *v23;
      if (v124 && v109 == 35)
      {
        self->_currentIncomingPacket = currentIncomingPacket;
      }

      else
      {
        uint64_t v110 = OSLogHandleForTransportCategory("BTLink");
        v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)v129 = v124;
          *(_WORD *)&v129[8] = 1024;
          *(_DWORD *)v130 = v109;
          _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_DEFAULT,  "Link manager recv %zd errno %d - closing connection",  buf,  0x12u);
        }

        uint64_t v113 = os_log_shim_legacy_logging_enabled(v112);
        if ((_DWORD)v113)
        {
          if (_IDSShouldLogTransport(v113))
          {
            _IDSLogTransport( @"BTLink",  @"IDS",  @"Link manager recv %zd errno %d - closing connection");
            if (_IDSShouldLog(0LL, @"BTLink")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"Link manager recv %zd errno %d - closing connection");
            }
          }
        }

        _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  570LL,  currentIncomingPacket);
        self->_currentIncomingPacket = 0LL;
        -[IDSBTLink invalidate](self, "invalidate");
      }

      return;
    }

    self->_totalReceivedRawBytes += v124;
    int64_t v24 = currentIncomingPacket->var2 + v124;
    currentIncomingPacket->int64_t var2 = v24;
    if (!(_DWORD)v24)
    {
LABEL_142:
      int v37 = 2;
      goto LABEL_143;
    }

    int v25 = *(unsigned __int8 *)currentIncomingPacket->var0;
    if (*currentIncomingPacket->var0 < 0)
    {
      if ((_DWORD)v24 == 1) {
        goto LABEL_142;
      }
      uint64_t v28 = *((unsigned __int8 *)currentIncomingPacket->var0 + 1) | ((v25 & 0x7F) << 8);
      int v26 = v28 + 2;
      uint64_t v27 = 2LL;
    }

    else
    {
      int v26 = v25 + 1;
      uint64_t v27 = 1LL;
      uint64_t v28 = *(unsigned __int8 *)currentIncomingPacket->var0;
    }

    uint64_t v29 = objc_autoreleasePoolPush();
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  currentIncomingPacket->var0,  currentIncomingPacket->var2,  0LL));
    uint64_t v31 = OSLogHandleForTransportCategory("BTLink");
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int totalReceivedRawBytes = self->_totalReceivedRawBytes;
      int64_t v34 = currentIncomingPacket->var2;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v129 = v124;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)&v129[6] = totalReceivedRawBytes;
      *(_WORD *)v130 = 1024;
      *(_DWORD *)&v130[2] = v34;
      *(_WORD *)&v130[6] = 2114;
      *(void *)&v130[8] = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Magnet corruption! Bad packet length found. Initiate resync incoming stream! (last recv %d/%u) data(%d) = %{public}@",  buf,  0x1Eu);
    }

    uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
    if ((_DWORD)v36)
    {
      if (_IDSShouldLogTransport(v36))
      {
        uint64_t v116 = currentIncomingPacket->var2;
        v117 = v30;
        uint64_t v114 = v124;
        uint64_t v115 = self->_totalReceivedRawBytes;
        _IDSLogTransport( @"BTLink",  @"IDS",  @"Magnet corruption! Bad packet length found. Initiate resync incoming stream! (last recv %d/%u) data(%d) = %{public}@");
        if (_IDSShouldLog(0LL, @"BTLink"))
        {
          uint64_t v116 = currentIncomingPacket->var2;
          v117 = v30;
          uint64_t v114 = v124;
          uint64_t v115 = self->_totalReceivedRawBytes;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"Magnet corruption! Bad packet length found. Initiate resync incoming stream! (last recv %d/%u) data(%d) = %{public}@");
        }
      }
    }

    objc_autoreleasePoolPop(v29);
    IDSLinkPacketBufferResetBufferStart(currentIncomingPacket, 15LL);
    self->_currentIncomingPacket = currentIncomingPacket;
    self->_discardedRawBytes += v124;
    -[IDSBTLink _localDetectedCorruption](self, "_localDetectedCorruption");
LABEL_109:
    if (v124 != v122) {
      return;
    }
LABEL_110:
    if (self->_resyncing) {
      goto LABEL_4;
    }
  }

  int v37 = v26 - v24;
  if (v26 > (int)v24)
  {
LABEL_143:
    self->_currentIncomingPacket = currentIncomingPacket;
    v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog BTLink](&OBJC_CLASS___IDSFoundationLog, "BTLink"));
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v108 = self->_totalReceivedRawBytes;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v129 = v37;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)&v129[6] = v124;
      *(_WORD *)v130 = 1024;
      *(_DWORD *)&v130[2] = v108;
      *(_WORD *)&v130[6] = 1024;
      *(_DWORD *)&v130[8] = 115;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "LMR2 0/%d/%d/%u %c", buf, 0x1Au);
    }

    return;
  }

  char context = 0;
  while (1)
  {
    var0 = currentIncomingPacket->var0;
    int64_t v39 = currentIncomingPacket->var2;
    IDSLinkPacketBufferAddBufferStart(currentIncomingPacket, v27);
    if ((int)v28 < 1)
    {
      uint64_t v54 = OSLogHandleForTransportCategory("BTLink");
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v129 = v124;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Link manager received zero byte packet (total recv:%d)",  buf,  8u);
      }

      uint64_t v57 = os_log_shim_legacy_logging_enabled(v56);
      if ((_DWORD)v57)
      {
        if (_IDSShouldLogTransport(v57))
        {
          uint64_t v114 = v124;
          _IDSLogTransport( @"BTLink",  @"IDS",  @"Link manager received zero byte packet (total recv:%d)");
          if (_IDSShouldLog(0LL, @"BTLink"))
          {
            uint64_t v114 = v124;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"Link manager received zero byte packet (total recv:%d)");
          }
        }
      }
    }

    else
    {
      int v40 = currentIncomingPacket->var0;
      int v41 = *currentIncomingPacket->var0;
      if (v28 >= 3 && v41 < 0)
      {
        unsigned int v42 = *(unsigned __int16 *)(v40 + 1);
        uint64_t v43 = bufferChecksum(v40 + 3, (v28 - 3), *(unsigned __int8 *)currentIncomingPacket->var0);
        v44 = (void *)__rev16(v42);
        if ((_DWORD)v44 != (_DWORD)v43)
        {
          contexta = objc_autoreleasePoolPush();
          v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  var0,  (int)v39,  0LL));
          uint64_t v79 = OSLogHandleForTransportCategory("BTLink");
          v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v81 = self->_totalReceivedRawBytes;
            unsigned int v82 = [v78 length];
            *(_DWORD *)buf = 67110658;
            *(_DWORD *)v129 = v28 + v27;
            *(_WORD *)&v129[4] = 1024;
            *(_DWORD *)&v129[6] = v124;
            *(_WORD *)v130 = 1024;
            *(_DWORD *)&v130[2] = v81;
            *(_WORD *)&v130[6] = 1024;
            *(_DWORD *)&v130[8] = (_DWORD)v44;
            *(_WORD *)&v130[12] = 1024;
            *(_DWORD *)&v130[14] = v43;
            *(_WORD *)&v130[18] = 1024;
            *(_DWORD *)&v130[20] = v82;
            __int16 v131 = 2112;
            v132 = v78;
            _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "Magnet corruption! Link manager received %d byte packet (last recv %d/%u) with bad checksum (old:%04x new %04x). Initiate resync incoming stream! data(%d) %@",  buf,  0x30u);
          }

          uint64_t v84 = os_log_shim_legacy_logging_enabled(v83);
          if ((_DWORD)v84)
          {
            if (_IDSShouldLogTransport(v84))
            {
              uint64_t v85 = self->_totalReceivedRawBytes;
              id v119 = [v78 length];
              v120 = v78;
              v117 = v44;
              v118 = (void *)v43;
              uint64_t v116 = v85;
              uint64_t v114 = (v28 + v27);
              uint64_t v115 = v124;
              _IDSLogTransport( @"BTLink",  @"IDS",  @"Magnet corruption! Link manager received %d byte packet (last recv %d/%u) with bad checksum (old:%04x new %04x). Initiate resync incoming stream! data(%d) %@");
              if (_IDSShouldLog(0LL, @"BTLink"))
              {
                uint64_t v86 = self->_totalReceivedRawBytes;
                id v119 = objc_msgSend(v78, "length", v114, v124, v116, v44, v43, v119, v78);
                v120 = v78;
                v118 = (void *)v43;
                uint64_t v116 = v86;
                v117 = v44;
                uint64_t v114 = (v28 + v27);
                uint64_t v115 = v124;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"Magnet corruption! Link manager received %d byte packet (last recv %d/%u) with bad checksum (old:%04x new %04x). Initiate resync incoming stream! data(%d) %@");
              }
            }
          }

          BOOL v69 = v124 == v122;

          objc_autoreleasePoolPop(contexta);
          IDSLinkPacketBufferResetBufferStart(currentIncomingPacket, 15LL);
          self->_currentIncomingPacket = currentIncomingPacket;
          self->_discardedRawBytes += v124;
          -[IDSBTLink _localDetectedCorruption](self, "_localDetectedCorruption");
          goto LABEL_105;
        }

        IDSLinkPacketBufferAddBufferStart(currentIncomingPacket, 2LL);
        uint64_t v28 = (v28 - 2);
        *currentIncomingPacket->var0 = v41;
      }

      if ((v41 & 0x20) != 0) {
        kdebug_trace(722010180LL, 0LL, 0LL, 0LL, 0LL);
      }
      id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog BTLink](&OBJC_CLASS___IDSFoundationLog, "BTLink", v114));
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v46 = self->_totalReceivedRawBytes;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v129 = v28;
        *(_WORD *)&v129[4] = 1024;
        *(_DWORD *)&v129[6] = v124;
        *(_WORD *)v130 = 1024;
        *(_DWORD *)&v130[2] = v46;
        *(_WORD *)&v130[6] = 1024;
        *(_DWORD *)&v130[8] = 115;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "LMR %d/%d/%u %c", buf, 0x1Au);
      }

      uint64_t v47 = currentIncomingPacket->var2;
      currentIncomingPacket->int64_t var2 = v28;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v49 = [WeakRetained link:self didReceivePacket:currentIncomingPacket fromDeviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

      if ((v49 & 1) == 0)
      {
        v62 = objc_autoreleasePoolPush();
        v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  var0,  (int)v39,  0LL));
        uint64_t v64 = OSLogHandleForTransportCategory("LinkManager");
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v66 = self->_totalReceivedRawBytes;
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v129 = v28;
          *(_WORD *)&v129[4] = 1024;
          *(_DWORD *)&v129[6] = v124;
          *(_WORD *)v130 = 1024;
          *(_DWORD *)&v130[2] = v66;
          *(_WORD *)&v130[6] = 1024;
          *(_DWORD *)&v130[8] = v39;
          *(_WORD *)&v130[12] = 2112;
          *(void *)&v130[14] = v63;
          _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "Magnet corruption! This packet(%dB) (last recv %d/%u) did not decode! data(%d) %@",  buf,  0x24u);
        }

        uint64_t v68 = os_log_shim_legacy_logging_enabled(v67);
        if ((_DWORD)v68)
        {
          if (_IDSShouldLogTransport(v68))
          {
            v117 = (void *)v39;
            v118 = v63;
            uint64_t v116 = self->_totalReceivedRawBytes;
            uint64_t v114 = v28;
            uint64_t v115 = v124;
            _IDSLogTransport( @"LinkManager",  @"IDS",  @"Magnet corruption! This packet(%dB) (last recv %d/%u) did not decode! data(%d) %@");
            if (_IDSShouldLog(0LL, @"LinkManager"))
            {
              v117 = (void *)v39;
              v118 = v63;
              uint64_t v116 = self->_totalReceivedRawBytes;
              uint64_t v114 = v28;
              uint64_t v115 = v124;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"LinkManager",  @"Magnet corruption! This packet(%dB) (last recv %d/%u) did not decode! data(%d) %@");
            }
          }
        }

        BOOL v69 = v124 == v122;

        objc_autoreleasePoolPop(v62);
        IDSLinkPacketBufferResetBufferStart(currentIncomingPacket, 15LL);
        self->_currentIncomingPacket = currentIncomingPacket;
        self->_discardedRawBytes += v124;
        -[IDSBTLink _localDetectedCorruption](self, "_localDetectedCorruption");
        goto LABEL_105;
      }

      if (self->_magnetCorruptionRecoveryMode)
      {
        -[IDSBTLink _submitMagnetCorruptionMetricsToAWD](self, "_submitMagnetCorruptionMetricsToAWD");
        -[IDSBTLink _resetMagnetCorruptionMetrics](self, "_resetMagnetCorruptionMetrics");
        self->_magnetCorruptionRecoveryMode = 0;
      }

      v50.i64[1] = v123;
      v50.i64[0] = (int)v28 + LODWORD(currentIncomingPacket->var0) - (int)var0;
      *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(*(int64x2_t *)&self->_totalBytesReceived, v50);
      *(int64x2_t *)&self->_unint64_t correctRawBytesSinceLastCorruption = vaddq_s64( *(int64x2_t *)&self->_correctRawBytesSinceLastCorruption,  v50);
      BOOL v51 = v47 == v28;
      BOOL v52 = v47 <= v28;
      int64_t v53 = v47 - v28;
      if (v52)
      {
        if (v51)
        {
          IDSLinkPacketBufferResetBufferStart(currentIncomingPacket, 15LL);
LABEL_108:
          self->_currentIncomingPacket = currentIncomingPacket;
          goto LABEL_109;
        }

        goto LABEL_73;
      }

      IDSLinkPacketBufferAddBufferStart(currentIncomingPacket, v28);
      currentIncomingPacket->int64_t var2 = v53;
    }

    char context = 1;
LABEL_73:
    int v58 = currentIncomingPacket->var2;
    if (v58)
    {
      int v59 = *(unsigned __int8 *)currentIncomingPacket->var0;
      if ((*currentIncomingPacket->var0 & 0x80000000) == 0)
      {
        unsigned int v60 = v59 + 1;
        uint64_t v27 = 1LL;
        uint64_t v28 = *(unsigned __int8 *)currentIncomingPacket->var0;
        goto LABEL_79;
      }

      if (v58 != 1) {
        break;
      }
    }

    int v61 = 2;
LABEL_81:
    if (v61 >= 1)
    {
      if ((context & 1) != 0)
      {
        memmove(__dst, currentIncomingPacket->var0, currentIncomingPacket->var2);
        currentIncomingPacket->var0 = (char *)__dst;
        currentIncomingPacket->unint64_t var1 = 2000LL;
      }

      goto LABEL_108;
    }
  }

  uint64_t v28 = *((unsigned __int8 *)currentIncomingPacket->var0 + 1) | ((v59 & 0x7F) << 8);
  unsigned int v60 = v28 + 2;
  uint64_t v27 = 2LL;
LABEL_79:
  if (currentIncomingPacket->var1 >= v60)
  {
    int v61 = v60 - v58;
    goto LABEL_81;
  }

  v70 = objc_autoreleasePoolPush();
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  currentIncomingPacket->var0,  currentIncomingPacket->var2,  0LL));
  uint64_t v72 = OSLogHandleForTransportCategory("BTLink");
  v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v74 = self->_totalReceivedRawBytes;
    int64_t v75 = currentIncomingPacket->var2;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v129 = v124;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)&v129[6] = v74;
    *(_WORD *)v130 = 1024;
    *(_DWORD *)&v130[2] = v75;
    *(_WORD *)&v130[6] = 2114;
    *(void *)&v130[8] = v71;
    _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "Magnet corruption! Bad packet length found. Initiate resync incoming stream! (last recv %d/%u) data(%d) = %{public}@",  buf,  0x1Eu);
  }

  uint64_t v77 = os_log_shim_legacy_logging_enabled(v76);
  if ((_DWORD)v77)
  {
    if (_IDSShouldLogTransport(v77))
    {
      uint64_t v116 = currentIncomingPacket->var2;
      v117 = v71;
      uint64_t v114 = v124;
      uint64_t v115 = self->_totalReceivedRawBytes;
      _IDSLogTransport( @"BTLink",  @"IDS",  @"Magnet corruption! Bad packet length found. Initiate resync incoming stream! (last recv %d/%u) data(%d) = %{public}@");
      if (_IDSShouldLog(0LL, @"BTLink"))
      {
        uint64_t v116 = currentIncomingPacket->var2;
        v117 = v71;
        uint64_t v114 = v124;
        uint64_t v115 = self->_totalReceivedRawBytes;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"Magnet corruption! Bad packet length found. Initiate resync incoming stream! (last recv %d/%u) data(%d) = %{public}@");
      }
    }
  }

  BOOL v69 = v124 == v122;

  objc_autoreleasePoolPop(v70);
  IDSLinkPacketBufferResetBufferStart(currentIncomingPacket, 15LL);
  self->_currentIncomingPacket = currentIncomingPacket;
  self->_discardedRawBytes += v124;
  -[IDSBTLink _localDetectedCorruption](self, "_localDetectedCorruption");
LABEL_105:
  if (v69) {
    goto LABEL_110;
  }
}

- (void)_processOutgoingPacket
{
  if (self->_state > 3) {
    goto LABEL_18;
  }
  if (!self->_linkSuspended)
  {
    uint64_t v8 = OSLogHandleForTransportCategory("BTLink");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      pipe = self->_pipe;
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v31 = pipe;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ready to write into pipe %@", buf, 0xCu);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        _IDSLogTransport(@"BTLink", @"IDS", @"Ready to write into pipe %@");
      }
    }

    self->_state = 4LL;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained link:self didConnectForDeviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

LABEL_18:
    currentOutgoingPacket = self->_currentOutgoingPacket;
    if (currentOutgoingPacket)
    {
      uint64_t v15 = IDSOSDataChannelWrite(self->_dataChannel, currentOutgoingPacket->var0);
      int v16 = *__error();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog BTLink](&OBJC_CLASS___IDSFoundationLog, "BTLink"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int64_t var2 = currentOutgoingPacket->var2;
        char var26 = currentOutgoingPacket->var26;
        if (!var26) {
          char var26 = 42;
        }
        int var27 = currentOutgoingPacket->var27;
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)uint64_t v31 = v15;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = var2;
        __int16 v32 = 1024;
        int v33 = 45;
        __int16 v34 = 1024;
        int v35 = var26;
        __int16 v36 = 1024;
        int v37 = var27;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "LMW2 %d/%d %c =%c (s:%d)", buf, 0x20u);
      }

      if (v15 < 1)
      {
        if (v15 < 0)
        {
          uint64_t v25 = OSLogHandleForTransportCategory("BTLink");
          int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)uint64_t v31 = v16;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Link manager send2 errno %d", buf, 8u);
          }

          uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
          if (v16 != 35 && v16 != 55) {
            -[IDSBTLink invalidate](self, "invalidate", v29);
          }
        }

        return;
      }

      IDSLinkPacketBufferAddBufferStart(currentOutgoingPacket, v15);
      if (currentOutgoingPacket->var2) {
        return;
      }
      int64x2_t v21 = vdupq_n_s64(1uLL);
      v21.i64[0] = currentOutgoingPacket->var3;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v21);
      _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSBTLink.m",  767LL,  currentOutgoingPacket);
      self->_currentOutgoingPacket = 0LL;
      kdebug_trace(722010176LL, 0LL, 0LL, 0LL, 0LL);
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 link:self hasSpaceAvailable:1 deviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

      if (self->_writeSuspended) {
        return;
      }
    }

    else
    {
      id v23 = objc_loadWeakRetained((id *)&self->_delegate);
      [v23 link:self hasSpaceAvailable:1 deviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

      if (self->_writeSuspended) {
        return;
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
    int v35 = v12;
    unint64_t v34 = self->_totalPacketsSent - self->_previousPacketsSent;
    uint64_t v14 = formattedBytes(v9, a2);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = formattedSpeed((unint64_t)((double)(8 * v9) / v7 + 0.5));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    unint64_t totalPacketsSent = self->_totalPacketsSent;
    uint64_t v20 = formattedBytes(self->_totalBytesSent, v19);
    int64x2_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    unint64_t v22 = self->_totalPacketsReceived - self->_previousPacketsReceived;
    uint64_t v24 = formattedBytes(v10, v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = formattedSpeed((unint64_t)((double)(8 * v10) / v7 + 0.5));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    unint64_t totalPacketsReceived = self->_totalPacketsReceived;
    uint64_t v30 = formattedBytes(self->_totalBytesReceived, v29);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c Magnet    (%s) Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n",  v36,  v35,  v34,  v15,  v17,  totalPacketsSent,  v21,  v22,  v25,  v27,  totalPacketsReceived,  v31));
  }

  self->_double previousReportTime = a3;
  __int128 v32 = *(_OWORD *)&self->_totalBytesReceived;
  *(_OWORD *)&self->_previousBytesSent = *(_OWORD *)&self->_totalBytesSent;
  *(_OWORD *)&self->_previousBytesReceived = v32;
  return v13;
}

- (BOOL)isLinkSuspended
{
  return self->_linkSuspended;
}

- (void)suspendLink:(BOOL)a3
{
  if (a3)
  {
    if (!self->_linkSuspended)
    {
      uint64_t v4 = OSLogHandleForTransportCategory("BTLink");
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BTLink is now suspended", buf, 2u);
      }

      uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
      if ((_DWORD)v7)
      {
        if (_IDSShouldLogTransport(v7))
        {
          _IDSLogTransport(@"BTLink", @"IDS", @"BTLink is now suspended");
        }
      }

      self->_linkSuspended = 1;
      if (self->_state == 4) {
        self->_unint64_t state = 3LL;
      }
    }
  }

  else if (self->_linkSuspended)
  {
    uint64_t v8 = OSLogHandleForTransportCategory("BTLink");
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BTLink is now resumed", v14, 2u);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11)
    {
      if (_IDSShouldLogTransport(v11))
      {
        _IDSLogTransport(@"BTLink", @"IDS", @"BTLink is now resumed");
      }
    }

    self->_linkSuspended = 0;
    if (self->_state == 3) {
      self->_unint64_t state = 4LL;
    }
    if (self->_writeSuspended)
    {
      uint64_t v13 = IDSOSDataChannelFd(self->_dataChannel, v12);
      IDSTransportThreadResumeSocket(v13, 2LL);
      self->_writeSuspended = 0;
    }
  }

- (void)injectFakePacket:(id *)a3
{
  uint64_t v5 = OSLogHandleForTransportCategory("BTLink");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Custom Test 9 - Packet injected into the BT Layer.",  v10,  2u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      _IDSLogTransport(@"BTLink", @"IDS", @"Custom Test 9 - Packet injected into the BT Layer.");
      if (_IDSShouldLog(0LL, @"BTLink")) {
        *(void *)&double v9 = _IDSLogV( 0LL,  @"IDSFoundation",  @"BTLink",  @"Custom Test 9 - Packet injected into the BT Layer.").n128_u64[0];
      }
    }
  }

  self->_currentIncomingPacket = a3;
  -[IDSBTLink _processIncomingPacket](self, "_processIncomingPacket", v9);
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

- (NSString)linkID
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void).cxx_destruct
{
}

@end