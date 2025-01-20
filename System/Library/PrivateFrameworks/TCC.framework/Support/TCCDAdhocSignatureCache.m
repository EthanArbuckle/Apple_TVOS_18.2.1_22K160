@interface TCCDAdhocSignatureCache
- (TCCDAdhocSignatureCache)init;
- (TCCDAdhocSignatureCache)initWithDirectoryPath:(id)a3 capacity:(unint64_t)a4;
- (id)cacheKeyForStaticCode:(__SecCode *)a3;
- (id)getSignatureForStaticCode:(__SecCode *)a3;
- (id)loadSignatureWithUUID:(id)a3;
- (id)logHandle;
- (id)stateDump;
- (void)addSignature:(id)a3 forStaticCode:(__SecCode *)a4;
- (void)createStateHandler;
- (void)loadKeysFromDirectory;
- (void)maintainSize;
- (void)saveKeysToDirectory;
- (void)saveSignature:(id)a3 withUUID:(id)a4;
@end

@implementation TCCDAdhocSignatureCache

- (id)logHandle
{
  if (qword_100078358 != -1) {
    dispatch_once(&qword_100078358, &stru_100065980);
  }
  return (id)qword_100078360;
}

- (TCCDAdhocSignatureCache)initWithDirectoryPath:(id)a3 capacity:(unint64_t)a4
{
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TCCDAdhocSignatureCache;
  v7 = -[TCCDAdhocSignatureCache init](&v30, "init");
  if (!v7)
  {
LABEL_16:
    v19 = v7;
    goto LABEL_17;
  }

  if (v6)
  {
    v8 = (NSString *)[v6 copy];
    directoryPath = v7->_directoryPath;
    v7->_directoryPath = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v7->_directoryPath,  "stringByAppendingPathComponent:",  @"keys"));
    keysPath = v7->_keysPath;
    v7->_keysPath = (NSString *)v10;

    v7->_capacity = a4;
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    fileManager = v7->_fileManager;
    v7->_fileManager = (NSFileManager *)v12;

    char v29 = 0;
    if (-[NSFileManager fileExistsAtPath:isDirectory:]( v7->_fileManager,  "fileExistsAtPath:isDirectory:",  v7->_directoryPath,  &v29))
    {
      BOOL v14 = v29 == 0;
    }

    else
    {
      BOOL v14 = 1;
    }

    if (v14)
    {
      v15 = v7->_fileManager;
      v16 = v7->_directoryPath;
      id v28 = 0LL;
      unsigned __int8 v17 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v15,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v16,  1LL,  0LL,  &v28);
      id v20 = v28;
      if ((v17 & 1) == 0)
      {
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache logHandle](v7, "logHandle"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100027E50();
        }
      }
    }

    else
    {
      -[TCCDAdhocSignatureCache loadKeysFromDirectory](v7, "loadKeysFromDirectory");
      id v20 = 0LL;
    }

    if (!v7->_keys)
    {
      v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      keys = v7->_keys;
      v7->_keys = v21;
    }

    v23 = objc_alloc_init(&OBJC_CLASS___NSCache);
    signatures = v7->_signatures;
    v7->_signatures = v23;

    -[NSCache setName:](v7->_signatures, "setName:", @"AdhocSignatureCache");
    -[NSCache setTotalCostLimit:](v7->_signatures, "setTotalCostLimit:", v7->_capacity);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.tcc.AdhocSignatureCache", 0LL);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v25;

    -[TCCDAdhocSignatureCache createStateHandler](v7, "createStateHandler");
    goto LABEL_16;
  }

  v19 = 0LL;
LABEL_17:

  return v19;
}

- (TCCDAdhocSignatureCache)init
{
  return 0LL;
}

- (id)stateDump
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v4 = self->_keys;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_keys,  "objectForKeyedSubscript:",  v9,  (void)v18));
        id v11 = [v10 mutableCopy];
        [v3 setObject:v11 forKeyedSubscript:v9];

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v9]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"UUID"]);

        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v9]);
        [v15 setObject:v14 forKeyedSubscript:@"UUID"];
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v6);
  }

  id v16 = [v3 copy];
  return v16;
}

