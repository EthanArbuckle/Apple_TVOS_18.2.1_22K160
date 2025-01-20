@interface PKDAnnotationStore
+ (id)confstrURL:(int)a3;
+ (id)globalURL;
- (BOOL)loadDb:(id)a3 error:(id *)a4;
- (BOOL)saveDb:(id *)a3;
- (NSMutableDictionary)annotations;
- (NSURL)annotationsURL;
- (PKDAnnotationStore)initWithDatabase:(id)a3 externalProviders:(id)a4;
- (PKDExternalProviders)external;
- (id)annotationForIdentifier:(id)a3;
- (id)annotationForPlugIn:(id)a3;
- (id)containerURL;
- (id)defaultDatabaseURL;
- (void)containerURL;
- (void)setAnnotation:(id)a3 forPlugIn:(id)a4;
- (void)setAnnotations:(id)a3;
- (void)setAnnotationsURL:(id)a3;
@end

@implementation PKDAnnotationStore

- (PKDAnnotationStore)initWithDatabase:(id)a3 externalProviders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___PKDAnnotationStore;
  v8 = -[PKDAnnotationStore init](&v36, "init");
  v9 = v8;
  if (v8)
  {
    if (v6) {
      v10 = (NSURL *)v6;
    }
    else {
      v10 = (NSURL *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore defaultDatabaseURL](v8, "defaultDatabaseURL"));
    }
    annotationsURL = v9->_annotationsURL;
    v9->_annotationsURL = v10;

    objc_storeStrong((id *)&v9->_external, a4);
    v12 = objc_autoreleasePoolPush();
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore annotationsURL](v9, "annotationsURL"));
    id v35 = 0LL;
    unsigned __int8 v14 = -[PKDAnnotationStore loadDb:error:](v9, "loadDb:error:", v13, &v35);
    id v15 = v35;

    if ((v14 & 1) == 0)
    {
      if ([v15 code] != &stru_B8.reserved3)
      {
        uint64_t v17 = pklog_handle_for_category(10LL, v16);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[PKDAnnotationStore initWithDatabase:externalProviders:].cold.2(v9);
        }
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore containerURL](v9, "containerURL"));
      id v34 = v15;
      unsigned int v20 = -[PKDAnnotationStore loadDb:error:](v9, "loadDb:error:", v19, &v34);
      id v21 = v34;

      if (v20)
      {
        uint64_t v23 = pklog_handle_for_category(10LL, v22);
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "migrating shared annotations", buf, 2u);
        }

        id v32 = v21;
        unsigned __int8 v25 = -[PKDAnnotationStore saveDb:](v9, "saveDb:", &v32);
        id v15 = v32;

        if ((v25 & 1) == 0)
        {
          uint64_t v27 = pklog_handle_for_category(10LL, v26);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            -[PKDAnnotationStore initWithDatabase:externalProviders:].cold.1(v9);
          }
        }
      }

      else
      {
        id v15 = v21;
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore annotations](v9, "annotations"));

      if (!v29)
      {
        v30 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        -[PKDAnnotationStore setAnnotations:](v9, "setAnnotations:", v30);
      }
    }

    objc_autoreleasePoolPop(v12);
  }

  return v9;
}

- (id)annotationForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore annotations](self, "annotations"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (id)annotationForPlugIn:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore annotations](self, "annotations"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 annotationKey]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  return v7;
}

- (void)setAnnotation:(id)a3 forPlugIn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 annotationKey]);
  if (v6)
  {
    uint64_t v9 = PKAnnotationElectionKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PKAnnotationElectionKey]);
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore annotations](self, "annotations"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v9]);

      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 attributes]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:PKProtocolAttribute]);

      if (v15 && (!v13 || ([v13 isEqual:v10] & 1) == 0))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 version]);
        else {
          uint64_t v18 = 3LL;
        }
        pkdMessageTraceStateChange(v16, v17, v15, v18);
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore annotations](self, "annotations"));
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v8]);
    id v21 = (NSMutableDictionary *)[v20 mutableCopy];

    if (!v21) {
      id v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary addEntriesFromDictionary:](v21, "addEntriesFromDictionary:", v6);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore annotations](self, "annotations"));
    [v22 setObject:v21 forKeyedSubscript:v8];
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore annotations](self, "annotations"));
    [v10 removeObjectForKey:v8];
  }

  uint64_t v23 = objc_autoreleasePoolPush();
  id v29 = 0LL;
  unsigned __int8 v24 = -[PKDAnnotationStore saveDb:](self, "saveDb:", &v29);
  id v26 = v29;
  if ((v24 & 1) == 0)
  {
    uint64_t v27 = pklog_handle_for_category(10LL, v25);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[PKDAnnotationStore setAnnotation:forPlugIn:].cold.1(self);
    }
  }

  objc_autoreleasePoolPop(v23);
}

