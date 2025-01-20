@interface AMSPurchaseResult
- (id)newSSPurchaseResponseWithSSPurchase:(id)a3;
@end

@implementation AMSPurchaseResult

- (id)newSSPurchaseResponseWithSSPurchase:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___SSPurchaseResponse);
  -[SSPurchaseResponse setPurchase:](v5, "setPurchase:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPurchaseResult error](self, "error"));
  -[SSPurchaseResponse setError:](v5, "setError:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPurchaseResult responseDictionary](self, "responseDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v7,  100LL,  0LL,  0LL));

  v9 = objc_alloc(&OBJC_CLASS___SSURLConnectionResponse);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSPurchaseResult URLResponse](self, "URLResponse"));
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  id v12 = 0LL;
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    id v12 = v10;
  }

  v13 = -[SSURLConnectionResponse initWithURLResponse:bodyData:](v9, "initWithURLResponse:bodyData:", v12, v8);
  -[SSPurchaseResponse setURLResponse:](v5, "setURLResponse:", v13);

  return v5;
}

@end