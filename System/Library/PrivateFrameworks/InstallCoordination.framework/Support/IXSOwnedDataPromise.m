@interface IXSOwnedDataPromise
+ (BOOL)supportsSecureCoding;
- (BOOL)_onQueue_createStagingBaseDirWithError:(id *)a3;
- (BOOL)_onQueue_initWithSeedWithError:(id *)a3;
- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)issueSandboxExtensionWithError:(id *)a3;
- (BOOL)stagedPathMayNotExistWhenAwakening;
- (BOOL)validateStagedPathWithError:(id *)a3;
- (IXSOwnedDataPromise)initWithCoder:(id)a3;
- (IXSOwnedDataPromise)initWithSeed:(id)a3 error:(id *)a4;
- (NSError)awakeningError;
- (NSString)relativeStagedPath;
- (NSString)targetLastPathComponent;
- (NSURL)stagedPath;
- (NSURL)stagingBaseDir;
- (void)_internal_setStagedPath:(id)a3;
- (void)_onQueue_purgeStagingBaseDirKeepingBaseDir:(BOOL)a3;
- (void)_remote_getStagedPath:(id)a3;
- (void)_remote_getTargetLastPathComponent:(id)a3;
- (void)_remote_setStagedPath:(id)a3;
- (void)_remote_setTargetLastPathComponent:(id)a3 withCompletion:(id)a4;
- (void)decommission;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setAwakeningError:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setRelativeStagedPath:(id)a3;
- (void)setStagedPath:(id)a3;
- (void)setStagedPathMayNotExistWhenAwakening:(BOOL)a3;
- (void)setTargetLastPathComponent:(id)a3;
@end

@implementation IXSOwnedDataPromise

- (BOOL)_onQueue_createStagingBaseDirWithError:(id *)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  id v44 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 promiseStagingRootDirectoryWithError:&v44]);
  id v8 = v44;

  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](self, "uniqueIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:v10 isDirectory:1]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
    [v12 setStagingBaseDir:v11];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stagingBaseDir]);
    id v43 = v8;
    unsigned __int8 v16 = [v13 createDirectoryAtURL:v15 withIntermediateDirectories:1 mode:493 class:4 error:&v43];
    id v17 = v43;

    v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    if ((v16 & 1) == 0)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10007CC8C();
      }

      id v35 = sub_10003556C( (uint64_t)"-[IXSOwnedDataPromise _onQueue_createStagingBaseDirWithError:]",  65LL,  @"IXErrorDomain",  1uLL,  v17,  0LL,  @"Failed to create promise staging directory",  v34,  v41);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      id v8 = v17;
      goto LABEL_17;
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stagingBaseDir]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
      *(_DWORD *)buf = 136315394;
      v46 = "-[IXSOwnedDataPromise _onQueue_createStagingBaseDirWithError:]";
      __int16 v47 = 2112;
      v48 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s: Created %@", buf, 0x16u);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stagingBaseDir]);
    id v42 = v17;
    unsigned __int8 v27 = [v24 setPermissionsOfItemAtURL:v26 toMode:493 error:&v42];
    id v8 = v42;

    if ((v27 & 1) != 0)
    {
      BOOL v28 = 1;
      goto LABEL_20;
    }

    v37 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_10007CC20();
    }

    v32 = @"Failed to set mode on promise staging directory";
    uint64_t v33 = 74LL;
  }

  else
  {
    v29 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10007CBB4();
    }

    v32 = @"Failed to create promise staging root directory";
    uint64_t v33 = 50LL;
  }

  id v39 = sub_10003556C( (uint64_t)"-[IXSOwnedDataPromise _onQueue_createStagingBaseDirWithError:]",  v33,  @"IXErrorDomain",  1uLL,  v8,  0LL,  v32,  v31,  v41);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v39);
LABEL_17:

  if (a3)
  {
    id v8 = v36;
    BOOL v28 = 0;
    *a3 = v8;
  }

  else
  {
    BOOL v28 = 0;
    id v8 = v36;
  }