- (void)createStateHandler
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100026524;
  v5[3] = &unk_100065750;
  v5[4] = self;
  os_state_add_handler(v4, v5);
}

- (void)loadKeysFromDirectory
{
  keysPath = self->_keysPath;
  id v22 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  keysPath,  0LL,  &v22));
  id v5 = v22;
  if (v5)
  {
    id v7 = v5;
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100027FF0();
    }
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSUUID, v12);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDate, v14);
    unsigned __int8 v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v11,  v13,  v15,  objc_opt_class(&OBJC_CLASS___NSNumber, v16),  0LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    id v21 = 0LL;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v8,  v4,  &v21));
    id v7 = v21;
    if (v7)
    {
      keys = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache logHandle](self, "logHandle"));
      if (os_log_type_enabled((os_log_t)keys, OS_LOG_TYPE_ERROR)) {
        sub_100027F90();
      }
    }

    else
    {
      __int128 v20 = (NSMutableDictionary *)[v18 mutableCopy];
      keys = self->_keys;
      self->_keys = v20;
    }
  }
}

- (void)saveKeysToDirectory
{
  keys = self->_keys;
  id v11 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  keys,  1LL,  &v11));
  id v5 = v11;
  if (v5)
  {
    id v6 = v5;
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache logHandle](self, "logHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000280B0();
    }
LABEL_7:

    goto LABEL_8;
  }

  keysPath = self->_keysPath;
  id v10 = 0LL;
  unsigned __int8 v9 = [v4 writeToFile:keysPath options:1 error:&v10];
  id v6 = v10;
  if ((v9 & 1) == 0)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache logHandle](self, "logHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100028050();
    }
    goto LABEL_7;
  }

- (id)loadSignatureWithUUID:(id)a3
{
  directoryPath = self->_directoryPath;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](directoryPath, "stringByAppendingPathComponent:", v5));

  id v11 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v6,  0LL,  &v11));
  id v8 = v11;
  if (v8)
  {
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100028114();
    }
  }

  return v7;
}

- (void)saveSignature:(id)a3 withUUID:(id)a4
{
  directoryPath = self->_directoryPath;
  id v7 = a3;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([a4 UUIDString]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](directoryPath, "stringByAppendingPathComponent:", v8));

  id v12 = 0LL;
  LOBYTE(v8) = [v7 writeToFile:v9 options:1 error:&v12];

  id v10 = v12;
  if ((v8 & 1) == 0)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache logHandle](self, "logHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100028174();
    }
  }
}

