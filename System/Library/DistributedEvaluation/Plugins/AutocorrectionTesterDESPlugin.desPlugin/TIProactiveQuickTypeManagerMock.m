@interface TIProactiveQuickTypeManagerMock
- (BOOL)isAutoCompleteEnabled;
- (BOOL)isAutoPopupEnabled;
- (BOOL)isEnabled;
- (BOOL)usePQT2Flow;
- (NSDictionary)metrics;
- (TIProactiveQuickTypeManagerMock)init;
- (id)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6;
- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14;
- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14;
- (id)getMeCardEmailAddresses;
- (id)searchForMeCardEmailAddresses;
- (id)searchForMeCardRegions;
- (void)generateAndRenderProactiveSuggestionsForInput:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withIsResponseDenyListed:(BOOL)a13 withShouldDisableAutoCaps:(BOOL)a14 withAvailableApps:(id)a15 logBlock:(id)a16 async:(BOOL)a17 completion:(id)a18;
- (void)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6 async:(BOOL)a7 completion:(id)a8;
- (void)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14 async:(BOOL)a15 completion:(id)a16;
- (void)propogateMetrics:(id)a3 data:(id)a4;
- (void)setMetrics:(id)a3;
@end

@implementation TIProactiveQuickTypeManagerMock

- (TIProactiveQuickTypeManagerMock)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TIProactiveQuickTypeManagerMock;
  v2 = -[TIProactiveQuickTypeManagerMock init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    metrics = v2->_metrics;
    v2->_metrics = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v33 = a5;
  id v21 = a6;
  id v32 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a13;
  id v27 = a14;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = sub_2B4B8;
  v40 = sub_2B4C8;
  id v41 = 0LL;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_2B4D0;
  v35[3] = &unk_891D0;
  v35[4] = &v36;
  LOBYTE(v31) = 0;
  LOBYTE(v30) = a12;
  -[TIProactiveQuickTypeManagerMock generateAndRenderProactiveSuggestionsWithTriggers:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:isContinuousPath:withAvailableApps:logBlock:async:completion:]( self,  "generateAndRenderProactiveSuggestionsWithTriggers:withKeyboardState:withAdditionalPredictions:withSecureCandidateRen derer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:isContinuousPath:withAvailableApps:logBloc k:async:completion:",  v19,  v20,  v33,  v21,  v32,  v22,  v23,  v24,  v25,  v30,  v26,  v27,  v31,  v35);
  id v28 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  return v28;
}

- (void)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14 async:(BOOL)a15 completion:(id)a16
{
  id v21 = (void (**)(id, NSMutableArray *))a16;
  v17 = (char *)[a3 count];
  if (v17)
  {
    v18 = v17;
    id v19 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v17);
    do
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardCandidateSingle secureCandidateForInput:slotID:]( &OBJC_CLASS___TIKeyboardCandidateSingle,  "secureCandidateForInput:slotID:",  &stru_89E80,  100LL));
      -[NSMutableArray addObject:](v19, "addObject:", v20);

      --v18;
    }

    while (v18);
  }

  else
  {
    id v19 = 0LL;
  }

  v21[2](v21, v19);
}

- (id)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6
{
  return 0LL;
}

- (void)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6 async:(BOOL)a7 completion:(id)a8
{
}

- (void)generateAndRenderProactiveSuggestionsForInput:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withIsResponseDenyListed:(BOOL)a13 withShouldDisableAutoCaps:(BOOL)a14 withAvailableApps:(id)a15 logBlock:(id)a16 async:(BOOL)a17 completion:(id)a18
{
  id v19 = (void (**)(id, void *))a18;
  id v20 = a8;
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  &off_90430,  &off_90448));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 componentsSeparatedByCharactersInSet:v22]);

  id v27 = (id)objc_claimAutoreleasedReturnValue([v23 lastObject]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v27]);
  if (v24)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardCandidateSingle secureCandidateForInput:slotID:]( &OBJC_CLASS___TIKeyboardCandidateSingle,  "secureCandidateForInput:slotID:",  v24,  100LL));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v26 addObject:v25];
  }

  else
  {
    id v26 = 0LL;
  }

  v19[2](v19, v26);
}

- (BOOL)isEnabled
{
  return 1;
}

- (BOOL)isAutoPopupEnabled
{
  return 1;
}

- (BOOL)isAutoCompleteEnabled
{
  return 1;
}

- (BOOL)usePQT2Flow
{
  return 1;
}

- (id)getMeCardEmailAddresses
{
  return &__NSArray0__struct;
}

- (void)propogateMetrics:(id)a3 data:(id)a4
{
}

- (id)searchForMeCardEmailAddresses
{
  return &__NSArray0__struct;
}

- (id)searchForMeCardRegions
{
  return &__NSArray0__struct;
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14
{
  return &__NSArray0__struct;
}

- (NSDictionary)metrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end