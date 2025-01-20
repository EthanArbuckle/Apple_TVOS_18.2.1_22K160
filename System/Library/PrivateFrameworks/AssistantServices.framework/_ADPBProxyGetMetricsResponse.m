@interface _ADPBProxyGetMetricsResponse
+ (Class)tcpInfoMetricsType;
- (BOOL)hasAttemptCount;
- (BOOL)hasConnectedSubflowCount;
- (BOOL)hasConnectionEdgeIDName;
- (BOOL)hasConnectionEdgeType;
- (BOOL)hasConnectionFallbackReason;
- (BOOL)hasConnectionMethodName;
- (BOOL)hasFirstByteReadInterval;
- (BOOL)hasMetricsCount;
- (BOOL)hasOpenInterval;
- (BOOL)hasPingCount;
- (BOOL)hasPingMean;
- (BOOL)hasPrimarySubflowIface;
- (BOOL)hasPrimarySubflowSwitchCount;
- (BOOL)hasRttBest;
- (BOOL)hasRttCurrent;
- (BOOL)hasRttSmoothed;
- (BOOL)hasRttVariance;
- (BOOL)hasRxBytes;
- (BOOL)hasRxDuplicateBytes;
- (BOOL)hasRxOooBytes;
- (BOOL)hasRxPackets;
- (BOOL)hasSndBandwidth;
- (BOOL)hasSubflowCount;
- (BOOL)hasSynRetransmits;
- (BOOL)hasTuscanyConnectionDelay;
- (BOOL)hasTxBytes;
- (BOOL)hasTxPackets;
- (BOOL)hasTxRetransmitBytes;
- (BOOL)hasTxUnacked;
- (BOOL)hasUnacknowledgedPingCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tcpInfoMetrics;
- (NSString)connectionEdgeIDName;
- (NSString)connectionEdgeType;
- (NSString)connectionMethodName;
- (NSString)primarySubflowIface;
- (SiriCoreConnectionMetrics)_ad_metrics;
- (double)firstByteReadInterval;
- (double)openInterval;
- (double)pingMean;
- (double)tuscanyConnectionDelay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tcpInfoMetricsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rxBytes;
- (unint64_t)rxDuplicateBytes;
- (unint64_t)rxOooBytes;
- (unint64_t)rxPackets;
- (unint64_t)sndBandwidth;
- (unint64_t)tcpInfoMetricsCount;
- (unint64_t)txBytes;
- (unint64_t)txPackets;
- (unint64_t)txRetransmitBytes;
- (unint64_t)txUnacked;
- (unsigned)attemptCount;
- (unsigned)connectedSubflowCount;
- (unsigned)connectionFallbackReason;
- (unsigned)metricsCount;
- (unsigned)pingCount;
- (unsigned)primarySubflowSwitchCount;
- (unsigned)rttBest;
- (unsigned)rttCurrent;
- (unsigned)rttSmoothed;
- (unsigned)rttVariance;
- (unsigned)subflowCount;
- (unsigned)synRetransmits;
- (unsigned)unacknowledgedPingCount;
- (void)_ad_setMetrics:(id)a3;
- (void)addTcpInfoMetrics:(id)a3;
- (void)clearTcpInfoMetrics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttemptCount:(unsigned int)a3;
- (void)setConnectedSubflowCount:(unsigned int)a3;
- (void)setConnectionEdgeIDName:(id)a3;
- (void)setConnectionEdgeType:(id)a3;
- (void)setConnectionFallbackReason:(unsigned int)a3;
- (void)setConnectionMethodName:(id)a3;
- (void)setFirstByteReadInterval:(double)a3;
- (void)setHasAttemptCount:(BOOL)a3;
- (void)setHasConnectedSubflowCount:(BOOL)a3;
- (void)setHasConnectionFallbackReason:(BOOL)a3;
- (void)setHasFirstByteReadInterval:(BOOL)a3;
- (void)setHasMetricsCount:(BOOL)a3;
- (void)setHasOpenInterval:(BOOL)a3;
- (void)setHasPingCount:(BOOL)a3;
- (void)setHasPingMean:(BOOL)a3;
- (void)setHasPrimarySubflowSwitchCount:(BOOL)a3;
- (void)setHasRttBest:(BOOL)a3;
- (void)setHasRttCurrent:(BOOL)a3;
- (void)setHasRttSmoothed:(BOOL)a3;
- (void)setHasRttVariance:(BOOL)a3;
- (void)setHasRxBytes:(BOOL)a3;
- (void)setHasRxDuplicateBytes:(BOOL)a3;
- (void)setHasRxOooBytes:(BOOL)a3;
- (void)setHasRxPackets:(BOOL)a3;
- (void)setHasSndBandwidth:(BOOL)a3;
- (void)setHasSubflowCount:(BOOL)a3;
- (void)setHasSynRetransmits:(BOOL)a3;
- (void)setHasTuscanyConnectionDelay:(BOOL)a3;
- (void)setHasTxBytes:(BOOL)a3;
- (void)setHasTxPackets:(BOOL)a3;
- (void)setHasTxRetransmitBytes:(BOOL)a3;
- (void)setHasTxUnacked:(BOOL)a3;
- (void)setHasUnacknowledgedPingCount:(BOOL)a3;
- (void)setMetricsCount:(unsigned int)a3;
- (void)setOpenInterval:(double)a3;
- (void)setPingCount:(unsigned int)a3;
- (void)setPingMean:(double)a3;
- (void)setPrimarySubflowIface:(id)a3;
- (void)setPrimarySubflowSwitchCount:(unsigned int)a3;
- (void)setRttBest:(unsigned int)a3;
- (void)setRttCurrent:(unsigned int)a3;
- (void)setRttSmoothed:(unsigned int)a3;
- (void)setRttVariance:(unsigned int)a3;
- (void)setRxBytes:(unint64_t)a3;
- (void)setRxDuplicateBytes:(unint64_t)a3;
- (void)setRxOooBytes:(unint64_t)a3;
- (void)setRxPackets:(unint64_t)a3;
- (void)setSndBandwidth:(unint64_t)a3;
- (void)setSubflowCount:(unsigned int)a3;
- (void)setSynRetransmits:(unsigned int)a3;
- (void)setTcpInfoMetrics:(id)a3;
- (void)setTuscanyConnectionDelay:(double)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)setTxPackets:(unint64_t)a3;
- (void)setTxRetransmitBytes:(unint64_t)a3;
- (void)setTxUnacked:(unint64_t)a3;
- (void)setUnacknowledgedPingCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBProxyGetMetricsResponse

