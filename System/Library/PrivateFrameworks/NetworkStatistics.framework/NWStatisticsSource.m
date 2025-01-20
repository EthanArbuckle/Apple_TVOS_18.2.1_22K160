@interface NWStatisticsSource
+ (id)createSourceForProvider:(unsigned int)a3 srcRef:(unint64_t)a4 manager:(id)a5;
- (BOOL)_handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5;
- (BOOL)handleCounts:(const nstat_counts *)a3;
- (BOOL)handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4;
- (BOOL)removing;
- (NWStatisticsManager)manager;
- (NWStatisticsSource)init;
- (NWStatisticsSource)initWithManager:(id)a3 source:(unint64_t)a4 provider:(unsigned int)a5;
- (NWStatisticsSourceDelegate)delegate;
- (const)_nstat_counts;
- (id)_currentSnapshot;
- (id)currentSnapshot;
- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5;
- (unint64_t)countsSeqno;
- (unint64_t)descriptorSeqno;
- (unint64_t)reference;
- (unint64_t)snapshotRevision;
- (unint64_t)sourceIdentifier;
- (unsigned)provider;
- (void)queryCounts;
- (void)queryDescription;
- (void)queryUpdate;
- (void)setCountsSeqno:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptorSeqno:(unint64_t)a3;
- (void)setReference:(unint64_t)a3;
- (void)setRemoving:(BOOL)a3;
@end

@implementation NWStatisticsSource

- (NWStatisticsSource)init
{
  return 0LL;
}

+ (id)createSourceForProvider:(unsigned int)a3 srcRef:(unint64_t)a4 manager:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  else {
    v8 = off_18A1B65A0[(int)v6 - 1];
  }
  v9 = (void *)[objc_alloc(*v8) initWithManager:v7 source:a4 provider:v6];

  return v9;
}

- (unint64_t)sourceIdentifier
{
  return self->_reference;
}

- (unint64_t)snapshotRevision
{
  return self->_descriptorSeqno + self->_countsSeqno;
}

- (const)_nstat_counts
{
  return &self->_last_counts;
}

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  return 1;
}

- (BOOL)handleCounts:(const nstat_counts *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 internalQueue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[NWStatisticsSource countsSeqno](self, "countsSeqno"))
  {
    if (!memcmp(a3, &self->_last_counts, 0x70uLL))
    {
      v18 = -[NWStatisticsSource manager](self, "manager");
      char v19 = [v18 mgrflags];

      return (v19 & 2) == 0;
    }

    else
    {
      __int128 v7 = *(_OWORD *)&a3->nstat_rxpackets;
      __int128 v8 = *(_OWORD *)&a3->nstat_cell_rxbytes;
      *(_OWORD *)&self->_last_counts.nstat_txpackets = *(_OWORD *)&a3->nstat_txpackets;
      *(_OWORD *)&self->_last_counts.nstat_cell_rxbytes = v8;
      *(_OWORD *)&self->_last_counts.nstat_rxpackets = v7;
      __int128 v9 = *(_OWORD *)&a3->nstat_wifi_rxbytes;
      __int128 v10 = *(_OWORD *)&a3->nstat_wired_rxbytes;
      __int128 v11 = *(_OWORD *)&a3->nstat_connectsuccesses;
      *(_OWORD *)&self->_last_counts.nstat_rxduplicatebytes = *(_OWORD *)&a3->nstat_rxduplicatebytes;
      *(_OWORD *)&self->_last_counts.nstat_connectsuccesses = v11;
      *(_OWORD *)&self->_last_counts.nstat_wifi_rxbytes = v9;
      *(_OWORD *)&self->_last_counts.nstat_wired_rxbytes = v10;
      -[NWStatisticsSource setCountsSeqno:]( self,  "setCountsSeqno:",  -[NWStatisticsSource countsSeqno](self, "countsSeqno") + 1);
      return 1;
    }
  }

  else
  {
    BOOL v12 = 1;
    -[NWStatisticsSource setCountsSeqno:](self, "setCountsSeqno:", 1LL);
    __int128 v13 = *(_OWORD *)&a3->nstat_rxpackets;
    __int128 v14 = *(_OWORD *)&a3->nstat_cell_rxbytes;
    *(_OWORD *)&self->_last_counts.nstat_txpackets = *(_OWORD *)&a3->nstat_txpackets;
    *(_OWORD *)&self->_last_counts.nstat_cell_rxbytes = v14;
    *(_OWORD *)&self->_last_counts.nstat_rxpackets = v13;
    __int128 v15 = *(_OWORD *)&a3->nstat_wifi_rxbytes;
    __int128 v16 = *(_OWORD *)&a3->nstat_wired_rxbytes;
    __int128 v17 = *(_OWORD *)&a3->nstat_connectsuccesses;
    *(_OWORD *)&self->_last_counts.nstat_rxduplicatebytes = *(_OWORD *)&a3->nstat_rxduplicatebytes;
    *(_OWORD *)&self->_last_counts.nstat_connectsuccesses = v17;
    *(_OWORD *)&self->_last_counts.nstat_wifi_rxbytes = v15;
    *(_OWORD *)&self->_last_counts.nstat_wired_rxbytes = v16;
  }

  return v12;
}

