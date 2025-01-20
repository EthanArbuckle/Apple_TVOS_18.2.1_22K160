@interface OSLogEventStream
- (OSLogEventSource)source;
- (OSLogEventStream)initWithSource:(id)a3;
- (OSLogEventStream)initWithSource:(id)a3 skipNonSignpostFiles:(BOOL)a4;
- (_OSLogCatalogFilter)catalogFilter;
- (_OSLogIndex)index;
- (_os_timesync_db_s)tsdb;
- (id)_initWithSource:(id)a3 flags:(unint64_t)a4;
- (void)_activateStreamFromDate:(id)a3 toDate:(id)a4;
- (void)_activateStreamFromTimeIntervalSinceLastBoot:(double)a3;
- (void)_activateStreamInRange:(os_timesync_range_s *)a3;
- (void)_foreachIndexFile:(id)a3;
- (void)activateStreamFromDate:(id)a3;
- (void)activateStreamFromLastBoot;
- (void)activateStreamFromPosition:(id)a3;
- (void)dealloc;
- (void)setCatalogFilter:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setIndex:(id)a3;
- (void)setTsdb:(_os_timesync_db_s *)a3;
@end

@implementation OSLogEventStream

- (id)_initWithSource:(id)a3 flags:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v8 = -[OSLogEventStreamBase init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_source, a3);
    uint64_t v10 = _timesync_db_openat(*(_DWORD *)[v7 tsdb], ".");
    v9->_tsdb = (_os_timesync_db_s *)v10;
    if (v10)
    {
      [v7 lcr];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 lesm];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_OSLogIndex initWithCollection:timesync:metadata:]( objc_alloc(&OBJC_CLASS____OSLogIndex),  "initWithCollection:timesync:metadata:",  v11,  v9->_tsdb,  v12);
      index = v9->_index;
      v9->_index = v13;

      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __42__OSLogEventStream__initWithSource_flags___block_invoke;
      v16[3] = &unk_189F0F258;
      char v18 = v4 & 1;
      v17 = v9;
      [v7 _enumerateIndexFiles:v16];
    }
  }

  return v9;
}

- (OSLogEventStream)initWithSource:(id)a3 skipNonSignpostFiles:(BOOL)a4
{
  return (OSLogEventStream *)-[OSLogEventStream _initWithSource:flags:](self, "_initWithSource:flags:", a3, a4);
}

- (OSLogEventStream)initWithSource:(id)a3
{
  return (OSLogEventStream *)-[OSLogEventStream _initWithSource:flags:](self, "_initWithSource:flags:", a3, 0LL);
}

- (void)dealloc
{
  tsdb = (int *)self->_tsdb;
  if (tsdb) {
    _timesync_db_close(tsdb);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OSLogEventStream;
  -[OSLogEventStream dealloc](&v4, sel_dealloc);
}

- (void)_foreachIndexFile:(id)a3
{
}

- (void)setFilterPredicate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OSLogEventStream;
  -[OSLogEventStreamBase setFilterPredicate:](&v9, sel_setFilterPredicate_, a3);
  objc_super v4 = objc_alloc(&OBJC_CLASS____OSLogCatalogFilter);
  v5 = -[OSLogEventStreamBase filterPredicate](self, "filterPredicate");
  v6 = -[OSLogEventSource lcr](self->_source, "lcr");
  id v7 = -[_OSLogCatalogFilter initWithPredicate:collection:](v4, "initWithPredicate:collection:", v5, v6);
  catalogFilter = self->_catalogFilter;
  self->_catalogFilter = v7;
}

