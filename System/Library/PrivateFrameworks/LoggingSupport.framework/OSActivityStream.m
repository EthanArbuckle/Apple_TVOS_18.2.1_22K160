@interface OSActivityStream
- (BOOL)establishTrust:(id)a3;
- (BOOL)streamEvent:(id)a3 error:(id)a4;
- (NSCompoundPredicate)predicate;
- (OSActivityStream)init;
- (OSActivityStreamDelegate)delegate;
- (OSDeviceDelegate)deviceDelegate;
- (OSLogDevice)device;
- (id)getInfoForDevice:(id)a3 andKey:(id)a4;
- (unint64_t)eventFilter;
- (unint64_t)events;
- (unint64_t)options;
- (void)addProcessID:(int)a3;
- (void)addUserID:(unsigned int)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceDelegate:(id)a3;
- (void)setEventFilter:(unint64_t)a3;
- (void)setEvents:(unint64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPredicate:(id)a3;
- (void)start;
- (void)startLocal;
- (void)startRemote;
- (void)stop;
- (void)stopLocal;
- (void)stopRemote;
@end

@implementation OSActivityStream

- (void)setDelegate:(id)a3
{
  id obj = a3;
  self->_delegateHasDidFail = objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_WORD *)&self->_delegateStreamErrorLess = 1;
  }

  else
  {
    char v4 = objc_opt_respondsToSelector();
    self->_delegateStreamErrorLess = 0;
    self->_delegateStreamWithError = (v4 & 1) != 0;
  }

  objc_storeWeak((id *)&self->_delegate, obj);
}

- (OSActivityStream)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OSActivityStream;
  v2 = -[OSActivityStream init](&v8, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189603FE0] set];
    pids = v2->_pids;
    v2->_pids = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x189603FE0] set];
    uids = v2->_uids;
    v2->_uids = (NSMutableSet *)v5;

    *(_OWORD *)&v2->_options = xmmword_1869D9130;
    v2->_deviceSearchSession = 0LL;
    v2->_deviceEventSession = 0LL;
  }

  return v2;
}

- (void)dealloc
{
  stream = self->_stream;
  if (stream)
  {
    *((_DWORD *)stream + 20) = 89;
    xpc_connection_cancel(*((xpc_connection_t *)stream + 2));
    xpc_release(*((xpc_object_t *)stream + 2));
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OSActivityStream;
  -[OSActivityStream dealloc](&v4, sel_dealloc);
}

- (void)setEvents:(unint64_t)a3
{
  unint64_t v3 = (a3 & 0x203) != 0;
  if ((a3 & 0x400) != 0) {
    unint64_t v3 = 4LL;
  }
  if ((a3 & 0x300) != 0) {
    unint64_t v3 = 2LL;
  }
  if (v3) {
    self->_eventFilter = v3;
  }
}

- (unint64_t)events
{
  if ((self->_eventFilter & 2) != 0) {
    return ((uint64_t)(self->_eventFilter << 63) >> 63) & 0x203 | self->_eventFilter & 0x400 | 0x300;
  }
  else {
    return ((uint64_t)(self->_eventFilter << 63) >> 63) & 0x203 | self->_eventFilter & 0x400;
  }
}

- (void)addProcessID:(int)a3
{
  pids = self->_pids;
  [MEMORY[0x189607968] numberWithInt:*(void *)&a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](pids, "addObject:", v4);
}

- (void)addUserID:(unsigned int)a3
{
  uids = self->_uids;
  [MEMORY[0x189607968] numberWithUnsignedInt:*(void *)&a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](uids, "addObject:", v4);
}

- (void)setPredicate:(id)a3
{
  id v19 = a3;
  if (!v19)
  {
    predicate = (_OSLogPredicateMapper *)self->_predicate;
    self->_predicate = 0LL;
LABEL_9:

    v11 = -[_OSLogStreamFilter initWithPredicate:]( objc_alloc(&OBJC_CLASS____OSLogStreamFilter),  "initWithPredicate:",  self->_predicate);
    streamFilter = self->_streamFilter;
    self->_streamFilter = v11;

    return;
  }

  predicate = -[_OSLogPredicateMapper initWithPredicate:andValidate:]( objc_alloc(&OBJC_CLASS____OSLogPredicateMapper),  "initWithPredicate:andValidate:",  v19,  0LL);
  uint64_t v5 = objc_alloc(&OBJC_CLASS____OSLogLegacyPredicateMapper);
  v6 = -[_OSLogPredicateMapper mappedPredicate](predicate, "mappedPredicate");
  v7 = -[_OSLogPredicateMapper initWithPredicate:](v5, "initWithPredicate:", v6);

  -[_OSLogPredicateMapper mappedPredicate](v7, "mappedPredicate");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_OSLogPredicateMapper mappedPredicate](v7, "mappedPredicate");
    v9 = (NSCompoundPredicate *)objc_claimAutoreleasedReturnValue();
    v10 = self->_predicate;
    self->_predicate = v9;

    if ((-[_OSLogPredicateMapper flags](predicate, "flags") & 1) != 0) {
      self->_options |= 0x300uLL;
    }
    if ((-[_OSLogPredicateMapper flags](predicate, "flags") & 2) != 0) {
      self->_options |= 0x100uLL;
    }

    goto LABEL_9;
  }

  v13 = (void *)MEMORY[0x189603F70];
  v14 = -[_OSLogPredicateMapper validationErrors](v7, "validationErrors");
  [v14 componentsJoinedByString:@"\n"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 exceptionWithName:@"OSLogInvalidPredicateException" reason:v15 userInfo:0];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
  -[OSActivityStream start](v17, v18);
}

