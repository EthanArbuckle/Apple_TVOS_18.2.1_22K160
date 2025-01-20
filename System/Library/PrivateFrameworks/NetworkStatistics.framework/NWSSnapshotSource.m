@interface NWSSnapshotSource
+ (id)routeSnapshotForIPv4Host:(sockaddr_in *)a3 viaInterfaceIndex:(int)a4;
+ (id)routeSnapshotForIPv6Host:(sockaddr_in6 *)a3 viaInterfaceIndex:(int)a4;
- (NWSSnapshotSource)init;
- (int64_t)recv:(void *)a3 length:(unint64_t)a4 err:(int *)a5;
- (int64_t)send:(void *)a3 length:(unint64_t)a4 err:(int *)a5;
- (void)dealloc;
@end

@implementation NWSSnapshotSource

- (NWSSnapshotSource)init
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NWSSnapshotSource;
  v2 = -[NWSSnapshotSource init](&v12, sel_init);
  if (!v2) {
    goto LABEL_10;
  }
  int v3 = socket(32, 2, 2);
  if (v3 != -1)
  {
    int v4 = v3;
    int v8 = 1;
    if (!setsockopt(v3, 0xFFFF, 4130, &v8, 4u))
    {
      int v14 = 0;
      memset(v13, 0, sizeof(v13));
      __strlcpy_chk();
      if (ioctl(v4, 0xC0644E03uLL, v13) != -1)
      {
        uint64_t v10 = 0LL;
        *(void *)&v9[12] = 0LL;
        int v11 = 0;
        *(_DWORD *)v9 = 139296;
        *(_DWORD *)&v9[4] = v13[0];
        *(_DWORD *)&v9[8] = 0;
        if (!connect(v4, (const sockaddr *)v9, 0x20u))
        {
          int v6 = fcntl(v4, 3, 0LL);
          if (fcntl(v4, 4, v6 | 4u) != -1)
          {
            v2->_sockFd = v4;
LABEL_10:
            v5 = v2;
            goto LABEL_11;
          }
        }
      }
    }

    close(v4);
  }

  v5 = 0LL;
LABEL_11:

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWSSnapshotSource;
  -[NWSSnapshotSource dealloc](&v3, sel_dealloc);
}

- (int64_t)send:(void *)a3 length:(unint64_t)a4 err:(int *)a5
{
  ssize_t v6 = send(self->_sockFd, a3, a4, 0);
  int64_t v7 = v6;
  if (a5)
  {
    if (v6 < 0) {
      int v8 = *__error();
    }
    else {
      int v8 = 0;
    }
    *a5 = v8;
  }

  return v7;
}

- (int64_t)recv:(void *)a3 length:(unint64_t)a4 err:(int *)a5
{
  ssize_t v6 = recv(self->_sockFd, a3, a4, 0);
  int64_t v7 = v6;
  if (a5)
  {
    if (v6 < 0) {
      int v8 = *__error();
    }
    else {
      int v8 = 0;
    }
    *a5 = v8;
  }

  return v7;
}

+ (id)routeSnapshotForIPv4Host:(sockaddr_in *)a3 viaInterfaceIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  ssize_t v6 = objc_alloc_init(&OBJC_CLASS___NWSSnapshotSource);
  [MEMORY[0x189603F48] dataWithBytes:a3 length:16];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:]( objc_alloc(&OBJC_CLASS___NWSRouteSnapshotter),  "initWithSource:dest:mask:ifindex:",  v6,  v7,  0LL,  v4);
  v9 = -[NWSRouteSnapshotter snapshot](v8, "snapshot");
  return v9;
}

+ (id)routeSnapshotForIPv6Host:(sockaddr_in6 *)a3 viaInterfaceIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  ssize_t v6 = objc_alloc_init(&OBJC_CLASS___NWSSnapshotSource);
  [MEMORY[0x189603F48] dataWithBytes:a3 length:28];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:]( objc_alloc(&OBJC_CLASS___NWSRouteSnapshotter),  "initWithSource:dest:mask:ifindex:",  v6,  v7,  0LL,  v4);
  v9 = -[NWSRouteSnapshotter snapshot](v8, "snapshot");
  return v9;
}

@end