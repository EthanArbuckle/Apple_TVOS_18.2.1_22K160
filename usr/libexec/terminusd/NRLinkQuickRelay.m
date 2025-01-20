@interface NRLinkQuickRelay
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)sendPacketData:(id)a3;
- (BOOL)start;
- (BOOL)suspend;
- (NWDatagramConnection)connection;
- (id)copyStatusString;
- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5;
- (unsigned)metric;
- (void)acceptNewFlow:(id)a3 fromNexus:(id)a4 completionHandler:(id)a5;
- (void)invalidateIKESessionForClass:(unsigned __int8)a3;
- (void)invalidateLink;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withOptions:(id)a7;
- (void)session:(id)a3 didReceiveData:(id)a4;
- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionStarted:(id)a3;
- (void)setConnection:(id)a3;
- (void)setPacketReceiver:(id)a3;
@end

@implementation NRLinkQuickRelay

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5
{
  v8 = (dispatch_queue_s *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v21 = sub_10003B584();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v21, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_20;
    }
    id v23 = sub_10003B584();
    _NRLogWithArgs(v23, 17LL, "%s called with null queue");
LABEL_16:

    goto LABEL_20;
  }

  dispatch_assert_queue_V2(v8);
  if (!v9)
  {
    id v24 = sub_10003B584();
    int v25 = _NRLogIsLevelEnabled(v24, 17LL);

    if (!v25) {
      goto LABEL_20;
    }
    id v23 = sub_10003B584();
    _NRLogWithArgs(v23, 17LL, "%s called with null linkDelegate");
    goto LABEL_16;
  }

  if (!v10)
  {
    id v26 = sub_10003B584();
    int v27 = _NRLogIsLevelEnabled(v26, 17LL);

    if (!v27) {
      goto LABEL_20;
    }
    id v23 = sub_10003B584();
    _NRLogWithArgs(v23, 17LL, "%s called with null nrUUID");
    goto LABEL_16;
  }

  if ((_NRIsUUIDNonZero(v10) & 1) == 0)
  {
    id v28 = sub_10003B584();
    int v29 = _NRLogIsLevelEnabled(v28, 17LL);

    if (!v29) {
      goto LABEL_20;
    }
    id v23 = sub_10003B584();
    _NRLogWithArgs(v23, 17LL, "called with all-zero nrUUID");
    goto LABEL_16;
  }

  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___NRLinkQuickRelay;
  v11 = -[NRLink initLinkWithQueue:linkDelegate:nrUUID:](&v34, "initLinkWithQueue:linkDelegate:nrUUID:", v8, v9, v10);
  if (!v11)
  {
    id v30 = sub_10003B584();
    int v31 = _NRLogIsLevelEnabled(v30, 17LL);

    if (v31)
    {
      id v32 = sub_10003B584();
      _NRLogWithArgs(v32, 17LL, "[NRLink initLinkWithQueue:] failed");
    }

    self = 0LL;
    goto LABEL_20;
  }

  self = v11;
  -[NRLink setType:](v11, "setType:", 4LL);
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v13 = *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7);
  *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7) = (OS_dispatch_group *)v12;

  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v15 = *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7);
  *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7) = (OS_dispatch_source *)v14;

  v16 = objc_alloc_init(&OBJC_CLASS___NRAnalyticsCmpnLinkQuickRelay);
  v17 = *(OS_nw_path_evaluator **)((char *)&self->_pathEvaluator + 7);
  *(OS_nw_path_evaluator **)((char *)&self->_pathEvaluator + 7) = (OS_nw_path_evaluator *)v16;

  if (!sub_100043ECC(self))
  {
LABEL_20:
    v20 = 0LL;
    goto LABEL_21;
  }

  -[NRLink updateIKEv2Role:](self, "updateIKEv2Role:", &self->_isResponder);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  -[NRLink reportEvent:details:](self, "reportEvent:details:", 3000LL, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
  [v19 linkIsAvailable:self];

  self = self;
  v20 = self;
LABEL_21:

  return v20;
}

- (void)invalidateLink
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___NRLinkQuickRelay;
  -[NRLink invalidateLink](&v33, "invalidateLink");
  sub_10003B700((uint64_t)self, v3);
  if (self)
  {
    v4 = *(void **)(&self->_ikeSessionTimeoutScheduledOnce + 1);
    if (v4)
    {
      id v5 = v4;
      v6 = *(void **)(&self->_ikeSessionTimeoutScheduledOnce + 1);
      *(void *)(&self->_ikeSessionTimeoutScheduledOnce + 1) = 0LL;

      if (qword_1001DCA40 != -1) {
        dispatch_once(&qword_1001DCA40, &stru_1001AFC88);
      }
      v7 = (dispatch_queue_s *)(id)qword_1001DCA48;
      int v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472LL;
      int v29 = sub_100044BBC;
      id v30 = &unk_1001B0720;
      id v31 = v5;
      id v32 = self;
      id v8 = v5;
      dispatch_async(v7, &v27);
    }

    id v9 = *(NSDate **)((char *)&self->_idsSessionStartTime + 7);
    if (v9)
    {
      [v9 cancel];
      id v10 = *(NSDate **)((char *)&self->_idsSessionStartTime + 7);
      *(NSDate **)((char *)&self->_idsSessionStartTime + 7) = 0LL;
    }

    -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4LL, v27, v28, v29, v30);
    -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3LL);
    v11 = *(dispatch_source_s **)((char *)&self->_nexusOutputRing + 7);
    if (v11)
    {
      if (self->_dNexusReadSourceSuspended)
      {
        dispatch_resume(v11);
        self->_dNexusReadSourceSuspended = 0;
        v11 = *(dispatch_source_s **)((char *)&self->_nexusOutputRing + 7);
      }

      dispatch_source_cancel(v11);
      v12 = *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7);
      *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7) = 0LL;
    }

    v13 = *(dispatch_source_s **)((char *)&self->_dNexusReadSource + 7);
    if (v13)
    {
      if (self->_dNexusWriteSourceSuspended)
      {
        dispatch_resume(v13);
        self->_dNexusWriteSourceSuspended = 0;
        v13 = *(dispatch_source_s **)((char *)&self->_dNexusReadSource + 7);
      }

      dispatch_source_cancel(v13);
      v14 = *(OS_dispatch_source **)((char *)&self->_dNexusReadSource + 7);
      *(OS_dispatch_source **)((char *)&self->_dNexusReadSource + 7) = 0LL;
    }

    uint64_t v15 = *(uint64_t *)((char *)&self->_ikePacketReceiver + 7);
    if (v15)
    {
      *(NEIKEv2PacketReceiver **)((char *)&self->_ikePacketReceiver + 7) = 0LL;
    }

    v16 = *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7);
    *(OS_dispatch_group **)((char *)&self->_nexusGroup + 7) = 0LL;

    v17 = *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7);
    *(OS_dispatch_source **)((char *)&self->_ikeSessionTimeoutSource + 7) = 0LL;

    v18 = *(dispatch_source_s **)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7);
    if (v18)
    {
      dispatch_source_cancel(v18);
      v19 = *(void **)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7);
      *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7) = 0LL;
    }

    v20 = *(dispatch_source_s **)((char *)&self->_linkIdleTimerSource + 7);
    if (v20)
    {
      dispatch_source_cancel(v20);
      id v21 = *(OS_dispatch_source **)((char *)&self->_linkIdleTimerSource + 7);
      *(OS_dispatch_source **)((char *)&self->_linkIdleTimerSource + 7) = 0LL;
    }

    -[NRLink setVirtualInterface:](self, "setVirtualInterface:", 0LL);
    id v23 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
    if (v23)
    {
      [v23 setAvailability:0];
      [*(id *)((char *)&self->_ikeSessionClassC + 7) cancel];
      id v24 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
      *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7) = 0LL;
    }

    uint64_t v25 = *(uint64_t *)((char *)&self->_receivedIKEPackets + 7);
    if (v25)
    {
      nw_path_evaluator_cancel(v25, v22);
      id v26 = *(NSMutableArray **)((char *)&self->_receivedIKEPackets + 7);
      *(NSMutableArray **)((char *)&self->_receivedIKEPackets + 7) = 0LL;
    }
  }

  else
  {
    [0 invalidateIKESessionForClass:4];
    [0 invalidateIKESessionForClass:3];
    [0 setVirtualInterface:0];
  }