- (void)start
{
  if (self->_device) {
    -[OSActivityStream startRemote](self, "startRemote");
  }
  else {
    -[OSActivityStream startLocal](self, "startLocal");
  }
}

- (BOOL)streamEvent:(id)a3 error:(id)a4
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (!v7)
  {
    if (self->_delegateStreamErrorLess)
    {
      if (!v6)
      {
        char v15 = [WeakRetained activityStream:self results:0];
        goto LABEL_16;
      }

      v18[0] = v6;
      [MEMORY[0x189603F18] arrayWithObjects:v18 count:1];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v9 activityStream:self results:v11];
    }

    else
    {
      if (!self->_delegateStreamWithError) {
        goto LABEL_4;
      }
      if (!v6)
      {
        v13 = self;
        id v14 = 0LL;
LABEL_10:
        char v15 = [WeakRetained activityStream:v13 results:0 error:v14];
LABEL_16:
        BOOL v10 = v15;
        goto LABEL_17;
      }

      id v17 = v6;
      [MEMORY[0x189603F18] arrayWithObjects:&v17 count:1];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v9 activityStream:self results:v11 error:0];
    }

    BOOL v10 = v12;

    goto LABEL_17;
  }

  if (!self->_delegateHasDidFail)
  {
    if (!self->_delegateStreamWithError) {
      goto LABEL_4;
    }
    v13 = self;
    id v14 = v7;
    goto LABEL_10;
  }

  [WeakRetained streamDidFail:self error:v7];
LABEL_4:
  BOOL v10 = 1;
LABEL_17:

  return v10;
}

