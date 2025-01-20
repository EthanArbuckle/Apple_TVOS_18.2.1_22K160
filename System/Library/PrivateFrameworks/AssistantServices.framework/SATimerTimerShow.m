@interface SATimerTimerShow
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
@end

@implementation SATimerTimerShow

- (id)_ad_timerRequestRepresentation
{
  return objc_alloc_init(&OBJC_CLASS___AFShowTimerRequest);
}

- (id)_ad_timerResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0) {
    v6 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
  }
  else {
    v6 = 0LL;
  }
  return v6;
}

@end