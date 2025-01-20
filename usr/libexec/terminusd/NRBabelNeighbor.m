@interface NRBabelNeighbor
- (BOOL)dtlsEnabled;
- (BOOL)dtlsReady;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesAddress:(const in6_addr *)a3;
- (BOOL)matchesAddress:(const in6_addr *)a3 babelInterface:(id)a4;
- (NRBabelInterface)babelInterface;
- (NRBabelNeighbor)initWithAddress:(const in6_addr *)p_class_meths babelInterface:(id)a4;
- (NRDDTLSStack)dtlsStack;
- (NSMutableArray)pendingOutgoingPackets;
- (NSString)description;
- (OS_dispatch_source)incomingIHUTimer;
- (OS_dispatch_source)incomingPersonalHelloTimer;
- (OS_dispatch_source)incomingPublicHelloTimer;
- (OS_dispatch_source)pendingOutgoingTimer;
- (double)lastIncomingPersonalHelloTime;
- (double)lastIncomingPublicHelloTime;
- (id)createIHUTLV;
- (id)createPersonalHelloTLV;
- (id)descriptionWithNextHop:(const in6_addr *)a3;
- (in6_addr)address;
- (unint64_t)incomingPersonalHelloHistory;
- (unint64_t)incomingPublicHelloHistory;
- (unsigned)lastIncomingIHUInterval;
- (unsigned)lastIncomingPersonalHelloInterval;
- (unsigned)lastIncomingPersonalHelloSeqno;
- (unsigned)lastIncomingPublicHelloInterval;
- (unsigned)lastIncomingPublicHelloSeqno;
- (unsigned)metric;
- (unsigned)outgoingIHUInterval;
- (unsigned)outgoingPersonalHelloSeqno;
- (unsigned)outgoingUpdateInterval;
- (unsigned)rxcost;
- (unsigned)txcost;
- (void)dealloc;
- (void)enqueueNextIHU;
- (void)enqueueNextUpdate;
- (void)handleDTLSStack:(id)a3 inboundDecryptedData:(id)a4;
- (void)handleDTLSStack:(id)a3 outboundEncryptedData:(id)a4;
- (void)handleHelloWithSeqno:(unsigned __int16)a3 interval:(unsigned __int16)a4 personal:(BOOL)a5;
- (void)handleIsReady:(id)a3;
- (void)processPendingOutgoingPackets;
- (void)resetIncomingHelloTimer:(BOOL)a3 personal:(BOOL)a4;
- (void)resetIncomingIHUTimerInterval:(unsigned __int16)a3;
- (void)scheduleTLV:(id)a3 interval:(unsigned __int16)a4;
- (void)sendFullPacket:(iovec *)a3 iovLen:(unsigned int)a4;
- (void)sendTLVs:(id)a3;
- (void)setAddress:(in6_addr)a3;
- (void)setBabelInterface:(id)a3;
- (void)setDtlsEnabled:(BOOL)a3;
- (void)setDtlsReady:(BOOL)a3;
- (void)setDtlsStack:(id)a3;
- (void)setIncomingIHUTimer:(id)a3;
- (void)setIncomingPersonalHelloHistory:(unint64_t)a3;
- (void)setIncomingPersonalHelloTimer:(id)a3;
- (void)setIncomingPublicHelloHistory:(unint64_t)a3;
- (void)setIncomingPublicHelloTimer:(id)a3;
- (void)setLastIncomingIHUInterval:(unsigned __int16)a3;
- (void)setLastIncomingPersonalHelloInterval:(unsigned __int16)a3;
- (void)setLastIncomingPersonalHelloSeqno:(unsigned __int16)a3;
- (void)setLastIncomingPersonalHelloTime:(double)a3;
- (void)setLastIncomingPublicHelloInterval:(unsigned __int16)a3;
- (void)setLastIncomingPublicHelloSeqno:(unsigned __int16)a3;
- (void)setLastIncomingPublicHelloTime:(double)a3;
- (void)setOutgoingIHUInterval:(unsigned __int16)a3;
- (void)setOutgoingPersonalHelloSeqno:(unsigned __int16)a3;
- (void)setOutgoingUpdateInterval:(unsigned __int16)a3;
- (void)setPendingOutgoingPackets:(id)a3;
- (void)setPendingOutgoingTimer:(id)a3;
- (void)setRxcost:(unsigned __int16)a3;
- (void)setTxcost:(unsigned __int16)a3;
- (void)updateRXCostCheckTime:(BOOL)a3 personal:(BOOL)a4;
@end

@implementation NRBabelNeighbor

- (void)enqueueNextIHU
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = self->_pendingOutgoingPackets;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  -[NSMutableArray removeObjectsInArray:](self->_pendingOutgoingPackets, "removeObjectsInArray:", v3);
  v10 = -[NRBabelPendingOutgoingTLVs initWithInterval:]( objc_alloc(&OBJC_CLASS___NRBabelPendingOutgoingTLVs),  "initWithInterval:",  self->_outgoingIHUInterval);
  -[NRBabelPendingOutgoingTLVs setRepresentsIHU:](v10, "setRepresentsIHU:", 1LL);
  -[NSMutableArray addObject:](self->_pendingOutgoingPackets, "addObject:", v10);
}

- (void)enqueueNextUpdate
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = self->_pendingOutgoingPackets;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  -[NSMutableArray removeObjectsInArray:](self->_pendingOutgoingPackets, "removeObjectsInArray:", v3);
  v10 = -[NRBabelPendingOutgoingTLVs initWithInterval:]( objc_alloc(&OBJC_CLASS___NRBabelPendingOutgoingTLVs),  "initWithInterval:",  self->_outgoingUpdateInterval);
  -[NRBabelPendingOutgoingTLVs setRepresentsUpdate:](v10, "setRepresentsUpdate:", 1LL);
  -[NSMutableArray addObject:](self->_pendingOutgoingPackets, "addObject:", v10);
}

