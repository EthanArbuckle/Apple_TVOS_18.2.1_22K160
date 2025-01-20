@interface CKOperationGroup
+ (id)CKKSGroupWithName:(id)a3;
@end

@implementation CKOperationGroup

+ (id)CKKSGroupWithName:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___CKOperationGroup);
  -[CKOperationGroup setExpectedSendSize:](v4, "setExpectedSendSize:", 1LL);
  -[CKOperationGroup setExpectedReceiveSize:](v4, "setExpectedReceiveSize:", 1LL);
  -[CKOperationGroup setName:](v4, "setName:", v3);

  return v4;
}

@end