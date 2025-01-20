@interface NWStatisticsManager
- (BOOL)addAllForProvider:(int)a3 filter:(unint64_t)a4 events:(unint64_t)a5 pid:(int)a6 uuid:(unsigned __int8 *)(a7;
- (BOOL)addAllRoute;
- (BOOL)addAllRoute:(unint64_t)a3;
- (BOOL)addAllTCP:(unint64_t)a3;
- (BOOL)addAllTCP:(unint64_t)a3 events:(unint64_t)a4 pid:(int)a5 uuid:(unsigned __int8 *)(a6;
- (BOOL)addAllUDP:(unint64_t)a3;
- (BOOL)addAllUDP:(unint64_t)a3 events:(unint64_t)a4 pid:(int)a5 uuid:(unsigned __int8 *)(a6;
- (BOOL)addSource:(id)a3 request:(nstat_msg_add_src *)a4 length:(unint64_t)a5;
- (BOOL)handleCompletion:(unint64_t)a3 message:(nstat_msg_hdr *)a4 length:(unsigned int)a5;
- (BOOL)handleCompletionMessage:(nstat_msg_hdr *)a3 length:(unsigned int)a4;
- (BOOL)isInvalidated;
- (BOOL)isReading;
- (BOOL)performQuery:(unsigned int)a3 sourceRef:(unint64_t)a4 completion:(id)a5;
- (BOOL)queryAll:(id)a3;
- (BOOL)sendMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4;
- (NSMutableDictionary)_internalSources;
- (NSMutableDictionary)currentQueries;
- (NSMutableDictionary)queuedQueryAlls;
- (NSSet)sources;
- (NWStatisticsManager)init;
- (NWStatisticsManager)initWithQueue:(id)a3;
- (NWStatisticsManagerDelegate)delegate;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_source)readSource;
- (char)readBuffer;
- (id)strongDelegate;
- (int)interfaceSourceFd;
- (int)interfaceTraceFd;
- (int)sockfd;
- (unint64_t)_nextReferenceForTarget:(unint64_t)a3 command:(unsigned int)a4;
- (unint64_t)currentQueryAllReference;
- (unint64_t)querySequenceNumber;
- (unsigned)commandFromReference:(unint64_t)a3;
- (unsigned)filter;
- (unsigned)mgrflags;
- (void)dealloc;
- (void)dispatchDidAddSource:(id)a3;
- (void)dispatchDidReceiveCounts:(id)a3 fromUpdate:(BOOL)a4;
- (void)dispatchDidReceiveDescription:(id)a3;
- (void)dispatchDidReceiveType:(unsigned int)a3 source:(id)a4;
- (void)handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4;
- (void)handleReadEvent;
- (void)handleSystemInformationCounts:(nstat_sysinfo_counts *)a3;
- (void)invalidate;
- (void)performAllCompletions:(id)a3;
- (void)queryAllCounts:(id)a3;
- (void)queryAllDescriptions:(id)a3;
- (void)querySource:(id)a3 completion:(id)a4;
- (void)removeSource:(id)a3;
- (void)removeSourceInternal:(unint64_t)a3 isFromClient:(BOOL)a4;
- (void)reportInternalCounts;
- (void)sendRemoveSourceInternal:(unint64_t)a3;
- (void)sendRequestMessage:(int)a3 sourceRef:(unint64_t)a4;
- (void)setCurrentQueries:(id)a3;
- (void)setCurrentQueryAllReference:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInterfaceSourceFd:(int)a3;
- (void)setInterfaceTraceFd:(int)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setMgrflags:(unsigned int)a3;
- (void)setQuerySequenceNumber:(unint64_t)a3;
- (void)setQueuePriority:(int64_t)a3;
- (void)setQueuedQueryAlls:(id)a3;
- (void)setReadBuffer:(char *)a3;
- (void)setReadSource:(id)a3;
- (void)setReading:(BOOL)a3;
- (void)setSockfd:(int)a3;
- (void)setStrongDelegate:(id)a3;
- (void)set_internalSources:(id)a3;
- (void)startQueuedQuery;
- (void)subscribeToSystemInformation;
- (void)trace:(char *)a3;
- (void)traceMemoryBuf:(char *)a3 length:(int64_t)a4 tag:(char *)a5;
@end

@implementation NWStatisticsManager

- (void)traceMemoryBuf:(char *)a3 length:(int64_t)a4 tag:(char *)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v8 = self;
  objc_sync_enter(v8);
  if ((v8->_interfaceTraceFd & 0x80000000) == 0 && v8->_iftracebuf)
  {
    gettimeofday(&v15, 0LL);
    __snprintf_chk( v8->_iftracebuf,  0x1100uLL,  0,  0xFFFFFFFFFFFFFFFFLL,  "%ld.%06d %s len %zu\n",  v15.tv_sec,  v15.tv_usec,  a5,  a4);
    size_t v9 = strlen(v8->_iftracebuf) + 1;
    size_t v10 = v9 + a4;
    if ((v9 + a4) >> 8 > 0x10)
    {
      NStatGetLog();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[NWStatisticsManager traceMemoryBuf:length:tag:].cold.1((uint64_t)a5, a4, v11);
      }
      goto LABEL_9;
    }

    memcpy(&v8->_iftracebuf[v9], a3, a4);
    if (write(v8->_interfaceTraceFd, v8->_iftracebuf, v10) < 0)
    {
      NStatGetLog();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v12 = *__error();
        v13 = __error();
        v14 = strerror(*v13);
        *(_DWORD *)buf = 136315650;
        v17 = a5;
        __int16 v18 = 1024;
        int v19 = v12;
        __int16 v20 = 2080;
        v21 = v14;
        _os_log_debug_impl(&dword_187FF5000, v11, OS_LOG_TYPE_DEBUG, "save %s failed: %d - %s", buf, 0x1Cu);
      }

- (void)trace:(char *)a3
{
  if (a3)
  {
  }

- (BOOL)sendMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    a3->length = a4;
    a3->flags |= 1u;
    if (send(-[NWStatisticsManager sockfd](self, "sockfd"), a3, a4, 0) == a4) {
      return 1;
    }
    if (a3->context) {
      -[NWStatisticsManager handleCompletion:message:length:]( self,  "handleCompletion:message:length:",  a3->context,  0LL,  0LL);
    }
  }

  return 0;
}

- (void)handleSystemInformationCounts:(nstat_sysinfo_counts *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (int)(((unint64_t)a3->var0 - 8) / 0x28) >= 1)
  {
    uint64_t v6 = (((unint64_t)a3->var0 - 8) / 0x28);
    v7 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v6];
    p_var3 = &a3->var2[0].var3;
    while (1)
    {
      uint64_t v9 = *(p_var3 - 8);
      if (!(_DWORD)v9) {
        goto LABEL_15;
      }
      int v10 = *(p_var3 - 7);
      if ((v10 & 1) != 0) {
        break;
      }
      if ((v10 & 2) != 0)
      {
        uint64_t v12 = [MEMORY[0x189607968] numberWithDouble:*((double *)p_var3 - 3)];
LABEL_12:
        v11 = (void *)v12;
        if (v12) {
          goto LABEL_13;
        }
        goto LABEL_15;
      }

      if ((v10 & 4) != 0)
      {
        v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:p_var3 - 6 length:*p_var3];
        if (v11)
        {
LABEL_13:
          [MEMORY[0x189607968] numberWithUnsignedInt:v9];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 setObject:v11 forKeyedSubscript:v13];
        }
      }

void __53__NWStatisticsManager_handleSystemInformationCounts___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidated] & 1) == 0)
  {
    [*(id *)(a1 + 32) delegate];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = (void *)MEMORY[0x1895BB0FC]();
      [v3 statisticsManager:*(void *)(a1 + 32) didReceiveDirectSystemInformation:*(void *)(a1 + 40)];
      objc_autoreleasePoolPop(v2);
    }
  }

- (void)reportInternalCounts
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  NStatGetLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t numSourceAddsReceived = self->_numSourceAddsReceived;
    unint64_t numSourcesInserted = self->_numSourcesInserted;
    unint64_t numSourcesRemoved = self->_numSourcesRemoved;
    uint64_t v7 = -[NSMutableDictionary count](self->__internalSources, "count");
    unint64_t numSourceAddsSkipped = self->_numSourceAddsSkipped;
    unint64_t numSourcesQueried = self->_numSourcesQueried;
    unint64_t numUpdatesDispatched = self->_numUpdatesDispatched;
    unint64_t numUpdatesSkipped = self->_numUpdatesSkipped;
    unint64_t numUpdatesLazyDispatched = self->_numUpdatesLazyDispatched;
    unint64_t numUpdatesLazySkipped = self->_numUpdatesLazySkipped;
    *(_DWORD *)buf = 134220544;
    v21 = self;
    __int16 v22 = 2048;
    unint64_t v23 = numSourceAddsReceived;
    __int16 v24 = 2048;
    unint64_t v25 = numSourcesInserted;
    __int16 v26 = 2048;
    unint64_t v27 = numSourcesRemoved;
    __int16 v28 = 2048;
    uint64_t v29 = v7;
    __int16 v30 = 2048;
    unint64_t v31 = numSourceAddsSkipped;
    __int16 v32 = 2048;
    unint64_t v33 = numSourcesQueried;
    __int16 v34 = 2048;
    unint64_t v35 = numUpdatesDispatched;
    __int16 v36 = 2048;
    unint64_t v37 = numUpdatesSkipped;
    __int16 v38 = 2048;
    unint64_t v39 = numUpdatesLazyDispatched;
    __int16 v40 = 2048;
    unint64_t v41 = numUpdatesLazySkipped;
    _os_log_impl( &dword_187FF5000,  v3,  OS_LOG_TYPE_DEBUG,  "Manager %p: source kernel added msgs %lld insert %lld remove %lld dict %lld skip %lld query %lld, updates dispatch ed %lld skipped %lld lazy %lld lazy skip %lld",  buf,  0x70u);
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    -[NSMutableDictionary count](self->__internalSources, "count");
    NStatMgrTraceF( self,  "%s Manager %p: source kernel added msgs %lld insert %lld remove %lld dict %lld skip %lld query %lld, updates dispa tched %lld skipped %lld lazy %lld lazy skip %lld",  v14,  v15,  v16,  v17,  v18,  v19,  (char)"-[NWStatisticsManager reportInternalCounts]");
  }

