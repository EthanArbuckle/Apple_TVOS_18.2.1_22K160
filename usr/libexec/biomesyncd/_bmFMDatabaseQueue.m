@interface _bmFMDatabaseQueue
+ (Class)databaseClass;
+ (id)databaseQueueWithPath:(id)a3;
+ (id)databaseQueueWithPath:(id)a3 flags:(int)a4;
+ (id)databaseQueueWithURL:(id)a3;
+ (id)databaseQueueWithURL:(id)a3 flags:(int)a4;
- (BOOL)checkpoint:(int)a3 error:(id *)a4;
- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5;
- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7;
- (NSString)path;
- (NSString)vfsName;
- (_bmFMDatabaseQueue)init;
- (_bmFMDatabaseQueue)initWithPath:(id)a3;
- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4;
- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5;
- (_bmFMDatabaseQueue)initWithURL:(id)a3;
- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4;
- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5;
- (id)database;
- (id)inSavePoint:(id)a3;
- (int)openFlags;
- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4;
- (void)close;
- (void)dealloc;
- (void)inDatabase:(id)a3;
- (void)inDeferredTransaction:(id)a3;
- (void)inExclusiveTransaction:(id)a3;
- (void)inImmediateTransaction:(id)a3;
- (void)inTransaction:(id)a3;
- (void)interrupt;
- (void)setPath:(id)a3;
- (void)setVfsName:(id)a3;
@end

@implementation _bmFMDatabaseQueue

+ (id)databaseQueueWithPath:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPath:v4];

  return v5;
}

+ (id)databaseQueueWithURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseQueueWithPath:v4]);

  return v5;
}

+ (id)databaseQueueWithPath:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithPath:v6 flags:v4];

  return v7;
}

+ (id)databaseQueueWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseQueueWithPath:v6 flags:v4]);

  return v7;
}

+ (Class)databaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS____bmFMDatabase, a2);
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  v10 = -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", v9, v5, v8);

  return v10;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS____bmFMDatabaseQueue;
  v11 = -[_bmFMDatabaseQueue init](&v24, "init");
  v13 = v11;
  if (v11)
  {
    id v14 = objc_msgSend(objc_msgSend((id)objc_opt_class(v11, v12), "databaseClass"), "databaseWithPath:", v9);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    db = v13->_db;
    v13->_db = (_bmFMDatabase *)v15;

    if (!-[_bmFMDatabase openWithFlags:vfs:](v13->_db, "openWithFlags:vfs:", v6, v10))
    {
      NSLog(@"Could not create database queue for path %@", v9);
      v22 = 0LL;
      goto LABEL_6;
    }

    objc_storeStrong((id *)&v13->_path, a3);
    v17 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"fmdb.%@", v13);
    dispatch_queue_t v18 = dispatch_queue_create(-[NSString UTF8String](v17, "UTF8String"), 0LL);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v18;

    dispatch_queue_set_specific((dispatch_queue_t)v13->_queue, &off_100069A70, v13, 0LL);
    v13->_openFlags = v6;
    v20 = (NSString *)[v10 copy];
    vfsName = v13->_vfsName;
    v13->_vfsName = v20;
  }

  v22 = v13;
LABEL_6:

  return v22;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3 flags:(int)a4
{
  return -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", a3, *(void *)&a4, 0LL);
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  id v7 = -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", v6, v4, 0LL);

  return v7;
}

- (_bmFMDatabaseQueue)initWithURL:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  uint64_t v5 = -[_bmFMDatabaseQueue initWithPath:](self, "initWithPath:", v4);

  return v5;
}

- (_bmFMDatabaseQueue)initWithPath:(id)a3
{
  return -[_bmFMDatabaseQueue initWithPath:flags:vfs:](self, "initWithPath:flags:vfs:", a3, 6LL, 0LL);
}

- (_bmFMDatabaseQueue)init
{
  return -[_bmFMDatabaseQueue initWithPath:](self, "initWithPath:", 0LL);
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____bmFMDatabaseQueue;
  -[_bmFMDatabaseQueue dealloc](&v4, "dealloc");
}

- (void)close
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003F808;
  block[3] = &unk_100068B70;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)interrupt
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[_bmFMDatabaseQueue database](self, "database"));
  [v2 interrupt];
}

- (id)database
{
  if (-[_bmFMDatabase isOpen](self->_db, "isOpen")) {
    goto LABEL_5;
  }
  db = self->_db;
  if (!db)
  {
    id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, v3), "databaseClass"), "databaseWithPath:", self->_path);
    uint64_t v6 = (_bmFMDatabase *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = self->_db;
    self->_db = v6;

    db = self->_db;
  }

  if (-[_bmFMDatabase openWithFlags:vfs:](db, "openWithFlags:vfs:", self->_openFlags, self->_vfsName))
  {
LABEL_5:
    id v8 = self->_db;
  }

  else
  {
    NSLog(@"_bmFMDatabaseQueue could not reopen database for path %@", self->_path);
    id v9 = self->_db;
    self->_db = 0LL;

    id v8 = 0LL;
  }

  return v8;
}

- (void)inDatabase:(id)a3
{
  id v4 = a3;
  specific = dispatch_get_specific(&off_100069A70);
  uint64_t v6 = (_bmFMDatabaseQueue *)objc_claimAutoreleasedReturnValue(specific);
  if (v6 == self) {
    sub_10003FFB8();
  }
  queue = self->_queue;
  block[1] = 3221225472LL;
  block[2] = sub_10003F9B0;
  block[3] = &unk_100068B98;
  block[4] = self;
  id v11 = v4;
  id v9 = v6;
  block[0] = _NSConcreteStackBlock;
  id v8 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003FA9C;
  block[3] = &unk_100069A80;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
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
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_10003FC80;
  v16 = sub_10003FC90;
  id v17 = 0LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003FC98;
  block[3] = &unk_100069AA8;
  id v10 = v4;
  int64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)checkpoint:(int)a3 error:(id *)a4
{
  return -[_bmFMDatabaseQueue checkpoint:name:logFrameCount:checkpointCount:error:]( self,  "checkpoint:name:logFrameCount:checkpointCount:error:",  *(void *)&a3,  0LL,  0LL,  0LL,  a4);
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5
{
  return -[_bmFMDatabaseQueue checkpoint:name:logFrameCount:checkpointCount:error:]( self,  "checkpoint:name:logFrameCount:checkpointCount:error:",  *(void *)&a3,  a4,  0LL,  0LL,  a5);
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7
{
  id v12 = a4;
  uint64_t v23 = 0LL;
  objc_super v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003FEE8;
  block[3] = &unk_100069AD0;
  int v22 = a3;
  block[4] = self;
  id v17 = v12;
  dispatch_queue_t v18 = &v23;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  id v14 = v12;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(a6) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)a6;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPath:(id)a3
{
}

- (int)openFlags
{
  return self->_openFlags;
}

- (NSString)vfsName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setVfsName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end