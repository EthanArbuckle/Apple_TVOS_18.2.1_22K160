@interface MTLibraryLinkService
+ (BOOL)shouldFollowRedirects;
- (MTLibraryLinkService)init;
- (NSDictionary)requestParams;
- (id)urlRequest;
- (void)performRequest:(id)a3;
- (void)requestWithParams:(id)a3 callback:(id)a4;
- (void)setRequestParams:(id)a3;
- (void)updateAdamIdForPodcast:(id)a3 withFeedURLs:(id)a4;
@end

@implementation MTLibraryLinkService

- (MTLibraryLinkService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTLibraryLinkService;
  return -[MTLibraryLinkService init](&v3, "init");
}

+ (BOOL)shouldFollowRedirects
{
  return 0;
}

- (id)urlRequest
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](&OBJC_CLASS___IMURLBag, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 syncStringForKey:kBagKeyLibraryLinkURL]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibraryLinkService requestParams](self, "requestParams"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pf_URLByAppendingQueryString:", v6));
  }

  else
  {
    v7 = 0LL;
  }

  v8 = -[NSURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSURLRequest), "initWithURL:", v7);

  return v8;
}

- (void)performRequest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTLibraryLinkService urlRequest](self, "urlRequest"));
  -[MTLibraryLinkService performUrlRequest:callback:](self, "performUrlRequest:callback:", v5, v4);
}

- (void)requestWithParams:(id)a3 callback:(id)a4
{
  id v6 = a4;
  -[MTLibraryLinkService setRequestParams:](self, "setRequestParams:", a3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100116520;
  v8[3] = &unk_100243E08;
  id v9 = v6;
  id v7 = v6;
  -[MTLibraryLinkService performRequest:](self, "performRequest:", v8);
}

- (void)updateAdamIdForPodcast:(id)a3 withFeedURLs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if ([v7 count])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);

      if (v9)
      {
        v15[0] = @"podcastUrl";
        v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
        v15[1] = @"suppressRedirectToSearch";
        v16[0] = v10;
        v16[1] = @"true";
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_10011679C;
        v12[3] = &unk_1002451A8;
        id v13 = v6;
        id v14 = v8;
        -[MTLibraryLinkService requestWithParams:callback:](self, "requestWithParams:callback:", v11, v12);
      }
    }
  }
}

- (NSDictionary)requestParams
{
  return self->_requestParams;
}

- (void)setRequestParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end