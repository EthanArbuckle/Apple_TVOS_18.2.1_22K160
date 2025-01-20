@interface SATimerPause
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
@end

@implementation SATimerPause

- (id)_ad_timerRequestRepresentation
{
  v2 = objc_alloc_init(&OBJC_CLASS___AFSetTimerRequest);
  id v3 = objc_alloc_init(&OBJC_CLASS___STTimer);
  [v3 setState:3];
  -[AFSetTimerRequest setTimer:](v2, "setTimer:", v3);

  return v2;
}

- (id)_ad_timerResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0) {
    id v6 = objc_alloc_init(&OBJC_CLASS___SATimerPauseCompleted);
  }
  else {
    id v6 = 0LL;
  }
  return v6;
}

@end