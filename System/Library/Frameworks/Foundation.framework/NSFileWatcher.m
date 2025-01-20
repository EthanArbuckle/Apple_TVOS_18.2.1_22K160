@interface NSFileWatcher
- (NSFileWatcher)initWithQueue:(id)a3 auditToken:(id *)a4;
- (void)_coalesceSubitemObservations;
- (void)dealloc;
- (void)handleFSEventPath:(id)a3 flags:(unsigned int)a4 id:(unint64_t)a5;
- (void)setLastObservedEventID:(unint64_t)a3;
- (void)setObserver:(id)a3;
- (void)setURL:(id)a3;
- (void)settle;
- (void)start;
- (void)stop;
- (void)unsettle;
- (void)watchItem;
@end

@implementation NSFileWatcher

- (NSFileWatcher)initWithQueue:(id)a3 auditToken:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (initializeFSEvents_predicate != -1) {
    dispatch_once(&initializeFSEvents_predicate, &__block_literal_global_119);
  }
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSFileWatcher;
  v7 = -[NSFileWatcher init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    __int128 v9 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v8->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v8->_auditToken.val[4] = v9;
    v8->_lastObservedEventID = -1LL;
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (self->_isWatching)
  {
    v3 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEFAULT,  "A file watcher that has been started but not stopped is being deallocated",  buf,  2u);
    }
  }

  if (self->_eventStream) {
    off_18C497288();
  }
  eventSource = (dispatch_object_s *)self->_eventSource;
  if (eventSource) {
    dispatch_release(eventSource);
  }

  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileWatcher;
  -[NSFileWatcher dealloc](&v6, sel_dealloc);
}

- (void)handleFSEventPath:(id)a3 flags:(unsigned int)a4 id:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  unsigned int v9 = a4 & 0xFF80FFFF;
  v10 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138478595;
    id v17 = a3;
    __int16 v18 = 1024;
    unsigned int v19 = v9;
    __int16 v20 = 1024;
    unsigned int v21 = a4 & 0x7F0000;
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_debug_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEBUG,  "#fsevents path: %{private}@, flags: %x (ignored: %x), id: %llx",  (uint8_t *)&v16,  0x22u);
  }

  if (self->_isWatching)
  {
    unint64_t lastObservedEventID = self->_lastObservedEventID;
    if (lastObservedEventID == -1LL)
    {
      if (!v9) {
        return;
      }
    }

    else if (!v9 || (a4 & 0x10) != 0 || lastObservedEventID >= a5)
    {
      return;
    }

    if (!self->_isUnsettled)
    {
      uint64_t v12 = (os_log_s *)_NSFCFSEventsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        url = self->_url;
        int v16 = 138477827;
        id v17 = url;
        _os_log_debug_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_DEBUG,  "Unsettling watcher for %{private}@ in response to event",  (uint8_t *)&v16,  0xCu);
      }

      self->_isUnsettled = 1;
    }

    if (self->_eventsAreAboutDirectory)
    {
      v13 = (NSFileWatcherObservations *)-[NSMutableDictionary objectForKey:]( self->_subitemObservationsByEventPath,  "objectForKey:",  a3);
      if (!v13)
      {
        if (!self->_subitemObservationsByEventPath)
        {
          self->_subitemObservationsByEventPath = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
          (*((void (**)(void))self->_observer + 2))();
        }

        v13 = -[NSFileWatcherObservations initWithPath:]( objc_alloc(&OBJC_CLASS___NSFileWatcherObservations),  "initWithPath:",  a3);
        -[NSMutableDictionary setObject:forKey:](self->_subitemObservationsByEventPath, "setObject:forKey:", v13, a3);
      }

      -[NSFileWatcherObservations addContentsChange](v13, "addContentsChange");
    }

    else
    {
      itemObservations = self->_itemObservations;
      if (!itemObservations)
      {
        self->_itemObservations = -[NSFileWatcherObservations initWithPath:]( objc_alloc(&OBJC_CLASS___NSFileWatcherObservations),  "initWithPath:",  -[NSURL path](self->_url, "path"));
        (*((void (**)(void))self->_observer + 2))();
        itemObservations = self->_itemObservations;
      }

      -[NSFileWatcherObservations addAttributeChange](itemObservations, "addAttributeChange");
    }

    self->_unint64_t lastObservedEventID = a5;
  }

