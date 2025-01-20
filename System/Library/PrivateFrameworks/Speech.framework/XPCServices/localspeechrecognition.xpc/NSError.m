@interface NSError
+ (id)lsr_errorWithCode:(int64_t)a3;
+ (id)lsr_errorWithCode:(int64_t)a3 description:(id)a4;
@end

@implementation NSError

+ (id)lsr_errorWithCode:(int64_t)a3 description:(id)a4
{
  id v5 = a4;
  v6 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 1LL);
  v7 = v6;
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v5, NSLocalizedDescriptionKey);
  }
  if (-[NSMutableDictionary count](v7, "count")) {
    v8 = v7;
  }
  else {
    v8 = 0LL;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  a3,  v8));

  return v9;
}

+ (id)lsr_errorWithCode:(int64_t)a3
{
  return objc_msgSend(a1, "lsr_errorWithCode:description:", a3, 0);
}

@end