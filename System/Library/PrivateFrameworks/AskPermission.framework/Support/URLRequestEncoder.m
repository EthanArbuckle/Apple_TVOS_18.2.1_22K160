@interface URLRequestEncoder
- (URLRequestEncoder)init;
- (id)_processInfo;
@end

@implementation URLRequestEncoder

- (URLRequestEncoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___URLRequestEncoder;
  v2 = -[URLRequestEncoder init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
    -[URLRequestEncoder setBag:](v2, "setBag:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[URLRequestEncoder _processInfo](v2, "_processInfo"));
    -[URLRequestEncoder setClientInfo:](v2, "setClientInfo:", v4);
  }

  return v2;
}

- (id)_processInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](&OBJC_CLASS___AMSProcessInfo, "currentProcess"));
  [v2 setAccountMediaType:AMSAccountMediaTypeAppStore];
  return v2;
}

@end