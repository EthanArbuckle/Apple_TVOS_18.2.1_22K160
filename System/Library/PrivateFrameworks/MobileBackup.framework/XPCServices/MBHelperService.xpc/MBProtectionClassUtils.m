@interface MBProtectionClassUtils
+ (BOOL)canOpenWhenLocked:(unsigned __int8)a3;
+ (BOOL)isContentUnavailableDueToCxExpiration:(id)a3 error:(id *)a4;
+ (BOOL)isProtected:(unsigned __int8)a3;
+ (BOOL)setWithFD:(int)a3 value:(unsigned __int8)a4 error:(id *)a5;
+ (BOOL)setWithPath:(id)a3 value:(unsigned __int8)a4 error:(id *)a5;
+ (BOOL)setWithPathFSR:(const char *)a3 value:(unsigned __int8)a4 error:(id *)a5;
+ (int)openRawEncryptedWithPath:(id)a3 error:(id *)a4;
+ (int)openRawEncryptedWithPathFSR:(const char *)a3 error:(id *)a4;
+ (int)sqliteOpenFlagForProtectionClass:(unsigned __int8)a3;
+ (unsigned)getWithFD:(int)a3 error:(id *)a4;
+ (unsigned)getWithPath:(id)a3 error:(id *)a4;
+ (unsigned)getWithPathFSR:(const char *)a3 error:(id *)a4;
@end

@implementation MBProtectionClassUtils

+ (BOOL)isProtected:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (a3 < 8u && ((0x9Fu >> a3) & 1) != 0)
  {
    return (0x8Eu >> a3) & 1;
  }

  else
  {
    v4 = (os_log_s *)MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "=pc= +isProtected: Invalid protection class: %d",  buf,  8u);
      _MBLog(@"FAULT", (uint64_t)"=pc= +isProtected: Invalid protection class: %d", v5, v6, v7, v8, v9, v10, v3);
    }

    LOBYTE(v11) = 1;
  }

  return v11;
}

+ (BOOL)canOpenWhenLocked:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (a3 < 8u && ((0x9Fu >> a3) & 1) != 0)
  {
    return (0xF9u >> a3) & 1;
  }

  else
  {
    v4 = (os_log_s *)MBGetDefaultLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
    if (v5)
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "=pc= +canOpenWhenLocked: Invalid protection class: %d",  buf,  8u);
      _MBLog( @"FAULT",  (uint64_t)"=pc= +canOpenWhenLocked: Invalid protection class: %d",  v6,  v7,  v8,  v9,  v10,  v11,  v3);
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

+ (int)openRawEncryptedWithPath:(id)a3 error:(id *)a4
{
  return +[MBProtectionClassUtils openRawEncryptedWithPathFSR:error:]( MBProtectionClassUtils,  "openRawEncryptedWithPathFSR:error:",  [a3 fileSystemRepresentation],  a4);
}

+ (unsigned)getWithPath:(id)a3 error:(id *)a4
{
  return +[MBProtectionClassUtils getWithPathFSR:error:]( MBProtectionClassUtils,  "getWithPathFSR:error:",  [a3 fileSystemRepresentation],  a4);
}

+ (BOOL)isContentUnavailableDueToCxExpiration:(id)a3 error:(id *)a4
{
  uint64_t v7 = (const char *)[a3 fileSystemRepresentation];
  int v8 = open(v7, 256);
  uint64_t v9 = __error();
  if ((v8 & 0x80000000) == 0)
  {
    close(v8);
    return 0;
  }

  if (*v9 != 1) {
    return 0;
  }
  BOOL v10 = 1;
  if (a4) {
    *a4 = +[MBError errorWithErrno:code:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:code:path:format:",  1LL,  240LL,  a3,  @"File content unavailable with protection class %d",  7LL);
  }
  return v10;
}

+ (unsigned)getWithPathFSR:(const char *)a3 error:(id *)a4
{
  id v5 = objc_msgSend(a1, "openRawEncryptedWithPathFSR:error:", a3);
  int v6 = (int)v5;
  unsigned __int8 v7 = +[MBProtectionClassUtils getWithFD:error:](&OBJC_CLASS___MBProtectionClassUtils, "getWithFD:error:", v5, a4);
  close(v6);
  return v7;
}

+ (BOOL)setWithPath:(id)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  return +[MBProtectionClassUtils setWithPathFSR:value:error:]( MBProtectionClassUtils,  "setWithPathFSR:value:error:",  [a3 fileSystemRepresentation],  a4,  a5);
}

