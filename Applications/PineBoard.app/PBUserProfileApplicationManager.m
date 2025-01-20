@interface PBUserProfileApplicationManager
+ (PBUserProfileApplicationManager)sharedInstance;
+ (id)_contentApplicationIdentifiers;
- (BOOL)isSettingNewUser;
- (NSMutableSet)personaEnabledApplicationIdentifiers;
- (NSOperationQueue)manageApplicationsOperationQueue;
- (NSSet)updatingApplicationIdentifiers;
- (NSString)debugDescription;
- (OS_dispatch_queue)workQueue;
- (PBAppInfoController)_appInfoController;
- (PBSUserProfile)selectedUserProfile;
- (PBSUserProfile)updatingUserProfile;
- (TVSObserverSet)observers;
- (id)_initWithAppInfoController:(id)a3;
- (id)_initWithAppInfoStore:(id)a3;
- (void)_processNewSelectedUserProfile:(id)a3;
- (void)_workQueue_addManageApplicationsOperationsWithPersonaApplicationIdentifiers:(id)a3 updatingApplicationIdentifiers:(id)a4;
- (void)_workQueue_addNotifyObserversDidUpdateApplicationsOperationsWithApplicationIdentifiers:(id)a3;
- (void)_workQueue_addNotifyObserversWillUpdateApplicationsOperationsWithApplicationIdentifiers:(id)a3;
- (void)_workQueue_didUpdatePersonaEnabledApplicationsWithAddedApplicationIdentifiers:(id)a3 removedApplicationIdentifiers:(id)a4;
- (void)_workQueue_handleLanguageChangeFromProfile:(id)a3 toProfile:(id)a4;
- (void)_workQueue_quitApplicationsRunningWithPersonaUniqueString:(id)a3 completionHandler:(id)a4;
- (void)_workQueue_setSelectedUserProfile:(id)a3;
- (void)addObserver:(id)a3;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)quitApplicationsRunningWithPersonaUniqueString:(id)a3 completionHandler:(id)a4;
- (void)quitGracefullyApplicationsRunningWithPersonaUniqueString:(id)a3 completionHandler:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation PBUserProfileApplicationManager

- (id)_initWithAppInfoStore:(id)a3
{
  id v4 = a3;
  v5 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( objc_alloc(&OBJC_CLASS___PBAppInfoController),  "initWithInfoStore:filter:delegate:",  v4,  &stru_1003DBD28,  0LL);

  id v6 = -[PBUserProfileApplicationManager _initWithAppInfoController:](self, "_initWithAppInfoController:", v5);
  return v6;
}

- (id)_initWithAppInfoController:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___PBUserProfileApplicationManager;
    v8 = -[PBUserProfileApplicationManager init](&v20, "init");
    if (v8)
    {
      uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBUserProfileApplicationManager.workQueue");
      workQueue = v8->_workQueue;
      v8->_workQueue = (OS_dispatch_queue *)Serial;

      v11 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
      manageApplicationsOperationQueue = v8->_manageApplicationsOperationQueue;
      v8->_manageApplicationsOperationQueue = v11;

      -[NSOperationQueue setName:]( v8->_manageApplicationsOperationQueue,  "setName:",  @"com.apple.PineBoard.PBUserProfileApplicationManager.manageApplicationsOperationQueue");
      v13 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
      observers = v8->_observers;
      v8->_observers = v13;

      objc_storeStrong((id *)&v8->_appInfoController, a3);
      -[PBAppInfoController setDelegate:](v8->_appInfoController, "setDelegate:", v8);
      v15 = (dispatch_queue_s *)v8->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001CB3D4;
      block[3] = &unk_1003CFF08;
      v19 = v8;
      dispatch_sync(v15, block);
    }

    return v8;
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"appInfoController != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028F6A4(a2);
    }
    id result = (id) _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
  }

  return result;
}

+ (PBUserProfileApplicationManager)sharedInstance
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfileApplicationManager]);

  if (v4) {
    return (PBUserProfileApplicationManager *)v4;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PBUserProfileApplicationManager hasn't been initialized yet."));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10028F760(a2);
  }
  id result = (PBUserProfileApplicationManager *)_bs_set_crash_log_message([v6 UTF8String]);
  __break(0);
  return result;
}

