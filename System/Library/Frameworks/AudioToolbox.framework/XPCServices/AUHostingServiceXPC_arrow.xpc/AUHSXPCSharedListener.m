@interface AUHSXPCSharedListener
+ (id)connectToService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 error:(id *)a6;
+ (id)connectToService:(id)a3 listener:(id)a4 error:(id *)a5;
+ (id)connectionForListenerNamed:(id)a3 fromServiceNamed:(id)a4;
+ (id)connectionForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5;
+ (id)endpointCache;
+ (id)endpointForReply:(id)a3 withListenerName:(id)a4 replyErrorCode:(int64_t *)a5;
+ (id)listenerEndpointForService:(id)a3 listener:(id)a4 error:(id *)a5;
+ (id)sharedServiceListener;
+ (void)_endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 async:(BOOL)a7 completion:(id)a8;
+ (void)_failedToWarmUpClassNamed:(id)a3 inServiceNamed:(id)a4 dueTo:(id)a5;
+ (void)cacheFutureEndpointsForServiceNamed:(id)a3;
+ (void)connectToService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 queue:(id)a6 completion:(id)a7;
+ (void)connectToService:(id)a3 listener:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 async:(BOOL)a7 completion:(id)a8;
+ (void)endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 completion:(id)a7;
+ (void)getSDKVersionOfServiceNamed:(id)a3 reply:(id)a4;
+ (void)listenerEndpointForService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 queue:(id)a6 completion:(id)a7;
+ (void)listenerEndpointForService:(id)a3 listener:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)purgeEndpointCache;
+ (void)service:(id)a3 builtForPlatform:(unsigned int)a4 againstMinimumSDK:(unsigned int)a5 reply:(id)a6;
+ (void)setEndpointCache:(id)a3;
+ (void)warmUpClassNamed:(id)a3 inServiceNamed:(id)a4;
- (BOOL)shouldAcceptNewConnection:(id)a3 forListenerNamed:(id)a4;
- (NSMutableDictionary)listeners;
- (id)listenerEndpointWithName:(id)a3;
- (void)addDelegate:(id)a3;
- (void)addListener:(id)a3 withName:(id)a4;
- (void)dealloc;
- (void)didAcceptNewConnection:(id)a3;
- (void)resume;
- (void)resumeAdditionalService:(id)a3;
- (void)resumeSubService:(id)a3;
- (void)setListeners:(id)a3;
- (void)whileHoldingLock:(id)a3;
@end

@implementation AUHSXPCSharedListener

- (void)dealloc
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100002B28;
  v4[3] = &unk_10000C530;
  v4[4] = self;
  sub_100001F6C(&self->lock, v4);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AUHSXPCSharedListener;
  -[AUHSXPCSharedListener dealloc](&v3, "dealloc");
}

- (void)addDelegate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100002AD4;
  v4[3] = &unk_10000C558;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  sub_100001F6C(&v5->lock, v4);
}

- (void)addListener:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  p_lock = &self->lock;
  v11[2] = sub_100002A94;
  v11[3] = &unk_10000C580;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_100001F6C(p_lock, v11);
  [v10 resume];
}

- (id)listenerEndpointWithName:(id)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_100002A10;
  v14 = sub_100002A20;
  id v15 = 0LL;
  p_lock = &self->lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100002A28;
  v7[3] = &unk_10000C5A8;
  v7[4] = self;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  sub_100001F6C(p_lock, v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)didAcceptNewConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->lock);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = self->_delegates;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "didAcceptNewConnection:") & 1) != 0) {
          objc_msgSend(v10, "didAcceptNewConnection:", v4, (void)v11);
        }
      }

      id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (BOOL)shouldAcceptNewConnection:(id)a3 forListenerNamed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->lock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v8 = self->_delegates;
  id v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "shouldAcceptNewConnection:") & 1) != 0
          && ([v13 shouldAcceptNewConnection:v6] & 1) == 0)
        {
          NSLog(@"delegate %@ of %@ rejected connection for listener %@", v13, self, v7);
          BOOL v14 = 0;
          goto LABEL_12;
        }
      }

      id v10 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (void)whileHoldingLock:(id)a3
{
}

- (void)resume
{
}

- (void)resumeAdditionalService:(id)a3
{
}

