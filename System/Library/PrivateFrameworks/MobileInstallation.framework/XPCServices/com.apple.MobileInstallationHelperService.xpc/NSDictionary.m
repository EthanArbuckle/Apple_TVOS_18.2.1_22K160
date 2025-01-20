@interface NSDictionary
+ (id)MI_dictionaryByMergingDictionaries:(id)a3;
+ (id)MI_dictionaryWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (BOOL)MI_writeToURL:(id)a3 format:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6;
@end

@implementation NSDictionary

+ (id)MI_dictionaryWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v16 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  a3,  2LL,  &v16));
  id v8 = v16;
  if (v7)
  {
    id v15 = 0LL;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v7,  a4,  0LL,  &v15));
    id v10 = v15;

    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v11 = v9;
    id v12 = 0LL;
    if ((objc_opt_isKindOfClass(v11) & 1) != 0) {
      id v12 = v11;
    }

    if (v12)
    {
      id v13 = v11;
      id v8 = v10;
      id v11 = v13;
      if (!a5) {
        goto LABEL_12;
      }
    }

    else
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  2048LL,  0LL));

      id v13 = 0LL;
      if (!a5) {
        goto LABEL_12;
      }
    }
  }

  else
  {
    id v13 = 0LL;
    id v11 = 0LL;
    if (!a5) {
      goto LABEL_12;
    }
  }

  if (!v13) {
    *a5 = v8;
  }
LABEL_12:

  return v13;
}

+ (id)MI_dictionaryByMergingDictionaries:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableDictionary addEntriesFromDictionary:]( v4,  "addEntriesFromDictionary:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9),  (void)v12);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  id v10 = -[NSMutableDictionary copy](v4, "copy");
  return v10;
}

- (BOOL)MI_writeToURL:(id)a3 format:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v18 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  self,  a4,  0LL,  &v18));
  id v12 = v18;
  __int128 v13 = v12;
  if (v11)
  {
    id v17 = v12;
    unsigned __int8 v14 = [v11 writeToURL:v10 options:a5 error:&v17];
    id v15 = v17;

    __int128 v13 = v15;
    if (!a6) {
      goto LABEL_7;
    }
  }

  else
  {
    unsigned __int8 v14 = 0;
    if (!a6) {
      goto LABEL_7;
    }
  }

  if ((v14 & 1) == 0) {
    *a6 = v13;
  }
LABEL_7:

  return v14;
}

- (BOOL)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v16 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  self,  a4,  0LL,  &v16));
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {
    id v15 = v10;
    unsigned __int8 v12 = objc_msgSend(v9, "MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:", v8, &v15);
    id v13 = v15;

    id v11 = v13;
    if (!a5) {
      goto LABEL_7;
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }

  if ((v12 & 1) == 0) {
    *a5 = v11;
  }
LABEL_7:

  return v12;
}

@end