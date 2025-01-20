@interface TVSettingsRemotesFacade
+ (void)setName:(id)a3 forDeviceUUID:(id)a4 withCompletionHandler:(id)a5;
- (NSArray)editableVolumeConfigurations;
- (NSArray)thirdPartyConfigurations;
- (NSArray)volumeConfigurations;
- (PBSExternalControlSystem)externalControlSystem;
- (TVSettingsRemotesFacade)init;
- (int64_t)updateVersion;
- (void)_externalControlSystemConfigurationsChanged:(id)a3;
- (void)_fetchConfigurations;
- (void)_updateWithVolumeConfigurations:(id)a3 thirdPartyRemotesConfigurations:(id)a4;
- (void)dealloc;
- (void)deleteConfiguration:(id)a3 withCompletionHandler:(id)a4;
- (void)selectConfiguration:(id)a3;
- (void)setExternalControlSystem:(id)a3;
- (void)setName:(id)a3 forConfiguration:(id)a4 withCompletionHandler:(id)a5;
- (void)setUpdateVersion:(int64_t)a3;
@end

@implementation TVSettingsRemotesFacade

- (TVSettingsRemotesFacade)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsRemotesFacade;
  v2 = -[TVSettingsRemotesFacade init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
    externalControlSystem = v2->_externalControlSystem;
    v2->_externalControlSystem = (PBSExternalControlSystem *)v3;

    -[TVSettingsRemotesFacade _fetchConfigurations](v2, "_fetchConfigurations");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_externalControlSystemConfigurationsChanged:" name:PBSExternalControlSystemConfigurationChanged object:0];
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsRemotesFacade;
  -[TVSettingsRemotesFacade dealloc](&v4, "dealloc");
}

- (void)selectConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000E7700();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Selecting remote configuration... {configuration=%{public}@}",  buf,  0xCu);
  }

  externalControlSystem = self->_externalControlSystem;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 underlyingConfiguration]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E7740;
  v10[3] = &unk_10018EC08;
  id v11 = v4;
  id v9 = v4;
  -[PBSExternalControlSystem selectVolumeButtonConfiguration:withCompletion:]( externalControlSystem,  "selectVolumeButtonConfiguration:withCompletion:",  v8,  v10);
}

- (void)deleteConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000E7700();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Deleting remote configuration... {configuration=%{public}@}",  buf,  0xCu);
  }

  externalControlSystem = self->_externalControlSystem;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E7928;
  v13[3] = &unk_100192D98;
  id v14 = v7;
  id v12 = v7;
  -[PBSExternalControlSystem removeIRDeviceWithUUID:withCompletion:]( externalControlSystem,  "removeIRDeviceWithUUID:withCompletion:",  v11,  v13);
}

- (void)setName:(id)a3 forConfiguration:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_opt_class(self);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v9 UUID]);

  [v11 setName:v10 forDeviceUUID:v12 withCompletionHandler:v8];
}

+ (void)setName:(id)a3 forDeviceUUID:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E7AE8;
  v12[3] = &unk_100192D98;
  id v13 = v7;
  id v11 = v7;
  [v10 setName:v9 forExternalIRDeviceWithUUID:v8 withCompletion:v12];
}

