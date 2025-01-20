@interface DiskImageGraphNodeNative
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)deleteImage;
- (DiskImageGraphNodeNative)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (DiskImageGraphNodeNative)initWithURL:(id)a3 tag:(id)a4 UUID:(id)a5 parentNode:(id)a6 metadata:(id)a7 isCache:(BOOL)a8;
- (NSURL)filePath;
- (id)URL;
- (id)toDIShadowNode;
- (id)toDictionary;
- (void)setFilePath:(id)a3;
@end

@implementation DiskImageGraphNodeNative

- (id)toDIShadowNode
{
  v3 = objc_alloc(&OBJC_CLASS___DIShadowNode);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
  v5 = -[DIShadowNode initWithURL:isCache:]( v3,  "initWithURL:isCache:",  v4,  -[DiskImageGraphNode isCache](self, "isCache"));

  return v5;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3));
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DiskImageGraphNodeNative;
  if (objc_msgSendSuper2(&v11, "validateWithDictionary:error:", v6, a4))
  {
    BOOL v8 = 0;
    if (objc_msgSend( v6,  "validateAndPopObjectForKey:className:isOptional:error:",  @"FilePath",  objc_opt_class(NSString, v7),  0,  a4))
    {
      if ([v6 count])
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Validation failed, input contains unexpected data."));
        BOOL v8 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v9,  a4);
      }

      else
      {
        BOOL v8 = 1;
      }
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (DiskImageGraphNodeNative)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (+[DiskImageGraphNodeNative validateWithDictionary:error:]( &OBJC_CLASS___DiskImageGraphNodeNative,  "validateWithDictionary:error:",  v10,  a6))
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___DiskImageGraphNodeNative;
    self = -[DiskImageGraphNode initWithDictionary:updateChangesToDict:workDir:error:]( &v19,  "initWithDictionary:updateChangesToDict:workDir:error:",  v10,  v8,  v11,  a6);
    if (!self) {
      goto LABEL_4;
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"FilePath"]);
    v13 = (NSURL *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:relativeToURL:",  v12,  v11));
    filePath = self->_filePath;
    self->_filePath = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
    LOBYTE(v12) = [v15 checkResourceIsReachableAndReturnError:a6];

    if ((v12 & 1) == 0)
    {
      v16 = (DiskImageGraphNodeNative *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  2LL,  @"Image referenced in the pstack is unreachable.",  a6));
    }

    else
    {
LABEL_4:
      v16 = self;
      self = v16;
    }

    v17 = v16;
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

- (DiskImageGraphNodeNative)initWithURL:(id)a3 tag:(id)a4 UUID:(id)a5 parentNode:(id)a6 metadata:(id)a7 isCache:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DiskImageGraphNodeNative;
  v16 = -[DiskImageGraphNode initWithTag:UUID:parentNode:metadata:isCache:]( &v19,  "initWithTag:UUID:parentNode:metadata:isCache:",  a4,  a5,  a6,  a7,  v8);
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_filePath, a3);
  }

  return v17;
}

- (void)setFilePath:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_filePath, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 relativeString]);
    [v6 setObject:v7 forKey:@"FilePath"];
  }
}

- (BOOL)deleteImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
  id v20 = 0LL;
  unsigned __int8 v5 = [v3 removeItemAtURL:v4 error:&v20];
  id v6 = v20;

  if ((v5 & 1) == 0)
  {
    int v7 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v19 = 0LL;
      uint64_t v8 = sub_1000B85DC();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        uint64_t v10 = 3LL;
      }
      else {
        uint64_t v10 = 2LL;
      }
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
      *(_DWORD *)buf = 68158466;
      int v22 = 39;
      __int16 v23 = 2080;
      v24 = "-[DiskImageGraphNodeNative deleteImage]";
      __int16 v25 = 2112;
      v26 = v11;
      __int16 v27 = 2112;
      v28 = v12;
      v13 = (char *)_os_log_send_and_compose_impl( v10,  &v19,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "%.*s: Failed to delete %@: %@",  buf,  38);

      if (v13)
      {
        fprintf(__stderrp, "%s\n", v13);
        free(v13);
      }
    }

    else
    {
      uint64_t v14 = sub_1000B85DC();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
        *(_DWORD *)buf = 68158466;
        int v22 = 39;
        __int16 v23 = 2080;
        v24 = "-[DiskImageGraphNodeNative deleteImage]";
        __int16 v25 = 2112;
        v26 = v16;
        __int16 v27 = 2112;
        v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%.*s: Failed to delete %@: %@", buf, 0x26u);
      }
    }

    *__error() = v7;
  }

  return v5;
}

- (id)toDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DiskImageGraphNodeNative;
  id v3 = -[DiskImageGraphNode toDictionary](&v9, "toDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNodeNative filePath](self, "filePath"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 relativePath]);
  [v5 setObject:v7 forKeyedSubscript:@"FilePath"];

  return v5;
}

- (id)URL
{
  return self->_filePath;
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
}

@end