- (void)startRemote
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  int64_t v3 = -[OSLogDevice devType](self->_device, "devType");
  if (v3 == 2)
  {
    -[OSActivityStream startLocal](self, "startLocal");
    return;
  }

  if (v3 == 1)
  {
    id v4 = -[OSLogDevice mobileDeviceRef](self->_device, "mobileDeviceRef");
    uint64_t v5 = self;
    if (_logdev_mobdev_vtable_onceToken != -1) {
      dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2509);
    }
    id v6 = 0LL;
    id v7 = &_logdev_mobdev_vtable_vtab;
    if (!_logdev_mobdev_vtable_valid) {
      id v7 = 0LL;
    }
    mobdevtab = (uint64_t)v7;
    if (!_logdev_mobdev_vtable_valid) {
      goto LABEL_51;
    }
    uint64_t v8 = MEMORY[0x1895F87A8];
    v44[0] = MEMORY[0x1895F87A8];
    v44[1] = 0x40000000LL;
    v44[2] = __logdev_stream_events_block_invoke;
    v44[3] = &__block_descriptor_tmp_2537;
    v44[4] = logdev_message_callback;
    v44[5] = v5;
    int v49 = 0xFFFF;
    int valuePtr = -1;
    int v48 = 60;
    CFTypeRef v47 = 0LL;
    if (_CopyOTRServiceConnectionForDevice((uint64_t)v4, &v47, @"com.apple.os_trace_relay"))
    {
      if (_CopyOTRServiceConnectionForDevice((uint64_t)v4, &v47, @"com.apple.syslog_relay"))
      {
        id v6 = 0LL;
LABEL_51:
        v5->_deviceEventSession = v6;
        return;
      }

      SEL v18 = 0LL;
      id v17 = 0LL;
      cf = 0LL;
      CFTypeRef v14 = v47;
      goto LABEL_21;
    }

    CFNumberRef v10 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    CFNumberRef v11 = CFNumberCreate(0LL, kCFNumberIntType, &v49);
    CFNumberRef v12 = CFNumberCreate(0LL, kCFNumberIntType, &v48);
    keys[0] = xmmword_189F0FB58;
    keys[1] = *(_OWORD *)off_189F0FB68;
    values[0] = @"StartActivity";
    values[1] = v10;
    values[2] = v11;
    values[3] = v12;
    CFDictionaryRef v13 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  4LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    CFTypeRef v14 = v47;
    int v15 = (*(uint64_t (**)(CFTypeRef, CFDictionaryRef, uint64_t, void))(mobdevtab + 72))( v47,  v13,  200LL,  0LL);
    if (v15)
    {
      if (v15 == -402653139)
      {
        if (v14)
        {
          (*(void (**)(CFTypeRef))(mobdevtab + 88))(v14);
          CFRelease(v14);
          CFTypeRef v47 = 0LL;
        }

        int v16 = _CopyOTRServiceConnectionForDevice((uint64_t)v4, &v47, @"com.apple.syslog_relay");
        CFTypeRef v14 = v47;
        if (!v16)
        {
          cf = v12;
          id v17 = v11;
          SEL v18 = v10;
LABEL_21:
          v51[0] = 0LL;
          v51[1] = v51;
          v51[2] = 0x2000000000LL;
          char v52 = 1;
          id v19 = dispatch_queue_create("com.apple.os_trace_relay.queue", MEMORY[0x1895F8AF8]);
          int v20 = (*(uint64_t (**)(CFTypeRef))(mobdevtab + 80))(v14);
          v21 = dispatch_source_create(MEMORY[0x1895F8B60], v20, 0LL, v19);
          id v6 = (void *)_os_trace_calloc();
          void *v6 = v14;
          v6[1] = v21;
          *(void *)&__int128 buf = v8;
          *((void *)&buf + 1) = 0x40000000LL;
          v57 = __OTRStartLegacyStreaming_block_invoke;
          v58 = &unk_189F0FBD0;
          v61 = v21;
          CFTypeRef v62 = v14;
          v59 = v44;
          v60 = v51;
          dispatch_source_set_event_handler(v21, &buf);
          dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
          v6[3] = v22;
          if (v22)
          {
            v23 = (dispatch_source_s *)v6[1];
            handler[0] = v8;
            handler[1] = 0x40000000LL;
            handler[2] = __OTRStartLegacyStreaming_block_invoke_2;
            handler[3] = &unk_189F0FBF8;
            handler[4] = v44;
            handler[5] = v6;
            dispatch_source_set_cancel_handler(v23, handler);
            dispatch_activate(v21);
            _Block_object_dispose(v51, 8);
            CFNumberRef v10 = v18;
            CFNumberRef v11 = v17;
            CFNumberRef v12 = cf;
LABEL_43:
            if (v10) {
              CFRelease(v10);
            }
            if (v11) {
              CFRelease(v11);
            }
            if (v12) {
              CFRelease(v12);
            }
            if (v6)
            {
              signal(2, (void (__cdecl *)(int))1);
              dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
              v33 = dispatch_source_create(MEMORY[0x1895F8B68], 2uLL, 0LL, global_queue);
              v6[2] = v33;
              *(void *)&__int128 buf = v8;
              *((void *)&buf + 1) = 0x40000000LL;
              v57 = __logdev_stream_events_block_invoke_2;
              v58 = &__block_descriptor_tmp_4;
              v59 = v6;
              dispatch_source_set_event_handler(v33, &buf);
              dispatch_activate(v33);
            }

            goto LABEL_51;
          }

          free(v6);
          _Block_object_dispose(v51, 8);
          v29 = 0LL;
          CFNumberRef v10 = v18;
          CFNumberRef v11 = v17;
          CFNumberRef v12 = cf;
          goto LABEL_39;
        }
      }

      goto LABEL_38;
    }

    CFRelease(v13);
    LOBYTE(v51[0]) = 0;
    *(void *)&__int128 buf = 0LL;
    if ((*(unsigned int (**)(CFTypeRef, void *, uint64_t))(mobdevtab + 8))(v14, v51, 1LL) == 1)
    {
      int v24 = LOBYTE(v51[0]);
      if (LOBYTE(v51[0]) != 1)
      {
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        LODWORD(handler[0]) = 67109120;
        HIDWORD(handler[0]) = v24;
        v27 = (os_log_s *)MEMORY[0x1895F8DA0];
        v28 = "Got incorrect response type: %hhu";
        goto LABEL_34;
      }

      int v25 = (*(uint64_t (**)(CFTypeRef, __int128 *, void, void))(mobdevtab + 16))(v14, &buf, 0LL, 0LL);
      if (v25)
      {
        int v26 = v25;
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        LODWORD(handler[0]) = 67109120;
        HIDWORD(handler[0]) = v26;
        v27 = (os_log_s *)MEMORY[0x1895F8DA0];
        v28 = "Failed to receive response: %x";
LABEL_34:
        uint32_t v30 = 8;
        goto LABEL_35;
      }

      if ((void)buf)
      {
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID((CFTypeRef)buf))
        {
          v29 = (const void *)buf;
          if ((void)buf)
          {
            Value = CFDictionaryGetValue((CFDictionaryRef)buf, @"Status");
            if (CFEqual(Value, @"RequestSuccessful"))
            {
              uint64_t v36 = v8;
              int v37 = (*(uint64_t (**)(CFTypeRef))(mobdevtab + 80))(v14);
              if (v37 != -1)
              {
                int v38 = v37;
                v39 = (void *)_os_trace_calloc();
                void *v39 = v14;
                v31 = v39;
                v40 = dispatch_queue_create("com.apple.os_trace_relay_client", 0LL);
                v31[3] = dispatch_semaphore_create(0LL);
                v41 = dispatch_source_create(MEMORY[0x1895F8B60], v38, 0LL, v40);
                v31[1] = v41;
                v46[0] = v36;
                v46[1] = 0x40000000LL;
                v46[2] = __OTRCreateActivityStreamForPID_block_invoke;
                v46[3] = &unk_189F0FB80;
                v46[4] = v44;
                v46[5] = v31;
                dispatch_source_set_event_handler(v41, v46);
                v42 = (dispatch_source_s *)v31[1];
                v45[0] = v36;
                v45[1] = 0x40000000LL;
                v45[2] = __OTRCreateActivityStreamForPID_block_invoke_2;
                v45[3] = &unk_189F0FBA8;
                v45[4] = v44;
                v45[5] = v31;
                dispatch_source_set_cancel_handler(v42, v45);
                dispatch_activate((dispatch_object_t)v31[1]);
                if (v40) {
                  dispatch_release(v40);
                }
                uint64_t v8 = v36;
LABEL_42:
                CFRelease(v29);
                id v6 = v31;
                goto LABEL_43;
              }
            }

- (void)startLocal
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  unint64_t options = self->_options;
  if ((options & 4) != 0)
  {
    id v4 = 0LL;
  }

  else
  {
    [MEMORY[0x189603FA8] array];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v5 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __30__OSActivityStream_startLocal__block_invoke;
  aBlock[3] = &unk_189F0E640;
  aBlock[4] = self;
  id v6 = v4;
  id v45 = v6;
  id v7 = _Block_copy(aBlock);
  int v8 = options & 0x100;
  if ((options & 0x200) != 0) {
    int v8 = 288;
  }
  int v9 = options & 1 | (4 * ((options >> 1) & 1)) | v8 | (options >> 31 << 7);
  device = self->_device;
  if (device && -[OSLogDevice devType](device, "devType") == 2)
  {
    id v11 = -[OSLogDevice uid](self->_device, "uid");
    self->_stream = (os_activity_stream_s *)os_activity_stream_for_simulator( (const char *)[v11 UTF8String],  v9,  v7);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  CFNumberRef v12 = self->_pids;
  uint64_t v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v40,  v47,  16LL);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        stream = self->_stream;
        int v18 = [*(id *)(*((void *)&v40 + 1) + 8 * i) intValue];
        if (stream) {
          os_activity_stream_add_pid((uint64_t)stream, v18);
        }
        else {
          self->_stream = (os_activity_stream_s *)os_activity_stream_for_pid(v18, v9, v7);
        }
      }

      uint64_t v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v40,  v47,  16LL);
    }

    while (v14);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v19 = self->_uids;
  uint64_t v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v36,  v46,  16LL);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t j = 0LL; j != v21; ++j)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        int v24 = self->_stream;
        uint64_t v25 = [*(id *)(*((void *)&v36 + 1) + 8 * j) unsignedIntValue];
        if (v24) {
          os_activity_stream_add_uid((uint64_t)v24, v25);
        }
        else {
          self->_stream = (os_activity_stream_s *)os_activity_stream_for_uid(v25, v9, v7);
        }
      }

      uint64_t v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v36,  v46,  16LL);
    }

    while (v21);
  }

  uint64_t v26 = (uint64_t)self->_stream;
  if (!v26)
  {
    uint64_t v26 = os_activity_stream_for_pid(-1, v9, v7);
    self->_stream = (os_activity_stream_s *)v26;
  }

  v35[0] = v5;
  v35[1] = 3221225472LL;
  v35[2] = __30__OSActivityStream_startLocal__block_invoke_2;
  v35[3] = &unk_189F0E668;
  v35[4] = self;
  *(void *)(v26 + 8) = _Block_copy(v35);
  *((_DWORD *)self->_stream + 16) |= LODWORD(self->_eventFilter);
  v27 = -[_OSLogStreamFilter data](self->_streamFilter, "data");
  v28 = v27;
  v29 = self->_stream;
  if (v27)
  {
    id v30 = v27;
    uint64_t v31 = [v30 bytes];
    size_t v32 = [v30 length];
    uint64_t v33 = (uint64_t)v29;
    v34 = (const void *)v31;
  }

  else
  {
    uint64_t v33 = (uint64_t)v29;
    v34 = 0LL;
    size_t v32 = 0LL;
  }

  _os_activity_stream_resume_with_filter(v33, v34, v32);
}

