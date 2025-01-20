@interface CSDSandboxExtensionDirectory
- (BOOL)removeLinksForFilenamesNotInArray:(id)a3 error:(id *)a4;
- (CSDSandboxExtensionDirectory)init;
- (CSDSandboxExtensionDirectory)initWithName:(id)a3 error:(id *)a4;
- (CSDSandboxExtensionDirectory)initWithName:(id)a3 fileManager:(id)a4 error:(id *)a5;
- (NSFileManager)fileManager;
- (NSString)name;
- (NSURL)URL;
- (id)createLinkIfNecessaryWithFilename:(id)a3 toURL:(id)a4 error:(id *)a5;
- (id)urlForFilename:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation CSDSandboxExtensionDirectory

- (CSDSandboxExtensionDirectory)initWithName:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CSDSandboxExtensionDirectory;
  v10 = -[CSDSandboxExtensionDirectory init](&v20, "init");
  if (v10)
  {
    p_isa = (id *)&v10->super.isa;
    p_fileManager = (id *)&v10->_fileManager;
    objc_storeStrong((id *)&v10->_fileManager, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue( [p_isa[2] URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:a5]);
    v14 = v13;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:@"CallServices" isDirectory:1]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 URLByAppendingPathComponent:v8 isDirectory:1]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByStandardizingPath]);

      if (v17
        && [*p_fileManager createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:a5])
      {
        objc_storeStrong(p_isa + 1, v17);
      }

      else
      {

        p_isa = 0LL;
      }

      v18 = (CSDSandboxExtensionDirectory *)p_isa;

      p_isa = (id *)v15;
    }

    else
    {
      v18 = 0LL;
    }
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

- (CSDSandboxExtensionDirectory)initWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = -[CSDSandboxExtensionDirectory initWithName:fileManager:error:]( self,  "initWithName:fileManager:error:",  v6,  v7,  a4);

  return v8;
}

- (CSDSandboxExtensionDirectory)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CSDSandboxExtensionDirectory.m",  56,  @"%s is not available. Use a designated initializer instead.",  "-[CSDSandboxExtensionDirectory init]");

  return 0LL;
}

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDSandboxExtensionDirectory URL](self, "URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastPathComponent]);

  return (NSString *)v3;
}

- (id)createLinkIfNecessaryWithFilename:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDSandboxExtensionDirectory urlForFilename:](self, "urlForFilename:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDSandboxExtensionDirectory fileManager](self, "fileManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
  unsigned int v12 = [v10 fileExistsAtPath:v11];

  if (!v12) {
    goto LABEL_8;
  }
  id v27 = 0LL;
  unsigned int v13 = [v8 getResourceValue:&v27 forKey:NSURLFileResourceIdentifierKey error:0];
  id v14 = v27;
  id v15 = 0LL;
  if (v13
    && (id v26 = 0LL,
        v16 = [v9 getResourceValue:&v26 forKey:NSURLFileResourceIdentifierKey error:0],  id v15 = v26,  v16))
  {
    unsigned __int8 v17 = [v14 isEqual:v15];

    if ((v17 & 1) != 0) {
      goto LABEL_14;
    }
  }

  else
  {
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDSandboxExtensionDirectory fileManager](self, "fileManager"));
  unsigned int v19 = [v18 removeItemAtURL:v9 error:a5];

  if (!v19)
  {
    unsigned int v21 = 0;
    if (!a5) {
      goto LABEL_13;
    }
  }

  else
  {
LABEL_8:
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDSandboxExtensionDirectory fileManager](self, "fileManager"));
    unsigned int v21 = [v20 copyItemAtURL:v8 toURL:v9 error:a5];

    if (!a5) {
      goto LABEL_13;
    }
  }

  if ((v21 & 1) == 0 && !*a5)
  {
    v23 =  -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
    v22 = 0LL;
    *a5 = v23;
    goto LABEL_17;
  }

- (BOOL)removeLinksForFilenamesNotInArray:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDSandboxExtensionDirectory urlForFilename:](self, "urlForFilename:", v12));
        if (v13)
        {
          [v6 addObject:v13];
        }

        else
        {
          id v14 = sub_1001704C4();
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unable to get URL for filename '%@'",  buf,  0xCu);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }

    while (v9);
  }

  v40 = v7;

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDSandboxExtensionDirectory fileManager](self, "fileManager"));
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDSandboxExtensionDirectory URL](self, "URL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( [v16 contentsOfDirectoryAtURL:v17 includingPropertiesForKeys:&__NSArray0__struct options:0 error:a4]);

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v18 count]));
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v20 = v18;
  id v21 = [v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v47;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
        id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "URLByStandardizingPath", v40));
        if (v26)
        {
          [v19 addObject:v26];
        }

        else
        {
          id v27 = sub_1001704C4();
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unable to get standardized URL for URL '%@'",  buf,  0xCu);
          }
        }
      }

      id v22 = [v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }

    while (v22);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v19));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  [v29 minusSet:v30];

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v31 = v29;
  id v32 = [v31 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v43;
LABEL_27:
    uint64_t v35 = 0LL;
    while (1)
    {
      if (*(void *)v43 != v34) {
        objc_enumerationMutation(v31);
      }
      uint64_t v36 = *(void *)(*((void *)&v42 + 1) + 8 * v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDSandboxExtensionDirectory fileManager](self, "fileManager", v40));
      unsigned int v38 = [v37 removeItemAtURL:v36 error:a4];

      if (!v38) {
        break;
      }
      if (v33 == (id)++v35)
      {
        id v33 = [v31 countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (v33) {
          goto LABEL_27;
        }
        goto LABEL_33;
      }
    }
  }

  else
  {
LABEL_33:
    LOBYTE(v38) = 1;
  }

  return v38;
}

- (id)urlForFilename:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDSandboxExtensionDirectory URL](self, "URL"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByStandardizingPath]);
  return v7;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end