- (void)dispatchDidAddSource:(id)a3
{
  id v4 = a3;
  -[NWStatisticsManager clientQueue](self, "clientQueue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __44__NWStatisticsManager_dispatchDidAddSource___block_invoke;
  v7[3] = &unk_18A1B6330;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__NWStatisticsManager_dispatchDidAddSource___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1895BB0FC]();
    [v3 statisticsManager:*(void *)(a1 + 32) didAddSource:*(void *)(a1 + 40)];
    objc_autoreleasePoolPop(v2);
  }
}

- (void)dispatchDidReceiveDescription:(id)a3
{
  id v4 = a3;
  -[NWStatisticsManager clientQueue](self, "clientQueue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__NWStatisticsManager_dispatchDidReceiveDescription___block_invoke;
  block[3] = &unk_18A1B6358;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __53__NWStatisticsManager_dispatchDidReceiveDescription___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) removing] & 1) == 0)
  {
    [*(id *)(a1 + 32) delegate];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = (void *)MEMORY[0x1895BB0FC]();
      [v3 sourceDidReceiveDescription:*(void *)(a1 + 32)];
      objc_autoreleasePoolPop(v2);
    }
  }

- (void)dispatchDidReceiveCounts:(id)a3 fromUpdate:(BOOL)a4
{
  id v5 = a3;
  -[NWStatisticsManager clientQueue](self, "clientQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__NWStatisticsManager_dispatchDidReceiveCounts_fromUpdate___block_invoke;
  block[3] = &unk_18A1B6358;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __59__NWStatisticsManager_dispatchDidReceiveCounts_fromUpdate___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) removing] & 1) == 0)
  {
    [*(id *)(a1 + 32) delegate];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = (void *)MEMORY[0x1895BB0FC]();
      [v3 sourceDidReceiveCounts:*(void *)(a1 + 32)];
      objc_autoreleasePoolPop(v2);
    }
  }

- (void)dispatchDidReceiveType:(unsigned int)a3 source:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0x2713u:
      id v10 = v6;
      -[NWStatisticsManager dispatchDidReceiveDescription:](self, "dispatchDidReceiveDescription:", v6);
LABEL_8:
      id v6 = v10;
      break;
    case 0x2714u:
      id v7 = self;
      id v10 = v6;
      id v8 = v6;
      uint64_t v9 = 0LL;
      goto LABEL_7;
    case 0x2716u:
      id v10 = v6;
      -[NWStatisticsManager dispatchDidReceiveDescription:](self, "dispatchDidReceiveDescription:", v6);
      id v7 = self;
      id v8 = v10;
      uint64_t v9 = 1LL;
LABEL_7:
      -[NWStatisticsManager dispatchDidReceiveCounts:fromUpdate:](v7, "dispatchDidReceiveCounts:fromUpdate:", v8, v9);
      goto LABEL_8;
  }
}

- (void)sendRequestMessage:(int)a3 sourceRef:(unint64_t)a4
{
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (a4 == -1LL) {
    -[NWStatisticsManager sendRequestMessage:sourceRef:].cold.1();
  }
  if (!-[NWStatisticsManager isInvalidated](self, "isInvalidated"))
  {
    v8[0] = 0LL;
    v8[1] = a3;
    v8[2] = a4;
    -[NWStatisticsManager sendMessage:length:](self, "sendMessage:length:", v8, 24LL);
  }

- (void)handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  unsigned int type = a3->type;
  switch(type)
  {
    case 0x2711u:
      if ((unint64_t)a4 >= 0x20)
      {
        unsigned int mgrflags = self->_mgrflags;
        if ((mgrflags & 0x20) != 0)
        {
          ++self->_numSourceAddsSkipped;
          if ((mgrflags & 0x40) != 0)
          {
            ++self->_numSourcesQueried;
            -[NWStatisticsManager sendRequestMessage:sourceRef:]( self,  "sendRequestMessage:sourceRef:",  1007LL,  a3[1].context);
          }
        }

        else
        {
          +[NWStatisticsSource createSourceForProvider:srcRef:manager:]( &OBJC_CLASS___NWStatisticsSource,  "createSourceForProvider:srcRef:manager:",  a3[1].type,  a3[1].context,  self);
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            -[NWStatisticsManager _internalSources](self, "_internalSources");
            unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x189607968] numberWithUnsignedLongLong:a3[1].context];
            __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v25 setObject:v24 forKey:v26];

            ++self->_numSourcesInserted;
            -[NWStatisticsManager dispatchDidAddSource:](self, "dispatchDidAddSource:", v24);
          }

          else
          {
            -[NWStatisticsManager sendRemoveSourceInternal:](self, "sendRemoveSourceInternal:", a3[1].context);
          }
        }
      }

      unint64_t v50 = self->_numSourceAddsReceived + 1;
      self->_unint64_t numSourceAddsReceived = v50;
      if ((self->_mgrflags & 0x10) != 0 && !(v50 % 0x64)) {
        -[NWStatisticsManager reportInternalCounts](self, "reportInternalCounts");
      }
      return;
    case 0x2712u:
    case 0x2713u:
    case 0x2714u:
    case 0x2716u:
      unint64_t context = a3[1].context;
      -[NWStatisticsManager _internalSources](self, "_internalSources");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithUnsignedLongLong:context];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectForKey:v10];
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      unsigned int v11 = a3->type;
      if (v11 == 10002)
      {
        uint64_t v12 = v57;
        if (v57)
        {
          -[NWStatisticsManager removeSourceInternal:isFromClient:]( self,  "removeSourceInternal:isFromClient:",  context,  0LL);
LABEL_6:

          return;
        }
      }

      else
      {
        uint64_t v12 = v57;
        if (v57)
        {
          char v21 = [v57 removing];
          uint64_t v12 = v57;
          if ((v21 & 1) == 0)
          {
            int v22 = [v57 handleMessage:a3 length:a4];
            uint64_t v12 = v57;
            if (v22)
            {
              if ((self->_mgrflags & 8) == 0 || (a3->flags & 4) == 0)
              {
                ++self->_numUpdatesDispatched;
                -[NWStatisticsManager dispatchDidReceiveType:source:]( self,  "dispatchDidReceiveType:source:",  a3->type,  v57);
                goto LABEL_6;
              }

              ++self->_numUpdatesSkipped;
            }
          }
        }

        else
        {
          if (v11 == 10003)
          {
            v44 = a3 + 2;
          }

          else
          {
            if (v11 != 10006) {
              goto LABEL_63;
            }
            v44 = a3 + 9;
          }

          uint64_t context_low = LODWORD(v44->context);
          if ((context_low - 11) >= 0xFFFFFFF6
            && ((self->_providerFilters[context_low] & 0x100000) != 0 || (self->_mgrflags & 0x20) != 0))
          {
            v46 = +[NWStatisticsSource createSourceForProvider:srcRef:manager:]( &OBJC_CLASS___NWStatisticsSource,  "createSourceForProvider:srcRef:manager:");
            if (v46)
            {
              v47 = -[NWStatisticsManager _internalSources](self, "_internalSources");
              [MEMORY[0x189607968] numberWithUnsignedLongLong:context];
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              [v47 setObject:v46 forKey:v48];

              ++self->_numSourcesInserted;
              int v49 = [v46 handleMessage:a3 length:a4];
              -[NWStatisticsManager dispatchDidAddSource:](self, "dispatchDidAddSource:", v46);
              if (v49)
              {
                if ((self->_mgrflags & 8) != 0 && (a3->flags & 4) != 0)
                {
                  ++self->_numUpdatesLazySkipped;
                }

                else
                {
                  ++self->_numUpdatesLazyDispatched;
                  -[NWStatisticsManager dispatchDidReceiveType:source:]( self,  "dispatchDidReceiveType:source:",  a3->type,  v46);
                }
              }
            }

            goto LABEL_6;
          }
        }
      }