- (BOOL)cancelWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    dispatch_assert_queue_V2(v5);

    v6 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v4,  &v24);
    if (-[NRLink changeStateTo:details:](self, "changeStateTo:details:", 255LL, v6))
    {
      if (self)
      {
        uint64_t v8 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v8)
        {
          uint64_t v9 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
          if (v9)
          {
            *(void *)(v9 + 80) = *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7);
            uint64_t v10 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
            if (v10) {
              *(void *)(v10 + 88) = *(unint64_t *)((char *)&self->_bytesFromNexus + 7);
            }
          }
        }

        -[NRLink linkTotalReadyTimeInSec](self, "linkTotalReadyTimeInSec");
        uint64_t v12 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v12) {
          *(void *)(v12 + 16) = v11;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
        [v13 linkIsUnavailable:self];

        -[NRLinkQuickRelay invalidateLink](self, "invalidateLink");
        v14 = *(OS_nw_path_evaluator **)((char *)&self->_pathEvaluator + 7);
      }

      else
      {
        [0 linkTotalReadyTimeInSec];
        id v23 = (void *)objc_claimAutoreleasedReturnValue([0 linkDelegate]);
        [v23 linkIsUnavailable:0];

        [0 invalidateLink];
        v14 = 0LL;
      }

      [v14 submit];
    }

    else
    {
      uint64_t v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 0LL);

      if (IsLevelEnabled)
      {
        v18 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
        id v19 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v18,  0LL,  "%s%.30s:%-4d %@: link already cancelled",  ",  "-[NRLinkQuickRelay cancelWithReason:]"",  297LL,  v19);
      }
    }
  }

  else
  {
    id v21 = sub_10003B584();
    int v22 = _NRLogIsLevelEnabled(v21, 17LL);

    if (!v22) {
      goto LABEL_15;
    }
    v6 = (NSString *)sub_10003B584();
    _NRLogWithArgs(v6, 17LL, "%s called with null reasonFormat", "-[NRLinkQuickRelay cancelWithReason:]");
  }

LABEL_15:
  return v4 != 0LL;
}

- (unsigned)metric
{
  return 1024;
}

- (id)copyStatusString
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
  v6 = -[NSMutableString initWithString:](v4, "initWithString:", v5);

  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %@", "nrUUID", self->super._nrUUID);
  if (self->super._startRequested) {
    uint64_t v7 = "YES";
  }
  else {
    uint64_t v7 = "NO";
  }
  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %s", "startRequested", v7);
  if (self->_resumeRequested) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %s", "resumeRequested", v8);
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "idsService",  *(void *)(&self->_ikeSessionTimeoutScheduledOnce + 1));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "idsSession",  *(IDSService **)((char *)&self->_idsService + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "idsDestination",  *(IDSSession **)((char *)&self->_idsSession + 7));
  if (self->_idsSessionStarted) {
    uint64_t v9 = "YES";
  }
  else {
    uint64_t v9 = "NO";
  }
  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %s", "idsSessionStarted", v9);
  if (self->_invitationInProgress) {
    uint64_t v10 = "YES";
  }
  else {
    uint64_t v10 = "NO";
  }
  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %s", "invitationInProgress", v10);
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "sessionInvitationCounter",  *(NSDate **)((char *)&self->_ikeClassCEstablishedTime + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "idsSessionStartTime",  *(NSString **)((char *)&self->_idsDestination + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "connection",  *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7));
  uint64_t v11 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
  if (v11)
  {
    id v12 = [v11 connectionState];
    if ((unint64_t)v12 >= 6) {
      v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown[%lld]",  v12);
    }
    else {
      v13 = (NSString *)*(&off_1001AE718 + (void)v12);
    }
    -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %@", "connectionState", v13);
  }

  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "ikeListener",  *(NSDate **)((char *)&self->_idsSessionStartTime + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "ikeSessionClassD",  *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "ikeClassDRetryCounter",  self->_ikeClassDRetryCounter);
  if (self->super._ikeClassDEstablished) {
    v14 = "YES";
  }
  else {
    v14 = "NO";
  }
  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %s", "ikeClassDEstablished", v14);
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "ikeClassDEstablishedTime",  *(NSMutableArray **)((char *)&self->_receivedDatagrams + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "ikeSessionClassC",  *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "ikeClassCRetryCounter",  self->_ikeClassCRetryCounter);
  if (self->super._ikeClassCEstablished) {
    uint64_t v15 = "YES";
  }
  else {
    uint64_t v15 = "NO";
  }
  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %s", "ikeClassCEstablished", v15);
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "ikeClassCEstablishedTime",  *(NSDate **)((char *)&self->_ikeClassDEstablishedTime + 7));
  if (self->_isResponder) {
    v16 = "YES";
  }
  else {
    v16 = "NO";
  }
  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %s", "isResponder", v16);
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "packetNexus",  *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %@",  "ikePacketReceiver",  *(NEIPsecNexus **)((char *)&self->_packetNexus + 7));
  virtualInterface = self->super._virtualInterface;
  if (virtualInterface)
  {
    v18 = (void *)NEVirtualInterfaceCopyName(virtualInterface);
    -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %@", "virtualInterfaceName", v18);
  }

  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %p",  "nexusChannel",  *(NEIKEv2PacketReceiver **)((char *)&self->_ikePacketReceiver + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %p",  "nexusInputRing",  *(channel **)((char *)&self->_nexusChannel + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %p",  "dNexusReadSource",  *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %p",  "dNexusWriteSource",  *(OS_dispatch_source **)((char *)&self->_dNexusReadSource + 7));
  if (self->_dNexusReadSourceSuspended) {
    id v19 = "YES";
  }
  else {
    id v19 = "NO";
  }
  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %s", "dNexusReadSourceSuspended", v19);
  if (self->_dNexusWriteSourceSuspended) {
    v20 = "YES";
  }
  else {
    v20 = "NO";
  }
  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %s", "dNexusWriteSourceSuspended", v20);
  if (self->_hasPendingInputAvailable) {
    id v21 = "YES";
  }
  else {
    id v21 = "NO";
  }
  -[NSMutableString appendFormat:](v6, "appendFormat:", @"\n %35s = %s", "hasPendingInputAvailable", v21);
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "bytesFromNexus",  *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "bytesFromQR",  *(unint64_t *)((char *)&self->_bytesToQRSendFailed + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "bytesToQRBeforeSend",  *(unint64_t *)((char *)&self->_lastRecordedSessionInvitationCounter + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "bytesToQRSent",  *(unint64_t *)((char *)&self->_bytesToQRBeforeSend + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "bytesToQRSendFailed",  *(unint64_t *)((char *)&self->_bytesToQRSent + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "bytesToNexus",  *(unint64_t *)((char *)&self->_bytesFromNexus + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "receivedDatagrams.count",  [*(id *)((char *)&self->_nexusGroup + 7) count]);
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "nexusInputAvailableCount",  *(unint64_t *)((char *)&self->_bytesToNexus + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "nexusOutputAvailableCount",  *(unint64_t *)((char *)&self->_nexusInputAvailableCount + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "sentIKEv2PointToPoint",  *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "recvIKEv2PointToPoint",  *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "sentUncompressedIP",  *(unint64_t *)((char *)&self->_recvIKEv2PointToPoint + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "recvUncompressedIP",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP_ECT0 + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "sentEncapsulated6LoWPAN",  *(unint64_t *)((char *)&self->_sentUncompressedIP + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "recvEncapsulated6LoWPAN",  *(unint64_t *)((char *)&self->_recvUncompressedIP + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_ESP",  *(unint64_t *)((char *)&self->_sentEncapsulated6LoWPAN + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_ESP",  *(unint64_t *)((char *)&self->_recvEncapsulated6LoWPAN + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_ESP_ECT0",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_ESP_ECT0",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_ESP_ClassC",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ECT0 + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_ESP_ClassC",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ECT0 + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_ESP_ClassC_ECT0",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_ESP_ClassC_ECT0",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_TCP",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC_ECT0 + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_TCP",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC_ECT0 + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_TCP_ECT0",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP + 7));
  -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_TCP_ECT0",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP + 7));
  return v6;
}

- (BOOL)start
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[NRLink state](self, "state") == 255)
  {
    uint64_t v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 1LL);

    if (IsLevelEnabled)
    {
      uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      id v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d %@: Ignoring start request as link is cancelled",  ",  "-[NRLinkQuickRelay start]"",  414LL,  v11);
    }

    return 0;
  }

  if (-[NRLink state](self, "state") == 8)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    [v5 linkIsReady:self];

    return 1;
  }

  if (-[NRLink state](self, "state") != 9)
  {
    if (-[NRLink startRequested](self, "startRequested")) {
      return 1;
    }
    if (sub_100043ECC(self))
    {
      -[NRLink setStartRequested:](self, "setStartRequested:", 1LL);
      -[NRLink reportEvent:](self, "reportEvent:", 3001LL);
      if (self)
      {
        id v13 = *(id *)((char *)&self->_idsService + 7);
        if (v13)
        {
          BOOL idsSessionIsIncoming = self->_idsSessionIsIncoming;

          if (idsSessionIsIncoming)
          {
            v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
            BOOL v6 = 1;
            int v17 = _NRLogIsLevelEnabled(v16, 1LL);

            if (v17)
            {
              id v19 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
              id v20 = -[NRLink copyDescription](self, "copyDescription");
              _NRLogWithArgs( v19,  1LL,  "%s%.30s:%-4d %@: No need to send invitation as we are processing a received invite",  ",  "-[NRLinkQuickRelay start]"",  443LL,  v20);
            }

            return v6;
          }
        }
      }

      sub_100043B10((uint64_t)self);
      return 1;
    }

    return 0;
  }

  return -[NRLinkQuickRelay resume](self, "resume");
}

- (BOOL)suspend
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (self && self->_shouldCancelOnSuspend)
  {
    self->_shouldCancelOnSuspend = 0;
    -[NRLinkQuickRelay cancelWithReason:]( self,  "cancelWithReason:",  @"Cancelling after link timeout and after suspend");
  }

  if (-[NRLink state](self, "state") == 255)
  {
    uint64_t v18 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v18, 1LL);

    if (IsLevelEnabled)
    {
      id v21 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
      id v22 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v21,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'suspend'",  ",  "-[NRLinkQuickRelay suspend]"",  464LL,  v22);
    }
  }

  else
  {
    if (!-[NRLink changeStateTo:](self, "changeStateTo:", 9LL))
    {
      BOOL v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
      int v7 = _NRLogIsLevelEnabled(v6, 1LL);

      if (v7)
      {
        uint64_t v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        id v10 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v9,  1LL,  "%s%.30s:%-4d %@: link already suspended",  ",  "-[NRLinkQuickRelay suspend]"",  469LL,  v10);
      }
    }

    if (self->_dNexusReadSourceSuspended)
    {
      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusOutputRing + 7));
      self->_dNexusReadSourceSuspended = 0;
    }

    if (!-[NRLink ikeClassDEstablished](self, "ikeClassDEstablished")) {
      -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4LL);
    }
    if (!-[NRLink ikeClassCEstablished](self, "ikeClassCEstablished")) {
      -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3LL);
    }
    self->_resumeRequested = 0;
    self->_hasPendingInputAvailable = 0;
    self->_ikeClassCRetryCounter = 0;
    self->_ikeClassDRetryCounter = 0;
    self->_invitationRetryCounter = 0;
    [*(id *)((char *)&self->_ikeSessionClassC + 7) setAvailability:0];
    sub_10003B700((uint64_t)self, v11);
    uint64_t v12 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
    if (v12)
    {
      uint64_t v13 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
      if (v13)
      {
        *(void *)(v13 + 80) = *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7);
        uint64_t v14 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v14) {
          *(void *)(v14 + 88) = *(unint64_t *)((char *)&self->_bytesFromNexus + 7);
        }
      }
    }

    -[NRLink linkTotalReadyTimeInSec](self, "linkTotalReadyTimeInSec");
    uint64_t v16 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
    if (v16) {
      *(void *)(v16 + 16) = v15;
    }
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    [v17 linkIsSuspended:self];

    [*(id *)((char *)&self->_pathEvaluator + 7) submit];
    [*(id *)((char *)&self->_pathEvaluator + 7) reset];
    self->super._linkTotalReadyTimeInSec = 0.0;
    *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7) = 0LL;
    *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7) = 0LL;
    *(unint64_t *)((char *)&self->_lastRecordedBytesFromQR + 7) = 0LL;
    *(unint64_t *)((char *)&self->_bytesFromNexus + 7) = 0LL;
  }

  return 1;
}

