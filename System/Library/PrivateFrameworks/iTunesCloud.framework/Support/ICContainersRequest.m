@interface ICContainersRequest
+ (id)requestWithDatabaseID:(unsigned int)a3;
- (ICContainersRequest)initWithDatabaseID:(unsigned int)a3;
- (double)timeoutInterval;
@end

@implementation ICContainersRequest

+ (id)requestWithDatabaseID:(unsigned int)a3
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1, a2)), "initWithDatabaseID:", *(void *)&a3);
}

- (ICContainersRequest)initWithDatabaseID:(unsigned int)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/containers",  *(void *)&a3));
  v5 = -[ICDRequest initWithAction:](self, "initWithAction:", v4);

  return v5;
}

- (double)timeoutInterval
{
  return 180.0;
}

@end