- (id)createIHUTLV
{
  unsigned int v2 = bswap32(self->_rxcost);
  unsigned int v3 = bswap32(self->_outgoingIHUInterval);
  int v5 = 1541;
  __int16 v6 = HIWORD(v2);
  __int16 v7 = HIWORD(v3);
  return -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v5, 8LL);
}

- (id)createPersonalHelloTLV
{
  int v2 = self->_outgoingPersonalHelloSeqno + 1;
  self->_outgoingPersonalHelloSeqno = v2;
  unsigned int v3 = bswap32(self->_outgoingIHUInterval);
  int v5 = 8390148;
  __int16 v6 = bswap32(v2) >> 16;
  __int16 v7 = HIWORD(v3);
  return -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v5, 8LL);
}

- (void)processPendingOutgoingPackets
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 instance]);

  if (!v4) {
    goto LABEL_107;
  }
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v6 = v5;
  __int16 v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  v92 = self;
  v8 = self->_pendingOutgoingPackets;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v109,  v118,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v110;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v110 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v109 + 1) + 8LL * (void)i);
        [v13 minTime];
        if (v14 <= v6) {
          -[NSMutableArray addObject:](v7, "addObject:", v13);
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v109,  v118,  16LL);
    }

    while (v10);
  }

  p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
  if (!-[NSMutableArray count](v7, "count"))
  {
    v28 = v92;
    if (-[NSMutableArray count](v92->_pendingOutgoingPackets, "count"))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC8A8, 2LL))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        pendingOutgoingPackets = v92->_pendingOutgoingPackets;
        id v30 = (id)qword_1001DC8A8;
        _NRLogWithArgs( v30,  2LL,  "%s%.30s:%-4d not sending anything to %@ (%u not ready yet)",  ",  "-[NRBabelNeighbor processPendingOutgoingPackets]",  1429LL,  v92,  -[NSMutableArray count](pendingOutgoingPackets, "count""));
      }

      v88 = v7;
      v90 = v4;
      __int128 v103 = 0u;
      __int128 v104 = 0u;
      __int128 v101 = 0u;
      __int128 v102 = 0u;
      v31 = v92->_pendingOutgoingPackets;
      id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v101,  v116,  16LL);
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v102;
        do
        {
          for (j = 0LL; j != v33; j = (char *)j + 1)
          {
            if (*(void *)v102 != v34) {
              objc_enumerationMutation(v31);
            }
            v44 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)j);
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            if (_NRLogIsLevelEnabled(p_class_meths[277], 2LL))
            {
              if (qword_1001DC8B0 != -1) {
                dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
              }
              v36 = p_class_meths[277];
              [v44 minTime];
              double v38 = v37 - v6;
              [v44 maxTime];
              double v40 = v39 - v6;
              v41 = p_class_meths;
              [v44 minTime];
              v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
              [v44 maxTime];
              v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
              _NRLogWithArgs( v36,  2LL,  "%s%.30s:%-4d in pipeline: in min %fs max %fs, minTime %@, maxTime %@",  ",  "-[NRBabelNeighbor processPendingOutgoingPackets]"",  1433LL,  *(void *)&v38,  *(void *)&v40,  v42,  v43);

              p_class_meths = v41;
            }
          }

          id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v101,  v116,  16LL);
        }

        while (v33);
      }

      __int16 v7 = v88;
      v4 = v90;
      v28 = v92;
    }

    else
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC8A8, 2LL))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        _NRLogWithArgs( qword_1001DC8A8,  2LL,  "%s%.30s:%-4d not sending anything to %@ (nothing in queue)",  ",  "-[NRBabelNeighbor processPendingOutgoingPackets]"",  1436LL,  v92);
      }
    }

    goto LABEL_71;
  }

  v89 = v4;
  v91 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  v87 = v7;
  v16 = v7;
  id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v105,  v117,  16LL);
  if (v17)
  {
    id v18 = v17;
    char v19 = 0;
    char v20 = 0;
    uint64_t v21 = *(void *)v106;
    do
    {
      for (k = 0LL; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v106 != v21) {
          objc_enumerationMutation(v16);
        }
        v23 = *(void **)(*((void *)&v105 + 1) + 8LL * (void)k);
        unsigned __int8 v24 = [v23 representsIHU];
        unsigned __int8 v25 = [v23 representsUpdate];
        v26 = (void *)objc_claimAutoreleasedReturnValue([v23 tlvs]);

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue([v23 tlvs]);
          -[NSMutableArray addObjectsFromArray:](v91, "addObjectsFromArray:", v27);
        }

        v20 |= v24;
        v19 |= v25;
        -[NSMutableArray removeObject:](v92->_pendingOutgoingPackets, "removeObject:", v23);
      }

      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v105,  v117,  16LL);
    }

    while (v18);
  }

  else
  {
    char v19 = 0;
    char v20 = 0;
  }

  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  __int16 v7 = v87;
  v4 = v89;
  p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
  v28 = v92;
  if (!_NRLogIsLevelEnabled(qword_1001DC8A8, 2LL))
  {
    if ((v20 & 1) == 0) {
      goto LABEL_46;
    }
LABEL_62:
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor createIHUTLV](v28, "createIHUTLV"));
    -[NSMutableArray addObject:](v91, "addObject:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor createPersonalHelloTLV](v28, "createPersonalHelloTLV"));
    -[NSMutableArray addObject:](v91, "addObject:", v50);

    if ((v19 & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }

  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if ((v20 & 1) != 0) {
    v46 = "IHU+";
  }
  else {
    v46 = "";
  }
  if ((v19 & 1) != 0) {
    v47 = "Update+";
  }
  else {
    v47 = "";
  }
  id v48 = (id)qword_1001DC8A8;
  v86 = v47;
  v28 = v92;
  _NRLogWithArgs( v48,  2LL,  "%s%.30s:%-4d sending %s%s%u to %@",  ",  "-[NRBabelNeighbor processPendingOutgoingPackets]",  1410LL,  v46,  v86,  -[NSMutableArray count](v91, "count""),  v92);

  if ((v20 & 1) != 0) {
    goto LABEL_62;
  }
LABEL_46:
  if ((v19 & 1) != 0)
  {
LABEL_47:
    v45 = (void *)objc_claimAutoreleasedReturnValue([v89 createUpdateTLVsWithInterval:v28->_outgoingUpdateInterval]);
    -[NSMutableArray addObjectsFromArray:](v91, "addObjectsFromArray:", v45);
  }

- (void)dealloc
{
  incomingPublicHelloTimer = self->_incomingPublicHelloTimer;
  if (incomingPublicHelloTimer)
  {
    dispatch_source_cancel((dispatch_source_t)incomingPublicHelloTimer);
    v4 = self->_incomingPublicHelloTimer;
    self->_incomingPublicHelloTimer = 0LL;
  }

  incomingPersonalHelloTimer = self->_incomingPersonalHelloTimer;
  if (incomingPersonalHelloTimer)
  {
    dispatch_source_cancel((dispatch_source_t)incomingPersonalHelloTimer);
    double v6 = self->_incomingPersonalHelloTimer;
    self->_incomingPersonalHelloTimer = 0LL;
  }

  incomingIHUTimer = self->_incomingIHUTimer;
  if (incomingIHUTimer)
  {
    dispatch_source_cancel((dispatch_source_t)incomingIHUTimer);
    v8 = self->_incomingIHUTimer;
    self->_incomingIHUTimer = 0LL;
  }

  pendingOutgoingTimer = self->_pendingOutgoingTimer;
  if (pendingOutgoingTimer)
  {
    dispatch_source_cancel((dispatch_source_t)pendingOutgoingTimer);
    id v10 = self->_pendingOutgoingTimer;
    self->_pendingOutgoingTimer = 0LL;
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NRBabelNeighbor;
  -[NRBabelNeighbor dealloc](&v11, "dealloc");
}

- (void)scheduleTLV:(id)a3 interval:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v8 = -[NRBabelPendingOutgoingTLVs initWithInterval:]( objc_alloc(&OBJC_CLASS___NRBabelPendingOutgoingTLVs),  "initWithInterval:",  v4);
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelPendingOutgoingTLVs tlvs](v8, "tlvs"));
  [v7 addObject:v6];

  -[NSMutableArray addObject:](self->_pendingOutgoingPackets, "addObject:", v8);
  -[NRBabelNeighbor processPendingOutgoingPackets](self, "processPendingOutgoingPackets");
}

