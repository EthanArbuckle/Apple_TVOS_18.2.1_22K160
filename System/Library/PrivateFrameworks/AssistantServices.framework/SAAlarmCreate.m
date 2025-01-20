@interface SAAlarmCreate
- (id)_ad_alarmResponseForResponse:(id)a3;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmCreate

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  v7 = objc_alloc_init(&OBJC_CLASS___AFCreateAlarmRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmCreate alarmToCreate](self, "alarmToCreate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_ad_alarm"));
  -[AFCreateAlarmRequest setAlarm:](v7, "setAlarm:", v6);

  v4[2](v4, v7);
}

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFCreateAlarmResponse);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___SAAlarmCreateCompleted);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 alarmIdentifier]);
    v7 = sub_10022AC38(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v5 setAlarmId:v8];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

@end