- (NSString)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_1001CB5F8;
  v11 = &unk_1003CFEB8;
  id v12 = v3;
  v13 = self;
  id v5 = v3;
  dispatch_sync(workQueue, &v8);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "build", v8, v9, v10, v11));

  return (NSString *)v6;
}

- (NSSet)updatingApplicationIdentifiers
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_1001CB804;
  v11 = sub_1001CB814;
  id v12 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001CB82C;
  v6[3] = &unk_1003D0210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(workQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (PBSUserProfile)updatingUserProfile
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_1001CB804;
  v11 = sub_1001CB814;
  id v12 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001CB928;
  v6[3] = &unk_1003D0210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(workQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PBSUserProfile *)v4;
}

- (void)addObserver:(id)a3
{
  id v3 = -[TVSObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
}

- (void)quitApplicationsRunningWithPersonaUniqueString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001CBA50;
  block[3] = &unk_1003D85D8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

- (void)quitGracefullyApplicationsRunningWithPersonaUniqueString:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001CBB78;
  v7[3] = &unk_1003D0110;
  id v8 = a4;
  id v6 = v8;
  -[PBUserProfileApplicationManager quitApplicationsRunningWithPersonaUniqueString:completionHandler:]( self,  "quitApplicationsRunningWithPersonaUniqueString:completionHandler:",  a3,  v7);
}

- (void)_workQueue_setSelectedUserProfile:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_settingNewUser = 1;
  id v5 = -[PBSUserProfile copy](self->_selectedUserProfile, "copy");
  id v6 = (PBSUserProfile *)[v4 copy];
  selectedUserProfile = self->_selectedUserProfile;
  self->_selectedUserProfile = v6;

  id v8 = sub_100084518();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v35 = 138543618;
    v36 = v10;
    __int16 v37 = 2114;
    v38 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Setting selected user profile: {userProfileIdentifier=%{public}@, previousUserProfileIdentifier=%{public}@}",  (uint8_t *)&v35,  0x16u);
  }

  -[PBUserProfileApplicationManager _workQueue_handleLanguageChangeFromProfile:toProfile:]( self,  "_workQueue_handleLanguageChangeFromProfile:toProfile:",  v5,  self->_selectedUserProfile);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 iTunesAltDSID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile iTunesAltDSID](self->_selectedUserProfile, "iTunesAltDSID"));
  char v16 = BSEqualStrings(v14, v15);

  if ((v16 & 1) == 0)
  {
    id v17 = [(id)objc_opt_class(self) _contentApplicationIdentifiers];
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v12 unionSet:v18];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 personaUniqueString]);
  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile personaUniqueString](self->_selectedUserProfile, "personaUniqueString"));
  char v21 = BSEqualStrings(v19, v20);

  if ((v21 & 1) == 0)
  {
    [v12 unionSet:self->_personaEnabledApplicationIdentifiers];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v5 personaUniqueString]);

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v5 personaUniqueString]);
      [v13 setObject:v23 forKey:v24];
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile personaUniqueString](self->_selectedUserProfile, "personaUniqueString"));

    if (v25)
    {
      id v26 = -[NSMutableSet copy](self->_personaEnabledApplicationIdentifiers, "copy");
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile personaUniqueString](self->_selectedUserProfile, "personaUniqueString"));
      [v13 setObject:v26 forKey:v27];
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredLanguages]);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile preferredLanguages](self->_selectedUserProfile, "preferredLanguages"));
  char v30 = BSEqualArrays(v28, v29);

  if ((v30 & 1) == 0)
  {
    id v31 = sub_1001CBED8();
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    [v12 addObject:v32];
  }

  id v33 = [v13 copy];
  id v34 = [v12 copy];
  -[PBUserProfileApplicationManager _workQueue_addManageApplicationsOperationsWithPersonaApplicationIdentifiers:updatingApplicationIdentifiers:]( self,  "_workQueue_addManageApplicationsOperationsWithPersonaApplicationIdentifiers:updatingApplicationIdentifiers:",  v33,  v34);
}

