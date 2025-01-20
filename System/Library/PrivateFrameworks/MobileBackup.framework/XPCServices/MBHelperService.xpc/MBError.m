@interface MBError
+ (BOOL)isCancelledError:(id)a3;
+ (BOOL)isCancelledXPCActivityDeferredError:(id)a3;
+ (BOOL)isError:(id)a3 withCode:(int64_t)a4;
+ (BOOL)isError:(id)a3 withCodes:(int64_t)a4;
+ (BOOL)isNSError:(id)a3 withCode:(int64_t)a4;
+ (BOOL)isRetryAfterError:(id)a3 retryAfterDate:(id *)a4;
+ (BOOL)isTransientError:(id)a3;
+ (BOOL)isUnexpectedErrorCode:(int64_t)a3;
+ (id)_errorWithCode:(int64_t)a3 URL:(id)a4 format:(id)a5;
+ (id)_errorWithErrno:(int)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6 arguments:(char *)a7;
+ (id)_formatErrors:(id)a3 descriptionSelector:(SEL)a4;
+ (id)descriptionForError:(id)a3;
+ (id)descriptionForError:(id)a3 paths:(BOOL)a4;
+ (id)dictionaryRepresentationForError:(id)a3;
+ (id)dictionaryRepresentationForError:(id)a3 withMultiErrors:(BOOL)a4;
+ (id)errorForHTTPURLResponse:(id)a3 error:(id)a4;
+ (id)errorForNSError:(id)a3 path:(id)a4 description:(id)a5;
+ (id)errorForNSError:(id)a3 path:(id)a4 format:(id)a5;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 error:(id)a4 URL:(id)a5 format:(id)a6;
+ (id)errorWithCode:(int64_t)a3 error:(id)a4 format:(id)a5;
+ (id)errorWithCode:(int64_t)a3 error:(id)a4 path:(id)a5 format:(id)a6;
+ (id)errorWithCode:(int64_t)a3 format:(id)a4;
+ (id)errorWithCode:(int64_t)a3 path:(id)a4 description:(id)a5;
+ (id)errorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5;
+ (id)errorWithDictionaryRepresentation:(id)a3;
+ (id)errorWithDictionaryRepresentation:(id)a3 withMultiErrors:(BOOL)a4;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6;
+ (id)errorWithErrno:(int)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6;
+ (id)errorWithErrno:(int)a3 format:(id)a4;
+ (id)errorWithErrno:(int)a3 path:(id)a4 format:(id)a5;
+ (id)errorWithErrors:(id)a3;
+ (id)loggableDescriptionForError:(id)a3;
+ (id)posixErrorWithCode:(int64_t)a3 format:(id)a4;
+ (id)posixErrorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5;
+ (id)posixErrorWithFormat:(id)a3;
+ (id)posixErrorWithPath:(id)a3 format:(id)a4;
+ (id)signatureForError:(id)a3;
+ (int)codeForErrno:(int)a3;
+ (int)codeForNSError:(id)a3;
+ (int)errnoForError:(id)a3;
@end

@implementation MBError

