@interface BKDisplayBrightnessController
+ (BKDisplayBrightnessController)sharedInstance;
- (BOOL)isALSSupported;
- (BOOL)isAutoBrightnessAvailable;
- (BOOL)isBrightnessLevelControlAvailable;
- (float)brightnessLevel;
- (float)unentitledBrightnessLevel;
- (id)_initWithBrightnessSystem:(id)a3 systemShellSentinel:(id)a4 orientationManager:(id)a5;
- (id)propertyForKey:(id)a3;
- (id)suppressBrightnessNotificationsForReason:(id)a3;
- (int)displayBrightnessCurve;
- (unsigned)backlightArchitectureVersion;
- (void)clientDied:(id)a3;
- (void)dealloc;
- (void)orientationManager:(id)a3 userInterfaceOrientationMayHaveChanged:(int64_t)a4 isDeviceOrientationLocked:(BOOL)a5;
- (void)setAutoBrightnessEnabled:(BOOL)a3;
- (void)setBacklightFeatures:(id)a3 forPID:(int)a4;
- (void)setBacklightLocked:(BOOL)a3 forReason:(id)a4;
- (void)setBrightnessLevel:(float)a3 reason:(id)a4 options:(unint64_t)a5;
- (void)setDisplayBrightnessCurve:(int)a3;
- (void)setMinimumBrightnessLevel:(float)a3 fadeDuration:(float)a4;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)systemShellDidFinishLaunching:(id)a3;
@end

@implementation BKDisplayBrightnessController

- (id)_initWithBrightnessSystem:(id)a3 systemShellSentinel:(id)a4 orientationManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___BKDisplayBrightnessController;
  v12 = -[BKDisplayBrightnessController init](&v26, "init");
  uint64_t v13 = (uint64_t)v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_notificationToken = -1;
    objc_storeStrong((id *)&v12->_brightnessSystem, a3);
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:",  @"BKDisplayBrightnessController suppress-darwin-notifications"));
    v15 = *(void **)(v13 + 104);
    *(void *)(v13 + 104) = v14;

    *(_DWORD *)(v13 + 16) = 1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
    id v17 = [v16 brightnessCurve];

    os_unfair_lock_lock((os_unfair_lock_t)(v13 + 8));
    sub_100064AD4(v13, (uint64_t)v17, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 8));
    objc_initWeak(&location, (id)v13);
    v18 = *(void **)(v13 + 96);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100064B94;
    v23[3] = &unk_1000B7C80;
    objc_copyWeak(&v24, &location);
    [v18 registerNotificationBlock:v23];
    objc_storeWeak((id *)(v13 + 64), v11);
    v19 = sub_100067104((id *)v11, (void *)v13);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = *(void **)(v13 + 72);
    *(void *)(v13 + 72) = v20;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return (id)v13;
}

- (void)dealloc
{
  int notificationToken = self->_notificationToken;
  if (notificationToken != -1) {
    notify_cancel(notificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___BKDisplayBrightnessController;
  -[BKDisplayBrightnessController dealloc](&v4, "dealloc");
}

- (id)suppressBrightnessNotificationsForReason:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:]( self->_suppressClientNotificationsAssertion,  "acquireForReason:",  v5));

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unsigned)backlightArchitectureVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[BKDisplayBrightnessController propertyForKey:]( self,  "propertyForKey:",  @"DisplayBackLightArchitecture"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v3);
  id v5 = v2;
  v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      v7 = v6;
    }
    else {
      v7 = 0LL;
    }
  }

  else
  {
    v7 = 0LL;
  }

  id v8 = v7;

  unsigned __int8 v9 = [v8 unsignedCharValue];
  return v9;
}

- (void)setMinimumBrightnessLevel:(float)a3 fadeDuration:(float)a4
{
  if (a3 >= 0.0) {
    float v6 = a3;
  }
  else {
    float v6 = 0.0;
  }
  uint64_t v7 = BKLogBacklight(self, a2);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218240;
    double v15 = v6;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting minimum brightness level: %f with fade duration %f",  (uint8_t *)&v14,  0x16u);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (a4 <= 0.0)
  {
    *(float *)&double v9 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v9));
    uint64_t v13 = @"BrightnessMinPhysical";
  }

  else
  {
    *(float *)&double v9 = a4;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v9));
    sub_1000649CC((uint64_t)self, v10, @"DisplayBrightnessFadePeriod");

    *(float *)&double v11 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v11));
    uint64_t v13 = @"BrightnessMinPhysicalWithFade";
  }

  sub_1000649CC((uint64_t)self, v12, v13);

  os_unfair_lock_unlock(&self->_lock);
}