- (SiriCoreConnectionMetrics)_ad_metrics
{
  v3 = objc_alloc_init(&OBJC_CLASS___SiriCoreConnectionMetrics);
  if (-[_ADPBProxyGetMetricsResponse hasOpenInterval](self, "hasOpenInterval"))
  {
    -[_ADPBProxyGetMetricsResponse openInterval](self, "openInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[SiriCoreConnectionMetrics setTimeUntilOpen:](v3, "setTimeUntilOpen:", v4);
  }

  if (-[_ADPBProxyGetMetricsResponse hasFirstByteReadInterval](self, "hasFirstByteReadInterval"))
  {
    -[_ADPBProxyGetMetricsResponse firstByteReadInterval](self, "firstByteReadInterval");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[SiriCoreConnectionMetrics setTimeUntilFirstByteRead:](v3, "setTimeUntilFirstByteRead:", v5);
  }

  if (-[_ADPBProxyGetMetricsResponse hasAttemptCount](self, "hasAttemptCount"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse attemptCount](self, "attemptCount")));
    -[SiriCoreConnectionMetrics setAttemptCount:](v3, "setAttemptCount:", v6);
  }

  if (-[_ADPBProxyGetMetricsResponse hasMetricsCount](self, "hasMetricsCount"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse metricsCount](self, "metricsCount")));
    -[SiriCoreConnectionMetrics setMetricsCount:](v3, "setMetricsCount:", v7);
  }

  if (-[_ADPBProxyGetMetricsResponse hasPingCount](self, "hasPingCount"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse pingCount](self, "pingCount")));
    -[SiriCoreConnectionMetrics setPingCount:](v3, "setPingCount:", v8);
  }

  else
  {
    -[SiriCoreConnectionMetrics setPingCount:](v3, "setPingCount:", &off_100513348);
  }

  if (-[_ADPBProxyGetMetricsResponse hasPingMean](self, "hasPingMean"))
  {
    -[_ADPBProxyGetMetricsResponse pingMean](self, "pingMean");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[SiriCoreConnectionMetrics setMeanPing:](v3, "setMeanPing:", v9);
  }

  else
  {
    -[SiriCoreConnectionMetrics setMeanPing:](v3, "setMeanPing:", &off_100513348);
  }

  if (-[_ADPBProxyGetMetricsResponse hasUnacknowledgedPingCount](self, "hasUnacknowledgedPingCount"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse unacknowledgedPingCount](self, "unacknowledgedPingCount")));
    -[SiriCoreConnectionMetrics setUnacknowledgedPingCount:](v3, "setUnacknowledgedPingCount:", v10);
  }

  else
  {
    -[SiriCoreConnectionMetrics setUnacknowledgedPingCount:](v3, "setUnacknowledgedPingCount:", &off_100513348);
  }

  if (-[_ADPBProxyGetMetricsResponse hasSubflowCount](self, "hasSubflowCount"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse subflowCount](self, "subflowCount")));
    -[SiriCoreConnectionMetrics setSubflowCount:](v3, "setSubflowCount:", v11);
  }

  if (-[_ADPBProxyGetMetricsResponse hasConnectedSubflowCount](self, "hasConnectedSubflowCount"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse connectedSubflowCount](self, "connectedSubflowCount")));
    -[SiriCoreConnectionMetrics setConnectedSubflowCount:](v3, "setConnectedSubflowCount:", v12);
  }

  if (-[_ADPBProxyGetMetricsResponse hasPrimarySubflowIface](self, "hasPrimarySubflowIface"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBProxyGetMetricsResponse primarySubflowIface](self, "primarySubflowIface"));
    -[SiriCoreConnectionMetrics setPrimarySubflowInterfaceName:](v3, "setPrimarySubflowInterfaceName:", v13);
  }

  if (-[_ADPBProxyGetMetricsResponse hasPrimarySubflowSwitchCount](self, "hasPrimarySubflowSwitchCount"))
  {
    v109 = @"primary";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse primarySubflowSwitchCount](self, "primarySubflowSwitchCount")));
    v110 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v110,  &v109,  1LL));
    -[SiriCoreConnectionMetrics setSubflowSwitchCounts:](v3, "setSubflowSwitchCounts:", v15);
  }

  if (-[_ADPBProxyGetMetricsResponse hasConnectionMethodName](self, "hasConnectionMethodName"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBProxyGetMetricsResponse connectionMethodName](self, "connectionMethodName"));
    -[SiriCoreConnectionMetrics setConnectionMethod:](v3, "setConnectionMethod:", v16);
  }

  if (-[_ADPBProxyGetMetricsResponse hasConnectionEdgeType](self, "hasConnectionEdgeType"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBProxyGetMetricsResponse connectionEdgeType](self, "connectionEdgeType"));
    -[SiriCoreConnectionMetrics setConnectionEdgeType:](v3, "setConnectionEdgeType:", v17);
  }

  if (-[_ADPBProxyGetMetricsResponse hasConnectionEdgeIDName](self, "hasConnectionEdgeIDName"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBProxyGetMetricsResponse connectionEdgeIDName](self, "connectionEdgeIDName"));
    -[SiriCoreConnectionMetrics setConnectionEdgeID:](v3, "setConnectionEdgeID:", v18);
  }

  if (-[_ADPBProxyGetMetricsResponse hasConnectionFallbackReason](self, "hasConnectionFallbackReason"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse connectionFallbackReason](self, "connectionFallbackReason")));
    -[SiriCoreConnectionMetrics setConnectionFallbackReason:](v3, "setConnectionFallbackReason:", v19);
  }

  if (-[_ADPBProxyGetMetricsResponse hasTuscanyConnectionDelay](self, "hasTuscanyConnectionDelay"))
  {
    -[_ADPBProxyGetMetricsResponse tuscanyConnectionDelay](self, "tuscanyConnectionDelay");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[SiriCoreConnectionMetrics setConnectionDelay:](v3, "setConnectionDelay:", v20);
  }

  unint64_t v21 = -[_ADPBProxyGetMetricsResponse tcpInfoMetricsCount](self, "tcpInfoMetricsCount");
  v58 = v3;
  if (v21)
  {
    unint64_t v22 = v21;
    v23 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v21);
    uint64_t v24 = 0LL;
    v25 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
    unint64_t v59 = v22;
    v60 = self;
    while (1)
    {
      id v26 = (id)objc_claimAutoreleasedReturnValue( -[_ADPBProxyGetMetricsResponse tcpInfoMetricsAtIndex:]( self,  "tcpInfoMetricsAtIndex:",  v24));
      if (!v26)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "SiriCoreConnectionTCPInfoMetrics *ADConnectionTCPInfoMetricsCreateWithProtocolBufferProxy(_ADP BProxyTCPInfoMetrics *__strong)"));
        [v38 handleFailureInFunction:v39, @"ADConnectionTCPInfoMetricsUtilities.m", 27, @"Invalid parameter not satisfying: %@", @"protocolBufferProxy != nil" file lineNumber description];

        unint64_t v22 = v59;
      }

      id v27 = objc_alloc(&OBJC_CLASS___SiriCoreConnectionTCPInfoMetrics);
      unsigned int v78 = [v26 hasInterfaceName];
      v105 = v78 ? (void *)objc_claimAutoreleasedReturnValue([v26 interfaceName]) : 0;
      unsigned int v76 = [v26 hasRttCurrent];
      v70 = v27;
      v103 = v76
      unsigned int v74 = [v26 hasRttSmoothed];
      v101 = v74
      unsigned int v72 = [v26 hasRttVariance];
      v99 = v72
      unsigned int v68 = [v26 hasRttBest];
      v97 = v68
      unsigned int v67 = [v26 hasTxPackets];
      v95 = v67
      unsigned int v66 = [v26 hasTxBytes];
      v93 = v66
      unsigned int v65 = [v26 hasTxRetransmitBytes];
      v91 = v65
      unsigned int v64 = [v26 hasTxUnacked];
      v89 = v64
      unsigned int v63 = [v26 hasRxPackets];
      v86 = v63
      unsigned int v62 = [v26 hasRxBytes];
      v84 = v62
      unsigned int v61 = [v26 hasRxDuplicateBytes];
      v82 = v61
      unsigned int v28 = [v26 hasRxOooBytes];
      v29 = v28
      unsigned int v30 = [v26 hasSndBandwidth];
      uint64_t v80 = v24;
      v31 = v30
      unsigned int v32 = [v26 hasSynRetransmits];
      v33 = v32
      id v36 = [v70 initWithInterfaceName:v105 rttCurrent:v103 rttSmoothed:v101 rttVariance:v99 rttBest:v97 packetsSent:v95 bytesSent:v93 bytesRetransmitted:v91  bytesUnacked:v89 packetsReceived:v86 bytesReceived:v84 duplicateBytesReceived:v82 outOfOrderBytesReceived:v29 sendBufferBytes:0  sendBandwidth:v31 synRetransmits:v33 tfoSynDataAcked:0];
      if (v32) {
        goto LABEL_89;
      }
