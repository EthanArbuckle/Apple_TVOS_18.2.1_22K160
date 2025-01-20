@interface ASDPersistentRequest
- (void)startUsingProxy:(id)a3 withErrorHandler:(id)a4;
@end

@implementation ASDPersistentRequest

- (void)startUsingProxy:(id)a3 withErrorHandler:(id)a4
{
  uint64_t v5 = ASDErrorDomain;
  id v6 = a4;
  uint64_t v7 = ASDErrorWithTitleAndMessage(v5, 911LL, @"This request is not yet implemeneted", 0LL);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  (*((void (**)(id, id))a4 + 2))(v6, v8);
}

@end