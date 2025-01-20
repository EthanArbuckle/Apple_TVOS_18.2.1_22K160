@interface NWStatsManager
- (BOOL)configured;
- (BOOL)isInvalidated;
- (BOOL)setRcvBufsize:(int)a3;
- (NSMutableArray)queuedPolls;
- (NSMutableDictionary)internalSources;
- (NSMutableSet)interfaceSources;
- (NWStatsManager)initWithQueue:(id)a3;
- (NWStatsManagerDelegate)delegate;
- (NWStatsMonitor)statsMonitor;
- (NWStatsPollHandler)activePoll;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_source)readSource;
- (char)readBuffer;
- (id)getState;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
- (id)stateDictionary;
- (int)_refreshSyncUsingBlock:(id)a3;
- (int)_refreshUsingBlock:(id)a3 completionBlock:(id)a4;
- (int)_setThresholds:(id)a3;
- (int)configure:(id)a3;
- (int)initialConfigure:(id)a3;
- (int)reconfigure:(id)a3;
- (int)refresh:(id)a3;
- (int)refreshSync;
- (int)sockfd;
- (int)statsRefreshCurrentUsage;
- (unint64_t)currentQueryAllReference;
- (unint64_t)querySequenceNumber;
- (unint64_t)readBufferSize;
- (void)_adaptAfterDrop;
- (void)_addAllForProvider:(int)a3 filter:(unint64_t)a4 events:(unint64_t)a5;
- (void)_drainReadBuffer;
- (void)_handleCompletion:(unint64_t)a3;
- (void)_handleCounts:(nstat_msg_src_counts *)a3;
- (void)_handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4;
- (void)_handleReads:(int64_t)a3;
- (void)_handleRemoveForSource:(id)a3;
- (void)_noteInterfaceSrcRef:(unint64_t)a3 forInterface:(unsigned int)a4 threshold:(unint64_t)a5;
- (void)_removeSourceInternal:(unint64_t)a3;
- (void)_restartPoll:(id)a3;
- (void)_sendMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4;
- (void)_sendPoll;
- (void)_sendRemoveSource:(unint64_t)a3;
- (void)_sendUpdateRequestMessage:(unint64_t)a3;
- (void)_setInterfaceTraceFd:(int)a3;
- (void)_setThreshold:(unint64_t)a3 onInterface:(unsigned int)a4;
- (void)_startPoll:(id)a3;
- (void)_startQueuedPoll;
- (void)_trace:(char *)a3;
- (void)_traceMemoryBuf:(char *)a3 length:(int64_t)a4 tag:(char *)a5;
- (void)dealloc;
- (void)dumpState;
- (void)ignoreSource:(unint64_t)a3;
- (void)invalidate;
- (void)setActivePoll:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setConfigured:(BOOL)a3;
- (void)setCurrentQueryAllReference:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInterfaceSources:(id)a3;
- (void)setInternalSources:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setQuerySequenceNumber:(unint64_t)a3;
- (void)setQueuedPolls:(id)a3;
- (void)setReadBuffer:(char *)a3;
- (void)setReadBufferSize:(unint64_t)a3;
- (void)setReadSource:(id)a3;
- (void)setSockfd:(int)a3;
- (void)setStatsMonitor:(id)a3;
@end

@implementation NWStatsManager

- (void)_traceMemoryBuf:(char *)a3 length:(int64_t)a4 tag:(char *)a5
{
  if (self->_interfaceTraceFd >= 1 && self->_iftracebuf)
  {
    gettimeofday(&v11, 0LL);
    snprintf(self->_iftracebuf, 0x1100uLL, "%ld.%06d %s len %zu\n", v11.tv_sec, v11.tv_usec, a5, a4);
    size_t v9 = strlen(self->_iftracebuf) + 1;
    size_t v10 = v9 + a4;
    if ((v9 + a4) >> 8 <= 0x10)
    {
      memcpy(&self->_iftracebuf[v9], a3, a4);
      write(self->_interfaceTraceFd, self->_iftracebuf, v10);
    }
  }

- (void)_trace:(char *)a3
{
  if (a3)
  {
  }

- (void)_sendMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);
  v8 = -[NWStatsManager readSource](self, "readSource");
  if (v8)
  {
    a3->length = a4;
    a3->flags |= 1u;
    if (send(-[NWStatsManager sockfd](self, "sockfd"), a3, a4, 0) != a4)
    {
      if (a3->context) {
        -[NWStatsManager _handleCompletion:](self, "_handleCompletion:");
      }
    }
  }

- (void)_sendUpdateRequestMessage:(unint64_t)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[NWStatsManager isInvalidated](self, "isInvalidated"))
  {
    __int128 v6 = xmmword_188024EF0;
    DWORD2(v6) = 1007;
    unint64_t v7 = a3;
    -[NWStatsManager _sendMessage:length:](self, "_sendMessage:length:", &v6, 24LL);
  }

- (void)_sendRemoveSource:(unint64_t)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6[0] = 0LL;
  v6[1] = 1003LL;
  v6[2] = a3;
  -[NWStatsManager _sendMessage:length:](self, "_sendMessage:length:", v6, 24LL);
}

- (void)_sendPoll
{
  unint64_t currentPollReference = self->_currentPollReference;
  __int128 v3 = xmmword_188024F00;
  LODWORD(v3) = 1007;
  WORD3(v3) = 2;
  -[NWStatsManager _sendMessage:length:](self, "_sendMessage:length:", &currentPollReference, 24LL);
}

- (void)_startPoll:(id)a3
{
  id v6 = a3;
  -[NWStatsManager clientQueue](self, "clientQueue");
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[NWStatsManager activePoll](self, "activePoll");
  if (objc_claimAutoreleasedReturnValue()) {
    -[NWStatsManager _startPoll:].cold.1();
  }
  -[NWStatsManager setActivePoll:](self, "setActivePoll:", v6);
  unint64_t nextPollReference = self->_nextPollReference;
  self->_unint64_t currentPollReference = nextPollReference;
  self->_unint64_t nextPollReference = nextPollReference + 1;
  objc_msgSend(v6, "setNtstatContext:");
  -[NWStatsManager _sendPoll](self, "_sendPoll");
}

- (void)_restartPoll:(id)a3
{
  id v5 = a3;
  -[NWStatsManager clientQueue](self, "clientQueue");
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[NWStatsManager activePoll](self, "activePoll");
  if ((id)objc_claimAutoreleasedReturnValue() != v5) {
    -[NWStatsManager _restartPoll:].cold.1();
  }

  -[NWStatsManager _sendPoll](self, "_sendPoll");
}

- (void)_handleRemoveForSource:(id)a3
{
  id v6 = a3;
  v4 = -[NWStatsManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    [v6 createSnapshot:2 firstOccurrence:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 statsManager:self didReceiveNWSnapshot:v5];
  }
}

