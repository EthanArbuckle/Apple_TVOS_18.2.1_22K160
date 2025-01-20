@interface SASFinishSpeech
- (void)ad_setAFEndpointMode:(int64_t)a3;
- (void)ad_setCSEndpointerMetrics:(id)a3;
- (void)af_logDiagnostics;
@end

@implementation SASFinishSpeech

- (void)af_logDiagnostics
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AFDiagnostics sharedDiagnostics](&OBJC_CLASS___AFDiagnostics, "sharedDiagnostics"));
  [v2 logVoiceSendEnd];
}

- (void)ad_setAFEndpointMode:(int64_t)a3
{
  else {
    id v4 = *(id *)*(&off_1004FD2A0 + a3 - 1);
  }
  id v5 = v4;
  -[SASFinishSpeech setEndpoint:](self, "setEndpoint:", v4);
}

- (void)ad_setCSEndpointerMetrics:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 featuresAtEndpoint]);
    -[SASFinishSpeech setFeaturesAtEndpoint:](self, "setFeaturesAtEndpoint:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 asrFeatureLatencyDistribution]);
    -[SASFinishSpeech setServerFeatureLatencyDistribution:](self, "setServerFeatureLatencyDistribution:", v6);

    [v4 totalAudioRecorded];
    double v8 = v7;

    -[SASFinishSpeech setTotalAudioRecorded:](self, "setTotalAudioRecorded:", v8);
  }

@end