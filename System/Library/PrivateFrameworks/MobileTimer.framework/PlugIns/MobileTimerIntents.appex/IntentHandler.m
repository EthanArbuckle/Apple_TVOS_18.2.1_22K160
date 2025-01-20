@interface IntentHandler
- (IntentHandler)init;
- (MTAlarmManager)alarmManager;
- (id)handlerForIntent:(id)a3;
- (void)setAlarmManager:(id)a3;
@end

@implementation IntentHandler

- (IntentHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IntentHandler;
  v2 = -[IntentHandler init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___MTAlarmManager);
    alarmManager = v2->_alarmManager;
    v2->_alarmManager = v3;
  }

  return v2;
}

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTCreateAlarmIntent);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    objc_super v6 = (objc_class *)&OBJC_CLASS___MTCreateAlarmIntentHandler;
LABEL_9:
    id v11 = objc_alloc(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler alarmManager](self, "alarmManager"));
    id v13 = [v11 initWithAlarmManager:v12];

    goto LABEL_10;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MTUpdateAlarmIntent);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    objc_super v6 = (objc_class *)&OBJC_CLASS___MTUpdateAlarmIntentHandler;
    goto LABEL_9;
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MTEnableAlarmIntent);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0
    || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___MTDisableAlarmIntent), (objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___MTToggleAlarmIntent), (objc_opt_isKindOfClass(v4, v10) & 1) != 0))
  {
    objc_super v6 = (objc_class *)&OBJC_CLASS___MTToggleAlarmIntentHandler;
    goto LABEL_9;
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___MTGetAlarmsIntent);
  if ((objc_opt_isKindOfClass(v4, v15) & 1) != 0)
  {
    objc_super v6 = (objc_class *)&OBJC_CLASS___MTGetAlarmsIntentHandler;
    goto LABEL_9;
  }

  uint64_t v16 = objc_opt_class(&OBJC_CLASS___ClocksIntent);
  if ((objc_opt_isKindOfClass(v4, v16) & 1) != 0)
  {
    v17 = &OBJC_CLASS___ClocksIntentHandler;
  }

  else
  {
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___ClocksSingleIntent);
    if ((objc_opt_isKindOfClass(v4, v18) & 1) != 0)
    {
      v17 = &OBJC_CLASS___ClocksSingleIntentHandler;
    }

    else
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___INCreateTimerIntent);
      if ((objc_opt_isKindOfClass(v4, v19) & 1) == 0)
      {
        id v13 = 0LL;
        goto LABEL_10;
      }

      v17 = (__objc2_class *)&OBJC_CLASS___MTCreateSingleTimerIntentHandler;
    }
  }

  id v13 = objc_alloc_init(v17);
LABEL_10:

  return v13;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end