+ (BOOL)setWithPathFSR:(const char *)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v8 = open(a3, 256);
  if ((v8 & 0x80000000) != 0)
  {
    if (a5)
    {
      if (a3) {
        v12 = (const __CFString *)+[NSString mb_stringWithFileSystemRepresentation:]( &OBJC_CLASS___NSString,  "mb_stringWithFileSystemRepresentation:",  a3);
      }
      else {
        v12 = @"(null)";
      }
      if (*__error() == 1
        && !+[MBProtectionClassUtils canOpenWhenLocked:](&OBJC_CLASS___MBProtectionClassUtils, "canOpenWhenLocked:", v6))
      {
        v13 = +[MBError errorWithCode:path:format:]( &OBJC_CLASS___MBError,  "errorWithCode:path:format:",  208LL,  v12,  @"open error setting protection class (device locked?)");
      }

      else
      {
        v13 = +[MBError posixErrorWithPath:format:]( &OBJC_CLASS___MBError,  "posixErrorWithPath:format:",  v12,  @"open error setting protection class");
      }

      *a5 = v13;
    }

    return 0;
  }

  else
  {
    int v9 = v8;
    BOOL v10 = +[MBProtectionClassUtils setWithFD:value:error:]( &OBJC_CLASS___MBProtectionClassUtils,  "setWithFD:value:error:",  v8,  v6,  a5);
    close(v9);
    return v10;
  }

+ (int)openRawEncryptedWithPathFSR:(const char *)a3 error:(id *)a4
{
  int result = open_dprotected_np(a3, 256, 0, 1);
  if (result < 0)
  {
    int v7 = *__error();
    if (a4) {
      *a4 = +[MBError posixErrorWithPath:format:]( &OBJC_CLASS___MBError,  "posixErrorWithPath:format:",  +[NSString mb_stringWithFileSystemRepresentation:]( &OBJC_CLASS___NSString,  "mb_stringWithFileSystemRepresentation:",  a3),  @"open_dprotected_np error");
    }
    uint64_t v8 = (os_log_s *)MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 136315394;
      *(void *)&buf.st_mode = a3;
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "=pc= open_dprotected_np failed at %s: %{errno}d",  (uint8_t *)&buf,  0x12u);
      _MBLog( @"ERROR",  (uint64_t)"=pc= open_dprotected_np failed at %s: %{errno}d",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)a3);
    }

    if (v7 == 22)
    {
    }

    else
    {
      if (v7 != 1) {
        return -1;
      }
      memset(&buf, 0, sizeof(buf));
      int v15 = lstat(a3, &buf);
      if (v15 | buf.st_flags & 0x20) {
        return -1;
      }
    }

    id v16 = +[NSString mb_stringWithFileSystemRepresentation:]( &OBJC_CLASS___NSString,  "mb_stringWithFileSystemRepresentation:",  a3);
    MBDiagnoseiCloudBackupFileAtPath();
    v17 = (os_log_s *)MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      buf.st_dev = 138412546;
      *(void *)&buf.st_mode = v16;
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "=pc= open_dprotected_np failed at %@: %{errno}d",  (uint8_t *)&buf,  0x12u);
      _MBLog( @"FAULT",  (uint64_t)"=pc= open_dprotected_np failed at %@: %{errno}d",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)v16);
    }

    return -1;
  }

  return result;
}

+ (unsigned)getWithFD:(int)a3 error:(id *)a4
{
  int v5 = fcntl(a3, 63);
  if (v5 < 0)
  {
    if (a4) {
      *a4 = +[MBError posixErrorWithFormat:]( &OBJC_CLASS___MBError,  "posixErrorWithFormat:",  @"fcntl error getting protection class");
    }
    LOBYTE(v5) = -1;
  }

  return v5;
}

+ (BOOL)setWithFD:(int)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  int v7 = fcntl(a3, 64, a4);
  int v8 = v7;
  if (a5 && v7)
  {
    if (*__error() == 1
      && !+[MBProtectionClassUtils canOpenWhenLocked:](&OBJC_CLASS___MBProtectionClassUtils, "canOpenWhenLocked:", v6))
    {
      uint64_t v9 = +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  208LL,  @"fcntl permission error setting protection class (device locked?)");
    }

    else
    {
      uint64_t v9 = +[MBError posixErrorWithFormat:]( &OBJC_CLASS___MBError,  "posixErrorWithFormat:",  @"fcntl error setting protection class");
    }

    *a5 = v9;
  }

  return v8 == 0;
}

+ (int)sqliteOpenFlagForProtectionClass:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  char v4 = a3 - 1;
  int v5 = (os_log_s *)MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109120;
    int v14 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "=pc= No SQLite open flag known for protection class: %d",  buf,  8u);
    _MBLog( @"DEFAULT",  (uint64_t)"=pc= No SQLite open flag known for protection class: %d",  v6,  v7,  v8,  v9,  v10,  v11,  v3);
  }

  return 0x400000;
}

@end