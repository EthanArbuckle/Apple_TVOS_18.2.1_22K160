@interface GTUNIXDomainSocketTransport_tools_diagnostics
- (GTUNIXDomainSocketTransport_tools_diagnostics)initWithMode:(int)a3;
- (id)connect;
- (void)_connectClient:(id)a3 future:(id)a4;
- (void)_connectServer:(id)a3 future:(id)a4;
- (void)_invalidate;
- (void)setUrl:(id)a3;
@end

@implementation GTUNIXDomainSocketTransport_tools_diagnostics

- (GTUNIXDomainSocketTransport_tools_diagnostics)initWithMode:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTUNIXDomainSocketTransport_tools_diagnostics;
  result = -[GTBaseSocketTransport_tools_diagnostics init](&v5, "init");
  if (result) {
    *(_DWORD *)(&result->super._scheduledReadOnWritableSocket + 3) = a3;
  }
  return result;
}

- (void)setUrl:(id)a3
{
  if (-[GTBaseSocketTransport_tools_diagnostics connected](self, "connected"))
  {
    if (s_logUsingOsLog)
    {
      v6 = (os_log_s *)gt_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "fail: tried to set socket path on connected unix domain socket transport";
        v8 = v6;
        uint32_t v9 = 2;
        goto LABEL_11;
      }
    }

    else
    {
      v11 = __stderrp;
      -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"fail: tried to set socket path on connected unix domain socket transport"),  "UTF8String");
      fprintf(v11, "%s\n");
    }