- (void)resumeSubService:(id)a3
{
}

- (NSMutableDictionary)listeners
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)endpointForReply:(id)a3 withListenerName:(id)a4 replyErrorCode:(int64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  xpc_type_t type = xpc_get_type(v7);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    string_ptr = xpc_string_get_string_ptr(v8);
    string = xpc_dictionary_get_string(v7, _xpc_error_key_description);
    NSLog( @"%s: an error occurred while attempting to obtain endpoint for listener '%s': %s",  "+[AUHSXPCSharedListener endpointForReply:withListenerName:replyErrorCode:]",  string_ptr,  string);
    goto LABEL_6;
  }

  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"reply has unknown message type");
LABEL_6:
    __int128 v13 = 0LL;
    goto LABEL_7;
  }

  int64_t int64 = xpc_dictionary_get_int64(v7, "error-code");
  *a5 = int64;
  xpc_object_t value = xpc_dictionary_get_value(v7, "listener-endpoint");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (v16)
  {
    __int128 v13 = objc_opt_new(&OBJC_CLASS___NSXPCListenerEndpoint);
    -[NSXPCListenerEndpoint _setEndpoint:](v13, "_setEndpoint:", v16);
  }

  else
  {
    NSLog( @"%s: raw endpoint absent; faking error",
      "+[AUHSXPCSharedListener endpointForReply:withListenerName:replyErrorCode:]");
    __int128 v13 = 0LL;
    *a5 = 3LL;
  }

LABEL_7:
  return v13;
}

+ (void)cacheFutureEndpointsForServiceNamed:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000056DC;
  v4[3] = &unk_10000C5D0;
  id v5 = [a3 copy];
  id v3 = v5;
  sub_1000052DC(v4);
}

+ (void)purgeEndpointCache
{
}