- (void)_onQueue_purgeStagingBaseDirKeepingBaseDir:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stagingBaseDir]);
  id v21 = 0LL;
  unsigned __int8 v9 = [v6 removeItemAtURL:v8 keepParent:v3 error:&v21];
  id v10 = v21;

  v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stagingBaseDir]);
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
      *(_DWORD *)buf = 136315394;
      v23 = "-[IXSOwnedDataPromise _onQueue_purgeStagingBaseDirKeepingBaseDir:]";
      __int16 v24 = 2112;
      v25 = v16;
      id v17 = "%s: Destroyed %@";
      v18 = v13;
      os_log_type_t v19 = OS_LOG_TYPE_INFO;
      uint32_t v20 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
    }
  }

  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stagingBaseDir]);
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
    *(_DWORD *)buf = 136315650;
    v23 = "-[IXSOwnedDataPromise _onQueue_purgeStagingBaseDirKeepingBaseDir:]";
    __int16 v24 = 2112;
    v25 = v16;
    __int16 v26 = 2112;
    id v27 = v10;
    id v17 = "%s: Failed to remove staged content at %@: %@";
    v18 = v13;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    uint32_t v20 = 32;
    goto LABEL_6;
  }
}

- (BOOL)_onQueue_initWithSeedWithError:(id *)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  return -[IXSOwnedDataPromise _onQueue_createStagingBaseDirWithError:]( self,  "_onQueue_createStagingBaseDirWithError:",  a3);
}

- (IXSOwnedDataPromise)initWithSeed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___IXSOwnedDataPromise;
  v7 = -[IXSDataPromise initWithSeed:error:](&v26, "initWithSeed:error:", v6, a4);
  id v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  os_log_type_t v19 = sub_100028E88;
  uint32_t v20 = sub_100028E98;
  id v21 = 0LL;
  unsigned __int8 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v7, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100028EA0;
  block[3] = &unk_1000CD448;
  v13 = v8;
  v14 = &v16;
  v15 = &v22;
  dispatch_sync(v9, block);

  if (!*((_BYTE *)v23 + 24))
  {

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
LABEL_7:
    id v10 = v8;
    goto LABEL_8;
  }

  if (a4) {
    *a4 = (id) v17[5];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  id v10 = 0LL;
LABEL_8:

  return v10;
}

- (IXSOwnedDataPromise)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IXSOwnedDataPromise;
  v5 = -[IXSDataPromise initWithCoder:](&v16, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"stagedPath"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v5, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100029064;
      v13[3] = &unk_1000CCCB8;
      v14 = v5;
      id v15 = v7;
      dispatch_sync(v8, v13);
    }

    else
    {
      id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"relativeStagedPath"];
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
      relativeStagedPath = v5->_relativeStagedPath;
      v5->_relativeStagedPath = (NSString *)v10;

      v5->_stagedPathMayNotExistWhenAwakening = [v4 decodeBoolForKey:@"stagedPathMayNotExistWhenAwakening"];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IXSOwnedDataPromise;
  -[IXSDataPromise encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise relativeStagedPath](self, "relativeStagedPath"));
  [v4 encodeObject:v6 forKey:@"relativeStagedPath"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXSOwnedDataPromise stagedPathMayNotExistWhenAwakening](self, "stagedPathMayNotExistWhenAwakening"),  @"stagedPathMayNotExistWhenAwakening");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)reset
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  -[IXSOwnedDataPromise _onQueue_purgeStagingBaseDirKeepingBaseDir:]( self,  "_onQueue_purgeStagingBaseDirKeepingBaseDir:",  1LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IXSOwnedDataPromise;
  -[IXSDataPromise reset](&v4, "reset");
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v9);

  -[IXSOwnedDataPromise _onQueue_purgeStagingBaseDirKeepingBaseDir:]( self,  "_onQueue_purgeStagingBaseDirKeepingBaseDir:",  0LL);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IXSOwnedDataPromise;
  LOBYTE(a5) = -[IXSDataPromise cancelForReason:client:error:](&v11, "cancelForReason:client:error:", v8, a4, a5);

  return (char)a5;
}

- (BOOL)validateStagedPathWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));
    unsigned int v8 = [v6 itemDoesNotExistAtURL:v7];

    if (!v8)
    {
      id v15 = 0LL;
      BOOL v16 = 1;
      goto LABEL_12;
    }

    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10007CD6C(self, v10);
    }

    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
    id v14 = sub_10003556C( (uint64_t)"-[IXSOwnedDataPromise validateStagedPathWithError:]",  201LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"The item that this promise is representing does not exist at staged path %@.",  v13,  (uint64_t)v12);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v14);

    if (!a3) {
      goto LABEL_6;
    }
LABEL_10:
    id v15 = v15;
    BOOL v16 = 0;
    *a3 = v15;
    goto LABEL_12;
  }

  id v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10007CCF8();
  }

  id v20 = sub_10003556C( (uint64_t)"-[IXSOwnedDataPromise validateStagedPathWithError:]",  196LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"The staged path property was not set set.",  v19,  v22);
  id v15 = (id)objc_claimAutoreleasedReturnValue(v20);
  if (a3) {
    goto LABEL_10;
  }