- (void)_workQueue_didUpdatePersonaEnabledApplicationsWithAddedApplicationIdentifiers:(id)a3 removedApplicationIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile personaUniqueString](self->_selectedUserProfile, "personaUniqueString"));

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile personaUniqueString](self->_selectedUserProfile, "personaUniqueString"));
      v15 = v9;
      id v10 = -[NSMutableSet copy](self->_personaEnabledApplicationIdentifiers, "copy");
      id v16 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));

      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      [v12 unionSet:v6];
      [v12 unionSet:v7];
      id v13 = [v11 copy];
      id v14 = [v12 copy];
      -[PBUserProfileApplicationManager _workQueue_addManageApplicationsOperationsWithPersonaApplicationIdentifiers:updatingApplicationIdentifiers:]( self,  "_workQueue_addManageApplicationsOperationsWithPersonaApplicationIdentifiers:updatingApplicationIdentifiers:",  v13,  v14);
    }
  }
}

- (void)_workQueue_addManageApplicationsOperationsWithPersonaApplicationIdentifiers:(id)a3 updatingApplicationIdentifiers:(id)a4
{
  id v36 = a3;
  id v35 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([v36 count] && objc_msgSend(v35, "count"))
  {
    objc_initWeak(&location, self);
    id v32 = -[NSMutableSet copy](self->_personaEnabledApplicationIdentifiers, "copy");
    id v6 = -[PBSUserProfile copy](self->_selectedUserProfile, "copy");
    v58[0] = 0LL;
    v58[1] = v58;
    v58[2] = 0x3032000000LL;
    v58[3] = sub_1001CB804;
    v58[4] = sub_1001CB814;
    id v59 = 0LL;
    v56[0] = 0LL;
    v56[1] = v56;
    v56[2] = 0x3032000000LL;
    v56[3] = sub_1001CB804;
    v56[4] = sub_1001CB814;
    id v57 = 0LL;
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v7 shroudController]);

    manageApplicationsOperationQueue = self->_manageApplicationsOperationQueue;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_1001CC674;
    v48[3] = &unk_1003DBD78;
    char v30 = &v55;
    objc_copyWeak(&v55, &location);
    id v9 = v35;
    id v49 = v9;
    id v31 = v6;
    id v50 = v31;
    v51 = v34;
    v53 = v58;
    v54 = v56;
    v52 = v33;
    -[NSOperationQueue addBarrierBlock:](manageApplicationsOperationQueue, "addBarrierBlock:", v48);
    -[PBUserProfileApplicationManager _workQueue_addNotifyObserversWillUpdateApplicationsOperationsWithApplicationIdentifiers:]( self,  "_workQueue_addNotifyObserversWillUpdateApplicationsOperationsWithApplicationIdentifiers:",  v9);
    -[NSOperationQueue addBarrierBlock:](self->_manageApplicationsOperationQueue, "addBarrierBlock:", &stru_1003DBD98);
    id v10 = sub_1001CBED8();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v44 objects:v62 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v45;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
          if ((objc_msgSend(v16, "isEqual:", v11, v30) & 1) == 0)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForEmbeddedApplicationIdentifier:",  v16));
            v18 = -[PBTerminateApplicationOperation initWithApplicationProcessIdentity:]( objc_alloc(&OBJC_CLASS___PBTerminateApplicationOperation),  "initWithApplicationProcessIdentity:",  v17);
            -[NSOperationQueue addOperation:](self->_manageApplicationsOperationQueue, "addOperation:", v18);
          }
        }

        id v13 = [v12 countByEnumeratingWithState:&v44 objects:v62 count:16];
      }

      while (v13);
    }

    -[NSOperationQueue addBarrierBlock:](self->_manageApplicationsOperationQueue, "addBarrierBlock:", &stru_1003DBDB8);
    v19 = objc_alloc(&OBJC_CLASS___PBWaitForApplicationPersonaChangesOperation);
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([v31 personaUniqueString]);
    char v21 = -[PBWaitForApplicationPersonaChangesOperation initWithPersonaEnabledApplicationIdentifiers:selectedPersonaUniqueString:]( v19,  "initWithPersonaEnabledApplicationIdentifiers:selectedPersonaUniqueString:",  v32,  v20);

    -[NSOperationQueue addOperation:](self->_manageApplicationsOperationQueue, "addOperation:", v21);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1001CC88C;
    v43[3] = &unk_1003DBDE0;
    v43[4] = self;
    [v36 enumerateKeysAndObjectsUsingBlock:v43];
    -[NSOperationQueue addBarrierBlock:](self->_manageApplicationsOperationQueue, "addBarrierBlock:", &stru_1003DBE00);
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v22 = v12;
    id v23 = [v22 countByEnumeratingWithState:&v39 objects:v61 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v40;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v22);
          }
          id v26 = -[PBClearApplicationDataContainerCacheOperation initWithApplicationIdentifier:]( objc_alloc(&OBJC_CLASS___PBClearApplicationDataContainerCacheOperation),  "initWithApplicationIdentifier:",  *(void *)(*((void *)&v39 + 1) + 8LL * (void)j));
          -[NSOperationQueue addOperation:](self->_manageApplicationsOperationQueue, "addOperation:", v26);
        }

        id v23 = [v22 countByEnumeratingWithState:&v39 objects:v61 count:16];
      }

      while (v23);
    }

    -[NSOperationQueue addBarrierBlock:](self->_manageApplicationsOperationQueue, "addBarrierBlock:", &stru_1003DBE20);
    v27 = self->_manageApplicationsOperationQueue;
    v28 = -[PBRelaunchForegroundApplicationOperation initWithUpdatingApplicationIdentifiers:]( objc_alloc(&OBJC_CLASS___PBRelaunchForegroundApplicationOperation),  "initWithUpdatingApplicationIdentifiers:",  v22);
    -[NSOperationQueue addOperation:](v27, "addOperation:", v28);

    -[NSOperationQueue addBarrierBlock:](self->_manageApplicationsOperationQueue, "addBarrierBlock:", &stru_1003DBE40);
    -[PBUserProfileApplicationManager _workQueue_addNotifyObserversDidUpdateApplicationsOperationsWithApplicationIdentifiers:]( self,  "_workQueue_addNotifyObserversDidUpdateApplicationsOperationsWithApplicationIdentifiers:",  v22);
    v29 = self->_manageApplicationsOperationQueue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1001CC90C;
    v37[3] = &unk_1003D92B8;
    objc_copyWeak(&v38, &location);
    v37[4] = v58;
    v37[5] = v56;
    -[NSOperationQueue addBarrierBlock:](v29, "addBarrierBlock:", v37);
    objc_destroyWeak(&v38);

    objc_destroyWeak(v30);
    _Block_object_dispose(v56, 8);

    _Block_object_dispose(v58, 8);
    objc_destroyWeak(&location);
  }

  else
  {
    self->_settingNewUser = 0;
  }
}

