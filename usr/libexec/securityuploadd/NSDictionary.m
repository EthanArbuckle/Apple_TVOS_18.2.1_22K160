@interface NSDictionary
- (BOOL)writeToClassDURL:(id)a3 permissions:(unsigned __int16)a4 error:(id *)a5;
@end

@implementation NSDictionary

- (BOOL)writeToClassDURL:(id)a3 permissions:(unsigned __int16)a4 error:(id *)a5
{
  id v8 = a3;
  if (!-[NSDictionary writeToURL:error:](self, "writeToURL:error:", v8, a5)) {
    goto LABEL_12;
  }
  id v9 = v8;
  v10 = (const char *)[v9 fileSystemRepresentation];
  int v11 = open(v10, 0);
  if (v11)
  {
    int v12 = v11;
    if ((fcntl(v11, 64, 4LL) & 0x80000000) == 0)
    {
      close(v12);
      id v13 = v9;
      if (!chmod((const char *)[v13 fileSystemRepresentation], a4))
      {
        BOOL v27 = 1;
        goto LABEL_13;
      }

      uint64_t v14 = *__error();
      v15 = sub_100010B50("SecError");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = [v13 fileSystemRepresentation];
        __int16 v38 = 2080;
        v39 = strerror(v14);
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "failed to change permissions of %s: %s",  buf,  0x16u);
      }

      if (a5)
      {
        v17 = +[NSString localizedStringWithFormat:]( NSString, "localizedStringWithFormat:", @"failed to change permissions of %s: %s", [v13 fileSystemRepresentation], strerror(v14), NSLocalizedDescriptionKey);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v36 = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v14,  v19));
      }

      goto LABEL_12;
    }

    uint64_t v28 = *__error();
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    v29 = __error();
    v30 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"failed to change protection class of %s: %s",  v10,  strerror(*v29));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    *(void *)buf = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v42,  1LL));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v28,  v32));

    id v26 = v33;
    close(v12);
    if (!a5)
    {
LABEL_12:
      BOOL v27 = 0;
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v20 = *__error();
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    v21 = __error();
    v22 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"failed to open file for protection class change %s: %s",  v10,  strerror(*v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v41 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v20,  v24));

    id v26 = v25;
    if (!a5) {
      goto LABEL_12;
    }
  }

  BOOL v27 = 0;
  *a5 = v26;
LABEL_13:

  return v27;
}

@end