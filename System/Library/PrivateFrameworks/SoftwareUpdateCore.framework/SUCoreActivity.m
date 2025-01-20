@interface SUCoreActivity
+ (BOOL)supportsSecureCoding;
+ (id)_predicateForKeyPath:(id)a3 equalToValue:(id)a4;
+ (id)backlightOnPredicate:(BOOL)a3;
+ (id)batteryLevelPredicateGreaterThan:(id)a3;
+ (id)batteryLevelPredicateLessThan:(id)a3;
+ (id)carplayPredicate:(BOOL)a3;
+ (id)mediaPlayingPredicate:(BOOL)a3;
+ (id)networkPredicate:(BOOL)a3;
+ (id)phoneCallPredicate:(BOOL)a3;
+ (id)pluggedInPredicate:(BOOL)a3;
+ (id)systemDatePredicate:(id)a3;
+ (id)wifiAvailablePredicate:(BOOL)a3;
- (BOOL)_BOOLForTriState:(int)a3 defaultValue:(BOOL)a4;
- (BOOL)_mustWake;
- (BOOL)isEqual:(id)a3;
- (NSDate)runDate;
- (NSNumber)batteryLevelGreaterThan;
- (NSNumber)batteryLevelLessThan;
- (NSString)UUID;
- (NSString)activityName;
- (SUCoreActivity)initWithActivityName:(id)a3 options:(id)a4;
- (SUCoreActivity)initWithCoder:(id)a3;
- (id)_clientIdentifier;
- (id)_dismissalPredicate;
- (id)_stringForTriState:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createContextualPredicate;
- (id)createRegistrationWithHandler:(id)a3;
- (id)description;
- (int)carplayState;
- (int)mediaPlayingState;
- (int)networkState;
- (int)phoneCallState;
- (int)plugInState;
- (int)screenOnState;
- (int)waking;
- (int)wifiState;
- (unint64_t)_deviceSet;
- (unsigned)_qualityOfService;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityName:(id)a3;
- (void)setBatteryLevelGreaterThan:(id)a3;
- (void)setBatteryLevelLessThan:(id)a3;
- (void)setCarplayState:(int)a3;
- (void)setMediaPlayingState:(int)a3;
- (void)setNetworkState:(int)a3;
- (void)setPhoneCallState:(int)a3;
- (void)setPlugInState:(int)a3;
- (void)setRunDate:(id)a3;
- (void)setScreenOnState:(int)a3;
- (void)setUUID:(id)a3;
- (void)setWaking:(int)a3;
- (void)setWifiState:(int)a3;
@end

@implementation SUCoreActivity

- (SUCoreActivity)initWithActivityName:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SUCoreActivity;
  v9 = -[SUCoreActivity init](&v24, sel_init);
  if (v9)
  {
    if (objc_opt_class())
    {
      objc_storeStrong((id *)&v9->_activityName, a3);
      [MEMORY[0x189607AB8] UUID];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 UUIDString];
      UUID = v9->_UUID;
      v9->_UUID = (NSString *)v11;

      uint64_t v13 = [v8 runDate];
      runDate = v9->_runDate;
      v9->_runDate = (NSDate *)v13;

      uint64_t v15 = [v8 batteryLevelGreaterThan];
      batteryLevelGreaterThan = v9->_batteryLevelGreaterThan;
      v9->_batteryLevelGreaterThan = (NSNumber *)v15;

      uint64_t v17 = [v8 batteryLevelLessThan];
      batteryLevelLessThan = v9->_batteryLevelLessThan;
      v9->_batteryLevelLessThan = (NSNumber *)v17;

      if (v8)
      {
        v9->_plugInState = [v8 plugInState];
        v9->_screenOnState = [v8 screenOnState];
        v9->_networkState = [v8 networkState];
        v9->_wifiState = [v8 wifiState];
        v9->_phoneCallState = [v8 phoneCallState];
        v9->_carplayState = [v8 carplayState];
        v9->_mediaPlayingState = [v8 mediaPlayingState];
        int v19 = [v8 waking];
      }

      else
      {
        int v19 = 0;
        *(void *)&v9->_plugInState = 0LL;
        *(void *)&v9->_networkState = 0LL;
        v9->_mediaPlayingState = 0;
        *(void *)&v9->_phoneCallState = 0LL;
      }

      v9->_waking = v19;
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 oslog];
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl( &dword_187A54000,  v21,  OS_LOG_TYPE_DEFAULT,  "CoreDuet Context Store symbols not recognized. Returning null SUCoreActivity",  v23,  2u);
      }

      v9 = 0LL;
    }
  }

  return v9;
}

