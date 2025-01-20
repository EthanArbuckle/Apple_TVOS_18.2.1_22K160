@interface ClientOfLocalNoteServer
+ (ClientOfLocalNoteServer)monitor;
+ (void)setMonitor:(id)a3;
- (BOOL)isLoginWindow;
- (ClientOfLocalNoteServer)initWithClientConnection:(id)a3 configuration:(distnoted_configuration *)a4;
- (NSString)processName;
- (void)addInvalidationHandler:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)enqueuePost:(id)a3;
- (void)flushQueue;
- (void)forward:(id)a3;
- (void)handlePost:(id)a3;
- (void)invalidate;
- (void)postNotification:(__CFString *)a3 object:(__CFString *)a4 token:(unint64_t)a5 options:(unint64_t)a6 immediate:(unsigned __int8)a7 userInfo:(id)a8;
- (void)start:(id)a3;
- (void)startMonitoring;
@end

@implementation ClientOfLocalNoteServer

+ (ClientOfLocalNoteServer)monitor
{
  return (ClientOfLocalNoteServer *)qword_10000CDE0;
}

+ (void)setMonitor:(id)a3
{
  if ((id)qword_10000CDE0 != a3)
  {

    qword_10000CDE0 = (uint64_t)a3;
  }

- (NSString)processName
{
  int v2 = proc_pidpath(self->_pid, buffer, 0x1000u);
  if (v2 < 1) {
    return (NSString *)@"(Unknown)";
  }
  CFIndex v3 = v2;
  CFStringEncoding v4 = CFStringFileSystemEncoding();
  return (NSString *)(id)CFStringCreateWithBytes(kCFAllocatorSystemDefault, buffer, v3, v4, 0);
}

- (BOOL)isLoginWindow
{
  return 0;
}

- (void)startMonitoring
{
  if (!-[_NSDNXPCConnection euid](self->_client, "euid")) {
    +[ClientOfLocalNoteServer setMonitor:](&OBJC_CLASS___ClientOfLocalNoteServer, "setMonitor:", self);
  }
}

- (void)dump
{
  if (!-[_NSDNXPCConnection euid](self->_client, "euid"))
  {
    xpc_object_t v3 = xpc_array_create(0LL, 0LL);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v14 = self;
    id obj = -[_NSDNXPCServer allClients](self->_parent, "allClients");
    id v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        v7 = 0LL;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v7);
          xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_string( v9,  "process",  (const char *)objc_msgSend(objc_msgSend((id)v8, "processName"), "UTF8String"));
          xpc_dictionary_set_int64(v9, "pid", *(int *)(v8 + 72));
          xpc_object_t v10 = xpc_array_create(0LL, 0LL);
          uint64_t v11 = *(void *)(v8 + 24);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_100002704;
          v16[3] = &unk_1000083E0;
          v16[4] = v10;
          CFXNotificationRegistrarEnumerate(v11, v16);
          xpc_dictionary_set_value(v9, "registrations", v10);
          xpc_release(v10);
          xpc_array_append_value(v3, v9);
          xpc_release(v9);
          v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }

      while (v5);
    }

    xpc_object_t v12 = xpc_string_create("dump");
    *(_OWORD *)keys = off_100008400;
    values[0] = v12;
    values[1] = v3;
    xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_release(v12);
    xpc_release(v3);
    -[_NSDNXPCConnection sendMessage:](v14->_client, "sendMessage:", v13);
    xpc_release(v13);
  }

