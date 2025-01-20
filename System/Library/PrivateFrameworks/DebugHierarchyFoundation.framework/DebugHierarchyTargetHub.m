@interface DebugHierarchyTargetHub
+ (float)debugHierarchyVersion;
+ (id)performDebugRequest:(int64_t)a3;
+ (id)sharedHub;
- (BOOL)performRequestInPlaceWithRequestInBase64:(id)a3;
- (DebugHierarchyRuntimeInfo)runtimeInfo;
- (DebugHierarchyTargetHub)init;
- (NSData)response;
- (NSMapTable)knownObjectsMap;
- (NSMutableDictionary)additionalKnownObjects;
- (NSString)currentRequestInBase64;
- (OS_dispatch_queue)agentConnectionQueue;
- (OS_xpc_object)currentReply;
- (const)currentResponseBytes;
- (id)performRequest:(id)a3;
- (id)performRequest:(id)a3 error:(id *)a4;
- (id)performRequestWithRequestInBase64:(id)a3;
- (int)currentResponseFileDescriptor;
- (int)darwinNotificationToken;
- (unint64_t)currentResponseLength;
- (void)clearAllRequestsAndData;
- (void)handleXPCEvent:(id)a3;
- (void)openXPCConnection;
- (void)performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:(id)a3 fileDescriptor:(int)a4;
- (void)registerForDarwinNotifications;
- (void)setAdditionalKnownObjects:(id)a3;
- (void)setCurrentReply:(id)a3;
- (void)setCurrentRequest:(id)a3 responseFileDescriptor:(int)a4 reply:(id)a5;
- (void)setCurrentRequestInBase64:(id)a3;
- (void)setCurrentResponseFileDescriptor:(int)a3;
@end

@implementation DebugHierarchyTargetHub

+ (float)debugHierarchyVersion
{
  return 4.0;
}

+ (id)sharedHub
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __36__DebugHierarchyTargetHub_sharedHub__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHub_onceToken_0 != -1) {
    dispatch_once(&sharedHub_onceToken_0, block);
  }
  return (id)sharedHub_sharedHub_0;
}

void __36__DebugHierarchyTargetHub_sharedHub__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedHub_sharedHub_0;
  sharedHub_sharedHub_0 = (uint64_t)v1;
}

- (DebugHierarchyTargetHub)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DebugHierarchyTargetHub;
  v2 = -[DebugHierarchyTargetHub init](&v11, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("DebugHierarchyAgentXPCQueue", 0LL);
    agentConnectionQueue = v2->_agentConnectionQueue;
    v2->_agentConnectionQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    knownObjectsMap = v2->_knownObjectsMap;
    v2->_knownObjectsMap = (NSMapTable *)v5;

    uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v7);
    additionalKnownObjects = v2->_additionalKnownObjects;
    v2->_additionalKnownObjects = (NSMutableDictionary *)v8;
  }

  return v2;
}

- (void)clearAllRequestsAndData
{
  knownObjectsMap = self->_knownObjectsMap;
  self->_knownObjectsMap = 0LL;

  runtimeInfo = self->_runtimeInfo;
  self->_runtimeInfo = 0LL;

  response = self->_response;
  self->_response = 0LL;

  additionalKnownObjects = self->_additionalKnownObjects;
  self->_additionalKnownObjects = 0LL;

  DBGClearCachedFormatSpecifiers();
}

- (NSMapTable)knownObjectsMap
{
  knownObjectsMap = self->_knownObjectsMap;
  if (!knownObjectsMap)
  {
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToWeakObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToWeakObjectsMapTable"));
    uint64_t v5 = self->_knownObjectsMap;
    self->_knownObjectsMap = v4;

    knownObjectsMap = self->_knownObjectsMap;
  }

  return knownObjectsMap;
}

- (NSMutableDictionary)additionalKnownObjects
{
  additionalKnownObjects = self->_additionalKnownObjects;
  if (!additionalKnownObjects)
  {
    v4 = (NSMutableDictionary *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
    uint64_t v5 = self->_additionalKnownObjects;
    self->_additionalKnownObjects = v4;

    additionalKnownObjects = self->_additionalKnownObjects;
  }

  return additionalKnownObjects;
}

- (DebugHierarchyRuntimeInfo)runtimeInfo
{
  runtimeInfo = self->_runtimeInfo;
  if (!runtimeInfo)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyRuntimeInfo);
    uint64_t v5 = self->_runtimeInfo;
    self->_runtimeInfo = v4;

    runtimeInfo = self->_runtimeInfo;
  }

  return runtimeInfo;
}

