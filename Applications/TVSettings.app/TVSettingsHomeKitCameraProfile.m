@interface TVSettingsHomeKitCameraProfile
- (BOOL)controlCenterAndSiriEnabled;
- (BOOL)doorbellNotificationsEnabled;
- (BOOL)legacyMotionNotificationsEnabled;
- (BOOL)recordingDisabled;
- (BOOL)supportsDoorbellNotifications;
- (BOOL)supportsLegacyMotionNotifications;
- (BOOL)supportsSmartNotifications;
- (HFCameraItem)cameraItem;
- (NSString)name;
- (NSString)profileIdentifier;
- (TVSettingsHomeKitCameraProfile)initWithCameraItem:(id)a3 controlCenterAndSiriEnabled:(BOOL)a4;
- (id)_conditionForTriggerTime:(int64_t)a3;
- (id)_doorbellBulletinNotification;
- (id)_legacyMotionBulletinNotification;
- (id)_smartDetectionBulletinNotification;
- (id)cameraProfile;
- (int64_t)smartNotificationsState;
- (int64_t)triggerTime;
- (unint64_t)significantEventTypes;
- (void)setCameraItem:(id)a3;
- (void)setControlCenterAndSiriEnabled:(BOOL)a3;
- (void)setDoorbellNotificationsEnabled:(BOOL)a3;
- (void)setLegacyMotionNotificationsEnabled:(BOOL)a3;
- (void)setSmartNotificationsState:(int64_t)a3;
- (void)setTriggerTime:(int64_t)a3;
- (void)toggledSignificantEventType:(unint64_t)a3;
@end

@implementation TVSettingsHomeKitCameraProfile

- (TVSettingsHomeKitCameraProfile)initWithCameraItem:(id)a3 controlCenterAndSiriEnabled:(BOOL)a4
{
  id v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitCameraProfile;
  v8 = -[TVSettingsHomeKitCameraProfile init](&v34, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cameraItem, a3);
    v9->_controlCenterAndSiriEnabled = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile _doorbellBulletinNotification](v9, "_doorbellBulletinNotification"));
    v9->_supportsDoorbellNotifications = v10 != 0LL;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile _doorbellBulletinNotification](v9, "_doorbellBulletinNotification"));
    v9->_doorbellNotificationsEnabled = [v11 isEnabled];

    v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( v9,  "_smartDetectionBulletinNotification"));
    v9->_supportsSmartNotifications = v12 != 0LL;

    v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _legacyMotionBulletinNotification]( v9,  "_legacyMotionBulletinNotification"));
    v9->_supportsLegacyMotionNotifications = v13 != 0LL;

    v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _legacyMotionBulletinNotification]( v9,  "_legacyMotionBulletinNotification"));
    v9->_legacyMotionNotificationsEnabled = [v14 isEnabled];

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[HFTimeCondition defaultConditionForType:]( &OBJC_CLASS___HFTimeCondition,  "defaultConditionForType:",  0LL));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[HFTimeCondition defaultConditionForType:]( &OBJC_CLASS___HFTimeCondition,  "defaultConditionForType:",  1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( v9,  "_smartDetectionBulletinNotification"));
    unsigned int v18 = [v17 isEnabled];

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( v9,  "_smartDetectionBulletinNotification"));
      id v20 = [v19 significantEventTypes];
      unint64_t v21 = (unint64_t)v20;
      uint64_t v22 = 3LL;
      if (v20) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 2LL;
      }

      v9->_smartNotificationsState = v23;
      v9->_significantEventTypes = v21;
      v24 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( v9,  "_smartDetectionBulletinNotification"));
    }

    else
    {
      v9->_smartNotificationsState = 0LL;
      if (!v9->_legacyMotionNotificationsEnabled)
      {
LABEL_18:
        v32 = (void *)objc_claimAutoreleasedReturnValue([v7 profile]);
        v9->_recordingDisabled = objc_msgSend(v32, "hf_cameraIsNotSetToRecord");

        goto LABEL_19;
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _legacyMotionBulletinNotification]( v9,  "_legacyMotionBulletinNotification"));
    }

    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 condition]);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[HFConditionCollection conditionCollectionForPredicate:]( &OBJC_CLASS___HFConditionCollection,  "conditionCollectionForPredicate:",  v26));

    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 conditions]);
    LODWORD(v26) = [v28 containsObject:v15];

    if ((_DWORD)v26)
    {
      uint64_t v29 = 1LL;
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v27 conditions]);
      unsigned int v31 = [v30 containsObject:v16];

      if (!v31)
      {
        v9->_triggerTime = 0LL;
        goto LABEL_17;
      }

      uint64_t v29 = 2LL;
    }

    v9->_triggerTime = v29;
LABEL_17:

    goto LABEL_18;
  }