- (void)watchItem
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  v3 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = url;
    _os_log_debug_impl(&dword_182EB1000, v3, OS_LOG_TYPE_DEBUG, "Starting to watch %{private}@", (uint8_t *)&buf, 0xCu);
  }

  self->_fileReferenceURL = 0LL;
  self->_formerPath = 0LL;
  if (self->_eventStream)
  {
    off_18C497290();
    off_18C497298(self->_eventStream);
    off_18C497288(self->_eventStream);
    self->_eventStream = 0LL;
  }

  eventSource = self->_eventSource;
  if (eventSource)
  {
    dispatch_source_cancel((dispatch_source_t)eventSource);
    dispatch_release((dispatch_object_t)self->_eventSource);
    self->_eventSource = 0LL;
  }

  if (-[NSURL isFileURL](self->_url, "isFileURL"))
  {
    id v5 = -[NSURL path](self->_url, "path");
    if (v5)
    {
      uint64_t v26 = 0LL;
      v27 = &v26;
      uint64_t v28 = 0x2020000000LL;
      char v29 = 0;
      uint64_t v22 = 0LL;
      unint64_t v23 = &v22;
      uint64_t v24 = 0x2020000000LL;
      char v25 = 0;
      uint64_t v18 = 0LL;
      unsigned int v19 = &v18;
      uint64_t v20 = 0x2020000000LL;
      char v21 = 0;
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v39 = 0x3052000000LL;
      v40 = __Block_byref_object_copy__31;
      v41 = __Block_byref_object_dispose__31;
      uint64_t v42 = 0LL;
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __26__NSFileWatcher_watchItem__block_invoke;
      v17[3] = &unk_189CA5968;
      v17[4] = self;
      v17[5] = &buf;
      v17[6] = &v26;
      v17[7] = &v22;
      v17[8] = &v18;
      uint64_t v6 = [v17 copy];
      *(void *)(*((void *)&buf + 1) + 40LL) = v6;
      self->_eventSource = (OS_dispatch_source *)(*(uint64_t (**)(uint64_t, id, void))(v6 + 16))(v6, v5, 0LL);

      if (*((_BYTE *)v23 + 24))
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v5, 0);
        *(void *)&__int128 v34 = 0LL;
        *((void *)&v34 + 1) = self;
        v35 = MEMORY[0x1896030F0];
        v36 = MEMORY[0x1896030E0];
        v37 = MEMORY[0x189602A10];
        self->_eventStream = (__FSEventStream *)off_18C4972A0( 0LL,  eventStreamCallback,  &v34,  v7,  self->_lastObservedEventID,  19LL,  0.0);

        if (self->_eventStream)
        {
          uint64_t v8 = (os_log_s *)_NSFCFSEventsLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            unint64_t lastObservedEventID = self->_lastObservedEventID;
            *(_DWORD *)v30 = 138478083;
            id v31 = v5;
            __int16 v32 = 2048;
            unint64_t v33 = lastObservedEventID;
            _os_log_debug_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_DEBUG,  "#fsevents Starting stream for %{private}@ with event ID %llx",  v30,  0x16u);
          }

          off_18C4972A8(self->_eventStream, self->_queue);
          if (off_18C4972B0(self->_eventStream))
          {
            self->_eventsAreAboutDirectory = *((_BYTE *)v27 + 24);
            goto LABEL_20;
          }

          off_18C497288(self->_eventStream);
          self->_eventStream = 0LL;
          objc_super v11 = (os_log_s *)_NSFCFSEventsLog();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_DWORD *)v30 = 138477827;
          id v31 = v5;
          uint64_t v12 = "#fsevents FSEventStreamStart() returned NO. Path: %{private}@";
        }

        else
        {
          objc_super v11 = (os_log_s *)_NSFCFSEventsLog();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_DWORD *)v30 = 138477827;
          id v31 = v5;
          uint64_t v12 = "#fsevents FSEventStreamCreate() returned NULL. Path: %{private}@";
        }

        _os_log_error_impl(&dword_182EB1000, v11, OS_LOG_TYPE_ERROR, v12, v30, 0xCu);
      }

