@interface LACDTOLocationProviderModeDecorator
- (LACDTOLocationProviderModeDecorator)initWithLocationProvider:(id)a3 featureController:(id)a4;
- (void)_checkIsFeatureStrictModeEnabledWithCompletion:(id)a3;
- (void)checkIsInFamiliarLocationWithCompletion:(id)a3;
@end

@implementation LACDTOLocationProviderModeDecorator

- (LACDTOLocationProviderModeDecorator)initWithLocationProvider:(id)a3 featureController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACDTOLocationProviderModeDecorator;
  v9 = -[LACDTOLocationProviderModeDecorator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationProvider, a3);
    objc_storeStrong((id *)&v10->_featureController, a4);
  }

  return v10;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __79__LACDTOLocationProviderModeDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke;
  v6[3] = &unk_18A36A090;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  -[LACDTOLocationProviderModeDecorator _checkIsFeatureStrictModeEnabledWithCompletion:]( self,  "_checkIsFeatureStrictModeEnabledWithCompletion:",  v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __79__LACDTOLocationProviderModeDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke( uint64_t a1,  int a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v6 = +[LACDTOLocationState strictLocationState](&OBJC_CLASS___LACDTOLocationState, "strictLocationState");
      LACLogDTOLocation();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543618;
        v9 = v5;
        __int16 v10 = 2112;
        v11 = v6;
        _os_log_impl( &dword_189219000,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ will use strict mode value %@",  (uint8_t *)&v8,  0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }

    else
    {
      [WeakRetained[1] checkIsInFamiliarLocationWithCompletion:*(void *)(a1 + 32)];
    }
  }
}

- (void)_checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  featureController = self->_featureController;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __86__LACDTOLocationProviderModeDecorator__checkIsFeatureStrictModeEnabledWithCompletion___block_invoke;
  v7[3] = &unk_18A368770;
  id v8 = v4;
  id v6 = v4;
  -[LACDTOFeatureControlling checkIsFeatureStrictModeEnabledWithCompletion:]( featureController,  "checkIsFeatureStrictModeEnabledWithCompletion:",  v7);
}

uint64_t __86__LACDTOLocationProviderModeDecorator__checkIsFeatureStrictModeEnabledWithCompletion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void).cxx_destruct
{
}

@end