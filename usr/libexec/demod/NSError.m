@interface NSError
+ (id)errorDomainMSDWithCode:(int64_t)a3 message:(id)a4;
+ (id)errorDomainMSDWithCode:(int64_t)a3 message:(id)a4 reason:(id)a5;
+ (id)masterServerErrorRetryAfter:(id)a3;
+ (id)masterServerErrorWithCode:(int64_t)a3 mesage:(id)a4 reason:(id)a5;
- (NSError)initWithDomainMSDCode:(int64_t)a3 message:(id)a4;
- (NSError)initWithDomainMSDCode:(int64_t)a3 message:(id)a4 reason:(id)a5;
@end

@implementation NSError

+ (id)errorDomainMSDWithCode:(int64_t)a3 message:(id)a4
{
  id v5 = a4;
  v6 = -[NSError initWithDomainMSDCode:message:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomainMSDCode:message:",  a3,  v5);

  return v6;
}

+ (id)errorDomainMSDWithCode:(int64_t)a3 message:(id)a4 reason:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = -[NSError initWithDomainMSDCode:message:reason:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomainMSDCode:message:reason:",  a3,  v8,  v7);

  return v9;
}

+ (id)masterServerErrorWithCode:(int64_t)a3 mesage:(id)a4 reason:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:NSLocalizedDescriptionKey];
  }
  if (v8) {
    [v10 setObject:v8 forKey:NSLocalizedFailureReasonErrorKey];
  }
  v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"MSDMasterServerErrorDomain",  a3,  v10);

  return v11;
}

+ (id)masterServerErrorRetryAfter:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  [v4 setObject:v3 forKey:@"RetryAfter"];

  id v5 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"MSDMasterServerErrorDomain",  202LL,  v4);
  return v5;
}

- (NSError)initWithDomainMSDCode:(int64_t)a3 message:(id)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  a4,  NSLocalizedDescriptionKey));
  id v7 = -[NSError initWithDomain:code:userInfo:]( self,  "initWithDomain:code:userInfo:",  @"MSDDemodErrorDomain",  a3,  v6);

  return v7;
}

- (NSError)initWithDomainMSDCode:(int64_t)a3 message:(id)a4 reason:(id)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a4,  NSLocalizedDescriptionKey,  a5,  NSLocalizedFailureReasonErrorKey,  0LL));
  id v8 = -[NSError initWithDomain:code:userInfo:]( self,  "initWithDomain:code:userInfo:",  @"MSDDemodErrorDomain",  a3,  v7);

  return v8;
}

@end