- (void)_adaptAfterDrop
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  double v4 = v3;
  if (v3 - self->_currentRcvBufTimestamp > 5.0)
  {
    int currentRcvBufSize = self->_currentRcvBufSize;
    if (currentRcvBufSize < 0x80000)
    {
      if (-[NWStatsManager setRcvBufsize:](self, "setRcvBufsize:", (currentRcvBufSize + 0x10000)))
      {
        ++self->_numAdaptiveRcvBufIncrements;
        NStatGetLog();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = self->_currentRcvBufSize;
          int numAdaptiveRcvBufIncrements = self->_numAdaptiveRcvBufIncrements;
          int v15 = 67109376;
          int v16 = v11;
          __int16 v17 = 1024;
          int v18 = numAdaptiveRcvBufIncrements;
          v8 = "_adaptAfterDrop: updated buffer size to %d, adaptation count %d";
          size_t v9 = v6;
          os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
          uint32_t v13 = 14;
LABEL_11:
          _os_log_impl(&dword_187FF5000, v9, v10, v8, (uint8_t *)&v15, v13);
        }
      }

      else
      {
        NStatGetLog();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          int v14 = self->_currentRcvBufSize;
          int v15 = 67109120;
          int v16 = v14;
          v8 = "_adaptAfterDrop: unable to update buffer size from %d";
          size_t v9 = v6;
          os_log_type_t v10 = OS_LOG_TYPE_ERROR;
          goto LABEL_10;
        }
      }
    }

    else
    {
      NStatGetLog();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = self->_currentRcvBufSize;
        int v15 = 67109120;
        int v16 = v7;
        v8 = "_adaptAfterDrop: skip buffer size update as already at maximum %d";
        size_t v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        uint32_t v13 = 8;
        goto LABEL_11;
      }
    }

    self->_currentRcvBufTimestamp = v4;
  }

- (void)_handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  -[NWStatsManager clientQueue](self, "clientQueue");
  int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  unsigned int type = a3->type;
  switch(type)
  {
    case 0x2711u:
      if ((unint64_t)a4 >= 0x20)
      {
        unsigned int v14 = a3[1].type;
        if (v14 <= 0xA)
        {
          ++self->_providerCounts[v14].numSrcsAdded;
          if (v14 == 6 || self->_eagerInstantiate) {
            -[NWStatsManager _sendUpdateRequestMessage:](self, "_sendUpdateRequestMessage:", a3[1].context);
          }
        }
      }

      return;
    case 0x2712u:
      unint64_t context = a3[1].context;
      int flags = a3->flags;
      -[NWStatsManager internalSources](self, "internalSources");
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithUnsignedLongLong:context];
      int v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 objectForKey:v18];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (flags == 8)
      {
        NStatGetLog();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          int64_t v56 = context;
          __int16 v57 = 2112;
          uint64_t v58 = (uint64_t)v19;
          _os_log_impl( &dword_187FF5000,  v20,  OS_LOG_TYPE_ERROR,  "NSTAT_MSG_TYPE_SRC_REMOVED received reports drop, source ref %lld source %@",  buf,  0x16u);
        }

        -[NWStatsManager _adaptAfterDrop](self, "_adaptAfterDrop");
      }

      if (v19)
      {
        -[NWStatsManager _removeSourceInternal:](self, "_removeSourceInternal:", context);
        if (flags)
        {
          if (flags == 16)
          {
            uint64_t v21 = 70LL;
          }

          else
          {
            if (flags != 8) {
              goto LABEL_73;
            }
            uint64_t v21 = 69LL;
          }
        }

        else
        {
          uint64_t v21 = 68LL;
        }
      }

      else if (flags)
      {
        if (flags == 16)
        {
          uint64_t v21 = 67LL;
        }

        else
        {
          if (flags != 8) {
            goto LABEL_73;
          }
          uint64_t v21 = 66LL;
        }
      }

      else
      {
        uint64_t v21 = 65LL;
      }

      ++(&self->super.isa)[v21];