+ (BOOL)isUnexpectedErrorCode:(int64_t)a3
{
  if (a3) {
    BOOL v3 = a3 == 207;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (BOOL)isTransientError:(id)a3
{
  unsigned int v4 = objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain");
  if (v4) {
    LOBYTE(v4) = MBIsTransientErrorCode((uint64_t)[a3 code]);
  }
  return v4;
}

+ (BOOL)isCancelledError:(id)a3
{
  if (a3)
  {
    LODWORD(v4) = objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain");
    if ((_DWORD)v4)
    {
      unsigned int v4 = (char *)[a3 code];
      else {
        LOBYTE(v4) = 0;
      }
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

+ (BOOL)isCancelledXPCActivityDeferredError:(id)a3
{
  id v3 = a3;
  return [a1 isError:v3 withCode:223];
}

+ (int)codeForErrno:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 <= 15)
  {
    switch(a3)
    {
      case 1:
        return 24;
      case 2:
        return 4;
      case 9:
        return 1;
      default:
LABEL_11:
        v5 = (os_log_s *)MBGetDefaultLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v13 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "No code for POSIX error: %{errno}d",  buf,  8u);
          _MBLog(@"DEFAULT", (uint64_t)"No code for POSIX error: %{errno}d", v6, v7, v8, v9, v10, v11, v3);
        }

        return 100;
    }
  }

  else
  {
    switch(a3)
    {
      case 16:
        return 14;
      case 17:
        return 3;
      case 18:
        return 26;
      case 19:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
        goto LABEL_11;
      case 20:
        return 5;
      case 21:
        return 6;
      case 28:
        return 105;
      default:
        if (a3 == 62)
        {
          int result = 7;
        }

        else
        {
          if (a3 != 93) {
            goto LABEL_11;
          }
          int result = 8;
        }

        break;
    }
  }

  return result;
}

+ (int)errnoForError:(id)a3
{
  if (!objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain"))
  {
LABEL_8:
    uint64_t v7 = (os_log_s *)MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No POSIX code for error: %@", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"No POSIX code for error: %@", v8, v9, v10, v11, v12, v13, (uint64_t)a3);
    }

    return 5;
  }

  uint64_t v4 = (uint64_t)[a3 code];
  if (v4 > 25)
  {
    switch(v4)
    {
      case 26LL:
        return 18;
      case 105LL:
        return 28;
      case 100LL:
        return 5;
    }

    goto LABEL_8;
  }

  uint64_t v5 = v4 - 3;
  int result = 2;
  switch(v5)
  {
    case 0LL:
      int result = 17;
      break;
    case 1LL:
      return result;
    case 2LL:
      int result = 20;
      break;
    case 3LL:
      int result = 21;
      break;
    case 4LL:
      int result = 62;
      break;
    case 5LL:
      int result = 93;
      break;
    case 6LL:
      return 5;
    case 11LL:
      int result = 16;
      break;
    default:
      goto LABEL_8;
  }

  return result;
}

+ (int)codeForNSError:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", NSCocoaErrorDomain))
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
    if (v5) {
      return +[MBError codeForNSError:](&OBJC_CLASS___MBError, "codeForNSError:", v5);
    }
    return 100;
  }

  if (!objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", NSURLErrorDomain))
  {
    return 100;
  }

  if ([a3 code] == (id)-999) {
    return 202;
  }
  else {
    return 300;
  }
}

+ (BOOL)isError:(id)a3 withCode:(int64_t)a4
{
  if ([a3 code] == (id)a4) {
    return objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain");
  }
  else {
    return 0;
  }
}

