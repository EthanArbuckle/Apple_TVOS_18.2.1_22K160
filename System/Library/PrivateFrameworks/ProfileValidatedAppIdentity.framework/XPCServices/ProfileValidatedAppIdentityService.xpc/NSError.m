@interface NSError
+ (id)pvai_errorWithCode:(int64_t)a3;
+ (id)pvai_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)pvai_wrappedError:(int64_t)a3 error:(id)a4;
@end

@implementation NSError

+ (id)pvai_errorWithCode:(int64_t)a3
{
  return objc_msgSend(a1, "pvai_errorWithCode:userInfo:", a3, 0);
}

+ (id)pvai_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.devicecheck.error.pvappidentity",  a3,  a4);
}

+ (id)pvai_wrappedError:(int64_t)a3 error:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (!v5)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
LABEL_6:
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError pvai_errorWithCode:userInfo:](&OBJC_CLASS___NSError, "pvai_errorWithCode:userInfo:", a3, v10));

    goto LABEL_7;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  unsigned __int8 v8 = [v7 isEqualToString:@"com.apple.devicecheck.error.pvappidentity"];

  if ((v8 & 1) == 0)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v6, NSUnderlyingErrorKey);
    goto LABEL_6;
  }

  id v9 = v6;
LABEL_7:

  return v9;
}

@end