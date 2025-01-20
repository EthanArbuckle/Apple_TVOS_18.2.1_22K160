@interface AcmeClient
- (AcmeClient)init;
- (AcmeClient)initWithURLString:(id)a3;
- (id)delegate;
- (id)url;
- (id)urlRequest;
- (void)post:(id)a3 withMethod:(id)a4 contentType:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUrlRequest:(id)a3;
- (void)start3:(id)a3;
@end

@implementation AcmeClient

- (AcmeClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AcmeClient;
  return -[AcmeClient init](&v3, "init");
}

- (AcmeClient)initWithURLString:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AcmeClient;
  v5 = -[AcmeClient init](&v14, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAddingPercentEscapesUsingEncoding:4]);
    v7 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v6);
    url = v5->url;
    v5->url = v7;

    v9 = objc_alloc(&OBJC_CLASS___NSMutableURLRequest);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AcmeClient url](v5, "url"));
    v11 = -[NSMutableURLRequest initWithURL:cachePolicy:timeoutInterval:]( v9,  "initWithURL:cachePolicy:timeoutInterval:",  v10,  1LL,  15.0);
    urlRequest = v5->urlRequest;
    v5->urlRequest = v11;
  }

  return v5;
}

- (void)post:(id)a3 withMethod:(id)a4 contentType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[AcmeClient urlRequest](self, "urlRequest"));
  [v11 setHTTPMethod:v9];

  [v11 setHTTPBody:v10];
  [v11 setValue:@"com.apple.security.acmeclient/1.0" forHTTPHeaderField:@"User-Agent"];
  [v11 setValue:v8 forHTTPHeaderField:@"Content-Type"];
}

- (void)start3:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100003570;
  v8[3] = &unk_100008628;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (id)url
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setUrl:(id)a3
{
}

- (id)urlRequest
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUrlRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end