LABEL_90:
      if (v30) {

      }
      self = v60;
      if (v28) {

      }
      if (v61) {
      if (v62)
      }

      if (v63) {
      if (v64)
      }

      if (v65) {
      if (v66)
      }

      if (v67) {
      if (v68)
      }

      if (v72) {
      if (v74)
      }

      if (v76) {
      if (v78)
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 interfaceName]);
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v36, v37);

      uint64_t v24 = v80 + 1;
      v25 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
      if (v22 == v80 + 1)
      {
        v40 = v23;
        v3 = v58;
        -[SiriCoreConnectionMetrics setTCPInfoMetricsByInterfaceName:](v58, "setTCPInfoMetricsByInterfaceName:", v40);
        goto LABEL_203;
      }
    }

    v34 = v23;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25[509], "numberWithUnsignedInt:", objc_msgSend(v26, "tfoSynDataAcked")));
    id v36 = [v70 initWithInterfaceName:v105 rttCurrent:v103 rttSmoothed:v101 rttVariance:v99 rttBest:v97 packetsSent:v95 bytesSent:v93 bytesRetransmitted:v91 by tesUnacked:v89 packetsReceived:v86 bytesReceived:v84 duplicateBytesReceived:v82 outOfOrderBytesReceived:v29 sendBufferBytes:0 send Bandwidth:v31 synRetransmits:v33 tfoSynDataAcked:v35];

    v23 = v34;
    unint64_t v22 = v59;
    if (!v32) {
      goto LABEL_90;
    }
LABEL_89:

    goto LABEL_90;
  }

  v41 = self;
  if (!v41)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "SiriCoreConnectionTCPInfoMetrics *ADConnectionTCPInfoMetricsCreateWithLegacyProtocolBufferProxy(_A DPBProxyGetMetricsResponse *__strong)"));
    [v56 handleFailureInFunction:v57, @"ADConnectionTCPInfoMetricsUtilities.m", 50, @"Invalid parameter not satisfying: %@", @"legacyProtocolBufferProxy != nil" file lineNumber description];
  }

  if (!-[_ADPBProxyGetMetricsResponse hasRttCurrent](v41, "hasRttCurrent")
    && !-[_ADPBProxyGetMetricsResponse hasRttSmoothed](v41, "hasRttSmoothed")
    && !-[_ADPBProxyGetMetricsResponse hasRttVariance](v41, "hasRttVariance")
    && !-[_ADPBProxyGetMetricsResponse hasRttBest](v41, "hasRttBest")
    && !-[_ADPBProxyGetMetricsResponse hasTxPackets](v41, "hasTxPackets")
    && !-[_ADPBProxyGetMetricsResponse hasTxBytes](v41, "hasTxBytes")
    && !-[_ADPBProxyGetMetricsResponse hasTxRetransmitBytes](v41, "hasTxRetransmitBytes")
    && !-[_ADPBProxyGetMetricsResponse hasTxUnacked](v41, "hasTxUnacked")
    && !-[_ADPBProxyGetMetricsResponse hasRxPackets](v41, "hasRxPackets")
    && !-[_ADPBProxyGetMetricsResponse hasRxBytes](v41, "hasRxBytes")
    && !-[_ADPBProxyGetMetricsResponse hasRxDuplicateBytes](v41, "hasRxDuplicateBytes")
    && !-[_ADPBProxyGetMetricsResponse hasRxOooBytes](v41, "hasRxOooBytes")
    && !-[_ADPBProxyGetMetricsResponse hasSndBandwidth](v41, "hasSndBandwidth")
    && !-[_ADPBProxyGetMetricsResponse hasSynRetransmits](v41, "hasSynRetransmits"))
  {

    v40 = 0LL;
    goto LABEL_203;
  }

  id v87 = objc_alloc(&OBJC_CLASS___SiriCoreConnectionTCPInfoMetrics);
  unsigned int v42 = -[_ADPBProxyGetMetricsResponse hasRttCurrent](v41, "hasRttCurrent");
  if (v42) {
    v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse rttCurrent](v41, "rttCurrent")));
  }
  else {
    v106 = 0LL;
  }
  unsigned int v43 = -[_ADPBProxyGetMetricsResponse hasRttSmoothed](v41, "hasRttSmoothed");
  if (v43) {
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse rttSmoothed](v41, "rttSmoothed")));
  }
  else {
    v44 = 0LL;
  }
  unsigned int v45 = -[_ADPBProxyGetMetricsResponse hasRttVariance](v41, "hasRttVariance");
  if (v45) {
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse rttVariance](v41, "rttVariance")));
  }
  else {
    v46 = 0LL;
  }
  unsigned int v85 = -[_ADPBProxyGetMetricsResponse hasRttBest](v41, "hasRttBest");
  if (v85) {
    v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse rttBest](v41, "rttBest")));
  }
  else {
    v104 = 0LL;
  }
  unsigned int v83 = -[_ADPBProxyGetMetricsResponse hasTxPackets](v41, "hasTxPackets");
  if (v83) {
    v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[_ADPBProxyGetMetricsResponse txPackets](v41, "txPackets")));
  }
  else {
    v102 = 0LL;
  }
  unsigned int v81 = -[_ADPBProxyGetMetricsResponse hasTxBytes](v41, "hasTxBytes");
  if (v81) {
    v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[_ADPBProxyGetMetricsResponse txBytes](v41, "txBytes")));
  }
  else {
    v100 = 0LL;
  }
  unsigned int v79 = -[_ADPBProxyGetMetricsResponse hasTxRetransmitBytes](v41, "hasTxRetransmitBytes");
  if (v79) {
    v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[_ADPBProxyGetMetricsResponse txRetransmitBytes](v41, "txRetransmitBytes")));
  }
  else {
    v98 = 0LL;
  }
  unsigned int v77 = -[_ADPBProxyGetMetricsResponse hasTxUnacked](v41, "hasTxUnacked");
  if (v77) {
    v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[_ADPBProxyGetMetricsResponse txUnacked](v41, "txUnacked")));
  }
  else {
    v96 = 0LL;
  }
  unsigned int v75 = -[_ADPBProxyGetMetricsResponse hasRxPackets](v41, "hasRxPackets");
  if (v75) {
    v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[_ADPBProxyGetMetricsResponse rxPackets](v41, "rxPackets")));
  }
  else {
    v94 = 0LL;
  }
  unsigned int v73 = -[_ADPBProxyGetMetricsResponse hasRxBytes](v41, "hasRxBytes");
  if (v73) {
    v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[_ADPBProxyGetMetricsResponse rxBytes](v41, "rxBytes")));
  }
  else {
    v92 = 0LL;
  }
  unsigned int v71 = -[_ADPBProxyGetMetricsResponse hasRxDuplicateBytes](v41, "hasRxDuplicateBytes");
  if (v71) {
    v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[_ADPBProxyGetMetricsResponse rxDuplicateBytes](v41, "rxDuplicateBytes")));
  }
  else {
    v90 = 0LL;
  }
  unsigned int v47 = -[_ADPBProxyGetMetricsResponse hasRxOooBytes](v41, "hasRxOooBytes");
  if (v47) {
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[_ADPBProxyGetMetricsResponse rxOooBytes](v41, "rxOooBytes")));
  }
  else {
    v48 = 0LL;
  }
  unsigned int v49 = -[_ADPBProxyGetMetricsResponse hasSndBandwidth](v41, "hasSndBandwidth");
  if (v49) {
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[_ADPBProxyGetMetricsResponse sndBandwidth](v41, "sndBandwidth")));
  }
  else {
    v50 = 0LL;
  }
  if (!-[_ADPBProxyGetMetricsResponse hasSynRetransmits](v41, "hasSynRetransmits"))
  {
    v88 = (NSMutableDictionary *)[v87 initWithInterfaceName:@"default" rttCurrent:v106 rttSmoothed:v44 rttVariance:v46 rttBest:v104 packetsSent:v102 bytesSen t:v100 bytesRetransmitted:v98 bytesUnacked:v96 packetsReceived:v94 bytesReceived:v92 duplicateBytesReceive d:v90 outOfOrderBytesReceived:v48 sendBufferBytes:0 sendBandwidth:v50 synRetransmits:0 tfoSynDataAcked:0];
    if (!v49) {
      goto LABEL_180;
    }
    goto LABEL_179;
  }

  unsigned int v69 = v43;
  unsigned int v51 = v42;
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[_ADPBProxyGetMetricsResponse synRetransmits](v41, "synRetransmits")));
  v88 = (NSMutableDictionary *)[v87 initWithInterfaceName:@"default" rttCurrent:v106 rttSmoothed:v44 rttVariance:v46 rttBest:v104 packetsSent:v102 bytesSent:v100  bytesRetransmitted:v98 bytesUnacked:v96 packetsReceived:v94 bytesReceived:v92 duplicateBytesReceived:v90 ou tOfOrderBytesReceived:v48 sendBufferBytes:0 sendBandwidth:v50 synRetransmits:v52 tfoSynDataAcked:0];

  unsigned int v42 = v51;
  unsigned int v43 = v69;
  if (v49) {
LABEL_179:
  }

