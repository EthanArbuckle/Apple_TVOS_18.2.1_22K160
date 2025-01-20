@interface NSDictionary
- (BOOL)writeToClassDURL:(id)a3 permissions:(unsigned __int16)a4 error:(id *)a5;
@end

@implementation NSDictionary

- (BOOL)writeToClassDURL:(id)a3 permissions:(unsigned __int16)a4 error:(id *)a5
{
  id v8 = a3;
  if (!-[NSDictionary writeToURL:error:](self, "writeToURL:error:", v8, a5)) {
    goto LABEL_10;
  }
  id v21 = 0LL;
  id v9 = v8;
  if (sub_100019C00((const char *)[v9 fileSystemRepresentation], &v21))
  {
    id v10 = v9;
    if (!chmod((const char *)[v10 fileSystemRepresentation], a4))
    {
      BOOL v19 = 1;
      goto LABEL_11;
    }

    uint64_t v11 = *__error();
    v12 = sub_10000856C("SecError");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v10 fileSystemRepresentation];
      v15 = strerror(v11);
      *(_DWORD *)buf = 136315394;
      id v25 = v14;
      __int16 v26 = 2080;
      v27 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "failed to change permissions of %s: %s",  buf,  0x16u);
    }

    if (a5)
    {
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      v16 = +[NSString localizedStringWithFormat:]( NSString, "localizedStringWithFormat:", @"failed to change permissions of %s: %s", [v10 fileSystemRepresentation], strerror(v11));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v23 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v11,  v18));
    }

    goto LABEL_10;
  }

  if (!a5)
  {
LABEL_10:
    BOOL v19 = 0;
    goto LABEL_11;
  }

  BOOL v19 = 0;
  *a5 = v21;
LABEL_11:

  return v19;
}

@end