- (BOOL)resume
{
  if (-[NRLink state](self, "state") == 255)
  {
    uint64_t v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
    BOOL v5 = 1;
    int IsLevelEnabled = _NRLogIsLevelEnabled(v14, 1LL);

    if (IsLevelEnabled)
    {
      uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
      id v13 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v12,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'resume'",  ",  "-[NRLinkQuickRelay resume]"",  518LL,  v13);
      goto LABEL_11;
    }
  }

  else if (-[NRLink state](self, "state") == 9)
  {
    if (!self) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
    if (self->_resumeRequested) {
      return v5;
    }
    self->_resumeRequested = 1;
    id v6 = *(id *)((char *)&self->_idsService + 7);
    if (!v6 || (BOOL idsSessionIsIncoming = self->_idsSessionIsIncoming, v6, !idsSessionIsIncoming))
    {
LABEL_16:
      sub_100043B10((uint64_t)self);
      return 1;
    }

    uint64_t v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    BOOL v5 = 1;
    int v10 = _NRLogIsLevelEnabled(v9, 1LL);

    if (v10)
    {
      uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v11);
      id v13 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v12,  1LL,  "%s%.30s:%-4d %@: No need to send invitation as we are processing a received invite",  ",  "-[NRLinkQuickRelay resume]"",  539LL,  v13);
LABEL_11:
    }
  }

  else
  {
    int v17 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
    int v18 = _NRLogIsLevelEnabled(v17, 1LL);

    if (v18)
    {
      uint64_t v20 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v19);
      id v21 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v20,  1LL,  "%s%.30s:%-4d %@: link not suspended for resuming",  ",  "-[NRLinkQuickRelay resume]"",  523LL,  v21);
    }

    return 0;
  }

  return v5;
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  int v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRLinkQuickRelay;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  -[NRLink invalidateIKESession:](self, "invalidateIKESession:", sub_10003D2AC((uint64_t)self, v3));
}

- (BOOL)sendControlData:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkQuickRelay connection](self, "connection"));

  if (v5)
  {
    if (v4)
    {
      id v7 = [[NEIKEv2PrivateNotify alloc] initWithNotifyStatus:50702 notifyData:v4];
      BOOL v8 = v7 != 0LL;
      if (v7)
      {
        objc_initWeak(&location, self);
        uint64_t v9 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
        id v27 = v7;
        int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_1000439DC;
        v24[3] = &unk_1001AF950;
        objc_copyWeak(&v25, &location);
        [v9 sendPrivateNotifies:v10 maxRetries:10 retryIntervalInMilliseconds:1000 callbackQueue:v11 callback:v24];

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }

      else
      {
        id v21 = sub_10003B584();
        int IsLevelEnabled = _NRLogIsLevelEnabled(v21, 17LL);

        if (IsLevelEnabled)
        {
          id v23 = sub_10003B584();
          _NRLogWithArgs(v23, 17LL, "NEIKEv2PrivateNotify init %u %@ failed", 50702LL, v4);
        }
      }
    }

    else
    {
      id v18 = sub_10003B584();
      int v19 = _NRLogIsLevelEnabled(v18, 17LL);

      if (v19)
      {
        id v20 = sub_10003B584();
        _NRLogWithArgs(v20, 17LL, "%s called with null data", "-[NRLinkQuickRelay sendControlData:]");
      }

      BOOL v8 = 0;
    }
  }

  else
  {
    uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
    BOOL v8 = 1;
    int v13 = _NRLogIsLevelEnabled(v12, 1LL);

    if (v13)
    {
      uint64_t v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
      id v16 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v15,  1LL,  "%s%.30s:%-4d %@: Not sending control data as there is no IDS session",  ",  "-[NRLinkQuickRelay sendControlData:]"",  1499LL,  v16);
    }
  }

  return v8;
}