LABEL_6:
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (void)setComplete:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  if (-[IXSDataPromise isComplete](self, "isComplete") != v3)
  {
    if (!v3)
    {
LABEL_5:
      v9.receiver = self;
      v9.super_class = (Class)&OBJC_CLASS___IXSOwnedDataPromise;
      -[IXSDataPromise setComplete:](&v9, "setComplete:", v3);
      return;
    }

    id v10 = 0LL;
    unsigned int v6 = -[IXSOwnedDataPromise validateStagedPathWithError:](self, "validateStagedPathWithError:", &v10);
    id v7 = v10;
    unsigned int v8 = v7;
    if (v6)
    {

      goto LABEL_5;
    }

    -[IXSOwnedDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v7, 15LL, 0LL);
  }

- (void)decommission
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  -[IXSOwnedDataPromise _onQueue_purgeStagingBaseDirKeepingBaseDir:]( self,  "_onQueue_purgeStagingBaseDirKeepingBaseDir:",  0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IXSOwnedDataPromise;
  -[IXSDataPromise decommission](&v4, "decommission");
}

- (NSURL)stagingBaseDir
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stagingBaseDir]);

  return (NSURL *)v5;
}

- (NSString)relativeStagedPath
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  return (NSString *)-[NSString copy](self->_relativeStagedPath, "copy");
}

- (void)setRelativeStagedPath:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = (NSString *)[v4 copy];
  relativeStagedPath = self->_relativeStagedPath;
  self->_relativeStagedPath = v6;
}

- (NSString)targetLastPathComponent
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  return (NSString *)-[NSString copy](self->_targetLastPathComponent, "copy");
}

- (void)setTargetLastPathComponent:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = (NSString *)[v4 copy];
  targetLastPathComponent = self->_targetLastPathComponent;
  self->_targetLastPathComponent = v6;
}

- (NSURL)stagedPath
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise relativeStagedPath](self, "relativeStagedPath"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 promiseStagingRootDirectoryAbortingOnError]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise relativeStagedPath](self, "relativeStagedPath"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:v7 isDirectory:1]);
  }

  else
  {
    unsigned int v8 = 0LL;
  }

  return (NSURL *)v8;
}

- (void)_internal_setStagedPath:(id)a3
{
  id v11 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v4);

  if (v11)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 promiseStagingRootDirectoryAbortingOnError]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "stringByReplacingOccurrencesOfString:withString:options:range:",  v7,  &stru_1000D08C0,  8,  0,  objc_msgSend(v7, "length")));
    id v10 = [v9 mutableCopy];

    -[IXSOwnedDataPromise setRelativeStagedPath:](self, "setRelativeStagedPath:", v10);
  }

  else
  {
    -[IXSOwnedDataPromise setRelativeStagedPath:](self, "setRelativeStagedPath:", 0LL);
  }
}

- (void)setStagedPath:(id)a3
{
  id v9 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    -[IXSOwnedDataPromise _internal_setStagedPath:](self, "_internal_setStagedPath:", v9);
    -[IXSDataPromise saveState](self, "saveState");
  }
}

- (void)setStagedPathMayNotExistWhenAwakening:(BOOL)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  self->_stagedPathMayNotExistWhenAwakening = a3;
  -[IXSDataPromise saveState](self, "saveState");
}

- (BOOL)issueSandboxExtensionWithError:(id *)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = APP_SANDBOX_READ_WRITE;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v8 = objc_claimAutoreleasedReturnValue([v7 stagingBaseDir]);
  id v9 = [v8 fileSystemRepresentation];
  id v10 = (const char *)sandbox_extension_issue_file(v6, v9, SANDBOX_EXTENSION_DEFAULT);

  if (v10)
  {
    id v11 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v10,  strlen(v10),  4LL,  1LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
    [v12 setSandboxExtensionToken:v11];

    id v13 = 0LL;
  }

  else
  {
    unint64_t v14 = *__error();
    id v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 stagingBaseDir]);
      BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
      id v30 = sub_10003556C( (uint64_t)"-[IXSOwnedDataPromise issueSandboxExtensionWithError:]",  351LL,  NSPOSIXErrorDomain,  v14,  0LL,  0LL,  @"Failed to create sandbox extension for com.apple.installcoordinationd for path %@",  v29,  (uint64_t)v28);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "-[IXSOwnedDataPromise issueSandboxExtensionWithError:]";
      __int16 v35 = 2112;
      v36 = v31;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: Could not provide access to staging directory : %@",  buf,  0x16u);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stagingBaseDir]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
    id v21 = sub_10003556C( (uint64_t)"-[IXSOwnedDataPromise issueSandboxExtensionWithError:]",  351LL,  NSPOSIXErrorDomain,  v14,  0LL,  0LL,  @"Failed to create sandbox extension for com.apple.installcoordinationd for path %@",  v20,  (uint64_t)v19);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v24 = sub_10003556C( (uint64_t)"-[IXSOwnedDataPromise issueSandboxExtensionWithError:]",  351LL,  @"IXErrorDomain",  1uLL,  v22,  0LL,  @"Could not provide access to staging directory",  v23,  v32);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v24);

    if (a3)
    {
      id v13 = v13;
      *a3 = v13;
    }
  }

  return v10 != 0LL;
}

