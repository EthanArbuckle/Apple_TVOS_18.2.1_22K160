@interface HHDKeepAliveFileManager
- (BOOL)createFileAndReturnError:(id *)a3;
- (BOOL)exists;
- (BOOL)removeFileAndReturnError:(id *)a3;
- (HHDKeepAliveFileManager)init;
- (HHDKeepAliveFileManager)initWithFileManager:(id)a3;
@end

@implementation HHDKeepAliveFileManager

- (HHDKeepAliveFileManager)initWithFileManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___HHDKeepAliveFileManager;
  v6 = -[HHDKeepAliveFileManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fileManager, a3);
  }

  return v7;
}

- (HHDKeepAliveFileManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = -[HHDKeepAliveFileManager initWithFileManager:](self, "initWithFileManager:", v3);

  return v4;
}

- (BOOL)createFileAndReturnError:(id *)a3
{
  fileManager = self->_fileManager;
  id v17 = 0LL;
  unsigned __int8 v6 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( fileManager,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/private/var/mobile/Library/HomeHub",  1LL,  0LL,  &v17);
  id v7 = v17;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (a3 && v7) {
      *a3 = v7;
    }
    id v12 = sub_10000ADFC();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412546;
    v19 = &stru_100024E50;
    __int16 v20 = 2112;
    v21 = v8;
    v14 = "%@Unable to create directory for keep-alive file: %@";
    goto LABEL_14;
  }

  objc_super v9 = self->_fileManager;
  v10 = (void *)objc_claimAutoreleasedReturnValue([@"1" dataUsingEncoding:4]);
  LOBYTE(v9) = -[NSFileManager createFileAtPath:contents:attributes:]( v9,  "createFileAtPath:contents:attributes:",  @"/private/var/mobile/Library/HomeHub/homehubd.keepalive",  v10,  0LL);

  if ((v9 & 1) == 0)
  {
    if (a3 && v8) {
      *a3 = v8;
    }
    id v15 = sub_10000ADFC();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412546;
    v19 = &stru_100024E50;
    __int16 v20 = 2112;
    v21 = v8;
    v14 = "%@Unable to create keep-alive file: %@";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
LABEL_15:

    BOOL v11 = 0;
    goto LABEL_16;
  }

  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (BOOL)removeFileAndReturnError:(id *)a3
{
  fileManager = self->_fileManager;
  id v11 = 0LL;
  unsigned __int8 v5 = -[NSFileManager removeItemAtPath:error:]( fileManager,  "removeItemAtPath:error:",  @"/private/var/mobile/Library/HomeHub/homehubd.keepalive",  &v11);
  id v6 = v11;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (a3 && v6) {
      *a3 = v6;
    }
    id v8 = sub_10000ADFC();
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = &stru_100024E50;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@Failed to remove keep-alive file: %@",  buf,  0x16u);
    }
  }

  return v5;
}

- (BOOL)exists
{
  return -[NSFileManager fileExistsAtPath:]( self->_fileManager,  "fileExistsAtPath:",  @"/private/var/mobile/Library/HomeHub/homehubd.keepalive");
}

- (void).cxx_destruct
{
}

@end