LABEL_180:
  if (v47) {

  }
  if (v71) {
  if (v73)
  }

  if (v75) {
  v3 = v58;
  }
  if (v77) {

  }
  if (v79) {
  if (v81)
  }

  if (v83) {
  if (v85)
  }
  {

    if (!v45)
    {
LABEL_198:
      if (!v43) {
        goto LABEL_199;
      }
      goto LABEL_206;
    }
  }

  else if (!v45)
  {
    goto LABEL_198;
  }

  if (!v43)
  {
LABEL_199:
    if (!v42) {
      goto LABEL_201;
    }
    goto LABEL_200;
  }

- (void)_ad_setMetrics:(id)a3
{
  id v71 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v71 timeUntilOpen]);
  v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    -[_ADPBProxyGetMetricsResponse setOpenInterval:](self, "setOpenInterval:");
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v71 timeUntilFirstByteRead]);
  v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    -[_ADPBProxyGetMetricsResponse setFirstByteReadInterval:](self, "setFirstByteReadInterval:");
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v71 attemptCount]);
  v9 = v8;
  if (v8) {
    -[_ADPBProxyGetMetricsResponse setAttemptCount:](self, "setAttemptCount:", [v8 intValue]);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v71 metricsCount]);
  v11 = v10;
  if (v10) {
    -[_ADPBProxyGetMetricsResponse setMetricsCount:](self, "setMetricsCount:", [v10 intValue]);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v71 pingCount]);
  v13 = v12;
  if (v12) {
    -[_ADPBProxyGetMetricsResponse setPingCount:](self, "setPingCount:", [v12 intValue]);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v71 meanPing]);
  v15 = v14;
  if (v14)
  {
    [v14 doubleValue];
    -[_ADPBProxyGetMetricsResponse setPingMean:](self, "setPingMean:");
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v71 unacknowledgedPingCount]);
  v17 = v16;
  if (v16) {
    -[_ADPBProxyGetMetricsResponse setUnacknowledgedPingCount:]( self,  "setUnacknowledgedPingCount:",  [v16 intValue]);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v71 subflowCount]);
  v19 = v18;
  if (v18) {
    -[_ADPBProxyGetMetricsResponse setSubflowCount:](self, "setSubflowCount:", [v18 intValue]);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v71 connectedSubflowCount]);
  unint64_t v21 = v20;
  if (v20) {
    -[_ADPBProxyGetMetricsResponse setConnectedSubflowCount:]( self,  "setConnectedSubflowCount:",  [v20 intValue]);
  }

  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v71 primarySubflowInterfaceName]);
  if (v22) {
    -[_ADPBProxyGetMetricsResponse setPrimarySubflowIface:](self, "setPrimarySubflowIface:", v22);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v71 primarySubflowInterfaceName]);
  if (v23)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v71 subflowSwitchCounts]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v23]);

    if (v25) {
      -[_ADPBProxyGetMetricsResponse setPrimarySubflowSwitchCount:]( self,  "setPrimarySubflowSwitchCount:",  [v25 intValue]);
    }
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v71 tcpInfoMetricsByInterfaceName]);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_10016DA28;
  v72[3] = &unk_1004F3910;
  v72[4] = self;
  [v26 enumerateKeysAndObjectsUsingBlock:v72];
  if ([v26 count] == (id)1)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 allValues]);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 firstObject]);

    id v29 = v28;
    unsigned int v30 = self;
    v31 = v30;
    if (v29)
    {
      if (v30)
      {
LABEL_28:
        unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v29 rttCurrent]);
        v33 = v32;
        if (v32) {
          -[_ADPBProxyGetMetricsResponse setRttCurrent:](v31, "setRttCurrent:", [v32 unsignedIntValue]);
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue([v29 rttSmoothed]);
        v35 = v34;
        if (v34) {
          -[_ADPBProxyGetMetricsResponse setRttSmoothed:](v31, "setRttSmoothed:", [v34 unsignedIntValue]);
        }

        id v36 = (void *)objc_claimAutoreleasedReturnValue([v29 rttVariance]);
        v37 = v36;
        if (v36) {
          -[_ADPBProxyGetMetricsResponse setRttVariance:](v31, "setRttVariance:", [v36 unsignedIntValue]);
        }

        v38 = (void *)objc_claimAutoreleasedReturnValue([v29 rttBest]);
        v39 = v38;
        if (v38) {
          -[_ADPBProxyGetMetricsResponse setRttBest:](v31, "setRttBest:", [v38 unsignedIntValue]);
        }

        v40 = (void *)objc_claimAutoreleasedReturnValue([v29 packetsSent]);
        v41 = v40;
        if (v40) {
          -[_ADPBProxyGetMetricsResponse setTxPackets:]( v31,  "setTxPackets:",  [v40 unsignedLongLongValue]);
        }

        unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v29 bytesSent]);
        unsigned int v43 = v42;
        if (v42) {
          -[_ADPBProxyGetMetricsResponse setTxBytes:](v31, "setTxBytes:", [v42 unsignedLongLongValue]);
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue([v29 bytesRetransmitted]);
        unsigned int v45 = v44;
        if (v44) {
          -[_ADPBProxyGetMetricsResponse setTxRetransmitBytes:]( v31,  "setTxRetransmitBytes:",  [v44 unsignedLongLongValue]);
        }

        v46 = (void *)objc_claimAutoreleasedReturnValue([v29 bytesUnacked]);
        unsigned int v47 = v46;
        if (v46) {
          -[_ADPBProxyGetMetricsResponse setTxUnacked:]( v31,  "setTxUnacked:",  [v46 unsignedLongLongValue]);
        }

        v48 = (void *)objc_claimAutoreleasedReturnValue([v29 packetsReceived]);
        unsigned int v49 = v48;
        if (v48) {
          -[_ADPBProxyGetMetricsResponse setRxPackets:]( v31,  "setRxPackets:",  [v48 unsignedLongLongValue]);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue([v29 bytesReceived]);
        unsigned int v51 = v50;
        if (v50) {
          -[_ADPBProxyGetMetricsResponse setRxBytes:](v31, "setRxBytes:", [v50 unsignedLongLongValue]);
        }

        v52 = (void *)objc_claimAutoreleasedReturnValue([v29 duplicateBytesReceived]);
        v53 = v52;
        if (v52) {
          -[_ADPBProxyGetMetricsResponse setRxDuplicateBytes:]( v31,  "setRxDuplicateBytes:",  [v52 unsignedLongLongValue]);
        }

        v54 = (void *)objc_claimAutoreleasedReturnValue([v29 outOfOrderBytesReceived]);
        v55 = v54;
        if (v54) {
          -[_ADPBProxyGetMetricsResponse setRxOooBytes:]( v31,  "setRxOooBytes:",  [v54 unsignedLongLongValue]);
        }

        v56 = (void *)objc_claimAutoreleasedReturnValue([v29 sendBandwidth]);
        v57 = v56;
        if (v56) {
          -[_ADPBProxyGetMetricsResponse setSndBandwidth:]( v31,  "setSndBandwidth:",  [v56 unsignedLongLongValue]);
        }

        v58 = (void *)objc_claimAutoreleasedReturnValue([v29 synRetransmits]);
        unint64_t v59 = v58;
        if (v58) {
          -[_ADPBProxyGetMetricsResponse setSynRetransmits:]( v31,  "setSynRetransmits:",  [v58 unsignedIntValue]);
        }

        goto LABEL_57;
      }
    }

    else
    {
      unsigned int v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      unsigned int v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void ADConnectionTCPInfoMetricsConfigureLegacyProtocolBufferProxy(SiriCoreConnectionTCPInfoMetri cs *__strong, _ADPBProxyGetMetricsResponse *__strong)"));
      [v67 handleFailureInFunction:v68, @"ADConnectionTCPInfoMetricsUtilities.m", 141, @"Invalid parameter not satisfying: %@", @"tcpInfoMetrics != nil" file lineNumber description];

      if (v31) {
        goto LABEL_28;
      }
    }

    unsigned int v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void ADConnectionTCPInfoMetricsConfigureLegacyProtocolBufferProxy(SiriCoreConnectionTCPInfoMetrics *__strong, _ADPBProxyGetMetricsResponse *__strong)"));
    [v69 handleFailureInFunction:v70, @"ADConnectionTCPInfoMetricsUtilities.m", 142, @"Invalid parameter not satisfying: %@", @"legacyProtocolBufferProxy != nil" file lineNumber description];

    goto LABEL_28;
  }