- (float)unentitledBrightnessLevel
{
  float v3 = fmaxf(v2, 0.0);
  float v4 = (float)(v3 * 100.0) / 5.0;
  BOOL v5 = v3 < 1.0;
  float v6 = 20.0;
  if (v5) {
    float v6 = v4;
  }
  return (float)(roundf(v6) * 5.0) / 100.0;
}

- (float)brightnessLevel
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  float brightnessLevel = self->_brightnessLevel;
  os_unfair_lock_unlock(p_lock);
  return brightnessLevel;
}

- (void)setBrightnessLevel:(float)a3 reason:(id)a4 options:(unint64_t)a5
{
  p_lock = &self->_lock;
  id v9 = a4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v10 = v9;
  v12 = v10;
  if (self && (self->_brightnessLevel != a3 || self->_previousBrightnessLevelOptions != a5))
  {
    uint64_t v13 = BKLogBacklight(v10, v11);
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    if (!a5)
    {
      double v17 = @"none";
      goto LABEL_13;
    }

    double v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int16 v16 = v15;
    if ((a5 & 1) != 0)
    {
      -[NSMutableArray addObject:](v15, "addObject:", @"commit");
      if ((a5 & 4) == 0)
      {
LABEL_8:
        if ((a5 & 2) == 0) {
          goto LABEL_9;
        }
        goto LABEL_34;
      }
    }

    else if ((a5 & 4) == 0)
    {
      goto LABEL_8;
    }

    -[NSMutableArray addObject:](v16, "addObject:", @"notifyClients");
    if ((a5 & 2) == 0)
    {
LABEL_9:
      if ((a5 & 8) == 0)
      {
LABEL_11:
        double v17 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v16, "componentsJoinedByString:", @", "));

LABEL_13:
        *(_DWORD *)buf = 134218498;
        *(double *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v12;
        __int16 v32 = 2112;
        v33 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "brightness change:%g reason:%{public}@ options:%@",  buf,  0x20u);

LABEL_14:
        if ((a5 & 2) != 0)
        {
          *(float *)&double v18 = a3;
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithFloat:]( &OBJC_CLASS___NSNumber,  "numberWithFloat:",  v18,  @"Brightness"));
          v30[1] = @"Commit";
          *(void *)buf = v19;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a5 & 1));
          *(void *)&buf[8] = v20;
          v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v30,  2LL));

          if ((a5 & 8) != 0) {
            v22 = @"DisplayInitialBrightness";
          }
          else {
            v22 = @"DisplayBrightness";
          }
          if (!BSEqualObjects(v22, self->_previousBrightnessLevelKey)
            || (BSEqualObjects(v21, self->_previousBrightnessLevelValue) & 1) == 0)
          {
            previousBrightnessLevelKey = self->_previousBrightnessLevelKey;
            self->_previousBrightnessLevelKey = &v22->isa;

            objc_storeStrong((id *)&self->_previousBrightnessLevelValue, v21);
            sub_1000649CC((uint64_t)self, v21, v22);
          }
        }

        int notificationToken = self->_notificationToken;
        if (notificationToken == -1)
        {
          if (notify_register_check("UIBacklightLevelChangedNotification", &self->_notificationToken))
          {
LABEL_30:
            self->_float brightnessLevel = a3;
            self->_previousBrightnessLevelOptions = a5;
            goto LABEL_31;
          }

          int notificationToken = self->_notificationToken;
        }

        float v25 = fmaxf(a3, 0.0);
        float v26 = (float)(v25 * 100.0) / 5.0;
        BOOL v27 = v25 < 1.0;
        float v28 = 20.0;
        if (v27) {
          float v28 = v26;
        }
        notify_set_state( notificationToken,  (unint64_t)(float)((float)((float)(roundf(v28) * 5.0) / 100.0) * 1000000.0));
        if ((a5 & 4) != 0)
        {
          unint64_t v29 = (unint64_t)(float)(a3 * 1000000.0);
          if (self->_previousDarwinNotificationBrightnessLevel != v29
            && (-[BSCompoundAssertion isActive](self->_suppressClientNotificationsAssertion, "isActive") & 1) == 0)
          {
            notify_post("UIBacklightLevelChangedNotification");
            self->_previousDarwinNotificationBrightnessLevel = v29;
          }
        }

        goto LABEL_30;
      }

