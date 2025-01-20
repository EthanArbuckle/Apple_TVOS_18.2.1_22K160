@interface SwitchAppOwnerURLRequestEncoder
- (SwitchAppOwnerURLRequestEncoder)initWithBag:(id)a3;
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
@end

@implementation SwitchAppOwnerURLRequestEncoder

- (SwitchAppOwnerURLRequestEncoder)initWithBag:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SwitchAppOwnerURLRequestEncoder;
  v3 = -[SwitchAppOwnerURLRequestEncoder initWithBag:](&v6, "initWithBag:", a3);
  v4 = v3;
  if (v3) {
    -[SwitchAppOwnerURLRequestEncoder setUrlKnownToBeTrusted:](v3, "setUrlKnownToBeTrusted:", 1LL);
  }
  return v4;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setCachePolicy:1];
  [v7 setHTTPContentType:@"text/xml"];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SwitchAppOwnerURLRequestEncoder;
  id v8 = -[SwitchAppOwnerURLRequestEncoder requestByEncodingRequest:parameters:]( &v11,  "requestByEncodingRequest:parameters:",  v7,  v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

@end