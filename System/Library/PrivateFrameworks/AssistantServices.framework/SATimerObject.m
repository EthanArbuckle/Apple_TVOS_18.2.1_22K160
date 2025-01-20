@interface SATimerObject
- (id)_ad_timer;
- (id)_ad_timerWithState:(int64_t)a3;
- (void)_ad_setTimer:(id)a3;
@end

@implementation SATimerObject

- (id)_ad_timerWithState:(int64_t)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___STTimer);
  [v5 setState:a3];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATimerObject timerValue](self, "timerValue"));
  [v5 setValue:v6];

  return v5;
}

- (id)_ad_timer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATimerObject state](self, "state"));
  if ([v3 isEqualToString:SATimerStatePausedValue])
  {
    uint64_t v4 = 3LL;
  }

  else if ([v3 isEqualToString:SATimerStateRunningValue])
  {
    uint64_t v4 = 1LL;
  }

  else
  {
    [v3 isEqualToString:SATimerStateStoppedValue];
    uint64_t v4 = 2LL;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATimerObject _ad_timerWithState:](self, "_ad_timerWithState:", v4));

  return v5;
}

- (void)_ad_setTimer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 state];
  else {
    id v6 = *(id *)*(&off_1004EEA90 + (void)v5);
  }
  id v8 = v6;
  -[SATimerObject setState:](self, "setState:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);

  -[SATimerObject setTimerValue:](self, "setTimerValue:", v7);
}

@end