- (BOOL)_handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 internalQueue];
  __int128 v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  int v11 = -[NWStatisticsSource handleDescriptor:length:events:](self, "handleDescriptor:length:events:", a3, a4, a5);
  if (v11 == 3) {
    -[NWStatisticsSource setDescriptorSeqno:]( self,  "setDescriptorSeqno:",  -[NWStatisticsSource descriptorSeqno](self, "descriptorSeqno") + 1);
  }
  return v11 != 1;
}

- (BOOL)handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  -[NWStatisticsSource manager](self, "manager");
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 mgrflags];

  if ((v8 & 0x10) != 0)
  {
    NStatGetLog();
    __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[NWStatisticsSource manager](self, "manager");
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v11 = -[NWStatisticsSource reference](self, "reference");
      unsigned int type = a3->type;
      *(_DWORD *)buf = 134218752;
      v32 = v10;
      __int16 v33 = 2048;
      v34 = self;
      __int16 v35 = 2048;
      unint64_t v36 = v11;
      __int16 v37 = 1024;
      unsigned int v38 = type;
      _os_log_impl( &dword_187FF5000,  v9,  OS_LOG_TYPE_DEBUG,  "Manager %p: Entry for source %p, ref %llu  message type %d",  buf,  0x26u);
    }
  }

  -[NWStatisticsSource manager](self, "manager");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  char v14 = [v13 mgrflags];

  if (v14 < 0)
  {
    -[NWStatisticsSource manager](self, "manager");
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource manager](self, "manager");
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource reference](self, "reference");
    NStatMgrTraceF( v15,  "%s Manager %p: Entry for source %p, ref %llu  message type %d",  v17,  v18,  v19,  v20,  v21,  v22,  (char)"-[NWStatisticsSource handleMessage:length:]");
  }

  unsigned int v23 = a3->type;
  if (v23 != 10006)
  {
    if (v23 == 10004)
    {
      if ((unint64_t)a4 >= 0x90)
      {
        v29 = self;
        objc_sync_enter(v29);
        BOOL v25 = -[NWStatisticsSource handleCounts:](v29, "handleCounts:", &a3[2]);
        goto LABEL_16;
      }
    }

    else if (v23 == 10003 && (unint64_t)a4 >= 0x29)
    {
      v24 = self;
      objc_sync_enter(v24);
      BOOL v25 = -[NWStatisticsSource _handleDescriptor:length:events:]( v24,  "_handleDescriptor:length:events:",  &a3[2].type,  a4 - 40,  0LL);
LABEL_16:
      LOBYTE(v28) = v25;
      goto LABEL_17;
    }

- (NWStatisticsSource)initWithManager:(id)a3 source:(unint64_t)a4 provider:(unsigned int)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NWStatisticsSource;
  __int128 v10 = -[NWStatisticsSource init](&v14, sel_init);
  unint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_manager, a3);
    v11->_reference = a4;
    v11->_provider = a5;
    BOOL v12 = v11;
  }

  return v11;
}

- (void)queryCounts
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  v3 = -[NWStatisticsSource manager](self, "manager");
  char v4 = [v3 mgrflags];

  if ((v4 & 0x10) != 0)
  {
    NStatGetLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[NWStatisticsSource manager](self, "manager");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218496;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      unsigned int v23 = self;
      __int16 v24 = 2048;
      unint64_t v25 = -[NWStatisticsSource reference](self, "reference");
      _os_log_impl(&dword_187FF5000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu", buf, 0x20u);
    }
  }

  -[NWStatisticsSource manager](self, "manager");
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 mgrflags];

  if (v8 < 0)
  {
    -[NWStatisticsSource manager](self, "manager");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource manager](self, "manager");
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource reference](self, "reference");
    NStatMgrTraceF( v9,  "%s Manager %p: Entry for source %p, ref %llu",  v11,  v12,  v13,  v14,  v15,  v16,  (char)"-[NWStatisticsSource queryCounts]");
  }

  -[NWStatisticsSource manager](self, "manager");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 internalQueue];
  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__NWStatisticsSource_queryCounts__block_invoke;
  block[3] = &unk_18A1B6358;
  block[4] = self;
  dispatch_async(v18, block);
}

void __33__NWStatisticsSource_queryCounts__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendRequestMessage:sourceRef:", 1004, objc_msgSend(*(id *)(a1 + 32), "reference"));
}

