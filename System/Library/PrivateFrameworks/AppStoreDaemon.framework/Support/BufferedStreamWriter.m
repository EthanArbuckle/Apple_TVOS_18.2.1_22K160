@interface BufferedStreamWriter
- (BOOL)hasSpaceAvailable;
- (int64_t)writeBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
- (void)expectedContentLength:(unint64_t)a3;
@end

@implementation BufferedStreamWriter

- (void)dealloc
{
  uint64_t v3 = ASDLogHandleForCategory(7LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "(BufferedStream) Writer deallocated: %@",  buf,  0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BufferedStreamWriter;
  -[BufferedStreamWriter dealloc](&v5, "dealloc");
}

- (BOOL)hasSpaceAvailable
{
  bufferedStream = self->_bufferedStream;
  if (!bufferedStream) {
    return 0;
  }
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  queue = (dispatch_queue_s *)bufferedStream->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10018DB84;
  v6[3] = &unk_1003E9BE0;
  v6[4] = bufferedStream;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  BOOL v4 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)close
{
  uint64_t v3 = ASDLogHandleForCategory(7LL);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(block[0]) = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "(BufferedStream) Writer closed",  (uint8_t *)block,  2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BufferedStreamWriter;
  -[Stream close](&v7, "close");
  bufferedStream = self->_bufferedStream;
  if (bufferedStream)
  {
    queue = (dispatch_queue_s *)bufferedStream->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018E1BC;
    block[3] = &unk_1003E9880;
    block[4] = bufferedStream;
    dispatch_sync(queue, block);
  }

- (int64_t)writeBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  bufferedStream = self->_bufferedStream;
  if (!bufferedStream) {
    return 0LL;
  }
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  if (a4)
  {
    queue = (dispatch_queue_s *)bufferedStream->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018E2FC;
    block[3] = &unk_1003E9E10;
    void block[6] = a4;
    block[7] = a3;
    block[4] = bufferedStream;
    block[5] = &v10;
    block[8] = a5;
    dispatch_sync(queue, block);
    int64_t v7 = v11[3];
  }

  else
  {
    int64_t v7 = 0LL;
  }

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)expectedContentLength:(unint64_t)a3
{
  bufferedStream = self->_bufferedStream;
  if (bufferedStream)
  {
    queue = (dispatch_queue_s *)bufferedStream->_queue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10018DDDC;
    v5[3] = &unk_1003E9E38;
    v5[4] = bufferedStream;
    v5[5] = a3;
    dispatch_sync(queue, v5);
  }

- (void).cxx_destruct
{
}

@end