- (void)resetIncomingHelloTimer:(BOOL)a3 personal:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v5 = 22LL;
  if (a4) {
    uint64_t v5 = 26LL;
  }
  uint64_t v6 = 10LL;
  if (a4) {
    uint64_t v6 = 7LL;
  }
  unsigned int v7 = *(unsigned __int16 *)((char *)&self->super.isa + v5);
  source = (&self->super.isa)[v6];
  uint64_t v8 = 12500000LL * v7;
  if (v7 <= 0x64) {
    uint64_t v8 = 17500000LL * v7;
  }
  if (v4) {
    int64_t v9 = v8;
  }
  else {
    int64_t v9 = 10000000LL * v7;
  }
  dispatch_time_t v10 = dispatch_time(0x8000000000000000LL, v9);
  dispatch_source_set_timer((dispatch_source_t)source, v10, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (void)resetIncomingIHUTimerInterval:(unsigned __int16)a3
{
  incomingIHUTimer = self->_incomingIHUTimer;
  dispatch_time_t v4 = dispatch_time(0x8000000000000000LL, 35000000LL * a3);
  dispatch_source_set_timer((dispatch_source_t)incomingIHUTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (void)updateRXCostCheckTime:(BOOL)a3 personal:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_incomingPublicHelloHistory = &self->_incomingPublicHelloHistory;
  int8x16_t v8 = (int8x16_t)vld1q_dup_f64((const double *)p_incomingPublicHelloHistory);
  int8x16_t v9 = (int8x16_t)xmmword_100156970;
  int8x16_t v10 = (int8x16_t)xmmword_100156980;
  int8x16_t v11 = (int8x16_t)xmmword_100156990;
  int8x16_t v12 = (int8x16_t)xmmword_1001569A0;
  int8x16_t v13 = (int8x16_t)xmmword_1001569B0;
  int8x16_t v14 = (int8x16_t)xmmword_1001569C0;
  int8x16_t v15 = (int8x16_t)xmmword_1001569D0;
  int8x16_t v16 = (int8x16_t)xmmword_1001569E0;
  int8x16_t v17 = (int8x16_t)vuzp1q_s16( (int16x8_t)vuzp1q_s32( (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_100156970)),  (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_100156980))),  (int16x8_t)vuzp1q_s32( (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_100156990)),  (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1001569A0))));
  int8x16_t v18 = (int8x16_t)xmmword_1001569F0;
  int8x16_t v19 = vandq_s8( vcltzq_s8( vshlq_n_s8( vuzp1q_s8( v17,  (int8x16_t)vuzp1q_s16( (int16x8_t)vuzp1q_s32( (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1001569B0)),  (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1001569C0))),  (int16x8_t)vuzp1q_s32( (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1001569D0)),  (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v8, (int8x16_t)xmmword_1001569E0))))),  7uLL)),  (int8x16_t)xmmword_1001569F0);
  v17.i8[0] = vaddv_s8(*(int8x8_t *)v19.i8);
  v19.i64[0] = vextq_s8(v19, v19, 8uLL).u64[0];
  v19.i8[0] = vaddv_s8(*(int8x8_t *)v19.i8);
  v19.i32[0] = (unsigned __int16)(v17.i16[0] | (v19.i16[0] << 8));
  *(int8x8_t *)v19.i8 = vcnt_s8(*(int8x8_t *)v19.i8);
  v19.i16[0] = vaddlv_u8(*(uint8x8_t *)v19.i8);
  unsigned int v20 = v19.i32[0];
  if (a3)
  {
    unsigned int lastIncomingPublicHelloInterval = self->_lastIncomingPublicHelloInterval;
    double lastIncomingPublicHelloTime = self->_lastIncomingPublicHelloTime;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    int8x16_t v18 = (int8x16_t)xmmword_1001569F0;
    int8x16_t v16 = (int8x16_t)xmmword_1001569E0;
    int8x16_t v15 = (int8x16_t)xmmword_1001569D0;
    int8x16_t v14 = (int8x16_t)xmmword_1001569C0;
    int8x16_t v13 = (int8x16_t)xmmword_1001569B0;
    int8x16_t v12 = (int8x16_t)xmmword_1001569A0;
    int8x16_t v11 = (int8x16_t)xmmword_100156990;
    int8x16_t v10 = (int8x16_t)xmmword_100156980;
    int8x16_t v9 = (int8x16_t)xmmword_100156970;
    v20 += ((v23 - lastIncomingPublicHelloTime) * 100.0) / lastIncomingPublicHelloInterval;
  }

  p_incomingPersonalHelloHistory = &self->_incomingPersonalHelloHistory;
  int8x16_t v25 = (int8x16_t)vld1q_dup_f64((const double *)p_incomingPersonalHelloHistory);
  int8x16_t v26 = (int8x16_t)vuzp1q_s16( (int16x8_t)vuzp1q_s32( (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v9)),  (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v10))),  (int16x8_t)vuzp1q_s32( (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v11)),  (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v12))));
  int8x16_t v27 = vandq_s8( vcltzq_s8( vshlq_n_s8( vuzp1q_s8( v26,  (int8x16_t)vuzp1q_s16( (int16x8_t)vuzp1q_s32( (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v13)),  (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v14))),  (int16x8_t)vuzp1q_s32( (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v15)),  (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v25, v16))))),  7uLL)),  v18);
  v26.i8[0] = vaddv_s8(*(int8x8_t *)v27.i8);
  v27.i64[0] = vextq_s8(v27, v27, 8uLL).u64[0];
  v27.i8[0] = vaddv_s8(*(int8x8_t *)v27.i8);
  v27.i32[0] = (unsigned __int16)(v26.i16[0] | (v27.i16[0] << 8));
  *(int8x8_t *)v27.i8 = vcnt_s8(*(int8x8_t *)v27.i8);
  v27.i16[0] = vaddlv_u8(*(uint8x8_t *)v27.i8);
  unsigned int v28 = v27.i32[0];
  if (v5)
  {
    unsigned int lastIncomingPersonalHelloInterval = self->_lastIncomingPersonalHelloInterval;
    double lastIncomingPersonalHelloTime = self->_lastIncomingPersonalHelloTime;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    v28 += ((v31 - lastIncomingPersonalHelloTime) * 100.0) / lastIncomingPersonalHelloInterval;
  }

  if (v20 >= v28) {
    unsigned int v32 = v28;
  }
  else {
    unsigned int v32 = v20;
  }
  uint64_t rxcost = self->_rxcost;
  if (v32 <= 0xF) {
    unsigned int v34 = 0x1000 / (16 - (unsigned __int16)v32);
  }
  else {
    unsigned int v34 = 0xFFFF;
  }
  self->_uint64_t rxcost = v34;
  if (v34 != (_DWORD)rxcost)
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      v35 = "hello";
      if (v5) {
        v35 = "timeout";
      }
      _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d changing rxcost for %@ from %u to %u in response to %s",  ",  "-[NRBabelNeighbor updateRXCostCheckTime:personal:]"",  1562LL,  self,  rxcost,  self->_rxcost,  v35);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
    double v37 = (void *)objc_claimAutoreleasedReturnValue([v36 instance]);
    [v37 updateRoutes];
  }

  -[NRBabelNeighbor resetIncomingHelloTimer:personal:](self, "resetIncomingHelloTimer:personal:", !v5, v4);
}

