@interface SRErrorUtility
+ (id)_localizedErrorString:(id)a3;
+ (id)userStringForError:(id)a3 reflectionDialogWasPlayed:(BOOL)a4;
+ (int64_t)_getUpdatedErrorCount;
+ (void)_logDummyAssistantUtteranceViewWithDialogIdentifier:(id)a3;
+ (void)resetErrorState;
@end

@implementation SRErrorUtility

+ (id)userStringForError:(id)a3 reflectionDialogWasPlayed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  unsigned int v8 = [v7 isEqualToString:kAFAssistantErrorDomain];

  if (v8)
  {
    id v9 = [v6 code];
    v10 = @"clientGenerated#TryAgain";
    v11 = @"ASSISTANT_TRY_AGAIN";
    switch((unint64_t)v9)
    {
      case 0uLL:
      case 3uLL:
      case 7uLL:
        goto LABEL_22;
      case 1uLL:
      case 2uLL:
      case 4uLL:
        goto LABEL_7;
      case 5uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
        goto LABEL_18;
      case 6uLL:
        v11 = 0LL;
        v10 = @"clientGenerated#NotReady";
        goto LABEL_22;
      case 0xEuLL:
        v10 = @"clientGenerated#ConnectionFailed3";
        v11 = @"ASSISTANT_CONNECTION_FAILED_3";
        goto LABEL_22;
      default:
        if (v9 == (id)300) {
          goto LABEL_22;
        }
        if (v9 == (id)2001)
        {
LABEL_7:
          if (v4 && [v6 code] == (id)4)
          {
            v10 = @"clientGenerated#TimeoutAfterDelayInterstitials";
            v11 = @"ASSISTANT_TIMEOUT_ERROR_AFTER_DELAY_INTERSTITIAL";
          }

          else
          {
            id v13 = [a1 _getUpdatedErrorCount];
            v14 = @"clientGenerated#ConnectionFailed2";
            v15 = @"ASSISTANT_CONNECTION_FAILED_2";
            if (v13 == (id)1)
            {
              v15 = @"ASSISTANT_CONNECTION_FAILED_1";
              v14 = @"clientGenerated#ConnectionFailed1";
            }

            if (v13) {
              v11 = v15;
            }
            else {
              v11 = @"ASSISTANT_CONNECTION_FAILED_0";
            }
            if (v13) {
              v10 = v14;
            }
            else {
              v10 = @"clientGenerated#ConnectionFailed0";
            }
          }

+ (void)resetErrorState
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SiriUIPreferences sharedPreferences](&OBJC_CLASS___SiriUIPreferences, "sharedPreferences"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  [v3 setPreviousSiriRequestErrorTimestamp:v2];
}

+ (int64_t)_getUpdatedErrorCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIPreferences sharedPreferences](&OBJC_CLASS___SiriUIPreferences, "sharedPreferences"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 previousSiriRequestErrorTimestamp]);
  id v4 = [v2 siriRequestErrorCount];
  [v3 timeIntervalSinceNow];
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  if (v5 <= 480.0) {
    int64_t v6 = (int64_t)v4 + 1;
  }
  else {
    int64_t v6 = 0LL;
  }
  [v2 setSiriRequestErrorCount:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v2 setPreviousSiriRequestErrorTimestamp:v7];

  return v6;
}

+ (id)_localizedErrorString:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int64_t v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1, v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assistantUILocalizedStringForKey:v4 table:0]);
  }

  else
  {
    unsigned int v8 = 0LL;
  }

  return v8;
}

+ (void)_logDummyAssistantUtteranceViewWithDialogIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  id v9 = @"dialogIdentifier";
  id v10 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  [v4 logEventWithType:1429 context:v5];

  id v6 = objc_alloc_init(&OBJC_CLASS___SAUIAssistantUtteranceView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  [v6 setAceId:v8];

  [v6 setDialogIdentifier:v3];
  [v4 logClientFeedbackPresented:v6];
}

@end