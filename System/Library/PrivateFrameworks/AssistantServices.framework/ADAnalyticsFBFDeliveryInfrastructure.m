@interface ADAnalyticsFBFDeliveryInfrastructure
- (void)_deliverSerializedWrapper:(id)a3;
- (void)deliverLogViewerIdentifier:(id)a3;
- (void)deliverWrappedEvent:(id)a3;
- (void)deliverWrappedEvents:(id)a3;
@end

@implementation ADAnalyticsFBFDeliveryInfrastructure

- (void)deliverLogViewerIdentifier:(id)a3
{
  id v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v4 = [v3 longLivedIdentifierUploadingEnabled];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FLLogger sharedLogger](&OBJC_CLASS___FLLogger, "sharedLogger"));
  if (v4) {
    id v6 = v7;
  }
  else {
    id v6 = 0LL;
  }
  [v5 setValue:v6 forUploadHeaderNamed:@"userId"];
}

- (void)deliverWrappedEvent:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 data]);
  -[ADAnalyticsFBFDeliveryInfrastructure _deliverSerializedWrapper:](self, "_deliverSerializedWrapper:", v4);
}

- (void)deliverWrappedEvents:(id)a3
{
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[ADAnalyticsFBFDeliveryInfrastructure deliverWrappedEvent:]( self,  "deliverWrappedEvent:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void)_deliverSerializedWrapper:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[FLLogger sharedLogger](&OBJC_CLASS___FLLogger, "sharedLogger"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SiriAnalyticsOffDeviceTopics unordered](&OBJC_CLASS___SiriAnalyticsOffDeviceTopics, "unordered"));
    [v5 report:v3 application:v4];
  }

@end