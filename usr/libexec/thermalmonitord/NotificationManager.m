@interface NotificationManager
- (BOOL)includeSolarInfo;
- (id)init:(int)a3 withSolarInfo:(BOOL)a4 withModeratePressureVersion:(int)a5;
- (int64_t)updateThermalPressureLevelNotification:(unint64_t)a3 shouldForceThermalPressure:(BOOL)a4;
- (void)dealloc;
- (void)sendRadioNotification:(unsigned __int8)a3;
- (void)setIncludeSolarInfo:(BOOL)a3;
- (void)setLightPressureOverride:(BOOL)a3;
- (void)setThermalPressureLevelNotification:(unint64_t)a3;
- (void)updateMaxValueToken:(unint64_t)a3;
- (void)updateNotifyTokens;
- (void)updateThermalMitigationNotification:(unsigned __int8)a3;
- (void)updateThermalNotification:(unint64_t)a3;
- (void)updatetimeToMitigateNotification:(unsigned __int8)a3 AndReasonCode:(unsigned __int8)a4;
@end

@implementation NotificationManager

- (id)init:(int)a3 withSolarInfo:(BOOL)a4 withModeratePressureVersion:(int)a5
{
  BOOL v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NotificationManager;
  v8 = -[NotificationManager init](&v22, "init");
  v9 = v8;
  if (v8)
  {
    v8->pressureLevel_previous = 0LL;
    v8->totalSensors = a3 + 1;
    int v10 = a3 + 4;
    if (a3 < -4) {
      int v10 = a3 + 7;
    }
    v8->includeSolarInfo = v6;
    if (v6) {
      int v11 = 2;
    }
    else {
      int v11 = 1;
    }
    uint64_t v12 = (v11 + (v10 >> 2));
    v13 = (int *)malloc(4LL * (int)v12);
    v9->listThermalSensorToken = v13;
    if (notify_register_check("com.apple.system.maxthermalsensorvalue", v13)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038F1C();
    }

    if ((int)v12 >= 2)
    {
      unint64_t v14 = 1LL;
      uint64_t v15 = 1LL;
      qmemcpy(v18, ".thermalSensorVacom.apple.system", sizeof(v18));
      do
      {
        *(_OWORD *)name = v18[1];
        *(_OWORD *)v24 = v18[0];
        strcpy(&v24[13], "rValues");
        if (v14 != 1 && v14 <= 0x63)
        {
          __sprintf_chk(v21, 0, 3uLL, "%d", v14);
          __strcat_chk(name, v21, 40LL);
        }

        if (notify_register_check(name, &v9->listThermalSensorToken[v15]))
        {
          v16 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_100038EE0(&buf, v20, v16);
          }
        }

        ++v14;
        ++v15;
      }

      while (v12 != v14);
    }

    if (notify_register_check(kOSThermalNotificationName, &v9->thermalStatusToken)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038EB4();
    }

    if (notify_register_check(kOSThermalNotificationPressureLevelName, &v9->thermalPressureLevelToken)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038E88();
    }

    if (notify_register_check("com.apple.thermal.timeToMitigate", &v9->timeToMitigateToken)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038E5C();
    }

    if (notify_register_check("com.apple.thermal.mitigationReasonCode", &v9->mitigationReasonCodeToken)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038E30();
    }

    if (notify_register_check("com.apple.system.thermalmitigation", &v9->thermalMitigationToken)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038E04();
    }

    if (notify_register_check("com.apple.cltm.radioNotification", &v9->radioNotificationToken)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038DD8();
    }

    if (notify_set_state(v9->thermalPressureLevelToken, 0LL)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038DAC();
    }

    if (notify_post(kOSThermalNotificationPressureLevelName)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_100038D80();
    }

    -[NotificationManager updateThermalNotification:](v9, "updateThermalNotification:", 0LL);
    -[NotificationManager updatetimeToMitigateNotification:AndReasonCode:]( v9,  "updatetimeToMitigateNotification:AndReasonCode:",  0LL,  0LL);
    v9->moderatePressureVersion = a5;
  }

  return v9;
}