- (void)handleHelloWithSeqno:(unsigned __int16)a3 interval:(unsigned __int16)a4 personal:(BOOL)a5
{
  BOOL v5 = a5;
  int v7 = a3 | 0x10000;
  if (a5)
  {
    unsigned int lastIncomingPersonalHelloSeqno = self->_lastIncomingPersonalHelloSeqno;
    if (lastIncomingPersonalHelloSeqno < a3) {
      int v7 = a3;
    }
    int v9 = v7 - lastIncomingPersonalHelloSeqno;
    if (v9 < 1) {
      v9 += 0x10000;
    }
    if (v9 <= 16) {
      unint64_t v10 = (self->_incomingPersonalHelloHistory << v9) | 1;
    }
    else {
      unint64_t v10 = 0xFFFFLL;
    }
    self->_incomingPersonalHelloHistory = v10;
    self->_unsigned int lastIncomingPersonalHelloSeqno = a3;
    if (a4)
    {
      uint64_t v14 = 9LL;
      uint64_t v15 = 26LL;
LABEL_20:
      *(_WORD *)((char *)&self->super.isa + v15) = a4;
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      (&self->super.isa)[v14] = v16;
      -[NRBabelNeighbor updateRXCostCheckTime:personal:](self, "updateRXCostCheckTime:personal:", 0LL, v5);
    }
  }

  else
  {
    unsigned int lastIncomingPublicHelloSeqno = self->_lastIncomingPublicHelloSeqno;
    if (lastIncomingPublicHelloSeqno < a3) {
      int v7 = a3;
    }
    int v12 = v7 - lastIncomingPublicHelloSeqno;
    if (v12 < 1) {
      v12 += 0x10000;
    }
    if (v12 <= 16) {
      unint64_t v13 = (self->_incomingPublicHelloHistory << v12) | 1;
    }
    else {
      unint64_t v13 = 0xFFFFLL;
    }
    self->_incomingPublicHelloHistory = v13;
    self->_unsigned int lastIncomingPublicHelloSeqno = a3;
    if (a4)
    {
      uint64_t v14 = 6LL;
      uint64_t v15 = 22LL;
      goto LABEL_20;
    }
  }

- (NRBabelNeighbor)initWithAddress:(const in6_addr *)p_class_meths babelInterface:(id)a4
{
  id v4 = a4;
  id v7 = a4;
  int8x16_t v8 = (char *)objc_claimAutoreleasedReturnValue([v7 instance]);
  if (v8)
  {
    v57.receiver = self;
    v57.super_class = (Class)&OBJC_CLASS___NRBabelNeighbor;
    int v9 = -[NRBabelNeighbor init](&v57, "init");
    if (v9)
    {
      self = v9;
      v9->_address = *p_class_meths;
      objc_storeStrong((id *)&v9->_babelInterface, v4);
      if (![v7 dtlsEnabled])
      {
LABEL_17:
        self->_outgoingPersonalHelloSeqno = arc4random_uniform(0x10000u);
        self->_incomingPublicHelloHistory = 0xFFFFLL;
        self->_incomingPersonalHelloHistory = 0xFFFFLL;
        *(void *)&self->_outgoingIHUInterval = -4059036496LL;
        uint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 queue]);
        v22 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v21);
        incomingPublicHelloTimer = self->_incomingPublicHelloTimer;
        self->_incomingPublicHelloTimer = v22;

        unsigned __int8 v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 queue]);
        int8x16_t v25 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v24);
        incomingPersonalHelloTimer = self->_incomingPersonalHelloTimer;
        self->_incomingPersonalHelloTimer = v25;

        int8x16_t v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 queue]);
        unsigned int v28 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v27);
        incomingIHUTimer = self->_incomingIHUTimer;
        self->_incomingIHUTimer = v28;

        id v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 queue]);
        double v31 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v30);
        pendingOutgoingTimer = self->_pendingOutgoingTimer;
        self->_pendingOutgoingTimer = v31;

        id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        pendingOutgoingPackets = self->_pendingOutgoingPackets;
        self->_pendingOutgoingPackets = v33;

        v35 = objc_alloc_init(&OBJC_CLASS___NRBabelPendingOutgoingTLVs);
        -[NRBabelPendingOutgoingTLVs setRepresentsIHU:](v35, "setRepresentsIHU:", 1LL);
        -[NRBabelPendingOutgoingTLVs setRepresentsUpdate:](v35, "setRepresentsUpdate:", 1LL);
        -[NSMutableArray addObject:](self->_pendingOutgoingPackets, "addObject:", v35);
        -[NRBabelNeighbor processPendingOutgoingPackets](self, "processPendingOutgoingPackets");
        objc_initWeak(&location, self);
        v36 = self->_pendingOutgoingTimer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_1000B653C;
        handler[3] = &unk_1001AFED0;
        objc_copyWeak(&v55, &location);
        dispatch_source_set_event_handler((dispatch_source_t)v36, handler);
        dispatch_activate((dispatch_object_t)self->_pendingOutgoingTimer);
        double v37 = self->_incomingPublicHelloTimer;
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472LL;
        v52[2] = sub_1000B656C;
        v52[3] = &unk_1001AFED0;
        objc_copyWeak(&v53, &location);
        dispatch_source_set_event_handler((dispatch_source_t)v37, v52);
        dispatch_activate((dispatch_object_t)self->_incomingPublicHelloTimer);
        double v38 = self->_incomingPersonalHelloTimer;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_1000B65A4;
        v50[3] = &unk_1001AFED0;
        objc_copyWeak(&v51, &location);
        dispatch_source_set_event_handler((dispatch_source_t)v38, v50);
        dispatch_activate((dispatch_object_t)self->_incomingPersonalHelloTimer);
        double v39 = self->_incomingIHUTimer;
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_1000B65DC;
        v48[3] = &unk_1001AFED0;
        objc_copyWeak(&v49, &location);
        dispatch_source_set_event_handler((dispatch_source_t)v39, v48);
        dispatch_activate((dispatch_object_t)self->_incomingIHUTimer);
        self = self;
        objc_destroyWeak(&v49);
        objc_destroyWeak(&v51);
        objc_destroyWeak(&v53);
        objc_destroyWeak(&v55);
        objc_destroyWeak(&location);

        uint64_t v14 = self;
        goto LABEL_18;
      }

      -[NRBabelNeighbor setDtlsEnabled:](self, "setDtlsEnabled:", 1LL);
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
      unint64_t v10 = (unint64_t *)[v4 localAddress];
      unint64_t v11 = bswap64(*(void *)p_class_meths->__u6_addr8);
      unint64_t v12 = bswap64(*v10);
      if (v11 == v12 && (unint64_t v11 = bswap64(*(void *)&p_class_meths->__u6_addr32[2]), v12 = bswap64(v10[1]), v11 == v12))
      {
        int v13 = 0;
      }

      else if (v11 < v12)
      {
        int v13 = -1;
      }

      else
      {
        int v13 = 1;
      }

      char v15 = v13 > 0;
      int8x16_t v16 = objc_alloc(&OBJC_CLASS___NRDDTLSStack);
      int8x16_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 queue]);
      int8x16_t v18 = sub_10011FDB8((id *)&v16->super.isa, v17, v15, self);
      -[NRBabelNeighbor setDtlsStack:](self, "setDtlsStack:", v18);

      p_class_meths = (const in6_addr *)&OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
      if (qword_1001DC8B0 == -1)
      {
LABEL_12:
        if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
        {
          if (*(void *)p_class_meths[139].__u6_addr8 != -1LL) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          id v19 = (id)qword_1001DC8A8;
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor dtlsStack](self, "dtlsStack"));
          _NRLogWithArgs( v19,  1LL,  "%s%.30s:%-4d %@ started %@",  ",  "-[NRBabelNeighbor initWithAddress:babelInterface:]"",  1636LL,  self,  v20);
        }

        goto LABEL_17;
      }
    }

    else
    {
      id v41 = sub_1000B07C8();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v41, 16LL);

      if (IsLevelEnabled)
      {
        id v43 = sub_1000B07C8();
        _NRLogWithArgs( v43,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRBabelNeighbor initWithAddress:babelInterface:]"",  1626);
      }

      id v7 = (id)_os_log_pack_size(12LL);
      int8x16_t v8 = (char *)&v48[-1] - ((__chkstk_darwin(v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      v44 = __error();
      uint64_t v45 = _os_log_pack_fill(v8, v7, *v44, &_mh_execute_header, "%{public}s [super init] failed");
      *(_DWORD *)uint64_t v45 = 136446210;
      *(void *)(v45 + 4) = "-[NRBabelNeighbor initWithAddress:babelInterface:]";
      id v46 = sub_1000B07C8();
      _NRLogAbortWithPack(v46, v8);
    }

    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    goto LABEL_12;
  }

  uint64_t v14 = 0LL;
LABEL_18:

  return v14;
}