- (id)createRegistrationWithHandler:(id)a3
{
  v4 = (void *)MEMORY[0x18960DAF0];
  id v5 = a3;
  v6 = -[SUCoreActivity activityName](self, "activityName");
  -[SUCoreActivity createContextualPredicate](self, "createContextualPredicate");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _dismissalPredicate](self, "_dismissalPredicate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = -[SUCoreActivity _deviceSet](self, "_deviceSet");
  v10 = -[SUCoreActivity _clientIdentifier](self, "_clientIdentifier");
  BOOL v11 = -[SUCoreActivity _mustWake](self, "_mustWake");
  LODWORD(v16) = -[SUCoreActivity _qualityOfService](self, "_qualityOfService");
  [v4 registrationWithIdentifier:v6 contextualPredicate:v7 dismissalPolicy:v8 deviceSet:v9 clientIdentifier:v10 mustWake:v11 qualityOfService:v16 callback:v5];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_187A54000, v14, OS_LOG_TYPE_DEFAULT, "Failed to create registration", buf, 2u);
    }
  }

  return v12;
}

- (BOOL)_mustWake
{
  return -[SUCoreActivity _BOOLForTriState:defaultValue:]( self,  "_BOOLForTriState:defaultValue:",  -[SUCoreActivity waking](self, "waking"),  0LL);
}

- (unsigned)_qualityOfService
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    unsigned int v3 = 25;
  }
  else {
    unsigned int v3 = 9;
  }

  return v3;
}

- (unint64_t)_deviceSet
{
  return 0LL;
}

- (id)_dismissalPredicate
{
  return 0LL;
}

- (id)_clientIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 bundleIdentifier];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_BOOLForTriState:(int)a3 defaultValue:(BOOL)a4
{
  if (a3 == 1) {
    a4 = 0;
  }
  return a3 == 2 || a4;
}

- (id)createContextualPredicate
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SUCoreActivity runDate](self, "runDate");
  if (v4)
  {
    -[SUCoreActivity runDate](self, "runDate");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[SUCoreActivity systemDatePredicate:](&OBJC_CLASS___SUCoreActivity, "systemDatePredicate:", v5);
    [v3 addObject:v6];
  }

  -[SUCoreActivity batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCoreActivity batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreActivity batteryLevelPredicateGreaterThan:]( &OBJC_CLASS___SUCoreActivity,  "batteryLevelPredicateGreaterThan:",  v8);
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v9];
  }
  v10 = -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
  if (v10)
  {
    -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[SUCoreActivity batteryLevelPredicateLessThan:]( &OBJC_CLASS___SUCoreActivity,  "batteryLevelPredicateLessThan:",  v11);
    [v3 addObject:v12];
  }

  if (-[SUCoreActivity plugInState](self, "plugInState"))
  {
    +[SUCoreActivity pluggedInPredicate:]( &OBJC_CLASS___SUCoreActivity,  "pluggedInPredicate:",  -[SUCoreActivity plugInState](self, "plugInState") == 2);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v13];
  }

  if (-[SUCoreActivity screenOnState](self, "screenOnState"))
  {
    v14 = +[SUCoreActivity backlightOnPredicate:]( &OBJC_CLASS___SUCoreActivity,  "backlightOnPredicate:",  -[SUCoreActivity screenOnState](self, "screenOnState") != 0);
    [v3 addObject:v14];
  }

  if (-[SUCoreActivity networkState](self, "networkState"))
  {
    +[SUCoreActivity networkPredicate:]( &OBJC_CLASS___SUCoreActivity,  "networkPredicate:",  -[SUCoreActivity networkState](self, "networkState") != 0);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v15];
  }

  if (-[SUCoreActivity wifiState](self, "wifiState"))
  {
    +[SUCoreActivity wifiAvailablePredicate:]( &OBJC_CLASS___SUCoreActivity,  "wifiAvailablePredicate:",  -[SUCoreActivity wifiState](self, "wifiState") != 0);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v16];
  }

  if (-[SUCoreActivity phoneCallState](self, "phoneCallState"))
  {
    +[SUCoreActivity phoneCallPredicate:]( &OBJC_CLASS___SUCoreActivity,  "phoneCallPredicate:",  -[SUCoreActivity phoneCallState](self, "phoneCallState") != 0);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v17];
  }

  if (-[SUCoreActivity carplayState](self, "carplayState"))
  {
    v18 = +[SUCoreActivity carplayPredicate:]( &OBJC_CLASS___SUCoreActivity,  "carplayPredicate:",  -[SUCoreActivity carplayState](self, "carplayState") != 0);
    [v3 addObject:v18];
  }

  if (-[SUCoreActivity mediaPlayingState](self, "mediaPlayingState"))
  {
    +[SUCoreActivity mediaPlayingPredicate:]( &OBJC_CLASS___SUCoreActivity,  "mediaPlayingPredicate:",  -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState") != 0);
    int v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v19];
  }

  [MEMORY[0x18960DAF8] andPredicateWithSubpredicates:v3];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 oslog];
    objc_super v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      v27 = self;
      _os_log_impl( &dword_187A54000,  v24,  OS_LOG_TYPE_DEFAULT,  "Failed to create _CDContextualPredicate for SUActivity: %{public}@",  (uint8_t *)&v26,  0xCu);
    }
  }

  return v21;
}

