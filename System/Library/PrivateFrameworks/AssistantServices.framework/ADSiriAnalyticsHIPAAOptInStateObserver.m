@interface ADSiriAnalyticsHIPAAOptInStateObserver
- (ADSiriAnalyticsHIPAAOptInStateObserver)initWithDelegate:(id)a3 queue:(id)a4;
- (void)pollConditionStateWithCompletion:(id)a3;
@end

@implementation ADSiriAnalyticsHIPAAOptInStateObserver

- (ADSiriAnalyticsHIPAAOptInStateObserver)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADSiriAnalyticsHIPAAOptInStateObserver;
  v8 = -[ADSiriAnalyticsHIPAAOptInStateObserver init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (void)pollConditionStateWithCompletion:(id)a3
{
  id v9 = a3;
  uint64_t v4 = mach_absolute_time();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v6 = [v5 isDictationHIPAACompliant];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sensitiveCondition:1 startedAt:v4];
  }

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }
}

- (void).cxx_destruct
{
}

@end