- (void)stop
{
  if (self->_device) {
    -[OSActivityStream stopRemote](self, "stopRemote");
  }
  else {
    -[OSActivityStream stopLocal](self, "stopLocal");
  }
}

- (void)stopLocal
{
  stream = self->_stream;
  if (stream)
  {
    *((_DWORD *)stream + 20) = 89;
    xpc_connection_cancel(*((xpc_connection_t *)stream + 2));
    xpc_release(*((xpc_object_t *)stream + 2));
    self->_stream = 0LL;
  }

- (void)stopRemote
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int64_t v3 = -[OSLogDevice devType](self->_device, "devType");
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      id obj = self;
      objc_sync_enter(obj);
      id v4 = obj;
      uint64_t deviceEventSession = (uint64_t)obj->_deviceEventSession;
      if (deviceEventSession)
      {
        if (_logdev_mobdev_vtable_onceToken != -1)
        {
          int v8 = obj->_deviceEventSession;
          dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2509);
          id v4 = obj;
          uint64_t deviceEventSession = (uint64_t)v8;
        }

        id v6 = &_logdev_mobdev_vtable_vtab;
        if (!_logdev_mobdev_vtable_valid) {
          id v6 = 0LL;
        }
        mobdevtab = (uint64_t)v6;
        if (_logdev_mobdev_vtable_valid)
        {
          OTRCancelAndFreeActivityStream(deviceEventSession);
          id v4 = obj;
        }

        v4->_uint64_t deviceEventSession = 0LL;
      }

      objc_sync_exit(v4);
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      device = self->_device;
      *(_DWORD *)__int128 buf = 138412290;
      id v11 = device;
      _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Unknown logging device type %@",  buf,  0xCu);
    }
  }

