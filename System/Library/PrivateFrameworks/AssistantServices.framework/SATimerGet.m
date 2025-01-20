@interface SATimerGet
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
@end

@implementation SATimerGet

- (id)_ad_timerRequestRepresentation
{
  return objc_alloc_init(&OBJC_CLASS___AFGetTimerRequest);
}

- (id)_ad_timerResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFGetTimerResponse);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___SATimerGetCompleted);
    v6 = objc_alloc_init(&OBJC_CLASS___SATimerObject);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 timer]);
    -[SATimerObject _ad_setTimer:](v6, "_ad_setTimer:", v7);

    [v5 setTimer:v6];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

@end