- (void)setOpenInterval:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_openInterval = a3;
}

- (void)setHasOpenInterval:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasOpenInterval
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFirstByteReadInterval:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_firstByteReadInterval = a3;
}

- (void)setHasFirstByteReadInterval:(BOOL)a3
{
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasFirstByteReadInterval
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAttemptCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_attemptCount = a3;
}

- (void)setHasAttemptCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAttemptCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMetricsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_metricsCount = a3;
}

- (void)setHasMetricsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMetricsCount
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setPingMean:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_pingMean = a3;
}

- (void)setHasPingMean:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasPingMean
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPingCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_pingCount = a3;
}

- (void)setHasPingCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPingCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setUnacknowledgedPingCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_unacknowledgedPingCount = a3;
}

- (void)setHasUnacknowledgedPingCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasUnacknowledgedPingCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setRttCurrent:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_rttCurrent = a3;
}

- (void)setHasRttCurrent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRttCurrent
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRttSmoothed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_rttSmoothed = a3;
}

- (void)setHasRttSmoothed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRttSmoothed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setRttVariance:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_rttVariance = a3;
}

- (void)setHasRttVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasRttVariance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setRttBest:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_rttBest = a3;
}

- (void)setHasRttBest:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRttBest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTxPackets:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_txPackets = a3;
}

- (void)setHasTxPackets:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTxPackets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_txBytes = a3;
}

- (void)setHasTxBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTxBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTxRetransmitBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_txRetransmitBytes = a3;
}

- (void)setHasTxRetransmitBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTxRetransmitBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTxUnacked:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_txUnacked = a3;
}

- (void)setHasTxUnacked:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTxUnacked
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRxPackets:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_rxPackets = a3;
}

- (void)setHasRxPackets:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasRxPackets
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_rxBytes = a3;
}

- (void)setHasRxBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasRxBytes
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRxDuplicateBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_rxDuplicateBytes = a3;
}

- (void)setHasRxDuplicateBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasRxDuplicateBytes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRxOooBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_rxOooBytes = a3;
}

- (void)setHasRxOooBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasRxOooBytes
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSndBandwidth:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_sndBandwidth = a3;
}

- (void)setHasSndBandwidth:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasSndBandwidth
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSynRetransmits:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_synRetransmits = a3;
}

- (void)setHasSynRetransmits:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasSynRetransmits
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setSubflowCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_subflowCount = a3;
}

- (void)setHasSubflowCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSubflowCount
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setConnectedSubflowCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_connectedSubflowCount = a3;
}

- (void)setHasConnectedSubflowCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasConnectedSubflowCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasPrimarySubflowIface
{
  return self->_primarySubflowIface != 0LL;
}

- (void)setPrimarySubflowSwitchCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_primarySubflowSwitchCount = a3;
}

- (void)setHasPrimarySubflowSwitchCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPrimarySubflowSwitchCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasConnectionMethodName
{
  return self->_connectionMethodName != 0LL;
}

- (BOOL)hasConnectionEdgeIDName
{
  return self->_connectionEdgeIDName != 0LL;
}

- (BOOL)hasConnectionEdgeType
{
  return self->_connectionEdgeType != 0LL;
}

- (void)setConnectionFallbackReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_connectionFallbackReason = a3;
}

- (void)setHasConnectionFallbackReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasConnectionFallbackReason
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTuscanyConnectionDelay:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_tuscanyConnectionDelay = a3;
}

- (void)setHasTuscanyConnectionDelay:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTuscanyConnectionDelay
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)clearTcpInfoMetrics
{
}

- (void)addTcpInfoMetrics:(id)a3
{
  id v4 = a3;
  tcpInfoMetrics = self->_tcpInfoMetrics;
  id v8 = v4;
  if (!tcpInfoMetrics)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_tcpInfoMetrics;
    self->_tcpInfoMetrics = v6;

    id v4 = v8;
    tcpInfoMetrics = self->_tcpInfoMetrics;
  }

  -[NSMutableArray addObject:](tcpInfoMetrics, "addObject:", v4);
}

- (unint64_t)tcpInfoMetricsCount
{
  return (unint64_t)-[NSMutableArray count](self->_tcpInfoMetrics, "count");
}

