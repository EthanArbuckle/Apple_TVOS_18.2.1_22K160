@interface FPAirFair
- (BOOL)Jaz0t2BPNjwE;
- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 grappaID:(unsigned int)a5 hostVersion:(id)a6 error:(id *)a7;
- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6;
- (FPAirFair)init;
- (id)supportedDataclasses;
- (int)DrFjYlmSKahjfJzgmaPvs:(FairPlayHWInfo_ *)a3;
- (int)ENaUvadPgTNQtAOA;
- (int)FVxWQcJol3R;
- (int)MvKgJWHiyPi9jHcCD1zBrVK7F:(id)a3 bytes:(char *)a4 size:(unsigned int *)a5;
- (int)U0DV0QxFFjyMatlbDyqSZ4s3d:(id)a3;
- (int)cIjYbQiRD8mj9H;
- (int)wkiHcH3uUYkLWEOOs:(char *)a3 reqSize:(unsigned int)a4 fileName:(id)a5;
- (void)dealloc;
- (void)syncEndedWithSuccess:(BOOL)a3;
@end

@implementation FPAirFair

- (FPAirFair)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FPAirFair;
  v2 = -[FPAirFair init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[FPAirFair ENaUvadPgTNQtAOA](v2, "ENaUvadPgTNQtAOA");
  }
  return v3;
}

- (void)dealloc
{
  unsigned int HPD8FhhtYi5OC5SPY = self->HPD8FhhtYi5OC5SPY;
  if (HPD8FhhtYi5OC5SPY)
  {
    VLxCLgDpiF(HPD8FhhtYi5OC5SPY);
    self->unsigned int HPD8FhhtYi5OC5SPY = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FPAirFair;
  -[FPAirFair dealloc](&v4, "dealloc");
}

- (id)supportedDataclasses
{
  return +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", @"Keybag");
}

- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 grappaID:(unsigned int)a5 hostVersion:(id)a6 error:(id *)a7
{
  uint64_t v21 = 0LL;
  unsigned int v20 = 0;
  uint64_t v19 = 0LL;
  self->LnGBbUJQLDA = a5;
  df35957c4e0();
  if (!v10 || (uint64_t v11 = -[FPAirFair ENaUvadPgTNQtAOA](self, "ENaUvadPgTNQtAOA"), !(_DWORD)v11))
  {
    uint64_t v12 = a6
       && ([@"11.0.2.0" compare:a6 options:64] == (id)-1
        || ![@"11.0.2.0" compare:a6 options:64])
        ? 110103LL
        : 0LL;
    Mt76Vq80ux(self->HPD8FhhtYi5OC5SPY, 0LL, v12, 7LL, (uint64_t)&v21, (uint64_t)&v20);
    uint64_t v11 = v13;
    if (!(_DWORD)v13)
    {
      uint64_t v11 = -[FPAirFair FVxWQcJol3R](self, "FVxWQcJol3R");
      if (!(_DWORD)v11)
      {
        uint64_t v11 = -[FPAirFair wkiHcH3uUYkLWEOOs:reqSize:fileName:]( self,  "wkiHcH3uUYkLWEOOs:reqSize:fileName:",  v21,  v20,  @"/var/mobile/Media/AirFair/sync/afsync.rq");
        if (!(_DWORD)v11)
        {
          jumT7rcoieclCtxS2rgJ(self->LnGBbUJQLDA, v21, v20, (uint64_t)&v19);
          uint64_t v11 = v14;
          if (!(_DWORD)v14) {
            uint64_t v11 = -[FPAirFair wkiHcH3uUYkLWEOOs:reqSize:fileName:]( self,  "wkiHcH3uUYkLWEOOs:reqSize:fileName:",  v19,  0LL,  @"/var/mobile/Media/AirFair/sync/afsync.rq.sig");
          }
        }
      }
    }
  }

  if (v21) {
    jEHf8Xzsv8K(v21);
  }
  if (v19) {
    X5EvIJWqdcALcjaxX6Pl(v19);
  }
  if ((_DWORD)v11)
  {
    v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AirFair:prepareForSyncWithHostAnchor failed with error %d",  v11);
    v16 = (os_log_s *)_ATLogCategorySyncBundle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v17 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"AirFair",  (int)v11,  0LL);
    if (v17) {
      *a7 = v17;
    }
  }

  return (_DWORD)v11 == 0;
}

- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6
{
  uint64_t v19 = 0LL;
  int v18 = 0;
  uint64_t v17 = 0LL;
  int v16 = 0;
  if (!-[FPAirFair Jaz0t2BPNjwE](self, "Jaz0t2BPNjwE", *(void *)&a3, a4, a5)) {
    goto LABEL_15;
  }
  uint64_t v8 = -[FPAirFair MvKgJWHiyPi9jHcCD1zBrVK7F:bytes:size:]( self,  "MvKgJWHiyPi9jHcCD1zBrVK7F:bytes:size:",  @"/var/mobile/Media/AirFair/sync/afsync.rs.sig",  &v17,  &v16);
  if (!(_DWORD)v8)
  {
    uint64_t v8 = -[FPAirFair MvKgJWHiyPi9jHcCD1zBrVK7F:bytes:size:]( self,  "MvKgJWHiyPi9jHcCD1zBrVK7F:bytes:size:",  @"/var/mobile/Media/AirFair/sync/afsync.rs",  &v19,  &v18);
    if (!(_DWORD)v8)
    {
      CFUnnB0JdUjJ5CNJMkDS();
      uint64_t v8 = v9;
      if (!(_DWORD)v9)
      {
        lCUad();
        uint64_t v8 = v10;
      }
    }
  }

  if (v17) {
    X5EvIJWqdcALcjaxX6Pl(v17);
  }
  if (v19) {
    free(v19);
  }
  if ((_DWORD)v8)
  {
    uint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AirFair:reconcileSync failed with error %d",  v8);
    uint64_t v12 = (os_log_s *)_ATLogCategorySyncBundle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v11;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v13 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"AirFair.syncbundle reconsileSync",  (int)v8,  0LL);
    if (v13)
    {
      uint64_t v14 = v13;
      LOBYTE(v13) = 0;
      *a6 = v14;
    }
  }

  else
  {
LABEL_15:
    LOBYTE(v13) = 1;
  }

  return (char)v13;
}

