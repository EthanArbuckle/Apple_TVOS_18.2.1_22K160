@interface AssetRequest
- (AssetRequest)initWithURL:(id)a3 cachePolicy:(unint64_t)a4 timeoutInterval:(double)a5;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setAllowsConstrainedNetworkAccess:(BOOL)a3;
- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3;
@end

@implementation AssetRequest

- (AssetRequest)initWithURL:(id)a3 cachePolicy:(unint64_t)a4 timeoutInterval:(double)a5
{
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  a3,  a4,  a5));
  v7 = (AssetRequest *)sub_10027385C(self, v6, 0LL);

  return v7;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AssetRequest;
  -[AssetRequest setAllowsCellularAccess:](&v6, "setAllowsCellularAccess:");
  properties = self->_properties;
  if (properties) {
    properties->_allowsCellularAccess = a3;
  }
}

- (void)setAllowsConstrainedNetworkAccess:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AssetRequest;
  -[AssetRequest setAllowsConstrainedNetworkAccess:](&v6, "setAllowsConstrainedNetworkAccess:");
  properties = self->_properties;
  if (properties) {
    properties->_allowsConstrainedNetworkAccess = a3;
  }
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AssetRequest;
  -[AssetRequest setAllowsExpensiveNetworkAccess:](&v6, "setAllowsExpensiveNetworkAccess:");
  properties = self->_properties;
  if (properties) {
    properties->_allowsExpensiveNetworkAccess = a3;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  id v6 = -[AssetRequestProperties mutableCopyWithZone:](self->_properties, "mutableCopyWithZone:", a3);
  v7 = sub_10027385C(v5, self, v6);

  return v7;
}

- (void).cxx_destruct
{
}

@end