- (id)cameraProfile
{
  return -[HFCameraItem profile](self->_cameraItem, "profile");
}

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile cameraProfile](self, "cameraProfile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessory]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  return (NSString *)v4;
}

- (NSString)profileIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HFCameraItem profile](self->_cameraItem, "profile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uniqueIdentifier]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);

  return (NSString *)v4;
}

- (void)setControlCenterAndSiriEnabled:(BOOL)a3
{
  if (self->_controlCenterAndSiriEnabled != a3)
  {
    BOOL v3 = a3;
    -[TVSettingsHomeKitCameraProfile willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"controlCenterAndSiriEnabled");
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile profileIdentifier](self, "profileIdentifier"));
      [v5 removeProfileIdentifierFromDisabledList:v6];
    }

    else
    {
      -[TVSettingsHomeKitCameraProfile setDoorbellNotificationsEnabled:](self, "setDoorbellNotificationsEnabled:", 0LL);
      -[TVSettingsHomeKitCameraProfile setSmartNotificationsState:](self, "setSmartNotificationsState:", 0LL);
      -[TVSettingsHomeKitCameraProfile setLegacyMotionNotificationsEnabled:]( self,  "setLegacyMotionNotificationsEnabled:",  0LL);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile profileIdentifier](self, "profileIdentifier"));
      [v5 addProfileIdentifierToDisabledList:v6];
    }

    self->_controlCenterAndSiriEnabled = v3;
    -[TVSettingsHomeKitCameraProfile didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"controlCenterAndSiriEnabled");
  }

- (void)setDoorbellNotificationsEnabled:(BOOL)a3
{
  if (self->_doorbellNotificationsEnabled != a3)
  {
    BOOL v3 = a3;
    self->_doorbellNotificationsEnabled = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _doorbellBulletinNotification]( self,  "_doorbellBulletinNotification"));
    [v5 setEnabled:v3];

    v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _doorbellBulletinNotification]( self,  "_doorbellBulletinNotification"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100079FCC;
    v7[3] = &unk_100191AA8;
    v7[4] = self;
    BOOL v8 = v3;
    [v6 commitWithCompletionHandler:v7];
  }

- (void)setSmartNotificationsState:(int64_t)a3
{
  if (self->_smartNotificationsState != a3)
  {
    self->_smartNotificationsState = a3;
    __asm { BR              X9 }
  }

- (void)setLegacyMotionNotificationsEnabled:(BOOL)a3
{
  if (self->_legacyMotionNotificationsEnabled != a3)
  {
    BOOL v3 = a3;
    self->_legacyMotionNotificationsEnabled = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _legacyMotionBulletinNotification]( self,  "_legacyMotionBulletinNotification"));
    [v5 setEnabled:v3];

    v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _legacyMotionBulletinNotification]( self,  "_legacyMotionBulletinNotification"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10007A440;
    v7[3] = &unk_100191AA8;
    v7[4] = self;
    BOOL v8 = v3;
    [v6 commitWithCompletionHandler:v7];
  }

- (void)toggledSignificantEventType:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( self,  "_smartDetectionBulletinNotification"));
  unint64_t v6 = (unint64_t)[v5 significantEventTypes];

  if ((a3 & ~v6) != 0)
  {
    id v11 = (id)(v6 & 0xFFFFFFFFFFFFFFFELL | a3);
  }

  else
  {
    unint64_t v7 = v6 & ~a3;
    if (v7 > 1)
    {
      id v11 = (id)(v7 & 0xFFFFFFFFFFFFFFFELL);
    }

    else
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile cameraItem](self, "cameraItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 profile]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userSettings]);
      id v11 = [v10 recordingEventTriggers];
    }
  }

  self->_significantEventTypes = (unint64_t)v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( self,  "_smartDetectionBulletinNotification"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[HMCameraBulletinBoardSmartNotification predicateForSignificantEventTypes:personFamiliarityOptions:]( HMCameraBulletinBoardSmartNotification,  "predicateForSignificantEventTypes:personFamiliarityOptions:",  v11,  [v12 personFamiliarityOptions]));

  v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( self,  "_smartDetectionBulletinNotification"));
  [v14 setCondition:v13];

  v15 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( self,  "_smartDetectionBulletinNotification"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007A6B0;
  v16[3] = &unk_100191AD0;
  v16[4] = self;
  v16[5] = a3;
  [v15 commitWithCompletionHandler:v16];
}

