@interface CDRemoveEventsConsumer
- (BOOL)historyDone;
- (CDRemoveEventsConsumer)initWithConsumer:(id)a3 identifier:(id)a4;
- (NSString)identifier;
- (NSString)volume;
- (OS_dispatch_queue)consumer_q;
- (OS_dispatch_semaphore)sem;
- (__FSEventStream)stream;
- (fsid)fsid;
- (id)consumer;
- (unint64_t)since;
- (void)callback:(id)a3;
- (void)consumeStream:(__FSEventStream *)a3 forVolume:(id)a4;
- (void)dealloc;
- (void)setConsumer:(id)a3;
- (void)setConsumer_q:(id)a3;
- (void)setFsid:(fsid)a3;
- (void)setHistoryDone:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setSem:(id)a3;
- (void)setSince:(unint64_t)a3;
- (void)setStream:(__FSEventStream *)a3;
- (void)setVolume:(id)a3;
@end

@implementation CDRemoveEventsConsumer

- (CDRemoveEventsConsumer)initWithConsumer:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CDRemoveEventsConsumer;
  v8 = -[CDRemoveEventsConsumer init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    uint64_t v10 = MEMORY[0x1895A756C](v6);
    id consumer = v9->_consumer;
    v9->_id consumer = (id)v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
    sem = v9->_sem;
    v9->_sem = (OS_dispatch_semaphore *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.CDRemoveEventsConsumer", v14);
    consumer_q = v9->_consumer_q;
    v9->_consumer_q = (OS_dispatch_queue *)v15;
  }

  return v9;
}

- (void)dealloc
{
  if (-[CDRemoveEventsConsumer stream](self, "stream"))
  {
    FSEventStreamInvalidate(-[CDRemoveEventsConsumer stream](self, "stream"));
    FSEventStreamRelease(-[CDRemoveEventsConsumer stream](self, "stream"));
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CDRemoveEventsConsumer;
  -[CDRemoveEventsConsumer dealloc](&v3, sel_dealloc);
}

- (void)callback:(id)a3
{
  id v4 = a3;
  if (-[CDRemoveEventsConsumer historyDone](self, "historyDone")) {
    FSEventStreamStop(-[CDRemoveEventsConsumer stream](self, "stream"));
  }
  -[CDRemoveEventsConsumer consumer_q](self, "consumer_q");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__CDRemoveEventsConsumer_callback___block_invoke;
  v7[3] = &unk_18A0661A0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __35__CDRemoveEventsConsumer_callback___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  CDGetLogHandle((uint64_t)"client");
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1874E4000, v2, OS_LOG_TYPE_DEFAULT, "CDConsumer, calling client callback with:", buf, 2u);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v37;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v30 = v5;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "allValues", v30);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 componentsJoinedByString:@" "];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

        CDGetLogHandle((uint64_t)"client");
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v30;
          v41 = v10;
          _os_log_impl(&dword_1874E4000, v11, OS_LOG_TYPE_DEFAULT, "CDConsumer callback file removed: %@", buf, 0xCu);
        }
      }

      uint64_t v6 = [v3 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }

    while (v6);
  }

  [*(id *)(a1 + 40) consumer];
  dispatch_semaphore_t v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  v12[2](v12, *(void *)(a1 + 32));

  CDGetLogHandle((uint64_t)"client");
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1874E4000, v13, OS_LOG_TYPE_DEFAULT, "CDConsumer client callback complete", buf, 2u);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  v14 = (dispatch_semaphore_s *)*(id *)(a1 + 32);
  uint64_t v15 = -[dispatch_semaphore_s countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v32,  v44,  16LL);
  if (!v15) {
    goto LABEL_31;
  }
  uint64_t v17 = v15;
  char v18 = 0;
  uint64_t v19 = *(void *)v33;
  *(void *)&__int128 v16 = 138412546LL;
  __int128 v31 = v16;
  do
  {
    for (uint64_t j = 0LL; j != v17; ++j)
    {
      if (*(void *)v33 != v19) {
        objc_enumerationMutation(v14);
      }
      v21 = *(void **)(*((void *)&v32 + 1) + 8 * j);
      objc_msgSend(v21, "objectForKeyedSubscript:", @"historyDone", v31, (void)v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      evaluateNumberProperty(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        if ([v23 unsignedLongLongValue])
        {
          v24 = v23;
        }

        else
        {
          [MEMORY[0x189607968] numberWithUnsignedLongLong:FSEventsGetCurrentEventId()];
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          CDGetLogHandle((uint64_t)"client");
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            v41 = v24;
            __int16 v42 = 2112;
            v43 = v21;
            _os_log_error_impl( &dword_1874E4000,  v25,  OS_LOG_TYPE_ERROR,  "Got a zero historyDone event, using FSEventsGetCurrentEventId: %@, event: %@",  buf,  0x16u);
          }
        }

        [*(id *)(a1 + 40) identifier];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) volume];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        char v18 = 1;
        setPurgeMarker(v26, v27, 1, [v24 unsignedLongLongValue]);
      }

      else
      {
        v24 = 0LL;
      }

      [v21 objectForKeyedSubscript:@"rescan"];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      evaluateNumberProperty(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v18 |= v29 != 0LL;
    }

    uint64_t v17 = -[dispatch_semaphore_s countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v32,  v44,  16LL);
  }

  while (v17);

  if ((v18 & 1) != 0)
  {
    [*(id *)(a1 + 40) sem];
    v14 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v14);