- (BOOL)sendPacketData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v47 = sub_10003B584();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v47, 17LL);

    if (IsLevelEnabled)
    {
      id v49 = sub_10003B584();
      _NRLogWithArgs(v49, 17LL, "%s called with null data", "-[NRLinkQuickRelay sendPacketData:]");

      BOOL v19 = 0;
      goto LABEL_31;
    }

    goto LABEL_30;
  }

  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (self->super._state != 255)
  {
    uint64_t v7 = *(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7);
    IKEv2PacketString = (void *)createIKEv2PacketString(v4);
    uint64_t v9 = (unsigned __int16)[v4 length];
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkQuickRelay connection](self, "connection"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkQuickRelay connection](self, "connection"));
    id v12 = [v11 connectionState];
    if ((unint64_t)v12 >= 6) {
      int v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown[%lld]",  v12);
    }
    else {
      int v13 = (NSString *)*(&off_1001AE718 + (void)v12);
    }
    -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  3006LL,  @"Sending IKEv2 packet #%llu %@ len %u connection %@ state %@",  v7,  IKEv2PacketString,  v9,  v10,  v13);

    ++*(unint64_t *)((char *)&self->_nexusOutputAvailableCount + 7);
    id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    char v62 = 4;
    __int16 v61 = bswap32([v4 length]) >> 16;
    -[NSMutableData appendBytes:length:](v20, "appendBytes:length:", &v62, 1LL);
    -[NSMutableData appendBytes:length:](v20, "appendBytes:length:", &v61, 2LL);
    -[NSMutableData appendData:](v20, "appendData:", v4);
    id v21 = -[NSMutableData bytes](v20, "bytes");
    unsigned __int16 v22 = (unsigned __int16)-[NSMutableData length](v20, "length");
    if (!v22)
    {
      id v51 = sub_10003B584();
      int v52 = _NRLogIsLevelEnabled(v51, 16LL);

      if (v52)
      {
        id v53 = sub_10003B584();
        _NRLogWithArgs(v53, 16LL, "%s%.30s:%-4d ABORTING: Assertion Failed: dataLen > 0", ", "nrChecksumFull"", 109);
      }

      uint64_t v54 = _os_log_pack_size(12LL);
      v55 = (char *)&v59 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      v56 = __error();
      uint64_t v57 = _os_log_pack_fill( v55,  v54,  *v56,  &_mh_execute_header,  "%{public}s Assertion Failed: dataLen > 0");
      *(_DWORD *)uint64_t v57 = 136446210;
      *(void *)(v57 + 4) = "nrChecksumFull";
      id v58 = sub_10003B584();
      _NRLogAbortWithPack(v58, v55);
    }

    __int16 v60 = ~(unsigned __int16)os_inet_checksum(v21, v22, 0LL);
    -[NSMutableData appendBytes:length:](v20, "appendBytes:length:", &v60, 2LL);
    id v23 = v20;
    dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
    if (self->super._state == 255)
    {
      uint64_t v28 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
      int v29 = _NRLogIsLevelEnabled(v28, 16LL);

      if (!v29) {
        goto LABEL_27;
      }
      id v31 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v30);
      id v32 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v31,  16LL,  "%s%.30s:%-4d %@: Cannot write datagram as link is cancelled",  ",  "-[NRLinkQuickRelay writeDatagramToSession:]"",  1535LL,  v32);
    }

    else
    {
      id v25 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
      if (v25)
      {
        if ([v25 connectionState] == (id)3)
        {
          *(unint64_t *)((char *)&self->_lastRecordedSessionInvitationCounter + 7) += -[NSMutableData length]( v23,  "length");
          id v26 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
          v65 = v23;
          id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v65,  1LL));
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472LL;
          v63[2] = sub_100043710;
          v63[3] = &unk_1001AE660;
          v63[4] = self;
          v64 = v23;
          [v26 writeDatagrams:v27 completionHandler:v63];

LABEL_27:
          BOOL v19 = 1;
          goto LABEL_31;
        }

        v36 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
        id v37 = [v36 connectionState];
        if ((unint64_t)v37 >= 6) {
          v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown[%lld]",  v37);
        }
        else {
          v38 = (NSString *)*(&off_1001AE718 + (void)v37);
        }
        -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  10022LL,  @"cannot write to connection %@ state %@",  v36,  v38);

        v40 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v39);
        int v41 = _NRLogIsLevelEnabled(v40, 16LL);

        if (!v41) {
          goto LABEL_27;
        }
        id v31 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v42);
        id v43 = -[NRLink copyDescription](self, "copyDescription");
        v44 = *(NRAnalyticsCmpnLinkQuickRelay **)((char *)&self->_linkAnalytics + 7);
        id v45 = [v44 connectionState];
        if ((unint64_t)v45 >= 6) {
          v46 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown[%lld]",  v45);
        }
        else {
          v46 = (NSString *)*(&off_1001AE718 + (void)v45);
        }
        _NRLogWithArgs( v31,  16LL,  "%s%.30s:%-4d %@: Cannot write to connection %@ state %@",  ",  "-[NRLinkQuickRelay writeDatagramToSession:]"",  1551LL,  v43,  v44,  v46);

LABEL_26:
        goto LABEL_27;
      }

      objc_super v33 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
      int v34 = _NRLogIsLevelEnabled(v33, 0LL);

      if (!v34) {
        goto LABEL_27;
      }
      id v31 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v35);
      id v32 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v31,  0LL,  "%s%.30s:%-4d %@: Ignoring writing datagrams as connection does not exist",  ",  "-[NRLinkQuickRelay writeDatagramToSession:]"",  1542LL,  v32);
    }

    goto LABEL_26;
  }

  uint64_t v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
  int v15 = _NRLogIsLevelEnabled(v14, 16LL);

  if (!v15)
  {
LABEL_30:
    BOOL v19 = 0;
    goto LABEL_31;
  }

  int v17 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
  id v18 = -[NRLink copyDescription](self, "copyDescription");
  _NRLogWithArgs( v17,  16LL,  "%s%.30s:%-4d %@: Asked to send IKEv2 data but cancelled",  ",  "-[NRLinkQuickRelay sendPacketData:]"",  2040LL,  v18);

  BOOL v19 = 0;
LABEL_31:

  return v19;
}

- (void)setPacketReceiver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    dispatch_assert_queue_V2(v6);

    BOOL v8 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0LL);

    if (IsLevelEnabled)
    {
      uint64_t v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
      id v12 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v11,  0LL,  "%s%.30s:%-4d %@: Setting IKEv2 packet receiver",  ",  "-[NRLinkQuickRelay setPacketReceiver:]"",  2073LL,  v12);
    }

    objc_storeStrong((id *)((char *)&self->_packetNexus + 7), a3);
    if ([*(id *)((char *)&self->_ikeSessionTimeoutSource + 7) count])
    {
      uint64_t v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v13);
      int v15 = _NRLogIsLevelEnabled(v14, 1LL);

      if (v15)
      {
        int v17 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
        id v18 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v17,  1,  "%s%.30s:%-4d %@: processing %llu previously received IKE packets",  ",  "-[NRLinkQuickRelay setPacketReceiver:]",  2077,  v18,  [*(id *)((char *)&self->_ikeSessionTimeoutSource + 7) count]);
      }
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v19 = *(id *)((char *)&self->_ikeSessionTimeoutSource + 7);
    id v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)((char *)&self->_packetNexus + 7) receivePacketData:*(void *)(*((void *)&v27 + 1) + 8 * (void)i)];
        }

        id v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v21);
    }

    [*(id *)((char *)&self->_ikeSessionTimeoutSource + 7) removeAllObjects];
  }

  else
  {
    id v24 = sub_10003B584();
    int v25 = _NRLogIsLevelEnabled(v24, 17LL);

    if (v25)
    {
      id v26 = sub_10003B584();
      _NRLogWithArgs(v26, 17LL, "%s called with null receiver", "-[NRLinkQuickRelay setPacketReceiver:]");
    }
  }
}

