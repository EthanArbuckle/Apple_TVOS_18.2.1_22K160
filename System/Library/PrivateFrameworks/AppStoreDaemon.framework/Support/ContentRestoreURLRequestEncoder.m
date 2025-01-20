@interface ContentRestoreURLRequestEncoder
- (ContentRestoreURLRequestEncoder)initWithBag:(id)a3;
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
@end

@implementation ContentRestoreURLRequestEncoder

- (ContentRestoreURLRequestEncoder)initWithBag:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ContentRestoreURLRequestEncoder;
  v3 = -[ContentRestoreURLRequestEncoder initWithBag:](&v6, "initWithBag:", a3);
  v4 = v3;
  if (v3) {
    -[ContentRestoreURLRequestEncoder setUrlKnownToBeTrusted:](v3, "setUrlKnownToBeTrusted:", 1LL);
  }
  return v4;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setCachePolicy:1];
  [v7 setHTTPContentType:@"text/xml"];
  id v8 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  sub_1002EB5B0(v7, 1LL, v9);

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ContentRestoreURLRequestEncoder;
  id v10 = -[ContentRestoreURLRequestEncoder requestByEncodingRequest:parameters:]( &v13,  "requestByEncodingRequest:parameters:",  v7,  v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

@end