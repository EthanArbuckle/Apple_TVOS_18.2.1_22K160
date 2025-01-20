@interface SHLError
+ (BOOL)canRetryForError:(id)a3;
+ (BOOL)canRetryForPartialError:(id)a3;
+ (double)retrySecondsForError:(id)a3;
+ (id)errorCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithUnderlyingError:(id)a3;
+ (id)localizedDescriptionForSyncError:(int64_t)a3;
+ (id)localizedFailureReasonForSyncError:(int64_t)a3;
+ (id)localizedRecoverySuggestionForSyncError:(int64_t)a3;
+ (id)userInfoForErrorCode:(int64_t)a3 withUnderlyingError:(id)a4;
+ (int64_t)errorCodeForError:(id)a3;
@end

@implementation SHLError

+ (id)errorWithCode:(int64_t)a3
{
  return +[SHLError errorCode:underlyingError:](&OBJC_CLASS___SHLError, "errorCode:underlyingError:", a3, 0LL);
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  return +[SHLError errorCode:underlyingError:](&OBJC_CLASS___SHLError, "errorCode:underlyingError:", a3, a4);
}

+ (id)errorWithUnderlyingError:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SHLError errorCode:underlyingError:]( SHLError,  "errorCode:underlyingError:",  [a1 errorCodeForError:v4],  v4));

  return v5;
}

+ (double)retrySecondsForError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  unsigned int v5 = [v4 isEqualToString:CKErrorDomain];

  double v6 = 0.0;
  if (v5)
  {
    if ([v3 code] == (id)2)
    {
      uint64_t v14 = 0LL;
      v15 = (double *)&v14;
      uint64_t v16 = 0x2020000000LL;
      uint64_t v17 = 0LL;
      v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100021C50;
      v13[3] = &unk_10006D5F0;
      v13[4] = &v14;
      [v8 enumerateKeysAndObjectsUsingBlock:v13];
      double v6 = v15[3];

      _Block_object_dispose(&v14, 8);
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:CKErrorRetryAfterKey]);
      [v10 doubleValue];
      double v6 = v11;
    }
  }

  return v6;
}

+ (BOOL)canRetryForError:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  unsigned int v6 = [v5 isEqualToString:CKErrorDomain];

  if (!v6)
  {
    unsigned __int8 v8 = 0;
    goto LABEL_7;
  }

  unint64_t v7 = (unint64_t)[v4 code];
  unsigned __int8 v8 = 1;
  if (v7 > 0x24) {
    goto LABEL_8;
  }
  if (((1LL << v7) & 0x1008B000D8LL) == 0)
  {
    if (v7 == 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);
      unsigned __int8 v8 = [a1 canRetryForPartialError:v10];

      goto LABEL_7;
    }

+ (BOOL)canRetryForPartialError:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  unsigned __int8 v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100021E98;
  v6[3] = &unk_10006D618;
  v6[4] = &v7;
  v6[5] = a1;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  LOBYTE(a1) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)a1;
}

+ (id)errorCode:(int64_t)a3 underlyingError:(id)a4
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([a1 userInfoForErrorCode:a3 withUnderlyingError:a4]);
  unsigned int v6 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.shazam.library",  a3,  v5);

  return v6;
}

+ (id)userInfoForErrorCode:(int64_t)a3 withUnderlyingError:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v7 setValue:v6 forKey:NSUnderlyingErrorKey];

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescriptionForSyncError:a3]);
  [v7 setObject:v8 forKey:NSLocalizedDescriptionKey];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedFailureReasonForSyncError:a3]);
  [v7 setObject:v9 forKey:NSLocalizedFailureReasonErrorKey];

  char v10 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedRecoverySuggestionForSyncError:a3]);
  [v7 setObject:v10 forKey:NSLocalizedRecoverySuggestionErrorKey];

  id v11 = [v7 copy];
  return v11;
}

+ (int64_t)errorCodeForError:(id)a3
{
  uint64_t v3 = (uint64_t)[a3 code];
  if (v3 > 24)
  {
    if (v3 <= 27)
    {
      if (v3 == 25) {
        return 6LL;
      }
      if (v3 == 26) {
        return 7LL;
      }
    }

    else
    {
      switch(v3)
      {
        case 28LL:
          return 8LL;
        case 110LL:
          return 2LL;
        case 112LL:
          return 3LL;
      }
    }

    return 5LL;
  }

  uint64_t v4 = v3 - 1;
  int64_t result = 0LL;
  switch(v4)
  {
    case 2LL:
    case 3LL:
      int64_t result = 4LL;
      break;
    case 8LL:
      return result;
    default:
      return 5LL;
  }

  return result;
}

+ (id)localizedDescriptionForSyncError:(int64_t)a3
{
  else {
    return off_10006D638[a3 - 1];
  }
}

+ (id)localizedFailureReasonForSyncError:(int64_t)a3
{
  else {
    return off_10006D678[a3 - 1];
  }
}

+ (id)localizedRecoverySuggestionForSyncError:(int64_t)a3
{
  else {
    return off_10006D6B8[a3 - 1];
  }
}

@end