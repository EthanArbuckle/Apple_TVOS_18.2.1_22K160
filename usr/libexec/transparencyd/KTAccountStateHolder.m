@interface KTAccountStateHolder
- (BOOL)persistAccountChanges:(id)a3;
- (KTAccountStateHolder)initWithFileStorage:(id)a3;
- (NSURL)url;
- (id)loadAccountMetadata;
- (void)clearAccountMetadata;
- (void)setUrl:(id)a3;
@end

@implementation KTAccountStateHolder

- (KTAccountStateHolder)initWithFileStorage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
LABEL_4:
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___KTAccountStateHolder;
    v7 = -[KTAccountStateHolder init](&v11, "init");
    v8 = v7;
    if (v7) {
      -[KTAccountStateHolder setUrl:](v7, "setUrl:", v4);
    }
    goto LABEL_11;
  }

  id v12 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  &v12));
  id v6 = v12;
  if (v5)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"AccountState.pblist"]);

    goto LABEL_4;
  }

  if (qword_1002EEF50 != -1) {
    dispatch_once(&qword_1002EEF50, &stru_10028A188);
  }
  v9 = (os_log_s *)qword_1002EEF58;
  if (os_log_type_enabled((os_log_t)qword_1002EEF58, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "TransparencyFileSupport transparencyFilesPath: %@",  buf,  0xCu);
  }

  id v4 = 0LL;
  v8 = 0LL;
LABEL_11:

  return v8;
}

- (id)loadAccountMetadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder url](self, "url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v2));

  if (v3)
  {
    id v10 = 0LL;
    id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___KTAccountState, v4),  v3,  &v10);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = v10;
    if (!v6)
    {
      if (qword_1002EEF50 != -1) {
        dispatch_once(&qword_1002EEF50, &stru_10028A1A8);
      }
      v8 = (os_log_s *)qword_1002EEF58;
      if (os_log_type_enabled((os_log_t)qword_1002EEF58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "loadAccountMetadata failed: %@", buf, 0xCu);
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)persistAccountChanges:(id)a3
{
  uint64_t v4 = (uint64_t (**)(id, KTAccountState *))a3;
  id v5 = (KTAccountState *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder loadAccountMetadata](self, "loadAccountMetadata"));
  if (!v5) {
    id v5 = objc_alloc_init(&OBJC_CLASS___KTAccountState);
  }
  uint64_t v6 = v4[2](v4, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v20 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  &v20));
  id v9 = v20;
  if (!v8)
  {
    if (qword_1002EEF50 != -1) {
      dispatch_once(&qword_1002EEF50, &stru_10028A1C8);
    }
    v13 = (os_log_s *)qword_1002EEF58;
    if (os_log_type_enabled((os_log_t)qword_1002EEF58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "persistAccountChanges failed archive: %@",  buf,  0xCu);
    }

    goto LABEL_15;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder url](self, "url"));
  id v19 = v9;
  [v8 writeToURL:v10 options:268435457 error:&v19];
  id v11 = v19;

  if (v11)
  {
    if (qword_1002EEF50 != -1) {
      dispatch_once(&qword_1002EEF50, &stru_10028A1E8);
    }
    id v12 = (os_log_s *)qword_1002EEF58;
    if (os_log_type_enabled((os_log_t)qword_1002EEF58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "persistAccountChanges failed write: %@",  buf,  0xCu);
    }

LABEL_15:
    BOOL v14 = 0;
    goto LABEL_16;
  }

  if (qword_1002EEF50 != -1) {
    dispatch_once(&qword_1002EEF50, &stru_10028A208);
  }
  v16 = (void *)qword_1002EEF58;
  BOOL v14 = 1;
  if (os_log_type_enabled((os_log_t)qword_1002EEF58, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder url](self, "url"));
    *(_DWORD *)buf = 138412290;
    id v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "wrote account metadata: %@", buf, 0xCu);
  }

- (void)clearAccountMetadata
{
  if (qword_1002EEF50 != -1) {
    dispatch_once(&qword_1002EEF50, &stru_10028A228);
  }
  v3 = (void *)qword_1002EEF58;
  if (os_log_type_enabled((os_log_t)qword_1002EEF58, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder url](self, "url"));
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "deleting account metadata: %@",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateHolder url](self, "url"));
  [v6 removeItemAtURL:v7 error:0];
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end