- (id)_stringForTriState:(int)a3
{
  else {
    return off_18A0F0E70[a3];
  }
}

- (id)description
{
  id v15 = (id)NSString;
  v20 = -[SUCoreActivity activityName](self, "activityName");
  -[SUCoreActivity UUID](self, "UUID");
  int v19 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v3 = (void *)MEMORY[0x189607848];
  -[SUCoreActivity runDate](self, "runDate");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 localizedStringFromDate:v17 dateStyle:1 timeStyle:2];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
  v14 = -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
  -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity plugInState](self, "plugInState"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUCoreActivity _stringForTriState:]( self,  "_stringForTriState:",  -[SUCoreActivity screenOnState](self, "screenOnState"));
  -[SUCoreActivity _stringForTriState:]( self,  "_stringForTriState:",  -[SUCoreActivity networkState](self, "networkState"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity wifiState](self, "wifiState"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivity _stringForTriState:]( self,  "_stringForTriState:",  -[SUCoreActivity phoneCallState](self, "phoneCallState"));
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUCoreActivity _stringForTriState:]( self,  "_stringForTriState:",  -[SUCoreActivity carplayState](self, "carplayState"));
  -[SUCoreActivity _stringForTriState:]( self,  "_stringForTriState:",  -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SUCoreActivity _stringForTriState:](self, "_stringForTriState:", -[SUCoreActivity waking](self, "waking"));
  [v15 stringWithFormat:@"\n            ActivityName:       %@\n            UUID:               %@\n            runDate:            %@\n            batteryLevelGT:     %@\n            batteryLevelLT:     %@\n            plugInState:        %@\n            screenOnState:      %@\n            networkState:       %@\n            wifiState:          %@\n            phonecallState:     %@\n            carplayState:       %@\n            mediaPlayingState:  %@\n            waking:             %@\n", v20, v19, v18, v4, v14, v5, v6, v7, v8, v9, v10, v11, v12];
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUCoreActivity *)a3;
  if (v4 == self)
  {
    BOOL v34 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      v6 = (void *)MEMORY[0x189612760];
      -[SUCoreActivity activityName](self, "activityName");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreActivity activityName](v5, "activityName");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v6 stringIsEqual:v7 to:v8])
      {
        BOOL v34 = 0;
LABEL_29:

        goto LABEL_30;
      }

      unint64_t v9 = (void *)MEMORY[0x189612760];
      v10 = -[SUCoreActivity UUID](self, "UUID");
      -[SUCoreActivity UUID](v5, "UUID");
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v9 stringIsEqual:v10 to:v11])
      {
        BOOL v34 = 0;
LABEL_28:

        goto LABEL_29;
      }

      v12 = (void *)MEMORY[0x189612760];
      -[SUCoreActivity runDate](self, "runDate");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = -[SUCoreActivity runDate](v5, "runDate");
      id v15 = v12;
      id v16 = (void *)v14;
      if (!objc_msgSend(v15, "dateIsEqual:to:", v13))
      {
        BOOL v34 = 0;
        v25 = v16;
LABEL_27:

        goto LABEL_28;
      }

      v40 = v10;
      v38 = v13;
      uint64_t v17 = (void *)MEMORY[0x189612760];
      uint64_t v18 = -[SUCoreActivity batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
      uint64_t v19 = -[SUCoreActivity batteryLevelGreaterThan](v5, "batteryLevelGreaterThan");
      v39 = (void *)v18;
      uint64_t v20 = v18;
      v21 = (void *)v19;
      if (!objc_msgSend(v17, "numberIsEqual:to:", v20))
      {
        BOOL v34 = 0;
        uint64_t v13 = v38;
        v25 = v16;
LABEL_26:

        v10 = v40;
        goto LABEL_27;
      }

      id v22 = (void *)MEMORY[0x189612760];
      uint64_t v23 = -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
      -[SUCoreActivity batteryLevelLessThan](v5, "batteryLevelLessThan");
      v36 = (void *)v23;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "numberIsEqual:to:", v23))
      {
        int v24 = -[SUCoreActivity plugInState](self, "plugInState");
        v25 = v16;
        if (v24 == -[SUCoreActivity plugInState](v5, "plugInState"))
        {
          int v26 = -[SUCoreActivity screenOnState](self, "screenOnState");
          if (v26 == -[SUCoreActivity screenOnState](v5, "screenOnState"))
          {
            int v27 = -[SUCoreActivity networkState](self, "networkState");
            uint64_t v28 = v36;
            if (v27 == -[SUCoreActivity networkState](v5, "networkState")
              && (int v29 = -[SUCoreActivity wifiState](self, "wifiState"),
                  v29 == -[SUCoreActivity wifiState](v5, "wifiState"))
              && (int v30 = -[SUCoreActivity waking](self, "waking"), v30 == -[SUCoreActivity waking](v5, "waking"))
              && (int v31 = -[SUCoreActivity phoneCallState](self, "phoneCallState"),
                  v31 == -[SUCoreActivity phoneCallState](v5, "phoneCallState"))
              && (int v32 = -[SUCoreActivity carplayState](self, "carplayState"),
                  v32 == -[SUCoreActivity carplayState](v5, "carplayState")))
            {
              int v33 = -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState");
              BOOL v34 = v33 == -[SUCoreActivity mediaPlayingState](v5, "mediaPlayingState");
            }

            else
            {
              BOOL v34 = 0;
            }

            uint64_t v13 = v38;
            goto LABEL_25;
          }
        }

        BOOL v34 = 0;
        uint64_t v13 = v38;
      }

      else
      {
        BOOL v34 = 0;
        uint64_t v13 = v38;
        v25 = v16;
      }

      uint64_t v28 = v36;