- (void)acceptNewFlow:(id)a3 fromNexus:(id)a4 completionHandler:(id)a5
{
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = a3;
  int v15 = (char *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (unsigned int (**)(void, NEIKEv2SessionConfiguration *))a7;
  id v19 = a8;
  id v20 = (void (**)(void, void, void, void))v19;
  if (!v14)
  {
    id v120 = sub_10003B584();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v120, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_24;
    }
    id v122 = sub_10003B584();
    _NRLogWithArgs(v122, 17LL, "%s called with null listener");
LABEL_77:

    goto LABEL_24;
  }

  if (!v15)
  {
    id v123 = sub_10003B584();
    int v124 = _NRLogIsLevelEnabled(v123, 17LL);

    if (!v124) {
      goto LABEL_24;
    }
    id v122 = sub_10003B584();
    _NRLogWithArgs(v122, 17LL, "%s called with null session");
    goto LABEL_77;
  }

  if (!v16)
  {
    id v125 = sub_10003B584();
    int v126 = _NRLogIsLevelEnabled(v125, 17LL);

    if (!v126) {
      goto LABEL_24;
    }
    id v122 = sub_10003B584();
    _NRLogWithArgs(v122, 17LL, "%s called with null sessionConfig");
    goto LABEL_77;
  }

  if (!v18)
  {
    id v127 = sub_10003B584();
    int v128 = _NRLogIsLevelEnabled(v127, 17LL);

    if (!v128) {
      goto LABEL_24;
    }
    id v122 = sub_10003B584();
    _NRLogWithArgs(v122, 17LL, "%s called with null validateAuthBlock");
    goto LABEL_77;
  }

  if (!v19)
  {
    id v129 = sub_10003B584();
    int v130 = _NRLogIsLevelEnabled(v129, 17LL);

    if (!v130) {
      goto LABEL_24;
    }
    id v122 = sub_10003B584();
    _NRLogWithArgs(v122, 17LL, "%s called with null responseBlock");
    goto LABEL_77;
  }

  id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v21);

  id v23 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v22);
  int v24 = _NRLogIsLevelEnabled(v23, 0LL);

  if (v24)
  {
    id v26 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v25);
    id v27 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v26,  0LL,  "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@",  ",  "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  2115LL,  v27,  v14,  v15,  v16,  v17);
  }

  int state = self->super._state;
  id v162 = v17;
  if (state == 255) {
    goto LABEL_21;
  }
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
  id v30 = [v29 identifierType];

  if (v30 == (id)11)
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteIdentifier]);
    id v33 = [v32 identifierType];

    if (v33 == (id)11)
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
      v36 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v35);

      v161 = v36;
      if (!v36)
      {
        id v131 = sub_10003B584();
        int v132 = _NRLogIsLevelEnabled(v131, 16LL);

        if (v132)
        {
          id v133 = sub_10003B584();
          _NRLogWithArgs( v133,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)",  ",  "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  2135);
        }

        uint64_t v134 = _os_log_pack_size(12LL);
        int v15 = (char *)&v156 - ((__chkstk_darwin(v134) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        v135 = __error();
        uint64_t v136 = _os_log_pack_fill( v15,  v134,  *v135,  &_mh_execute_header,  "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
        *(_DWORD *)uint64_t v136 = 136446210;
        *(void *)(v136 + 4) = "-[NRLinkQuickRelay requestConfigurationForListener:session:sessionConfig:childConfig:val"
                                "idateAuthBlock:responseBlock:]";
        id v137 = sub_10003B584();
        _NRLogAbortWithPack(v137, v15);
LABEL_81:
        dispatch_once(&qword_1001DCA68, &stru_1001AFD30);
LABEL_39:
        id v73 = v162;
        id v74 = (id)qword_1001DCA60;
        unsigned int v75 = [v36 isEqual:v74];

        if (v75)
        {
          uint64_t v76 = mach_absolute_time();
          uint64_t v77 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
          if (v77)
          {
            *(void *)(v77 + 48) = v76;
            v78 = *(id *)((char *)&self->_pathEvaluator + 7);
            if (v78) {
              ++v78[9];
            }

            if (v73) {
              goto LABEL_44;
            }
          }

          else
          {

            if (v73)
            {
LABEL_44:
              v79 = sub_100146AFC();
              dispatch_assert_queue_V2((dispatch_queue_t)v79);

              v80 = v161;
              v81 = sub_10012CD2C(v161, @"0");
              v82 = sub_100146AFC();
              dispatch_assert_queue_V2((dispatch_queue_t)v82);

              v83 = sub_10012D254(v80, @"0");
              v40 = sub_10010C6B8(0, v80, 4LL);
              id v156 = objc_alloc(&OBJC_CLASS___NEIKEv2ConfigurationMessage);
              id v84 = objc_alloc(&OBJC_CLASS___NEIKEv2InitiatorTransportIPv6Address);
              id v157 = v83;
              id v85 = [v84 initWithAddress:v83];
              v164[0] = v85;
              id v86 = objc_alloc(&OBJC_CLASS___NEIKEv2ResponderTransportIPv6Address);
              id v158 = v81;
              id v87 = [v86 initWithAddress:v81];
              v164[1] = v87;
              v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v164,  2LL));
              id v89 = [v156 initWithWithAttributes:v88];
              -[NEIKEv2SessionConfiguration setConfigurationReply:](v40, "setConfigurationReply:", v89);

              id v18 = v160;
              if (v160[2](v160, v40))
              {
                id v90 = v157;
                uint64_t v91 = 4LL;
                -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4LL);
                objc_storeStrong((id *)((char *)&self->_ikeListener + 7), a4);
                v92 = @"ClassD %@";
LABEL_55:
                sub_10003D41C(self, v91);
                -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3016LL, v92, v15);

LABEL_57:
                if (self->super._virtualInterface)
                {

                  v112 = sub_10010C340();
                  ((void (**)(void, NEIKEv2SessionConfiguration *, NEIKEv2ChildSAConfiguration *, NEVirtualInterface_s *))v20)[2]( v20,  v40,  v112,  self->super._virtualInterface);

                  id v14 = v159;
                  goto LABEL_23;
                }

                v138 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v96);
                int v139 = _NRLogIsLevelEnabled(v138, 17LL);

                if (v139)
                {
                  v141 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v140);
                  id v142 = -[NRLink copyDescription](self, "copyDescription");
                  _NRLogWithArgs(v141, 17LL, "%@: virtualInterface is NULL", v142);
                }

                goto LABEL_63;
              }

              -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3021LL, @"ClassD %@", v15);
              goto LABEL_65;
            }
          }

          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024LL, @"ClassD %@", v15);
LABEL_62:
          v40 = 0LL;
LABEL_63:
          id v14 = v159;
          id v18 = v160;
          goto LABEL_66;
        }

        v93 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
        if (qword_1001DCA78 != -1) {
          dispatch_once(&qword_1001DCA78, &stru_1001AFD50);
        }
        id v94 = (id)qword_1001DCA70;
        unsigned int v95 = [v93 isEqual:v94];

        if (!v95)
        {
          v40 = 0LL;
          id v18 = v160;
          goto LABEL_57;
        }

        uint64_t v97 = mach_absolute_time();
        uint64_t v98 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v98)
        {
          *(void *)(v98 + 32) = v97;
          v99 = *(id *)((char *)&self->_pathEvaluator + 7);
          if (v99) {
            ++v99[8];
          }

          if (v73) {
            goto LABEL_53;
          }
        }

        else
        {

          if (v73)
          {
LABEL_53:
            v100 = sub_100146AFC();
            dispatch_assert_queue_V2((dispatch_queue_t)v100);

            v101 = v161;
            v102 = (void *)sub_10012D45C(v161, @"0");
            v103 = sub_100146AFC();
            dispatch_assert_queue_V2((dispatch_queue_t)v103);

            v104 = sub_10012D610(v101, @"0");
            v40 = sub_10010C6B8(0, v101, 3LL);
            id v105 = objc_alloc(&OBJC_CLASS___NEIKEv2ConfigurationMessage);
            id v106 = objc_alloc(&OBJC_CLASS___NEIKEv2InitiatorTransportIPv6Address);
            id v157 = v104;
            id v107 = [v106 initWithAddress:v104];
            v163[0] = v107;
            id v108 = objc_alloc(&OBJC_CLASS___NEIKEv2ResponderTransportIPv6Address);
            id v158 = v102;
            id v109 = [v108 initWithAddress:v102];
            v163[1] = v109;
            v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v163,  2LL));
            id v111 = [v105 initWithWithAttributes:v110];
            -[NEIKEv2SessionConfiguration setConfigurationReply:](v40, "setConfigurationReply:", v111);

            id v18 = v160;
            if (v160[2](v160, v40))
            {
              id v90 = v157;
              uint64_t v91 = 3LL;
              -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3LL);
              sub_1000436F8((uint64_t)self, v15);
              v92 = @"ClassC %@";
              goto LABEL_55;
            }

            -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3021LL, @"ClassC %@", v15);
