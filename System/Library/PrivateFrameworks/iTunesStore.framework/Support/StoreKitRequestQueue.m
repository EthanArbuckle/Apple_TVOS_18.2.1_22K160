@interface StoreKitRequestQueue
+ (id)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (StoreKitRequestQueue)init;
- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5;
- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6;
- (void)requestProductsWithMessage:(id)a3 connection:(id)a4;
@end

@implementation StoreKitRequestQueue

- (StoreKitRequestQueue)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___StoreKitRequestQueue;
  v2 = -[RequestQueue init](&v4, "init");
  if (v2)
  {
    if (qword_1003A3288 != -1) {
      dispatch_once(&qword_1003A3288, &stru_10034BDA8);
    }
    -[RequestQueue setOperationQueue:](v2, "setOperationQueue:", qword_1003A3280);
  }

  return v2;
}

+ (void)setSharedInstance:(id)a3
{
  if ((id)qword_1003A3278 != a3)
  {

    qword_1003A3278 = (uint64_t)a3;
  }

+ (id)sharedInstance
{
  id result = (id)qword_1003A3278;
  if (!qword_1003A3278)
  {
    id result = objc_alloc_init((Class)a1);
    qword_1003A3278 = (uint64_t)result;
  }

  return result;
}

- (void)requestProductsWithMessage:(id)a3 connection:(id)a4
{
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  CFDictionaryRef v8 = sub_100146880(a3, "1", v7);
  v9 = -[LoadMicroPaymentProductsOperation initWithProductIdentifiers:]( objc_alloc(&OBJC_CLASS___LoadMicroPaymentProductsOperation),  "initWithProductIdentifiers:",  v8);
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) == 0
    && !SSXPCConnectionHasEntitlement(a4, kSSStoreKitEntitlementClientOverride)
    || (id v10 = objc_alloc((Class)sub_1001468B8()),
        (id v11 = objc_msgSend(v10, "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "2"))) == 0)
    || (v12 = v11,
        v13 = objc_alloc_init(&OBJC_CLASS___StoreKitClientIdentity),
        -[StoreKitClientIdentity setValuesWithPaymentQueueClient:](v13, "setValuesWithPaymentQueueClient:", v12),
        v12,
        !v13))
  {
    v14 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", a4);
    v13 = objc_alloc_init(&OBJC_CLASS___StoreKitClientIdentity);
    -[StoreKitClientIdentity setBundleIdentifier:]( v13,  "setBundleIdentifier:",  -[XPCClient clientIdentifier](v14, "clientIdentifier"));
    -[StoreKitClientIdentity setSandboxed:]( v13,  "setSandboxed:",  -[XPCClient isAppleSigned](v14, "isAppleSigned") ^ 1);
  }

  -[LoadMicroPaymentProductsOperation setClientIdentity:](v9, "setClientIdentity:", v13);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000421D8;
  v15[3] = &unk_10034BD60;
  v15[4] = v9;
  -[StoreKitRequestQueue addOperation:forMessage:connection:replyBlock:]( self,  "addOperation:forMessage:connection:replyBlock:",  v9,  a3,  a4,  v15);
}

- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5
{
  v6[1] = 3221225472LL;
  v6[2] = sub_1000422AC;
  v6[3] = &unk_10034BD88;
  v6[4] = a5;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___StoreKitRequestQueue;
  v6[0] = _NSConcreteStackBlock;
  -[RequestQueue addOperation:forClient:withMessageBlock:](&v5, "addOperation:forClient:withMessageBlock:", a3, a4, v6);
}

- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6
{
  v7[1] = 3221225472LL;
  v7[2] = sub_100042364;
  v7[3] = &unk_10034BD88;
  v7[4] = a6;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___StoreKitRequestQueue;
  v7[0] = _NSConcreteStackBlock;
  -[RequestQueue addOperation:forMessage:connection:replyBlock:]( &v6,  "addOperation:forMessage:connection:replyBlock:",  a3,  a4,  a5,  v7);
}

@end