@interface OSLogEventLiveStream
- (OSLogEventLiveSource)source;
- (OSLogEventLiveStream)initWithLiveSource:(id)a3;
- (OS_xpc_object)diagdconn;
- (id)dropnoteHandler;
- (void)_activateLiveStream;
- (void)_handleStreamedObject:(id)a3 usingProxy:(id)a4;
- (void)activate;
- (void)invalidate;
- (void)setDiagdconn:(id)a3;
- (void)setDropnoteHandler:(id)a3;
- (void)setDroppedEventHandler:(id)a3;
- (void)setFilterPredicate:(id)a3;
@end

@implementation OSLogEventLiveStream

- (OSLogEventLiveStream)initWithLiveSource:(id)a3
{
  id v5 = a3;
  v6 = -[OSLogEventStreamBase init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_source, a3);
  }

  return v7;
}

- (void)setDroppedEventHandler:(id)a3
{
  v4 = _Block_copy(a3);
  id dropnoteHandler = self->_dropnoteHandler;
  self->_id dropnoteHandler = v4;
}

- (void)setFilterPredicate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OSLogEventLiveStream;
  -[OSLogEventStreamBase setFilterPredicate:](&v8, sel_setFilterPredicate_, a3);
  v4 = objc_alloc(&OBJC_CLASS____OSLogStreamFilter);
  -[OSLogEventStreamBase filterPredicate](self, "filterPredicate");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_OSLogStreamFilter initWithPredicate:](v4, "initWithPredicate:", v5);
  streamFilter = self->_streamFilter;
  self->_streamFilter = v6;
}

- (void)_handleStreamedObject:(id)a3 usingProxy:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  [v6 _fillFromXPCEventObject:v11];
  v7 = -[OSLogEventStreamBase filterPredicate](self, "filterPredicate");
  if (!v7
    || (-[OSLogEventStreamBase filterPredicate](self, "filterPredicate"),
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 evaluateWithObject:v6],
        v8,
        (v9 & 1) != 0))
  {
    -[OSLogEventStreamBase streamHandler](self, "streamHandler");
    v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v10)[2](v10, v6);
  }
}

- (void)_activateLiveStream
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);
  v4 = -[OSLogEventStreamBase streamHandler](self, "streamHandler");
  if (!v4) {
    goto LABEL_26;
  }
  if (!-[OSLogEventStreamBase invalidated](self, "invalidated"))
  {
    -[OSLogEventStreamBase queue](self, "queue");
    char v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service("com.apple.diagnosticd", v9, 2uLL);
    diagdconn = self->_diagdconn;
    self->_diagdconn = mach_service;

    uint64_t v28 = 0LL;
    v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    id v31 = +[OSLogEventProxy _make](&OBJC_CLASS___OSLogEventProxy, "_make");
    self->_unint64_t reason = 0LL;
    v12 = self->_diagdconn;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __43__OSLogEventLiveStream__activateLiveStream__block_invoke;
    handler[3] = &unk_189F0EF00;
    handler[4] = self;
    handler[5] = &v28;
    xpc_connection_set_event_handler(v12, handler);
    xpc_connection_activate(self->_diagdconn);
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v13, "action", 3uLL);
    [(id)v29[3] _setIncludeSensitive:1];
    xpc_dictionary_set_uint64( v13,  "flags",  (16 * -[OSLogEventStreamBase flags](self, "flags")) & 0x20 | ((-[OSLogEventStreamBase flags]( self,  "flags") & 1) << 8));
    char v14 = -[OSLogEventStreamBase flags](self, "flags");
    char v15 = -[OSLogEventStreamBase flags](self, "flags");
    __int16 v16 = -[OSLogEventStreamBase flags](self, "flags");
    __int16 v17 = -[OSLogEventStreamBase flags](self, "flags");
    uint64_t v18 = 15LL;
    if ((v14 & 0x20) == 0) {
      uint64_t v18 = 7LL;
    }
    if (v15 < 0) {
      v18 &= 0xEu;
    }
    if ((v16 & 0x100) != 0) {
      v18 &= ~2uLL;
    }
    if ((v17 & 0x200) != 0) {
      uint64_t v19 = v18 & 0xFFFFFFFFFFFFFFFBLL;
    }
    else {
      uint64_t v19 = v18;
    }
    xpc_dictionary_set_uint64(v13, "types", v19);
    xpc_dictionary_set_BOOL(v13, "all_procs", 1);
    streamFilter = self->_streamFilter;
    if (streamFilter)
    {
      id v21 = -[_OSLogStreamFilter data](streamFilter, "data");
      v22 = (const void *)[v21 bytes];
      v23 = -[_OSLogStreamFilter data](self->_streamFilter, "data");
      xpc_dictionary_set_data(v13, "stream_filter", v22, [v23 length]);
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Sending stream request to diagnosticd",  v26,  2u);
    }

    xpc_object_t v24 = xpc_connection_send_message_with_reply_sync(self->_diagdconn, v13);
    if (MEMORY[0x186E40964]() == MEMORY[0x1895F9268])
    {
      xpc_connection_cancel(self->_diagdconn);
      goto LABEL_23;
    }

    uint64_t uint64 = xpc_dictionary_get_uint64(v24, "error");
    if (!uint64)
    {
LABEL_23:

      _Block_object_dispose(&v28, 8);
      return;
    }

    if (uint64 == 1)
    {
      -[OSLogEventLiveStream invalidate](self, "invalidate");
      self->_unint64_t reason = 7LL;
      xpc_connection_cancel(self->_diagdconn);
      goto LABEL_23;
    }

    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_26:
    qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventLiveStream activated without stream handler";
    __break(1u);
    return;
  }

  self->_unint64_t reason = 4LL;
  -[OSLogEventStreamBase invalidationHandler](self, "invalidationHandler");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[OSLogEventStreamBase invalidationHandler](self, "invalidationHandler");
    id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    unint64_t reason = self->_reason;
    objc_super v8 = objc_alloc(&OBJC_CLASS___OSLogEventStreamPosition);
    ((void (**)(void, unint64_t, OSLogEventStreamPosition *))v6)[2](v6, reason, v8);

    -[OSLogEventStreamBase setInvalidationHandler:](self, "setInvalidationHandler:", 0LL);
  }