+ (BOOL)isError:(id)a3 withCodes:(int64_t)a4
{
  unsigned int v6 = objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain");
  if (v6)
  {
    if ([a3 code] == (id)a4)
    {
LABEL_6:
      LOBYTE(v6) = 1;
    }

    else
    {
      uint64_t v10 = (void **)&v11;
      while (1)
      {
        uint64_t v7 = v10++;
        if (!*v7) {
          break;
        }
        id v8 = *v7;
        if ([a3 code] == v8) {
          goto LABEL_6;
        }
      }

      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

+ (BOOL)isNSError:(id)a3 withCode:(int64_t)a4
{
  return +[MBError codeForNSError:](&OBJC_CLASS___MBError, "codeForNSError:", a3) == a4;
}

+ (BOOL)isRetryAfterError:(id)a3 retryAfterDate:(id *)a4
{
  id v5 = a3;
  if (!+[MBError isError:withCodes:](&OBJC_CLASS___MBError, "isError:withCodes:", a3, 304LL, 17LL, 0LL)) {
    return 0;
  }
  while (1)
  {
    id v6 = objc_msgSend(objc_msgSend(v5, "userInfo"), "objectForKeyedSubscript:", @"RetryAfter");
    if (v6) {
      break;
    }
    id v5 = objc_msgSend(objc_msgSend(v5, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
    if (!v5) {
      return 0;
    }
  }

  id v8 = v6;
  uint64_t v9 = (NSDate *)[(id)MBHTTPDateFormatter() dateFromString:v6];
  if (v9)
  {
    if (!a4) {
      return v9 != 0;
    }
  }

  else
  {
    uint64_t v10 = (uint64_t)[v8 integerValue];
    if (v10 < 1) {
      return 0;
    }
    uint64_t v9 = +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", (double)v10);
    if (!a4) {
      return v9 != 0;
    }
  }

  if (!v9) {
    return v9 != 0;
  }
  *a4 = v9;
  return 1;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return +[MBError errorWithCode:format:](&OBJC_CLASS___MBError, "errorWithCode:format:", a3, @"%@", a4);
}

+ (id)errorWithCode:(int64_t)a3 path:(id)a4 description:(id)a5
{
  return +[MBError errorWithCode:path:format:]( &OBJC_CLASS___MBError,  "errorWithCode:path:format:",  a3,  a4,  @"%@",  a5);
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  uint64_t v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", a4, &v8);
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  a3,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 format:(id)a5
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  a3,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",   -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a5,  &v6),  NSLocalizedDescriptionKey,  a4,  NSUnderlyingErrorKey,  0LL));
}

+ (id)errorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  a3,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",   -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a5,  &v6),  NSLocalizedDescriptionKey,  a4,  NSFilePathErrorKey,  0LL));
}

+ (id)_errorWithCode:(int64_t)a3 URL:(id)a4 format:(id)a5
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  a3,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",   -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a5,  &v6),  NSLocalizedDescriptionKey,  a4,  NSURLErrorKey,  0LL));
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 path:(id)a5 format:(id)a6
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  a3,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",   -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a6,  &v7),  NSLocalizedDescriptionKey,  a4,  NSUnderlyingErrorKey,  a5,  NSFilePathErrorKey,  0LL));
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 URL:(id)a5 format:(id)a6
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  a3,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",   -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a6,  &v7),  NSLocalizedDescriptionKey,  a4,  NSUnderlyingErrorKey,  a5,  NSURLErrorKey,  0LL));
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5
{
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  uint64_t v9 =  -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a5,  &v10);
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  a3,  a4,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  a3,  a4,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",   -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a6,  &v7),  NSLocalizedDescriptionKey,  a5,  NSFilePathErrorKey,  0LL));
}

+ (id)errorWithErrors:(id)a3
{
  if ([a3 count] == (id)1) {
    return [a3 objectAtIndexedSubscript:0];
  }
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (+[MBError isError:withCode:](&OBJC_CLASS___MBError, "isError:withCode:", v10, 2LL)
          && (id v11 = objc_msgSend( objc_msgSend(v10, "userInfo"),  "objectForKeyedSubscript:",  @"kMBUnderlyingErrorsKey")) != 0)
        {
          [v5 addObjectsFromArray:v11];
        }

        else
        {
          [v5 addObject:v10];
        }
      }

      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }

    while (v7);
  }

  v16 = @"kMBUnderlyingErrorsKey";
  id v17 = [v5 copy];
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  2LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
}

+ (id)_errorWithErrno:(int)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6 arguments:(char *)a7
{
  uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %s (%d)",   -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a6,  a7),  strerror(a3),  *(void *)&a3);
  if (a5)
  {
    v16[0] = NSLocalizedDescriptionKey;
    v16[1] = NSFilePathErrorKey;
    v17[0] = v9;
    v17[1] = a5;
    uint64_t v10 = (NSString **)v17;
    id v11 = (NSErrorUserInfoKey *)v16;
    uint64_t v12 = 2LL;
  }

  else
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    __int128 v15 = v9;
    uint64_t v10 = &v15;
    id v11 = &v14;
    uint64_t v12 = 1LL;
  }

  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  a4,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v11,  v12));
}

+ (id)errorWithErrno:(int)a3 format:(id)a4
{
  return objc_msgSend( a1,  "_errorWithErrno:code:path:format:arguments:",  *(void *)&a3,  +[MBError codeForErrno:](MBError, "codeForErrno:"),  0,  a4,  &v5);
}

+ (id)errorWithErrno:(int)a3 path:(id)a4 format:(id)a5
{
  return objc_msgSend( a1,  "_errorWithErrno:code:path:format:arguments:",  *(void *)&a3,  +[MBError codeForErrno:](MBError, "codeForErrno:"),  a4,  a5,  &v6);
}

+ (id)errorWithErrno:(int)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6
{
  return [a1 _errorWithErrno:*(void *)&a3 code:a4 path:a5 format:a6 arguments:&v7];
}

+ (id)posixErrorWithFormat:(id)a3
{
  uint64_t v5 = *__error();
  return objc_msgSend( a1,  "_errorWithErrno:code:path:format:arguments:",  v5,  +[MBError codeForErrno:](MBError, "codeForErrno:", v5),  0,  a3,  &v7);
}

