@interface AMSDPaymentValidationService
+ (BOOL)isConnectionEntitled:(id)a3;
+ (OS_dispatch_queue)sharedQueue;
+ (id)paymentHardwareType;
+ (id)sharedService;
- (void)paymentHardwareStatusHeaderWithCompletion:(id)a3;
@end

@implementation AMSDPaymentValidationService

+ (id)sharedService
{
  if (qword_1000F2038 != -1) {
    dispatch_once(&qword_1000F2038, &stru_1000D7468);
  }
  return (id)qword_1000F2040;
}

+ (OS_dispatch_queue)sharedQueue
{
  if (qword_1000F2048 != -1) {
    dispatch_once(&qword_1000F2048, &stru_1000D7488);
  }
  return (OS_dispatch_queue *)(id)qword_1000F2050;
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.applemediaservices"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  unsigned __int8 v7 = [v6 BOOLValue];
  return v7;
}

- (void)paymentHardwareStatusHeaderWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "sharedQueue");
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000322D0;
  v9[3] = &unk_1000D6208;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  +[AMSDTransactionStore takeKeepAliveTransaction:withQueue:whilePerformingBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:withQueue:whilePerformingBlock:",  @"com.apple.amsaccountsd.paymentvalidation",  v7,  v9);
}

+ (id)paymentHardwareType
{
  return @"ARM64";
}

@end