- (void)activate
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__OSLogEventLiveStream_activate__block_invoke;
  block[3] = &unk_189F0EF28;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OSLogEventLiveStream;
  -[OSLogEventStreamBase invalidate](&v5, sel_invalidate);
  -[OSLogEventStreamBase queue](self, "queue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__OSLogEventLiveStream_invalidate__block_invoke;
  block[3] = &unk_189F0EF28;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_xpc_object)diagdconn
{
  return self->_diagdconn;
}

- (void)setDiagdconn:(id)a3
{
}

- (OSLogEventLiveSource)source
{
  return self->_source;
}

- (id)dropnoteHandler
{
  return self->_dropnoteHandler;
}

- (void)setDropnoteHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __34__OSLogEventLiveStream_invalidate__block_invoke(uint64_t a1)
{
  v1 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 80LL);
  if (v1) {
    xpc_connection_cancel(v1);
  }
}

uint64_t __32__OSLogEventLiveStream_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateLiveStream];
}

void __43__OSLogEventLiveStream__activateLiveStream__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (MEMORY[0x186E40964]() == MEMORY[0x1895F9268])
  {
    objc_super v5 = *(void **)(a1 + 32);
    if (v3 != (id)MEMORY[0x1895F91A0])
    {
      id v6 = (_xpc_connection_s *)v5[10];
LABEL_16:
      xpc_connection_cancel(v6);
      goto LABEL_17;
    }

    if (![v5 invalidated])
    {
      [*(id *)(a1 + 32) invalidate];
      *(void *)(*(void *)(a1 + 32) + 72LL) = 1LL;
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) _unmake];
    [*(id *)(a1 + 32) invalidationHandler];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      [*(id *)(a1 + 32) invalidationHandler];
      v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 72LL);
      char v14 = objc_alloc(&OBJC_CLASS___OSLogEventStreamPosition);
      ((void (**)(void, uint64_t, OSLogEventStreamPosition *))v12)[2](v12, v13, v14);

      [*(id *)(a1 + 32) setInvalidationHandler:0];
    }
  }

  else
  {
    id v4 = v3;
    if (MEMORY[0x186E40964]() != MEMORY[0x1895F9250])
    {
      asprintf(&v19, "Not a dictionary\n");
      goto LABEL_9;
    }

    xpc_dictionary_get_value(v4, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x186E40964]() != MEMORY[0x1895F92F0])
    {
      objc_super v8 = (char *)xpc_copy_short_description();
      asprintf(&v19, "Action is %s (not uint64, which was expected)\n", v8);
      free(v8);
LABEL_8:

LABEL_9:
      char v9 = v19;
      BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v10)
        {
          *(_DWORD *)buf = 136446210;
          id v21 = v9;
          _os_log_error_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error with received event: %{public}s",  buf,  0xCu);
          char v9 = v19;
        }

        free(v9);
      }

      else if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unspecified error with received event",  buf,  2u);
      }

      goto LABEL_15;
    }

    uint64_t value = xpc_uint64_get_value(v7);
    uint64_t v16 = value;
    if (value != 6 && value != 12)
    {
      asprintf(&v19, "Action is %llu (not %llu or %llu, which was expected)\n", value, 6LL, 12LL);
      goto LABEL_8;
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) _setThreadCrumb];
    __int16 v17 = *(void **)(a1 + 32);
    if (v16 == 6)
    {
      [v17 _handleStreamedObject:v4 usingProxy:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    }

    else
    {
      uint64_t v18 = v17[12];
      if (v18) {
        (*(void (**)(uint64_t, void))(v18 + 16))(v18, 0LL);
      }
    }

    if ([*(id *)(a1 + 32) invalidated])
    {
      *(void *)(*(void *)(a1 + 32) + 72LL) = 4LL;
LABEL_15:
      id v6 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 80LL);
      goto LABEL_16;
    }
  }

@end