- (void)setTriggerTime:(int64_t)a3
{
  if (self->_triggerTime == a3) {
    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile _conditionForTriggerTime:](self, "_conditionForTriggerTime:"));
  self->_triggerTime = a3;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( self,  "_smartDetectionBulletinNotification"));
  unsigned int v7 = [v6 isEnabled];

  if (v7)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( self,  "_smartDetectionBulletinNotification"));
  }

  else
  {
    if (!self->_legacyMotionNotificationsEnabled)
    {
      id v11 = 0LL;
      if (!v5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _legacyMotionBulletinNotification]( self,  "_legacyMotionBulletinNotification"));
  }

  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 condition]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[HFConditionCollection conditionCollectionForPredicate:]( &OBJC_CLASS___HFConditionCollection,  "conditionCollectionForPredicate:",  v10));

  if (v5) {
LABEL_7:
  }
    [v11 removeCondition:v5];
LABEL_8:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile _conditionForTriggerTime:](self, "_conditionForTriggerTime:", a3));
  if (v12) {
    [v11 addCondition:v12];
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 predicate]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 conditions]);
  unsigned __int8 v15 = objc_msgSend(v14, "na_any:", &stru_100191B10);

  if ((v15 & 1) != 0)
  {
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    v33 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 conditions]);
    id v18 = [v17 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
          uint64_t v23 = objc_opt_class(&OBJC_CLASS___HFCameraSmartDetectionCondition);
          if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( self,  "_smartDetectionBulletinNotification"));
            [v24 setCondition:v13];

            v25 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _smartDetectionBulletinNotification]( self,  "_smartDetectionBulletinNotification"));
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472LL;
            v36[2] = sub_10007AD1C;
            v36[3] = &unk_100191650;
            v36[4] = self;
            id v37 = v13;
            [v25 commitWithCompletionHandler:v36];
          }

          else
          {
            -[NSMutableArray addObject:](v16, "addObject:", v22);
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }

      while (v19);
    }

    id v26 = [[HFConditionCollection alloc] initWithConditions:v16];
    v27 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _legacyMotionBulletinNotification]( self,  "_legacyMotionBulletinNotification"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v26 predicate]);
    [v27 setCondition:v28];

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _legacyMotionBulletinNotification]( self,  "_legacyMotionBulletinNotification"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10007AE18;
    v34[3] = &unk_100191650;
    v34[4] = self;
    id v35 = v13;
    id v30 = v13;
    [v29 commitWithCompletionHandler:v34];

    id v11 = v33;
  }

  else
  {
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _legacyMotionBulletinNotification]( self,  "_legacyMotionBulletinNotification"));
    [v31 setCondition:v13];

    v32 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitCameraProfile _legacyMotionBulletinNotification]( self,  "_legacyMotionBulletinNotification"));
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10007AC20;
    v42[3] = &unk_100191650;
    v42[4] = self;
    id v43 = v13;
    v16 = v13;
    [v32 commitWithCompletionHandler:v42];
  }
}

- (id)_doorbellBulletinNotification
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile cameraProfile](self, "cameraProfile"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessory]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_serviceOfType:", HMServiceTypeDoorbell));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bulletinBoardNotification]);

  return v5;
}

- (id)_smartDetectionBulletinNotification
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile cameraProfile](self, "cameraProfile"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userSettings]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 smartNotificationBulletin]);

  return v4;
}

- (id)_legacyMotionBulletinNotification
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCameraProfile cameraProfile](self, "cameraProfile"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessory]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_serviceOfType:", HMServiceTypeMotionSensor));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bulletinBoardNotification]);

  return v5;
}

- (id)_conditionForTriggerTime:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v6 = 0LL;
    goto LABEL_5;
  }

  v5 = 0LL;
  if (a3 == 2)
  {
    uint64_t v6 = 1LL;
LABEL_5:
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[HFTimeCondition defaultConditionForType:]( &OBJC_CLASS___HFTimeCondition,  "defaultConditionForType:",  v6,  v3,  v4));
  }

  return v5;
}

- (HFCameraItem)cameraItem
{
  return self->_cameraItem;
}

- (void)setCameraItem:(id)a3
{
}

- (BOOL)controlCenterAndSiriEnabled
{
  return self->_controlCenterAndSiriEnabled;
}

- (BOOL)supportsDoorbellNotifications
{
  return self->_supportsDoorbellNotifications;
}

- (BOOL)doorbellNotificationsEnabled
{
  return self->_doorbellNotificationsEnabled;
}

- (BOOL)supportsSmartNotifications
{
  return self->_supportsSmartNotifications;
}

- (int64_t)smartNotificationsState
{
  return self->_smartNotificationsState;
}

- (unint64_t)significantEventTypes
{
  return self->_significantEventTypes;
}

- (int64_t)triggerTime
{
  return self->_triggerTime;
}

- (BOOL)supportsLegacyMotionNotifications
{
  return self->_supportsLegacyMotionNotifications;
}

- (BOOL)legacyMotionNotificationsEnabled
{
  return self->_legacyMotionNotificationsEnabled;
}

- (BOOL)recordingDisabled
{
  return self->_recordingDisabled;
}

- (void).cxx_destruct
{
}

@end