- (void)_workQueue_addNotifyObserversWillUpdateApplicationsOperationsWithApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  manageApplicationsOperationQueue = self->_manageApplicationsOperationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001CCB0C;
  v7[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[NSOperationQueue addOperationWithBlock:](manageApplicationsOperationQueue, "addOperationWithBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_workQueue_addNotifyObserversDidUpdateApplicationsOperationsWithApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  manageApplicationsOperationQueue = self->_manageApplicationsOperationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001CCCB8;
  v7[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[NSOperationQueue addOperationWithBlock:](manageApplicationsOperationQueue, "addOperationWithBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_workQueue_quitApplicationsRunningWithPersonaUniqueString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v7 = -[NSMutableSet copy](self->_personaEnabledApplicationIdentifiers, "copy");
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1001CD024;
  v29[3] = &unk_1003D5540;
  id v8 = v6;
  id v30 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bs_compactMap:", v29));
  id v10 = sub_100084518();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 141558786;
    uint64_t v33 = 1752392040LL;
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    __int16 v37 = v9;
    __int16 v38 = 2112;
    id v39 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Terminanting applications running with persona... {personaUniqueString=%{mask.hash}@, applications=%@, personaEnab ledIdentifiers=%@}",  buf,  0x2Au);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = -[PBTerminateApplicationOperation initWithApplicationProcessIdentity:]( objc_alloc(&OBJC_CLASS___PBTerminateApplicationOperation),  "initWithApplicationProcessIdentity:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v16));
        -[PBTerminateApplicationOperation setReason:](v17, "setReason:", @"QuittingSpecificPersona");
        -[NSOperationQueue addOperation:](self->_manageApplicationsOperationQueue, "addOperation:", v17);

        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v14);
  }

  manageApplicationsOperationQueue = self->_manageApplicationsOperationQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1001CD1C4;
  v22[3] = &unk_1003D0070;
  id v23 = v8;
  id v24 = v21;
  id v19 = v21;
  id v20 = v8;
  -[NSOperationQueue addBarrierBlock:](manageApplicationsOperationQueue, "addBarrierBlock:", v22);
}