- (ClientOfLocalNoteServer)initWithClientConnection:(id)a3 configuration:(distnoted_configuration *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ClientOfLocalNoteServer;
  uint64_t v6 = -[ClientOfLocalNoteServer init](&v14, "init");
  v6->_pid = xpc_connection_get_pid((xpc_connection_t)a3);
  v6->_pid = xpc_connection_get_pid((xpc_connection_t)a3);
  xpc_connection_get_audit_token(a3, v13);
  buffer[0] = v13[0];
  buffer[1] = v13[1];
  uint64_t v7 = sandbox_reference_retain_by_audit_token(buffer);
  *(void *)&v6->_started = 0LL;
  v6->_sandboxReference = v7;
  v6->_invalidHandlers = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v6->_suspended = 0;
  v6->_registrar = (__CFXNotificationRegistrar *)CFXNotificationRegistrarCreate(kCFAllocatorSystemDefault, 2LL);
  v6->_parent = (_NSDNXPCServer *)a4->var1;
  v6->_queue = (OS_xpc_object *)xpc_array_create(0LL, 0LL);
  v6->_client = -[_NSDNXPCConnection initWithPeerConnection:]( objc_alloc(&OBJC_CLASS____NSDNXPCConnection),  "initWithPeerConnection:",  a3);
  uint64_t v8 = v6;
  client = v6->_client;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000029A4;
  v12[3] = &unk_100008418;
  v12[4] = v6;
  -[_NSDNXPCConnection addInvalidationHandler:](client, "addInvalidationHandler:", v12);
  -[_NSDNXPCConnection addTerminationImminentHandler:](v6->_client, "addTerminationImminentHandler:", &stru_100008458);
  snprintf(v16, 0x100uLL, "ClientOfLocalNoteServer.0x%016lx.dq", v6);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000029CC;
  v11[3] = &unk_1000084A8;
  v11[4] = v6;
  v11[5] = a4;
  -[_NSDNXPCConnection setHandleMessage:](v6->_client, "setHandleMessage:", v11);
  return v6;
}

- (void)dealloc
{
  if ((self->_sandboxReference & 0x8000000000000000LL) == 0) {
    sandbox_reference_release();
  }
  CFRelease(self->_registrar);
  xpc_release(self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ClientOfLocalNoteServer;
  -[ClientOfLocalNoteServer dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  int invalid = self->_invalid;
  self->_int invalid = invalid + 1;
  if (!invalid)
  {
    client = self->_client;
    self->_client = 0LL;
    invalidHandlers = self->_invalidHandlers;
    self->_invalidHandlers = 0LL;
    -[_NSDNXPCConnection invalidate](client, "invalidate");

    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( invalidHandlers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(invalidHandlers);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)i) + 16LL))();
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( invalidHandlers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      }

      while (v7);
    }

    getpid();
  }

  if (+[ClientOfLocalNoteServer monitor](&OBJC_CLASS___ClientOfLocalNoteServer, "monitor") == self) {
    +[ClientOfLocalNoteServer setMonitor:](&OBJC_CLASS___ClientOfLocalNoteServer, "setMonitor:", 0LL);
  }
}

- (void)addInvalidationHandler:(id)a3
{
  id v4 = [a3 copy];
  -[NSMutableArray addObject:](self->_invalidHandlers, "addObject:", v4);
}