- (BOOL)matchesAddress:(const in6_addr *)a3
{
  return *(void *)self->_address.__u6_addr8 == *(void *)a3->__u6_addr8
      && *(void *)&self->_address.__u6_addr32[2] == *(void *)&a3->__u6_addr32[2];
}

- (BOOL)matchesAddress:(const in6_addr *)a3 babelInterface:(id)a4
{
  unsigned int v6 = -[NRBabelInterface isEqual:](self->_babelInterface, "isEqual:", a4);
  if (v6) {
    LOBYTE(v6) = -[NRBabelNeighbor matchesAddress:](self, "matchesAddress:", a3);
  }
  return v6;
}

- (NSString)description
{
  unsigned int v3 = objc_alloc(&OBJC_CLASS___NSString);
  IPv6AddrString = (void *)createIPv6AddrString(&self->_address, v4);
  babelInterface = self->_babelInterface;
  unsigned int v7 = -[NRBabelNeighbor dtlsEnabled](self, "dtlsEnabled");
  int8x16_t v8 = "";
  if (v7) {
    int8x16_t v8 = "_DTLS";
  }
  int v9 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@[%@]%s", IPv6AddrString, babelInterface, v8);

  return v9;
}

- (id)descriptionWithNextHop:(const in6_addr *)a3
{
  unsigned __int8 v5 = -[NRBabelNeighbor matchesAddress:](self, "matchesAddress:");
  unsigned int v7 = objc_alloc(&OBJC_CLASS___NSString);
  if ((v5 & 1) != 0)
  {
    IPv6AddrString = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor description](self, "description"));
    int v9 = -[NSString initWithString:](v7, "initWithString:", IPv6AddrString);
  }

  else
  {
    IPv6AddrString = (void *)createIPv6AddrString(a3, v6);
    int v9 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@(nh %@)", self, IPv6AddrString);
  }

  unint64_t v10 = v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NRBabelNeighbor);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    unsigned __int8 v6 = [v4 matchesAddress:&self->_address babelInterface:self->_babelInterface];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unsigned)metric
{
  unsigned int txcost = self->_txcost;
  unsigned __int16 v3 = -1;
  if (txcost != 0xFFFF)
  {
    if (txcost <= 0x100) {
      int v4 = 256;
    }
    else {
      int v4 = self->_txcost;
    }
    unsigned int v5 = self->_rxcost * v4;
    if (v5 > 0xFFFEFF) {
      return -1;
    }
    else {
      return v5 >> 8;
    }
  }

  return v3;
}

