@interface SAAlarmObject
- (id)_ad_alarm;
- (void)_ad_setAlarm:(id)a3;
@end

@implementation SAAlarmObject

- (id)_ad_alarm
{
  v3 = objc_alloc_init(&OBJC_CLASS___STAlarm);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmObject identifier](self, "identifier"));
  id v5 = sub_10022AD80(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[STAlarm setIdentifier:](v3, "setIdentifier:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmObject enabled](self, "enabled"));
  -[STAlarm setEnabled:](v3, "setEnabled:", [v7 BOOLValue]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmObject frequency](self, "frequency"));
  -[STAlarm setDaysOfWeek:](v3, "setDaysOfWeek:", sub_10022A6CC(v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmObject hour](self, "hour"));
  -[STAlarm setHourOfDay:](v3, "setHourOfDay:", [v9 integerValue]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmObject minute](self, "minute"));
  -[STAlarm setMinuteOfHour:](v3, "setMinuteOfHour:", [v10 integerValue]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmObject label](self, "label"));
  -[STAlarm setLabel:](v3, "setLabel:", v11);

  return v3;
}

- (void)_ad_setAlarm:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v6 = sub_10022AC38(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[SAAlarmObject setIdentifier:](self, "setIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isEnabled]));
  -[SAAlarmObject setEnabled:](self, "setEnabled:", v8);

  v9 = sub_10022B378((uint64_t)[v4 daysOfWeek]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[SAAlarmObject setFrequency:](self, "setFrequency:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 hourOfDay]));
  -[SAAlarmObject setHour:](self, "setHour:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 minuteOfHour]));
  -[SAAlarmObject setMinute:](self, "setMinute:", v12);

  id v13 = (id)objc_claimAutoreleasedReturnValue([v4 label]);
  -[SAAlarmObject setLabel:](self, "setLabel:", v13);
}

@end