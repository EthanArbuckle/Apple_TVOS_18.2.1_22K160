@interface SAHLSetWorkoutState
- (id)_ad_transformedWorkoutRequest;
- (id)_ad_transformedWorkoutSuccessResponse;
@end

@implementation SAHLSetWorkoutState

- (id)_ad_transformedWorkoutRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAHLSetWorkoutState targetWorkoutState](self, "targetWorkoutState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 workoutStateValue]);

  if ([v3 isEqualToString:SAHLWorkoutStateWorkoutStateValueActiveValue])
  {
    uint64_t v4 = 0LL;
  }

  else if ([v3 isEqualToString:SAHLWorkoutStateWorkoutStateValuePausedValue])
  {
    uint64_t v4 = 1LL;
  }

  else
  {
    [v3 isEqualToString:SAHLWorkoutStateWorkoutStateValueStoppedValue];
    uint64_t v4 = 2LL;
  }

  id v5 = [[STWorkoutSetStateRequest alloc] _initWithState:v4];

  return v5;
}

- (id)_ad_transformedWorkoutSuccessResponse
{
  return objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
}

@end