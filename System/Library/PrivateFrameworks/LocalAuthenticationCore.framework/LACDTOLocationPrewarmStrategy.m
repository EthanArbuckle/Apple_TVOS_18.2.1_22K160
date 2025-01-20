@interface LACDTOLocationPrewarmStrategy
- (LACDTOLocationPrewarmStrategy)initWithFeatureStateProvider:(id)a3 trustStateProvider:(id)a4 device:(id)a5 keybag:(id)a6;
- (void)checkNeedsPrewarmWithCompletion:(id)a3;
@end

@implementation LACDTOLocationPrewarmStrategy

- (LACDTOLocationPrewarmStrategy)initWithFeatureStateProvider:(id)a3 trustStateProvider:(id)a4 device:(id)a5 keybag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___LACDTOLocationPrewarmStrategy;
  v15 = -[LACDTOLocationPrewarmStrategy init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_featureStateProvider, a3);
    objc_storeStrong((id *)&v16->_trustStateProvider, a4);
    objc_storeStrong((id *)&v16->_device, a5);
    objc_storeStrong((id *)&v16->_keybag, a6);
  }

  return v16;
}

- (void)checkNeedsPrewarmWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (-[LACKeyBag state](self->_keybag, "state") != 5)
  {
    LACLogDTOLocation();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      v7 = "Prewarm skipped because keybag is not unlocked";
LABEL_8:
      _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)location, 2u);
    }

void __65__LACDTOLocationPrewarmStrategy_checkNeedsPrewarmWithCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([v3 isEnabled])
    {
      if (![v3 isStrictModeEnabled])
      {
        v7 = (void *)WeakRetained[2];
        v8[0] = MEMORY[0x1895F87A8];
        v8[1] = 3221225472LL;
        v8[2] = __65__LACDTOLocationPrewarmStrategy_checkNeedsPrewarmWithCompletion___block_invoke_1;
        v8[3] = &unk_18A368720;
        objc_copyWeak(&v10, (id *)(a1 + 40));
        id v9 = *(id *)(a1 + 32);
        [v7 fetchSensorTrustStateWithCompletion:v8];

        objc_destroyWeak(&v10);
        goto LABEL_11;
      }

      LACLogDTOLocation();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      v6 = "Prewarm skipped because strict mode is enabled";
    }

    else
    {
      LACLogDTOLocation();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
        goto LABEL_11;
      }

      *(_WORD *)buf = 0;
      v6 = "Prewarm skipped because feature is disabled";
    }

    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_9;
  }

void __65__LACDTOLocationPrewarmStrategy_checkNeedsPrewarmWithCompletion___block_invoke_1( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([v3 isDisapproved])
    {
      v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    }

    else
    {
      LACLogDTOLocation();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, "Prewarm skipped because sensor is trusted", v7, 2u);
      }

      v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    }

    v5();
  }
}

- (void).cxx_destruct
{
}

@end