- (void)sendFullPacket:(iovec *)a3 iovLen:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!-[NRBabelNeighbor dtlsEnabled](self, "dtlsEnabled"))
  {
    int v13 = (NSMutableData *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
    -[NSMutableData sendPacket:iovLen:toAddr:](v13, "sendPacket:iovLen:toAddr:", a3, v4, &self->_address);
LABEL_16:

    return;
  }

  if (-[NRBabelNeighbor dtlsReady](self, "dtlsReady"))
  {
    unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    if ((_DWORD)v4)
    {
      uint64_t v4 = v4;
      p_iov_len = &a3->iov_len;
      do
      {
        -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", *(p_iov_len - 1), *p_iov_len);
        p_iov_len += 2;
        --v4;
      }

      while (v4);
    }

    int v9 = (id *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor dtlsStack](self, "dtlsStack"));
    int v13 = v7;
    if (v9)
    {
      if (qword_1001DCB48 != -1) {
        dispatch_once(&qword_1001DCB48, &stru_1001B0518);
      }
      if (_NRLogIsLevelEnabled(qword_1001DCB40, 1LL))
      {
        if (qword_1001DCB48 != -1) {
          dispatch_once(&qword_1001DCB48, &stru_1001B0518);
        }
        id v10 = (id)qword_1001DCB40;
        _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d %@ writing %llu outbound unencrypted bytes into DTLS",  ",  "-[NRDDTLSStack processOutboundUnencryptedData:]",  108LL,  v9,  -[NSMutableData length](v13, "length""));
      }

      unint64_t v11 = (nw_connection *)v9[4];
      unint64_t v12 = (dispatch_data_s *)-[NSMutableData _createDispatchData](v13, "_createDispatchData");
      completion[0] = _NSConcreteStackBlock;
      completion[1] = 3221225472LL;
      completion[2] = sub_10011E988;
      completion[3] = &unk_1001B03B8;
      completion[4] = v9;
      nw_connection_send(v11, v12, _nw_content_context_default_message, 0, completion);
    }

    goto LABEL_16;
  }

  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d %@ dropping bytes because DTLS not ready",  ",  "-[NRBabelNeighbor sendFullPacket:iovLen:]"",  1780LL,  self);
  }