- (void)dealloc
{
  listThermalSensorToken = self->listThermalSensorToken;
  if (listThermalSensorToken) {
    free(listThermalSensorToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NotificationManager;
  -[NotificationManager dealloc](&v4, "dealloc");
}

- (void)updateMaxValueToken:(unint64_t)a3
{
  if (notify_set_state(*self->listThermalSensorToken, a3))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100038F48();
    }
  }

- (void)updateNotifyTokens
{
  if (-[NotificationManager includeSolarInfo](self, "includeSolarInfo"))
  {
    uint64_t v3 = (void)-[ContextAwareThermalManager getContextState:]( +[ContextAwareThermalManager sharedInstance]( &OBJC_CLASS___ContextAwareThermalManager,  "sharedInstance"),  "getContextState:",  0LL) << 48;
    int v4 = 1;
  }

  else
  {
    uint64_t v3 = 0LL;
    int v4 = 0;
  }

  int totalSensors = self->totalSensors;
  if (totalSensors >= 1)
  {
    uint64_t v6 = 0LL;
    int v7 = 1;
    do
    {
      *((void *)&v8 + 1) = dword_10007D05C[v6];
      *(void *)&__int128 v8 = v3;
      uint64_t v3 = v8 >> 16;
      ++v4;
      uint64_t v9 = (totalSensors - 1);
      if ((v4 & 3) == 0 || v6 == v9)
      {
        if ((v4 & 3) != 0 && v6 == v9)
        {
          do
          {
            v3 >>= 16;
            ++v4;
          }

          while ((v4 & 3) != 0);
        }

        if (notify_set_state(self->listThermalSensorToken[v7], v3))
        {
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_100038F74();
          }
          return;
        }

        uint64_t v3 = 0LL;
        ++v7;
        int totalSensors = self->totalSensors;
      }

      ++v6;
    }

    while (v6 < totalSensors);
  }

- (void)updateThermalNotification:(unint64_t)a3
{
  if (notify_set_state(self->thermalStatusToken, a3))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100038FCC();
    }
  }

  else if (notify_post(kOSThermalNotificationName) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_100038FA0();
  }

- (void)sendRadioNotification:(unsigned __int8)a3
{
  if (notify_set_state(self->radioNotificationToken, a3)
    && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_100039024();
  }

  if (notify_post("com.apple.cltm.radioNotification"))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100038FF8();
    }
  }

- (int64_t)updateThermalPressureLevelNotification:(unint64_t)a3 shouldForceThermalPressure:(BOOL)a4
{
  uint64_t v6 = 50LL;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
      goto LABEL_8;
    case 4uLL:
      if (self->moderatePressureVersion == 1) {
        goto LABEL_10;
      }
LABEL_8:
      if (self->moderatePressureVersion)
      {
LABEL_9:
        BOOL v7 = self->pressureLevel_previous > 0xA;
        uint64_t v8 = 10LL;
        uint64_t v9 = 20LL;
LABEL_15:
        if (v7) {
          uint64_t v6 = v9;
        }
        else {
          uint64_t v6 = v8;
        }
      }

      else
      {
LABEL_10:
        if (self->pressureLevel_previous) {
          uint64_t v6 = 20LL;
        }
        else {
          uint64_t v6 = 10LL;
        }
      }

- (void)setThermalPressureLevelNotification:(unint64_t)a3
{
  unint64_t pressureLevel_previous = self->pressureLevel_previous;
  if (pressureLevel_previous == a3 || byte_1000748C0 == 0)
  {
LABEL_6:
    kdebug_trace(728039436LL, pressureLevel_previous, a3, 0LL, 0LL);
    return;
  }

  if (notify_set_state(self->thermalPressureLevelToken, a3))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100038DAC();
    }
    return;
  }

  uint32_t v7 = notify_post(kOSThermalNotificationPressureLevelName);
  uint64_t v8 = (os_log_s *)qword_10007CF50;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unint64_t v10 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> Thermal pressure level %llu",  (uint8_t *)&v9,  0xCu);
    }

    self->unint64_t pressureLevel_previous = a3;
    unint64_t pressureLevel_previous = a3;
    goto LABEL_6;
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_100038D80();
  }
}

- (void)setLightPressureOverride:(BOOL)a3
{
  self->lightPressureOverride = a3;
}

- (void)updatetimeToMitigateNotification:(unsigned __int8)a3 AndReasonCode:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  if (notify_set_state(self->timeToMitigateToken, a3)
    && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_1000390D4();
  }

  if (notify_post("com.apple.thermal.timeToMitigate")
    && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_1000390A8();
  }

  if (notify_set_state(self->mitigationReasonCodeToken, v4)
    && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003907C();
  }

  if (notify_post("com.apple.thermal.mitigationReasonCode"))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039050();
    }
  }

- (void)updateThermalMitigationNotification:(unsigned __int8)a3
{
  if (notify_set_state(self->thermalMitigationToken, a3)
    && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003912C();
  }

  if (notify_post("com.apple.system.thermalmitigation"))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_100039100();
    }
  }

- (BOOL)includeSolarInfo
{
  return self->includeSolarInfo;
}

- (void)setIncludeSolarInfo:(BOOL)a3
{
  self->includeSolarInfo = a3;
}

@end