- (void)start:(id)a3
{
  int started = self->_started;
  self->_int started = started + 1;
  if (!started)
  {
    id v5 = self->_client;
    if (v5)
    {
      id v6 = v5;
      -[_NSDNXPCConnection start:](v5, "start:", a3);
    }
  }

- (void)flushQueue
{
  queue = self->_queue;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472LL;
  applier[2] = sub_1000038E0;
  applier[3] = &unk_100008480;
  applier[4] = self;
  xpc_array_apply(queue, applier);
  xpc_release(self->_queue);
  self->_queue = (OS_xpc_object *)xpc_array_create(0LL, 0LL);
}

- (void)enqueuePost:(id)a3
{
  if (xpc_array_get_count(self->_queue) >= 0x1F4) {
    -[ClientOfLocalNoteServer flushQueue](self, "flushQueue");
  }
}

- (void)postNotification:(__CFString *)a3 object:(__CFString *)a4 token:(unint64_t)a5 options:(unint64_t)a6 immediate:(unsigned __int8)a7 userInfo:(id)a8
{
  if (a3)
  {
    if (a4)
    {
      int v10 = a7;
      CFTypeID v15 = CFGetTypeID(a4);
      if (v15 == CFStringGetTypeID())
      {
        CFTypeID v16 = CFGetTypeID(a4);
        if (v16 == CFStringGetTypeID())
        {
          v29 = 0LL;
          xpc_object_t v27 = 0LL;
          keys[0] = "method";
          values[0] = xpc_string_create("post_token");
          keys[1] = "version";
          values[1] = xpc_uint64_create(1uLL);
          keys[2] = "token";
          xpc_object_t values[2] = xpc_uint64_create(a5);
          keys[3] = "name";
          values[3] = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(a3);
          keys[4] = "object";
          values[4] = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(a4);
          if (a8)
          {
            v29 = "userinfo";
            xpc_object_t v27 = xpc_retain(a8);
            size_t v17 = 6LL;
          }

          else
          {
            size_t v17 = 5LL;
          }

          xpc_object_t v18 = xpc_dictionary_create((const char *const *)keys, values, v17);
          unint64_t v19 = 0LL;
          uint64_t v20 = 8 * v17;
          do
          {
            xpc_release(values[v19 / 8]);
            v19 += 8LL;
          }

          while (v20 != v19);
          if (v10 || (a6 & 1) != 0 || !self->_suspended)
          {
            if (v10 || (a6 & 1) != 0) {
              -[ClientOfLocalNoteServer flushQueue](self, "flushQueue");
            }
            -[_NSDNXPCConnection sendMessage:](self->_client, "sendMessage:", v18);
            goto LABEL_24;
          }

          if (a6 != 8)
          {
            if (a6 == 2 || (a6 & 4) == 0) {
              goto LABEL_24;
            }
            v21 = (OS_xpc_object *)xpc_array_create(0LL, 0LL);
            string = xpc_dictionary_get_string(v18, "name");
            v23 = xpc_dictionary_get_string(v18, "object");
            queue = self->_queue;
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472LL;
            v25[2] = sub_100003CC8;
            v25[3] = &unk_1000084D0;
            v25[6] = a5;
            v25[7] = string;
            v25[8] = v23;
            v25[4] = v18;
            v25[5] = v21;
            xpc_array_apply(queue, v25);
            xpc_release(self->_queue);
            self->_queue = v21;
          }

          -[ClientOfLocalNoteServer enqueuePost:](self, "enqueuePost:", v18);
LABEL_24:
          xpc_release(v18);
        }
      }
    }
  }

- (void)forward:(id)a3
{
}

- (void)handlePost:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "name");
  id v6 = (const void *)_CFXPCCreateCFObjectFromXPCObject(value);
  xpc_object_t v7 = xpc_dictionary_get_value(a3, "object");
  uint64_t v8 = (const void *)_CFXPCCreateCFObjectFromXPCObject(v7);
  xpc_object_t v9 = xpc_dictionary_get_value(a3, "userinfo");
  char uint64 = xpc_dictionary_get_uint64(a3, "options");
  if (v6 && v8)
  {
    char v11 = uint64;
    -[ClientOfLocalNoteServer forward:]( +[ClientOfLocalNoteServer monitor](&OBJC_CLASS___ClientOfLocalNoteServer, "monitor"),  "forward:",  a3);
    v15[0] = 0x2000000000LL;
    CFTypeID v16 = &v17;
    CFXNotificationRegistrarFind(self->_registrar, v6, v8, v15);
    if (LODWORD(v15[0]))
    {
      uint64_t v12 = 0LL;
      unint64_t v13 = 0LL;
      uint64_t v14 = v11 & 1;
      do
      {
        -[ClientOfLocalNoteServer postNotification:object:token:options:immediate:userInfo:]( self,  "postNotification:object:token:options:immediate:userInfo:",  v6,  v8,  v16[v12 + 7],  v16[v12 + 3],  v14,  v9);
        ++v13;
        v12 += 8LL;
      }

      while (v13 < LODWORD(v15[0]));
    }

    _CFXNotificationRegistrationBufferDestroy(v15);
  }

  if (v6) {
    CFRelease(v6);
  }
  if (v8) {
    CFRelease(v8);
  }
}

@end