- (void)sendTLVs:(id)a3
{
  id v5 = a3;
  if (![v5 count]) {
    goto LABEL_35;
  }
  unsigned int v6 = [v5 count];
  uint64_t v7 = v6 + 1;
  if (v6 == -1)
  {
    id v34 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v34, 16LL);

    if (IsLevelEnabled)
    {
      id v36 = sub_1000B07C8();
      _NRLogWithArgs(v36, 16LL, "%s%.30s:%-4d ABORTING: strict_calloc called with count 0", ", "strict_calloc"", 96);
    }

    p_class_meths = (__objc2_meth_list **)_os_log_pack_size(12LL);
    double v37 = (char *)&v46 - ((__chkstk_darwin(p_class_meths) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    double v38 = __error();
    uint64_t v39 = _os_log_pack_fill( v37,  p_class_meths,  *v38,  &_mh_execute_header,  "%{public}s strict_calloc called with count 0");
    *(_DWORD *)uint64_t v39 = 136446210;
    *(void *)(v39 + 4) = "strict_calloc";
LABEL_42:
    id v45 = sub_1000B07C8();
    _NRLogAbortWithPack(v45, v37);
LABEL_43:
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
LABEL_20:
    uint64_t v7 = v47;
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (p_class_meths[278] != (__objc2_meth_list *)-1LL) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "varying sizes of mystery", v46);
    }

    goto LABEL_25;
  }

  int8x16_t v8 = calloc(v6 + 1, 0x10uLL);
  if (!v8)
  {
    id v40 = sub_1000B07C8();
    int v41 = _NRLogIsLevelEnabled(v40, 16LL);

    if (v41)
    {
      id v42 = sub_1000B07C8();
      _NRLogWithArgs( v42,  16LL,  "%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed",  ",  "strict_calloc"",  108,  v7,  0x10uLL);
    }

    p_class_meths = (__objc2_meth_list **)_os_log_pack_size(32LL);
    double v37 = (char *)&v46 - ((__chkstk_darwin(p_class_meths) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    id v43 = __error();
    uint64_t v44 = _os_log_pack_fill( v37,  p_class_meths,  *v43,  &_mh_execute_header,  "%{public}s strict_calloc(%zu, %zu) failed");
    *(_DWORD *)uint64_t v44 = 136446722;
    *(void *)(v44 + 4) = "strict_calloc";
    *(_WORD *)(v44 + 12) = 2048;
    *(void *)(v44 + 14) = v7;
    *(_WORD *)(v44 + 22) = 2048;
    *(void *)(v44 + 24) = 16LL;
    goto LABEL_42;
  }

  int v62 = 554;
  void *v8 = &v62;
  v8[1] = 4LL;
  id v49 = self;
  int v9 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  unsigned int v11 = [v10 mtu];

  unint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v50 = v5;
  id v52 = v5;
  id v13 = [v52 countByEnumeratingWithState:&v58 objects:v64 count:16];
  id v51 = v12;
  id v48 = v9;
  if (v13)
  {
    id v14 = v13;
    unsigned int v3 = 0;
    unsigned int v53 = v11 - 4;
    uint64_t v15 = *(void *)v59;
    int8x16_t v16 = v9 + 1;
    unsigned int v17 = 1;
    uint64_t v47 = v7;
LABEL_6:
    int8x16_t v18 = 0LL;
    uint64_t v46 = v17;
    else {
      id v19 = 0LL;
    }
    unsigned int v20 = &v16[2 * v17];
    while (1)
    {
      if (*(void *)v59 != v15) {
        objc_enumerationMutation(v52);
      }
      if (v19 == v18) {
        break;
      }
      id v21 = *(id *)(*((void *)&v58 + 1) + 8LL * (void)v18);
      unsigned int v22 = [v21 length];
      unsigned int v23 = v3 + v22;
      if ((unsigned __int16)(v3 + v22) > (unsigned __int16)v53)
      {
        -[NSMutableArray addObject:](v51, "addObject:", v21);
      }

      else
      {
        *(v20 - 1) = [v21 bytes];
        *unsigned int v20 = [v21 length];
        unsigned int v3 = v23;
      }

      int8x16_t v18 = (char *)v18 + 1;
      v20 += 2;
      if (v14 == v18)
      {
        unsigned int v17 = v46 + (_DWORD)v18;
        id v14 = [v52 countByEnumeratingWithState:&v58 objects:v64 count:16];
        uint64_t v7 = v47;
        if (v14) {
          goto LABEL_6;
        }
        goto LABEL_25;
      }
    }

    p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
    if (qword_1001DC8B0 != -1) {
      goto LABEL_43;
    }
    goto LABEL_20;
  }

  unsigned int v3 = 0;
LABEL_25:
  id v25 = v52;

  HIWORD(v62) = bswap32(v3) >> 16;
  int8x16_t v26 = v48;
  int8x16_t v27 = v49;
  -[NRBabelNeighbor sendFullPacket:iovLen:](v49, "sendFullPacket:iovLen:", v48, v7);
  free(v26);
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v28 = v25;
  id v29 = [v28 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v55 != v31) {
          objc_enumerationMutation(v28);
        }
      }

      id v30 = [v28 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }

    while (v30);
  }

  id v33 = v51;
  if (-[NSMutableArray count](v51, "count")) {
    -[NRBabelNeighbor sendTLVs:](v27, "sendTLVs:", v33);
  }

  id v5 = v50;
LABEL_35:
}

- (void)handleIsReady:(id)a3
{
  id v6 = a3;
  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d %@ DTLS %@ is ready",  ",  "-[NRBabelNeighbor handleIsReady:]"",  1847LL,  self,  v6);
  }

  -[NRBabelNeighbor setDtlsReady:](self, "setDtlsReady:", 1LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 instance]);
  [v5 sendImmediateRouteUpdateToNeighbor:self];
}

- (void)handleDTLSStack:(id)a3 outboundEncryptedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    id v8 = (id)qword_1001DC8A8;
    _NRLogWithArgs( v8,  1,  "%s%.30s:%-4d %@ passing %llu outbound encrypted bytes to interface",  ",  "-[NRBabelNeighbor handleDTLSStack:outboundEncryptedData:]",  1855,  self,  [v7 length]);
  }

  v10[0] = [v7 bytes];
  v10[1] = [v7 length];
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  [v9 sendPacket:v10 iovLen:1 toAddr:&self->_address];
}