+ (id)posixErrorWithPath:(id)a3 format:(id)a4
{
  uint64_t v7 = *__error();
  return objc_msgSend( a1,  "_errorWithErrno:code:path:format:arguments:",  v7,  +[MBError codeForErrno:](MBError, "codeForErrno:", v7),  a3,  a4,  &v9);
}

+ (id)posixErrorWithCode:(int64_t)a3 format:(id)a4
{
  return [a1 _errorWithErrno:*__error() code:a3 path:0 format:a4 arguments:&v5];
}

+ (id)posixErrorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5
{
  return [a1 _errorWithErrno:*__error() code:a3 path:a4 format:a5 arguments:&v6];
}

+ (id)errorForNSError:(id)a3 path:(id)a4 format:(id)a5
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  +[MBError codeForNSError:](&OBJC_CLASS___MBError, "codeForNSError:", a3),  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",   -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a5,  &v6),  NSLocalizedDescriptionKey,  a3,  NSUnderlyingErrorKey,  a4,  NSFilePathErrorKey,  0LL));
}

+ (id)errorForNSError:(id)a3 path:(id)a4 description:(id)a5
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  +[MBError codeForNSError:](&OBJC_CLASS___MBError, "codeForNSError:", a3),  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a5,  NSLocalizedDescriptionKey,  a3,  NSUnderlyingErrorKey,  a4,  NSFilePathErrorKey,  0LL));
}

+ (id)errorForHTTPURLResponse:(id)a3 error:(id)a4
{
  if (!a3) {
    return +[MBError errorWithCode:error:format:]( &OBJC_CLASS___MBError,  "errorWithCode:error:format:",  +[MBError codeForNSError:](&OBJC_CLASS___MBError, "codeForNSError:", a4),  a4,  @"HTTP connection error");
  }
  if ((uint64_t)[a3 statusCode] >= 300 && (uint64_t)objc_msgSend(a3, "statusCode") <= 399)
  {
    id v6 = [a3 statusCode];
    id v7 = [a3 URL];
    if (v6 == (id)330)
    {
      uint64_t v8 = @"Account Moved";
      uint64_t v9 = 307LL;
      id v10 = v7;
      return +[MBError _errorWithCode:URL:format:](&OBJC_CLASS___MBError, "_errorWithCode:URL:format:", v9, v10, v8);
    }

    goto LABEL_23;
  }

  if ((uint64_t)[a3 statusCode] < 400 || (uint64_t)objc_msgSend(a3, "statusCode") > 499)
  {
    if ((uint64_t)[a3 statusCode] >= 500 && (uint64_t)objc_msgSend(a3, "statusCode") <= 599)
    {
      id v12 = [a3 statusCode];
      if (v12 == (id)507)
      {
        id v10 = [a3 URL];
        uint64_t v8 = @"Insufficient Storage";
        uint64_t v9 = 303LL;
        return +[MBError _errorWithCode:URL:format:](&OBJC_CLASS___MBError, "_errorWithCode:URL:format:", v9, v10, v8);
      }

      if (v12 == (id)503) {
        return +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"MBErrorDomain",  304,  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"Service Unavailable",  NSLocalizedDescriptionKey,  [a3 URL],  NSURLErrorKey,  objc_msgSend(objc_msgSend(a3, "allHeaderFields"), "objectForKey:", @"Retry-After"),  @"RetryAfter",  0));
      }
      id v7 = [a3 URL];
      id v14 = [a3 statusCode];
      __int128 v15 = +[NSHTTPURLResponse localizedStringForStatusCode:]( NSHTTPURLResponse,  "localizedStringForStatusCode:",  [a3 statusCode]);
      __int128 v13 = @"Server error: %ld %@";
      return +[MBError _errorWithCode:URL:format:]( &OBJC_CLASS___MBError,  "_errorWithCode:URL:format:",  302LL,  v7,  v13,  v14,  v15);
    }

    id v7 = [a3 URL];