+ (id)endpointCache
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_100002A10;
  id v9 = sub_100002A20;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100005678;
  v4[3] = &unk_10000C638;
  void v4[4] = &v5;
  sub_100004E38(v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (void)setEndpointCache:(id)a3
{
  id v3 = a3;
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x3032000000LL;
  v9[3] = sub_100002A10;
  v9[4] = sub_100002A20;
  id v10 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000551C;
  v8[3] = &unk_10000C660;
  v8[4] = v9;
  sub_1000052DC(v8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100005550;
  v5[3] = &unk_10000C6B0;
  uint64_t v7 = v9;
  id v4 = v3;
  id v6 = v4;
  sub_100004E38(v5);

  _Block_object_dispose(v9, 8);
}

+ (void)_endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 async:(BOOL)a7 completion:(id)a8
{
  BOOL v48 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (dispatch_queue_s *)a6;
  id v51 = a8;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  uint64_t v69 = 0LL;
  v70 = &v69;
  uint64_t v71 = 0x3032000000LL;
  v72 = sub_100002A10;
  v73 = sub_100002A20;
  id v74 = 0LL;
  id v19 = sub_100004D04(v16, v17, v18);
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_100004DFC;
  v66[3] = &unk_10000C6B0;
  v68 = &v69;
  id v20 = (id)objc_claimAutoreleasedReturnValue(v19);
  id v67 = v20;
  sub_100004E38(v66);
  id v52 = (id)v70[5];

  v21 = v51;
  _Block_object_dispose(&v69, 8);

  if (!v52)
  {
    v50 = objc_opt_new(&OBJC_CLASS___NSObtainingEndpointState);
    id v22 = v17;
    v23 = (const char *)[v22 UTF8String];
    uid_t v24 = geteuid();
    if (v24 != 92 && v24 != 203)
    {
      xpc_connection_t v31 = xpc_connection_create(v23, v15);
      connection = v50->connection;
      v50->connection = v31;

      goto LABEL_10;
    }

    SecTaskRef v25 = SecTaskCreateFromSelf(kCFAllocatorDefault);
    CFAutorelease(v25);
    CFTypeRef v26 = SecTaskCopyValueForEntitlement(v25, @"com.apple.private.xpc.launchd.per-user-lookup", 0LL);
    v27 = (void *)v26;
    if (v26)
    {
      if ((objc_opt_respondsToSelector(v26, "BOOLValue") & 1) != 0)
      {
        unsigned __int8 v28 = [v27 BOOLValue];

        if ((v28 & 1) != 0)
        {
          NSLog(@"%@ working around rdar://problem/35553241", a1);
          xpc_connection_t mach_service = xpc_connection_create_mach_service(v23, v15, 0LL);
          v30 = v50->connection;
          v50->connection = mach_service;

          xpc_connection_set_target_uid(v50->connection, 0xFFFFFFFFLL);
LABEL_10:
          if (v18)
          {
            [v18 getUUIDBytes:&v69];
            xpc_connection_set_oneshot_instance(v50->connection, &v69);
          }

          id v33 = v16;
          v34 = (OS_xpc_object *)xpc_string_create((const char *)[v33 UTF8String]);
          listenerName = v50->listenerName;
          v50->listenerName = v34;

          v36 = (OS_xpc_object *)xpc_dictionary_create( (const char *const *)&off_100011618,  (xpc_object_t *)&v50->listenerName,  1uLL);
          message = v50->message;
          v50->message = v36;

          v38 = v15;
          v39 = v50->connection;
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472LL;
          handler[2] = sub_100004EBC;
          handler[3] = &unk_10000C728;
          v40 = v50;
          v61 = v40;
          id v41 = v33;
          id v62 = v41;
          id v42 = v22;
          id v63 = v42;
          v43 = v39;
          id v15 = v38;
          v21 = v51;
          xpc_connection_set_event_handler(v43, handler);
          xpc_connection_resume(v50->connection);
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472LL;
          v53[2] = sub_100004F80;
          v53[3] = &unk_10000C7B8;
          v54 = v40;
          id v59 = a1;
          id v55 = v41;
          id v56 = v42;
          id v57 = v18;
          id v58 = v51;
          v44 = objc_retainBlock(v53);
          v45 = v50->connection;
          v46 = v50->message;
          if (v48)
          {
            xpc_connection_send_message_with_reply(v45, v46, v15, v44);
          }

          else
          {
            xpc_object_t v47 = xpc_connection_send_message_with_reply_sync(v45, v46);
            ((void (*)(void *, xpc_object_t))v44[2])(v44, v47);
          }

          goto LABEL_21;
        }

+ (void)endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 async:(BOOL)a7 completion:(id)a8
{
  BOOL v25 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = os_log_create("com.apple.ViewBridge.AUHSXPCSharedListener", "AUHSXPCSharedListener");
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100004BD4;
  v26[3] = &unk_10000C7E0;
  os_signpost_id_t v28 = v19;
  id v20 = v17;
  id v27 = v20;
  v21 = objc_retainBlock(v26);
  os_log_t v22 = os_log_create("com.apple.ViewBridge.AUHSXPCSharedListener", "AUHSXPCSharedListener");
  if (os_signpost_enabled(v22))
  {
    v23 = v22;
    uid_t v24 = v23;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 138412802;
      id v30 = v14;
      __int16 v31 = 2112;
      id v32 = v13;
      __int16 v33 = 2112;
      id v34 = v15;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "endpoint-lookup",  "%@ %@ %@",  buf,  0x20u);
    }
  }

  [a1 _endpointForListenerNamed:v13 fromServiceNamed:v14 instanceIdentifier:v15 queue:v16 async:v25 completion:v21];
}

+ (void)endpointForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5 queue:(id)a6 completion:(id)a7
{
}

+ (id)connectionForListenerNamed:(id)a3 fromServiceNamed:(id)a4
{
  return _[a1 connectionForListenerNamed:a3 fromServiceNamed:a4 instanceIdentifier:0];
}

+ (id)connectionForListenerNamed:(id)a3 fromServiceNamed:(id)a4 instanceIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_100002A10;
  v38 = sub_100002A20;
  id v39 = 0LL;
  block = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  BOOL v25 = sub_1000049EC;
  CFTypeRef v26 = &unk_10000C830;
  id v33 = a1;
  id v14 = v8;
  id v27 = v14;
  id v15 = v9;
  id v28 = v15;
  id v16 = v10;
  id v29 = v16;
  id v17 = v12;
  id v30 = v17;
  id v32 = &v34;
  id v18 = v13;
  __int16 v31 = v18;
  dispatch_async(v17, &block);
  dispatch_time_t v19 = dispatch_time(0LL, 15000000000LL);
  if (dispatch_semaphore_wait(v18, v19))
  {
    NSLog( @"%s timed out awaiting endpoint for %@ in %@. Did the service fail to bootstrap itself? Is the system absurdly loaded?",  "+[AUHSXPCSharedListener connectionForListenerNamed:fromServiceNamed:instanceIdentifier:]",  v14,  v15,  block,  v24,  v25,  v26,  v27,  v28,  v29,  v30);
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"%@ unable to create endpoint for listener named %@",  a1,  v14);
  }

  id v20 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  v21 = -[NSXPCConnection initWithListenerEndpoint:](v20, "initWithListenerEndpoint:", v35[5]);

  _Block_object_dispose(&v34, 8);
  return v21;
}

+ (void)listenerEndpointForService:(id)a3 listener:(id)a4 queue:(id)a5 completion:(id)a6
{
}

+ (void)listenerEndpointForService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v15)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue(global_queue);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000048AC;
  v23[3] = &unk_10000C880;
  id v24 = v14;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  id v28 = v16;
  id v29 = a1;
  id v18 = v16;
  dispatch_time_t v19 = (dispatch_queue_s *)v15;
  id v20 = v13;
  id v21 = v12;
  id v22 = v14;
  dispatch_async(v19, v23);
}