LABEL_73:

      return;
    case 0x2713u:
    case 0x2715u:
      return;
    case 0x2714u:
      return;
    case 0x2716u:
    case 0x2717u:
      int v9 = a3[9].context;
      if ((v9 & 0xFFFFFFFE) != 2)
      {
        switch(v9)
        {
          case 4:
          case 5:
          case 10:
            NStatGetLog();
            os_log_type_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              goto LABEL_78;
            }
            *(_DWORD *)buf = 134218240;
            int64_t v56 = a4;
            __int16 v57 = 2048;
            uint64_t v58 = 432LL;
            int v11 = "UDP update message with size %ld below minimum %ld\n";
            goto LABEL_76;
          case 6:
            if ((unint64_t)a4 >= 0x190) {
              -[NWStatsManager _noteInterfaceSrcRef:forInterface:threshold:]( self,  "_noteInterfaceSrcRef:forInterface:threshold:",  a3[1].context,  LODWORD(a3[10].context),  *(void *)&a3[9].type);
            }
            return;
          case 8:
            NStatGetLog();
            os_log_type_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              goto LABEL_78;
            }
            *(_DWORD *)buf = 134218240;
            int64_t v56 = a4;
            __int16 v57 = 2048;
            uint64_t v58 = 496LL;
            int v11 = "QUIC update message with size %ld below minimum %ld\n";
            goto LABEL_76;
          case 9:
            NStatGetLog();
            os_log_type_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              goto LABEL_78;
            }
            *(_DWORD *)buf = 134218240;
            int64_t v56 = a4;
            __int16 v57 = 2048;
            uint64_t v58 = 352LL;
            int v11 = "Userland connection update message with size %ld below minimum %ld\n";
            goto LABEL_76;
          default:
            NStatGetLog();
            os_log_type_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              goto LABEL_78;
            }
            *(_DWORD *)buf = 67109120;
            LODWORD(v56) = v9;
            int v11 = "update message for unknown provider %d\n";
            v22 = v10;
            uint32_t v23 = 8;
            goto LABEL_77;
        }
      }

      if ((unint64_t)a4 > 0x1EF)
      {
LABEL_49:
        v24 = -[NWStatsManager delegate](self, "delegate");
        [MEMORY[0x189607968] numberWithUnsignedLongLong:a3[1].context];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[NWStatsManager internalSources](self, "internalSources");
        [v26 objectForKey:v25];
        id v54 = (id)objc_claimAutoreleasedReturnValue();

        providerCounts = self->_providerCounts;
        unsigned __int16 v28 = a3->flags;
        if ((v28 & 4) != 0)
        {
          BOOL v53 = 0;
          p_numUpdatesOnClose = &providerCounts[v9].numUpdatesOnClose;
          uint64_t v31 = 2LL;
          int v29 = 1;
        }

        else if (a3->context == 1)
        {
          BOOL v53 = 0;
          int v29 = 0;
          p_numUpdatesOnClose = &providerCounts[v9].numUpdatesOnOpen;
          uint64_t v31 = 1LL;
        }

        else
        {
          uint64_t p_numUpdatesOnEvent = (uint64_t)&providerCounts[v9].numUpdatesOnEvent;
          uint64_t v33 = *(void *)&a3[1].type;
          p_numUpdatesOnClose = &providerCounts[v9].numUpdatesOnPoll;
          if (v33) {
            p_numUpdatesOnClose = (void *)p_numUpdatesOnEvent;
          }
          BOOL v53 = v33 == 0;
          int v29 = 1;
          if (v33) {
            uint64_t v31 = 4LL;
          }
          else {
            uint64_t v31 = 3LL;
          }
        }

        ++*p_numUpdatesOnClose;
        if (v54)
        {
          if ((v29 & ([v54 removing] ^ 1)) == 1)
          {
            v34 = -[NWStatsManager statsMonitor](self, "statsMonitor");
            if ([v54 updateWithUpdate:a3 length:a4 monitor:v34])
            {

LABEL_67:
              [v54 createSnapshot:v31 firstOccurrence:0];
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if ((a3->flags & 4) == 0) {
                goto LABEL_86;
              }
              v38 = -[NWStatsManager internalSources](self, "internalSources");
              [v38 removeObjectForKey:v25];
              goto LABEL_85;
            }

            unsigned __int16 v36 = a3->flags;

            if ((v36 & 4) != 0) {
              goto LABEL_67;
            }
          }
        }

        else
        {
          if ((v9 & 0xFFFFFFFE) == 2)
          {
            v35 = &OBJC_CLASS___NWStatsTCPSource;
          }

          else
          {
            switch(v9)
            {
              case 4:
              case 5:
              case 10:
                v35 = &OBJC_CLASS___NWStatsUDPSource;
                break;
              case 8:
                v35 = &OBJC_CLASS___NWStatsQUICSource;
                break;
              case 9:
                v35 = &OBJC_CLASS___NWStatsConnSource;
                break;
              default:
                -[NWStatsManager _handleMessage:length:].cold.2();
            }
          }

          id v39 = objc_alloc(v35);
          v40 = -[NWStatsManager statsMonitor](self, "statsMonitor");
          id v54 = (id)[v39 initWithUpdate:a3 length:a4 monitor:v40];

          if (v54)
          {
            [v54 createSnapshot:v31 firstOccurrence:1];
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v28 & 4) != 0) {
              goto LABEL_86;
            }
            v38 = -[NWStatsManager internalSources](self, "internalSources");
            [v38 setObject:v54 forKey:v25];
LABEL_85:

LABEL_86:
            if (v37)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                id v41 = v37;
                v42 = v41;
                if (self->_trafficDeltaAdjustmentFactor > 0.0) {
                  objc_msgSend(v41, "applyTrafficAdjustmentFactor:");
                }
                if (self->_checkNESessionManagerVPNs)
                {
                  uint64_t v43 = [v42 interfaceIndex];
                  v44 = +[NWStatsInterfaceRegistry sharedInstance](&OBJC_CLASS___NWStatsInterfaceRegistry, "sharedInstance");
                  [v44 addInterfaceIndexToRegistry:v43];
                  [v42 euuid];
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  int v46 = [v44 machOUUIDBelongsToVPNProvider:v45];

                  if (v46) {
                    [v42 removeBytesFromAccumulator];
                  }
                }
              }

              if (!v53) {
                goto LABEL_101;
              }
              uint64_t v47 = -[NWStatsManager activePoll](self, "activePoll");
              if (!v47) {
                goto LABEL_101;
              }
              v48 = (void *)v47;
              v49 = -[NWStatsManager activePoll](self, "activePoll");
              [v49 deliveryBlock];
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v50)
              {
                v51 = -[NWStatsManager activePoll](self, "activePoll");
                [v51 deliveryBlock];
                v52 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
                ((void (**)(void, void *))v52)[2](v52, v37);
              }

              else
              {
LABEL_101:
                if ((objc_opt_respondsToSelector() & 1) != 0) {
                  [v24 statsManager:self didReceiveNWSnapshot:v37];
                }
              }
            }

            goto LABEL_105;
          }

          id v54 = 0LL;
        }

        v37 = 0LL;
LABEL_105:

        goto LABEL_106;
      }

      NStatGetLog();
      os_log_type_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        int64_t v56 = a4;
        __int16 v57 = 2048;
        uint64_t v58 = 496LL;
        int v11 = "TCP update message with size %ld below minimum %ld\n";
LABEL_76:
        v22 = v10;
        uint32_t v23 = 22;
LABEL_77:
        _os_log_impl(&dword_187FF5000, v22, OS_LOG_TYPE_ERROR, v11, buf, v23);
      }