- (void)setDeviceDelegate:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  deviceSearchSession = self->_deviceSearchSession;
  if (deviceSearchSession)
  {
    if (_logdev_mobdev_vtable_onceToken != -1) {
      dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2509);
    }
    if (_logdev_mobdev_vtable_valid) {
      id v6 = &_logdev_mobdev_vtable_vtab;
    }
    else {
      id v6 = 0LL;
    }
    mobdevtab = (uint64_t)v6;
    if (_logdev_mobdev_vtable_valid) {
      off_18C695FB0(deviceSearchSession);
    }
    self->_deviceSearchSession = 0LL;
  }

  objc_storeWeak((id *)&self->_deviceDelegate, v4);
  if (v4)
  {
    id v7 = self;
    if (_logdev_mobdev_vtable_onceToken != -1) {
      dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2509);
    }
    int v8 = 0LL;
    if (_logdev_mobdev_vtable_valid) {
      int v9 = &_logdev_mobdev_vtable_vtab;
    }
    else {
      int v9 = 0LL;
    }
    mobdevtab = (uint64_t)v9;
    if (_logdev_mobdev_vtable_valid)
    {
      CFNumberRef v10 = (void *)_os_trace_calloc();
      void *v10 = logdev_notification_callback;
      v10[1] = v7;
      Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      if (Mutable)
      {
        uint64_t v12 = Mutable;
        CFDictionarySetValue( Mutable,  @"NotificationOptionSearchForPairedDevices",  (const void *)*MEMORY[0x189604DE8]);
        (*(void (**)(void (*)(uint64_t, uint64_t), void, void, void *, uint8_t *, __CFDictionary *))(mobdevtab + 104))( observation_callback,  0LL,  0LL,  v10,  buf,  v12);
        CFRelease(v12);
        int v8 = *(void **)buf;
      }

      else
      {
        free(v10);
        int v8 = 0LL;
      }
    }

    self->_deviceSearchSession = v8;
    uint64_t v13 = v7;
    if (watchForSims_onceToken != -1) {
      dispatch_once(&watchForSims_onceToken, &__block_literal_global_286);
    }
    if (watchForSims_SimServiceContextClass && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v14 = (void *)MEMORY[0x186E40118]();
      id v39 = 0LL;
      [(id)watchForSims_SimServiceContextClass sharedServiceContextForDeveloperDir:0 error:&v39];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v39;
      id v17 = v16;
      if (v15)
      {
        id v38 = v16;
        [v15 defaultDeviceSetWithError:&v38];
        int v18 = (void *)objc_claimAutoreleasedReturnValue();
        id v19 = v38;

        if (v18)
        {
          context = v14;
          dispatch_get_global_queue(17LL, 0LL);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = MEMORY[0x1895F87A8];
          v36[1] = 3221225472LL;
          v36[2] = __watchForSims_block_invoke_2;
          v36[3] = &unk_189F0E6B0;
          uint64_t v21 = v13;
          __int128 v37 = v21;
          [v18 registerNotificationHandlerOnQueue:v20 handler:v36];

          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          [v18 devices];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:buf count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v33;
            do
            {
              for (uint64_t i = 0LL; i != v24; ++i)
              {
                if (*(void *)v33 != v25) {
                  objc_enumerationMutation(v22);
                }
                _simDeviceUpdate(*(void **)(*((void *)&v32 + 1) + 8 * i), v21);
              }

              uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:buf count:16];
            }

            while (v24);
          }

          uint64_t v14 = context;
        }

        else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          id v29 = [v19 localizedDescription];
          uint64_t v30 = [v29 UTF8String];
          *(_DWORD *)__int128 buf = 136315138;
          *(void *)&uint8_t buf[4] = v30;
          _os_log_impl(&dword_186981000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "watchForSims error: %s", buf, 0xCu);
        }
      }

      else
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [v17 localizedDescription];
          uint64_t v28 = [v27 UTF8String];
          *(_DWORD *)__int128 buf = 136315138;
          *(void *)&uint8_t buf[4] = v28;
          _os_log_impl(&dword_186981000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "watchForSims error: %s", buf, 0xCu);
        }

        id v19 = v17;
      }

      objc_autoreleasePoolPop(v14);
    }
  }
}