- (id)cacheKeyForStaticCode:(__SecCode *)a3
{
  CFURLRef path = 0LL;
  OSStatus v4 = SecCodeCopyPath(a3, 0, &path);
  if (v4 || !path)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002849C(v4, v12);
    }

    id v7 = 0LL;
    id v8 = 0LL;
    unsigned __int8 v9 = 0LL;
    id v10 = 0LL;
    id v11 = 0LL;
    id v5 = 0LL;
    goto LABEL_10;
  }

  id v5 = path;
  if (statfs((const char *)-[__CFURL fileSystemRepresentation](v5, "fileSystemRepresentation"), &v34))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100028414(v5, v6);
    }

    id v7 = 0LL;
    id v8 = 0LL;
    unsigned __int8 v9 = 0LL;
    id v10 = 0LL;
    id v11 = 0LL;
    goto LABEL_10;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v34.f_fstypename));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v34.f_mntonname));
  HIDWORD(v32) = 0;
  uint64_t v33 = 0LL;
  LODWORD(v32) = 5;
  *(void *)((char *)&v32 + 4) = 0x8006000080000000LL;
  if (getattrlist(v34.f_mntonname, &v32, v35, 0x48uLL, 0))
  {
    if (qword_100078358 != -1) {
      dispatch_once(&qword_100078358, &stru_100065980);
    }
    uint64_t v16 = (void *)qword_100078360;
    if (os_log_type_enabled((os_log_t)qword_100078360, OS_LOG_TYPE_ERROR)) {
      sub_100028390((uint64_t)v34.f_mntonname, v16);
    }
    id v7 = 0LL;
    id v8 = 0LL;
    unsigned __int8 v9 = 0LL;
    goto LABEL_10;
  }

  if ((v36 & 4) != 0)
  {
    unsigned __int8 v17 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &v41);
  }

  else
  {
    if (qword_100078358 != -1) {
      dispatch_once(&qword_100078358, &stru_100065980);
    }
    if (os_log_type_enabled((os_log_t)qword_100078360, OS_LOG_TYPE_DEBUG)) {
      sub_100028330();
    }
    unsigned __int8 v17 = 0LL;
  }

  if ((v36 & 2) != 0)
  {
    int v18 = v39[0] & 1;
  }

  else
  {
    if (qword_100078358 != -1) {
      dispatch_once(&qword_100078358, &stru_100065980);
    }
    if (os_log_type_enabled((os_log_t)qword_100078360, OS_LOG_TYPE_DEBUG)) {
      sub_1000282D0();
    }
    int v18 = 0;
  }

  unsigned __int8 v9 = v17;
  id v5 = v5;
  __int128 v19 = (const char *)-[__CFURL fileSystemRepresentation](v5, "fileSystemRepresentation");
  uint64_t v33 = 0x1400000000LL;
  __int128 v32 = 0x8000080000000005LL;
  if (getattrlist(v19, &v32, v35, 0x43CuLL, 0x20u))
  {
    if (qword_100078358 != -1) {
      dispatch_once(&qword_100078358, &stru_100065980);
    }
    __int128 v20 = (void *)qword_100078360;
    if (os_log_type_enabled((os_log_t)qword_100078360, OS_LOG_TYPE_ERROR)) {
      sub_10002824C((uint64_t)v19, v20);
    }
    id v7 = 0LL;
LABEL_58:
    id v8 = 0LL;
LABEL_10:
    uint64_t v13 = 0LL;
    goto LABEL_11;
  }

  if ((v35[5] & 8) != 0) {
    double v21 = (double)v38;
  }
  else {
    double v21 = 0.0;
  }
  char v22 = v37;
  if ((v37 & 4) != 0)
  {
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  (char *)v39 + v39[0]));
    char v22 = v37;
  }

  else
  {
    id v23 = 0LL;
  }

  if ((v22 & 0x10) != 0) {
    unint64_t v24 = v40;
  }
  else {
    unint64_t v24 = 0LL;
  }
  id v8 = v23;
  dispatch_queue_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", v21));
  id v7 = v25;
  if (v18) {
    BOOL v26 = v24 >= 2;
  }
  else {
    BOOL v26 = 0;
  }
  int v27 = !v26;
  if (v27 == 1 && !v8)
  {
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache logHandle](self, "logHandle"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1000281D4(v5, v28);
    }

    goto LABEL_58;
  }

  if (v27) {
    unint64_t v29 = 0LL;
  }
  else {
    unint64_t v29 = v24;
  }
  [v25 timeIntervalSince1970];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%@:%lld:%ld",  v10,  v8,  v9,  v29,  (uint64_t)v30));
LABEL_11:
  id v14 = v13;

  return v14;
}

- (void)maintainSize
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000271CC;
  block[3] = &unk_100064D50;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)getSignatureForStaticCode:(__SecCode *)a3
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_1000267F4;
  uint64_t v16 = sub_100026804;
  id v17 = 0LL;
  OSStatus v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache cacheKeyForStaticCode:](self, "cacheKeyForStaticCode:", a3));
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002777C;
    block[3] = &unk_100065938;
    block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync(queue, block);
  }

  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)addSignature:(id)a3 forStaticCode:(__SecCode *)a4
{
  id v6 = a3;
  if (v6 && a4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAdhocSignatureCache cacheKeyForStaticCode:](self, "cacheKeyForStaticCode:", a4));
    id v8 = v7;
    if (v7)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100027B08;
      block[3] = &unk_100065960;
      block[4] = self;
      id v11 = v7;
      id v12 = v6;
      dispatch_async(queue, block);
    }
  }
}

- (void).cxx_destruct
{
}

@end