- (void)_drainReadBuffer
{
  ssize_t v3 = recv( -[NWStatsManager sockfd](self, "sockfd"),  -[NWStatsManager readBuffer](self, "readBuffer"),  -[NWStatsManager readBufferSize](self, "readBufferSize"),  0);
  if (v3 >= 1)
  {
    for (ssize_t i = v3;
          i > 0;
          ssize_t i = recv( -[NWStatsManager sockfd](self, "sockfd"),  -[NWStatsManager readBuffer](self, "readBuffer"),  -[NWStatsManager readBufferSize](self, "readBufferSize"),  0))
    {
      id v5 = -[NWStatsManager readBuffer](self, "readBuffer");
      if ((unint64_t)i >= 0x10)
      {
        id v6 = v5;
        do
        {
          unint64_t v7 = *((unsigned __int16 *)v6 + 6);
          if (self->_interfaceTraceFd >= 1)
          {
            if (self->_iftracebuf) {
              -[NWStatsManager _traceMemoryBuf:length:tag:]( self,  "_traceMemoryBuf:length:tag:",  v6,  *((unsigned __int16 *)v6 + 6),  "Input");
            }
          }

          v6 += v7;
          i -= v7;
        }

        while ((unint64_t)i > 0xF);
      }
    }
  }

- (void)_handleReads:(int64_t)a3
{
  id v5 = (void *)MEMORY[0x1895BB0FC](self, a2);
  uint64_t v6 = 0LL;
  if (a3 <= 1) {
    int64_t v7 = 1LL;
  }
  else {
    int64_t v7 = a3;
  }
  do
  {
    ssize_t v8 = recv( -[NWStatsManager sockfd](self, "sockfd"),  -[NWStatsManager readBuffer](self, "readBuffer"),  -[NWStatsManager readBufferSize](self, "readBufferSize"),  0);
    if (v8 < 1) {
      break;
    }
    unint64_t v9 = v8;
    os_log_type_t v10 = -[NWStatsManager readBuffer](self, "readBuffer");
    if (v9 >= 0x10)
    {
      int v11 = v10;
      do
      {
        unint64_t v12 = *((unsigned __int16 *)v11 + 6);
        if (self->_interfaceTraceFd >= 1 && self->_iftracebuf) {
          -[NWStatsManager _traceMemoryBuf:length:tag:]( self,  "_traceMemoryBuf:length:tag:",  v11,  *((unsigned __int16 *)v11 + 6),  "Input");
        }
        v9 -= v12;
        -[NWStatsManager _handleMessage:length:](self, "_handleMessage:length:", v11, v12);
        v11 += v12;
      }

      while (v9 > 0xF);
    }

    ++v6;
  }

  while (v6 != v7);
  objc_autoreleasePoolPop(v5);
}

- (void)_startQueuedPoll
{
  __assert_rtn("-[NWStatsManager _startQueuedPoll]", "NWStatsManager.m", 1251, "self.activePoll == nil");
}

- (void)_handleCompletion:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a3 && self->_currentPollReference == a3)
  {
    self->_unint64_t currentPollReference = 0LL;
    self->_continuationCount = 0;
    -[NWStatsManager activePoll](self, "activePoll");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    -[NWStatsManager setActivePoll:](self, "setActivePoll:", 0LL);
    if (v11)
    {
      if (([v11 synchronous] & 1) == 0)
      {
        [v11 completionBlock];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          [v11 completionBlock];
          uint64_t v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v6[2]();
        }
      }
    }

    -[NWStatsManager queuedPolls](self, "queuedPolls");
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 count];

    if (v8) {
      -[NWStatsManager _startQueuedPoll](self, "_startQueuedPoll");
    }
  }

  else
  {
    NStatGetLog();
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t currentPollReference = self->_currentPollReference;
      *(_DWORD *)buf = 134218240;
      unint64_t v13 = currentPollReference;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_impl( &dword_187FF5000,  v9,  OS_LOG_TYPE_ERROR,  "mismatch, _currentPollReference %lld supplied reference %lld",  buf,  0x16u);
    }
  }

- (void)_removeSourceInternal:(unint64_t)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NWStatsManager internalSources](self, "internalSources");
  double v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKey:v7];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [v5 setRemoved:1];
    -[NWStatsManager internalSources](self, "internalSources");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 removeObjectForKey:v7];

    -[NWStatsManager _handleRemoveForSource:](self, "_handleRemoveForSource:", v5);
  }
}

- (void)_addAllForProvider:(int)a3 filter:(unint64_t)a4 events:(unint64_t)a5
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v5 = 0u;
  uint64_t v9 = 0LL;
  DWORD2(v5) = 1002;
  LODWORD(v8) = a3;
  unint64_t v6 = a4;
  unint64_t v7 = a5;
  -[NWStatsManager _sendMessage:length:](self, "_sendMessage:length:", &v5, 56LL);
}

- (void)_handleCounts:(nstat_msg_src_counts *)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  -[NWStatsManager interfaceSources](self, "interfaceSources", 0LL);
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 srcRef] == a3->var1)
        {
          -[NWStatsManager delegate](self, "delegate");
          unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = [v10 ifIndex];
          if ((objc_opt_respondsToSelector() & 1) != 0) {
            [v13 statsManager:self thresholdReachedOn:v14];
          }

          return;
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  NStatGetLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t var1 = a3->var1;
    *(_DWORD *)buf = 134217984;
    unint64_t v20 = var1;
    _os_log_impl(&dword_187FF5000, v11, OS_LOG_TYPE_DEFAULT, "Unexpected counts message on source ref %lld", buf, 0xCu);
  }

  -[NWStatsManager _sendUpdateRequestMessage:](self, "_sendUpdateRequestMessage:", a3->var1);
}

- (void)_noteInterfaceSrcRef:(unint64_t)a3 forInterface:(unsigned int)a4 threshold:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  -[NWStatsManager interfaceSources](self, "interfaceSources", a3, *(void *)&a4, a5, 0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 ifIndex] == a4)
        {
          if ([v13 srcRef])
          {
            if ([v13 srcRef] != a3)
            {
              NStatGetLog();
              __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v16 = [v13 srcRef];
                *(_DWORD *)buf = 134218496;
                unint64_t v23 = v16;
                __int16 v24 = 2048;
                unint64_t v25 = a3;
                __int16 v26 = 1024;
                unsigned int v27 = a4;
                _os_log_impl( &dword_187FF5000,  v15,  OS_LOG_TYPE_DEFAULT,  "Replace source ref %lld with %lld for monitoring interface %u",  buf,  0x1Cu);
              }

              -[NWStatsManager _sendRemoveSource:](self, "_sendRemoveSource:", [v13 srcRef]);
              [v13 setSrcRef:a3];
            }
          }

          else
          {
            [v13 setSrcRef:a3];
            NStatGetLog();
            __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              unint64_t v23 = a3;
              __int16 v24 = 1024;
              LODWORD(v25) = a4;
              _os_log_impl( &dword_187FF5000,  v17,  OS_LOG_TYPE_DEFAULT,  "Adopt source ref %lld to monitor interface %u",  buf,  0x12u);
            }
          }

          return;
        }
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  NStatGetLog();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v23 = a3;
    __int16 v24 = 1024;
    LODWORD(v25) = a4;
    _os_log_impl(&dword_187FF5000, v14, OS_LOG_TYPE_DEFAULT, "Discard source ref %lld for interface %u", buf, 0x12u);
  }

  -[NWStatsManager _sendRemoveSource:](self, "_sendRemoveSource:", a3);
}

- (void)_setThreshold:(unint64_t)a3 onInterface:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  -[NWStatsManager clientQueue](self, "clientQueue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  -[NWStatsManager interfaceSources](self, "interfaceSources", 0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v18;
LABEL_3:
    uint64_t v13 = 0LL;
    uint64_t v14 = v11;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v11 = (NWStatsInterfaceSource *)*(id *)(*((void *)&v17 + 1) + 8 * v13);

      if (-[NWStatsInterfaceSource ifIndex](v11, "ifIndex") == (_DWORD)v4) {
        break;
      }
      ++v13;
      uint64_t v14 = v11;
      if (v10 == v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v28 count:16];
        if (v10) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }

    if (a3) {
      goto LABEL_13;
    }
    if (-[NWStatsInterfaceSource srcRef](v11, "srcRef")) {
      -[NWStatsManager _sendRemoveSource:](self, "_sendRemoveSource:", -[NWStatsInterfaceSource srcRef](v11, "srcRef"));
    }
    -[NWStatsManager interfaceSources](self, "interfaceSources");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 removeObject:v11];
  }

  else
  {
LABEL_10:

    if (a3)
    {
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NWStatsInterfaceSource);
      -[NWStatsInterfaceSource setIfIndex:](v11, "setIfIndex:", v4);
      -[NWStatsInterfaceSource setThreshold:](v11, "setThreshold:", 0LL);
      -[NWStatsInterfaceSource setSrcRef:](v11, "setSrcRef:", 0LL);
      -[NWStatsManager interfaceSources](self, "interfaceSources");
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 addObject:v11];

