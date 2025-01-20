@interface SAAlarmSleepAlarm
- (id)_ad_alarm;
- (void)_ad_setAlarm:(id)a3;
@end

@implementation SAAlarmSleepAlarm

- (id)_ad_alarm
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SAAlarmSleepAlarm;
  id v2 = -[SAAlarmSleepAlarm _ad_alarm](&v4, "_ad_alarm");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)_ad_setAlarm:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v6 = sub_10022AC38(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[SAAlarmSleepAlarm setIdentifier:](self, "setIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isEnabled]));
  -[SAAlarmSleepAlarm setEnabled:](self, "setEnabled:", v8);

  v9 = sub_10022B378((uint64_t)[v4 daysOfWeek]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[SAAlarmSleepAlarm setFrequency:](self, "setFrequency:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 hourOfDay]));
  -[SAAlarmSleepAlarm setHour:](self, "setHour:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 minuteOfHour]));
  -[SAAlarmSleepAlarm setMinute:](self, "setMinute:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 label]);
  -[SAAlarmSleepAlarm setLabel:](self, "setLabel:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isOverrideAlarm]));
  -[SAAlarmSleepAlarm setIsOverride:](self, "setIsOverride:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 bedtimeHour]));
  -[SAAlarmSleepAlarm setBedtimeHour:](self, "setBedtimeHour:", v15);

  id v16 = [v4 bedtimeMinute];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
  -[SAAlarmSleepAlarm setBedtimeMinute:](self, "setBedtimeMinute:", v17);

  -[SAAlarmSleepAlarm setIsFiringNext:](self, "setIsFiringNext:", &__kCFBooleanFalse);
}

@end