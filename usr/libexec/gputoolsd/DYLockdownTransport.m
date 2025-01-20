@interface DYLockdownTransport
- (DYLockdownTransport)init;
- (id)connect;
- (int)_ssl_st_read:(void *)a3 size:(unint64_t *)a4;
- (int)_ssl_st_write:(const void *)a3 size:(unint64_t *)a4;
- (int64_t)_read:(void *)a3 size:(unint64_t)a4;
- (int64_t)_write:(const void *)a3 size:(unint64_t)a4;
- (void)_waitEAGAIN;
- (void)closeSocketDescriptor;
- (void)dealloc;
@end

@implementation DYLockdownTransport

- (DYLockdownTransport)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DYLockdownTransport;
  v2 = -[DYLockdownTransport init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_socket = -1;
    v4 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", object_getClassName(v2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"gputools.%@.%p.%@", v5, v3, @"ssl"));
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    sslQueue = v3->_sslQueue;
    v3->_sslQueue = (OS_dispatch_queue *)v7;

    v9 = v3;
  }

  return v3;
}

- (void)dealloc
{
  connectionInfo = self->_connectionInfo;
  if (connectionInfo) {
    CFRelease(connectionInfo);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DYLockdownTransport;
  -[DYLockdownTransport dealloc](&v4, "dealloc");
}

- (int)_ssl_st_read:(void *)a3 size:(unint64_t *)a4
{
  size_t v4 = *a4;
  *a4 = 0LL;
  if (!v4) {
    return 0;
  }
  v8 = (char *)a3;
  while (1)
  {
    ssize_t v9 = recv(self->_socket, v8, v4, 0);
    if (v9 != -1)
    {
      if (!v9) {
        return -9805;
      }
      v4 -= v9;
      unint64_t v10 = *a4 + v9;
      *a4 = v10;
      v8 = (char *)a3 + v10;
      goto LABEL_9;
    }

    if (*__error() == 35) {
      return -9803;
    }
    if (*__error() == 54) {
      return -9806;
    }
    if (*__error() != 4) {
      return -36;
    }
LABEL_9:
    if (!v4) {
      return 0;
    }
  }

- (int)_ssl_st_write:(const void *)a3 size:(unint64_t *)a4
{
  size_t v4 = *a4;
  *a4 = 0LL;
  if (!v4) {
    return 0;
  }
  v8 = (char *)a3;
  while (1)
  {
    ssize_t v9 = send(self->_socket, v8, v4, 0);
    if (v9 != -1)
    {
      v4 -= v9;
      unint64_t v10 = *a4 + v9;
      *a4 = v10;
      v8 = (char *)a3 + v10;
      goto LABEL_8;
    }

    if (*__error() == 35)
    {
      self->_needWrite = 1;
      return -9803;
    }

    if (*__error() == 32) {
      return -9806;
    }
    if (*__error() != 4) {
      return -36;
    }
LABEL_8:
    if (!v4) {
      return 0;
    }
  }

- (void)_waitEAGAIN
{
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  if (a4)
  {
    if (self->_ssl)
    {
      self->_needWrite = 0;
      uint64_t v13 = 0LL;
      v14 = &v13;
      uint64_t v15 = 0x2020000000LL;
      sslQueue = (dispatch_queue_s *)self->_sslQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100006C40;
      block[3] = &unk_10000C818;
      block[4] = self;
      block[5] = &v13;
      block[7] = a3;
      block[8] = a4;
      block[6] = &v16;
      dispatch_sync(sslQueue, block);
      int v6 = *((_DWORD *)v14 + 6);
      if (!v6)
      {
LABEL_18:
        _Block_object_dispose(&v13, 8);
        id v7 = (id)v17[3];
        goto LABEL_19;
      }

      if (v6 == -9803)
      {
        *__error() = 35;
        if (self->_needWrite)
        {
          -[DYLockdownTransport scheduleReadOnWritableSocket](self, "scheduleReadOnWritableSocket");
          self->_needWrite = 0;
        }

        if (!v17[3]) {
          v17[3] = -1LL;
        }
        goto LABEL_18;
      }

      v17[3] = -1LL;
      if (v6 != -9816)
      {
        if (v6 == -9800)
        {
          v8 = __error();
          int v9 = 100;
          goto LABEL_17;
        }

        if (v6 != -9806)
        {
          v8 = __error();
          int v9 = 5;
          goto LABEL_17;
        }
      }

      v8 = __error();
      int v9 = 54;
LABEL_17:
      int *v8 = v9;
      goto LABEL_18;
    }

    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___DYLockdownTransport;
    id v7 = -[DYLockdownTransport _read:size:](&v11, "_read:size:", a3);
    v17[3] = (uint64_t)v7;
  }

  else
  {
    id v7 = 0LL;
  }

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  if (a4)
  {
    if (self->_ssl)
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      sslQueue = (dispatch_queue_s *)self->_sslQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100006E4C;
      block[3] = &unk_10000C818;
      block[4] = self;
      block[5] = &v12;
      block[7] = a3;
      block[8] = a4;
      block[6] = &v15;
      dispatch_sync(sslQueue, block);
      int v5 = *((_DWORD *)v13 + 6);
      if (!v5)
      {
LABEL_16:
        _Block_object_dispose(&v12, 8);
        id v6 = (id)v16[3];
        goto LABEL_17;
      }

      if (v5 == -9803)
      {
        *__error() = 35;
        if (!v16[3]) {
          v16[3] = -1LL;
        }
        goto LABEL_16;
      }

      v16[3] = -1LL;
      if (v5 != -9816)
      {
        if (v5 == -9800)
        {
          id v7 = __error();
          int v8 = 100;
          goto LABEL_15;
        }

        if (v5 != -9806)
        {
          id v7 = __error();
          int v8 = 5;
          goto LABEL_15;
        }
      }

      id v7 = __error();
      int v8 = 32;
LABEL_15:
      *id v7 = v8;
      goto LABEL_16;
    }

    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___DYLockdownTransport;
    id v6 = -[DYLockdownTransport _write:size:](&v10, "_write:size:", a3);
    v16[3] = (uint64_t)v6;
  }

  else
  {
    id v6 = 0LL;
  }

- (void)closeSocketDescriptor
{
  if (self->_connection)
  {
    int socket = self->_socket;
    int v4 = fcntl(socket, 3);
    fcntl(socket, 4, v4 & 0xFFFFFFFB);
    lockdown_disconnect(self->_connection);
    self->_connection = 0LL;
    self->_int socket = -1;
    self->_ssl = 0LL;
  }

- (id)connect
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DYFuture future](&OBJC_CLASS___DYFuture, "future"));
  int v4 = *(dispatch_queue_s **)&self->DYBaseSocketTransport_opaque[OBJC_IVAR___DYTransport__queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100006FC8;
  v9[3] = &unk_10000C840;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_async(v4, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (void).cxx_destruct
{
}

@end