- (id)tcpInfoMetricsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_tcpInfoMetrics, "objectAtIndex:", a3);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ADPBProxyGetMetricsResponse;
  id v3 = -[_ADPBProxyGetMetricsResponse description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBProxyGetMetricsResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_openInterval));
    [v3 setObject:v23 forKey:@"open_interval"];

    $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }

  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_firstByteReadInterval));
  [v3 setObject:v24 forKey:@"first_byte_read_interval"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0LL;
      while (1)
      {
        uint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        unint64_t v9 = v8 + 1;
        char v10 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v9;
        v7 |= (unint64_t)(v10 & 0x7F) << v5;
        if ((v10 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v11 = v6++ >= 9;
        if (v11)
        {
          unint64_t v7 = 0LL;
          int v12 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v12 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0LL;
      }
LABEL_13:
      if (v12 || (v7 & 7) == 4) {
        break;
      }
      switch((v7 >> 3))
      {
        case 1u:
          *(_DWORD *)&self->_has |= 2u;
          unint64_t v14 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v14 <= 0xFFFFFFFFFFFFFFF7LL && v14 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v15 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v14);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v14 + 8;
          }

          else
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v15 = 0LL;
          }

          uint64_t v142 = 16LL;
          goto LABEL_292;
        case 2u:
          *(_DWORD *)&self->_has |= 1u;
          unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 <= 0xFFFFFFFFFFFFFFF7LL && v16 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v15 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
          }

          else
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v15 = 0LL;
          }

          uint64_t v142 = 8LL;
          goto LABEL_292;
        case 3u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x2000u;
          while (2)
          {
            uint64_t v20 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v21 = v20 + 1;
            if (v20 == -1 || v21 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v22 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v20);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21;
              v19 |= (unint64_t)(v22 & 0x7F) << v17;
              if (v22 < 0)
              {
                v17 += 7;
                BOOL v11 = v18++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_197;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_197:
          uint64_t v140 = 112LL;
          goto LABEL_283;
        case 4u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x10000u;
          while (2)
          {
            uint64_t v25 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v27 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v25);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26;
              v19 |= (unint64_t)(v27 & 0x7F) << v23;
              if (v27 < 0)
              {
                v23 += 7;
                BOOL v11 = v24++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_201;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_201:
          uint64_t v140 = 152LL;
          goto LABEL_283;
        case 5u:
          *(_DWORD *)&self->_has |= 4u;
          unint64_t v28 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v28 <= 0xFFFFFFFFFFFFFFF7LL && v28 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v15 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v28);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v28 + 8;
          }

          else
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v15 = 0LL;
          }

          uint64_t v142 = 24LL;
          goto LABEL_292;
        case 6u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x20000u;
          while (2)
          {
            uint64_t v31 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v33 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v32;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v11 = v30++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_205;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_205:
          uint64_t v140 = 156LL;
          goto LABEL_283;
        case 7u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x2000000u;
          while (2)
          {
            uint64_t v36 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v38 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v36);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v37;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                BOOL v11 = v35++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_209;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_209:
          uint64_t v140 = 208LL;
          goto LABEL_283;
        case 0xAu:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x100000u;
          while (2)
          {
            uint64_t v42 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v43 = v42 + 1;
            if (v42 == -1 || v43 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v44 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v42);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v43;
              v19 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                BOOL v11 = v41++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_213;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_213:
          uint64_t v140 = 176LL;
          goto LABEL_283;
        case 0xBu:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x200000u;
          while (2)
          {
            uint64_t v47 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v49 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v47);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v48;
              v19 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                BOOL v11 = v46++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_217;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_217:
          uint64_t v140 = 180LL;
          goto LABEL_283;
        case 0xCu:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x400000u;
          while (2)
          {
            uint64_t v52 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v54 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v52);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v53;
              v19 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                BOOL v11 = v51++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_221;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_221:
          uint64_t v140 = 184LL;
          goto LABEL_283;
        case 0xDu:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x80000u;
          while (2)
          {
            uint64_t v57 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v58 = v57 + 1;
            if (v57 == -1 || v58 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v59 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v57);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v58;
              v19 |= (unint64_t)(v59 & 0x7F) << v55;
              if (v59 < 0)
              {
                v55 += 7;
                BOOL v11 = v56++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_225;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_225:
          uint64_t v140 = 172LL;
          goto LABEL_283;
        case 0x14u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v62 = 0LL;
          *(_DWORD *)&self->_has |= 0x400u;
          while (2)
          {
            uint64_t v63 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v64 = v63 + 1;
            if (v63 == -1 || v64 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v65 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v63);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v64;
              v62 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                BOOL v11 = v61++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0LL;
                  goto LABEL_229;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0LL;
          }
LABEL_229:
          uint64_t v141 = 88LL;
          goto LABEL_262;
        case 0x15u:
          char v66 = 0;
          unsigned int v67 = 0;
          uint64_t v62 = 0LL;
          *(_DWORD *)&self->_has |= 0x200u;
          while (2)
          {
            uint64_t v68 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v69 = v68 + 1;
            if (v68 == -1 || v69 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v70 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v68);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v69;
              v62 |= (unint64_t)(v70 & 0x7F) << v66;
              if (v70 < 0)
              {
                v66 += 7;
                BOOL v11 = v67++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0LL;
                  goto LABEL_233;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0LL;
          }
LABEL_233:
          uint64_t v141 = 80LL;
          goto LABEL_262;
        case 0x16u:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v62 = 0LL;
          *(_DWORD *)&self->_has |= 0x800u;
          while (2)
          {
            uint64_t v73 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v74 = v73 + 1;
            if (v73 == -1 || v74 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v75 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v73);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v74;
              v62 |= (unint64_t)(v75 & 0x7F) << v71;
              if (v75 < 0)
              {
                v71 += 7;
                BOOL v11 = v72++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0LL;
                  goto LABEL_237;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0LL;
          }
LABEL_237:
          uint64_t v141 = 96LL;
          goto LABEL_262;
        case 0x17u:
          char v76 = 0;
          unsigned int v77 = 0;
          uint64_t v62 = 0LL;
          *(_DWORD *)&self->_has |= 0x1000u;
          while (2)
          {
            uint64_t v78 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v79 = v78 + 1;
            if (v78 == -1 || v79 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v80 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v78);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v79;
              v62 |= (unint64_t)(v80 & 0x7F) << v76;
              if (v80 < 0)
              {
                v76 += 7;
                BOOL v11 = v77++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0LL;
                  goto LABEL_241;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0LL;
          }
LABEL_241:
          uint64_t v141 = 104LL;
          goto LABEL_262;
        case 0x1Eu:
          char v81 = 0;
          unsigned int v82 = 0;
          uint64_t v62 = 0LL;
          *(_DWORD *)&self->_has |= 0x40u;
          while (2)
          {
            uint64_t v83 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v84 = v83 + 1;
            if (v83 == -1 || v84 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v85 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v83);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v84;
              v62 |= (unint64_t)(v85 & 0x7F) << v81;
              if (v85 < 0)
              {
                v81 += 7;
                BOOL v11 = v82++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0LL;
                  goto LABEL_245;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0LL;
          }
LABEL_245:
          uint64_t v141 = 56LL;
          goto LABEL_262;
        case 0x1Fu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v62 = 0LL;
          *(_DWORD *)&self->_has |= 8u;
          while (2)
          {
            uint64_t v88 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v89 = v88 + 1;
            if (v88 == -1 || v89 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v90 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v88);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v89;
              v62 |= (unint64_t)(v90 & 0x7F) << v86;
              if (v90 < 0)
              {
                v86 += 7;
                BOOL v11 = v87++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0LL;
                  goto LABEL_249;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0LL;
          }
LABEL_249:
          uint64_t v141 = 32LL;
          goto LABEL_262;
        case 0x20u:
          char v91 = 0;
          unsigned int v92 = 0;
          uint64_t v62 = 0LL;
          *(_DWORD *)&self->_has |= 0x10u;
          while (2)
          {
            uint64_t v93 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v94 = v93 + 1;
            if (v93 == -1 || v94 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v95 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v93);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v94;
              v62 |= (unint64_t)(v95 & 0x7F) << v91;
              if (v95 < 0)
              {
                v91 += 7;
                BOOL v11 = v92++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0LL;
                  goto LABEL_253;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0LL;
          }
LABEL_253:
          uint64_t v141 = 40LL;
          goto LABEL_262;
        case 0x21u:
          char v96 = 0;
          unsigned int v97 = 0;
          uint64_t v62 = 0LL;
          *(_DWORD *)&self->_has |= 0x20u;
          while (2)
          {
            uint64_t v98 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v99 = v98 + 1;
            if (v98 == -1 || v99 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v100 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v98);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v99;
              v62 |= (unint64_t)(v100 & 0x7F) << v96;
              if (v100 < 0)
              {
                v96 += 7;
                BOOL v11 = v97++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0LL;
                  goto LABEL_257;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0LL;
          }
LABEL_257:
          uint64_t v141 = 48LL;
          goto LABEL_262;
        case 0x28u:
          char v101 = 0;
          unsigned int v102 = 0;
          uint64_t v62 = 0LL;
          *(_DWORD *)&self->_has |= 0x80u;
          while (2)
          {
            uint64_t v103 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v104 = v103 + 1;
            if (v103 == -1 || v104 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v105 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v103);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v104;
              v62 |= (unint64_t)(v105 & 0x7F) << v101;
              if (v105 < 0)
              {
                v101 += 7;
                BOOL v11 = v102++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0LL;
                  goto LABEL_261;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0LL;
          }
LABEL_261:
          uint64_t v141 = 64LL;
LABEL_262:
          *(void *)&self->PBCodable_opaque[v141] = v62;
          goto LABEL_293;
        case 0x29u:
          char v106 = 0;
          unsigned int v107 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x1000000u;
          while (2)
          {
            uint64_t v108 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v109 = v108 + 1;
            if (v108 == -1 || v109 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v110 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v108);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v109;
              v19 |= (unint64_t)(v110 & 0x7F) << v106;
              if (v110 < 0)
              {
                v106 += 7;
                BOOL v11 = v107++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_266;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_266:
          uint64_t v140 = 192LL;
          goto LABEL_283;
        case 0x32u:
          char v111 = 0;
          unsigned int v112 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x800000u;
          while (2)
          {
            uint64_t v113 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v114 = v113 + 1;
            if (v113 == -1 || v114 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v115 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v113);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v114;
              v19 |= (unint64_t)(v115 & 0x7F) << v111;
              if (v115 < 0)
              {
                v111 += 7;
                BOOL v11 = v112++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_270;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_270:
          uint64_t v140 = 188LL;
          goto LABEL_283;
        case 0x33u:
          char v116 = 0;
          unsigned int v117 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x4000u;
          while (2)
          {
            uint64_t v118 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v119 = v118 + 1;
            if (v118 == -1 || v119 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v120 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v118);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v119;
              v19 |= (unint64_t)(v120 & 0x7F) << v116;
              if (v120 < 0)
              {
                v116 += 7;
                BOOL v11 = v117++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_274;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_274:
          uint64_t v140 = 116LL;
          goto LABEL_283;
        case 0x34u:
          uint64_t String = PBReaderReadString(a3);
          uint64_t v122 = objc_claimAutoreleasedReturnValue(String);
          uint64_t v123 = 160LL;
          goto LABEL_180;
        case 0x35u:
          char v124 = 0;
          unsigned int v125 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x40000u;
          while (2)
          {
            uint64_t v126 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v127 = v126 + 1;
            if (v126 == -1 || v127 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v128 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v126);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v127;
              v19 |= (unint64_t)(v128 & 0x7F) << v124;
              if (v128 < 0)
              {
                v124 += 7;
                BOOL v11 = v125++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_278;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_278:
          uint64_t v140 = 168LL;
          goto LABEL_283;
        case 0x36u:
          uint64_t v129 = PBReaderReadString(a3);
          uint64_t v122 = objc_claimAutoreleasedReturnValue(v129);
          uint64_t v123 = 144LL;
          goto LABEL_180;
        case 0x37u:
          uint64_t v130 = PBReaderReadString(a3);
          uint64_t v122 = objc_claimAutoreleasedReturnValue(v130);
          uint64_t v123 = 120LL;
          goto LABEL_180;
        case 0x38u:
          uint64_t v131 = PBReaderReadString(a3);
          uint64_t v122 = objc_claimAutoreleasedReturnValue(v131);
          uint64_t v123 = 128LL;
LABEL_180:
          v132 = *(void **)&self->PBCodable_opaque[v123];
          *(void *)&self->PBCodable_opaque[v123] = v122;

          goto LABEL_293;
        case 0x39u:
          char v133 = 0;
          unsigned int v134 = 0;
          uint64_t v19 = 0LL;
          *(_DWORD *)&self->_has |= 0x8000u;
          while (2)
          {
            uint64_t v135 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v136 = v135 + 1;
            if (v135 == -1 || v136 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v137 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v135);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v136;
              v19 |= (unint64_t)(v137 & 0x7F) << v133;
              if (v137 < 0)
              {
                v133 += 7;
                BOOL v11 = v134++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_282;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_282:
          uint64_t v140 = 136LL;
LABEL_283:
          *(_DWORD *)&self->PBCodable_opaque[v140] = v19;
          goto LABEL_293;
        case 0x3Au:
          *(_DWORD *)&self->_has |= 0x100u;
          unint64_t v138 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v138 <= 0xFFFFFFFFFFFFFFF7LL && v138 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v15 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v138);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v138 + 8;
          }

          else
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v15 = 0LL;
          }

          uint64_t v142 = 72LL;
LABEL_292:
          *(void *)&self->PBCodable_opaque[v142] = v15;
          goto LABEL_293;
        case 0x3Cu:
          v139 = objc_alloc_init(&OBJC_CLASS____ADPBProxyTCPInfoMetrics);
          -[_ADPBProxyGetMetricsResponse addTcpInfoMetrics:](self, "addTcpInfoMetrics:", v139);
          if (!PBReaderPlaceMark(a3, v144) || (sub_10006CC70((uint64_t)v139, (uint64_t)a3) & 1) == 0)
          {

            LOBYTE(v39) = 0;
            return v39;
          }

          PBReaderRecallMark(a3, v144);

LABEL_293:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_294;
          break;
        default:
          int v39 = PBReaderSkipValueWithTag(a3);
          if (!v39) {
            return v39;
          }
          goto LABEL_293;
      }
    }
  }

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v4, 1LL, self->_openInterval);
    $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }

  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteDoubleField(v5, 2LL, self->_firstByteReadInterval);
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    v4[2] = *(void *)&self->_openInterval;
    *((_DWORD *)v4 + 53) |= 2u;
    $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_46;
    }
  }

  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }

  v4[1] = *(void *)&self->_firstByteReadInterval;
  *((_DWORD *)v4 + 53) |= 1u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_47;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  $CDED8D9E47E00826CC7FF028C2476AF6 v6 = v5;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    v5[2] = *(void *)&self->_openInterval;
    *((_DWORD *)v5 + 53) |= 2u;
    $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }

  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }

  v5[1] = *(void *)&self->_firstByteReadInterval;
  *((_DWORD *)v5 + 53) |= 1u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  int v6 = *((_DWORD *)v4 + 53);
  if ((*(_BYTE *)&has & 2) != 0)
  {
  }

  else if ((v6 & 2) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_BYTE *)&has & 1) != 0)
  {
  }

  else if ((v6 & 1) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_attemptCount != *((_DWORD *)v4 + 28)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_metricsCount != *((_DWORD *)v4 + 38)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_BYTE *)&has & 4) != 0)
  {
  }

  else if ((v6 & 4) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_pingCount != *((_DWORD *)v4 + 39)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_unacknowledgedPingCount != *((_DWORD *)v4 + 52)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_rttCurrent != *((_DWORD *)v4 + 44)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_rttSmoothed != *((_DWORD *)v4 + 45)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_rttVariance != *((_DWORD *)v4 + 46)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_rttBest != *((_DWORD *)v4 + 43)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_txPackets != *((void *)v4 + 11)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_txBytes != *((void *)v4 + 10)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_txRetransmitBytes != *((void *)v4 + 12)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_txUnacked != *((void *)v4 + 13)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_rxPackets != *((void *)v4 + 7)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_rxBytes != *((void *)v4 + 4)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 8) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_rxDuplicateBytes != *((void *)v4 + 5)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_rxOooBytes != *((void *)v4 + 6)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_sndBandwidth != *((void *)v4 + 8)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_synRetransmits != *((_DWORD *)v4 + 48)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_subflowCount != *((_DWORD *)v4 + 47)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_connectedSubflowCount != *((_DWORD *)v4 + 29)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_143;
  }

  primarySubflowIface = self->_primarySubflowIface;
  if ((unint64_t)primarySubflowIface | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](primarySubflowIface, "isEqual:"))
    {
LABEL_143:
      unsigned __int8 v14 = 0;
      goto LABEL_144;
    }

    $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
    int v6 = *((_DWORD *)v4 + 53);
  }

  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_primarySubflowSwitchCount != *((_DWORD *)v4 + 42)) {
      goto LABEL_143;
    }
  }

  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_143;
  }

  connectionMethodName = self->_connectionMethodName;
  if ((unint64_t)connectionMethodName | *((void *)v4 + 18)
    && !-[NSString isEqual:](connectionMethodName, "isEqual:"))
  {
    goto LABEL_143;
  }

  connectionEdgeIDName = self->_connectionEdgeIDName;
  if ((unint64_t)connectionEdgeIDName | *((void *)v4 + 15))
  {
  }

  connectionEdgeType = self->_connectionEdgeType;
  if ((unint64_t)connectionEdgeType | *((void *)v4 + 16))
  {
  }

  $CDED8D9E47E00826CC7FF028C2476AF6 v11 = self->_has;
  int v12 = *((_DWORD *)v4 + 53);
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_connectionFallbackReason != *((_DWORD *)v4 + 34)) {
      goto LABEL_143;
    }
  }

  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_143;
  }

  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
  }

  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_143;
  }

  tcpInfoMetrics = self->_tcpInfoMetrics;
  else {
    unsigned __int8 v14 = 1;
  }
