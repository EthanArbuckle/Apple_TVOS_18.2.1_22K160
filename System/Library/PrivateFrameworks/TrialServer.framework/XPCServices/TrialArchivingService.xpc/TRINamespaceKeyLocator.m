@interface TRINamespaceKeyLocator
+ (id)_fileNameForNamespaceIdentifier:(id)a3 asymmetric:(BOOL)a4;
+ (id)_keyFileSearchLocationsForNamespace:(id)a3 asymmetric:(BOOL)a4;
+ (id)_namespaceIdForNamespace:(id)a3;
+ (id)keyDataForNamespace:(id)a3 asymmetric:(BOOL)a4;
+ (id)keyFileURLForNamespace:(id)a3 asymmetric:(BOOL)a4;
@end

@implementation TRINamespaceKeyLocator

+ (id)keyDataForNamespace:(id)a3 asymmetric:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 keyFileURLForNamespace:v6 asymmetric:v4]);
  if (v7)
  {
    id v16 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v7,  2LL,  &v16));
    v9 = (os_log_s *)v16;
    if (v8)
    {
      id v10 = v8;
    }

    else
    {
      id v12 = TRILogCategory_Archiving();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
        *(_DWORD *)buf = 138412546;
        id v18 = v15;
        __int16 v19 = 2112;
        v20 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to read key data from file %@ -- %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    id v11 = TRILogCategory_Archiving();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Couldn't find key for namespace %@",  buf,  0xCu);
    }

    v8 = 0LL;
  }

  return v8;
}

+ (id)keyFileURLForNamespace:(id)a3 asymmetric:(BOOL)a4
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _keyFileSearchLocationsForNamespace:a3 asymmetric:a4]);
  id v5 = TRILogCategory_Archiving();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Searching for namespace key in the following locations: %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = v4;
  v8 = (NSURL *)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v8; i = (NSURL *)((char *)i + 1))
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (!access((const char *)objc_msgSend(v11, "fileSystemRepresentation", (void)v13), 4))
        {
          v8 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v11);
          goto LABEL_13;
        }
      }

      v8 = (NSURL *)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

+ (id)_keyFileSearchLocationsForNamespace:(id)a3 asymmetric:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TRIStandardPaths sharedSystemPaths](&OBJC_CLASS___TRIStandardPaths, "sharedSystemPaths"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 decryptionKeyDirForAppleInternal:1]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TRIStandardPaths sharedSystemPaths](&OBJC_CLASS___TRIStandardPaths, "sharedSystemPaths"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 decryptionKeyDirForAppleInternal:0]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _fileNameForNamespaceIdentifier:v6 asymmetric:v4]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _namespaceIdForNamespace:v6]);

  if (v12)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _fileNameForNamespaceIdentifier:v13 asymmetric:v4]);

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v11]);
    v22[0] = v15;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v14]);
    v22[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v11]);
    v22[2] = v17;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v14]);
    v22[3] = v18;
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 4LL));
  }

  else
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v11]);
    v21[0] = v14;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v11]);
    v21[1] = v15;
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
  }

  return v19;
}

+ (id)_fileNameForNamespaceIdentifier:(id)a3 asymmetric:(BOOL)a4
{
  BOOL v4 = @"com.apple.trial.%@.namespacekey";
  if (a4) {
    BOOL v4 = @"com.apple.trial.%@.namespacekey.priv";
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v4,  a3));
}

+ (id)_namespaceIdForNamespace:(id)a3
{
  id v3 = a3;
  unsigned int v11 = -1;
  uint64_t v4 = TRINamespace_NamespaceId_EnumDescriptor();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = [v5 getValue:&v11 forEnumTextFormatName:v3];

  if ((v6 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
  }

  else
  {
    id v8 = TRILogCategory_Archiving();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Unable to find namespace id for namespace name: %@",  buf,  0xCu);
    }

    id v7 = 0LL;
  }

  return v7;
}

@end