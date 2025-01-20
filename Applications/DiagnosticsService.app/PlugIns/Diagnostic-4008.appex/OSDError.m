@interface OSDError
+ (BOOL)setError:(id *)a3 withDomain:(id)a4 withCode:(int)a5;
+ (BOOL)setError:(id *)a3 withDomain:(id)a4 withCode:(int)a5 format:(id)a6;
@end

@implementation OSDError

+ (BOOL)setError:(id *)a3 withDomain:(id)a4 withCode:(int)a5
{
  return [a1 setError:a3 withDomain:a4 withCode:*(void *)&a5 format:0];
}

+ (BOOL)setError:(id *)a3 withDomain:(id)a4 withCode:(int)a5 format:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (v10) {
    v11 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v10,  &v33);
  }
  else {
    v11 = 0LL;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v13 = v12;
  if (v11) {
    [v12 setObject:v11 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  a5,  v13));
  v15 = v14;
  if (a3)
  {
    if (!*a3)
    {
      *a3 = v14;
      BOOL v31 = 1;
      goto LABEL_14;
    }

    uint64_t v16 = DiagnosticLogHandleForCategory(3LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100005B38((uint64_t)v15, v17, v18, v19, v20, v21, v22, v23);
    }
  }

  else
  {
    uint64_t v24 = DiagnosticLogHandleForCategory(3LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100005AD0((uint64_t)v15, v17, v25, v26, v27, v28, v29, v30);
    }
  }

  BOOL v31 = 0;
LABEL_14:

  return v31;
}

@end