- (id)performRequestWithRequestInBase64:(id)a3
{
  id v4 = a3;
  id v15 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithBase64Data:error:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithBase64Data:error:",  v4,  &v15));
  id v6 = v15;
  uint64_t v7 = objc_autoreleasePoolPush();
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 debugHierarchyResponseDataForRequest:v5]);
  }

  else
  {
    id v14 = 0LL;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyTargetHub performRequest:error:](self, "performRequest:error:", v5, &v14));
    id v10 = v14;
    objc_super v11 = v10;
    if (v10) {
      id v12 = (id)objc_claimAutoreleasedReturnValue([v10 debugHierarchyResponseDataForRequest:v5]);
    }
    else {
      id v12 = v9;
    }
    uint64_t v8 = v12;
  }

  objc_autoreleasePoolPop(v7);

  return v8;
}

- (id)performRequest:(id)a3
{
  return -[DebugHierarchyTargetHub performRequest:error:](self, "performRequest:error:", a3, 0LL);
}

- (id)performRequest:(id)a3 error:(id *)a4
{
  id v4 = a3;
  if (v4)
  {
    id v5 = DebugHierarchyRequestsOSLog_0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, v4);
    uint64_t v8 = v6;
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v10;
      _os_signpost_emit_with_name_impl( &dword_0,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "Perform Request",  "(%{public}@)",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x3032000000LL;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    id v33 = 0LL;
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    v23 = __48__DebugHierarchyTargetHub_performRequest_error___block_invoke;
    v24 = &unk_20898;
    id v11 = v4;
    id v25 = v11;
    p___int128 buf = &buf;
    id v12 = objc_retainBlock(&v21);
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread", v21, v22, v23, v24)) {
      ((void (*)(void ***))v12[2])(v12);
    }
    else {
      dispatch_sync(&_dispatch_main_q, v12);
    }
    id v14 = DebugHierarchyRequestsOSLog_0();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v11);
    v17 = v15;
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      id v19 = [*(id *)(*((void *)&buf + 1) + 40) length];
      *(_DWORD *)v27 = 134217984;
      id v28 = v19;
      _os_signpost_emit_with_name_impl( &dword_0,  v18,  OS_SIGNPOST_INTERVAL_END,  v16,  "Perform Request",  "Completed with size: %{xcode:size-in-bytes}lu",  v27,  0xCu);
    }

    id v13 = *(id *)(*((void *)&buf + 1) + 40LL);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

void __48__DebugHierarchyTargetHub_performRequest_error___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequestExecutor executorWithRequest:]( &OBJC_CLASS___DebugHierarchyRequestExecutor,  "executorWithRequest:",  *(void *)(a1 + 32)));
  id v7 = 0LL;
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 runWithError:&v7]);
  id v4 = v7;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)performRequestInPlaceWithRequestInBase64:(id)a3
{
  id v4 = (NSData *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyTargetHub performRequestWithRequestInBase64:]( self,  "performRequestWithRequestInBase64:",  a3));
  response = self->_response;
  self->_response = v4;

  return 1;
}

- (void)performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:(id)a3 fileDescriptor:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyTargetHub performRequestWithRequestInBase64:]( self,  "performRequestWithRequestInBase64:",  v6));
  uint64_t v8 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v4,  1LL);
  id v11 = 0LL;
  unsigned __int8 v9 = -[NSFileHandle writeData:error:](v8, "writeData:error:", v7, &v11);
  id v10 = v11;
  if ((v9 & 1) == 0 && v10) {
    -[DebugHierarchyTargetHub performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:fileDescriptor:].cold.1();
  }
}

- (const)currentResponseBytes
{
  return -[NSData bytes](self->_response, "bytes");
}

- (unint64_t)currentResponseLength
{
  return -[NSData length](self->_response, "length");
}

- (void)registerForDarwinNotifications
{
  __assert_rtn( "-[DebugHierarchyTargetHub registerForDarwinNotifications]",  "DebugHierarchyTargetHub.m",  169,  "notifyStatus == NOTIFY_STATUS_OK");
}

id __57__DebugHierarchyTargetHub_registerForDarwinNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openXPCConnection];
}

