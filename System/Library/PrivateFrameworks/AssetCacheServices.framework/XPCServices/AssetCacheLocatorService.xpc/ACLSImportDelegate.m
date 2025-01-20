@interface ACLSImportDelegate
- (ACLSImportDelegate)initWithFileHandle:(id)a3 fileOffset:(unint64_t)a4 length:(unint64_t)a5 callback:(id)a6 callbackQueue:(id)a7 tag:(unsigned int)a8;
- (NSFileHandle)fileHandle;
- (OS_dispatch_queue)callbackQueue;
- (id)callback;
- (int)responseCode;
- (unint64_t)fileOffset;
- (unint64_t)length;
- (unsigned)tag;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)setCallback:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setFileOffset:(unint64_t)a3;
- (void)setLength:(unint64_t)a3;
- (void)setResponseCode:(int)a3;
- (void)setTag:(unsigned int)a3;
@end

@implementation ACLSImportDelegate

- (ACLSImportDelegate)initWithFileHandle:(id)a3 fileOffset:(unint64_t)a4 length:(unint64_t)a5 callback:(id)a6 callbackQueue:(id)a7 tag:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ACLSImportDelegate;
  v17 = -[ACLSImportDelegate init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    -[ACLSImportDelegate setFileHandle:](v17, "setFileHandle:", v14);
    -[ACLSImportDelegate setFileOffset:](v18, "setFileOffset:", a4);
    -[ACLSImportDelegate setLength:](v18, "setLength:", a5);
    -[ACLSImportDelegate setCallback:](v18, "setCallback:", v15);
    -[ACLSImportDelegate setCallbackQueue:](v18, "setCallbackQueue:", v16);
    -[ACLSImportDelegate setTag:](v18, "setTag:", v8);
  }

  return v18;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  v11 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v12 = v11;
    v13[0] = 67109890;
    v13[1] = -[ACLSImportDelegate tag](self, "tag");
    __int16 v14 = 2080;
    id v15 = currentQueueName();
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] URLSession:%@ didReceiveChallenge:%@",  (uint8_t *)v13,  0x26u);
  }

  v10[2](v10, 2LL, 0LL);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, uint64_t, void))a6;
  __int16 v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v15 = v14;
    v16[0] = 67110146;
    v16[1] = -[ACLSImportDelegate tag](self, "tag");
    __int16 v17 = 2080;
    __int16 v18 = currentQueueName();
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] URLSession:%@ task:%@ didReceiveChallenge:%@",  (uint8_t *)v16,  0x30u);
  }

  v13[2](v13, 2LL, 0LL);
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v15 = v11;
    v16[0] = 67109890;
    v16[1] = -[ACLSImportDelegate tag](self, "tag");
    __int16 v17 = 2080;
    __int16 v18 = currentQueueName();
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] URLSession:%@ task:%@ needNewBodyStream",  (uint8_t *)v16,  0x26u);
  }

  id v12 = objc_alloc(&OBJC_CLASS___ACLSFileHandleInputStream);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACLSImportDelegate fileHandle](self, "fileHandle"));
  __int16 v14 = -[ACLSFileHandleInputStream initWithFileHandle:fileOffset:length:]( v12,  "initWithFileHandle:fileOffset:length:",  v13,  -[ACLSImportDelegate fileOffset](self, "fileOffset"),  -[ACLSImportDelegate length](self, "length"));
  v10[2](v10, v14);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    __int16 v18 = v11;
    *(_DWORD *)buf = 67110146;
    unsigned int v23 = -[ACLSImportDelegate tag](self, "tag");
    __int16 v24 = 2080;
    v25 = currentQueueName();
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] URLSession:%@ task:%@ didCompleteWithError:%@",  buf,  0x30u);

    if (!v10) {
      goto LABEL_3;
    }
LABEL_11:
    char v12 = 0;
    goto LABEL_12;
  }

  if (v10) {
    goto LABEL_11;
  }
LABEL_3:
  if (-[ACLSImportDelegate responseCode](self, "responseCode") < 200
    || -[ACLSImportDelegate responseCode](self, "responseCode") >= 300)
  {
    unsigned int v13 = -[ACLSImportDelegate responseCode](self, "responseCode");
    if (v13) {
      __int16 v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"HTTP response %d from server",  -[ACLSImportDelegate responseCode](self, "responseCode")));
    }
    else {
      __int16 v14 = @"bad response from server";
    }
    id TaggedError = createTaggedError(NSURLErrorDomain, -1011LL, v14, -[ACLSImportDelegate tag](self, "tag"));
    id v10 = (id)objc_claimAutoreleasedReturnValue(TaggedError);
    if (v13) {

    }
    goto LABEL_11;
  }

  id v10 = 0LL;
  char v12 = 1;
LABEL_12:
  __int16 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ACLSImportDelegate callbackQueue](self, "callbackQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000064E0;
  block[3] = &unk_100030AF0;
  char v21 = v12;
  block[4] = self;
  id v20 = v10;
  id v17 = v10;
  dispatch_async(v16, block);

  [v8 finishTasksAndInvalidate];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v13 = (void (**)(id, uint64_t))a6;
  __int16 v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v17 = v14;
    v18[0] = 67110146;
    v18[1] = -[ACLSImportDelegate tag](self, "tag");
    __int16 v19 = 2080;
    id v20 = currentQueueName();
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] URLSession:%@ dataTask:%@ didReceiveResponse:%@",  (uint8_t *)v18,  0x30u);
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
  {
    -[ACLSImportDelegate setResponseCode:](self, "setResponseCode:", [v12 statusCode]);
    uint64_t v16 = 1LL;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  v13[2](v13, v16);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFileHandle:(id)a3
{
}

- (unint64_t)fileOffset
{
  return self->_fileOffset;
}

- (void)setFileOffset:(unint64_t)a3
{
  self->_fileOffset = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (id)callback
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCallback:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCallbackQueue:(id)a3
{
}

- (unsigned)tag
{
  return self->_tag;
}

- (void)setTag:(unsigned int)a3
{
  self->_tag = a3;
}

- (int)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int)a3
{
  self->_responseCode = a3;
}

- (void).cxx_destruct
{
}

@end