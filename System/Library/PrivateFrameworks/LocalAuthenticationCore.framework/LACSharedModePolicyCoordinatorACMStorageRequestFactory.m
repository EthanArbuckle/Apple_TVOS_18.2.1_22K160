@interface LACSharedModePolicyCoordinatorACMStorageRequestFactory
- (id)requestWithPolicyTraits:(int64_t)a3;
@end

@implementation LACSharedModePolicyCoordinatorACMStorageRequestFactory

- (id)requestWithPolicyTraits:(int64_t)a3
{
  return  -[LACSharedModePolicyCoordinatorACMStorageRequest initWithKey:BOOLValue:]( objc_alloc(&OBJC_CLASS___LACSharedModePolicyCoordinatorACMStorageRequest),  "initWithKey:BOOLValue:",  4LL,  (a3 & 3) != 0);
}

@end