- (BOOL)isAutoBrightnessAvailable
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[BrightnessSystem copyPropertyForKey:]( self->_brightnessSystem,  "copyPropertyForKey:",  @"CBAutoBrightnessAvailable");
  unsigned __int8 v5 = [v4 BOOLValue];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isBrightnessLevelControlAvailable
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[BrightnessSystem copyPropertyForKey:]( self->_brightnessSystem,  "copyPropertyForKey:",  @"CBBrightnessControlAvailable");
  unsigned __int8 v5 = [v4 BOOLValue];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isALSSupported
{
  float v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = -[BrightnessSystem isAlsSupported](v2->_brightnessSystem, "isAlsSupported");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAutoBrightnessEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
  [v4 setALSEnabled:v3];

  sub_10005367C(BKDefaultKeyALSEnabled);
}

- (void)setDisplayBrightnessCurve:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_100064AD4((uint64_t)self, v3, 1);
  os_unfair_lock_unlock(p_lock);
}

- (int)displayBrightnessCurve
{
  float v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LODWORD(v2) = v2->_brightnessLevelCurve;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (id)propertyForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v6 = -[BrightnessSystem copyPropertyForKey:](self->_brightnessSystem, "copyPropertyForKey:", v5);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  sub_1000649CC((uint64_t)self, v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)setBacklightLocked:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v20[0] = @"FreezeBrightnessEnable";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  v21[0] = v7;
  v20[1] = @"FreezeBrightnessRequestors";
  id v19 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v20[2] = @"FreezeBrightnessPeriod";
  v21[1] = v8;
  v21[2] = &off_1000C0510;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));

  uint64_t v12 = BKLogBacklight(v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = @"NO";
    if (v4) {
      int v14 = @"YES";
    }
    int v15 = 138412546;
    __int16 v16 = v14;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Locking backlight to current value: %@ for reason: %{public}@",  (uint8_t *)&v15,  0x16u);
  }

  -[BKDisplayBrightnessController setProperty:forKey:](self, "setProperty:forKey:", v9, @"FreezeBrightness");
}

- (void)setBacklightFeatures:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  backlightClientPerPID = self->_backlightClientPerPID;
  if (!backlightClientPerPID)
  {
    id v8 = objc_opt_new(&OBJC_CLASS___BSMutableIntegerMap);
    id v9 = self->_backlightClientPerPID;
    self->_backlightClientPerPID = v8;

    backlightClientPerPID = self->_backlightClientPerPID;
  }

  uint64_t v10 = (BKBacklightClient *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](backlightClientPerPID, "objectForKey:", (int)v4));
  if (v10
    || (uint64_t v10 = -[BKHIDEventClient initWithPid:sendRight:queue:]( objc_alloc(&OBJC_CLASS___BKBacklightClient),  "initWithPid:sendRight:queue:",  v4,  0LL,  &_dispatch_main_q),  -[BKHIDEventClient setDelegate:](v10, "setDelegate:", self),  -[BSMutableIntegerMap setObject:forKey:](self->_backlightClientPerPID, "setObject:forKey:", v10, (int)v4),  v10))
  {
    objc_storeStrong((id *)(&v10->super._terminating + 1), a3);
  }

  sub_100064604((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)clientDied:(id)a3
{
  id v4 = a3;
  signed int v5 = [v4 pid];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[BSMutableIntegerMap removeObjectForKey:](self->_backlightClientPerPID, "removeObjectForKey:", v5);
  [v4 invalidate];

  sub_100064604((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)systemShellDidFinishLaunching:(id)a3
{
}

- (void)orientationManager:(id)a3 userInterfaceOrientationMayHaveChanged:(int64_t)a4 isDeviceOrientationLocked:(BOOL)a5
{
  id v6 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", sub_10006641C((uint64_t)a3));
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[BKDisplayBrightnessController setProperty:forKey:](self, "setProperty:forKey:", v7, @"CBUIOrientation");
}

- (void).cxx_destruct
{
}

+ (BKDisplayBrightnessController)sharedInstance
{
  if (qword_1000DC238 != -1) {
    dispatch_once(&qword_1000DC238, &stru_1000B7C58);
  }
  return (BKDisplayBrightnessController *)(id)qword_1000DC230;
}

@end