- (void)handleReadEvent
{
  id v3 = (void *)MEMORY[0x1895BB0FC](self, a2);
  ssize_t v4 = recv( -[NWStatisticsManager sockfd](self, "sockfd"),  -[NWStatisticsManager readBuffer](self, "readBuffer"),  0x1000uLL,  0);
  if (v4 >= 1)
  {
    for (ssize_t i = v4;
          i > 0;
          ssize_t i = recv( -[NWStatisticsManager sockfd](self, "sockfd"),  -[NWStatisticsManager readBuffer](self, "readBuffer"),  0x1000uLL,  0))
    {
      id v6 = -[NWStatisticsManager readBuffer](self, "readBuffer");
      if ((unint64_t)i >= 0x10)
      {
        id v7 = v6;
        do
        {
          unint64_t v8 = *((unsigned __int16 *)v7 + 6);
          if ((self->_interfaceTraceFd & 0x80000000) == 0 && self->_iftracebuf) {
            -[NWStatisticsManager traceMemoryBuf:length:tag:]( self,  "traceMemoryBuf:length:tag:",  v7,  *((unsigned __int16 *)v7 + 6),  "Input");
          }
          if (!*(void *)v7
            || !-[NWStatisticsManager handleCompletionMessage:length:](self, "handleCompletionMessage:length:", v7, v8))
          {
            -[NWStatisticsManager handleMessage:length:](self, "handleMessage:length:", v7, v8);
          }

          v7 += v8;
          i -= v8;
        }

        while ((unint64_t)i > 0xF);
      }
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (void)startQueuedQuery
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary allKeys](self->_queuedQueryAlls, "allKeys");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 sortedArrayUsingSelector:sel_compare_];
  ssize_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [v4 description];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = [v6 UTF8String];
      _os_log_impl(&dword_187FF5000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: found keys %s", buf, 0x16u);
    }
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    id v7 = [v4 description];
    [v7 UTF8String];
    NStatMgrTraceF( self,  "%s Manager %p: found keys %s",  v8,  v9,  v10,  v11,  v12,  v13,  (char)"-[NWStatisticsManager startQueuedQuery]");
  }

  if (v4 && [v4 count])
  {
    [v4 objectAtIndexedSubscript:0];
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_queuedQueryAlls, "objectForKeyedSubscript:", v14);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    int v16 = (void *)MEMORY[0x1895BB270]();

    if (v16)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_queuedQueryAlls, "removeObjectForKey:", v14);
      currentQueries = self->_currentQueries;
      int v18 = (void *)MEMORY[0x1895BB270](v16);
      -[NSMutableDictionary setObject:forKey:](currentQueries, "setObject:forKey:", v18, v14);

      unint64_t v19 = [v14 unsignedLongLongValue];
      self->_currentQueryAllReference = v19;
      *(void *)&buf[8] = 0LL;
      *(_DWORD *)&buf[8] = -[NWStatisticsManager commandFromReference:](self, "commandFromReference:", v19);
      *(void *)buf = v19;
      *(void *)&buf[16] = -1LL;
      *(_WORD *)&buf[14] = 2;
      if (!-[NWStatisticsManager sendMessage:length:](self, "sendMessage:length:", buf, 24LL))
      {
        -[NWStatisticsManager handleCompletion:message:length:](self, "handleCompletion:message:length:", v19, 0LL, 0LL);
        NStatGetLog();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)unint64_t v27 = 134218240;
          __int16 v28 = self;
          __int16 v29 = 2048;
          unint64_t v30 = v19;
          _os_log_impl( &dword_187FF5000,  v20,  OS_LOG_TYPE_ERROR,  "Manager %p: Failure to send message with reference %llu",  v27,  0x16u);
        }

        if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0) {
          NStatMgrTraceF( self,  "%s Manager %p: Failure to send message with reference %llu",  v21,  v22,  v23,  v24,  v25,  v26,  (char)"-[NWStatisticsManager startQueuedQuery]");
        }
      }
    }
  }
}

- (BOOL)handleCompletion:(unint64_t)a3 message:(nstat_msg_hdr *)a4 length:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v47 = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_currentQueries, "objectForKey:", v9);
  uint64_t v10 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = (void *)MEMORY[0x1895BB270](v10);
      *(_DWORD *)buf = 134218496;
      uint64_t v42 = self;
      __int16 v43 = 2048;
      unint64_t v44 = a3;
      __int16 v45 = 2048;
      uint64_t v46 = (uint64_t)v12;
      _os_log_impl( &dword_187FF5000,  v11,  OS_LOG_TYPE_DEBUG,  "Manager %p: Called with reference %lld find completion %p",  buf,  0x20u);
    }
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    uint64_t v40 = (void *)MEMORY[0x1895BB270](v10);
    NStatMgrTraceF( self,  "%s Manager %p: Called with reference %lld find completion %p",  v13,  v14,  v15,  v16,  v17,  v18,  (char)"-[NWStatisticsManager handleCompletion:message:length:]");
  }

  if (v10)
  {
    char v19 = ((uint64_t (**)(void, nstat_msg_hdr *, uint64_t))v10)[2](v10, a4, v5);
    -[NSMutableDictionary removeObjectForKey:](self->_currentQueries, "removeObjectForKey:", v9);
    if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
    {
      NStatGetLog();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id v21 = -[NSMutableDictionary description](self->_currentQueries, "description");
        uint64_t v22 = [v21 UTF8String];
        *(_DWORD *)buf = 134218242;
        uint64_t v42 = self;
        __int16 v43 = 2080;
        unint64_t v44 = v22;
        _os_log_impl(&dword_187FF5000, v20, OS_LOG_TYPE_DEBUG, "Manager %p: after remove currentQueries %s", buf, 0x16u);
      }
    }

    if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
    {
      id v23 = -[NSMutableDictionary description](self->_currentQueries, "description");
      [v23 UTF8String];
      NStatMgrTraceF( self,  "%s Manager %p: after remove currentQueries %s",  v24,  v25,  v26,  v27,  v28,  v29,  (char)"-[NWStatisticsManager handleCompletion:message:length:]");
LABEL_19:
    }
  }

  else
  {
    NStatGetLog();
    unint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = -[NSMutableDictionary description](self->_currentQueries, "description");
      uint64_t v32 = [v31 UTF8String];
      *(_DWORD *)buf = 134218498;
      uint64_t v42 = self;
      __int16 v43 = 2048;
      unint64_t v44 = a3;
      __int16 v45 = 2080;
      uint64_t v46 = v32;
      _os_log_impl( &dword_187FF5000,  v30,  OS_LOG_TYPE_ERROR,  "Manager %p: can't find completion for key %lld, queries are %s",  buf,  0x20u);
    }

    if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
    {
      id v23 = -[NSMutableDictionary description](self->_currentQueries, "description");
      [v23 UTF8String];
      NStatMgrTraceF( self,  "%s Manager %p: can't find completion for key %lld, queries are %s",  v33,  v34,  v35,  v36,  v37,  v38,  (char)"-[NWStatisticsManager handleCompletion:message:length:]");
      char v19 = 0;
      goto LABEL_19;
    }

    char v19 = 0;
  }

  return v19;
}

- (BOOL)handleCompletionMessage:(nstat_msg_hdr *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (!a3->context) {
    return 0;
  }
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unint64_t context = a3->context;
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = context;
      _os_log_impl( &dword_187FF5000,  v8,  OS_LOG_TYPE_DEBUG,  "Manager %p: completion message with context %lld",  buf,  0x16u);
    }
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0) {
    NStatMgrTraceF( self,  "%s Manager %p: completion message with context %lld",  v10,  v11,  v12,  v13,  v14,  v15,  (char)"-[NWStatisticsManager handleCompletionMessage:length:]");
  }
  if (self->_currentQueryAllReference != a3->context) {
    return -[NWStatisticsManager handleCompletion:message:length:]( self,  "handleCompletion:message:length:",  a3->context,  a3,  v4);
  }
  if ((a3->flags & 2) == 0 || a3->type || self->_continuationCount > 0x27)
  {
    self->_continuationCount = 0;
    self->_currentQueryAllReference = 0LL;
    if (-[NSMutableDictionary count](self->_queuedQueryAlls, "count"))
    {
      if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
      {
        NStatGetLog();
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          id v26 = -[NSMutableDictionary description](self->_queuedQueryAlls, "description");
          uint64_t v27 = [v26 UTF8String];
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v27;
          _os_log_impl(&dword_187FF5000, v25, OS_LOG_TYPE_DEBUG, "Manager %p: found queued queries %s", buf, 0x16u);
        }
      }

      if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
      {
        id v28 = -[NSMutableDictionary description](self->_queuedQueryAlls, "description");
        [v28 UTF8String];
        NStatMgrTraceF( self,  "%s Manager %p: found queued queries %s",  v29,  v30,  v31,  v32,  v33,  v34,  (char)"-[NWStatisticsManager handleCompletionMessage:length:]");
      }

      -[NWStatisticsManager startQueuedQuery](self, "startQueuedQuery");
    }

    return -[NWStatisticsManager handleCompletion:message:length:]( self,  "handleCompletion:message:length:",  a3->context,  a3,  v4);
  }

  *(void *)&buf[8] = 0LL;
  *(_DWORD *)&buf[8] = -[NWStatisticsManager commandFromReference:](self, "commandFromReference:");
  *(void *)buf = a3->context;
  *(void *)&buf[16] = -1LL;
  *(_WORD *)&buf[14] = 2;
  ++self->_continuationCount;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v17 = a3->context;
      *(_DWORD *)uint64_t v35 = 134218240;
      uint64_t v36 = self;
      __int16 v37 = 2048;
      unint64_t v38 = v17;
      _os_log_impl( &dword_187FF5000,  v16,  OS_LOG_TYPE_DEBUG,  "Manager %p: sent continuation for completion message with context %lld",  v35,  0x16u);
    }
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0) {
    NStatMgrTraceF( self,  "%s Manager %p: sent continuation for completion message with context %lld",  v18,  v19,  v20,  v21,  v22,  v23,  (char)"-[NWStatisticsManager handleCompletionMessage:length:]");
  }
  return -[NWStatisticsManager sendMessage:length:](self, "sendMessage:length:", buf, 24LL);
}