- (id)getInfoForDevice:(id)a3 andKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      CFNumberRef v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v11 = "Invalid input.";
      uint32_t v12 = 2;
LABEL_16:
      _os_log_impl(&dword_186981000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v12);
    }

- (BOOL)establishTrust:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 devType];
    if (v6 == 2)
    {
      BOOL v15 = 1;
    }

    else
    {
      if (v6 == 1)
      {
        uint64_t v7 = [v5 mobileDeviceRef];
        int v8 = self;
        strcpy(buffer, "0000000000000000000000000000000000000000");
        buffer[41] = 0;
        if (!v7)
        {
          int v13 = 0;
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v25) = 0;
            _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Invalid inputs",  (uint8_t *)&v25,  2u);
            int v13 = 0;
          }

          goto LABEL_26;
        }

        int v9 = v8;
        CFNumberRef v10 = (const __CFString *)(*(uint64_t (**)(uint64_t))(mobdevtab + 128))(v7);
        id v11 = v10;
        if (v10) {
          CFStringGetCString(v10, buffer, 42LL, 0x8000100u);
        }
        int v12 = (*(uint64_t (**)(uint64_t))(mobdevtab + 32))(v7);
        if (v12)
        {
          int v13 = v12;
          uint64_t v14 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 136315650;
            uint64_t v26 = buffer;
            __int16 v27 = 1024;
            int v28 = v13;
            __int16 v29 = 2112;
            uint64_t v30 = v14;
            _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "(%s) AMDeviceConnect failed with %08x (%@)\n",  (uint8_t *)&v25,  0x1Cu);
          }

          goto LABEL_22;
        }

        int v19 = (*(uint64_t (**)(uint64_t))(mobdevtab + 40))(v7);
        if (v19 == -402653155 || !v19) {
          goto LABEL_20;
        }
        int v21 = (*(uint64_t (**)(uint64_t))(mobdevtab + 120))(v7);
        if (v21)
        {
          int v13 = v21;
          uint64_t v14 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
          if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          int v25 = 136315650;
          uint64_t v26 = buffer;
          __int16 v27 = 1024;
          int v28 = v13;
          __int16 v29 = 2112;
          uint64_t v30 = v14;
          uint64_t v22 = (os_log_s *)MEMORY[0x1895F8DA0];
          uint64_t v23 = "(%s) AMDevicePair failed with %08x (%@)\n";
        }

        else
        {
          uint64_t v24 = (*(uint64_t (**)(uint64_t))(mobdevtab + 40))(v7);
          if ((_DWORD)v24 == -402653155 || (int v13 = v24) == 0)
          {
LABEL_20:
            logdev_notification_callback(0, (uint64_t)buffer, v7, v9);
            uint64_t v14 = 0LL;
            int v13 = 0;
LABEL_21:
            (*(void (**)(uint64_t))(mobdevtab + 64))(v7);
LABEL_22:
            if (v11) {
              CFRelease(v11);
            }
            if (v14) {
              CFRelease(v14);
            }
LABEL_26:
            BOOL v15 = v13 == 0;
            goto LABEL_27;
          }

          uint64_t v14 = (const void *)(*(uint64_t (**)(uint64_t))(mobdevtab + 136))(v24);
          if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          int v25 = 136315650;
          uint64_t v26 = buffer;
          __int16 v27 = 1024;
          int v28 = v13;
          __int16 v29 = 2112;
          uint64_t v30 = v14;
          uint64_t v22 = (os_log_s *)MEMORY[0x1895F8DA0];
          uint64_t v23 = "(%s) AMDeviceStartSession failed with %08x (%@)\n";
        }

        _os_log_impl(&dword_186981000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v25, 0x1Cu);
        goto LABEL_21;
      }

      BOOL v15 = 0;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buffer = 134217984;
        *(void *)&buffer[4] = [v5 devType];
        id v16 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v17 = "Unknown logging device type %ld";
        uint32_t v18 = 12;
        goto LABEL_15;
      }
    }
  }

  else
  {
    BOOL v15 = 0;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buffer = 0;
      id v16 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v17 = "Invalid input.";
      uint32_t v18 = 2;
LABEL_15:
      _os_log_impl(&dword_186981000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)buffer, v18);
      BOOL v15 = 0;
    }
  }

