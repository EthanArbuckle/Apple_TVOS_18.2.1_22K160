@interface ADSiriAnalyticsOnDeviceDigestProvider
+ (id)createOnDeviceDigestEvent;
+ (unsigned)_fetchLatestDaysWithTwoAssistantSpeechRequestsPerWeek;
@end

@implementation ADSiriAnalyticsOnDeviceDigestProvider

+ (id)createOnDeviceDigestEvent
{
  id v3 = objc_alloc_init(&OBJC_CLASS___DIMSchemaDIMOnDeviceDigest);
  objc_msgSend( v3,  "setDaysWithTwoAssistantSpeechRequestsPerWeek:",  objc_msgSend(a1, "_fetchLatestDaysWithTwoAssistantSpeechRequestsPerWeek"));
  id v4 = objc_alloc_init(&OBJC_CLASS___DIMSchemaDIMClientEvent);
  [v4 setOnDeviceDigest:v3];

  return v4;
}

+ (unsigned)_fetchLatestDaysWithTwoAssistantSpeechRequestsPerWeek
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = 0;
  uint64_t v2 = BiomeLibrary(a1, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 Siri]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 Metrics]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 OnDeviceDigestSegmentsCohorts]);

  id v7 = [[BMPublisherOptions alloc] initWithStartDate:0 endDate:0 maxEvents:1 lastN:0 reversed:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 publisherWithOptions:v7]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10017AFDC;
  v11[3] = &unk_1004F6088;
  v11[4] = &v12;
  id v9 = [v8 sinkWithCompletion:&stru_1004F3CE0 receiveInput:v11];
  LODWORD(v5) = *((_DWORD *)v13 + 6);

  _Block_object_dispose(&v12, 8);
  return v5;
}

@end