- (void)handleDTLSStack:(id)a3 inboundDecryptedData:(id)a4
{
  id v9 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    id v6 = (id)qword_1001DC8A8;
    _NRLogWithArgs( v6,  1,  "%s%.30s:%-4d %@ passing %llu inbound decrypted bytes to instance",  ",  "-[NRBabelNeighbor handleDTLSStack:inboundDecryptedData:]",  1867,  self,  [v9 length]);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelNeighbor babelInterface](self, "babelInterface"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 instance]);
  objc_msgSend( v8,  "handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:",  objc_msgSend(v9, "bytes"),  objc_msgSend(v9, "length"),  &self->_address,  objc_msgSend(v5, "localAddress"),  v5,  1);
}

- (in6_addr)address
{
  uint64_t v2 = *(void *)&self->_address.__u6_addr32[2];
  uint64_t v3 = *(void *)self->_address.__u6_addr8;
  *(void *)&result.__u6_addr32[2] = v2;
  *(void *)result.__u6_addr8 = v3;
  return result;
}

- (void)setAddress:(in6_addr)a3
{
  self->_address = a3;
}

- (NRBabelInterface)babelInterface
{
  return self->_babelInterface;
}

- (void)setBabelInterface:(id)a3
{
}

- (unsigned)outgoingPersonalHelloSeqno
{
  return self->_outgoingPersonalHelloSeqno;
}

- (void)setOutgoingPersonalHelloSeqno:(unsigned __int16)a3
{
  self->_outgoingPersonalHelloSeqno = a3;
}

- (unsigned)outgoingIHUInterval
{
  return self->_outgoingIHUInterval;
}

- (void)setOutgoingIHUInterval:(unsigned __int16)a3
{
  self->_outgoingIHUInterval = a3;
}

- (unsigned)outgoingUpdateInterval
{
  return self->_outgoingUpdateInterval;
}

- (void)setOutgoingUpdateInterval:(unsigned __int16)a3
{
  self->_outgoingUpdateInterval = a3;
}

- (unsigned)txcost
{
  return self->_txcost;
}

- (void)setTxcost:(unsigned __int16)a3
{
  self->_unsigned int txcost = a3;
}

- (unsigned)rxcost
{
  return self->_rxcost;
}

- (void)setRxcost:(unsigned __int16)a3
{
  self->_uint64_t rxcost = a3;
}

- (unint64_t)incomingPublicHelloHistory
{
  return self->_incomingPublicHelloHistory;
}

- (void)setIncomingPublicHelloHistory:(unint64_t)a3
{
  self->_incomingPublicHelloHistory = a3;
}

- (unsigned)lastIncomingPublicHelloSeqno
{
  return self->_lastIncomingPublicHelloSeqno;
}

- (void)setLastIncomingPublicHelloSeqno:(unsigned __int16)a3
{
  self->_unsigned int lastIncomingPublicHelloSeqno = a3;
}

- (double)lastIncomingPublicHelloTime
{
  return self->_lastIncomingPublicHelloTime;
}

- (void)setLastIncomingPublicHelloTime:(double)a3
{
  self->_double lastIncomingPublicHelloTime = a3;
}

- (unsigned)lastIncomingPublicHelloInterval
{
  return self->_lastIncomingPublicHelloInterval;
}

- (void)setLastIncomingPublicHelloInterval:(unsigned __int16)a3
{
  self->_unsigned int lastIncomingPublicHelloInterval = a3;
}

- (OS_dispatch_source)incomingPublicHelloTimer
{
  return self->_incomingPublicHelloTimer;
}

- (void)setIncomingPublicHelloTimer:(id)a3
{
}

- (unint64_t)incomingPersonalHelloHistory
{
  return self->_incomingPersonalHelloHistory;
}

- (void)setIncomingPersonalHelloHistory:(unint64_t)a3
{
  self->_incomingPersonalHelloHistory = a3;
}

- (unsigned)lastIncomingPersonalHelloSeqno
{
  return self->_lastIncomingPersonalHelloSeqno;
}

- (void)setLastIncomingPersonalHelloSeqno:(unsigned __int16)a3
{
  self->_unsigned int lastIncomingPersonalHelloSeqno = a3;
}

- (double)lastIncomingPersonalHelloTime
{
  return self->_lastIncomingPersonalHelloTime;
}

- (void)setLastIncomingPersonalHelloTime:(double)a3
{
  self->_double lastIncomingPersonalHelloTime = a3;
}

- (unsigned)lastIncomingPersonalHelloInterval
{
  return self->_lastIncomingPersonalHelloInterval;
}

- (void)setLastIncomingPersonalHelloInterval:(unsigned __int16)a3
{
  self->_unsigned int lastIncomingPersonalHelloInterval = a3;
}

- (OS_dispatch_source)incomingPersonalHelloTimer
{
  return self->_incomingPersonalHelloTimer;
}

- (void)setIncomingPersonalHelloTimer:(id)a3
{
}

- (unsigned)lastIncomingIHUInterval
{
  return self->_lastIncomingIHUInterval;
}

- (void)setLastIncomingIHUInterval:(unsigned __int16)a3
{
  self->_lastIncomingIHUInterval = a3;
}

- (OS_dispatch_source)incomingIHUTimer
{
  return self->_incomingIHUTimer;
}

- (void)setIncomingIHUTimer:(id)a3
{
}

- (OS_dispatch_source)pendingOutgoingTimer
{
  return self->_pendingOutgoingTimer;
}

- (void)setPendingOutgoingTimer:(id)a3
{
}

- (NSMutableArray)pendingOutgoingPackets
{
  return self->_pendingOutgoingPackets;
}

- (void)setPendingOutgoingPackets:(id)a3
{
}

- (BOOL)dtlsEnabled
{
  return self->_dtlsEnabled;
}

- (void)setDtlsEnabled:(BOOL)a3
{
  self->_dtlsEnabled = a3;
}

- (BOOL)dtlsReady
{
  return self->_dtlsReady;
}

- (void)setDtlsReady:(BOOL)a3
{
  self->_dtlsReady = a3;
}

- (NRDDTLSStack)dtlsStack
{
  return self->_dtlsStack;
}

- (void)setDtlsStack:(id)a3
{
}

- (void).cxx_destruct
{
}

@end