- (BOOL)addSource:(id)a3 request:(nstat_msg_add_src *)a4 length:(unint64_t)a5
{
  id v8 = a3;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  if (v9)
  {
    dispatch_semaphore_t v10 = v9;
    a4->var0.unint64_t context = 0LL;
    -[NWStatisticsManager internalQueue](self, "internalQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __48__NWStatisticsManager_addSource_request_length___block_invoke;
    block[3] = &unk_18A1B63A8;
    void block[4] = self;
    id v12 = v8;
    id v18 = v12;
    uint64_t v13 = v10;
    uint64_t v19 = v13;
    uint64_t v20 = a4;
    unint64_t v21 = a5;
    dispatch_sync(v11, block);

    if (a4->var0.context)
    {
      dispatch_time_t v14 = dispatch_time(0LL, 10000000000LL);
      dispatch_semaphore_wait(v13, v14);
    }

    BOOL v15 = [v12 reference] != 0;
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __48__NWStatisticsManager_addSource_request_length___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _nextReferenceForTarget:0 command:1001];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __48__NWStatisticsManager_addSource_request_length___block_invoke_2;
    v12[3] = &unk_18A1B6380;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v13 = v4;
    uint64_t v14 = v5;
    id v15 = *(id *)(a1 + 48);
    id v6 = (void *)MEMORY[0x1895BB270](v12);
    id v7 = (void *)MEMORY[0x1895BB270]();
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v3];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_t v9 = *(void **)(*(void *)(a1 + 32) + 248LL);
    dispatch_semaphore_t v10 = (void *)MEMORY[0x1895BB270](v7);
    [v9 setObject:v10 forKey:v8];

    uint64_t v11 = *(void *)(a1 + 56);
    *(_DWORD *)(v11 + 8) = 1001;
    *(void *)uint64_t v11 = v3;
    objc_msgSend(*(id *)(a1 + 32), "sendMessage:length:");
  }

uint64_t __48__NWStatisticsManager_addSource_request_length___block_invoke_2( uint64_t a1,  uint64_t a2,  unsigned int a3)
{
  if (a3 >= 0x20 && *(_DWORD *)(a2 + 8) == 10001)
  {
    [*(id *)(a1 + 32) setReference:*(void *)(a2 + 16)];
    [*(id *)(a1 + 40) _internalSources];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v5, "reference"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v5 forKey:v6];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return 1LL;
}

- (void)sendRemoveSourceInternal:(unint64_t)a3
{
  v3[0] = 0LL;
  v3[1] = 1003LL;
  v3[2] = a3;
  -[NWStatisticsManager sendMessage:length:](self, "sendMessage:length:", v3, 24LL);
}

- (void)removeSourceInternal:(unint64_t)a3 isFromClient:(BOOL)a4
{
  BOOL v4 = a4;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatisticsManager _internalSources](self, "_internalSources");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKey:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8) {
    goto LABEL_13;
  }
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v9 = 5LL;
      goto LABEL_7;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v9 = 7LL;
LABEL_7:
      Class v10 = (&self->super.isa)[v9];
      -[NWStatisticsManager sendRemoveSourceInternal:](self, "sendRemoveSourceInternal:", [v8 reference]);
      if ((v10 & 0x100000) != 0)
      {
        [v8 setRemoving:1];
        goto LABEL_13;
      }

      goto LABEL_10;
    }

    -[NWStatisticsManager sendRemoveSourceInternal:](self, "sendRemoveSourceInternal:", [v8 reference]);
  }

void __57__NWStatisticsManager_removeSourceInternal_isFromClient___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1895BB0FC]();
    [v3 statisticsManager:*(void *)(a1 + 32) didRemoveSource:*(void *)(a1 + 40)];
    objc_autoreleasePoolPop(v2);
  }
}

- (void)subscribeToSystemInformation
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__NWStatisticsManager_subscribeToSystemInformation__block_invoke;
  block[3] = &unk_18A1B6358;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__NWStatisticsManager_subscribeToSystemInformation__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    __int128 v2 = xmmword_188024E60;
    return [*(id *)(result + 32) sendMessage:&v2 length:16];
  }

  return result;
}

- (BOOL)addAllForProvider:(int)a3 filter:(unint64_t)a4 events:(unint64_t)a5 pid:(int)a6 uuid:(unsigned __int8 *)(a7
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  if ((a3 - 2) >= 4 && a3 != 8) {
    __assert_rtn( "-[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]",  "NWStatisticsManager.m",  869,  "(provider == NSTAT_PROVIDER_TCP_KERNEL) || (provider == NSTAT_PROVIDER_TCP_USERLAND) || (provider == NSTAT_PROVIDE R_UDP_KERNEL) || (provider == NSTAT_PROVIDER_UDP_USERLAND) || (provider == NSTAT_PROVIDER_QUIC_USERLAND)");
  }
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __64__NWStatisticsManager_addAllForProvider_filter_events_pid_uuid___block_invoke;
  v16[3] = &unk_18A1B63D0;
  v16[6] = a4;
  v16[7] = a5;
  int v17 = a3;
  int v18 = a6;
  v16[8] = a7;
  v16[4] = self;
  void v16[5] = &v19;
  dispatch_sync(v13, v16);

  char v14 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v14;
}

void __64__NWStatisticsManager_addAllForProvider_filter_events_pid_uuid___block_invoke(uint64_t a1)
{
  v24[7] = *MEMORY[0x1895F89C0];
  __int128 v2 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)uint64_t v24 = 0u;
  LODWORD(v24[1]) = 1002;
  *(_OWORD *)&v24[2] = v2;
  memset(&v24[4], 0, 24);
  uint64_t v3 = *(void *)(a1 + 72);
  v24[4] = v3;
  BOOL v4 = *(_OWORD **)(a1 + 64);
  if (v4) {
    *(_OWORD *)&v24[5] = *v4;
  }
  *(void *)(*(void *)(a1 + 32) + 8LL * (int)v3 + 24) = v2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) sendMessage:v24 length:56];
  NStatGetLog();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
      uint64_t v9 = "success";
    }
    else {
      uint64_t v9 = "failure";
    }
    *(_DWORD *)buf = 134218754;
    uint64_t v17 = v8;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = v7;
    __int16 v22 = 2080;
    uint64_t v23 = v9;
    _os_log_impl( &dword_187FF5000,  v5,  OS_LOG_TYPE_INFO,  "Manager %p: add all for provider %d filter 0x%llx returns %s",  buf,  0x26u);
  }

  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
    NStatMgrTraceF( *(void **)(a1 + 32),  "%s Manager %p: add all for provider %d filter 0x%llx returns %s",  v10,  v11,  v12,  v13,  v14,  v15,  (char)"-[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]_block_invoke");
  }
}

- (BOOL)addAllTCP:(unint64_t)a3 events:(unint64_t)a4 pid:(int)a5 uuid:(unsigned __int8 *)(a6
{
  uint64_t v8 = -805306369LL;
  if (!a5) {
    uint64_t v8 = -855638017LL;
  }
  unint64_t v9 = v8 & a3;
  if (a6) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v9 & 0xFFFFFFFFC3FFFFFFLL;
  }
  if (a6) {
    BOOL v11 = (a3 & 0xC000000) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    uint64_t v12 = 0LL;
  }
  else {
    uint64_t v12 = a6;
  }
  if (a5) {
    BOOL v13 = (a3 & 0x3000000) == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = a5;
  }
  if ((a3 & 0x30000000) != 0) {
    unint64_t v15 = a3 & 0x30000000;
  }
  else {
    unint64_t v15 = 805306368LL;
  }
  BOOL v16 = (v15 & 0x10000000) == 0
     || -[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]( self,  "addAllForProvider:filter:events:pid:uuid:",  2LL,  v10,  a4,  v14,  v12);
  if (v15 >> 29 && v16) {
    LOBYTE(v16) = -[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]( self,  "addAllForProvider:filter:events:pid:uuid:",  3LL,  v10,  a4,  v14,  v12);
  }
  return v16;
}

