@interface ASVError
+ (id)errorWithCode:(unsigned int)a3 localizedDescription:(id)a4;
- (id)localizedDescription;
@end

@implementation ASVError

- (id)localizedDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASVError userInfo](self, "userInfo"));
  v4 = v3;
  if (!v3
    || (v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:NSLocalizedDescriptionKey])) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___ASVError;
    id v6 = -[ASVError localizedDescription](&v8, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v5;
}

+ (id)errorWithCode:(unsigned int)a3 localizedDescription:(id)a4
{
  id v5 = a4;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[ASVError errorWithDomain:code:userInfo:]( &OBJC_CLASS___ASVError,  "errorWithDomain:code:userInfo:",  @"ASV",  a3,  v6));

  return v7;
}

@end