- (void)_workQueue_handleLanguageChangeFromProfile:(id)a3 toProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredLanguages]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredLanguages]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredInputModes]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredInputModes]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
  [v12 setPreferredLanguages:v9 withVariants:v11];
  if (v6 && v7)
  {
    unsigned int v13 = [v8 isEqual:v9];
    id v14 = sub_100084518();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "No preferred language change detected for user switch",  buf,  2u);
      }

      unsigned __int8 v17 = [v10 isEqual:v11];
      id v18 = sub_100084518();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if ((v17 & 1) != 0)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          id v21 = "No input mode changes";
          id v22 = v19;
          os_log_type_t v23 = OS_LOG_TYPE_INFO;
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, buf, 2u);
        }
      }

      else
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Applying input mode changes", buf, 2u);
        }

        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_1001CD6D0;
        v38[3] = &unk_1003CFF08;
        id v39 = v12;
        dispatch_async(&_dispatch_main_q, v38);
        id v19 = v39;
      }
    }

    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Language change needed to activate user profile",  buf,  2u);
      }

      id v25 = sub_100084518();
      __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      id v35 = v10;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredLanguages]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredInputModes]);
        *(_DWORD *)buf = 138543874;
        __int128 v41 = v27;
        __int16 v42 = 2114;
        v43 = v28;
        __int16 v44 = 2114;
        __int128 v45 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "old user profile: {userProfileIdentifier=%{public}@, preferredLanguages=%{public}@, preferredInputModes=%{public}@}",  buf,  0x20u);

        id v10 = v35;
      }

      id v30 = sub_100084518();
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredLanguages]);
        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredInputModes]);
        *(_DWORD *)buf = 138543874;
        __int128 v41 = v32;
        __int16 v42 = 2114;
        v43 = v33;
        __int16 v44 = 2114;
        __int128 v45 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "new user profile: {userProfileIdentifier=%{public}@, preferredLanguages=%{public}@, preferredInputModes=%{public}@}",  buf,  0x20u);

        id v10 = v35;
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001CD6E8;
      block[3] = &unk_1003CFF08;
      __int16 v37 = v12;
      dispatch_async(&_dispatch_main_q, block);
      id v19 = v37;
    }
  }

  else
  {
    id v24 = sub_100084518();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v21 = "Going to/from no user profile state — ignoring language settings";
      id v22 = v19;
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_11;
    }
  }
}

+ (id)_contentApplicationIdentifiers
{
  if (qword_100471378 != -1) {
    dispatch_once(&qword_100471378, &stru_1003DBE88);
  }
  return (id)qword_100471370;
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 addedAppInfos]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_map:", &stru_1003DBEC8));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 removedAppInfos]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_map:", &stru_1003DBEC8));

  if ([v7 count] || objc_msgSend(v9, "count"))
  {
    objc_initWeak(&location, self);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001CD95C;
    v11[3] = &unk_1003D0378;
    objc_copyWeak(&v14, &location);
    id v12 = v7;
    id v13 = v9;
    dispatch_async(workQueue, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)_processNewSelectedUserProfile:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001CDABC;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSOperationQueue)manageApplicationsOperationQueue
{
  return self->_manageApplicationsOperationQueue;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (PBSUserProfile)selectedUserProfile
{
  return self->_selectedUserProfile;
}

- (NSMutableSet)personaEnabledApplicationIdentifiers
{
  return self->_personaEnabledApplicationIdentifiers;
}

- (PBAppInfoController)_appInfoController
{
  return self->_appInfoController;
}

- (BOOL)isSettingNewUser
{
  return self->_settingNewUser;
}

- (void).cxx_destruct
{
}

@end