uint64_t __26__NSFileWatcher_watchItem__block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v6 = MEMORY[0x1895F87A8];
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v27 = __26__NSFileWatcher_watchItem__block_invoke_2;
  uint64_t v28 = &unk_189CA58C8;
  uint64_t v7 = a1[5];
  uint64_t v29 = a3;
  uint64_t v30 = v7;
  uint64_t v8 = +[_NSFileWatcherFileHandleInfo openFileWithPath:]( &OBJC_CLASS____NSFileWatcherFileHandleInfo,  "openFileWithPath:",  a2);
  if (!v8) {
    return v27((uint64_t)v26, a2);
  }
  unsigned int v9 = v8;
  int v10 = v8[2];
  if (a3)
  {
    unint64_t v11 = 32LL;
    goto LABEL_4;
  }

  *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = [v8 isDirectory];
  uint64_t v16 = a1[4];
  __int128 v17 = *(_OWORD *)(v16 + 32);
  *(_OWORD *)&buf.f_bsize = *(_OWORD *)(v16 + 16);
  *(_OWORD *)&buf.f_bfree = v17;
  if (([v9 verifyAccessByAuditToken:&buf] & 1) == 0)
  {
    unsigned int v19 = (os_log_s *)_NSFCFSEventsLog();
    char v18 = 0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138477827;
      *(void *)&buf.f_iosize = a2;
      _os_log_impl( &dword_182EB1000,  v19,  OS_LOG_TYPE_DEFAULT,  "Refused to register file watcher for file at path %{private}@ on behalf of an NSFilePresenter because the reques ting process does not have access to it",  (uint8_t *)&buf,  0xCu);
      char v18 = 0;
    }

uint64_t __26__NSFileWatcher_watchItem__block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend((id)objc_msgSend(a2, "stringByDeletingLastPathComponent"), "isEqualToString:", @"/")) {
    return 0LL;
  }
  id v5 = (void *)[a2 lastPathComponent];
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v5, "stringByAppendingPathComponent:");
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 16LL))();
}

uint64_t __26__NSFileWatcher_watchItem__block_invoke_68(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
  return result;
}