LABEL_25:

      goto LABEL_26;
    }

    BOOL v34 = 0;
  }

+ (id)pluggedInPredicate:(BOOL)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to create plugged in _CDContextualPredicate",  v9,  2u);
    }
  }

  return v4;
}

+ (id)networkPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  v14[2] = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x18960DAE8], "predicateForCellConnectionAvailability:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x18960DAE8] predicateForWiFiConnectionAvailability:v3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x18960DAF8];
  v14[0] = v4;
  v14[1] = v5;
  [MEMORY[0x189603F18] arrayWithObjects:v14 count:2];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 orPredicateWithSubpredicates:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v9 = v8;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to create network available _CDContextualPredicate",  v13,  2u);
    }
  }

  return v8;
}

+ (id)wifiAvailablePredicate:(BOOL)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to create wifi available _CDContextualPredicate",  v9,  2u);
    }
  }

  return v4;
}

+ (id)backlightOnPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x18960DAE8] keyPathForBacklightOnStatus];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithBool:v3];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _predicateForKeyPath:v5 equalToValue:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)phoneCallPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  v19[2] = *MEMORY[0x1895F89C0];
  [MEMORY[0x18960DAE8] keyPathForCallInProgressStatus];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithBool:v3];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _predicateForKeyPath:v5 equalToValue:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x18960DAE8] keyPathForCallInProgressStatus];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE8] null];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _predicateForKeyPath:v8 equalToValue:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  BOOL v11 = (void *)MEMORY[0x18960DAF8];
  v19[0] = v7;
  v19[1] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v19 count:2];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 orPredicateWithSubpredicates:v12];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v14 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl( &dword_187A54000,  v16,  OS_LOG_TYPE_DEFAULT,  "Failed to create call in progress _CDContextualPredicate",  v18,  2u);
    }
  }

  return v13;
}

