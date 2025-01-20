@interface FadeLayerThruBlack
@end

@implementation FadeLayerThruBlack

void ___FadeLayerThruBlack_block_invoke(uint64_t a1)
{
  if (CGColorGetBlack_sOnce != -1) {
    dispatch_once_f(&CGColorGetBlack_sOnce, &CGColorGetBlack_sContext, (dispatch_function_t)_CGColorCreateWithRGB);
  }
  [*(id *)(a1 + 32) setBackgroundColor:CGColorGetBlack_sColor];
  LODWORD(v2) = 0;
  [*(id *)(a1 + 32) setOpacity:v2];
  int v3 = *(unsigned __int8 *)(a1 + 56);
  [*(id *)(a1 + 40) zPosition];
  double v5 = -1.0;
  if (!v3) {
    double v5 = 1.0;
  }
  [*(id *)(a1 + 32) setZPosition:v4 + v5];
  [*(id *)(a1 + 40) superlayer];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 addSublayer:*(void *)(a1 + 32)];

  [(Class)getCATransactionClass[0]() commit];
  LODWORD(v7) = 1.0;
  [*(id *)(a1 + 32) setOpacity:v7];
  [(Class)getCABasicAnimationClass[0]() animationWithKeyPath:@"opacity"];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  [MEMORY[0x189607968] numberWithFloat:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setFromValue:v9];

  LODWORD(v10) = 1.0;
  [MEMORY[0x189607968] numberWithFloat:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setToValue:v11];

  Class v12 = (Class)getCAMediaTimingFunctionClass[0]();
  getkCAMediaTimingFunctionEaseOut[0]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[objc_class functionWithName:](v12, "functionWithName:", v13);
  [v15 setTimingFunction:v14];

  [v15 setDuration:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) addAnimation:v15 forKey:@"fadeToBlack"];
}

void ___FadeLayerThruBlack_block_invoke_2(uint64_t a1, double a2)
{
  if (*(_BYTE *)(a1 + 72))
  {
    int v3 = (id *)(a1 + 32);
    float v4 = 1.0;
  }

  else
  {
    [(Class)getCATransactionClass[0]() begin];
    [(Class)getCATransactionClass[0]() setDisableActions:1];
    float v4 = 0.0;
    LODWORD(v5) = 0;
    [*(id *)(a1 + 32) setOpacity:v5];
    [(Class)getCATransactionClass[0]() commit];
    int v3 = (id *)(a1 + 40);
  }

  *(float *)&a2 = v4;
  [*v3 setOpacity:a2];
  [(Class)getCABasicAnimationClass[0]() animationWithKeyPath:@"opacity"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 72)) {
    *(float *)&double v7 = 0.0;
  }
  else {
    *(float *)&double v7 = 1.0;
  }
  [MEMORY[0x189607968] numberWithFloat:v7];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setFromValue:v8];

  if (*(_BYTE *)(a1 + 72)) {
    *(float *)&double v9 = 1.0;
  }
  else {
    *(float *)&double v9 = 0.0;
  }
  [MEMORY[0x189607968] numberWithFloat:v9];
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setToValue:v10];

  Class v11 = (Class)getCAMediaTimingFunctionClass[0]();
  getkCAMediaTimingFunctionEaseIn[0]();
  Class v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[objc_class functionWithName:](v11, "functionWithName:", v12);
  [v6 setTimingFunction:v13];

  [v6 setDuration:*(double *)(a1 + 64)];
  v14 = objc_alloc_init(&OBJC_CLASS___CAAnimationDelegateBlockHelper);
  [v6 setDelegate:v14];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = ___FadeLayerThruBlack_block_invoke_3;
  v17[3] = &unk_189F2FFE8;
  id v18 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 48);
  -[CAAnimationDelegateBlockHelper setAnimationDidStopBlock:](v14, "setAnimationDidStopBlock:", v17);
  uint64_t v15 = 32LL;
  if (*(_BYTE *)(a1 + 72))
  {
    v16 = @"fadeInTarget";
  }

  else
  {
    uint64_t v15 = 40LL;
    v16 = @"fadeOutBlack";
  }

  [*(id *)(a1 + v15) addAnimation:v6 forKey:v16];
}

void ___FadeLayerThruBlack_block_invoke_3(uint64_t a1)
{
  double v2 = *(void **)(a1 + 48);
  if (v2)
  {
    int v3 = *(dispatch_queue_s **)(a1 + 40);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = ___FadeLayerThruBlack_block_invoke_4;
    block[3] = &unk_189F34300;
    id v5 = v2;
    dispatch_async(v3, block);
  }

uint64_t ___FadeLayerThruBlack_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end