void __26__NSFileWatcher_watchItem__block_invoke_2_69(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  unint64_t data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  v3 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)statfs buf = 138478083;
    uint64_t v16 = v10;
    __int16 v17 = 2048;
    unint64_t v18 = data;
    _os_log_debug_impl(&dword_182EB1000, v3, OS_LOG_TYPE_DEBUG, "#vnode path: %{private}@, flags: %p", buf, 0x16u);
  }

  uint64_t v4 = *(void *)(a1 + 48);
  if (*(_BYTE *)(v4 + 64))
  {
    if (!*(_BYTE *)(v4 + 97))
    {
      id v5 = (os_log_s *)_NSFCFSEventsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 48LL);
        *(_DWORD *)statfs buf = 138477827;
        uint64_t v16 = v11;
        _os_log_debug_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_DEBUG,  "Unsettling watcher for %{private}@ in response to event",  buf,  0xCu);
      }

      *(_BYTE *)(*(void *)(a1 + 48) + 97LL) = 1;
      uint64_t v4 = *(void *)(a1 + 48);
    }

    if (*(void *)(v4 + 104))
    {
      if ((data & 0x20) == 0) {
        goto LABEL_20;
      }
    }

    else
    {
      *(void *)(*(void *)(a1 + 48) + 104) = -[NSFileWatcherObservations initWithPath:]( [NSFileWatcherObservations alloc],  "initWithPath:",  [*(id *)(*(void *)(a1 + 48) + 48) path]);
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 56LL) + 16LL))();
      if ((data & 0x20) == 0) {
        goto LABEL_20;
      }
    }

    if (fcntl(*(_DWORD *)(a1 + 80), 50, buf) != -1)
    {
      uint64_t v6 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", buf);
      uint64_t v7 = *(dispatch_source_s **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
      if (v7)
      {
        dispatch_source_cancel(v7);
        dispatch_release(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));
      }

      *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
      uint64_t v8 = (uint64_t)v6;
      if (*(void *)(a1 + 56)) {
        uint64_t v8 = -[NSString stringByAppendingPathComponent:](v6, "stringByAppendingPathComponent:", *(void *)(a1 + 56));
      }
      [*(id *)(*(void *)(a1 + 48) + 104) addDetectedMoveToPath:v8];

      if ((data & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }

    unsigned int v9 = (os_log_s *)_NSFCFSEventsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = *__error();
      *(_DWORD *)v13 = 67109120;
      int v14 = v12;
      _os_log_error_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_ERROR,  "A presented file was moved but its new name couldn't be gotten. Error: %i",  v13,  8u);
      if ((data & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }

void __26__NSFileWatcher_watchItem__block_invoke_70(uint64_t a1)
{
  v2 = *(dispatch_source_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = 0LL;
  }
}

- (void)setURL:(id)a3
{
  uint64_t v4 = (NSURL *)[a3 filePathURL];
  url = self->_url;
  if (v4 != url)
  {
    uint64_t v6 = v4;
    if (self->_isUnsettled)
    {
      -[NSFileWatcherObservations addAnnouncedMoveToPath:]( self->_itemObservations,  "addAnnouncedMoveToPath:",  -[NSURL path](v4, "path"));
      url = self->_url;
      if (!self->_formerURL)
      {
        self->_formerURL = url;
        url = self->_url;
      }
    }

    self->_url = (NSURL *)-[NSURL copy](v6, "copy");
    if (!self->_isUnsettled && self->_isWatching) {
      -[NSFileWatcher watchItem](self, "watchItem");
    }
  }

- (void)setLastObservedEventID:(unint64_t)a3
{
  self->_unint64_t lastObservedEventID = a3;
}

- (void)setObserver:(id)a3
{
  id observer = self->_observer;
  if (observer != a3)
  {

    self->_id observer = (id)[a3 copy];
  }

- (void)start
{
  self->_isWatching = 1;
  -[NSFileWatcher watchItem](self, "watchItem");
}

- (void)unsettle
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v3 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    int v5 = 138477827;
    uint64_t v6 = url;
    _os_log_debug_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEBUG,  "Manually unsettling watcher for %{private}@",  (uint8_t *)&v5,  0xCu);
  }

  self->_isUnsettled = 1;
  if (!self->_itemObservations)
  {
    self->_itemObservations = -[NSFileWatcherObservations initWithPath:]( objc_alloc(&OBJC_CLASS___NSFileWatcherObservations),  "initWithPath:",  -[NSURL path](self->_url, "path"));
    (*((void (**)(void))self->_observer + 2))();
  }

- (void)_coalesceSubitemObservations
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000LL;
  uint64_t v8 = __Block_byref_object_copy__66;
  unsigned int v9 = __Block_byref_object_dispose__67;
  uint64_t v10 = 0LL;
  subitemObservationsByEventPath = self->_subitemObservationsByEventPath;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __45__NSFileWatcher__coalesceSubitemObservations__block_invoke;
  v4[3] = &unk_189CA5990;
  v4[4] = self;
  v4[5] = &v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( subitemObservationsByEventPath,  "enumerateKeysAndObjectsUsingBlock:",  v4);
  if (v6[5])
  {
    -[NSMutableDictionary setDictionary:](self->_subitemObservationsByEventPath, "setDictionary:");
  }

  _Block_object_dispose(&v5, 8);
}

void __45__NSFileWatcher__coalesceSubitemObservations__block_invoke(uint64_t a1, const __CFString *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  CFURLRef v3 = CFURLCreateWithFileSystemPath(0LL, a2, kCFURLPOSIXPathStyle, 0);
  if (v3)
  {
    CFURLRef v4 = v3;
    if (_CFURLIsItemPromiseAtURL())
    {
      uint64_t v5 = (void *)_CFURLCopyLogicalURLOfPromiseAtURL();
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = [v5 path];
        if ([*(id *)(*(void *)(a1 + 32) + 112) objectForKey:v7])
        {
          uint64_t v8 = (os_log_s *)_NSFCFSEventsLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            int v10 = 138477827;
            uint64_t v11 = v7;
            _os_log_debug_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_DEBUG,  "Coalescing observations for both the logical URL %{private}@ and its promise URL",  (uint8_t *)&v10,  0xCu);
          }

          unsigned int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
          if (!v9)
          {
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 112) mutableCopy];
            unsigned int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
          }

          [v9 removeObjectForKey:v7];
        }

        CFRelease(v6);
      }
    }

    CFRelease(v4);
  }

