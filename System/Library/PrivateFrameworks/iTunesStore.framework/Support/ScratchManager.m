@interface ScratchManager
+ (id)_baseDirectoryPath;
+ (id)_containerDirectoryPath;
+ (id)_directoryPathForDownloadID:(int64_t)a3 createIfNeeded:(BOOL)a4 atBasePath:(id)a5;
+ (id)baseDirectoryPath;
+ (id)containerDirectoryPath;
+ (id)directoryPathForDownloadID:(int64_t)a3 assetID:(int64_t)a4 createIfNeeded:(BOOL)a5;
+ (id)directoryPathForDownloadID:(int64_t)a3 assetID:(int64_t)a4 kind:(id)a5 createIfNeeded:(BOOL)a6;
+ (id)directoryPathForDownloadID:(int64_t)a3 kind:(id)a4 createIfNeeded:(BOOL)a5;
@end

@implementation ScratchManager

+ (id)baseDirectoryPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _baseDirectoryPath]);
  v3 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v3,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v2,  1LL,  0LL,  0LL);

  return v2;
}

+ (id)containerDirectoryPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _containerDirectoryPath]);
  v3 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v3,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v2,  1LL,  0LL,  0LL);

  return v2;
}

+ (id)directoryPathForDownloadID:(int64_t)a3 assetID:(int64_t)a4 createIfNeeded:(BOOL)a5
{
  return [a1 directoryPathForDownloadID:a3 assetID:a4 kind:0 createIfNeeded:a5];
}

+ (id)directoryPathForDownloadID:(int64_t)a3 assetID:(int64_t)a4 kind:(id)a5 createIfNeeded:(BOOL)a6
{
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 directoryPathForDownloadID:a3 kind:a5 createIfNeeded:a6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v8]);

  return v9;
}

+ (id)directoryPathForDownloadID:(int64_t)a3 kind:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
  if ([v9 isMultiUser])
  {
    int IsEBookKind = SSDownloadKindIsEBookKind(v8);

    if (IsEBookKind)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _containerDirectoryPath]);
      goto LABEL_6;
    }
  }

  else
  {
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _baseDirectoryPath]);
LABEL_6:
  v12 = (void *)v11;
  if (!v11) {
    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _baseDirectoryPath]);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _directoryPathForDownloadID:a3 createIfNeeded:v5 atBasePath:v12]);

  return v13;
}

+ (id)_baseDirectoryPath
{
  if (qword_1003A33B0 != -1) {
    dispatch_once(&qword_1003A33B0, &stru_10034E0D8);
  }
  return (id)qword_1003A33A8;
}

+ (id)_containerDirectoryPath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E0AF8;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A33C0 != -1) {
    dispatch_once(&qword_1003A33C0, block);
  }
  return (id)qword_1003A33B8;
}

+ (id)_directoryPathForDownloadID:(int64_t)a3 createIfNeeded:(BOOL)a4 atBasePath:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v8]);

  if (v5 && v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v10,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v9,  1LL,  0LL,  0LL);
  }

  return v9;
}

@end