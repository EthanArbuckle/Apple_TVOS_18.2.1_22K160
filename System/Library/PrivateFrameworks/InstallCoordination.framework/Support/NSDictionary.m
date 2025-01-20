@interface NSDictionary
+ (id)IX_dictionaryWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)IX_writeToURL:(id)a3 format:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6;
@end

@implementation NSDictionary

+ (id)IX_dictionaryWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v15 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  a3,  2LL,  &v15));
  id v8 = v15;
  if (v7)
  {
    id v14 = 0LL;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v7,  a4,  0LL,  &v14));
    id v10 = v14;

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      id v12 = v9;
      id v8 = v10;
      v9 = v12;
      if (!a5) {
        goto LABEL_10;
      }
    }

    else
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  2048LL,  0LL));

      id v12 = 0LL;
      if (!a5) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    id v12 = 0LL;
    v9 = 0LL;
    if (!a5) {
      goto LABEL_10;
    }
  }

  if (!v12) {
    *a5 = v8;
  }
LABEL_10:

  return v12;
}

- (BOOL)IX_writeToURL:(id)a3 format:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v18 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  self,  a4,  0LL,  &v18));
  id v12 = v18;
  v13 = v12;
  if (v11)
  {
    id v17 = v12;
    unsigned __int8 v14 = [v11 writeToURL:v10 options:a5 error:&v17];
    id v15 = v17;

    v13 = v15;
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

@end