- (void)_fetchConfigurations
{
  id v3 = sub_1000E7700();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Fetching configurations...", buf, 2u);
  }

  int64_t updateVersion = self->_updateVersion;
  id v6 = dispatch_group_create();
  *(void *)buf = 0LL;
  v21 = buf;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_1000E7D64;
  v24 = sub_1000E7D74;
  id v25 = 0LL;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_1000E7D64;
  v18[4] = sub_1000E7D74;
  id v19 = 0LL;
  dispatch_group_enter(v6);
  externalControlSystem = self->_externalControlSystem;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E7D7C;
  v15[3] = &unk_100194F68;
  v17 = buf;
  id v8 = v6;
  id v16 = v8;
  -[PBSExternalControlSystem getVolumeButtonConfigurationsWithCompletion:]( externalControlSystem,  "getVolumeButtonConfigurationsWithCompletion:",  v15);
  dispatch_group_enter(v8);
  id v9 = self->_externalControlSystem;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E7DC8;
  v12[3] = &unk_100194F68;
  id v14 = v18;
  id v10 = v8;
  id v13 = v10;
  -[PBSExternalControlSystem getAvailableIRLearningConfigurationsWithCompletion:]( v9,  "getAvailableIRLearningConfigurationsWithCompletion:",  v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000E7E14;
  v11[3] = &unk_100194F90;
  v11[4] = self;
  v11[5] = buf;
  v11[6] = v18;
  v11[7] = updateVersion + 1;
  dispatch_group_notify(v10, &_dispatch_main_q, v11);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_updateWithVolumeConfigurations:(id)a3 thirdPartyRemotesConfigurations:(id)a4
{
  externalControlSystem = self->_externalControlSystem;
  id v42 = a4;
  id v43 = a3;
  v41 = (void *)objc_claimAutoreleasedReturnValue( -[PBSExternalControlSystem selectedVolumeButtonConfiguration]( externalControlSystem,  "selectedVolumeButtonConfiguration"));
  id v45 = (id)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  1LL));
  uint64_t v7 = [v45 isEnabled] ^ 1;
  id v8 = [v45 isAutomaticallyConfigured];
  BOOL v9 = 0LL;
  id v10 = objc_alloc(&OBJC_CLASS___TVSettingsRemoteConfiguration);
  uint64_t v11 = TSKLocString(@"RCVCAutoMenuItem");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = TSKLocString(@"RCVCAutoMenuItemDescription");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = -[TVSettingsRemoteConfiguration initWithIdentifier:type:displayName:displayDescription:isSelected:underlyingConfiguration:]( v10,  "initWithIdentifier:type:displayName:displayDescription:isSelected:underlyingConfiguration:",  @"Auto",  1LL,  v12,  v14,  v8,  0LL);

  id v16 = objc_alloc(&OBJC_CLASS___TVSettingsRemoteConfiguration);
  uint64_t v17 = TSKLocString(@"RCVCOffMenuItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = TSKLocString(@"RCVCOffMenuItemDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[PBSVolumeButtonConfiguration offConfiguration]( &OBJC_CLASS___PBSVolumeButtonConfiguration,  "offConfiguration"));
  uint64_t v22 = -[TVSettingsRemoteConfiguration initWithIdentifier:type:displayName:displayDescription:isSelected:underlyingConfiguration:]( v16,  "initWithIdentifier:type:displayName:displayDescription:isSelected:underlyingConfiguration:",  @"Off",  0LL,  v18,  v20,  v7,  v21);

  v23 = objc_alloc(&OBJC_CLASS___TVSettingsRemoteConfiguration);
  uint64_t v24 = TSKLocString(@"RCVCManualViaCECMenuItemTemplate");
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = TSKLocString(@"RCVCManualViaCECMenuItemDescription");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[PBSVolumeButtonConfiguration CECConfiguration]( &OBJC_CLASS___PBSVolumeButtonConfiguration,  "CECConfiguration"));
  v44 = -[TVSettingsRemoteConfiguration initWithIdentifier:type:displayName:displayDescription:isSelected:underlyingConfiguration:]( v23,  "initWithIdentifier:type:displayName:displayDescription:isSelected:underlyingConfiguration:",  @"CEC",  2LL,  v25,  v27,  v9,  v28);

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1000E8270;
  v49[3] = &unk_100194FB8;
  char v51 = v7;
  id v29 = v41;
  id v50 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bs_map:", v49));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bs_filter:", &stru_100194FD8));
  v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v32, "addObject:", v15);
  -[NSMutableArray addObjectsFromArray:](v32, "addObjectsFromArray:", v30);
  -[NSMutableArray addObject:](v32, "addObject:", v22);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000E83DC;
  v46[3] = &unk_100194FB8;
  char v48 = v7;
  id v47 = v29;
  id v33 = v29;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bs_map:", v46));

  -[TVSettingsRemotesFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"volumeConfigurations");
  -[TVSettingsRemotesFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"editableVolumeConfigurations");
  -[TVSettingsRemotesFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"thirdPartyConfigurations");
  v35 = (NSArray *)-[NSMutableArray copy](v32, "copy");
  volumeConfigurations = self->_volumeConfigurations;
  self->_volumeConfigurations = v35;

  v37 = (NSArray *)[v31 copy];
  editableVolumeConfigurations = self->_editableVolumeConfigurations;
  self->_editableVolumeConfigurations = v37;

  v39 = (NSArray *)[v34 copy];
  thirdPartyConfigurations = self->_thirdPartyConfigurations;
  self->_thirdPartyConfigurations = v39;

  -[TVSettingsRemotesFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"volumeConfigurations");
  -[TVSettingsRemotesFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"editableVolumeConfigurations");
  -[TVSettingsRemotesFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"thirdPartyConfigurations");
}

- (void)_externalControlSystemConfigurationsChanged:(id)a3
{
  id v4 = sub_1000E7700();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "External control configurations changed. Will reload configurations...",  buf,  2u);
  }

  [(id)objc_opt_class(self) cancelPreviousPerformRequestsWithTarget:self selector:"_fetchConfigurations" object:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8530;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (NSArray)volumeConfigurations
{
  return self->_volumeConfigurations;
}

- (NSArray)editableVolumeConfigurations
{
  return self->_editableVolumeConfigurations;
}

- (NSArray)thirdPartyConfigurations
{
  return self->_thirdPartyConfigurations;
}

- (PBSExternalControlSystem)externalControlSystem
{
  return self->_externalControlSystem;
}

- (void)setExternalControlSystem:(id)a3
{
}

- (int64_t)updateVersion
{
  return self->_updateVersion;
}

- (void)setUpdateVersion:(int64_t)a3
{
  self->_int64_t updateVersion = a3;
}

- (void).cxx_destruct
{
}

@end