@interface _bmFMDatabasePool
+ (Class)databaseClass;
+ (id)databasePoolWithPath:(id)a3;
+ (id)databasePoolWithPath:(id)a3 flags:(int)a4;
+ (id)databasePoolWithURL:(id)a3;
+ (id)databasePoolWithURL:(id)a3 flags:(int)a4;
- (NSString)path;
- (NSString)vfsName;
- (_bmFMDatabasePool)init;
- (_bmFMDatabasePool)initWithPath:(id)a3;
- (_bmFMDatabasePool)initWithPath:(id)a3 flags:(int)a4;
- (_bmFMDatabasePool)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5;
- (_bmFMDatabasePool)initWithURL:(id)a3;
- (_bmFMDatabasePool)initWithURL:(id)a3 flags:(int)a4;
- (_bmFMDatabasePool)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5;
- (id)db;
- (id)delegate;
- (id)inSavePoint:(id)a3;
- (int)openFlags;
- (unint64_t)countOfCheckedInDatabases;
- (unint64_t)countOfCheckedOutDatabases;
- (unint64_t)countOfOpenDatabases;
- (unint64_t)maximumNumberOfDatabasesToCreate;
- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4;
- (void)dealloc;
- (void)executeLocked:(id)a3;
- (void)inDatabase:(id)a3;
- (void)inDeferredTransaction:(id)a3;
- (void)inExclusiveTransaction:(id)a3;
- (void)inImmediateTransaction:(id)a3;
- (void)inTransaction:(id)a3;
- (void)pushDatabaseBackInPool:(id)a3;
- (void)releaseAllDatabases;
- (void)setDelegate:(id)a3;
- (void)setMaximumNumberOfDatabasesToCreate:(unint64_t)a3;
- (void)setPath:(id)a3;
- (void)setVfsName:(id)a3;
@end

@implementation _bmFMDatabasePool

+ (id)databasePoolWithPath:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPath:v4];

  return v5;
}

+ (id)databasePoolWithURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);

  id v7 = [v5 initWithPath:v6];
  return v7;
}

+ (id)databasePoolWithPath:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithPath:v6 flags:v4];

  return v7;
}

+ (id)databasePoolWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);

  id v9 = [v7 initWithPath:v8 flags:v4];
  return v9;
}

- (_bmFMDatabasePool)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  v10 = -[_bmFMDatabasePool initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", v9, v5, v8);

  return v10;
}

- (_bmFMDatabasePool)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____bmFMDatabasePool;
  v10 = -[_bmFMDatabasePool init](&v23, "init");
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    path = v10->_path;
    v10->_path = v11;

    v13 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"fmdb.%@", v10);
    dispatch_queue_t v14 = dispatch_queue_create(-[NSString UTF8String](v13, "UTF8String"), 0LL);
    lockQueue = v10->_lockQueue;
    v10->_lockQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    databaseInPool = v10->_databaseInPool;
    v10->_databaseInPool = (NSMutableArray *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    databaseOutPool = v10->_databaseOutPool;
    v10->_databaseOutPool = (NSMutableArray *)v18;

    v10->_openFlags = a4;
    v20 = (NSString *)[v9 copy];
    vfsName = v10->_vfsName;
    v10->_vfsName = v20;
  }

  return v10;
}

- (_bmFMDatabasePool)initWithPath:(id)a3 flags:(int)a4
{
  return -[_bmFMDatabasePool initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", a3, *(void *)&a4, 0LL);
}

- (_bmFMDatabasePool)initWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  id v7 = -[_bmFMDatabasePool initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", v6, v4, 0LL);

  return v7;
}

- (_bmFMDatabasePool)initWithPath:(id)a3
{
  return -[_bmFMDatabasePool initWithPath:flags:](self, "initWithPath:flags:", a3, 6LL);
}

- (_bmFMDatabasePool)initWithURL:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  uint64_t v5 = -[_bmFMDatabasePool initWithPath:](self, "initWithPath:", v4);

  return v5;
}

- (_bmFMDatabasePool)init
{
  return -[_bmFMDatabasePool initWithPath:](self, "initWithPath:", 0LL);
}

