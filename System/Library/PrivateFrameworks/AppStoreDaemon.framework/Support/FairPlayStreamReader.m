@interface FairPlayStreamReader
- (BOOL)hasBytesAvailable;
- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation FairPlayStreamReader

- (void)dealloc
{
  uint64_t v3 = ASDLogHandleForCategory(7LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "(FairPlayStreamReader) Reader deallocated: %@",  buf,  0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FairPlayStreamReader;
  -[FairPlayStreamReader dealloc](&v5, "dealloc");
}

- (BOOL)hasBytesAvailable
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100271044;
  v5[3] = &unk_1003EC4F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)open
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FairPlayStreamReader;
  -[Stream open](&v3, "open");
  -[StreamReader open](self->_streamReader, "open");
}

- (void)close
{
  streamReader = self->_streamReader;
  self->_streamReader = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FairPlayStreamReader;
  -[Stream close](&v4, "close");
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  unint64_t v15 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002712B8;
  block[3] = &unk_1003EF3E8;
  block[5] = &v12;
  block[6] = a4;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  if (v13[3])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[Stream delegate](self, "delegate"));
    [v8 stream:self handleEvent:v13[3]];
  }

  else
  {
    uint64_t v9 = ASDLogHandleForCategory(7LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEBUG,  "(FairPlayStreamReader) All event codes were filtered",  v10,  2u);
    }
  }

  _Block_object_dispose(&v12, 8);
}

- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v14 = 0LL;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_10027155C;
  v18 = sub_10027156C;
  id v19 = 0LL;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  uint64_t v13 = -1LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100271574;
  block[3] = &unk_1003EC598;
  block[4] = self;
  block[5] = &v14;
  void block[7] = a3;
  block[8] = a4;
  block[6] = &v10;
  dispatch_sync(dispatchQueue, block);
  int64_t v7 = v11[3];
  if (a5 && v7 < 0)
  {
    *a5 = (id) v15[5];
    int64_t v7 = v11[3];
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void).cxx_destruct
{
}

@end