LABEL_13:
      if (-[NWStatsInterfaceSource threshold](v11, "threshold") != a3)
      {
        if (-[NWStatsInterfaceSource srcRef](v11, "srcRef"))
        {
          -[NWStatsManager _sendRemoveSource:]( self,  "_sendRemoveSource:",  -[NWStatsInterfaceSource srcRef](v11, "srcRef"));
          -[NWStatsInterfaceSource setSrcRef:](v11, "setSrcRef:", 0LL);
        }

        __int128 v22 = 0u;
        __int128 v27 = 0u;
        __int128 v26 = 0u;
        __int128 v25 = 0u;
        uint64_t v21 = 0LL;
        LODWORD(v22) = 1001;
        DWORD2(v22) = 6;
        uint64_t v24 = v4;
        unint64_t v23 = a3;
        -[NWStatsInterfaceSource setThreshold:](v11, "setThreshold:", a3);
        -[NWStatsManager _sendMessage:length:](self, "_sendMessage:length:", &v21, 40LL);
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }
  }
}

- (int)_setThresholds:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v5 = v4;
  if (!v4)
  {
    int v17 = 0;
    goto LABEL_21;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (!v7)
  {
    int v17 = 0;
    goto LABEL_20;
  }

  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v26;
  uint64_t v24 = v5;
  while (2)
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NStatGetLog();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          __int128 v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v30 = v11;
          __int16 v31 = 2112;
          v32 = v19;
          _os_log_impl( &dword_187FF5000,  v12,  OS_LOG_TYPE_ERROR,  "Incorrect key format for configuring thresholds, %@ has class %@",  buf,  0x16u);
        }

        goto LABEL_19;
      }

      uint64_t v12 = v11;
      [v6 objectForKeyedSubscript:v12];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NStatGetLog();
        __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v30 = v13;
          __int16 v31 = 2112;
          v32 = v22;
          __int16 v33 = 2112;
          v34 = v12;
          _os_log_impl( &dword_187FF5000,  v20,  OS_LOG_TYPE_ERROR,  "Incorrect threshold format %@ of class %@ for configuring interface %@",  buf,  0x20u);
        }

LABEL_19:
        __int128 v5 = v24;

        int v17 = 22;
        goto LABEL_20;
      }

      id v14 = v13;
      uint64_t v15 = [v14 unsignedLongLongValue];
      uint64_t v16 = -[os_log_s unsignedIntegerValue](v12, "unsignedIntegerValue");

      -[NWStatsManager _setThreshold:onInterface:](self, "_setThreshold:onInterface:", v15, v16);
    }

    uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v35 count:16];
    int v17 = 0;
    __int128 v5 = v24;
    if (v8) {
      continue;
    }
    break;
  }

- (void)_setInterfaceTraceFd:(int)a3
{
  if (!self->_iftracebuf)
  {
    __int128 v5 = (char *)malloc(0x1100uLL);
    if (!v5)
    {
      __break(1u);
      return;
    }

    self->_iftracebuf = v5;
  }

  int interfaceTraceFd = self->_interfaceTraceFd;
  self->_int interfaceTraceFd = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)invalidate
{
  ssize_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWStatsManager readSource](self, "readSource");
    id v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[NWStatsManager setReadSource:](self, "setReadSource:", 0LL);
  }

  -[NWStatsManager activePoll](self, "activePoll");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    -[NWStatsManager setActivePoll:](self, "setActivePoll:", 0LL);
  }
  -[NWStatsManager setQueuedPolls:](self, "setQueuedPolls:", 0LL);
  while (1)
  {
    -[NWStatsManager internalSources](self, "internalSources");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 count];

    if (!v7) {
      break;
    }
    -[NWStatsManager internalSources](self, "internalSources");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 allKeys];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    [v9 objectAtIndexedSubscript:0];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsManager _removeSourceInternal:](self, "_removeSourceInternal:", [v10 unsignedLongLongValue]);
  }

  -[NWStatsManager setInternalSources:](self, "setInternalSources:", 0LL);
  if (self->_interfaceTraceFd >= 1)
  {
    self->_int interfaceTraceFd = 0;
    iftracebuf = self->_iftracebuf;
    if (iftracebuf)
    {
      free(iftracebuf);
      self->_iftracebuf = 0LL;
    }
  }

  -[NWStatsManager setInvalidated:](self, "setInvalidated:", 1LL);
}

- (void)dealloc
{
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel((dispatch_source_t)readSource);
    id v4 = self->_readSource;
    self->_readSource = 0LL;
  }

  readBuffer = self->_readBuffer;
  if (readBuffer)
  {
    free(readBuffer);
    self->_readBuffer = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWStatsManager;
  -[NWStatsManager dealloc](&v6, sel_dealloc);
}

- (BOOL)setRcvBufsize:(int)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v8 = a3;
  if (self->_currentRcvBufSize == a3) {
    return 1;
  }
  if (setsockopt(self->_sockfd, 0xFFFF, 4098, &v8, 4u) != -1)
  {
    self->_int currentRcvBufSize = v8;
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    self->_currentRcvBufTimestamp = v4;
    return 1;
  }

  NStatGetLog();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int currentRcvBufSize = self->_currentRcvBufSize;
    *(_DWORD *)buf = 67109376;
    int v10 = currentRcvBufSize;
    __int16 v11 = 1024;
    int v12 = v8;
    _os_log_impl(&dword_187FF5000, v6, OS_LOG_TYPE_ERROR, "Unable to increment rcv buf size from %d to %d", buf, 0xEu);
  }

  return 0;
}

