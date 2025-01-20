@interface MBTemporaryDirectory
+ (id)sharedTemporaryDirectoryForTest:(id)a3;
+ (id)sharedTemporaryDirectoryIdentifiedBy:(id)a3;
+ (id)temporaryDirectoryOnSameVolumeAsPath:(id)a3 identifiedBy:(id)a4 error:(id *)a5;
+ (id)userTemporaryDirectoryForPersona:(id)a3 identifiedBy:(id)a4;
+ (id)userTemporaryDirectoryForTest:(id)a3;
- (BOOL)_purgeContentsAt:(id)a3 error:(id *)a4;
- (BOOL)dispose;
- (BOOL)disposeWithError:(id *)a3;
- (BOOL)purgeContentsWithError:(id *)a3;
- (NSString)path;
- (id)_initWithExistingFsRepPath:(char *)a3 identifier:(id)a4;
- (id)description;
- (id)makeTemporaryFilePath;
- (void)dealloc;
- (void)disposeWithoutDeleting;
@end

@implementation MBTemporaryDirectory

+ (id)sharedTemporaryDirectoryForTest:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    sub_100011A58();
  }
  if (qword_100022280 != -1) {
    dispatch_once(&qword_100022280, &stru_10001C860);
  }
  id v4 = -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]( objc_alloc(&OBJC_CLASS___MBTemporaryDirectory),  "_initWithExistingFsRepPath:identifier:",  sub_100008620((const char *)qword_100022278, v3, 0LL),  v3);

  return v4;
}

+ (id)userTemporaryDirectoryForTest:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    sub_100011AD0();
  }
  if (qword_100022290 != -1) {
    dispatch_once(&qword_100022290, &stru_10001C880);
  }
  id v4 = -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]( objc_alloc(&OBJC_CLASS___MBTemporaryDirectory),  "_initWithExistingFsRepPath:identifier:",  sub_100008620((const char *)qword_100022288, v3, 0LL),  v3);

  return v4;
}

+ (id)sharedTemporaryDirectoryIdentifiedBy:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    sub_100011AF8();
  }
  if (qword_1000222A0 != -1) {
    dispatch_once(&qword_1000222A0, &stru_10001C8A0);
  }
  id v4 = -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]( objc_alloc(&OBJC_CLASS___MBTemporaryDirectory),  "_initWithExistingFsRepPath:identifier:",  sub_100008620((const char *)qword_100022298, v3, 0LL),  v3);

  return v4;
}

+ (id)userTemporaryDirectoryForPersona:(id)a3 identifiedBy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    sub_100011B20();
  }
  v7 = v6;
  if (![v6 length]) {
    sub_100011B48();
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 volumeMountPoint]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"tmp"]);
  id v10 = objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"com.apple.backup"]);
  v11 = (const char *)[v10 fileSystemRepresentation];

  sub_1000089C0(v11);
  id v12 = -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]( objc_alloc(&OBJC_CLASS___MBTemporaryDirectory),  "_initWithExistingFsRepPath:identifier:",  sub_100008620(v11, v7, 0LL),  v7);

  return v12;
}

+ (id)temporaryDirectoryOnSameVolumeAsPath:(id)a3 identifiedBy:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    sub_100011B98();
  }
  v9 = v8;
  if (![v8 length]) {
    sub_100011BC0();
  }
  if (!a5) {
    sub_100011BE8();
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MBFileSystemManager volumeMountPointForFile:error:]( &OBJC_CLASS___MBFileSystemManager,  "volumeMountPointForFile:error:",  v7,  a5));
  v11 = v10;
  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"tmp"]);
    id v13 = objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:@"com.apple.backup"]);
    v14 = (const char *)[v13 fileSystemRepresentation];

    sub_1000089C0(v14);
    v15 = sub_100008620(v14, v9, (char *)a5);
    if (v15) {
      v15 = -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]( objc_alloc(&OBJC_CLASS___MBTemporaryDirectory),  "_initWithExistingFsRepPath:identifier:",  v15,  v9);
    }
  }

  else
  {
    id v16 = MBGetDefaultLog();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = *a5;
      *(_DWORD *)buf = 138412546;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "=tmpdir= could not find mount point for %@: %@",  buf,  0x16u);
      _MBLog( @"ERROR",  (uint64_t)"=tmpdir= could not find mount point for %@: %@",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v7);
    }

    v15 = 0LL;
  }

  return v15;
}