- (void)syncEndedWithSuccess:(BOOL)a3
{
  uint64_t v3 = -[FPAirFair cIjYbQiRD8mj9H](self, "cIjYbQiRD8mj9H", a3);
  if ((_DWORD)v3 != -42112 && (_DWORD)v3)
  {
    objc_super v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AirFair:syncEndedWithSuccess failed with error %d",  v3);
    objc_super v5 = (os_log_s *)_ATLogCategorySyncBundle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }

- (BOOL)Jaz0t2BPNjwE
{
  return 0;
}

- (int)FVxWQcJol3R
{
  * __error() = 0;
  mode_t v2 = umask(0);
  if (mkdir((const char *)[@"/var/mobile/Media/AirFair/" UTF8String], 0x1F6u) < 0
    && *__error() != 17)
  {
    int v3 = -42110;
  }

  else
  {
    * __error() = 0;
    int v3 = 0;
    if (mkdir((const char *)[@"/var/mobile/Media/AirFair/sync/" UTF8String], 0x1F6u) < 0)
    {
      if (*__error() == 17) {
        int v3 = 0;
      }
      else {
        int v3 = -42110;
      }
    }
  }

  umask(v2);
  return v3;
}

- (int)wkiHcH3uUYkLWEOOs:(char *)a3 reqSize:(unsigned int)a4 fileName:(id)a5
{
  v7 = (const char *)[a5 UTF8String];
  mode_t v8 = umask(0);
  int v9 = open(v7, 1825, 420LL);
  if (v9 < 0)
  {
    if (*__error() == 2) {
      int v11 = -42112;
    }
    else {
      int v11 = -42110;
    }
  }

  else
  {
    int v10 = v9;
    if (write(v9, a3, a4) == a4) {
      int v11 = 0;
    }
    else {
      int v11 = -42110;
    }
    close(v10);
  }

  umask(v8);
  return v11;
}

- (int)MvKgJWHiyPi9jHcCD1zBrVK7F:(id)a3 bytes:(char *)a4 size:(unsigned int *)a5
{
  int v7 = open((const char *)[a3 UTF8String], 272, 0);
  if (v7 < 0)
  {
    int v9 = 0LL;
    LODWORD(st_size) = 0;
    if (*__error() == 2) {
      int v11 = -42112;
    }
    else {
      int v11 = -42110;
    }
  }

  else
  {
    int v8 = v7;
    if (fstat(v7, &v14))
    {
      int v9 = 0LL;
      LODWORD(st_size) = 0;
      int v11 = -42110;
    }

    else
    {
      off_t st_size = v14.st_size;
      int v9 = malloc(LODWORD(v14.st_size));
      if (v9)
      {
        ssize_t v12 = read(v8, v9, st_size);
        if (v12 == v14.st_size) {
          int v11 = 0;
        }
        else {
          int v11 = -42110;
        }
      }

      else
      {
        int v11 = -42028;
      }
    }

    close(v8);
    if (v9 && v11)
    {
      free(v9);
      int v9 = 0LL;
      LODWORD(st_size) = 0;
    }
  }

  *a4 = (char *)v9;
  *a5 = st_size;
  return v11;
}

- (int)U0DV0QxFFjyMatlbDyqSZ4s3d:(id)a3
{
  int v3 = (const char *)[a3 UTF8String];
  if (lstat(v3, &v6))
  {
    if (*__error() == 2) {
      return -42112;
    }
    else {
      return -42110;
    }
  }

  else
  {
    int v4 = -42110;
    if ((v6.st_mode & 0xF000) != 0xA000)
    {
      if (unlink(v3)) {
        return -42110;
      }
      else {
        return 0;
      }
    }
  }

  return v4;
}

- (int)cIjYbQiRD8mj9H
{
  return -[FPAirFair U0DV0QxFFjyMatlbDyqSZ4s3d:]( self,  "U0DV0QxFFjyMatlbDyqSZ4s3d:",  @"/var/mobile/Media/AirFair/sync/afsync.rs.sig");
}

- (int)DrFjYlmSKahjfJzgmaPvs:(FairPlayHWInfo_ *)a3
{
  if (!a3) {
    return -42023;
  }
  int v4 = (const __CFString *)MGCopyAnswer(@"UniqueDeviceID", 0LL);
  if (!v4) {
    return 0;
  }
  objc_super v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 != CFStringGetTypeID()) {
    return -42023;
  }
  if (CFStringGetCString(v5, buffer, 41LL, 0x8000100u))
  {
    size_t v7 = strlen(buffer);
    zxcm2Qme0x((uint64_t)buffer, v7, (uint64_t)a3);
    int v9 = v8;
  }

  else
  {
    int v9 = -42023;
  }

  CFRelease(v5);
  return v9;
}

- (int)ENaUvadPgTNQtAOA
{
  int v3 = -[FPAirFair DrFjYlmSKahjfJzgmaPvs:](self, "DrFjYlmSKahjfJzgmaPvs:", v12);
  if (!v3)
  {
    uint64_t v5 = XtCqEf5X( 0LL,  (uint64_t)v12,  (uint64_t)"/var/mobile/Media/iTunes_Control/iTunes/",  (uint64_t)&self->HPD8FhhtYi5OC5SPY);
    int v3 = v5;
    if ((_DWORD)v5)
    {
      if ((_DWORD)v5 == -42180)
      {
        int v3 = -42180;
        CFTypeID v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AirFair plugin failed to initialize %d - to be expected on boot before SpringBoard (rdar://9874159)",  4294925116LL);
        size_t v7 = (os_log_s *)_ATLogCategorySyncBundle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          int v11 = v6;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          return -42180;
        }
      }

      else
      {
        int v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AirFair plugin failed to initialize %d",  v5);
        int v9 = (os_log_s *)_ATLogCategorySyncBundle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          int v11 = v8;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }

  return v3;
}

@end