+ (id)batteryLevelPredicateGreaterThan:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x18960DAF8];
  v4 = (void *)MEMORY[0x18960DAE8];
  id v5 = a3;
  [v4 keyPathForBatteryLevel];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x18960DAE8] keyPathForBatteryLevel];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 predicateForKeyPath:v6, @"self.%@.value > %@", v7, v5 withFormat];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v9 = v8;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to create battery level greater than _CDContextualPredicate",  buf,  2u);
    }
  }

  return v8;
}

+ (id)batteryLevelPredicateLessThan:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x18960DAF8];
  v4 = (void *)MEMORY[0x18960DAE8];
  id v5 = a3;
  [v4 keyPathForBatteryLevel];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x18960DAE8] keyPathForBatteryLevel];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 predicateForKeyPath:v6, @"self.%@.value < %@", v7, v5 withFormat];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v9 = v8;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to create battery level less than _CDContextualPredicate",  buf,  2u);
    }
  }

  return v8;
}

+ (id)carplayPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x18960DAE8] keyPathForCarplayConnectedStatus];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithBool:v3];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _predicateForKeyPath:v5 equalToValue:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)systemDatePredicate:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to create system date _CDContextualPredicate",  v9,  2u);
    }
  }

  return v4;
}

+ (id)mediaPlayingPredicate:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x18960DAE8] keyPathForMediaPlayingStatus];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithBool:v3];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _predicateForKeyPath:v5 equalToValue:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_predicateForKeyPath:(id)a3 equalToValue:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [MEMORY[0x18960DAF8] predicateForKeyPath:v5 equalToValue:a4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v5 description];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to create _CDContextualPredicate for keyPath: %{public}@",  (uint8_t *)&v13,  0xCu);
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SUCoreActivity;
  id v5 = -[SUCoreActivity init](&v12, sel_init);
  if (v5)
  {
    [v4 decodeObjectForKey:@"activityKey"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreActivity setActivityName:](v5, "setActivityName:", v6);

    [v4 decodeObjectForKey:@"uuid"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreActivity setUUID:](v5, "setUUID:", v7);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runDate"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreActivity setRunDate:](v5, "setRunDate:", v8);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryLessThan"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreActivity setBatteryLevelGreaterThan:](v5, "setBatteryLevelGreaterThan:", v9);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryGreaterThan"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreActivity setBatteryLevelLessThan:](v5, "setBatteryLevelLessThan:", v10);

    -[SUCoreActivity setWaking:](v5, "setWaking:", [v4 decodeIntegerForKey:@"waking"]);
    -[SUCoreActivity setPlugInState:]( v5,  "setPlugInState:",  [v4 decodeIntegerForKey:@"plugInState"]);
    -[SUCoreActivity setScreenOnState:]( v5,  "setScreenOnState:",  [v4 decodeIntegerForKey:@"screenOn"]);
    -[SUCoreActivity setNetworkState:]( v5,  "setNetworkState:",  [v4 decodeIntegerForKey:@"network"]);
    -[SUCoreActivity setWifiState:](v5, "setWifiState:", [v4 decodeIntegerForKey:@"wifi"]);
    -[SUCoreActivity setPhoneCallState:]( v5,  "setPhoneCallState:",  [v4 decodeIntegerForKey:@"phoneCall"]);
    -[SUCoreActivity setCarplayState:]( v5,  "setCarplayState:",  [v4 decodeIntegerForKey:@"carplay"]);
    -[SUCoreActivity setMediaPlayingState:]( v5,  "setMediaPlayingState:",  [v4 decodeIntegerForKey:@"media"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  -[SUCoreActivity activityName](self, "activityName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v4 forKey:@"activityKey"];

  -[SUCoreActivity UUID](self, "UUID");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v5 forKey:@"uuid"];
  v6 = -[SUCoreActivity runDate](self, "runDate");
  [v9 encodeObject:v6 forKey:@"runDate"];

  -[SUCoreActivity batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v7 forKey:@"batteryGreaterThan"];

  -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v8 forKey:@"batteryLessThan"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity waking](self, "waking"), @"waking");
  objc_msgSend( v9,  "encodeInteger:forKey:",  -[SUCoreActivity plugInState](self, "plugInState"),  @"plugInState");
  objc_msgSend( v9,  "encodeInteger:forKey:",  -[SUCoreActivity screenOnState](self, "screenOnState"),  @"screenOn");
  objc_msgSend( v9,  "encodeInteger:forKey:",  -[SUCoreActivity networkState](self, "networkState"),  @"network");
  objc_msgSend(v9, "encodeInteger:forKey:", -[SUCoreActivity wifiState](self, "wifiState"), @"wifi");
  objc_msgSend( v9,  "encodeInteger:forKey:",  -[SUCoreActivity phoneCallState](self, "phoneCallState"),  @"phoneCall");
  objc_msgSend( v9,  "encodeInteger:forKey:",  -[SUCoreActivity carplayState](self, "carplayState"),  @"carplay");
  objc_msgSend( v9,  "encodeInteger:forKey:",  -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState"),  @"media");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SUCoreActivity activityName](self, "activityName");
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setActivityName:v7];

  -[SUCoreActivity UUID](self, "UUID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)[v8 copyWithZone:a3];
  [v5 setUUID:v9];
  v10 = -[SUCoreActivity runDate](self, "runDate");
  BOOL v11 = (void *)[v10 copyWithZone:a3];
  [v5 setRunDate:v11];

  -[SUCoreActivity batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = (void *)[v12 copyWithZone:a3];
  [v5 setBatteryLevelGreaterThan:v13];

  -[SUCoreActivity batteryLevelLessThan](self, "batteryLevelLessThan");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  [v5 setBatteryLevelLessThan:v15];

  objc_msgSend(v5, "setWaking:", -[SUCoreActivity waking](self, "waking"));
  objc_msgSend(v5, "setPlugInState:", -[SUCoreActivity plugInState](self, "plugInState"));
  objc_msgSend(v5, "setScreenOnState:", -[SUCoreActivity screenOnState](self, "screenOnState"));
  objc_msgSend(v5, "setNetworkState:", -[SUCoreActivity networkState](self, "networkState"));
  objc_msgSend(v5, "setWifiState:", -[SUCoreActivity wifiState](self, "wifiState"));
  objc_msgSend(v5, "setPhoneCallState:", -[SUCoreActivity phoneCallState](self, "phoneCallState"));
  objc_msgSend(v5, "setCarplayState:", -[SUCoreActivity carplayState](self, "carplayState"));
  objc_msgSend(v5, "setMediaPlayingState:", -[SUCoreActivity mediaPlayingState](self, "mediaPlayingState"));
  return v5;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSDate)runDate
{
  return self->_runDate;
}

- (void)setRunDate:(id)a3
{
}

- (NSNumber)batteryLevelGreaterThan
{
  return self->_batteryLevelGreaterThan;
}

- (void)setBatteryLevelGreaterThan:(id)a3
{
}

- (NSNumber)batteryLevelLessThan
{
  return self->_batteryLevelLessThan;
}

- (void)setBatteryLevelLessThan:(id)a3
{
}

- (int)plugInState
{
  return self->_plugInState;
}

- (void)setPlugInState:(int)a3
{
  self->_plugInState = a3;
}

- (int)screenOnState
{
  return self->_screenOnState;
}

- (void)setScreenOnState:(int)a3
{
  self->_screenOnState = a3;
}

- (int)networkState
{
  return self->_networkState;
}

- (void)setNetworkState:(int)a3
{
  self->_networkState = a3;
}

- (int)wifiState
{
  return self->_wifiState;
}

- (void)setWifiState:(int)a3
{
  self->_wifiState = a3;
}

- (int)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallState:(int)a3
{
  self->_phoneCallState = a3;
}

- (int)carplayState
{
  return self->_carplayState;
}

- (void)setCarplayState:(int)a3
{
  self->_carplayState = a3;
}

- (int)mediaPlayingState
{
  return self->_mediaPlayingState;
}

- (void)setMediaPlayingState:(int)a3
{
  self->_mediaPlayingState = a3;
}

- (int)waking
{
  return self->_waking;
}

- (void)setWaking:(int)a3
{
  self->_waking = a3;
}

- (void).cxx_destruct
{
}

@end