- (id)_initWithExistingFsRepPath:(char *)a3 identifier:(id)a4
{
  id v7 = a4;
  if (!a3) {
    sub_100011C10();
  }
  id v8 = v7;
  if (!v7) {
    sub_100011C38();
  }
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MBTemporaryDirectory;
  v9 = -[MBTemporaryDirectory init](&v13, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSString mb_stringWithFileSystemRepresentation:]( &OBJC_CLASS___NSString,  "mb_stringWithFileSystemRepresentation:",  a3));
    path = v9->_path;
    v9->_path = (NSString *)v10;

    v9->_fsRepPath = a3;
    objc_storeStrong((id *)&v9->_identifier, a4);
  }

  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (id)makeTemporaryFilePath
{
  return sub_100008C70(self->_fsRepPath);
}

- (BOOL)purgeContentsWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBTemporaryDirectory path](self, "path"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByDeletingLastPathComponent]);

  id v7 = v6;
  id v8 = sub_100008C70((const char *)[v7 fileSystemRepresentation]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBTemporaryDirectory path](self, "path"));
  id v37 = 0LL;
  unsigned __int8 v12 = [v10 moveItemAtPath:v11 toPath:v9 error:&v37];
  id v13 = v37;

  if ((v12 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBTemporaryDirectory path](self, "path"));
    id v36 = v13;
    unsigned __int8 v15 = [v10 createDirectoryAtPath:v14 withIntermediateDirectories:0 attributes:0 error:&v36];
    id v16 = v36;

    if ((v15 & 1) != 0)
    {
      BOOL v17 = -[MBTemporaryDirectory _purgeContentsAt:error:](self, "_purgeContentsAt:error:", v9, a3);
LABEL_15:
      id v13 = v16;
      goto LABEL_16;
    }

    id v27 = MBGetDefaultLog();
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v39 = self;
      __int16 v40 = 2112;
      id v41 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "=tmpdir= %@ failed to create new contents directory: %@",  buf,  0x16u);
      _MBLog( @"ERROR",  (uint64_t)"=tmpdir= %@ failed to create new contents directory: %@",  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)self);
    }

    if (!a3)
    {
      BOOL v17 = 0;
      goto LABEL_15;
    }

    v26 = v16;
  }

  else
  {
    id v18 = MBGetDefaultLog();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v39 = self;
      __int16 v40 = 2112;
      id v41 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "=tmpdir= %@ failed to move contents aside to purge: %@",  buf,  0x16u);
      _MBLog( @"ERROR",  (uint64_t)"=tmpdir= %@ failed to move contents aside to purge: %@",  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)self);
    }

    if (!a3)
    {
      BOOL v17 = 0;
      goto LABEL_16;
    }

    v26 = v13;
  }

  id v13 = v26;
  BOOL v17 = 0;
  *a3 = v13;
LABEL_16:

  return v17;
}

- (BOOL)_purgeContentsAt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v19 = 0LL;
  unsigned __int8 v8 = [v7 removeItemAtPath:v6 error:&v19];

  id v9 = v19;
  if ((v8 & 1) == 0)
  {
    id v10 = MBGetDefaultLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = self;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=tmpdir= failed to delete %@: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"=tmpdir= failed to delete %@: %@", v12, v13, v14, v15, v16, v17, (uint64_t)self);
    }

    if (a4) {
      *a4 = v9;
    }
  }

  return v8;
}

- (void)disposeWithoutDeleting
{
  obj = self;
  objc_sync_enter(obj);
  obj->_disposed = 1;
  objc_sync_exit(obj);
}

- (BOOL)disposeWithError:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v4->_disposed = 1;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBTemporaryDirectory path](v4, "path"));
  LOBYTE(a3) = -[MBTemporaryDirectory _purgeContentsAt:error:](v4, "_purgeContentsAt:error:", v5, a3);

  objc_sync_exit(v4);
  return (char)a3;
}

- (BOOL)dispose
{
  return -[MBTemporaryDirectory disposeWithError:](self, "disposeWithError:", 0LL);
}

- (void)dealloc
{
  self->_fsRepPath = 0LL;
  if (!self->_disposed)
  {
    id v3 = MBGetDefaultLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "=tmpdir= %@ was not disposed before being dealloc'd",  buf,  0xCu);
      _MBLog( @"ERROR",  (uint64_t)"=tmpdir= %@ was not disposed before being dealloc'd",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)self);
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MBTemporaryDirectory;
  -[MBTemporaryDirectory dealloc](&v11, "dealloc");
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%s: %@, path: %s>",  class_getName(v3),  self->_identifier,  self->_fsRepPath);
}

- (void).cxx_destruct
{
}

@end