- (void)_connectServer:(id)a3 future:(id)a4
{
  v7 = (const __CFString *)a3;
  if (!a3)
  {
    v8 = (__CFString *)NSTemporaryDirectory();
    if (!v8) {
      v8 = @"/tmp";
    }
    v7 = (const __CFString *)-[__CFString stringByAppendingPathComponent:]( v8,  "stringByAppendingPathComponent:",  @"dysonXXXXXX");
  }

  CFStringGetFileSystemRepresentation(v7, buffer, 1024LL);
  size_t v9 = strlen(buffer) + 1;
  __int128 v28 = 0u;
  memset(v29, 0, sizeof(v29));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  sockaddr v24 = (sockaddr)0;
  __int128 v25 = 0u;
  if (!a3 && v9 >= 0x69)
  {
    v7 = (const __CFString *)[@"/tmp" stringByAppendingPathComponent:@"dysonXXXXXX"];
    CFStringGetFileSystemRepresentation(v7, buffer, 1024LL);
    size_t v9 = strlen(buffer) + 1;
  }

  if (v9 >= 0x69)
  {
    v10 = &OBJC_CLASS___GTError_tools_diagnostics;
    v11 = @"DYErrorDomain";
    uint64_t v12 = 39LL;
LABEL_20:
    objc_msgSend( a4,  "setError:",  -[__objc2_class errorWithDomain:code:userInfo:](v10, "errorWithDomain:code:userInfo:", v11, v12, 0));
    objc_msgSend(a4, "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    return;
  }

  if (!a3)
  {
    int v13 = mkstemp(buffer);
    if (v13 == -1)
    {
      int v17 = -1;
      goto LABEL_23;
    }

    int v14 = v13;
    v7 = (id)CFStringCreateWithFileSystemRepresentation(kCFAllocatorDefault, buffer);
    close(v14);
  }

  if (!self->super.super.super._url) {
    self->super.super.super._url = -[NSURL initFileURLWithPath:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:",  v7);
  }
  v24.sa_family = 1;
  strlcpy(v24.sa_data, buffer, 0x68uLL);
  int v15 = strlen(v24.sa_data);
  int v16 = socket(1, 1, 0);
  if (v16 == -1)
  {
    uint64_t v12 = *__error();
    v10 = (__objc2_class *)&OBJC_CLASS___NSError;
    v11 = (const __CFString *)NSPOSIXErrorDomain;
    goto LABEL_20;
  }

  int v17 = v16;
  unlink(v24.sa_data);
  if (bind(v17, &v24, v15 + 2) != -1 && listen(v17, 1) != -1)
  {
    fcntl(v17, 4, 4LL);
    v18 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v17,  0LL,  (dispatch_queue_t)self->super.super.super._queue);
    *(void *)&self->_mode = v18;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = __53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke;
    handler[3] = &unk_20AC8;
    int v23 = v17;
    handler[4] = self;
    handler[5] = a4;
    dispatch_source_set_cancel_handler(v18, handler);
    v19 = *(dispatch_source_s **)&self->_mode;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = __53__GTUNIXDomainSocketTransport__connectServer_future___block_invoke_2;
    v20[3] = &unk_20AC8;
    int v21 = v17;
    v20[4] = self;
    v20[5] = a4;
    dispatch_source_set_event_handler(v19, v20);
    dispatch_resume(*(dispatch_object_t *)&self->_mode);
    return;
  }

- (void)_connectClient:(id)a3 future:(id)a4
{
  if (!a3)
  {
    uint64_t v12 = &OBJC_CLASS___GTError_tools_diagnostics;
    int v13 = @"DYErrorDomain";
    uint64_t v14 = 38LL;
LABEL_7:
    objc_msgSend( a4,  "setError:",  -[__objc2_class errorWithDomain:code:userInfo:](v12, "errorWithDomain:code:userInfo:", v13, v14, 0));
    objc_msgSend(a4, "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    return;
  }

  uint64_t v7 = socket(1, 1, 0);
  if ((_DWORD)v7 == -1)
  {
    uint64_t v14 = *__error();
    uint64_t v12 = (__objc2_class *)&OBJC_CLASS___NSError;
    int v13 = (const __CFString *)NSPOSIXErrorDomain;
    goto LABEL_7;
  }

  uint64_t v8 = v7;
  __int128 v22 = 0u;
  memset(v23, 0, sizeof(v23));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  sockaddr v18 = (sockaddr)0;
  __int128 v19 = 0u;
  CFStringGetFileSystemRepresentation((CFStringRef)a3, v17, 1024LL);
  if (strlen(v17) - 103 <= 0xFFFFFFFFFFFFFF97LL)
  {
    size_t v9 = &OBJC_CLASS___GTError_tools_diagnostics;
    v10 = @"DYErrorDomain";
    uint64_t v11 = 1LL;
LABEL_11:
    objc_msgSend( a4,  "setError:",  -[__objc2_class errorWithDomain:code:userInfo:](v9, "errorWithDomain:code:userInfo:", v10, v11, 0));
    uint64_t v16 = 0LL;
    goto LABEL_12;
  }

  v18.sa_family = 1;
  strlcpy(v18.sa_data, v17, 0x68uLL);
  int v15 = strlen(v18.sa_data);
  if (connect(v8, &v18, v15 + 2) == -1)
  {
    uint64_t v11 = *__error();
    size_t v9 = (__objc2_class *)&OBJC_CLASS___NSError;
    v10 = (const __CFString *)NSPOSIXErrorDomain;
    goto LABEL_11;
  }

  -[GTBaseSocketTransport_tools_diagnostics runWithSocket:](self, "runWithSocket:", v8);
  uint64_t v16 = 1LL;
LABEL_12:
  objc_msgSend(a4, "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v16));
}

- (id)connect
{
  id v3 = +[GTFuture_tools_diagnostics future](&OBJC_CLASS___GTFuture_tools_diagnostics, "future");
  queue = self->super.super.super._queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __38__GTUNIXDomainSocketTransport_connect__block_invoke;
  v6[3] = &unk_209B0;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async((dispatch_queue_t)queue, v6);
  return v3;
}

- (void)_invalidate
{
  id v3 = *(dispatch_source_s **)&self->_mode;
  if (v3) {
    dispatch_source_cancel(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GTUNIXDomainSocketTransport_tools_diagnostics;
  -[GTBaseSocketTransport_tools_diagnostics _invalidate](&v4, "_invalidate");
}

@end