LABEL_65:

            id v14 = v159;
            goto LABEL_66;
          }
        }

        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024LL, @"ClassC %@", v15);
        goto LABEL_62;
      }

      id v37 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteIdentifier]);
      unsigned __int8 v39 = [v37 isEqual:v38];

      id v159 = v14;
      v160 = v18;
      if ((v39 & 1) != 0)
      {
        if (_os_feature_enabled_impl("terminus", "EncryptedIdentity") && v161[11])
        {
          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3022LL, @"%@ %@", v15, v161);
          v40 = 0LL;
LABEL_66:

          goto LABEL_22;
        }

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withOptions:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v17);

  if (-[NRLink state](self, "state") != 255)
  {
    if (v12)
    {
      if (v13)
      {
        if (v14)
        {
          id v19 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
          int IsLevelEnabled = _NRLogIsLevelEnabled(v19, 1LL);

          if (IsLevelEnabled)
          {
            uint64_t v22 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v21);
            id v23 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v22,  1LL,  "%s%.30s:%-4d %@: Invite received",  ",  "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]"",  2278LL,  v23);
          }

          int v24 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v21);
          int v25 = _NRLogIsLevelEnabled(v24, 1LL);

          if (v25)
          {
            id v27 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v26);
            id v28 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v27,  1LL,  "%s%.30s:%-4d %@: \tservice: %@",  ",  "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]"",  2279LL,  v28,  v12);
          }

          __int128 v29 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v26);
          int v30 = _NRLogIsLevelEnabled(v29, 1LL);

          if (v30)
          {
            id v32 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
            id v33 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v32,  1LL,  "%s%.30s:%-4d %@: \taccount: %@",  ",  "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]"",  2280LL,  v33,  v13);
          }

          uint64_t v34 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
          int v35 = _NRLogIsLevelEnabled(v34, 1LL);

          if (v35)
          {
            id v37 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v36);
            id v38 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v37,  1LL,  "%s%.30s:%-4d %@: \tsession: %@",  ",  "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]"",  2281LL,  v38,  v14);
          }

          unsigned __int8 v39 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v36);
          int v40 = _NRLogIsLevelEnabled(v39, 1LL);

          if (v40)
          {
            int v42 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v41);
            id v43 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v42,  1LL,  "%s%.30s:%-4d %@: \tfrom: %@",  ",  "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]"",  2282LL,  v43,  v15);
          }

          v44 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v41);
          int v45 = _NRLogIsLevelEnabled(v44, 1LL);

          if (v45)
          {
            id v47 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v46);
            id v48 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v47,  1LL,  "%s%.30s:%-4d %@: \toptions: %@",  ",  "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]"",  2283LL,  v48,  v16);
          }

          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionID]);
          v50 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v50,  "setObject:forKeyedSubscript:",  &off_1001BC5E0,  @"State");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v50,  "setObject:forKeyedSubscript:",  v49,  @"SessionID");
          sub_100101A04(@"IDS Session", v50);

          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 10004LL, @"%@", v14);
          id v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(&self->_ikeSessionTimeoutScheduledOnce + 1) deviceForFromID:v15]);
          if ([v51 isDefaultPairedDevice])
          {
            if (self->_invitationInProgress)
            {
              int v52 = *(id *)((char *)&self->_pathEvaluator + 7);
              if (v52) {
                ++v52[13];
              }

              -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  10005LL,  @"Keeping sent: %@, Ignoring received: %@",  *(IDSService **)((char *)&self->_idsService + 7),  v14);
            }

            else
            {
              if (*(IDSService **)((char *)&self->_idsService + 7))
              {
                -[NRLink reportEvent:](self, "reportEvent:", 10019LL);
                sub_10003B700((uint64_t)self, v58);
              }

              objc_storeStrong((id *)((char *)&self->_idsService + 7), a5);
              self->_BOOL idsSessionIsIncoming = 1;
              id v59 = *(id *)((char *)&self->_idsService + 7);
              uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
              [v59 setDelegate:self queue:v60];

              uint64_t v71 = IDSSessionForceInternetInvitationKey;
              uint64_t v72 = &__kCFBooleanTrue;
              __int16 v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
              [v14 setPreferences:v61];

              [v14 acceptInvitation];
              -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  10006LL,  @"%@",  *(IDSService **)((char *)&self->_idsService + 7));
              uint64_t v62 = mach_absolute_time();
              uint64_t v63 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
              if (v63) {
                *(void *)(v63 + 128) = v62;
              }
            }
          }

          else
          {
            -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  10026LL,  @"Remote device is not the default paired device: %@/%@",  v14,  v15);
            [v14 declineInvitation];
          }

          goto LABEL_31;
        }

        id v69 = sub_10003B584();
        int v70 = _NRLogIsLevelEnabled(v69, 17LL);

        if (!v70) {
          goto LABEL_31;
        }
        id v66 = sub_10003B584();
        _NRLogWithArgs(v66, 17LL, "%s called with null session");
      }

      else
      {
        id v67 = sub_10003B584();
        int v68 = _NRLogIsLevelEnabled(v67, 17LL);

        if (!v68) {
          goto LABEL_31;
        }
        id v66 = sub_10003B584();
        _NRLogWithArgs(v66, 17LL, "%s called with null account");
      }
    }

    else
    {
      id v64 = sub_10003B584();
      int v65 = _NRLogIsLevelEnabled(v64, 17LL);

      if (!v65) {
        goto LABEL_31;
      }
      id v66 = sub_10003B584();
      _NRLogWithArgs(v66, 17LL, "%s called with null service");
    }

    goto LABEL_31;
  }

  id v53 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
  int v54 = _NRLogIsLevelEnabled(v53, 1LL);

  if (v54)
  {
    v56 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v55);
    id v57 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v56,  1LL,  "%s%.30s:%-4d %@: Declining session invite due to link state",  ",  "-[NRLinkQuickRelay service:account:inviteReceivedForSession:fromID:withOptions:]"",  2267LL,  v57);
  }

  -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  10026LL,  @"Link is cancelled: %@/%@/%@",  self,  v14,  v15);
  [v14 declineInvitation];
LABEL_31:
}

- (void)sessionStarted:(id)a3
{
  id v5 = (IDSService *)a3;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  if (-[NRLink state](self, "state") == 255)
  {
    id v19 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v19, 1LL);

    if (IsLevelEnabled)
    {
      id v17 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v21);
      id v22 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v17,  1LL,  "%s%.30s:%-4d %@: Ignoring callback as link is cancelled",  ",  "-[NRLinkQuickRelay sessionStarted:]"",  2355LL,  v22);

