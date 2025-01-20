@interface SATimerSet
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
@end

@implementation SATimerSet

- (id)_ad_timerRequestRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___AFSetTimerRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATimerSet timer](self, "timer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_ad_timerWithState:", 1));
  -[AFSetTimerRequest setTimer:](v3, "setTimer:", v5);

  return v3;
}

- (id)_ad_timerResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0) {
    id v6 = objc_alloc_init(&OBJC_CLASS___SATimerSetCompleted);
  }
  else {
    id v6 = 0LL;
  }
  return v6;
}

@end