- (void)queryDescription
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  v3 = -[NWStatisticsSource manager](self, "manager");
  char v4 = [v3 mgrflags];

  if ((v4 & 0x10) != 0)
  {
    NStatGetLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[NWStatisticsSource manager](self, "manager");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218496;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      unsigned int v23 = self;
      __int16 v24 = 2048;
      unint64_t v25 = -[NWStatisticsSource reference](self, "reference");
      _os_log_impl(&dword_187FF5000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu", buf, 0x20u);
    }
  }

  -[NWStatisticsSource manager](self, "manager");
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 mgrflags];

  if (v8 < 0)
  {
    -[NWStatisticsSource manager](self, "manager");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource manager](self, "manager");
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource reference](self, "reference");
    NStatMgrTraceF( v9,  "%s Manager %p: Entry for source %p, ref %llu",  v11,  v12,  v13,  v14,  v15,  v16,  (char)"-[NWStatisticsSource queryDescription]");
  }

  -[NWStatisticsSource manager](self, "manager");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 internalQueue];
  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__NWStatisticsSource_queryDescription__block_invoke;
  block[3] = &unk_18A1B6358;
  block[4] = self;
  dispatch_async(v18, block);
}

void __38__NWStatisticsSource_queryDescription__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendRequestMessage:sourceRef:", 1005, objc_msgSend(*(id *)(a1 + 32), "reference"));
}

- (void)queryUpdate
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  v3 = -[NWStatisticsSource manager](self, "manager");
  char v4 = [v3 mgrflags];

  if ((v4 & 0x10) != 0)
  {
    NStatGetLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[NWStatisticsSource manager](self, "manager");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218496;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      unsigned int v23 = self;
      __int16 v24 = 2048;
      unint64_t v25 = -[NWStatisticsSource reference](self, "reference");
      _os_log_impl(&dword_187FF5000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu", buf, 0x20u);
    }
  }

  -[NWStatisticsSource manager](self, "manager");
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 mgrflags];

  if (v8 < 0)
  {
    -[NWStatisticsSource manager](self, "manager");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource manager](self, "manager");
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource reference](self, "reference");
    NStatMgrTraceF( v9,  "%s Manager %p: Entry for source %p, ref %llu",  v11,  v12,  v13,  v14,  v15,  v16,  (char)"-[NWStatisticsSource queryUpdate]");
  }

  -[NWStatisticsSource manager](self, "manager");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 internalQueue];
  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__NWStatisticsSource_queryUpdate__block_invoke;
  block[3] = &unk_18A1B6358;
  block[4] = self;
  dispatch_async(v18, block);
}

void __33__NWStatisticsSource_queryUpdate__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendRequestMessage:sourceRef:", 1007, objc_msgSend(*(id *)(a1 + 32), "reference"));
}

- (id)_currentSnapshot
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  NStatGetLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    -[NWStatisticsSource manager](self, "manager");
    char v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = v4;
    _os_log_impl( &dword_187FF5000,  v3,  OS_LOG_TYPE_ERROR,  "Manager %p: Subclasses must provide an implementation for _currentSnapshot",  buf,  0xCu);
  }
  v5 = -[NWStatisticsSource manager](self, "manager");
  char v6 = [v5 mgrflags];

  if (v6 < 0)
  {
    -[NWStatisticsSource manager](self, "manager");
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource manager](self, "manager");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    NStatMgrTraceF( v7,  "%s Manager %p: Subclasses must provide an implementation for _currentSnapshot",  v8,  v9,  v10,  v11,  v12,  v13,  (char)"-[NWStatisticsSource _currentSnapshot]");
  }

  __assert_rtn("-[NWStatisticsSource _currentSnapshot]", "NWStatisticsSource.m", 241, "0");
}

- (id)currentSnapshot
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = -[NWStatisticsSource _currentSnapshot](v2, "_currentSnapshot");
  objc_sync_exit(v2);

  return v3;
}

- (NWStatisticsSourceDelegate)delegate
{
  return (NWStatisticsSourceDelegate *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NWStatisticsManager)manager
{
  return (NWStatisticsManager *)objc_getProperty(self, a2, 144LL, 1);
}

- (unint64_t)reference
{
  return self->_reference;
}

- (void)setReference:(unint64_t)a3
{
  self->_reference = a3;
}

- (BOOL)removing
{
  return self->_removing;
}

- (void)setRemoving:(BOOL)a3
{
  self->_removing = a3;
}

- (unint64_t)countsSeqno
{
  return self->_countsSeqno;
}

- (void)setCountsSeqno:(unint64_t)a3
{
  self->_countsSeqno = a3;
}

- (unint64_t)descriptorSeqno
{
  return self->_descriptorSeqno;
}

- (void)setDescriptorSeqno:(unint64_t)a3
{
  self->_descriptorSeqno = a3;
}

- (unsigned)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
}

@end