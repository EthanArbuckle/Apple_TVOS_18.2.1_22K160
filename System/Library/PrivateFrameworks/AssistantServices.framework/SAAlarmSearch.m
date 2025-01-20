@interface SAAlarmSearch
- (id)_ad_alarmResponseForResponse:(id)a3;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmSearch

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  v22 = objc_alloc_init(&OBJC_CLASS___AFSearchAlarmsRequest);
  v5 = objc_alloc_init(&OBJC_CLASS___STAlarm);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmSearch enabled](self, "enabled"));
  v7 = v6;
  if (v6)
  {
    -[STAlarm setEnabled:](v5, "setEnabled:", [v6 BOOLValue]);
    uint64_t v8 = 2LL;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmSearch hour](self, "hour"));
  v10 = v9;
  if (v9)
  {
    v8 |= 8uLL;
    -[STAlarm setHourOfDay:](v5, "setHourOfDay:", [v9 integerValue]);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmSearch minute](self, "minute"));
  v12 = v11;
  if (v11)
  {
    v8 |= 0x10uLL;
    -[STAlarm setMinuteOfHour:](v5, "setMinuteOfHour:", [v11 integerValue]);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmSearch identifier](self, "identifier"));
  v14 = v13;
  if (v13)
  {
    v8 |= 1uLL;
    id v15 = sub_10022AD80(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[STAlarm setIdentifier:](v5, "setIdentifier:", v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmSearch frequency](self, "frequency"));
  v18 = v17;
  if (v17)
  {
    v8 |= 4uLL;
    -[STAlarm setDaysOfWeek:](v5, "setDaysOfWeek:", sub_10022A6CC(v17));
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmSearch label](self, "label"));
  if (v19)
  {
    v8 |= 0x20uLL;
    -[STAlarm setLabel:](v5, "setLabel:", v19);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmSearch includesSleepAlarms](self, "includesSleepAlarms"));
  v21 = v20;
  if (v20 && [v20 BOOLValue])
  {
    v8 |= 0x40uLL;
    -[STAlarm setSleepAlarm:](v5, "setSleepAlarm:", [v21 BOOLValue]);
  }

  -[AFSearchAlarmsRequest setOptions:](v22, "setOptions:", v8);
  -[AFSearchAlarmsRequest setCriteria:](v22, "setCriteria:", v5);
  v4[2](v4, v22);
}

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFSearchAlarmsResponse);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___SAAlarmSearchCompleted);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 results]);
    v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          else {
            v13 = (Class *)&OBJC_CLASS___SAAlarmObject_ptr;
          }
          id v14 = objc_alloc_init(*v13);
          objc_msgSend(v14, "_ad_setAlarm:", v12);
          -[NSMutableArray addObject:](v6, "addObject:", v14);
        }

        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v9);
    }

    id v15 = v17;
    [v17 setResults:v6];
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

@end