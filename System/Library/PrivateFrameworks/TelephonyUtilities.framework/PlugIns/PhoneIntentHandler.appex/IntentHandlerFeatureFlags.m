@interface IntentHandlerFeatureFlags
- (BOOL)crrFullRecommendation;
- (BOOL)crrHandleRecommendation;
- (BOOL)emergencyServicesOverrideEnabled;
- (BOOL)faceTimeInvitationEnabled;
- (BOOL)faceTimeNoFanOutEnabled;
- (BOOL)vmdEnabled;
@end

@implementation IntentHandlerFeatureFlags

- (BOOL)faceTimeNoFanOutEnabled
{
  int v2 = _os_feature_enabled_impl("SiriPhone", "FaceTimeNoFanOut");
  id v3 = IntentHandlerDefaultLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v2) {
      v5 = @"YES";
    }
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SiriPhone/FaceTimeNoFanOut: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  return v2;
}

- (BOOL)crrFullRecommendation
{
  int v2 = _os_feature_enabled_impl("SiriPhone", "CRRFullRecommendation");
  id v3 = IntentHandlerDefaultLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v2) {
      v5 = @"YES";
    }
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SiriPhone/CRRFullRecommendation: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  return v2;
}

- (BOOL)crrHandleRecommendation
{
  int v2 = _os_feature_enabled_impl("SiriPhone", "CRRHandleRecommendation");
  id v3 = IntentHandlerDefaultLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v2) {
      v5 = @"YES";
    }
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SiriPhone/crrHandleRecommendation: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  return v2;
}

- (BOOL)faceTimeInvitationEnabled
{
  int v2 = _os_feature_enabled_impl("SiriPhone", "FaceTimeInvitation");
  id v3 = IntentHandlerDefaultLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v2) {
      v5 = @"YES";
    }
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SiriPhone/FaceTimeInvitation: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  return v2;
}

- (BOOL)emergencyServicesOverrideEnabled
{
  int v2 = _os_feature_enabled_impl("SiriPhone", "emergencyServicesOverrideEnabled");
  int v3 = v2 & _TUIsInternalInstall();
  id v4 = IntentHandlerDefaultLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"NO";
    if (v3) {
      v6 = @"YES";
    }
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SiriPhone/emergencyServicesOverrideEnabled AND isInternalBuild: %{public}@",  (uint8_t *)&v8,  0xCu);
  }

  return v3;
}

- (BOOL)vmdEnabled
{
  int v2 = _os_feature_enabled_impl("SiriPhone", "VisualVoicemail");
  id v3 = IntentHandlerDefaultLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v2) {
      v5 = @"YES";
    }
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SiriPhone/VisualVoicemail: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  return v2;
}

@end