LABEL_24:
      goto LABEL_25;
    }

    goto LABEL_25;
  }

  if (!v5)
  {
    id v34 = sub_10003B584();
    int v35 = _NRLogIsLevelEnabled(v34, 17LL);

    if (v35)
    {
      id v36 = sub_10003B584();
      _NRLogWithArgs(v36, 17LL, "%s called with null session", "-[NRLinkQuickRelay sessionStarted:]");
    }

    goto LABEL_25;
  }

  BOOL v8 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
  int v9 = _NRLogIsLevelEnabled(v8, 0LL);

  if (v9)
  {
    uint64_t v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
    id v12 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v11,  0LL,  "%s%.30s:%-4d %@: Session started: %@",  ",  "-[NRLinkQuickRelay sessionStarted:]"",  2360LL,  v12,  v5);
  }

  id v13 = &selRef_sources;
  if (*(IDSService **)((char *)&self->_idsService + 7) == v5)
  {
    self->_idsSessionStarted = 1;
    self->_invitationInProgress = 0;
    self->_invitationRetryCounter = 0;
    id v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    objc_storeStrong((id *)((char *)&self->_idsDestination + 7), v17);
    uint64_t v23 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
    if (!v23) {
      goto LABEL_18;
    }
    if (*(void *)(v23 + 112))
    {
      uint64_t v24 = mach_absolute_time();
      uint64_t v25 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
      if (!v25) {
        goto LABEL_18;
      }
      uint64_t v26 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionSendInvitationEnd;
    }

    else
    {
      if (!*(void *)(v23 + 128)
        || (uint64_t v24 = mach_absolute_time(), (v25 = *(uint64_t *)((char *)&self->_pathEvaluator + 7)) == 0))
      {
LABEL_18:
        uint64_t v27 = mach_absolute_time();
        uint64_t v28 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (v28) {
          *(void *)(v28 + 144) = v27;
        }
        sub_10003B930((uint64_t)self);
        id v29 = (id)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
        uint64_t v18 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v29);

        if (v18)
        {
          sub_10012E070(v18, (NWDatagramConnection **)((char *)&self->_connection + 7));
          sub_10012D7C8(v18, (__uint32_t *)((char *)&self->_localAddrClassD.__u6_addr32[3] + 3));
          id v29 = *(id *)(&self->_ikeSessionTimeoutScheduledOnce + 1);
          id v13 = (char **)*(id *)((char *)&self->_idsService + 7);
          int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
          if (qword_1001DCA40 == -1)
          {
LABEL_22:
            int v30 = (dispatch_queue_s *)(id)qword_1001DCA48;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100043234;
            block[3] = &unk_1001AF908;
            id v45 = v29;
            uint64_t v46 = v13;
            id v47 = v3;
            id v48 = self;
            id v31 = v3;
            id v32 = v13;
            id v33 = v29;
            dispatch_async(v30, block);

            goto LABEL_23;
          }
        }

        else
        {
          id v37 = sub_10003B584();
          int v38 = _NRLogIsLevelEnabled(v37, 16LL);

          id v17 = "-[NRLinkQuickRelay sessionStarted:]";
          if (v38)
          {
            id v39 = sub_10003B584();
            _NRLogWithArgs( v39,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)",  ",  "-[NRLinkQuickRelay sessionStarted:]"",  2380);
          }

          id v5 = (IDSService *)_os_log_pack_size(12LL);
          self = (NRLinkQuickRelay *)((char *)&block[-1] - ((__chkstk_darwin(v5) + 15) & 0xFFFFFFFFFFFFFFF0LL));
          int v40 = __error();
          uint64_t v41 = _os_log_pack_fill( self,  v5,  *v40,  &_mh_execute_header,  "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
          *(_DWORD *)uint64_t v41 = 136446210;
          *(void *)(v41 + 4) = "-[NRLinkQuickRelay sessionStarted:]";
          id v42 = sub_10003B584();
          _NRLogAbortWithPack(v42, self);
        }

        dispatch_once(&qword_1001DCA40, &stru_1001AFC88);
        goto LABEL_22;
      }

      uint64_t v26 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionReceiveInvitationEnd;
    }

    *(void *)(v25 + *v26) = v24;
    goto LABEL_18;
  }

  id v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
  int v15 = _NRLogIsLevelEnabled(v14, 17LL);

  if (v15)
  {
    id v17 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
    uint64_t v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v17,  17LL,  "%@: Sessions do not match: expected %@, started %@",  v18,  *(IDSService **)((char *)&self->_idsService + 7),  v5);
LABEL_23:

    goto LABEL_24;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"_connection.connectionState", a4, a5, a6))
  {
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003BA64;
    block[3] = &unk_1001B0A88;
    void block[4] = self;
    dispatch_async(v7, block);
  }

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v49 = a3;
  id v8 = a5;
  int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  if (-[NRLink state](self, "state") == 255)
  {
    uint64_t v21 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v21, 1LL);

    if (IsLevelEnabled)
    {
      uint64_t v24 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v23);
      id v25 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v24,  1LL,  "%s%.30s:%-4d %@: Ignoring callback as link is cancelled",  ",  "-[NRLinkQuickRelay sessionEnded:withReason:error:]"",  2520LL,  v25);
    }
  }

  else
  {
    if (v49)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v49 sessionID]);
      id v12 = v11;
      if (self)
      {
        id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  &off_1001BC610,  @"State");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v12,  @"SessionID");
        sub_100101A04(@"IDS Session", v13);

        -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  10009LL,  @"%@, %u, %@",  v49,  v6,  v8);
        id v15 = *(IDSService **)((char *)&self->_idsService + 7);
      }

      else
      {

        [0 reportEvent:10009, @"%@, %u, %@", v49, v6, v8 detailsFormat];
        id v15 = 0LL;
      }

      uint64_t v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
      if (v15 != v49)
      {
        int v17 = _NRLogIsLevelEnabled(v16, 17LL);

        if (v17)
        {
          id v19 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
          id v20 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v19,  17LL,  "%@: Sessions do not match: expected %@, started %@",  v20,  *(IDSService **)((char *)&self->_idsService + 7),  v49);
        }

        goto LABEL_37;
      }

      int v26 = _NRLogIsLevelEnabled(v16, 0LL);

      if (v26)
      {
        uint64_t v28 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v27);
        id v29 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v28,  0LL,  "%s%.30s:%-4d %@: Session ended: %@ with reason %u, error %@",  ",  "-[NRLinkQuickRelay sessionEnded:withReason:error:]"",  2529LL,  v29,  v49,  v6,  v8);
      }

      self->_idsSessionStarted = 0;
      self->_invitationInProgress = 0;
      uint64_t v30 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
      if (!v30) {
        goto LABEL_20;
      }
      if (*(void *)(v30 + 144))
      {
        uint64_t v31 = mach_absolute_time();
        uint64_t v32 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (!v32)
        {
LABEL_20:
          uint64_t v34 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
          if (v34) {
            *(_DWORD *)(v34 + 100) = v6;
          }
          if (self->_dNexusReadSourceSuspended)
          {
            dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusOutputRing + 7));
            self->_dNexusReadSourceSuspended = 0;
          }

          if ((_DWORD)v6 == 21
            && (-[NRLink ikeClassCEstablished](self, "ikeClassCEstablished")
             || -[NRLink ikeClassDEstablished](self, "ikeClassDEstablished")))
          {
            sub_10003B5F4(self);
          }

          else
          {
            if (-[NRLink ikeClassCEstablished](self, "ikeClassCEstablished")
              || -[NRLink ikeClassDEstablished](self, "ikeClassDEstablished"))
            {
              id v36 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v35);
              int v37 = _NRLogIsLevelEnabled(v36, 0LL);

              if (v37)
              {
                id v39 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v38);
                id v40 = -[NRLink copyDescription](self, "copyDescription");
                _NRLogWithArgs( v39,  0LL,  "%s%.30s:%-4d %@: Not tearing down IKE",  ",  "-[NRLinkQuickRelay sessionEnded:withReason:error:]"",  2559LL,  v40);
              }

              sub_10003B700((uint64_t)self, v38);
            }

            else
            {
              uint64_t v41 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v35);
              int v42 = _NRLogIsLevelEnabled(v41, 0LL);

              if (v42)
              {
                v44 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v43);
                id v45 = -[NRLink copyDescription](self, "copyDescription");
                _NRLogWithArgs( v44,  0LL,  "%s%.30s:%-4d %@: Tearing down everything",  ",  "-[NRLinkQuickRelay sessionEnded:withReason:error:]"",  2564LL,  v45);
              }

              sub_10003B700((uint64_t)self, v43);
              -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4LL);
              -[NRLinkQuickRelay invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3LL);
            }

            -[NRLinkQuickRelay suspend](self, "suspend");
          }

          goto LABEL_37;
        }

        id v33 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionEnd;
      }

      else
      {
        if (!*(void *)(v30 + 112)) {
          goto LABEL_20;
        }
        *(_BYTE *)(v30 + 96) = 1;
        uint64_t v31 = mach_absolute_time();
        uint64_t v32 = *(uint64_t *)((char *)&self->_pathEvaluator + 7);
        if (!v32) {
          goto LABEL_20;
        }
        id v33 = &OBJC_IVAR___NRAnalyticsCmpnLinkQuickRelay__idsSessionSendInvitationEnd;
      }

      *(void *)(v32 + *v33) = v31;
      goto LABEL_20;
    }

    id v46 = sub_10003B584();
    int v47 = _NRLogIsLevelEnabled(v46, 17LL);

    if (v47)
    {
      id v48 = sub_10003B584();
      _NRLogWithArgs(v48, 17LL, "%s called with null session", "-[NRLinkQuickRelay sessionEnded:withReason:error:]");
    }
  }