- (void)_activateStreamInRange:(os_timesync_range_s *)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  -[OSLogEventStreamBase streamHandler](self, "streamHandler");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventStream activated without stream handler";
    __break(1u);
  }

  char v24 = -[OSLogEventStreamBase flags](self, "flags");
  char v23 = -[OSLogEventStreamBase flags](self, "flags");
  char v22 = -[OSLogEventStreamBase flags](self, "flags");
  char v5 = -[OSLogEventStreamBase flags](self, "flags");
  char v21 = -[OSLogEventStreamBase flags](self, "flags");
  char v6 = -[OSLogEventStreamBase flags](self, "flags");
  char v7 = -[OSLogEventStreamBase flags](self, "flags");
  char v8 = -[OSLogEventStreamBase flags](self, "flags");
  __int16 v9 = -[OSLogEventStreamBase flags](self, "flags");
  __int16 v10 = -[OSLogEventStreamBase flags](self, "flags");
  v11 = -[OSLogEventStreamBase filterPredicate](self, "filterPredicate");
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  uint64_t v43 = 0LL;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  uint64_t v39 = 0LL;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v35 = 0LL;
  index = self->_index;
  v13 = -[OSLogEventStream catalogFilter](self, "catalogFilter");
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __43__OSLogEventStream__activateStreamInRange___block_invoke;
  v26[3] = &unk_189F0F280;
  uint64_t v14 = v23 & 0x40 | v24 & 0x20 | (4 * (v22 & 1)) | v5 & 2 | ((v21 & 4) == 0LL) | v6 & 8 | v7 & 0x10 | v8 & 0x80 | v9 & 0x100 | v10 & 0x200u;
  id v15 = v11;
  id v27 = v15;
  v28 = self;
  v29 = &v32;
  v30 = &v40;
  v31 = &v36;
  -[_OSLogIndex enumerateEntriesInRange:options:usingCatalogFilter:usingBlock:]( index,  "enumerateEntriesInRange:options:usingCatalogFilter:usingBlock:",  a3,  v14,  v13,  v26);

  uint64_t v16 = v41[3];
  v17 = -[OSLogEventSource uniqueIdentifier](self->_source, "uniqueIdentifier");
  [v17 getUUIDBytes:v44];

  char v18 = objc_alloc(&OBJC_CLASS___OSLogEventStreamPosition);
  uint64_t v19 = -[OSLogEventStreamPosition initWithSource:bootUUID:time:]( v18,  "initWithSource:bootUUID:time:",  v44,  a3->var3[v16],  v37[3]);
  uint64_t v20 = v33[3];
  if (!v20)
  {
    if (-[OSLogEventStreamBase invalidated](self, "invalidated")) {
      uint64_t v20 = 4LL;
    }
    else {
      uint64_t v20 = 5LL;
    }
    v33[3] = v20;
  }

  _invalidate(self, v20, v19);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
}

- (void)_activateStreamFromDate:(id)a3 toDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[OSLogEventStreamBase queue](self, "queue");
  char v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__OSLogEventStream__activateStreamFromDate_toDate___block_invoke;
  block[3] = &unk_189F0F2A8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)activateStreamFromDate:(id)a3
{
  source = self->_source;
  id v5 = a3;
  -[OSLogEventSource newestDate](source, "newestDate");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[OSLogEventStream _activateStreamFromDate:toDate:](self, "_activateStreamFromDate:toDate:", v5, v6);
}

- (void)_activateStreamFromTimeIntervalSinceLastBoot:(double)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __65__OSLogEventStream__activateStreamFromTimeIntervalSinceLastBoot___block_invoke;
  v6[3] = &unk_189F0F2D0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)activateStreamFromLastBoot
{
}

- (void)activateStreamFromPosition:(id)a3
{
  id v4 = a3;
  -[OSLogEventStreamBase queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__OSLogEventStream_activateStreamFromPosition___block_invoke;
  v7[3] = &unk_189F0F2F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (_OSLogCatalogFilter)catalogFilter
{
  return self->_catalogFilter;
}

- (void)setCatalogFilter:(id)a3
{
}

- (_OSLogIndex)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (OSLogEventSource)source
{
  return self->_source;
}

- (_os_timesync_db_s)tsdb
{
  return self->_tsdb;
}

- (void)setTsdb:(_os_timesync_db_s *)a3
{
  self->_tsdb = a3;
}

- (void).cxx_destruct
{
}

void __47__OSLogEventStream_activateStreamFromPosition___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 88) && *(void *)(v1 + 72))
  {
    [*(id *)(v1 + 80) uniqueIdentifier];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 getUUIDBytes:v10];

    id v4 = (void *)[*(id *)(a1 + 40) sourceUUID];
    if (v10[0] == *v4
      && v10[1] == v4[1]
      && (impl = (char *)_timesync_range_create_impl( *(void *)(*(void *)(a1 + 32) + 88),  0,  0xFFFFFFFFFFFFFFFFLL,  0),  (_timesync_range_contains( (uint64_t *)impl,  (void *)[*(id *)(a1 + 40) UUID],  objc_msgSend(*(id *)(a1 + 40), "continuousTime")) & 1) != 0))
    {
      _timesync_range_intersect( impl,  (void *)[*(id *)(a1 + 40) UUID],  (float *)objc_msgSend(*(id *)(a1 + 40), "continuousTime"),  0,  0);
      [*(id *)(a1 + 32) _activateStreamInRange:impl];
      _os_trace_uuid_map_destroy(*(void ***)impl);
      free(impl);
    }

    else
    {
      _invalidate(*(void **)(a1 + 32), 3LL, *(void **)(a1 + 40));
    }
  }

  else
  {
    id v6 = (id *)(id)v1;
    uuid_clear(uu);
    [v6[10] uniqueIdentifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 getUUIDBytes:v10];

    id v8 = -[OSLogEventStreamPosition initWithSource:bootUUID:time:]( objc_alloc(&OBJC_CLASS___OSLogEventStreamPosition),  "initWithSource:bootUUID:time:",  v10,  uu,  0LL);
    _invalidate(v6, 9LL, v8);
  }