- (BOOL)loadDb:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore external](self, "external"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 filesystem]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataWithContentsOfURL:v6 options:0 error:a4]);

  if (!v9) {
    goto LABEL_10;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v9,  0LL,  0LL,  a4));
  v11 = v10;
  if (!v10)
  {

LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:PKVersionAnnotationsKey]);
  v13 = (int *)[v12 integerValue];

  BOOL v14 = v13 == &dword_10;
  if (v13 == &dword_10)
  {
    id v15 = (NSString *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:PKDataAnnotationsKey]);
    -[PKDAnnotationStore setAnnotations:](self, "setAnnotations:", v15);
  }

  else
  {
    uint64_t v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"found database version %d needed version %d",  v13,  16LL);
    id v15 = v16;
    if (a4)
    {
      uint64_t v17 = pkError(7LL, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v17);
    }
  }

  if (!v11) {
    goto LABEL_10;
  }
LABEL_11:

  return v14;
}

- (BOOL)saveDb:(id *)a3
{
  v15[0] = &off_25F78;
  v14[0] = PKVersionAnnotationsKey;
  v14[1] = PKDataAnnotationsKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore annotations](self, "annotations"));
  v15[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  100LL,  0LL,  a3));
  BOOL v12 = 0;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore external](self, "external"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 filesystem]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore annotationsURL](self, "annotationsURL"));
    unsigned __int8 v11 = [v9 writeToURL:v10 withData:v7 options:268435457 error:a3];

    if ((v11 & 1) != 0) {
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (id)defaultDatabaseURL
{
  NSFileAttributeKey v7 = NSFilePosixPermissions;
  v8 = &off_25F90;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  id v4 = [(id)objc_opt_class(self) globalURL];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

+ (id)confstrURL:(int)a3
{
  if (confstr(a3, v7, 0x400uLL) - 1024 <= 0xFFFFFFFFFFFFFC00LL)
  {
    uint64_t v4 = pklog_handle_for_category(10LL, v3);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PKDAnnotationStore confstrURL:].cold.1(v5);
    }

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"unable to locate user directory: errno %d",  *__error());
  }

  return  -[NSURL initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v7,  1LL,  0LL);
}

+ (id)globalURL
{
  return  -[NSURL initFileURLWithPath:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:",  @"/var/db/PlugInKit-Annotations");
}

- (id)containerURL
{
  uint64_t v10 = 1LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKDAnnotationStore external](self, "external"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 container]);
  id v4 = objc_msgSend( v3,  "create_or_lookup_path_for_current_user:identifier:create_if_necessary:transient:out_existed:out_error:",  10,  "com.apple.pkd",  1,  0,  0,  &v10);

  if (v4)
  {
    id v6 = -[NSURL initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v4,  1LL,  0LL);
    free(v4);
  }

  else
  {
    uint64_t v7 = pklog_handle_for_category(10LL, v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[PKDAnnotationStore containerURL].cold.1(&v10, v8);
    }

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"unable to locate user container: error %llu",  v10);
    id v6 = 0LL;
  }

  return v6;
}

- (NSURL)annotationsURL
{
  return self->_annotationsURL;
}

- (void)setAnnotationsURL:(id)a3
{
}

- (NSMutableDictionary)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (PKDExternalProviders)external
{
  return self->_external;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)initWithDatabase:(void *)a1 externalProviders:.cold.1(void *a1)
{
  OUTLINED_FUNCTION_2();
}

- (void)initWithDatabase:(void *)a1 externalProviders:.cold.2(void *a1)
{
  OUTLINED_FUNCTION_2();
}

- (void)setAnnotation:(void *)a1 forPlugIn:.cold.1(void *a1)
{
  OUTLINED_FUNCTION_2();
}

+ (void)confstrURL:(os_log_s *)a1 .cold.1(os_log_s *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( &dword_0,  a1,  OS_LOG_TYPE_ERROR,  "failed to obtain user directory: errno=%{darwin.errno}d",  (uint8_t *)v3,  8u);
}

- (void)containerURL
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_fault_impl( &dword_0,  a2,  OS_LOG_TYPE_FAULT,  "failed to get storage container: error=%llu",  (uint8_t *)&v3,  0xCu);
}

@end