- (void)settle
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (self->_isUnsettled)
  {
    CFURLRef v3 = (os_log_s *)_NSFCFSEventsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      url = self->_url;
      *(_DWORD *)statfs buf = 138477827;
      char v21 = url;
      _os_log_debug_impl(&dword_182EB1000, v3, OS_LOG_TYPE_DEBUG, "Settling watcher for %{private}@", buf, 0xCu);
    }

    fileReferenceURL = self->_fileReferenceURL;
    if (fileReferenceURL)
    {
      formerPath = self->_formerPath;
      if (!formerPath)
      {
LABEL_15:
        itemObservations = self->_itemObservations;
        uint64_t v10 = MEMORY[0x1895F87A8];
        v18[0] = MEMORY[0x1895F87A8];
        v18[1] = 3221225472LL;
        v18[2] = __23__NSFileWatcher_settle__block_invoke;
        v18[3] = &unk_189CA59B8;
        char v19 = (char)formerPath;
        v18[4] = self;
        v18[5] = @"/private";
        -[NSFileWatcherObservations notifyObserver:](itemObservations, "notifyObserver:", v18);

        self->_itemObservations = 0LL;
        -[NSFileWatcher _coalesceSubitemObservations](self, "_coalesceSubitemObservations");
        id v11 = -[NSURL path](self->_url, "path");
        id v12 = -[NSURL path](self->_formerURL, "path");
        subitemObservationsByEventPath = self->_subitemObservationsByEventPath;
        v17[0] = v10;
        v17[1] = 3221225472LL;
        v17[2] = __23__NSFileWatcher_settle__block_invoke_78;
        v17[3] = &unk_189CA5A08;
        v17[4] = v11;
        v17[5] = v12;
        v17[6] = @"/private";
        v17[7] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( subitemObservationsByEventPath,  "enumerateKeysAndObjectsUsingBlock:",  v17);

        self->_subitemObservationsByEventPath = 0LL;
        (*((void (**)(void))self->_observer + 2))();

        self->_formerURL = 0LL;
        self->_isUnsettled = 0;
        return;
      }

      CFURLClearResourcePropertyCache((CFURLRef)fileReferenceURL);
      id v6 = -[NSURL path](self->_fileReferenceURL, "path");
      uint64_t v7 = (os_log_s *)_NSFCFSEventsLog();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8)
        {
          uint64_t v15 = self->_formerPath;
          *(_DWORD *)statfs buf = 138478083;
          char v21 = v15;
          __int16 v22 = 2113;
          id v23 = v6;
          _os_log_debug_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEBUG,  "#filereference Detected move from %{private}@ to %{private}@",  buf,  0x16u);
        }

        if (([v6 isEqualToString:self->_formerPath] & 1) == 0)
        {
          -[NSFileWatcherObservations addDetectedMoveToPath:](self->_itemObservations, "addDetectedMoveToPath:", v6);
          LOBYTE(formerPath) = 1;
          goto LABEL_15;
        }
      }

      else
      {
        if (v8)
        {
          uint64_t v16 = self->_formerPath;
          *(_DWORD *)statfs buf = 138477827;
          char v21 = v16;
          _os_log_debug_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEBUG,  "#filereference Detected deletion of %{private}@",  buf,  0xCu);
        }

        -[NSFileWatcherObservations addDeletion](self->_itemObservations, "addDeletion");
      }
    }

    LOBYTE(formerPath) = 0;
    goto LABEL_15;
  }