- (BOOL)addAllUDP:(unint64_t)a3 events:(unint64_t)a4 pid:(int)a5 uuid:(unsigned __int8 *)(a6
{
  uint64_t v8 = -1879048193LL;
  if (!a5) {
    uint64_t v8 = -1929379841LL;
  }
  unint64_t v9 = v8 & a3;
  if (a6) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v9 & 0xFFFFFFFF83FFFFFFLL;
  }
  if (a6) {
    BOOL v11 = (a3 & 0xC000000) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    uint64_t v12 = 0LL;
  }
  else {
    uint64_t v12 = a6;
  }
  if (a5) {
    BOOL v13 = (a3 & 0x3000000) == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = a5;
  }
  if ((a3 & 0x70000000) != 0) {
    unint64_t v15 = a3 & 0x70000000;
  }
  else {
    unint64_t v15 = 1879048192LL;
  }
  if ((v15 & 0x10000000) != 0)
  {
    BOOL v16 = -[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]( self,  "addAllForProvider:filter:events:pid:uuid:",  4LL,  v10,  a4,  v14,  v12);
    if ((v15 & 0x20000000) == 0) {
      goto LABEL_27;
    }
  }

  else
  {
    BOOL v16 = 1;
    if ((v15 & 0x20000000) == 0) {
      goto LABEL_27;
    }
  }

  if (v16) {
    BOOL v16 = -[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]( self,  "addAllForProvider:filter:events:pid:uuid:",  5LL,  v10,  a4,  v14,  v12);
  }
LABEL_27:
  if (v15 >> 30 && v16) {
    LOBYTE(v16) = -[NWStatisticsManager addAllForProvider:filter:events:pid:uuid:]( self,  "addAllForProvider:filter:events:pid:uuid:",  8LL,  v10,  a4,  v14,  v12);
  }
  return v16;
}

- (BOOL)addAllTCP:(unint64_t)a3
{
  return -[NWStatisticsManager addAllTCP:events:pid:uuid:](self, "addAllTCP:events:pid:uuid:", a3, 0LL, 0LL, 0LL);
}

- (BOOL)addAllUDP:(unint64_t)a3
{
  return -[NWStatisticsManager addAllUDP:events:pid:uuid:](self, "addAllUDP:events:pid:uuid:", a3, 0LL, 0LL, 0LL);
}

- (BOOL)addAllRoute:(unint64_t)a3
{
  BOOL v4 = self;
  uint64_t v8 = 0LL;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__NWStatisticsManager_addAllRoute___block_invoke;
  block[3] = &unk_18A1B63F8;
  void block[5] = &v8;
  block[6] = a3;
  void block[4] = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

void __35__NWStatisticsManager_addAllRoute___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v15 = 0u;
  uint64_t v18 = 0LL;
  DWORD2(v15) = 1002;
  LODWORD(v17) = 1;
  *(void *)&__int128 v16 = *(void *)(a1 + 48);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) sendMessage:&v15 length:56];
  NStatGetLog();
  __int128 v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
      BOOL v4 = "success";
    }
    else {
      BOOL v4 = "failure";
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v12 = v3;
    __int16 v13 = 2080;
    uint64_t v14 = v4;
    _os_log_impl(&dword_187FF5000, v2, OS_LOG_TYPE_DEBUG, "Manager %p: add all routes returns %s", buf, 0x16u);
  }

  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
    NStatMgrTraceF( *(void **)(a1 + 32),  "%s Manager %p: add all routes returns %s",  v5,  v6,  v7,  v8,  v9,  v10,  (char)"-[NWStatisticsManager addAllRoute:]_block_invoke");
  }
}

- (BOOL)addAllRoute
{
  return -[NWStatisticsManager addAllRoute:](self, "addAllRoute:", 0LL);
}

- (void)removeSource:(id)a3
{
  uint64_t v4 = [a3 reference];
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __36__NWStatisticsManager_removeSource___block_invoke;
  v6[3] = &unk_18A1B6420;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(v5, v6);
}

uint64_t __36__NWStatisticsManager_removeSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSourceInternal:*(void *)(a1 + 40) isFromClient:1];
}

- (unint64_t)_nextReferenceForTarget:(unint64_t)a3 command:(unsigned int)a4
{
  unint64_t v4 = self->_querySequenceNumber + 1;
  self->_querySequenceNumber = v4;
  unint64_t v5 = 4 * v4;
  unint64_t v6 = v5 | 2;
  uint64_t v7 = v5 | 1;
  uint64_t v8 = v5 | 3;
  if (a4 != 1007) {
    uint64_t v8 = v5;
  }
  if (a4 != 1005) {
    uint64_t v7 = v8;
  }
  if (a4 != 1004) {
    unint64_t v6 = v7;
  }
  if (a3 == -1LL) {
    return v6;
  }
  else {
    return v5;
  }
}

- (unsigned)commandFromReference:(unint64_t)a3
{
  if ((a3 & 3) == 2) {
    unsigned int v3 = 1004;
  }
  else {
    unsigned int v3 = 1007;
  }
  if ((a3 & 3) == 1) {
    return 1005;
  }
  else {
    return v3;
  }
}

- (BOOL)performQuery:(unsigned int)a3 sourceRef:(unint64_t)a4 completion:(id)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 0;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = "NSTAT_MSG_TYPE_GET_SRC_DESC";
      char v11 = "UNKNOWN -???";
      if (a3 == 1007) {
        char v11 = "NSTAT_MSG_TYPE_GET_UPDATE";
      }
      if (a3 != 1005) {
        uint64_t v10 = v11;
      }
      if (a3 == 1004) {
        uint64_t v12 = "NSTAT_MSG_TYPE_QUERY_SRC";
      }
      else {
        uint64_t v12 = v10;
      }
      __int16 v13 = (void *)MEMORY[0x1895BB270](v8);
      *(_DWORD *)buf = 134218754;
      unint64_t v38 = self;
      __int16 v39 = 2080;
      uint64_t v40 = v12;
      __int16 v41 = 2048;
      unint64_t v42 = a4;
      __int16 v43 = 2048;
      unint64_t v44 = v13;
      _os_log_impl( &dword_187FF5000,  v9,  OS_LOG_TYPE_DEBUG,  "Manager %p: Entry command %s  source ref %llu completion %p",  buf,  0x2Au);
    }
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    uint64_t v25 = (void *)MEMORY[0x1895BB270](v8);
    NStatMgrTraceF( self,  "%s Manager %p: Entry command %s  source ref %llu completion %p",  v14,  v15,  v16,  v17,  v18,  v19,  (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]");
  }

  -[NWStatisticsManager internalQueue](self, "internalQueue");
  __int16 v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v20);

  if (a4 == -1LL || v8)
  {
    -[NWStatisticsManager internalQueue](self, "internalQueue");
    __int16 v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2;
    v26[3] = &unk_18A1B64C0;
    v26[4] = self;
    unint64_t v29 = a4;
    unsigned int v30 = a3;
    id v27 = v8;
    id v28 = &v33;
    dispatch_sync(v22, v26);
  }

  else
  {
    -[NWStatisticsManager internalQueue](self, "internalQueue");
    uint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke;
    block[3] = &unk_18A1B6448;
    unsigned int v32 = a3;
    void block[4] = self;
    void block[5] = a4;
    dispatch_async(v21, block);

    *((_BYTE *)v34 + 24) = 1;
  }

  BOOL v23 = *((_BYTE *)v34 + 24) != 0;
  _Block_object_dispose(&v33, 8);

  return v23;
}

uint64_t __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendRequestMessage:*(unsigned int *)(a1 + 48) sourceRef:*(void *)(a1 + 40)];
}

