@interface internalClientUtil
- (internalClientUtil)init;
- (void)cleanPreferred;
@end

@implementation internalClientUtil

- (internalClientUtil)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___internalClientUtil;
  return -[internalClientUtil init](&v3, "init");
}

- (void)cleanPreferred
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsKeychainBackingStore defaultBackingStore]( &OBJC_CLASS___THThreadNetworkCredentialsKeychainBackingStore,  "defaultBackingStore"));
  id v3 = -[THThreadNetworkCredentialsStoreLocalClient initApplePrivateStoreWithBackingStore:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsStoreLocalClient),  "initApplePrivateStoreWithBackingStore:",  v2);

  [v3 deletePreferredAndFrozenThreadNetworksWithCompletion:&__block_literal_global_0];
}

@end