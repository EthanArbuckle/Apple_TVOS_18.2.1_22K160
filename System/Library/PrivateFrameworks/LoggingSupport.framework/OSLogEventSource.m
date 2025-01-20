@interface OSLogEventSource
- (NSDate)newestDate;
- (NSDate)oldestDate;
- (NSMutableArray)_fileRefs;
- (NSUUID)uniqueIdentifier;
- (OSLogEventSource)initWithCollection:(id)a3 metadata:(id)a4 timesync:(_os_timesync_db_s *)a5;
- (_OSLogCollectionReference)lcr;
- (_OSLogEventStoreMetadata)lesm;
- (_OSLogEventStoreTimeRef)newestTimeRef;
- (_OSLogEventStoreTimeRef)oldestTimeRef;
- (_os_timesync_db_s)tsdb;
- (void)_enumerateIndexFiles:(id)a3;
- (void)_insertIndexFile:(id)a3;
- (void)dealloc;
- (void)set_fileRefs:(id)a3;
@end

@implementation OSLogEventSource

- (OSLogEventSource)initWithCollection:(id)a3 metadata:(id)a4 timesync:(_os_timesync_db_s *)a5
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___OSLogEventSource;
  v11 = -[OSLogEventSource init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_lcr, a3);
    objc_storeStrong((id *)&v12->_lesm, a4);
    v12->_tsdb = a5;
    uint64_t v13 = [MEMORY[0x189603FA8] array];
    fileRefs = v12->_fileRefs;
    v12->_fileRefs = (NSMutableArray *)v13;

    if (v10)
    {
      id v15 = v10;
      impl = (uint64_t *)_timesync_range_create_impl((uint64_t)a5, 0LL, 0xFFFFFFFFFFFFFFFFLL, 0);
      [v15 oldestLive];
      v17 = (_OSLogEventStoreTimeRef *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        [v15 oldestLive];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _findOldestTimeRef(impl, 0LL, v18);
        v17 = (_OSLogEventStoreTimeRef *)objc_claimAutoreleasedReturnValue();
      }

      [v15 oldestPersist];
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        [v15 oldestPersist];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = _findOldestTimeRef(impl, v17, v20);

        v17 = (_OSLogEventStoreTimeRef *)v21;
      }

      [v15 oldestSpecial];
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        [v15 oldestSpecial];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = _findOldestTimeRef(impl, v17, v23);

        v17 = (_OSLogEventStoreTimeRef *)v24;
      }

      _os_trace_uuid_map_destroy((void **)*impl);
      free(impl);

      oldestTimeRef = v12->_oldestTimeRef;
      v12->_oldestTimeRef = v17;
    }
  }

  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSLogEventSource;
  -[OSLogEventSource dealloc](&v3, sel_dealloc);
}

- (void)_insertIndexFile:(id)a3
{
}

- (void)_enumerateIndexFiles:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v4 = (void (**)(id, void))a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_fileRefs;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (NSUUID)uniqueIdentifier
{
  return -[_OSLogEventStoreMetadata archiveUUID](self->_lesm, "archiveUUID");
}

- (_OSLogEventStoreTimeRef)newestTimeRef
{
  return -[_OSLogEventStoreMetadata end](self->_lesm, "end");
}

- (NSDate)oldestDate
{
  oldestTimeRef = self->_oldestTimeRef;
  if (oldestTimeRef) {
    objc_msgSend( MEMORY[0x189603F50],  "dateWithTimeIntervalSince1970:",  (double)_timesync_continuous_to_wall_time( (uint64_t)self->_tsdb,  (void *)-[_OSLogEventStoreTimeRef UUID](oldestTimeRef, "UUID"),  -[_OSLogEventStoreTimeRef continuousTime](self->_oldestTimeRef, "continuousTime"),  0)
  }
    / 1000000000.0);
  else {
    [MEMORY[0x189603F50] distantPast];
  }
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)newestDate
{
  lesm = self->_lesm;
  if (lesm)
  {
    tsdb = self->_tsdb;
    v5 = -[_OSLogEventStoreMetadata end](lesm, "end");
    uint64_t v6 = (void *)[v5 UUID];
    -[_OSLogEventStoreMetadata end](self->_lesm, "end");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = _timesync_continuous_to_wall_time((uint64_t)tsdb, v6, [v7 continuousTime], 0);

    [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)v8 / 1000000000.0];
  }

  else
  {
    [MEMORY[0x189603F50] date];
  }

  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableArray)_fileRefs
{
  return self->_fileRefs;
}

- (void)set_fileRefs:(id)a3
{
}

- (_OSLogCollectionReference)lcr
{
  return self->_lcr;
}

- (_OSLogEventStoreMetadata)lesm
{
  return self->_lesm;
}

- (_OSLogEventStoreTimeRef)oldestTimeRef
{
  return self->_oldestTimeRef;
}

- (_os_timesync_db_s)tsdb
{
  return self->_tsdb;
}

- (void).cxx_destruct
{
}

@end