void __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  uint64_t v2 = [*(id *)(a1 + 32) _nextReferenceForTarget:*(void *)(a1 + 56) command:*(unsigned int *)(a1 + 64)];
  [MEMORY[0x189607968] numberWithUnsignedLongLong:v2];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = MEMORY[0x1895F87A8];
  v74[1] = 3221225472LL;
  v74[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_3;
  v74[3] = &unk_18A1B6498;
  unint64_t v4 = *(void **)(a1 + 40);
  v74[4] = *(void *)(a1 + 32);
  uint64_t v76 = v2;
  id v75 = v4;
  unint64_t v5 = (void *)MEMORY[0x1895BB270](v74);
  unint64_t v6 = (void *)MEMORY[0x1895BB270]();
  if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
  {
    NStatGetLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = *(id **)(a1 + 32);
      uint64_t v9 = (void *)MEMORY[0x1895BB270](v5);
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134218752;
      v78 = v8;
      __int16 v79 = 2048;
      *(void *)v80 = v9;
      *(_WORD *)&v80[8] = 2048;
      *(void *)&v80[10] = v2;
      *(_WORD *)&v80[18] = 2048;
      *(void *)&v80[20] = v10;
      _os_log_impl( &dword_187FF5000,  v7,  OS_LOG_TYPE_DEBUG,  "Manager %p: Outer completion block %p for ref %lld  src %llu",  buf,  0x2Au);
    }
  }

  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0)
  {
    char v11 = *(void **)(a1 + 32);
    uint64_t v12 = (void *)MEMORY[0x1895BB270](v5);
    NStatMgrTraceF( v11,  "%s Manager %p: Outer completion block %p for ref %lld  src %llu",  v13,  v14,  v15,  v16,  v17,  v18,  (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
  }

  if (*(void *)(a1 + 56) != -1LL) {
    goto LABEL_8;
  }
  uint64_t v51 = [*(id *)(a1 + 32) currentQueryAllReference];
  uint64_t v52 = *(void **)(a1 + 32);
  if (!v51)
  {
    [v52 setCurrentQueryAllReference:v2];
    uint64_t v69 = *(void **)(*(void *)(a1 + 32) + 248LL);
    uint64_t v70 = (void *)MEMORY[0x1895BB270](v6);
    [v69 setObject:v70 forKey:v3];

LABEL_8:
    if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
    {
      NStatGetLog();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        __int16 v20 = *(void **)(a1 + 32);
        uint64_t v21 = [v20 currentQueryAllReference];
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v24 = *(void *)(v22 + 248);
        uint64_t v23 = *(void *)(v22 + 256);
        *(_DWORD *)buf = 134218754;
        v78 = (id *)v20;
        __int16 v79 = 2048;
        *(void *)v80 = v21;
        *(_WORD *)&v80[8] = 2112;
        *(void *)&v80[10] = v24;
        *(_WORD *)&v80[18] = 2112;
        *(void *)&v80[20] = v23;
        _os_log_impl( &dword_187FF5000,  v19,  OS_LOG_TYPE_DEBUG,  "Manager %p: currentQueryAllReference %llu current %@, pending %@",  buf,  0x2Au);
      }
    }

    if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0)
    {
      uint64_t v25 = *(void **)(a1 + 32);
      [v25 currentQueryAllReference];
      NStatMgrTraceF( v25,  "%s Manager %p: currentQueryAllReference %llu current %@, pending %@",  v26,  v27,  v28,  v29,  v30,  v31,  (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
    }

    if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
    {
      NStatGetLog();
      unsigned int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v33 = *(id **)(a1 + 32);
        int v34 = *(_DWORD *)(a1 + 64);
        uint64_t v35 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 134219008;
        v78 = v33;
        __int16 v79 = 1024;
        *(_DWORD *)v80 = v34;
        *(_WORD *)&v80[4] = 2048;
        *(void *)&v80[6] = v2;
        *(_WORD *)&v80[14] = 2048;
        *(void *)&v80[16] = v35;
        *(_WORD *)&v80[24] = 1024;
        *(_DWORD *)&v80[26] = 0;
        _os_log_impl( &dword_187FF5000,  v32,  OS_LOG_TYPE_DEBUG,  "Manager %p: about to prepare message %x context %lld srcef %llu, prev pended %d",  buf,  0x2Cu);
      }
    }

    if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
      NStatMgrTraceF( *(void **)(a1 + 32),  "%s Manager %p: about to prepare message %x context %lld srcef %llu, prev pended %d",  v36,  v37,  v38,  v39,  v40,  v41,  (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
    }
    unsigned int v42 = *(_DWORD *)(a1 + 64);
    uint64_t v71 = v2;
    uint64_t v72 = v42;
    uint64_t v73 = *(void *)(a1 + 56);
    if (v73 == -1)
    {
      HIWORD(v72) = 2;
      if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
      {
        NStatGetLog();
        __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v44 = *(id **)(a1 + 32);
          *(_DWORD *)buf = 134218752;
          v78 = v44;
          __int16 v79 = 1024;
          *(_DWORD *)v80 = v42;
          *(_WORD *)&v80[4] = 2048;
          *(void *)&v80[6] = v2;
          *(_WORD *)&v80[14] = 2048;
          *(void *)&v80[16] = -1LL;
          _os_log_impl( &dword_187FF5000,  v43,  OS_LOG_TYPE_DEBUG,  "Manager %p: about to send message %x context %lld srcef %llu",  buf,  0x26u);
        }
      }

      if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
        NStatMgrTraceF( *(void **)(a1 + 32),  "%s Manager %p: about to send message %x context %lld srcef %llu",  v45,  v46,  v47,  v48,  v49,  v50,  (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
      }
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) sendMessage:&v71 length:24];
    goto LABEL_36;
  }

  uint64_t v53 = (void *)v52[32];
  uint64_t v54 = (void *)MEMORY[0x1895BB270](v6);
  [v53 setObject:v54 forKey:v3];

  if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
  {
    NStatGetLog();
    uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v56 = *(id **)(a1 + 32);
      int v57 = *(_DWORD *)(a1 + 64);
      uint64_t v58 = *(void *)(a1 + 56);
      id v59 = [v56[32] description];
      uint64_t v60 = [v59 UTF8String];
      *(_DWORD *)buf = 134219010;
      v78 = v56;
      __int16 v79 = 1024;
      *(_DWORD *)v80 = v57;
      *(_WORD *)&v80[4] = 2048;
      *(void *)&v80[6] = v2;
      *(_WORD *)&v80[14] = 2048;
      *(void *)&v80[16] = v58;
      *(_WORD *)&v80[24] = 2080;
      *(void *)&v80[26] = v60;
      _os_log_impl( &dword_187FF5000,  v55,  OS_LOG_TYPE_DEBUG,  "Manager %p: set pended for message %x context %lld srcef %llu dictionary %s",  buf,  0x30u);
    }
  }

  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0)
  {
    v61 = *(id **)(a1 + 32);
    id v62 = [v61[32] description];
    [v62 UTF8String];
    NStatMgrTraceF( v61,  "%s Manager %p: set pended for message %x context %lld srcef %llu dictionary %s",  v63,  v64,  v65,  v66,  v67,  v68,  (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
LABEL_36:
}

uint64_t __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_3( uint64_t a1,  uint64_t a2,  int a3)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
  {
    NStatGetLog();
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = (void *)MEMORY[0x1895BB270](*(void *)(a1 + 40));
      *(_DWORD *)buf = 134219008;
      uint64_t v42 = v8;
      __int16 v43 = 2048;
      uint64_t v44 = v7;
      __int16 v45 = 2048;
      uint64_t v46 = a2;
      __int16 v47 = 1024;
      int v48 = a3;
      __int16 v49 = 2048;
      uint64_t v50 = v9;
      _os_log_impl( &dword_187FF5000,  v6,  OS_LOG_TYPE_DEBUG,  "Manager %p: Outer completion block called, for ref %lld, msg %p len %d completion %p",  buf,  0x30u);
    }
  }

  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v38 = (void *)MEMORY[0x1895BB270](*(void *)(a1 + 40));
    NStatMgrTraceF( v10,  "%s Manager %p: Outer completion block called, for ref %lld, msg %p len %d completion %p",  v11,  v12,  v13,  v14,  v15,  v16,  (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
  }

  [*(id *)(a1 + 32) clientQueue];
  uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  if (!v17) {
    goto LABEL_23;
  }
  if (a2 && *(_DWORD *)(a2 + 8) > 1u)
  {
    NStatGetLog();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      int v30 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)buf = 134218240;
      uint64_t v42 = v29;
      __int16 v43 = 1024;
      LODWORD(v44) = v30;
      _os_log_impl( &dword_187FF5000,  v28,  OS_LOG_TYPE_ERROR,  "Manager %p: Outer completion block called, type mismatch %d",  buf,  0x12u);
    }

    if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
      NStatMgrTraceF( *(void **)(a1 + 32),  "%s Manager %p: Outer completion block called, type mismatch %d",  v31,  v32,  v33,  v34,  v35,  v36,  (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
    }
LABEL_23:
    uint64_t v27 = 0LL;
    goto LABEL_24;
  }

  if (([*(id *)(a1 + 32) mgrflags] & 0x10) != 0)
  {
    NStatGetLog();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      uint64_t v42 = v19;
      __int16 v43 = 2048;
      uint64_t v44 = a2;
      _os_log_impl( &dword_187FF5000,  v18,  OS_LOG_TYPE_DEBUG,  "Manager %p: Outer completion block ready to dispatch async to inner block, msg %p",  buf,  0x16u);
    }
  }

  if (([*(id *)(a1 + 32) mgrflags] & 0x80) != 0) {
    NStatMgrTraceF( *(void **)(a1 + 32),  "%s Manager %p: Outer completion block ready to dispatch async to inner block, msg %p",  v20,  v21,  v22,  v23,  v24,  v25,  (char)"-[NWStatisticsManager performQuery:sourceRef:completion:]_block_invoke");
  }
  uint64_t v26 = *(void **)(a1 + 40);
  if (v26)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2_47;
    block[3] = &unk_18A1B6470;
    void block[4] = *(void *)(a1 + 32);
    id v40 = v26;
    dispatch_async(v17, block);
  }

  uint64_t v27 = 1LL;
LABEL_24:

  return v27;
}

uint64_t __57__NWStatisticsManager_performQuery_sourceRef_completion___block_invoke_2_47(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isInvalidated];
  if ((result & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  return result;
}

- (void)queryAllCounts:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  unint64_t v4 = (void (**)(void))a3;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v6 = (void *)MEMORY[0x1895BB270](v4);
      *(_DWORD *)buf = 134218240;
      uint64_t v15 = self;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      _os_log_impl(&dword_187FF5000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Query all counts, completion %p", buf, 0x16u);
    }
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    uint64_t v13 = (void *)MEMORY[0x1895BB270](v4);
    NStatMgrTraceF( self,  "%s Manager %p: Query all counts, completion %p",  v7,  v8,  v9,  v10,  v11,  v12,  (char)"-[NWStatisticsManager queryAllCounts:]");
  }

  if (-[NWStatisticsManager isInvalidated](self, "isInvalidated"))
  {
    if (v4) {
      v4[2](v4);
    }
  }

  else
  {
    -[NWStatisticsManager performQuery:sourceRef:completion:]( self,  "performQuery:sourceRef:completion:",  1004LL,  -1LL,  v4);
  }
}

