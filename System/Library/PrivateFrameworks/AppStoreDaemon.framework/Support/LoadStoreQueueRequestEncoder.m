@interface LoadStoreQueueRequestEncoder
- (LoadStoreQueueRequestEncoder)initWithBag:(id)a3;
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
@end

@implementation LoadStoreQueueRequestEncoder

- (LoadStoreQueueRequestEncoder)initWithBag:(id)a3
{
  id v4 = a3;
  id v5 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (self)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___LoadStoreQueueRequestEncoder;
    v8 = -[LoadStoreQueueRequestEncoder initWithBag:](&v10, "initWithBag:", v4);
    self = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_device, v6);
    }
  }

  return self;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mutableCopy];
  [v7 setCachePolicy:1];
  sub_1002EB5B0(v7, 1LL, self->_device);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LoadStoreQueueRequestEncoder;
  id v8 = -[LoadStoreQueueRequestEncoder requestByEncodingRequest:parameters:]( &v11,  "requestByEncodingRequest:parameters:",  v7,  v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (void).cxx_destruct
{
}

@end