+ (void)connectToService:(id)a3 listener:(id)a4 queue:(id)a5 completion:(id)a6
{
}

+ (id)connectToService:(id)a3 listener:(id)a4 error:(id *)a5
{
  return _[a1 connectToService:a3 instanceIdentifier:0 listener:a4 error:a5];
}

+ (id)connectToService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = sub_100002A10;
  id v28 = sub_100002A20;
  id v29 = 0LL;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000047E4;
  v19[3] = &unk_10000C8A8;
  v23 = a6;
  id v15 = v10;
  id v20 = v15;
  id v16 = v12;
  id v21 = v16;
  id v22 = &v24;
  [a1 endpointForListenerNamed:v16 fromServiceNamed:v15 instanceIdentifier:v11 queue:v14 async:0 completion:v19];
  id v17 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v17;
}

+ (void)connectToService:(id)a3 instanceIdentifier:(id)a4 listener:(id)a5 queue:(id)a6 completion:(id)a7
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100004734;
  v15[3] = &unk_10000C858;
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v12 = v18;
  id v13 = v17;
  id v14 = v16;
  [a1 listenerEndpointForService:v14 instanceIdentifier:a4 listener:v13 queue:a6 completion:v15];
}

+ (id)listenerEndpointForService:(id)a3 listener:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_100002A10;
  id v25 = sub_100002A20;
  id v26 = 0LL;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100004674;
  v16[3] = &unk_10000C8A8;
  id v20 = a5;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  dispatch_time_t v19 = &v21;
  [a1 endpointForListenerNamed:v13 fromServiceNamed:v12 instanceIdentifier:0 queue:v11 async:0 completion:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

+ (id)sharedServiceListener
{
  if (qword_1000118C8 != -1) {
    dispatch_once(&qword_1000118C8, &stru_10000C8E8);
  }
  return (id)qword_1000118D0;
}

+ (void)_failedToWarmUpClassNamed:(id)a3 inServiceNamed:(id)a4 dueTo:(id)a5
{
}

+ (void)warmUpClassNamed:(id)a3 inServiceNamed:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100004450;
  v9[3] = &unk_10000C960;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  [a1 connectToService:v7 listener:&stru_10000CE08 queue:0 completion:v9];
}

+ (void)getSDKVersionOfServiceNamed:(id)a3 reply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004294;
  v7[3] = &unk_10000C9D8;
  id v8 = a4;
  id v6 = v8;
  [a1 connectToService:a3 listener:&stru_10000CE08 queue:0 completion:v7];
}

+ (void)service:(id)a3 builtForPlatform:(unsigned int)a4 againstMinimumSDK:(unsigned int)a5 reply:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004098;
  v11[3] = &unk_10000CA28;
  id v12 = a6;
  unsigned int v13 = a4;
  unsigned int v14 = a5;
  id v10 = v12;
  [a1 connectToService:a3 listener:&stru_10000CE08 queue:0 completion:v11];
}

@end