- (void)queryAllDescriptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  unint64_t v4 = (void (**)(void))a3;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v6 = (void *)MEMORY[0x1895BB270](v4);
      *(_DWORD *)buf = 134218240;
      uint64_t v15 = self;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      _os_log_impl( &dword_187FF5000,  v5,  OS_LOG_TYPE_DEBUG,  "Manager %p: Query all descriptions, completion %p",  buf,  0x16u);
    }
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    uint64_t v13 = (void *)MEMORY[0x1895BB270](v4);
    NStatMgrTraceF( self,  "%s Manager %p: Query all descriptions, completion %p",  v7,  v8,  v9,  v10,  v11,  v12,  (char)"-[NWStatisticsManager queryAllDescriptions:]");
  }

  if (-[NWStatisticsManager isInvalidated](self, "isInvalidated"))
  {
    if (v4) {
      v4[2](v4);
    }
  }

  else
  {
    -[NWStatisticsManager performQuery:sourceRef:completion:]( self,  "performQuery:sourceRef:completion:",  1005LL,  -1LL,  v4);
  }
}

- (BOOL)queryAll:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  unint64_t v4 = (void (**)(void))a3;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v6 = (void *)MEMORY[0x1895BB270](v4);
      *(_DWORD *)buf = 134218240;
      uint64_t v17 = self;
      __int16 v18 = 2048;
      uint64_t v19 = v6;
      _os_log_impl(&dword_187FF5000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Query all update, completion %p", buf, 0x16u);
    }
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    uint64_t v15 = (void *)MEMORY[0x1895BB270](v4);
    NStatMgrTraceF( self,  "%s Manager %p: Query all update, completion %p",  v7,  v8,  v9,  v10,  v11,  v12,  (char)"-[NWStatisticsManager queryAll:]");
  }

  if (-[NWStatisticsManager isInvalidated](self, "isInvalidated"))
  {
    if (v4) {
      v4[2](v4);
    }
    BOOL v13 = 0;
  }

  else
  {
    BOOL v13 = -[NWStatisticsManager performQuery:sourceRef:completion:]( self,  "performQuery:sourceRef:completion:",  1007LL,  -1LL,  v4);
  }

  return v13;
}

- (void)querySource:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
  {
    NStatGetLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v6 reference];
      uint64_t v10 = (void *)MEMORY[0x1895BB270](v7);
      *(_DWORD *)buf = 134218752;
      uint64_t v19 = self;
      __int16 v20 = 2048;
      id v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = v9;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      _os_log_impl( &dword_187FF5000,  v8,  OS_LOG_TYPE_DEBUG,  "Manager %p: Query Source for %p, %llu  completion %p",  buf,  0x2Au);
    }
  }

  if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
  {
    [v6 reference];
    uint64_t v17 = (void *)MEMORY[0x1895BB270](v7);
    NStatMgrTraceF( self,  "%s Manager %p: Query Source for %p, %llu  completion %p",  v11,  v12,  v13,  v14,  v15,  v16,  (char)"-[NWStatisticsManager querySource:completion:]");
  }

  if (-[NWStatisticsManager isInvalidated](self, "isInvalidated"))
  {
    if (v7) {
      v7[2](v7);
    }
  }

  else
  {
    -[NWStatisticsManager performQuery:sourceRef:completion:]( self,  "performQuery:sourceRef:completion:",  1007,  [v6 reference],  v7);
  }
}

- (void)setQueuePriority:(int64_t)a3
{
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[NWStatisticsManager setQueuePriority:].cold.1();
  }
}

- (void)setMgrflags:(unsigned int)a3
{
  unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __35__NWStatisticsManager_setMgrflags___block_invoke;
  v6[3] = &unk_18A1B64E8;
  unsigned int v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

uint64_t __35__NWStatisticsManager_setMgrflags___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 204)) {
    *(_DWORD *)(v2 + 204) = defaultMgrFlags | v1;
  }
  return result;
}

- (void)setInterfaceTraceFd:(int)a3
{
  unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __43__NWStatisticsManager_setInterfaceTraceFd___block_invoke;
  v6[3] = &unk_18A1B64E8;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

void __43__NWStatisticsManager_setInterfaceTraceFd___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 112))
  {
    *(void *)(v2 + 112) = malloc(0x1000uLL);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  int v3 = *(_DWORD *)(v2 + 208);
  if ((v3 & 0x80000000) == 0)
  {
    close(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(_DWORD *)(v2 + 208) = *(_DWORD *)(a1 + 40);
  objc_sync_exit(obj);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__NWStatisticsManager_setDelegate___block_invoke;
  block[3] = &unk_18A1B6330;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

uint64_t __35__NWStatisticsManager_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if ((result & 1) != 0) {
    return [*(id *)(a1 + 32) subscribeToSystemInformation];
  }
  return result;
}

- (unsigned)filter
{
  return self->_filter;
}

- (NSSet)sources
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0LL;
  -[NWStatisticsManager internalQueue](self, "internalQueue");
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __30__NWStatisticsManager_sources__block_invoke;
  v6[3] = &unk_18A1B6510;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __30__NWStatisticsManager_sources__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x189604010];
  [*(id *)(a1 + 32) _internalSources];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 allValues];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v2 setWithArray:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)performAllCompletions:(id)a3
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __45__NWStatisticsManager_performAllCompletions___block_invoke;
  v4[3] = &unk_18A1B6560;
  v4[4] = self;
  id v3 = a3;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
  [v3 removeAllObjects];
}

void __45__NWStatisticsManager_performAllCompletions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)MEMORY[0x1895BB270](a3);
  [*(id *)(a1 + 32) clientQueue];
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__NWStatisticsManager_performAllCompletions___block_invoke_2;
  block[3] = &unk_18A1B6538;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __45__NWStatisticsManager_performAllCompletions___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)invalidate
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__NWStatisticsManager_invalidate__block_invoke;
  block[3] = &unk_18A1B6358;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __33__NWStatisticsManager_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(a1 + 32) readSource];
    id v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    [*(id *)(a1 + 32) setReadSource:0];
  }

  [*(id *)(a1 + 32) currentQueries];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [v5 currentQueries];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 performAllCompletions:v6];
  }

  [*(id *)(a1 + 32) setCurrentQueries:0];
  [*(id *)(a1 + 32) queuedQueryAlls];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    [v8 queuedQueryAlls];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 performAllCompletions:v9];
  }

  [*(id *)(a1 + 32) setQueuedQueryAlls:0];
  while (1)
  {
    [*(id *)(a1 + 32) _internalSources];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 count];

    if (!v11) {
      break;
    }
    [*(id *)(a1 + 32) _internalSources];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 allKeys];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v13 objectAtIndexedSubscript:0];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( *(id *)(a1 + 32),  "removeSourceInternal:isFromClient:",  objc_msgSend(v14, "unsignedLongLongValue"),  0);
  }

  objc_msgSend(*(id *)(a1 + 32), "set_internalSources:", 0);
  uint64_t v15 = *(_DWORD **)(a1 + 32);
  if ((v15[52] & 0x80000000) == 0)
  {
    uint64_t v16 = v15;
    objc_sync_enter(v16);
    *(_DWORD *)(*(void *)(a1 + 32) + 208LL) = -1;
    uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 112LL);
    if (v17)
    {
      free(v17);
      *(void *)(*(void *)(a1 + 32) + 112LL) = 0LL;
    }

    objc_sync_exit(v16);

    uint64_t v15 = *(_DWORD **)(a1 + 32);
  }

  return [v15 setInvalidated:1];
}

- (void)dealloc
{
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel((dispatch_source_t)readSource);
    uint64_t v4 = self->_readSource;
    self->_readSource = 0LL;
  }

  readBuffer = self->_readBuffer;
  if (readBuffer) {
    free(readBuffer);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWStatisticsManager;
  -[NWStatisticsManager dealloc](&v6, sel_dealloc);
}

- (NWStatisticsManager)initWithQueue:(id)a3
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (dispatch_queue_s *)a3;
  v72.receiver = self;
  v72.super_class = (Class)&OBJC_CLASS___NWStatisticsManager;
  objc_super v6 = -[NWStatisticsManager init](&v72, sel_init);
  id v7 = v6;
  id v8 = 0LL;
  if (v5 && v6)
  {
    id v9 = NStatGetLog();
    int v10 = socket(32, 2, 2);
    if (v10 == -1)
    {
LABEL_10:
      v7->_int sockfd = -1;
      NStatGetLog();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:].cold.1();
      }

