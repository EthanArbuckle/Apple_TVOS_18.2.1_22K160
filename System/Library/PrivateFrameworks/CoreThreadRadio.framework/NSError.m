@interface NSError
+ (id)storeError:(int64_t)a3;
+ (id)storeError:(int64_t)a3 description:(id)a4;
+ (id)storeError:(int64_t)a3 underlyingError:(id)a4;
+ (id)storeError:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
@end

@implementation NSError

+ (id)storeError:(int64_t)a3
{
  return +[NSError storeError:underlyingError:description:]( &OBJC_CLASS___NSError,  "storeError:underlyingError:description:",  a3,  0LL,  0LL);
}

+ (id)storeError:(int64_t)a3 underlyingError:(id)a4
{
  return +[NSError storeError:underlyingError:description:]( &OBJC_CLASS___NSError,  "storeError:underlyingError:description:",  a3,  a4,  0LL);
}

+ (id)storeError:(int64_t)a3 description:(id)a4
{
  return +[NSError storeError:underlyingError:description:]( &OBJC_CLASS___NSError,  "storeError:underlyingError:description:",  a3,  0LL,  a4);
}

+ (id)storeError:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)a5;
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (v8)
    {
      if (v7)
      {
        v16[0] = NSUnderlyingErrorKey;
        v16[1] = NSLocalizedDescriptionKey;
        v17[0] = v7;
        v17[1] = v8;
        v10 = v17;
        v11 = (NSErrorUserInfoKey *)v16;
        uint64_t v12 = 2LL;
LABEL_9:
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v11,  v12));
        goto LABEL_10;
      }

      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      unint64_t v19 = v8;
      v10 = &v19;
      v11 = &v18;
    }

    else
    {
      NSErrorUserInfoKey v20 = NSUnderlyingErrorKey;
      unint64_t v21 = v7;
      v10 = &v21;
      v11 = &v20;
    }

    uint64_t v12 = 1LL;
    goto LABEL_9;
  }

  v13 = 0LL;
LABEL_10:
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ThreadCredentialsStore",  a3,  v13));

  return v14;
}

@end