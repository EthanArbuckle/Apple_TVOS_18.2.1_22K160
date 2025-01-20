@interface PDPaymentOffersManagerPushPayload
- (NSString)fpanIdentifier;
- (PDPaymentOffersManagerPushPayload)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)endpoint;
@end

@implementation PDPaymentOffersManagerPushPayload

- (PDPaymentOffersManagerPushPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___PDPaymentOffersManagerPushPayload;
    v5 = -[PDPaymentOffersManagerPushPayload init](&v14, "init");
    if (v5)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 PKStringForKey:@"passTypeIdentifier"]);
      fpanIdentifier = v5->_fpanIdentifier;
      v5->_fpanIdentifier = (NSString *)v6;

      v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v4 PKStringForKey:@"endpoint"]);
      v9 = v8;
      BOOL v11 = 1;
      if (v8 != @"catalog")
      {
        if (!v8
          || (unsigned int v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", @"catalog"),
              v9,
              !v10))
        {
          BOOL v11 = 0;
        }
      }

      v5->_endpoint = v11;
    }

    self = v5;
    v12 = self;
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 appendFormat:@"fpanIdentifier: '%@'; ", self->_fpanIdentifier];
  else {
    v5 = @"unknown";
  }
  [v4 appendFormat:@"endpoint: '%@'; ", v5];
  [v4 appendFormat:@">"];
  return v4;
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void).cxx_destruct
{
}

@end