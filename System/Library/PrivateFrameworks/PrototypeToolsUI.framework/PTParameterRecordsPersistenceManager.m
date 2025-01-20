@interface PTParameterRecordsPersistenceManager
- (NSString)path;
- (PTParameterRecordsPersistenceManager)init;
- (id)createParameterRecordsFromArchiveDictionary;
- (void)_writeToDiskWithParameterRecords:(id)a3;
- (void)setPath:(id)a3;
- (void)writeToDisk:(id)a3;
@end

@implementation PTParameterRecordsPersistenceManager

- (PTParameterRecordsPersistenceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PTParameterRecordsPersistenceManager;
  v2 = -[PTParameterRecordsPersistenceManager init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.PrototypeTools.PTParameterRecordsPersistenceManager", 0LL);
    parameterRecordsArchiveQueue = v2->_parameterRecordsArchiveQueue;
    v2->_parameterRecordsArchiveQueue = (OS_dispatch_queue *)v3;

    id v5 = sub_100005708();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[PTParameterRecordsPersistenceManager setPath:](v2, "setPath:", v6);
  }

  return v2;
}

- (id)createParameterRecordsFromArchiveDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTParameterRecordsPersistenceManager path](self, "path"));
  id v17 = 0LL;
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v2,  0LL,  &v17));
  id v4 = v17;

  if (v4)
  {
    uint64_t v5 = PTLogObjectForTopic(2LL);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unexpected error: %@", buf, 0xCu);
    }
  }

  v7 = objc_alloc(&OBJC_CLASS___NSSet);
  v18[0] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  v18[1] = objc_opt_class(&OBJC_CLASS___PTParameterRecordLeaf);
  v18[2] = objc_opt_class(&OBJC_CLASS___NSString);
  v18[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 4LL));
  v9 = -[NSSet initWithArray:](v7, "initWithArray:", v8);

  id v16 = v4;
  v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v3,  &v16));
  id v11 = v16;

  if (!v10)
  {
    uint64_t v12 = PTLogObjectForTopic(2LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Error unarchiving persisted proxy definition: %@",  buf,  0xCu);
    }

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  v14 = -[PTParameterRecords initWithDictionary:]( objc_alloc(&OBJC_CLASS___PTParameterRecords),  "initWithDictionary:",  v10);

  return v14;
}

- (void)_writeToDiskWithParameterRecords:(id)a3
{
  id v4 = a3;
  parameterRecordsArchiveQueue = (dispatch_queue_s *)self->_parameterRecordsArchiveQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005A80;
  v7[3] = &unk_100014768;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(parameterRecordsArchiveQueue, v7);
}

- (void)writeToDisk:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100005C90;
  v4[3] = &unk_100014768;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end