- (void)openXPCConnection
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  mach_service = xpc_connection_create_mach_service( "com.apple.dt.ViewHierarchyTargetHub.xpc",  (dispatch_queue_t)self->_agentConnectionQueue,  0LL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __44__DebugHierarchyTargetHub_openXPCConnection__block_invoke;
  handler[3] = &unk_208E8;
  handler[4] = self;
  uint64_t v5 = v3;
  id v13 = v5;
  xpc_connection_set_event_handler(mach_service, handler);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__DebugHierarchyTargetHub_openXPCConnection__block_invoke_2;
  block[3] = &unk_20910;
  unsigned __int8 v9 = mach_service;
  id v10 = v5;
  id v11 = self;
  id v6 = v5;
  id v7 = mach_service;
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t __44__DebugHierarchyTargetHub_openXPCConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __44__DebugHierarchyTargetHub_openXPCConnection__block_invoke_2(uint64_t a1)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), empty);
  while (1)
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) currentRequestInBase64]);

    if (!v3) {
      break;
    }
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentRequestInBase64]);
    objc_msgSend( v4,  "performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:fileDescriptor:",  v5,  objc_msgSend(*(id *)(a1 + 48), "currentResponseFileDescriptor"));

    id v6 = *(_xpc_connection_s **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) currentReply]);
    xpc_connection_send_message(v6, v7);
  }

  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  [*(id *)(a1 + 48) clearAllRequestsAndData];
}

- (void)handleXPCEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    size_t length = 0LL;
    data = xpc_dictionary_get_data(v5, "request", &length);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data, length));
    uint64_t v8 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v7, 4LL);
    uint64_t v9 = xpc_dictionary_dup_fd(v5, "fd");
    if ((v9 & 0x80000000) != 0)
    {
      -[DebugHierarchyTargetHub setCurrentRequest:responseFileDescriptor:reply:]( self,  "setCurrentRequest:responseFileDescriptor:reply:",  0LL,  0xFFFFFFFFLL,  0LL);
    }

    else
    {
      uint64_t v10 = v9;
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      -[DebugHierarchyTargetHub setCurrentRequest:responseFileDescriptor:reply:]( self,  "setCurrentRequest:responseFileDescriptor:reply:",  v8,  v10,  reply);
    }
  }

  else
  {
    -[DebugHierarchyTargetHub setCurrentRequest:responseFileDescriptor:reply:]( self,  "setCurrentRequest:responseFileDescriptor:reply:",  0LL,  0xFFFFFFFFLL,  0LL);
  }
}

- (void)setCurrentRequest:(id)a3 responseFileDescriptor:(int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  -[DebugHierarchyTargetHub setCurrentRequestInBase64:](self, "setCurrentRequestInBase64:", a3);
  -[DebugHierarchyTargetHub setCurrentResponseFileDescriptor:](self, "setCurrentResponseFileDescriptor:", v5);
  -[DebugHierarchyTargetHub setCurrentReply:](self, "setCurrentReply:", v8);
}

+ (id)performDebugRequest:(int64_t)a3
{
  if ((unint64_t)a3 > 1)
  {
    id v8 = 0LL;
  }

  else
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
    -[DebugHierarchyPropertyAction setPropertyNames:exlusive:]( v4,  "setPropertyNames:exlusive:",  &__NSArray0__struct,  1LL);
    uint64_t v10 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithDiscoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithDiscoveryType:actions:completion:",  1LL,  v5,  &__block_literal_global_1));

    [v6 setTimeout:120.0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 performRequest:v6]);

    if (!a3)
    {

      id v8 = 0LL;
    }
  }

  return v8;
}

- (NSData)response
{
  return self->_response;
}

- (void)setAdditionalKnownObjects:(id)a3
{
}

- (int)darwinNotificationToken
{
  return self->_darwinNotificationToken;
}

- (OS_dispatch_queue)agentConnectionQueue
{
  return self->_agentConnectionQueue;
}

- (NSString)currentRequestInBase64
{
  return self->_currentRequestInBase64;
}

- (void)setCurrentRequestInBase64:(id)a3
{
}

- (int)currentResponseFileDescriptor
{
  return self->_currentResponseFileDescriptor;
}

- (void)setCurrentResponseFileDescriptor:(int)a3
{
  self->_currentResponseFileDescriptor = a3;
}

- (OS_xpc_object)currentReply
{
  return self->_currentReply;
}

- (void)setCurrentReply:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:fileDescriptor:.cold.1()
{
}

@end