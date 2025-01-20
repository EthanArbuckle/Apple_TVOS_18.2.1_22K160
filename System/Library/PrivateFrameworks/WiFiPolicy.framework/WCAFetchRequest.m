@interface WCAFetchRequest
+ (BOOL)supportsSecureCoding;
- (WCAAsset)asset;
- (WCAFetchRequest)initWithCoder:(id)a3;
- (id)completionHandler;
- (void)encodeWithCoder:(id)a3;
- (void)setAsset:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation WCAFetchRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (WCAFetchRequest)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WCAFetchRequest;
  id v3 = a3;
  v4 = -[WCAFetchRequest init](&v8, sel_init);
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_asset", v8.receiver, v8.super_class);

  asset = v4->_asset;
  v4->_asset = (WCAAsset *)v5;

  return v4;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (WCAAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (void).cxx_destruct
{
}

@end