LABEL_13:
      id v8 = 0LL;
      goto LABEL_14;
    }

    int v11 = v10;
    int v80 = 0;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    *(_OWORD *)__str = 0u;
    __int128 v75 = 0u;
    __strlcpy_chk();
    if (ioctl(v11, 0xC0644E03uLL, __str) == -1)
    {
LABEL_9:
      close(v11);
      goto LABEL_10;
    }

    *(_OWORD *)&v81[12] = 0uLL;
    *(_DWORD *)uint64_t v81 = 139296;
    *(void *)&v81[4] = *(unsigned int *)__str;
    int v82 = 0;
    if (connect(v11, (const sockaddr *)v81, 0x20u))
    {
      NStatGetLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:].cold.7();
      }
LABEL_8:

      goto LABEL_9;
    }

    int relative_priority_ptr = 0x20000;
    if (setsockopt(v11, 0xFFFF, 4098, &relative_priority_ptr, 4u) == -1)
    {
      NStatGetLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:].cold.2();
      }
      goto LABEL_8;
    }

    int v15 = fcntl(v11, 3, 0LL);
    if (fcntl(v11, 4, v15 | 4u) == -1)
    {
      NStatGetLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:].cold.3();
      }
      goto LABEL_8;
    }

    v7->_int sockfd = v11;
    uint64_t v16 = (char *)malloc(0x1000uLL);
    v7->_readBuffer = v16;
    if (!v16)
    {
      NStatGetLog();
      __int16 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:].cold.4();
      }

      close(v7->_sockfd);
      goto LABEL_13;
    }

    objc_storeStrong((id *)&v7->_clientQueue, a3);
    snprintf(__str, 0x3BuLL, "com.apple.network.statistics.manager.%p", v7);
    int relative_priority_ptr = 0;
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v5, &relative_priority_ptr);
    dispatch_queue_attr_make_with_qos_class(0LL, qos_class, relative_priority_ptr);
    __int16 v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v19 = dispatch_queue_create(__str, v18);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v19;

    id v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    internalSources = v7->__internalSources;
    v7->__internalSources = v21;

    uint64_t v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    currentQueries = v7->_currentQueries;
    v7->_currentQueries = v23;

    uint64_t v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    queuedQueryAlls = v7->_queuedQueryAlls;
    v7->_queuedQueryAlls = v25;

    uint64_t v27 = (dispatch_queue_s *)v7->_internalQueue;
    if (v27 && v7->__internalSources && v7->_currentQueries && v7->_queuedQueryAlls)
    {
      dispatch_source_t v28 = dispatch_source_create(MEMORY[0x1895F8B60], v7->_sockfd, 0LL, v27);
      readSource = v7->_readSource;
      v7->_readSource = (OS_dispatch_source *)v28;

      if (v7->_readSource)
      {
        do
        {
          unsigned int v30 = __ldxr(&mgrSeqno);
          unsigned int v31 = v30 + 1;
        }

        while (__stxr(v31, &mgrSeqno));
        v7->_uint64_t id = v31;
        v7->_interfaceTraceFd = -1;
        if (traceFilePrefix)
        {
          id v32 = objc_alloc_init(MEMORY[0x189607848]);
          [MEMORY[0x189603F90] localeWithLocaleIdentifier:@"en_US_POSIX"];
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v32 setLocale:v33];

          [v32 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
          [MEMORY[0x189604020] timeZoneForSecondsFromGMT:0];
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
          [v32 setTimeZone:v34];

          uint64_t v35 = (void *)NSString;
          uint64_t v36 = traceFilePrefix;
          uint64_t id = v7->_id;
          [MEMORY[0x189603F50] date];
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          [v32 stringFromDate:v38];
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 stringWithFormat:@"%@-%d.%@.trace", v36, id, v39];
          id v40 = (void *)objc_claimAutoreleasedReturnValue();

          id v41 = v40;
          int v42 = open((const char *)[v41 UTF8String], 513, 438);
          if (v42 < 0)
          {
            NStatGetLog();
            uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              -[NWStatisticsManager initWithQueue:].cold.6();
            }
          }

          else
          {
            int v43 = v42;
            v7->_iftracebuf = (char *)malloc(0x1000uLL);
            v7->_interfaceTraceFd = v43;
          }
        }

        v7->_unsigned int mgrflags = defaultMgrFlags;
        NStatGetLog();
        __int16 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          NStatGetLog();
          int v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)uint64_t v81 = 134218240;
          *(void *)&v81[4] = v7;
          *(_WORD *)&v81[12] = 2048;
          *(void *)&v81[14] = v48;
          _os_log_impl(&dword_187FF5000, v47, OS_LOG_TYPE_DEBUG, "Manager %p: Log object is at %p", v81, 0x16u);
        }

        if ((-[NWStatisticsManager mgrflags](v7, "mgrflags") & 0x80) != 0)
        {
          NStatGetLog();
          uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
          NStatMgrTraceF( v7,  "%s Manager %p: Log object is at %p",  v49,  v50,  v51,  v52,  v53,  v54,  (char)"-[NWStatisticsManager initWithQueue:]");
        }

        int sockfd = v7->_sockfd;
        uint64_t v56 = MEMORY[0x1895F87A8];
        int v57 = (dispatch_source_s *)v7->_readSource;
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __37__NWStatisticsManager_initWithQueue___block_invoke;
        handler[3] = &__block_descriptor_36_e5_v8__0l;
        int v71 = sockfd;
        dispatch_source_set_cancel_handler(v57, handler);
        uint64_t v58 = (dispatch_source_s *)v7->_readSource;
        v68[0] = v56;
        v68[1] = 3221225472LL;
        v68[2] = __37__NWStatisticsManager_initWithQueue___block_invoke_2;
        v68[3] = &unk_18A1B6358;
        id v59 = v7;
        uint64_t v69 = v59;
        dispatch_source_set_event_handler(v58, v68);
        dispatch_resume((dispatch_object_t)v7->_readSource);
        NStatGetLog();
        uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t v81 = 134218240;
          *(void *)&v81[4] = v59;
          *(_WORD *)&v81[12] = 2048;
          *(void *)&v81[14] = v59;
          _os_log_impl( &dword_187FF5000,  v60,  OS_LOG_TYPE_INFO,  "Manager %p: Created new NetworkStatistics manager at %p",  v81,  0x16u);
        }

        if ((-[NWStatisticsManager mgrflags](v59, "mgrflags") & 0x80) != 0) {
          NStatMgrTraceF( v59,  "%s Manager %p: Created new NetworkStatistics manager at %p",  v61,  v62,  v63,  v64,  v65,  v66,  (char)"-[NWStatisticsManager initWithQueue:]");
        }
        id v8 = v59;

        goto LABEL_35;
      }
    }

    else
    {
      NStatGetLog();
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[NWStatisticsManager initWithQueue:].cold.5();
      }
    }

    close(v7->_sockfd);
    id v8 = 0LL;
LABEL_35:
  }

uint64_t __37__NWStatisticsManager_initWithQueue___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t __37__NWStatisticsManager_initWithQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleReadEvent];
}

- (NWStatisticsManager)init
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = -[NWStatisticsManager initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (NWStatisticsManagerDelegate)delegate
{
  return (NWStatisticsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unsigned)mgrflags
{
  return self->_mgrflags;
}

- (int)interfaceTraceFd
{
  return self->_interfaceTraceFd;
}

- (int)interfaceSourceFd
{
  return self->_interfaceSourceFd;
}

- (void)setInterfaceSourceFd:(int)a3
{
  self->_interfaceSourceFd = a3;
}

- (OS_dispatch_source)readSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setReadSource:(id)a3
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

- (BOOL)isReading
{
  return self->_reading;
}

- (void)setReading:(BOOL)a3
{
  self->_reading = a3;
}

- (NSMutableDictionary)_internalSources
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)set_internalSources:(id)a3
{
}

- (NSMutableDictionary)currentQueries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setCurrentQueries:(id)a3
{
}

- (NSMutableDictionary)queuedQueryAlls
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setQueuedQueryAlls:(id)a3
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

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 288LL, 1);
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 296LL, 1);
}

- (id)strongDelegate
{
  return objc_getProperty(self, a2, 304LL, 1);
}

- (void)setStrongDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)traceMemoryBuf:(uint64_t)a1 length:(uint64_t)a2 tag:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl( &dword_187FF5000,  log,  OS_LOG_TYPE_DEBUG,  "save %s capacity limit for len %ld",  (uint8_t *)&v3,  0x16u);
}

- (void)sendRequestMessage:sourceRef:.cold.1()
{
  __assert_rtn( "-[NWStatisticsManager sendRequestMessage:sourceRef:]",  "NWStatisticsManager.m",  388,  "srcref != NSTAT_SRC_REF_ALL");
}

- (void)handleMessage:(uint64_t)a1 length:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = *(_DWORD *)(a1 + 16);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl( &dword_187FF5000,  a2,  OS_LOG_TYPE_DEBUG,  "error: %d, no quoted message in return",  (uint8_t *)v3,  8u);
  OUTLINED_FUNCTION_4();
}

- (void)setQueuePriority:.cold.1()
{
}

- (void)initWithQueue:.cold.1()
{
}

- (void)initWithQueue:.cold.2()
{
}

- (void)initWithQueue:.cold.3()
{
}

- (void)initWithQueue:.cold.4()
{
}

- (void)initWithQueue:.cold.5()
{
}

- (void)initWithQueue:.cold.6()
{
}

- (void)initWithQueue:.cold.7()
{
}

@end