void __23__NSFileWatcher_settle__block_invoke(uint64_t a1, int a2, unsigned int a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 48)) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = a2 == 0;
  }
  if (!v7)
  {
    BOOL v8 = (os_log_s *)_NSFCFSEventsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      _os_log_debug_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_DEBUG,  "Re-watching for new or moved file",  (uint8_t *)&v11,  2u);
    }

    [*(id *)(a1 + 32) watchItem];
  }

  unsigned int v9 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134218243;
    uint64_t v12 = a3;
    __int16 v13 = 2113;
    int v14 = a4;
    _os_log_debug_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEBUG,  "Notifying the observer. Subitem path: <none>, event kind: %p, event path: %{private}@",  (uint8_t *)&v11,  0x16u);
  }

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:a4];
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56LL) + 16LL))();
}

uint64_t __23__NSFileWatcher_settle__block_invoke_78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)a3[4];
  uint64_t result = [v5 caseInsensitiveCompare:*(void *)(a1 + 32)];
  if (result)
  {
    if (!*(void *)(a1 + 40) || (uint64_t result = objc_msgSend(v5, "caseInsensitiveCompare:")) != 0)
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __23__NSFileWatcher_settle__block_invoke_2;
      v7[3] = &unk_189CA59E0;
      __int128 v8 = *(_OWORD *)(a1 + 48);
      return [a3 notifyObserver:v7];
    }
  }

  return result;
}

void __23__NSFileWatcher_settle__block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  BOOL v7 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    uint64_t v10 = a4;
    __int16 v11 = 2048;
    uint64_t v12 = a3;
    __int16 v13 = 2112;
    int v14 = a4;
    _os_log_debug_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEBUG,  "Notifying the observer. Subitem path: %@, event kind: %p, event path: %@",  (uint8_t *)&v9,  0x20u);
  }

  __int128 v8 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:a4];
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 56LL) + 16LL))();
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  CFURLRef v3 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    int v6 = 138477827;
    BOOL v7 = url;
    _os_log_debug_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEBUG,  "Stopping watcher for %{private}@",  (uint8_t *)&v6,  0xCu);
  }

  if (self->_isUnsettled)
  {

    self->_itemObservations = 0LL;
    self->_subitemObservationsByEventPath = 0LL;
    (*((void (**)(void))self->_observer + 2))();

    self->_formerURL = 0LL;
    self->_isUnsettled = 0;
  }

  self->_formerPath = 0LL;
  self->_fileReferenceURL = 0LL;
  if (self->_eventStream)
  {
    off_18C497290();
    off_18C497298(self->_eventStream);
    off_18C497288(self->_eventStream);
    self->_eventStream = 0LL;
  }

  eventSource = self->_eventSource;
  if (eventSource)
  {
    dispatch_source_cancel((dispatch_source_t)eventSource);
    dispatch_release((dispatch_object_t)self->_eventSource);
    self->_eventSource = 0LL;
  }

  self->_isWatching = 0;
}

@end