- (BOOL)stagedPathMayNotExistWhenAwakening
{
  return self->_stagedPathMayNotExistWhenAwakening;
}

- (NSError)awakeningError
{
  return self->_awakeningError;
}

- (void)setAwakeningError:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_remote_setStagedPath:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029DD0;
  block[3] = &unk_1000CCCB8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_sync(v6, block);
}

- (void)_remote_getStagedPath:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](self, "uniqueIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  BOOL v8 = sub_100031BB0(v7, 8LL);

  if (v8) {
    exit(1);
  }
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  unint64_t v14 = sub_100028E88;
  id v15 = sub_100028E98;
  id v16 = 0LL;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002A0BC;
  v10[3] = &unk_1000CCEF8;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v9, v10);

  v4[2](v4, v12[5], 0LL);
  _Block_object_dispose(&v11, 8);
}

- (void)_remote_setTargetLastPathComponent:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v8);

  if ([v6 containsString:@"/"])
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10007CF14();
    }

    id v12 = sub_10003556C( (uint64_t)"-[IXSOwnedDataPromise(IXSOwnedDataPromiseIPCMethods) _remote_setTargetLastPathComponent:withCompletion:]",  404LL,  @"IXErrorDomain",  0x29uLL,  0LL,  0LL,  @"Failed to set target last path component to %@ because it contains slash(es)",  v11,  (uint64_t)v6);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v7[2](v7, v13);
  }

  else
  {
    unint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002A268;
    block[3] = &unk_1000CCCB8;
    void block[4] = self;
    id v16 = v6;
    dispatch_sync(v14, block);

    v7[2](v7, 0LL);
  }
}

- (void)_remote_getTargetLastPathComponent:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_100028E88;
  id v12 = sub_100028E98;
  id v13 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002A37C;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0LL);
  _Block_object_dispose(&v8, 8);
}

- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue", a3));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise awakeningError](self, "awakeningError"));
  if (!v7)
  {
    if (-[IXSDataPromise isTracked](self, "isTracked"))
    {
      -[IXSDataPromise didAwake](self, "didAwake");
      BOOL v10 = 1;
      -[IXSDataPromise setDidAwake:](self, "setDidAwake:", 1LL);
      if (!-[IXSDataPromise isComplete](self, "isComplete")
        || -[IXSOwnedDataPromise stagedPathMayNotExistWhenAwakening](self, "stagedPathMayNotExistWhenAwakening"))
      {
        id v9 = 0LL;
        goto LABEL_16;
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise targetLastPathComponent](self, "targetLastPathComponent"));
      if (v12)
      {
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v12 isDirectory:1]);

        uint64_t v11 = (void *)v13;
      }

      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
      unsigned int v15 = [v14 itemExistsAtURL:v11];

      if (!v15)
      {
        id v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10007CF88(self, v11, v18);
        }

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](self, "name"));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](self, "uniqueIdentifier"));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
        id v21 = sub_10003556C( (uint64_t)"-[IXSOwnedDataPromise(IXSOwnedDataPromiseIPCMethods) awakeFromSerializationWithLookupBlock:error:]",  463LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"IXSOwnedDataPromise (%@) with UUID %@ was complete but found nothing at %@",  v20,  (uint64_t)v19);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v21);

        -[IXSOwnedDataPromise setAwakeningError:](self, "setAwakeningError:", v9);
        -[IXSOwnedDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v9, 15LL, 0LL);
        if (a4)
        {
          id v8 = v9;
          id v9 = v8;
          goto LABEL_4;
        }

@end