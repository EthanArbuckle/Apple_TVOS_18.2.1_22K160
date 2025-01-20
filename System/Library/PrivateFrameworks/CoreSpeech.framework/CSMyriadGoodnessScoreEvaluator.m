@interface CSMyriadGoodnessScoreEvaluator
- (AFInstanceContext)instanceContext;
- (AFMyriadGoodnessScoreEvaluator)gEvaluator;
- (AFNotifyObserver)myriadLossObserver;
- (AFNotifyObserver)myriadWinObserver;
- (CSMyriadGoodnessScoreEvaluator)initWithInstanceContext:(id)a3;
- (OS_dispatch_queue)queue;
- (SCDAGoodnessScoreEvaluator)gEvaluatorV2;
- (double)bumpForGoodnessScoreContext:(id)a3;
- (double)bumpSCDAForGoodnessScoreContext:(id)a3;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)preheat;
- (void)setGEvaluator:(id)a3;
- (void)setGEvaluatorV2:(id)a3;
- (void)setInstanceContext:(id)a3;
- (void)setMyriadLossObserver:(id)a3;
- (void)setMyriadWinObserver:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSMyriadGoodnessScoreEvaluator

- (CSMyriadGoodnessScoreEvaluator)initWithInstanceContext:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CSMyriadGoodnessScoreEvaluator;
  v6 = -[CSMyriadGoodnessScoreEvaluator init](&v21, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_instanceContext, a3);
    dispatch_queue_t v8 = dispatch_queue_create("CSMyriadGoodnessScoreEvaluator", 0LL);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    id v10 = [[AFPreferences alloc] initWithInstanceContext:v7->_instanceContext];
    if (+[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework"))
    {
      v11 = -[SCDAGoodnessScoreEvaluator initWithDeviceInstanceContext:preferences:queue:]( objc_alloc(&OBJC_CLASS___SCDAGoodnessScoreEvaluator),  "initWithDeviceInstanceContext:preferences:queue:",  v5,  v10,  v7->_queue);
      gEvaluatorV2 = v7->_gEvaluatorV2;
      v7->_gEvaluatorV2 = v11;
    }

    else
    {
      v13 = -[AFMyriadGoodnessScoreEvaluator initWithDeviceInstanceContext:preferences:queue:]( objc_alloc(&OBJC_CLASS___AFMyriadGoodnessScoreEvaluator),  "initWithDeviceInstanceContext:preferences:queue:",  v5,  v10,  v7->_queue);
      gEvaluatorV2 = v7->_gEvaluator;
      v7->_gEvaluator = v13;
    }

    uint64_t v14 = AFElectionWinNotifyStateObserver(v7->_instanceContext, 1LL, v7, v7->_queue);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    myriadWinObserver = v7->_myriadWinObserver;
    v7->_myriadWinObserver = (AFNotifyObserver *)v15;

    uint64_t v17 = AFElectionLossNotifyStateObserver(v7->_instanceContext, 1LL, v7, v7->_queue);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    myriadLossObserver = v7->_myriadLossObserver;
    v7->_myriadLossObserver = (AFNotifyObserver *)v18;
  }

  return v7;
}

- (void)preheat
{
}

- (double)bumpForGoodnessScoreContext:(id)a3
{
  v3 = self;
  gEvaluator = self->_gEvaluator;
  id v5 = a3;
  -[AFMyriadGoodnessScoreEvaluator preheat](gEvaluator, "preheat");
  LODWORD(v3) = -[AFMyriadGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]( v3->_gEvaluator,  "getMyriadAdjustedBoostForGoodnessScoreContext:",  v5);

  return (double)v3;
}

- (double)bumpSCDAForGoodnessScoreContext:(id)a3
{
  v3 = self;
  gEvaluator = self->_gEvaluator;
  id v5 = a3;
  -[AFMyriadGoodnessScoreEvaluator preheat](gEvaluator, "preheat");
  LODWORD(v3) = -[SCDAGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]( v3->_gEvaluatorV2,  "getMyriadAdjustedBoostForGoodnessScoreContext:",  v5);

  return (double)v3;
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  id v5 = (AFNotifyObserver *)a3;
  if (self->_myriadWinObserver == v5)
  {
    v9 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v7 systemUptime];
    double v6 = v8;

    goto LABEL_5;
  }

  if (self->_myriadLossObserver == v5)
  {
    v9 = v5;
    double v6 = 0.0;
LABEL_5:
    -[AFMyriadGoodnessScoreEvaluator setLastActivationTime:](self->_gEvaluator, "setLastActivationTime:", v6);
    id v5 = v9;
  }
}

- (AFInstanceContext)instanceContext
{
  return self->_instanceContext;
}

- (void)setInstanceContext:(id)a3
{
}

- (AFMyriadGoodnessScoreEvaluator)gEvaluator
{
  return self->_gEvaluator;
}

- (void)setGEvaluator:(id)a3
{
}

- (SCDAGoodnessScoreEvaluator)gEvaluatorV2
{
  return self->_gEvaluatorV2;
}

- (void)setGEvaluatorV2:(id)a3
{
}

- (AFNotifyObserver)myriadWinObserver
{
  return self->_myriadWinObserver;
}

- (void)setMyriadWinObserver:(id)a3
{
}

- (AFNotifyObserver)myriadLossObserver
{
  return self->_myriadLossObserver;
}

- (void)setMyriadLossObserver:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end