@interface IntentHandlerCoreAnalyticsLogger
- (void)logSiriMatchEvent:(id)a3 matchesByIdCount:(id)a4 matchesByNameCount:(id)a5 siriLocale:(id)a6;
@end

@implementation IntentHandlerCoreAnalyticsLogger

- (void)logSiriMatchEvent:(id)a3 matchesByIdCount:(id)a4 matchesByNameCount:(id)a5 siriLocale:(id)a6
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000A7C8;
  v13[3] = &unk_1000346E0;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v9 = v17;
  id v10 = v16;
  id v11 = v15;
  id v12 = v14;
  AnalyticsSendEventLazy(@"com.apple.siri.phone.IntentHandler.StartCall.ResolveContacts.SiriMatches", v13);
}

@end