- (NWStatsManager)initWithQueue:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NWStatsManager;
  objc_super v6 = -[NWStatsManager init](&v23, sel_init);
  if (!v6) {
    goto LABEL_15;
  }
  int v7 = socket(32, 2, 2);
  if (v7 == -1)
  {
LABEL_6:
    v6->_sockfd = -1;
    NStatGetLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl( &dword_187FF5000,  v9,  OS_LOG_TYPE_ERROR,  "Unable to allocate a kernel control socket",  (uint8_t *)&buf,  2u);
    }

    goto LABEL_9;
  }

  int v8 = v7;
  int buf = 0;
  int v33 = 0;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  *(_OWORD *)&buf_4[28] = 0u;
  __int128 v30 = 0u;
  strcpy(buf_4, "com.apple.network.statistics");
  if (ioctl(v7, 0xC0644E03uLL, &buf) == -1
    || (uint64_t v26 = 0LL,
        *(void *)&v25[12] = 0LL,
        int v27 = 0,
        *(_DWORD *)__int128 v25 = 139296,
        *(_DWORD *)&v25[4] = buf,
        *(_DWORD *)&v25[8] = 0,
        connect(v8, (const sockaddr *)v25, 0x20u)))
  {
LABEL_5:
    close(v8);
    goto LABEL_6;
  }

  int v11 = fcntl(v8, 3, 0LL);
  if (fcntl(v8, 4, v11 | 4u) == -1)
  {
    NStatGetLog();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_187FF5000, v21, OS_LOG_TYPE_ERROR, "Unable to set non-blocking", v24, 2u);
    }

    goto LABEL_5;
  }

  v6->_sockfd = v8;
  if (-[NWStatsManager setRcvBufsize:](v6, "setRcvBufsize:", 0x20000LL))
  {
    objc_storeStrong((id *)&v6->_clientQueue, a3);
    int v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    internalSources = v6->_internalSources;
    v6->_internalSources = v12;

    id v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    queuedPolls = v6->_queuedPolls;
    v6->_queuedPolls = v14;

    uint64_t v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    interfaceSources = v6->_interfaceSources;
    v6->_interfaceSources = v16;

    __int128 v18 = -[NWStatsMonitor initWithQueue:](objc_alloc(&OBJC_CLASS___NWStatsMonitor), "initWithQueue:", v5);
    statsMonitor = v6->_statsMonitor;
    v6->_statsMonitor = v18;

    v6->_unint64_t nextPollReference = 2LL;
    if (v6->_clientQueue && v6->_internalSources && v6->_statsMonitor)
    {
LABEL_15:
      int v10 = v6;
      goto LABEL_16;
    }

    NStatGetLog();
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl( &dword_187FF5000,  v22,  OS_LOG_TYPE_ERROR,  "Unable to initialize Sources / queue / monitor",  (uint8_t *)&buf,  2u);
    }
  }

  close(v6->_sockfd);
LABEL_9:
  int v10 = 0LL;
LABEL_16:

  return v10;
}

- (int)initialConfigure:(id)a3
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  unsigned int currentRcvBufSize = self->_currentRcvBufSize;
  self->_consecutiveReadLimit = 20;
  self->_checkNESessionManagerVPNs = 1;
  -[NWStatsManager setReadBufferSize:](self, "setReadBufferSize:", 4096LL);
  [v4 objectForKeyedSubscript:@"kNWStatsParameterTargetSelector"];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterTargetSelector"];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_7;
    }
    [v4 objectForKeyedSubscript:@"kNWStatsParameterTargetSelector"];
    uint64_t v9 = (NWStatsTargetSelector *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v9 = -[NWStatsTargetSelector initWithSelection:]( objc_alloc(&OBJC_CLASS___NWStatsTargetSelector),  "initWithSelection:",  v4);
  }

  int v10 = v9;
  if (v9)
  {
    uint64_t v11 = -[NWStatsTargetSelector filter](v9, "filter");
    uint64_t v12 = -[NWStatsTargetSelector connFilter](v10, "connFilter");
    uint64_t v13 = -[NWStatsTargetSelector events](v10, "events");
    LODWORD(v74) = 0;
    goto LABEL_10;
  }

uint64_t __35__NWStatsManager_initialConfigure___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 58LL) = 1;
  uint64_t result = [*(id *)(a1 + 32) _handleReads:*(unsigned int *)(*(void *)(a1 + 32) + 28)];
  *(_BYTE *)(*(void *)(a1 + 32) + 58LL) = 0;
  return result;
}

uint64_t __35__NWStatsManager_initialConfigure___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __35__NWStatsManager_initialConfigure___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48LL) = 0LL;
  NStatGetLog();
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_187FF5000, v1, OS_LOG_TYPE_DEFAULT, "Initial update for opens completed", v2, 2u);
  }
}

- (int)reconfigure:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kNWStatsParameterTraceFD"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    int interfaceTraceFd = self->_interfaceTraceFd;
    [v4 objectForKeyedSubscript:@"kNWStatsParameterTraceFD"];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = [v7 intValue];

    if (interfaceTraceFd != v8)
    {
      [v4 objectForKeyedSubscript:@"kNWStatsParameterTraceFD"];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWStatsManager _setInterfaceTraceFd:](self, "_setInterfaceTraceFd:", [v9 intValue]);
    }
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterThresholds"];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = -[NWStatsManager _setThresholds:](self, "_setThresholds:", v10);

  return v11;
}

- (int)configure:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[NWStatsManager isInvalidated](self, "isInvalidated"))
  {
    NStatGetLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl( &dword_187FF5000,  v5,  OS_LOG_TYPE_ERROR,  "configure skipped as manager was invalidated",  (uint8_t *)v18,  2u);
    }

    int v6 = 6;
  }

  else
  {
    Default = CFAllocatorGetDefault();
    int v8 = SecTaskCreateFromSelf(Default);
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = (void *)SecTaskCopyValueForEntitlement(v8, @"com.apple.private.network.statistics", 0LL);
      int v11 = [v10 BOOLValue];
      uint64_t v12 = (void *)SecTaskCopyValueForEntitlement( v9,  @"com.apple.private.coreservices.canmapbundleidtouuid",  0LL);

      int v13 = [v12 BOOLValue];
      CFRelease(v9);

      if (v11 && v13)
      {
        -[NWStatsManager statsMonitor](self, "statsMonitor");
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 configure:v4];

        if (-[NWStatsManager configured](self, "configured"))
        {
          int v6 = -[NWStatsManager reconfigure:](self, "reconfigure:", v4);
        }

        else
        {
          int v6 = -[NWStatsManager initialConfigure:](self, "initialConfigure:", v4);
          -[NWStatsManager setConfigured:](self, "setConfigured:", 1LL);
        }

        goto LABEL_16;
      }
    }

    else
    {
      NStatGetLog();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18[0]) = 0;
        _os_log_impl( &dword_187FF5000,  v15,  OS_LOG_TYPE_ERROR,  "NWStatsManager configure: unable to get task ref for entitlement check",  (uint8_t *)v18,  2u);
      }

      int v11 = 0;
      int v13 = 0;
    }

    NStatGetLog();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v18[0] = 67109376;
      v18[1] = v11;
      __int16 v19 = 1024;
      int v20 = v13;
      _os_log_impl( &dword_187FF5000,  v16,  OS_LOG_TYPE_FAULT,  "NWStatsManager configure: entitlements not held, netstats %d, mapping %d",  (uint8_t *)v18,  0xEu);
    }

    -[NWStatsManager invalidate](self, "invalidate");
    int v6 = 1;
  }