- (OSDeviceDelegate)deviceDelegate
{
  return (OSDeviceDelegate *)objc_loadWeakRetained((id *)&self->_deviceDelegate);
}

- (OSActivityStreamDelegate)delegate
{
  return (OSActivityStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

- (unint64_t)eventFilter
{
  return self->_eventFilter;
}

- (void)setEventFilter:(unint64_t)a3
{
  self->_eventFilter = a3;
}

- (NSCompoundPredicate)predicate
{
  return self->_predicate;
}

- (OSLogDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __30__OSActivityStream_startLocal__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (!a2)
  {
    uint64_t v8 = 1LL;
    if (!a3) {
      return v8;
    }
    goto LABEL_9;
  }

  +[OSActivityEvent activityEventFromStreamEntry:](&OBJC_CLASS___OSActivityEvent, "activityEventFromStreamEntry:", a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 96LL);
  if (v6)
  {
    if (([v6 evaluateWithObject:v5] & 1) == 0) {
      goto LABEL_7;
    }
  }

  uint64_t v7 = *(void **)(a1 + 40);
  if (v7)
  {
    [v7 addObject:v5];
LABEL_7:
    uint64_t v8 = 1LL;
    goto LABEL_8;
  }

  uint64_t v8 = [*(id *)(a1 + 32) streamEvent:v5 error:0];
LABEL_8:

  if (a3)
  {
LABEL_9:
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:a3 userInfo:0];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [*(id *)(a1 + 32) streamEvent:0 error:v9] & v8;
  }

  return v8;
}

void __30__OSActivityStream_startLocal__block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72LL));
  uint64_t v6 = WeakRetained;
  switch(a3)
  {
    case 3:
      CFNumberRef v10 = WeakRetained;
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:5 userInfo:0];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) streamEvent:0 error:v8];
      [*(id *)(a1 + 32) stop];

      goto LABEL_11;
    case 2:
      CFNumberRef v10 = WeakRetained;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        [v10 streamDidStop:*(void *)(a1 + 32)];
      }

      else
      {
        [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:89 userInfo:0];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 32) streamEvent:0 error:v9];
      }

      [*(id *)(a1 + 32) stop];
      goto LABEL_11;
    case 1:
      CFNumberRef v10 = WeakRetained;
      char v7 = objc_opt_respondsToSelector();
      uint64_t v6 = v10;
      if ((v7 & 1) != 0)
      {
        [v10 streamDidStart:*(void *)(a1 + 32)];
LABEL_11:
        uint64_t v6 = v10;
      }

      break;
  }
}

@end