LABEL_31:
  }

- (void)consumeStream:(__FSEventStream *)a3 forVolume:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  uint64_t v7 = mach_absolute_time();
  if (a3)
  {
    bzero(&v25, 0x878uLL);
    id v8 = v6;
    if (statfs((const char *)[v8 UTF8String], &v25))
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = __error();
        char v18 = strerror(*v17);
        int v21 = 138543618;
        id v22 = v8;
        __int16 v23 = 2080;
        v24 = v18;
        _os_log_error_impl( &dword_1874E4000,  v9,  OS_LOG_TYPE_ERROR,  "statfs failed for %{public}@ : %s",  (uint8_t *)&v21,  0x16u);
      }

      goto LABEL_22;
    }

    if (-[CDRemoveEventsConsumer stream](self, "stream"))
    {
      CDGetLogHandle((uint64_t)"client");
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_error_impl( &dword_1874E4000,  v11,  OS_LOG_TYPE_ERROR,  "consumer is being reused, replacing FSEventStream",  (uint8_t *)&v21,  2u);
      }

      dispatch_semaphore_t v12 = -[CDRemoveEventsConsumer stream](self, "stream");
      -[CDRemoveEventsConsumer setStream:](self, "setStream:", 0LL);
      FSEventStreamInvalidate(v12);
      FSEventStreamRelease(v12);
    }

    -[CDRemoveEventsConsumer setFsid:](self, "setFsid:", *(void *)&v25.f_fsid);
    -[CDRemoveEventsConsumer setStream:](self, "setStream:", a3);
    -[CDRemoveEventsConsumer setVolume:](self, "setVolume:", v8);
    if (FSEventStreamStart(-[CDRemoveEventsConsumer stream](self, "stream")))
    {
      -[CDRemoveEventsConsumer sem](self, "sem");
      v13 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

      CDGetLogHandle((uint64_t)"client");
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1874E4000, v14, OS_LOG_TYPE_DEFAULT, "FSStream completed.", (uint8_t *)&v21, 2u);
      }
    }

    else
    {
      CDGetLogHandle((uint64_t)"client");
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = __error();
        v20 = strerror(*v19);
        int v21 = 138412546;
        id v22 = v8;
        __int16 v23 = 2080;
        v24 = v20;
        _os_log_error_impl( &dword_1874E4000,  v14,  OS_LOG_TYPE_ERROR,  "CacheDeleteEnumerateRemovedFiles: Unable to start FSEventStream on volume %@ : %s",  (uint8_t *)&v21,  0x16u);
      }
    }
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25.f_bsize) = 0;
      _os_log_error_impl(&dword_1874E4000, v10, OS_LOG_TYPE_ERROR, "No stream parameter", (uint8_t *)&v25, 2u);
    }
  }

  CDGetLogHandle((uint64_t)"client");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = mach_absolute_time();
    v25.f_bsize = 134217984;
    *(double *)&v25.f_iosize = *(double *)&gTimebaseConversion * ((double)v16 - (double)v7) / 1000000000.0;
    _os_log_impl(&dword_1874E4000, v15, OS_LOG_TYPE_DEFAULT, "consumeStream Time taken: %f", (uint8_t *)&v25, 0xCu);
  }

LABEL_22:
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)consumer
{
  return self->_consumer;
}

- (void)setConsumer:(id)a3
{
}

- (__FSEventStream)stream
{
  return self->_stream;
}

- (void)setStream:(__FSEventStream *)a3
{
  self->_stream = a3;
}

- (OS_dispatch_semaphore)sem
{
  return self->_sem;
}

- (void)setSem:(id)a3
{
}

- (OS_dispatch_queue)consumer_q
{
  return self->_consumer_q;
}

- (void)setConsumer_q:(id)a3
{
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
}

- (BOOL)historyDone
{
  return self->_historyDone;
}

- (void)setHistoryDone:(BOOL)a3
{
  self->_historyDone = a3;
}

- (fsid)fsid
{
  return dest;
}

- (void)setFsid:(fsid)a3
{
  fsid src = a3;
  objc_copyStruct(&self->_fsid, &src, 8LL, 1, 0);
}

- (unint64_t)since
{
  return self->_since;
}

- (void)setSince:(unint64_t)a3
{
  self->_since = a3;
}

- (void).cxx_destruct
{
}

@end