- (void)session:(id)a3 didReceiveData:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (-[NRLink state](self, "state") == 255)
  {
    uint64_t v23 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v23, 1LL);

    if (IsLevelEnabled)
    {
      id v21 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v25);
      id v22 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v21,  1LL,  "%s%.30s:%-4d %@: Ignoring callback as link is cancelled",  ",  "-[NRLinkQuickRelay session:didReceiveData:]"",  2579LL,  v22);
      goto LABEL_13;
    }
  }

  else
  {
    if (!v30)
    {
      id v26 = sub_10003B584();
      int v27 = _NRLogIsLevelEnabled(v26, 17LL);

      if (!v27) {
        goto LABEL_15;
      }
      id v21 = sub_10003B584();
      _NRLogWithArgs(v21, 17LL, "%s called with null uniqueID");
      goto LABEL_14;
    }

    if (!v6)
    {
      id v28 = sub_10003B584();
      int v29 = _NRLogIsLevelEnabled(v28, 17LL);

      if (!v29) {
        goto LABEL_15;
      }
      id v21 = sub_10003B584();
      _NRLogWithArgs(v21, 17LL, "%s called with null data");
      goto LABEL_14;
    }

    if (self) {
      int v9 = *(IDSService **)((char *)&self->_idsService + 7);
    }
    else {
      int v9 = 0LL;
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionID]);
    unsigned __int8 v11 = [v10 isEqualToString:v30];

    if ((v11 & 1) == 0)
    {
      id v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
      int v14 = _NRLogIsLevelEnabled(v13, 17LL);

      if (v14)
      {
        id v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
        id v16 = -[NRLink copyDescription](self, "copyDescription");
        int v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_idsService + 7) sessionID]);
        _NRLogWithArgs(v15, 17LL, "%@: Received data from a different session: %@, expected %@", v16, v30, v17);
      }
    }

    uint64_t v18 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
    int v19 = _NRLogIsLevelEnabled(v18, 0LL);

    if (v19)
    {
      id v21 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
      id v22 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v21,  0LL,  "%s%.30s:%-4d %@: Session for %@ received data %@",  ",  "-[NRLinkQuickRelay session:didReceiveData:]"",  2591LL,  v22,  v30,  v6);
LABEL_13:

LABEL_14:
    }
  }

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (-[NRLink state](self, "state") == 255)
  {
    id v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 1LL);

    if (!IsLevelEnabled) {
      goto LABEL_14;
    }
    id v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
    id v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v13,  1LL,  "%s%.30s:%-4d %@: Ignoring callback as link is cancelled",  ",  "-[NRLinkQuickRelay session:receivedInvitationAcceptFromID:]"",  2598LL,  v18);
LABEL_12:

    goto LABEL_13;
  }

  if (!v23)
  {
    id v21 = sub_10003B584();
    int v22 = _NRLogIsLevelEnabled(v21, 17LL);

    if (!v22) {
      goto LABEL_14;
    }
    id v13 = sub_10003B584();
    _NRLogWithArgs( v13,  17LL,  "%s called with null session",  "-[NRLinkQuickRelay session:receivedInvitationAcceptFromID:]");
    goto LABEL_13;
  }

  if (self) {
    id v9 = *(IDSService **)((char *)&self->_idsService + 7);
  }
  else {
    id v9 = 0LL;
  }
  uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
  if (v9 == v23)
  {
    int v19 = _NRLogIsLevelEnabled(v10, 0LL);

    if (!v19) {
      goto LABEL_14;
    }
    id v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
    id v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v13,  0LL,  "%s%.30s:%-4d %@: Destination %@ accepted invitation for session %@",  ",  "-[NRLinkQuickRelay session:receivedInvitationAcceptFromID:]"",  2604LL,  v18,  v6,  v23);
    goto LABEL_12;
  }

  int v11 = _NRLogIsLevelEnabled(v10, 17LL);

  if (v11)
  {
    id v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
    id v14 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v13,  17LL,  "%@: Sessions do not match: expected %@, started %@",  v14,  *(IDSService **)((char *)&self->_idsService + 7),  v23);

LABEL_13:
  }

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (-[NRLink state](self, "state") == 255)
  {
    id v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 1LL);

    if (!IsLevelEnabled) {
      goto LABEL_14;
    }
    id v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
    id v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v13,  1LL,  "%s%.30s:%-4d %@: Ignoring callback as link is cancelled",  ",  "-[NRLinkQuickRelay session:receivedInvitationCancelFromID:]"",  2611LL,  v18);
LABEL_12:

    goto LABEL_13;
  }

  if (!v23)
  {
    id v21 = sub_10003B584();
    int v22 = _NRLogIsLevelEnabled(v21, 17LL);

    if (!v22) {
      goto LABEL_14;
    }
    id v13 = sub_10003B584();
    _NRLogWithArgs( v13,  17LL,  "%s called with null session",  "-[NRLinkQuickRelay session:receivedInvitationCancelFromID:]");
    goto LABEL_13;
  }

  if (self) {
    id v9 = *(IDSService **)((char *)&self->_idsService + 7);
  }
  else {
    id v9 = 0LL;
  }
  uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
  if (v9 == v23)
  {
    int v19 = _NRLogIsLevelEnabled(v10, 0LL);

    if (!v19) {
      goto LABEL_14;
    }
    id v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
    id v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v13,  0LL,  "%s%.30s:%-4d %@: Destination %@ cancelled invitation for session %@",  ",  "-[NRLinkQuickRelay session:receivedInvitationCancelFromID:]"",  2617LL,  v18,  v6,  v23);
    goto LABEL_12;
  }

  int v11 = _NRLogIsLevelEnabled(v10, 17LL);

  if (v11)
  {
    id v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
    id v14 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v13,  17LL,  "%@: Sessions do not match: expected %@, started %@",  v14,  *(IDSService **)((char *)&self->_idsService + 7),  v23);

LABEL_13:
  }

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (-[NRLink state](self, "state") == 255)
  {
    id v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 1LL);

    if (!IsLevelEnabled) {
      goto LABEL_14;
    }
    id v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
    id v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v13,  1LL,  "%s%.30s:%-4d %@: Ignoring callback as link is cancelled",  ",  "-[NRLinkQuickRelay session:receivedInvitationDeclineFromID:]"",  2624LL,  v18);
LABEL_12:

    goto LABEL_13;
  }

  if (!v23)
  {
    id v21 = sub_10003B584();
    int v22 = _NRLogIsLevelEnabled(v21, 17LL);

    if (!v22) {
      goto LABEL_14;
    }
    id v13 = sub_10003B584();
    _NRLogWithArgs( v13,  17LL,  "%s called with null session",  "-[NRLinkQuickRelay session:receivedInvitationDeclineFromID:]");
    goto LABEL_13;
  }

  if (self) {
    id v9 = *(IDSService **)((char *)&self->_idsService + 7);
  }
  else {
    id v9 = 0LL;
  }
  uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
  if (v9 == v23)
  {
    int v19 = _NRLogIsLevelEnabled(v10, 0LL);

    if (!v19) {
      goto LABEL_14;
    }
    id v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
    id v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v13,  0LL,  "%s%.30s:%-4d %@: Destination %@ declined invitation for session %@",  ",  "-[NRLinkQuickRelay session:receivedInvitationDeclineFromID:]"",  2630LL,  v18,  v6,  v23);
    goto LABEL_12;
  }

  int v11 = _NRLogIsLevelEnabled(v10, 17LL);

  if (v11)
  {
    id v13 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
    id v14 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v13,  17LL,  "%@: Sessions do not match: expected %@, started %@",  v14,  *(IDSService **)((char *)&self->_idsService + 7),  v23);

LABEL_13:
  }

- (NWDatagramConnection)connection
{
  return *(NWDatagramConnection **)((char *)&self->_linkAnalytics + 7);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end