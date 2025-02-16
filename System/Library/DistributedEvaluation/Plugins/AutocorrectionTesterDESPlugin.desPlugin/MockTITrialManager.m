@interface MockTITrialManager
- (id)encodedCATrialParametersForLocale:(id)a3;
- (id)encodedLMTrialParametersForLocale:(id)a3;
- (id)favoniusLanguagePowerOverrideForLocale:(id)a3;
- (id)inlineCompletionOperatingPointOverrideForLocale:(id)a3;
- (id)inputTranscoderAssetsDirectoryURLForLocale:(id)a3;
- (id)isNegativeLearningEnabledForLocale:(id)a3;
- (id)updateCallback;
- (void)setUpdateCallback:(id)a3;
@end

@implementation MockTITrialManager

- (id)encodedLMTrialParametersForLocale:(id)a3
{
  return 0LL;
}

- (id)encodedCATrialParametersForLocale:(id)a3
{
  return 0LL;
}

- (id)inputTranscoderAssetsDirectoryURLForLocale:(id)a3
{
  return 0LL;
}

- (id)isNegativeLearningEnabledForLocale:(id)a3
{
  return 0LL;
}

- (id)inlineCompletionOperatingPointOverrideForLocale:(id)a3
{
  return 0LL;
}

- (id)favoniusLanguagePowerOverrideForLocale:(id)a3
{
  return 0LL;
}

- (id)updateCallback
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUpdateCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end