LABEL_23:
    id v14 = [a3 statusCode];
    __int128 v13 = @"Unexpected HTTP status code: %ld";
    return +[MBError _errorWithCode:URL:format:]( &OBJC_CLASS___MBError,  "_errorWithCode:URL:format:",  302LL,  v7,  v13,  v14,  v15);
  }

  uint64_t v11 = (uint64_t)[a3 statusCode];
  if (v11 <= 408)
  {
    if (v11 == 401)
    {
      id v10 = [a3 URL];
      uint64_t v8 = @"Unauthorized";
      uint64_t v9 = 305LL;
      return +[MBError _errorWithCode:URL:format:](&OBJC_CLASS___MBError, "_errorWithCode:URL:format:", v9, v10, v8);
    }

    if (v11 == 404)
    {
      id v10 = [a3 URL];
      uint64_t v8 = @"Not Found";
      uint64_t v9 = 4LL;
      return +[MBError _errorWithCode:URL:format:](&OBJC_CLASS___MBError, "_errorWithCode:URL:format:", v9, v10, v8);
    }
  }

  else
  {
    switch(v11)
    {
      case 409LL:
        id v10 = [a3 URL];
        uint64_t v8 = @"Conflict";
        uint64_t v9 = 3LL;
        return +[MBError _errorWithCode:URL:format:](&OBJC_CLASS___MBError, "_errorWithCode:URL:format:", v9, v10, v8);
      case 423LL:
        id v10 = [a3 URL];
        uint64_t v8 = @"Locked";
        uint64_t v9 = 13LL;
        return +[MBError _errorWithCode:URL:format:](&OBJC_CLASS___MBError, "_errorWithCode:URL:format:", v9, v10, v8);
      case 424LL:
        id v10 = [a3 URL];
        uint64_t v8 = @"Failed Dependency";
        uint64_t v9 = 306LL;
        return +[MBError _errorWithCode:URL:format:](&OBJC_CLASS___MBError, "_errorWithCode:URL:format:", v9, v10, v8);
    }
  }

  return +[MBError _errorWithCode:URL:format:]( MBError,  "_errorWithCode:URL:format:",  301,  [a3 URL],  @"Client error: %ld %@",  objc_msgSend(a3, "statusCode"),  +[NSHTTPURLResponse localizedStringForStatusCode:]( NSHTTPURLResponse,  "localizedStringForStatusCode:",  objc_msgSend(a3, "statusCode")));
}

+ (id)signatureForError:(id)a3
{
  id v4 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  if (a3)
  {
    do
    {
      [v4 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"/%@:%ld", objc_msgSend(a3, "domain"), objc_msgSend(a3, "code"))];
      id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
      id v6 = [a3 userInfo];
      if (v5)
      {
        id v7 = [v6 objectForKeyedSubscript:NSUnderlyingErrorKey];
      }

      else
      {
        if (![v6 objectForKeyedSubscript:@"kMBUnderlyingErrorsKey"]) {
          return [v4 copy];
        }
        id v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"kMBUnderlyingErrorsKey"),  "firstObject");
      }

      a3 = v7;
    }

    while (v7);
  }

  return [v4 copy];
}

+ (id)_formatErrors:(id)a3 descriptionSelector:(SEL)a4
{
  if (!a3) {
    return 0LL;
  }
  id v7 = [a3 count];
  id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  else {
    uint64_t v9 = (uint64_t)v7;
  }
  if (v9)
  {
    for (uint64_t i = 0LL; i != v9; ++i)
      objc_msgSend( v8,  "addObject:",  objc_msgSend(a1, "performSelector:withObject:", a4, objc_msgSend(a3, "objectAtIndexedSubscript:", i)));
  }

  return MBStringWithArray(v8);
}

+ (id)loggableDescriptionForError:(id)a3
{
  if (!a3) {
    return @"(null)";
  }
  id v5 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v5 appendFormat:@"%@(%ld)", objc_msgSend(a3, "domain"), objc_msgSend(a3, "code")];
  id v6 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  if (v6) {
    [v5 appendFormat:@" Underlying error: %@", +[MBError loggableDescriptionForError:](MBError, "loggableDescriptionForError:", v6)];
  }
  id v7 = objc_msgSend( a1,  "_formatErrors:descriptionSelector:",  objc_msgSend( objc_msgSend(a3, "userInfo"),  "objectForKeyedSubscript:",  @"kMMCSErrorUnderlyingErrorArrayKey"),  "loggableDescriptionForError:");
  if (v7) {
    [v5 appendFormat:@" Underlying MMCS errors: %@", v7];
  }
  id v8 = objc_msgSend( a1,  "_formatErrors:descriptionSelector:",  objc_msgSend( objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"CKPartialErrors"),  "allValues"),  "loggableDescriptionForError:");
  if (v8) {
    [v5 appendFormat:@" Underlying CloudKit errors: %@", v8];
  }
  id v9 = objc_msgSend( a1,  "_formatErrors:descriptionSelector:",  objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"kMBUnderlyingErrorsKey"),  "loggableDescriptionForError:");
  if (v9) {
    [v5 appendFormat:@" Underlying Backup errors: %@", v9];
  }
  return v5;
}

