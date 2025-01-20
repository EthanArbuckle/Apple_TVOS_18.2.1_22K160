@interface FAFetchSettingsPresetsOperation
- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3;
- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3 fetchFromCache:(BOOL)a4;
- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3 presetsProvider:(id)a4;
- (FAPresetsProviderProtocol)presetsProvider;
- (id)_currentPresets:(id)a3 expectedPreset:(id)a4;
- (id)_presetsWithCurrentConfiguration:(id)a3 expectedPreset:(id)a4;
- (id)familyCircleProvider;
- (id)presetsForMemberWithAltDSID:(id)a3;
- (id)presetsForMemberWithAltDSID:(id)a3 age:(id)a4;
- (void)setFamilyCircleProvider:(id)a3;
- (void)setPresetsProvider:(id)a3;
@end

@implementation FAFetchSettingsPresetsOperation

- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3 presetsProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___FAFetchSettingsPresetsOperation;
  v8 = -[FAFetchSettingsPresetsOperation init](&v12, "init");
  if (v8)
  {
    id v9 = objc_retainBlock(v6);
    id familyCircleProvider = v8->_familyCircleProvider;
    v8->_id familyCircleProvider = v9;

    objc_storeStrong((id *)&v8->_presetsProvider, a4);
  }

  return v8;
}

- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3
{
  return -[FAFetchSettingsPresetsOperation initWithFamilyCircleProvider:fetchFromCache:]( self,  "initWithFamilyCircleProvider:fetchFromCache:",  a3,  0LL);
}

- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3 fetchFromCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___FANetworkService);
  v8 = objc_alloc_init(&OBJC_CLASS___FADeviceInfo);
  id v9 = objc_alloc_init(&OBJC_CLASS___FAURLConfiguration);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLSession sharedSession](&OBJC_CLASS___AAURLSession, "sharedSession"));
  v11 = -[FANetworkService initWithAccount:deviceInfo:urlProvider:urlSession:]( v7,  "initWithAccount:deviceInfo:urlProvider:urlSession:",  0LL,  v8,  v9,  v10);

  objc_super v12 = objc_alloc_init(&OBJC_CLASS___FAStoreFrontProvider);
  if (v4)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___FASettingPresetsCache);
    v14 = -[FACachedPresetsProvider initWithNetworkService:cache:storeFrontProvider:]( objc_alloc(&OBJC_CLASS___FACachedPresetsProvider),  "initWithNetworkService:cache:storeFrontProvider:",  v11,  v13,  v12);
  }

  else
  {
    v14 = -[FAICSSPresetsProvider initWithNetworkService:storeFrontProvider:]( objc_alloc(&OBJC_CLASS___FAICSSPresetsProvider),  "initWithNetworkService:storeFrontProvider:",  v11,  v12);
  }

  v15 = -[FAFetchSettingsPresetsOperation initWithFamilyCircleProvider:presetsProvider:]( self,  "initWithFamilyCircleProvider:presetsProvider:",  v6,  v14);

  return v15;
}

- (id)_currentPresets:(id)a3 expectedPreset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005F04;
  v13[3] = &unk_100041258;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = -[AAFPromise initWithBlock:](v8, "initWithBlock:", v13);

  return v11;
}

- (id)_presetsWithCurrentConfiguration:(id)a3 expectedPreset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 sources]);
  id v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v9)
  {
    id v10 = v9;
    id v33 = v6;
    id obj = v8;
    uint64_t v11 = *(void *)v41;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v41 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      unsigned __int8 v15 = [v14 isEqualToString:@"com.apple.ScreenTime"];

      if ((v15 & 1) != 0) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v8 = obj;
        id v10 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v10) {
          goto LABEL_3;
        }
        id v16 = 0LL;
        v17 = obj;
        id v6 = v33;
        goto LABEL_34;
      }
    }

    id v16 = v13;
    id v8 = obj;

    if (!v16)
    {
      id v6 = v33;
      goto LABEL_36;
    }

    id v32 = v16;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v16 configuration]);
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v35 = (id)objc_claimAutoreleasedReturnValue([v31 values]);
    id v18 = [v35 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v35);
          }
          v22 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          if ([v22 isEqual:@"media.settings.allowBookstoreErotica"])
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isExplicitMediaAllowed]));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v23, v22);
          }

          if ([v22 isEqual:@"system.apple.allowRemoval"])
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isDeletingAppsAllowed]));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v24, v22);
          }

          if ([v22 isEqual:@"system.ratings.ratingTVShows"])
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue([v5 allowedTVRating]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v25, v22);
          }

          if ([v22 isEqual:@"system.ratings.allowExplicitContent"])
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isExplicitMediaAllowed]));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v26, v22);
          }

          if ([v22 isEqual:@"system.ratings.ratingApps"])
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue([v5 allowedAppStoreRating]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v27, v22);
          }

          if ([v22 isEqual:@"system.music.allowMusicVideos"])
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 areMusicVideosAllowed]));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v28, v22);
          }

          if ([v22 isEqual:@"system.ratings.ratingMovies"])
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue([v5 allowedMovieRating]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v29, v22);
          }
        }

        id v19 = [v35 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v19);
    }

    id v16 = [[FASettingsPreset alloc] initWithDictionary:v7];

    id v6 = v33;
    id v8 = obj;
    v17 = v32;
  }

  else
  {
    id v16 = 0LL;
    v17 = v8;
  }

- (id)presetsForMemberWithAltDSID:(id)a3
{
  return -[FAFetchSettingsPresetsOperation presetsForMemberWithAltDSID:age:]( self,  "presetsForMemberWithAltDSID:age:",  a3,  0LL);
}

- (id)presetsForMemberWithAltDSID:(id)a3 age:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[FAFetchSettingsPresetsOperation familyCircleProvider](self, "familyCircleProvider"));
  uint64_t v9 = v8[2]();
  v27 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v32[0] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchSettingsPresetsOperation presetsProvider](self, "presetsProvider"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v26 availablePresets]);
  v32[1] = v25;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AAFPromise all:](&OBJC_CLASS___AAFPromise, "all:", v10));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 then]);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100006750;
  v29[3] = &unk_1000412A0;
  id v30 = v6;
  id v31 = v7;
  v13 = (uint64_t (*)(void *, void *))v12[2];
  id v24 = v7;
  id v14 = v6;
  uint64_t v15 = v13(v12, v29);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v16 then]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100006A68;
  v28[3] = &unk_1000412C8;
  v28[4] = self;
  uint64_t v18 = ((uint64_t (**)(void, void *))v17)[2](v17, v28);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v19 then]);
  uint64_t v21 = ((uint64_t (**)(void, Block_layout *))v20)[2](v20, &stru_100041308);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  return v22;
}

- (id)familyCircleProvider
{
  return self->_familyCircleProvider;
}

- (void)setFamilyCircleProvider:(id)a3
{
}

- (FAPresetsProviderProtocol)presetsProvider
{
  return self->_presetsProvider;
}

- (void)setPresetsProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end