void __65__OSLogEventStream__activateStreamFromTimeIntervalSinceLastBoot___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[11];
  if (v3 && v2[9])
  {
    double v4 = *(double *)(a1 + 40);
    if (v4 <= 0.0) {
      uint64_t v5 = 0LL;
    }
    else {
      uint64_t v5 = (unint64_t)(v4 * 1000000000.0);
    }
    since_last_boot = (void ***)_timesync_range_create_since_last_boot(v3, v5);
    [*(id *)(a1 + 32) _activateStreamInRange:since_last_boot];
    _os_trace_uuid_map_destroy(*since_last_boot);
    free(since_last_boot);
  }

  else
  {
    id v7 = v2;
    uuid_clear(uu);
    [v7[10] uniqueIdentifier];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 getUUIDBytes:v11];

    id v9 = -[OSLogEventStreamPosition initWithSource:bootUUID:time:]( objc_alloc(&OBJC_CLASS___OSLogEventStreamPosition),  "initWithSource:bootUUID:time:",  v11,  uu,  0LL);
    _invalidate(v7, 9LL, v9);
  }

void __51__OSLogEventStream__activateStreamFromDate_toDate___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v1 = a1[4];
  if (v1[11] && v1[9])
  {
    [a1[5] timeIntervalSince1970];
    if (v3 <= 0.0)
    {
      unint64_t v5 = 0LL;
    }

    else
    {
      [a1[5] timeIntervalSince1970];
      unint64_t v5 = (unint64_t)(v4 * 1000000000.0);
    }

    if (([a1[4] flags] & 8) != 0)
    {
      uint64_t v13 = *((void *)a1[4] + 11);
      unint64_t v14 = 0LL;
      unint64_t v12 = v5;
    }

    else
    {
      [a1[6] timeIntervalSince1970];
      double v10 = v9;
      double v11 = 0.0;
      if (v10 > 0.0) {
        objc_msgSend(a1[6], "timeIntervalSince1970", 0.0);
      }
      if (v11 == 0.0) {
        unint64_t v12 = -1LL;
      }
      else {
        unint64_t v12 = (unint64_t)(v11 * 1000000000.0);
      }
      uint64_t v13 = *((void *)a1[4] + 11);
      unint64_t v14 = v5;
    }

    impl = (void ***)_timesync_range_create_impl(v13, v14, v12, 1);
    [a1[4] _activateStreamInRange:impl];
    _os_trace_uuid_map_destroy(*impl);
    free(impl);
  }

  else
  {
    id v6 = v1;
    uuid_clear(uu);
    [v6[10] uniqueIdentifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 getUUIDBytes:v17];

    id v8 = -[OSLogEventStreamPosition initWithSource:bootUUID:time:]( objc_alloc(&OBJC_CLASS___OSLogEventStreamPosition),  "initWithSource:bootUUID:time:",  v17,  uu,  0LL);
    _invalidate(v6, 9LL, v8);
  }

BOOL __43__OSLogEventStream__activateStreamInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(void **)(a1 + 32);
  if (!v4 || [v4 evaluateWithObject:v3])
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 _timesyncRangeUUIDIndex];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 machContinuousTimestamp];
    [*(id *)(a1 + 40) streamHandler];
    unint64_t v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v5)[2](v5, v3);
  }

  BOOL v6 = [*(id *)(a1 + 40) invalidated] == 0;

  return v6;
}

void __42__OSLogEventStream__initWithSource_flags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (!*(_BYTE *)(a1 + 40)
    || (double v4 = (const char *)[v3 path]) == 0
    || (unint64_t v5 = v4, (v6 = strchr(v4, 47)) == 0LL)
    || (int v7 = strncmp(v5, "Signpost/", v6 - v5), v8 = v9, !v7))
  {
    [*(id *)(*(void *)(a1 + 32) + 72) insertIndexFile:v9];
    id v8 = v9;
  }
}

@end