+ (id)descriptionForError:(id)a3
{
  return +[MBError descriptionForError:paths:](&OBJC_CLASS___MBError, "descriptionForError:paths:", a3, 1LL);
}

+ (id)descriptionForError:(id)a3 paths:(BOOL)a4
{
  if (!a3) {
    return @"(null)";
  }
  BOOL v4 = a4;
  id v6 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  id v7 = (const __CFString *)[a3 localizedDescription];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = @"Unknown error";
  }
  [v6 appendString:v8];
  if (v4)
  {
    id v9 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSFilePathErrorKey);
    if (v9) {
      [v6 appendFormat:@" at path \"%@\"", v9];
    }
    id v10 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSURLErrorKey);
    if (v10) {
      [v6 appendFormat:@" for URL \"%@\"", v10];
    }
  }

  [v6 appendFormat:@" (%@/%d)", objc_msgSend(a3, "domain"), objc_msgSend(a3, "code")];
  id v11 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  if (v11) {
    [v6 appendFormat:@". Underlying error: %@.", +[MBError descriptionForError:](MBError, "descriptionForError:", v11)];
  }
  id v12 = objc_msgSend( objc_msgSend(a3, "userInfo"),  "objectForKeyedSubscript:",  @"kMMCSErrorUnderlyingErrorArrayKey");
  if (v12)
  {
    __int128 v13 = v12;
    id v14 = [v12 count];
    id v15 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    else {
      uint64_t v16 = (uint64_t)v14;
    }
    if (v16)
    {
      for (uint64_t i = 0LL; i != v16; ++i)
        objc_msgSend( v15,  "addObject:",  +[MBError descriptionForError:]( MBError,  "descriptionForError:",  objc_msgSend(v13, "objectAtIndexedSubscript:", i)));
    }

    [v6 appendFormat:@". Underlying MMCS errors: %@.", MBStringWithArray(v15)];
  }

  return v6;
}

+ (id)dictionaryRepresentationForError:(id)a3
{
  return [a1 dictionaryRepresentationForError:a3 withMultiErrors:0];
}

+ (id)dictionaryRepresentationForError:(id)a3 withMultiErrors:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend(v7, "setValue:forKey:", objc_msgSend(a3, "domain"), @"domain");
  objc_msgSend( v7,  "setValue:forKey:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "code")),  @"code");
  id v8 = [a3 localizedDescription];
  if (v8) {
    [v7 setValue:v8 forKey:@"localizedDescription"];
  }
  id v9 = [a3 userInfo];
  id v10 = [v9 objectForKeyedSubscript:NSFilePathErrorKey];
  if (v10) {
    [v7 setValue:v10 forKey:@"filePath"];
  }
  id v11 = [v9 objectForKeyedSubscript:NSURLErrorKey];
  if (v11) {
    objc_msgSend(v7, "setValue:forKey:", objc_msgSend(v11, "absoluteString"), @"URL");
  }
  id v12 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];
  if (v12) {
    objc_msgSend( v7,  "setValue:forKey:",  objc_msgSend(a1, "dictionaryRepresentationForError:withMultiErrors:", v12, v4),  @"underlyingError");
  }
  if (v4)
  {
    id v13 = [v9 objectForKeyedSubscript:@"kMBUnderlyingErrorsKey"];
    if (v13)
    {
      id v14 = v13;
      id v15 = +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v13 count]);
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v23;
        do
        {
          v19 = 0LL;
          do
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(v14);
            }
            -[NSMutableArray addObject:]( v15,  "addObject:",  [a1 dictionaryRepresentationForError:*(void *)(*((void *)&v22 + 1) + 8 * (void)v19) withMultiErrors:1]);
            v19 = (char *)v19 + 1;
          }

          while (v17 != v19);
          id v17 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }

        while (v17);
      }

      [v7 setObject:v15 forKey:@"underlyingErrors"];
    }
  }

  id v20 = [v9 valueForKey:@"kMBErrorDateKey"];
  if (v20) {
    [v7 setObject:v20 forKeyedSubscript:@"date"];
  }
  return v7;
}

