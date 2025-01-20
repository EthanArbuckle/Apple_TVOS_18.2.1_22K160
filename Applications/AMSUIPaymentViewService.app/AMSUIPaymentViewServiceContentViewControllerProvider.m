@interface AMSUIPaymentViewServiceContentViewControllerProvider
+ (id)makeContentViewControllerWithContext:(id)a3 completion:(id)a4;
- (AMSUIPaymentViewServiceContentViewControllerProvider)init;
@end

@implementation AMSUIPaymentViewServiceContentViewControllerProvider

+ (id)makeContentViewControllerWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  _Block_copy(v6);
  id v8 = a3;
  v9 = (void *)sub_10000700C(a3, ObjCClassMetadata, (void (**)(void, void, void))v6);
  _Block_release(v6);

  return v9;
}

- (AMSUIPaymentViewServiceContentViewControllerProvider)init
{
  return (AMSUIPaymentViewServiceContentViewControllerProvider *)PaymentViewServiceContentViewControllerProvider.init()();
}

@end