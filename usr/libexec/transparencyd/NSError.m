@interface NSError
+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5;
+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6;
+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 description:(id)a6 underlying:(id)a7;
@end

@implementation NSError

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  return +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  a3,  a4,  a5,  0LL);
}

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6
{
  return (NSError *)[a1 errorWithDomain:a3 code:a4 userInfo:0 description:a5 underlying:a6];
}

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 description:(id)a6 underlying:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  if (a5) {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a5));
  }
  else {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  v15 = v14;
  [v14 setObject:v12 forKeyedSubscript:NSLocalizedDescriptionKey];

  [v15 setObject:v11 forKeyedSubscript:NSUnderlyingErrorKey];
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  a4,  v15));

  return (NSError *)v16;
}

@end