+ (id)errorWithDictionaryRepresentation:(id)a3
{
  return [a1 errorWithDictionaryRepresentation:a3 withMultiErrors:0];
}

+ (id)errorWithDictionaryRepresentation:(id)a3 withMultiErrors:(BOOL)a4
{
  if (!a3) {
    return 0LL;
  }
  BOOL v4 = a4;
  id result = [a3 objectForKeyedSubscript:@"domain"];
  if (!result) {
    return result;
  }
  id v8 = result;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0) {
    return 0LL;
  }
  id result = [a3 objectForKeyedSubscript:@"code"];
  if (!result) {
    return result;
  }
  id v10 = result;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0) {
      return 0LL;
    }
  }

  id v13 = [v10 integerValue];
  id v14 = [a3 objectForKeyedSubscript:@"localizedDescription"];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
      id v17 = v15;
    }
    else {
      id v17 = 0LL;
    }
  }

  else
  {
    id v17 = 0LL;
  }

  id v18 = [a3 objectForKeyedSubscript:@"filePath"];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0) {
      id v21 = v19;
    }
    else {
      id v21 = 0LL;
    }
  }

  else
  {
    id v21 = 0LL;
  }

  id v22 = [a3 objectForKeyedSubscript:@"URL"];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0) {
      id v25 = v23;
    }
    else {
      id v25 = 0LL;
    }
  }

  else
  {
    id v25 = 0LL;
  }

  id v26 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v26 setValue:v17 forKey:NSLocalizedDescriptionKey];
  [v26 setValue:v21 forKey:NSFilePathErrorKey];
  if (v25) {
    objc_msgSend( v26,  "setValue:forKey:",  +[NSURL URLWithString:](NSURL, "URLWithString:", v25),  NSURLErrorKey);
  }
  id v27 = [a3 objectForKeyedSubscript:@"underlyingError"];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0) {
      id v30 = v28;
    }
    else {
      id v30 = 0LL;
    }
  }

  else
  {
    id v30 = 0LL;
  }

  objc_msgSend( v26,  "setObject:forKeyedSubscript:",  +[MBError errorWithDictionaryRepresentation:withMultiErrors:]( MBError,  "errorWithDictionaryRepresentation:withMultiErrors:",  v30,  v4),  NSUnderlyingErrorKey);
  id v31 = [a3 objectForKeyedSubscript:@"underlyingErrors"];
  if (!v31 || (uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v31, v32) & 1) != 0))
  {
    id v45 = v13;
    v33 = +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  objc_msgSend(v31, "count", v26));
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v34 = [v31 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v47;
LABEL_35:
      uint64_t v37 = 0LL;
      while (1)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(v31);
        }
        uint64_t v38 = *(void *)(*((void *)&v46 + 1) + 8 * v37);
        uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v38, v39) & 1) == 0) {
          break;
        }
        -[NSMutableArray addObject:]( v33,  "addObject:",  [a1 errorWithDictionaryRepresentation:v38 withMultiErrors:1]);
        if (v35 == (id)++v37)
        {
          id v35 = [v31 countByEnumeratingWithState:&v46 objects:v50 count:16];
          if (v35) {
            goto LABEL_35;
          }
          break;
        }
      }
    }

    id v26 = v44;
    [v44 setObject:v33 forKeyedSubscript:@"kMBUnderlyingErrorsKey"];
    id v13 = v45;
  }

  id v40 = [a3 objectForKeyedSubscript:@"date"];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0) {
      id v43 = v41;
    }
    else {
      id v43 = 0LL;
    }
  }

  else
  {
    id v43 = 0LL;
  }

  [v26 setObject:v43 forKeyedSubscript:@"kMBErrorDateKey"];
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  v13,  v26);
}

@end