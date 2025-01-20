@interface SiriTVFeatures
+ (BOOL)infoRFEnabled;
+ (BOOL)stateFeedbackEnabled;
@end

@implementation SiriTVFeatures

+ (BOOL)stateFeedbackEnabled
{
  return _os_feature_enabled_impl("Siri", "siri_state_feedback");
}

+ (BOOL)infoRFEnabled
{
  return _os_feature_enabled_impl("SiriTV", "atv_knowledge");
}

@end