LABEL_144:

  return v14;
}

- (unint64_t)hash
{
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    double openInterval = self->_openInterval;
    double v6 = -openInterval;
    if (openInterval >= 0.0) {
      double v6 = self->_openInterval;
    }
    double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }

    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  if ((*(_BYTE *)&has & 1) != 0)
  {
    double firstByteReadInterval = self->_firstByteReadInterval;
    double v11 = -firstByteReadInterval;
    if (firstByteReadInterval >= 0.0) {
      double v11 = self->_firstByteReadInterval;
    }
    double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }

    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  if ((*(_WORD *)&has & 0x2000) == 0)
  {
    uint64_t v53 = 0LL;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_19;
    }
LABEL_25:
    uint64_t v52 = 0LL;
    if ((*(_BYTE *)&has & 4) != 0) {
      goto LABEL_20;
    }
LABEL_26:
    unint64_t v18 = 0LL;
    goto LABEL_29;
  }

  uint64_t v53 = 2654435761LL * self->_attemptCount;
  if ((*(_DWORD *)&has & 0x10000) == 0) {
    goto LABEL_25;
  }
LABEL_19:
  uint64_t v52 = 2654435761LL * self->_metricsCount;
  if ((*(_BYTE *)&has & 4) == 0) {
    goto LABEL_26;
  }