+ (Class)databaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS____bmFMDatabase, a2);
}

- (void)dealloc
{
  self->_delegate = 0LL;
  lockQueue = self->_lockQueue;
  if (lockQueue)
  {
    self->_lockQueue = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____bmFMDatabasePool;
  -[_bmFMDatabasePool dealloc](&v4, "dealloc");
}

- (void)executeLocked:(id)a3
{
}

- (void)pushDatabaseBackInPool:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10003EA3C;
    v6[3] = &unk_100068E68;
    v6[4] = self;
    id v7 = v4;
    -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v6);
  }
}

- (id)db
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_10003EB70;
  id v9 = sub_10003EB80;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003EB88;
  v4[3] = &unk_100069778;
  v4[4] = self;
  v4[5] = &v5;
  -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (unint64_t)countOfCheckedInDatabases
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003EE14;
  v4[3] = &unk_100069778;
  v4[4] = self;
  v4[5] = &v5;
  -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)countOfCheckedOutDatabases
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003EEE4;
  v4[3] = &unk_100069778;
  v4[4] = self;
  v4[5] = &v5;
  -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)countOfOpenDatabases
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003EFB4;
  v4[3] = &unk_100069778;
  v4[4] = self;
  v4[5] = &v5;
  -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)releaseAllDatabases
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10003F04C;
  v2[3] = &unk_100068B70;
  v2[4] = self;
  -[_bmFMDatabasePool executeLocked:](self, "executeLocked:", v2);
}

- (void)inDatabase:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabasePool db](self, "db"));
  v4[2](v4, v5);

  -[_bmFMDatabasePool pushDatabaseBackInPool:](self, "pushDatabaseBackInPool:", v5);
}

- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4
{
  id v6 = (void (**)(id, void *, _BYTE *))a4;
  char v9 = 0;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabasePool db](self, "db"));
  id v8 = v7;
  switch(a3)
  {
    case 2LL:
      [v7 beginImmediateTransaction];
      break;
    case 1LL:
      [v7 beginDeferredTransaction];
      break;
    case 0LL:
      [v7 beginTransaction];
      break;
  }

  v6[2](v6, v8, &v9);
  if (v9) {
    [v8 rollback];
  }
  else {
    [v8 commit];
  }
  -[_bmFMDatabasePool pushDatabaseBackInPool:](self, "pushDatabaseBackInPool:", v8);
}

- (void)inTransaction:(id)a3
{
}

- (void)inDeferredTransaction:(id)a3
{
}

- (void)inExclusiveTransaction:(id)a3
{
}

- (void)inImmediateTransaction:(id)a3
{
}

- (id)inSavePoint:(id)a3
{
  id v4 = (void (**)(id, void *, _BYTE *))a3;
  id v5 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v6 = qword_10007C3A8++;
  uint64_t v7 = -[NSString initWithFormat:](v5, "initWithFormat:", @"savePoint%ld", v6);
  char v18 = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabasePool db](self, "db"));
  id v17 = 0LL;
  unsigned int v9 = [v8 startSavePointWithName:v7 error:&v17];
  id v10 = v17;
  if (v9)
  {
    v4[2](v4, v8, &v18);
    if (v18)
    {
      id v16 = v10;
      [v8 rollbackToSavePointWithName:v7 error:&v16];
      id v11 = v16;

      id v10 = v11;
    }

    id v15 = v10;
    [v8 releaseSavePointWithName:v7 error:&v15];
    id v12 = v15;

    id v10 = v12;
  }

  -[_bmFMDatabasePool pushDatabaseBackInPool:](self, "pushDatabaseBackInPool:", v8);
  id v13 = v10;

  return v13;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPath:(id)a3
{
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (unint64_t)maximumNumberOfDatabasesToCreate
{
  return self->_maximumNumberOfDatabasesToCreate;
}

- (void)setMaximumNumberOfDatabasesToCreate:(unint64_t)a3
{
  self->_maximumNumberOfDatabasesToCreate = a3;
}

- (int)openFlags
{
  return self->_openFlags;
}

- (NSString)vfsName
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setVfsName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end