- (int)statsRefreshCurrentUsage
{
  ssize_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = [v3 count];

  if (v4 == 1) {
    return 1;
  }
  if (v4)
  {
    if (v4 < 4) {
      return 2;
    }
    else {
      return 3;
    }
  }

  else
  {
    -[NWStatsManager activePoll](self, "activePoll");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v6 = v5 != 0LL;
  }

  return v6;
}

- (int)_refreshUsingBlock:(id)a3 completionBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[NWStatsManager queuedPolls](self, "queuedPolls");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = [v8 count];

  if (v9 < 4)
  {
    if (-[NWStatsManager configured](self, "configured"))
    {
      if (-[NWStatsManager isInvalidated](self, "isInvalidated"))
      {
        NStatGetLog();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v19[0]) = 0;
          _os_log_impl( &dword_187FF5000,  v12,  OS_LOG_TYPE_ERROR,  "_refreshUsingBlock skipped as manager was invalidated",  (uint8_t *)v19,  2u);
        }

        int v11 = 6;
      }

      else
      {
        id v14 = objc_alloc_init(&OBJC_CLASS___NWStatsPollHandler);
        uint64_t v15 = v14;
        if (v14)
        {
          -[NWStatsPollHandler setDeliveryBlock:](v14, "setDeliveryBlock:", v6);
          -[NWStatsPollHandler setCompletionBlock:](v15, "setCompletionBlock:", v7);
          -[NWStatsPollHandler setManager:](v15, "setManager:", self);
          -[NWStatsPollHandler setSynchronous:](v15, "setSynchronous:", 0LL);
          -[NWStatsManager activePoll](self, "activePoll");
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[NWStatsManager queuedPolls](self, "queuedPolls");
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v17 addObject:v15];
          }

          else
          {
            -[NWStatsManager _startPoll:](self, "_startPoll:", v15);
          }

          int v11 = 0;
        }

        else
        {
          int v11 = 12;
        }
      }
    }

    else
    {
      NStatGetLog();
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19[0]) = 0;
        _os_log_impl( &dword_187FF5000,  v13,  OS_LOG_TYPE_ERROR,  "_refreshUsingBlock skipped as manager not yet configured",  (uint8_t *)v19,  2u);
      }

      int v11 = 19;
    }
  }

  else
  {
    NStatGetLog();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v19[0] = 67109120;
      v19[1] = v9;
      _os_log_impl( &dword_187FF5000,  v10,  OS_LOG_TYPE_ERROR,  "_refreshUsingBlock skipped as current outstanding is %d",  (uint8_t *)v19,  8u);
    }

    int v11 = 35;
  }

  return v11;
}

- (int)refresh:(id)a3
{
  return -[NWStatsManager _refreshUsingBlock:completionBlock:](self, "_refreshUsingBlock:completionBlock:", 0LL, a3);
}

- (int)_refreshSyncUsingBlock:(id)a3
{
  id v4 = a3;
  if (-[NWStatsManager configured](self, "configured"))
  {
    if (-[NWStatsManager isInvalidated](self, "isInvalidated"))
    {
      NStatGetLog();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl( &dword_187FF5000,  v5,  OS_LOG_TYPE_ERROR,  "_refreshSyncUsingBlock skipped as manager was invalidated",  buf,  2u);
      }

      int v6 = 6;
    }

    else if (self->_handlingSocketReads)
    {
      NStatGetLog();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl( &dword_187FF5000,  v8,  OS_LOG_TYPE_ERROR,  "_refreshSyncUsingBlock abort to prevent deadlock",  v15,  2u);
      }

      int v6 = 11;
    }

    else
    {
      unint64_t v9 = objc_alloc_init(&OBJC_CLASS___NWStatsPollHandler);
      int v10 = v9;
      if (v9)
      {
        -[NWStatsPollHandler setDeliveryBlock:](v9, "setDeliveryBlock:", v4);
        -[NWStatsPollHandler setCompletionBlock:](v10, "setCompletionBlock:", 0LL);
        -[NWStatsPollHandler setManager:](v10, "setManager:", self);
        -[NWStatsPollHandler setSynchronous:](v10, "setSynchronous:", 1LL);
        -[NWStatsManager activePoll](self, "activePoll");
        int v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[NWStatsManager queuedPolls](self, "queuedPolls");
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 addObject:v10];
        }

        else
        {
          -[NWStatsManager _startPoll:](self, "_startPoll:", v10);
        }

        self->_handlingSocketReads = 1;
        while (1)
        {
          -[NWStatsManager activePoll](self, "activePoll");
          int v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13) {
            break;
          }
          -[NWStatsManager _handleReads:](self, "_handleReads:", 1LL);
        }

        int v6 = 0;
        self->_handlingSocketReads = 0;
      }

      else
      {
        int v6 = 12;
      }
    }
  }

  else
  {
    NStatGetLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl( &dword_187FF5000,  v7,  OS_LOG_TYPE_ERROR,  "_refreshSyncUsingBlock skipped as manager not yet configured",  v17,  2u);
    }

    int v6 = 19;
  }

  return v6;
}

- (int)refreshSync
{
  return -[NWStatsManager _refreshSyncUsingBlock:](self, "_refreshSyncUsingBlock:", 0LL);
}

- (void)ignoreSource:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:v6];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = v8;
  if (v8)
  {
    [v8 setRemoving:1];
    -[NWStatsManager _sendRemoveSource:](self, "_sendRemoveSource:", a3);
    id v7 = v8;
  }
}

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6 = a3;
  -[NWStatsManager statsMonitor](self, "statsMonitor");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NWStatsManager statsMonitor](self, "statsMonitor");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 identifierForUUID:v6 derivation:a4];
    unint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v9 = @"unavailable";
  }

  return v9;
}