LABEL_20:
  double pingMean = self->_pingMean;
  double v15 = -pingMean;
  if (pingMean >= 0.0) {
    double v15 = self->_pingMean;
  }
  double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }

  else
  {
    v18 -= (unint64_t)fabs(v17);
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 2) != 0)
  {
    self->_double openInterval = *((double *)v4 + 2);
    *(_DWORD *)&self->_has |= 2u;
    int v6 = *((_DWORD *)v4 + 53);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }

  else if ((v6 & 1) == 0)
  {
    goto LABEL_3;
  }

  self->_double firstByteReadInterval = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x2000) == 0)
  {
LABEL_4:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }

- (double)openInterval
{
  return self->_openInterval;
}

- (double)firstByteReadInterval
{
  return self->_firstByteReadInterval;
}

- (unsigned)attemptCount
{
  return self->_attemptCount;
}

- (unsigned)metricsCount
{
  return self->_metricsCount;
}

- (double)pingMean
{
  return self->_pingMean;
}

- (unsigned)pingCount
{
  return self->_pingCount;
}

- (unsigned)unacknowledgedPingCount
{
  return self->_unacknowledgedPingCount;
}

- (unsigned)rttCurrent
{
  return self->_rttCurrent;
}

- (unsigned)rttSmoothed
{
  return self->_rttSmoothed;
}

- (unsigned)rttVariance
{
  return self->_rttVariance;
}

- (unsigned)rttBest
{
  return self->_rttBest;
}

- (unint64_t)txPackets
{
  return self->_txPackets;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)txRetransmitBytes
{
  return self->_txRetransmitBytes;
}

- (unint64_t)txUnacked
{
  return self->_txUnacked;
}

- (unint64_t)rxPackets
{
  return self->_rxPackets;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (unint64_t)rxDuplicateBytes
{
  return self->_rxDuplicateBytes;
}

- (unint64_t)rxOooBytes
{
  return self->_rxOooBytes;
}

- (unint64_t)sndBandwidth
{
  return self->_sndBandwidth;
}

- (unsigned)synRetransmits
{
  return self->_synRetransmits;
}

- (unsigned)subflowCount
{
  return self->_subflowCount;
}

- (unsigned)connectedSubflowCount
{
  return self->_connectedSubflowCount;
}

- (NSString)primarySubflowIface
{
  return self->_primarySubflowIface;
}

- (void)setPrimarySubflowIface:(id)a3
{
}

- (unsigned)primarySubflowSwitchCount
{
  return self->_primarySubflowSwitchCount;
}

- (NSString)connectionMethodName
{
  return self->_connectionMethodName;
}

- (void)setConnectionMethodName:(id)a3
{
}

- (NSString)connectionEdgeIDName
{
  return self->_connectionEdgeIDName;
}

- (void)setConnectionEdgeIDName:(id)a3
{
}

- (NSString)connectionEdgeType
{
  return self->_connectionEdgeType;
}

- (void)setConnectionEdgeType:(id)a3
{
}

- (unsigned)connectionFallbackReason
{
  return self->_connectionFallbackReason;
}

- (double)tuscanyConnectionDelay
{
  return self->_tuscanyConnectionDelay;
}

- (NSMutableArray)tcpInfoMetrics
{
  return self->_tcpInfoMetrics;
}

- (void)setTcpInfoMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)tcpInfoMetricsType
{
  return (Class)objc_opt_class(&OBJC_CLASS____ADPBProxyTCPInfoMetrics);
}

@end