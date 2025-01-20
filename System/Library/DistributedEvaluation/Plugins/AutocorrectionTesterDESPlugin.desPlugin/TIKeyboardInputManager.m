@interface TIKeyboardInputManager
+ (void)swizzleTestingParameters;
- (id)mockTestingParameters;
@end

@implementation TIKeyboardInputManager

- (id)mockTestingParameters
{
  v3[0] = @"trialExperimentId";
  v3[1] = @"trialTreatmentId";
  v4[0] = @"mockMockTrialExperimentIdValue";
  v4[1] = @"mockMockTrialTreatmentIdValue";
  v3[2] = @"trialSubjectId";
  v3[3] = @"trialTrackingId";
  v4[2] = @"mockTtrialSubjectIdValue";
  v4[3] = @"mockMockTrialTrackingIdValue";
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

+ (void)swizzleTestingParameters
{
  if (qword_AA340 != -1) {
    dispatch_once(&qword_AA340, &stru_88F48);
  }
}

@end