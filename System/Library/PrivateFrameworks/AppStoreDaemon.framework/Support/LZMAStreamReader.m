@interface LZMAStreamReader
- (BOOL)hasBytesAvailable;
- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation LZMAStreamReader

- (void)dealloc
{
  uint64_t v3 = ASDLogHandleForCategory(7LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "(LZMAStreamReader) Reader deallocated: %@",  buf,  0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LZMAStreamReader;
  -[LZMAStreamReader dealloc](&v5, "dealloc");
}

- (BOOL)hasBytesAvailable
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001F10E8;
  v5[3] = &unk_1003EC4F8;
  v5[4] = self;
  v5[5] = &v6;
  sub_1002C11C4(lock, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)close
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LZMAStreamReader;
  -[Stream close](&v4, "close");
  -[StreamReader close](self->_streamReader, "close");
  streamReader = self->_streamReader;
  self->_streamReader = 0LL;
}

- (void)open
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LZMAStreamReader;
  -[Stream open](&v3, "open");
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = ASDLogHandleForCategory(7LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "(LZMAStreamReader) Upstream event code %lu",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x2020000000LL;
  unint64_t v18 = a4;
  lock = self->_lock;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001F14E8;
  v13[3] = &unk_1003EC4F8;
  v13[4] = self;
  v13[5] = &buf;
  sub_1002C11C4(lock, v13);
  if (*(void *)(*((void *)&buf + 1) + 24LL))
  {
    if (-[Stream streamStatus](self, "streamStatus") < 2 || -[Stream streamStatus](self, "streamStatus") > 5)
    {
      uint64_t v11 = ASDLogHandleForCategory(7LL);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(*((void *)&buf + 1) + 24LL);
        *(_DWORD *)v14 = 134217984;
        uint64_t v15 = v12;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "(LZMAStreamReader) Not forwarding event code %lu",  v14,  0xCu);
      }
    }

    else
    {
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[Stream delegate](self, "delegate"));
      -[os_log_s stream:handleEvent:](v10, "stream:handleEvent:", self, *(void *)(*((void *)&buf + 1) + 24LL));
    }
  }

  _Block_object_dispose(&buf, 8);
}

- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = -1LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_1001F16C8;
  v14 = sub_1001F16D8;
  lock = self->_lock;
  id v15 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001F16E0;
  v9[3] = &unk_1003EC598;
  v9[4] = self;
  v9[5] = &v10;
  v9[7] = a4;
  v9[8] = a3;
  v9[6] = &v16;
  sub_1002C11C4(lock, v9);
  int64_t v7 = v17[3];
  if (a5 && v7 < 0)
  {
    *a5 = (id) v11[5];
    int64_t v7 = v17[3];
  }

  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (void).cxx_destruct
{
}

@end