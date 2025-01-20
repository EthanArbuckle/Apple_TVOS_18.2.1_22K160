@interface TVSettingsPosterBoardFacade
- (NSArray)availablePosters;
- (PRSService)posterBoardService;
- (PRSWallpaperObserver)observer;
- (TVSettingsPosterBoardFacade)init;
- (_TtC10TVSettings20TVSettingsPosterItem)selectedPosterItem;
- (id)knownPosterItemWithID:(id)a3;
- (void)_onActivePosterChangedWithObserverState:(id)a3;
- (void)_onPosterCollectionChangedWithUpdatedCollection:(id)a3;
- (void)dealloc;
- (void)setAvailablePosters:(id)a3;
- (void)setSelectedPosterItem:(id)a3;
- (void)setSelectedPosterWithID:(id)a3;
@end

@implementation TVSettingsPosterBoardFacade

- (TVSettingsPosterBoardFacade)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSettingsPosterBoardFacade;
  v2 = -[TVSettingsPosterBoardFacade init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    p_role = &v2->_role;
    objc_storeStrong((id *)&v2->_role, PRSPosterRoleAmbient);
    v5 = objc_opt_new(&OBJC_CLASS___PRSService);
    posterBoardService = v3->_posterBoardService;
    v3->_posterBoardService = v5;

    v7 = -[PRSWallpaperObserver initWithExplanation:]( objc_alloc(&OBJC_CLASS___PRSWallpaperObserver),  "initWithExplanation:",  @"TVSettings");
    observer = v3->_observer;
    v3->_observer = v7;

    objc_initWeak(&location, v3);
    id v9 = objc_alloc(&OBJC_CLASS___PRSPosterRoleActivePosterObserver);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", *p_role));
    id v11 = [v9 initWithRoles:v10 needsSandboxExtensions:1];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000AC8AC;
    v17[3] = &unk_100193508;
    objc_copyWeak(&v18, &location);
    [v11 setHandler:v17];
    id v12 = [[PRSPosterRoleCollectionObserver alloc] initWithRole:*p_role needsSandboxExtensions:1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000AC8F4;
    v15[3] = &unk_100193530;
    objc_copyWeak(&v16, &location);
    [v12 setHandler:v15];
    v13 = (void *)objc_opt_new(&OBJC_CLASS___PRSWallpaperObserverConfiguration);
    [v13 setActivePosterRoleObserver:v11];
    [v13 setPostersCollectionRoleObserver:v12];
    -[PRSWallpaperObserver activateWithConfiguration:](v3->_observer, "activateWithConfiguration:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  observer = self->_observer;
  self->_observer = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsPosterBoardFacade;
  -[TVSettingsPosterBoardFacade dealloc](&v4, "dealloc");
}

- (void)setSelectedPosterWithID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPosterBoardFacade selectedPosterItem](self, "selectedPosterItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPosterBoardFacade knownPosterItemWithID:](self, "knownPosterItemWithID:", v4));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 model]);
    if (v9)
    {
      posterBoardService = self->_posterBoardService;
      uint64_t v11 = PRSPosterRoleAmbient;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000ACAF0;
      v12[3] = &unk_10018EB78;
      objc_copyWeak(&v14, &location);
      id v13 = v8;
      -[PRSService updateSelectedForRoleIdentifier:newlySelectedConfiguration:completion:]( posterBoardService,  "updateSelectedForRoleIdentifier:newlySelectedConfiguration:completion:",  v11,  v9,  v12);

      objc_destroyWeak(&v14);
    }
  }

  objc_destroyWeak(&location);
}

- (void)setSelectedPosterItem:(id)a3
{
  id v4 = (_TtC10TVSettings20TVSettingsPosterItem *)a3;
  -[TVSettingsPosterItem setSelected:](self->_selectedPosterItem, "setSelected:", 0LL);
  selectedPosterItem = self->_selectedPosterItem;
  self->_selectedPosterItem = v4;
  v6 = v4;

  -[TVSettingsPosterItem setSelected:](v6, "setSelected:", 1LL);
}

- (void)_onActivePosterChangedWithObserverState:(id)a3
{
  v15 = (void *)objc_claimAutoreleasedReturnValue([a3 activePoster]);
  id v4 = -[TVSettingsPosterItem initWithModel:]( objc_alloc(&OBJC_CLASS____TtC10TVSettings20TVSettingsPosterItem),  "initWithModel:",  v15);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v5 = self->_availablePosters;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPosterItem identifier](v4, "identifier"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        id v13 = [v11 isEqualToString:v12];

        [v10 setSelected:v13];
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v7);
  }

  -[TVSettingsPosterBoardFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"availablePosters");
  -[TVSettingsPosterBoardFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"selectedPosterItem");
  selectedPosterItem = self->_selectedPosterItem;
  self->_selectedPosterItem = v4;

  -[TVSettingsPosterBoardFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"availablePosters");
  -[TVSettingsPosterBoardFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"selectedPosterItem");
}

- (void)_onPosterCollectionChangedWithUpdatedCollection:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 array]);
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[TVSettingsPosterItem initWithModel:]( objc_alloc(&OBJC_CLASS____TtC10TVSettings20TVSettingsPosterItem),  "initWithModel:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i));
        if (v10)
        {
          [v4 addObject:v10];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPosterItem identifier](v10, "identifier"));
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPosterItem identifier](self->_selectedPosterItem, "identifier"));
          unsigned int v13 = [v11 isEqualToString:v12];

          if (v13) {
            -[TVSettingsPosterItem setSelected:](v10, "setSelected:", 1LL);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  [v4 sortUsingSelector:"orderCompareTo:"];
  -[TVSettingsPosterBoardFacade setAvailablePosters:](self, "setAvailablePosters:", v4);
}

- (id)knownPosterItemWithID:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPosterBoardFacade availablePosters](self, "availablePosters", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if ((v12 & 1) != 0)
        {
          id v14 = v10;
          goto LABEL_13;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = sub_1000ACBC8();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
    sub_1000FAD00();
  }
  id v14 = 0LL;
LABEL_13:

  return v14;
}

- (NSArray)availablePosters
{
  return self->_availablePosters;
}

- (void)setAvailablePosters:(id)a3
{
}

- (_TtC10TVSettings20TVSettingsPosterItem)selectedPosterItem
{
  return self->_selectedPosterItem;
}

- (PRSService)posterBoardService
{
  return self->_posterBoardService;
}

- (PRSWallpaperObserver)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
}

@end