- (id)stateDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stateDictionary];
  ssize_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getState
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v4 = objc_alloc(NSString);
  -[NWStatsManager internalSources](self, "internalSources");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)objc_msgSend( v4,  "initWithFormat:",  @"NWStatsManager %p: Current num sources %d current buf size %d after %d adaptations",  self,  objc_msgSend(v5, "count"),  self->_currentRcvBufSize,  self->_numAdaptiveRcvBufIncrements);
  [v3 addObject:v6];

  id v7 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"NWStatsManager %p: Source removes %lld after filter %lld after drop %lld",  self,  self->_combinedCounts.numRemoveSources,  self->_combinedCounts.numRemoveSourcesAfterFilter,  self->_combinedCounts.numRemoveSourcesAfterDrop);
  [v3 addObject:v7];

  id v8 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"NWStatsManager %p: No-source removes %lld after filter %lld after drop %lld",  self,  self->_combinedCounts.numRemoves,  self->_combinedCounts.numRemovesAfterFilter,  self->_combinedCounts.numRemovesAfterDrop);
  [v3 addObject:v8];

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  -[NWStatsManager queuedPolls](self, "queuedPolls");
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
  char v44 = self;
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0LL;
    uint64_t v13 = *(void *)v54;
    do
    {
      uint64_t v14 = 0LL;
      uint64_t v15 = v12;
      do
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v9);
        }
        id v12 = *(id *)(*((void *)&v53 + 1) + 8 * v14);

        [v12 description];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v16];

        ++v14;
        uint64_t v15 = v12;
      }

      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }

    while (v11);

    self = v44;
  }

  uint64_t v17 = 0LL;
  p_numUpdatesOnClose = &self->_providerCounts[1].numUpdatesOnClose;
  do
  {
    if (*(p_numUpdatesOnClose - 4)
      || *(p_numUpdatesOnClose - 3)
      || *(p_numUpdatesOnClose - 2)
      || *(p_numUpdatesOnClose - 1)
      || *p_numUpdatesOnClose)
    {
      if (v17 >= 0xA)
      {
        self = v44;
        __int16 v19 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"unknown-%d", v17 + 1);
      }

      else
      {
        __int16 v19 = *(&off_18A1B6858 + v17);
      }

      uint64_t v20 = (void *)[objc_alloc(NSString) initWithFormat:@"NWStatsManager %p: %@ src-add %lld updates open %lld poll %lld event %lld close %lld", self, v19, *(p_numUpdatesOnClose - 4), *(p_numUpdatesOnClose - 3), *(p_numUpdatesOnClose - 2), *(p_numUpdatesOnClose - 1), *p_numUpdatesOnClose];
      [v3 addObject:v20];
    }

    ++v17;
    p_numUpdatesOnClose += 5;
  }

  while (v17 != 10);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  -[NWStatsManager interfaceSources](self, "interfaceSources");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v50;
    do
    {
      for (uint64_t i = 0LL; i != v23; ++i)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"NWStatsManager %p: monitoring interface %d with srcref %lld threshold %lld",  v44,  objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "ifIndex"),  objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "srcRef"),  objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "threshold"));
        [v3 addObject:v26];
      }

      uint64_t v23 = [v21 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }

    while (v23);
  }

  -[NWStatsManager internalSources](v44, "internalSources");
  int v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 allKeys];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v28;
  [v28 sortedArrayUsingSelector:sel_compare_];
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v46;
    do
    {
      for (uint64_t j = 0LL; j != v30; ++j)
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(obj);
        }
        int v33 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        id v34 = objc_alloc(NSString);
        uint64_t v35 = [v33 longLongValue];
        -[NWStatsManager internalSources](v44, "internalSources");
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 objectForKeyedSubscript:v33];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)[v34 initWithFormat:@" ref %6lld --> %@", v35, v37];
        [v3 addObject:v38];
      }

      uint64_t v30 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    }

    while (v30);
  }

  if (v44->_checkNESessionManagerVPNs)
  {
    +[NWStatsInterfaceRegistry sharedInstance](&OBJC_CLASS___NWStatsInterfaceRegistry, "sharedInstance");
    id v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 getState];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v40];
  }

  return v3;
}

- (void)dumpState
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v2 = -[NWStatsManager getState](self, "getState");
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        NStatGetLog();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 138543362;
          uint64_t v14 = v7;
          _os_log_impl(&dword_187FF5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }

    while (v4);
  }
}

- (NWStatsManagerDelegate)delegate
{
  return (NWStatsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_source)readSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 584LL, 1);
}

- (void)setReadSource:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 592LL, 1);
}

- (void)setClientQueue:(id)a3
{
}

- (int)sockfd
{
  return self->_sockfd;
}

- (void)setSockfd:(int)a3
{
  self->_int sockfd = a3;
}

- (NSMutableDictionary)internalSources
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 600LL, 1);
}

- (void)setInternalSources:(id)a3
{
}

- (NSMutableSet)interfaceSources
{
  return (NSMutableSet *)objc_getProperty(self, a2, 608LL, 1);
}

- (void)setInterfaceSources:(id)a3
{
}

- (NWStatsMonitor)statsMonitor
{
  return (NWStatsMonitor *)objc_getProperty(self, a2, 616LL, 1);
}

- (void)setStatsMonitor:(id)a3
{
}

- (unint64_t)currentQueryAllReference
{
  return self->_currentQueryAllReference;
}

- (void)setCurrentQueryAllReference:(unint64_t)a3
{
  self->_currentQueryAllReference = a3;
}

- (unint64_t)querySequenceNumber
{
  return self->_querySequenceNumber;
}

- (void)setQuerySequenceNumber:(unint64_t)a3
{
  self->_querySequenceNumber = a3;
}

- (char)readBuffer
{
  return self->_readBuffer;
}

- (void)setReadBuffer:(char *)a3
{
  self->_readBuffer = a3;
}

- (unint64_t)readBufferSize
{
  return self->_readBufferSize;
}

- (void)setReadBufferSize:(unint64_t)a3
{
  self->_readBufferSize = a3;
}

- (NSMutableArray)queuedPolls
{
  return (NSMutableArray *)objc_getProperty(self, a2, 656LL, 1);
}

- (void)setQueuedPolls:(id)a3
{
}

- (NWStatsPollHandler)activePoll
{
  return (NWStatsPollHandler *)objc_getProperty(self, a2, 664LL, 1);
}

- (void)setActivePoll:(id)a3
{
}

- (BOOL)configured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
}

- (void)_startPoll:.cold.1()
{
  __assert_rtn("-[NWStatsManager _startPoll:]", "NWStatsManager.m", 849, "self.activePoll == nil");
}

- (void)_restartPoll:.cold.1()
{
  __assert_rtn("-[NWStatsManager _restartPoll:]", "NWStatsManager.m", 862, "self.activePoll == currentPoll");
}

- (void)_handleMessage:length:.cold.1()
{
}

- (void)_handleMessage:length:.cold.2()
{
  __assert_rtn( "-[NWStatsManager _handleMessage:length:]",  "NWStatsManager.m",  1117,  "provider == NSTAT_PROVIDER_CONN_USERLAND");
}

- (void)_addAllForProvider:filter:events:.cold.1()
{
  __assert_rtn( "-[NWStatsManager _addAllForProvider:filter:events:]",  "NWStatsManager.m",  1306,  "(provider == NSTAT_PROVIDER_TCP_KERNEL) || (provider == NSTAT_PROVIDER_TCP_USERLAND) || (provider == NSTAT_PROVIDER_ UDP_KERNEL) || (provider == NSTAT_PROVIDER_UDP_USERLAND) || (provider == NSTAT_PROVIDER_QUIC_USERLAND) || (provider == NSTAT_PROVIDER_CONN_USERLAND) || (provider == NSTAT_PROVIDER_UDP_SUBFLOW)");
}

@end