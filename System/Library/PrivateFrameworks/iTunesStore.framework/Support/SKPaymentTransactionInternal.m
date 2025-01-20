@interface SKPaymentTransactionInternal
- (SKPaymentTransactionInternal)init;
@end

@implementation SKPaymentTransactionInternal

- (SKPaymentTransactionInternal)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKPaymentTransactionInternal;
  v2 = -[SKPaymentTransactionInternal init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 UUIDString]);
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    downloads = v2->_downloads;
    v2->_downloads = (NSArray *)&__NSArray0__struct;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end