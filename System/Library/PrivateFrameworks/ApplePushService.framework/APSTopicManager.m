@interface APSTopicManager
- (APSTopicFilterPolicy)policy;
- (APSTopicGroup)group;
- (APSTopicGroup)serverGroup;
- (APSTopicHasher)topicHasher;
- (APSTopicManager)initWithEnvironment:(id)a3 topicHasher:(id)a4 user:(id)a5 userPreferences:(id)a6 ultraConstrainedProvider:(id)a7 delegate:(id)a8;
- (APSTopicManagerDelegate)delegate;
- (BOOL)_addTopic:(id)a3 connectionServer:(id)a4 attributes:(id)a5 change:(int64_t *)a6;
- (BOOL)_hasTopic:(id)a3;
- (BOOL)_isValidEnvironmentToTopics:(id)a3;
- (BOOL)_recategorizeTopic:(id)a3;
- (BOOL)_removeTopic:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5;
- (BOOL)hasListeningTopic:(id)a3;
- (BOOL)hasListeningTopicHash:(id)a3;
- (BOOL)hasListeningTopics;
- (BOOL)hasPausedTopic:(id)a3;
- (BOOL)hasPausedTopics;
- (BOOL)hasSendingTopic:(id)a3;
- (BOOL)hasSendingTopicHash:(id)a3;
- (BOOL)hasSendingTopics;
- (BOOL)hasUltraConstrainedPermissionForTopic:(id)a3;
- (BOOL)inTransaction;
- (BOOL)pendingServerUpdate;
- (NSDictionary)hashesToTopics;
- (NSMutableArray)topicsChanged;
- (NSString)logString;
- (id)_redListTopics;
- (id)_topicStateForTopic:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5;
- (id)debugDescription;
- (id)description;
- (id)hasEnabledTopicHash:(id)a3;
- (id)hasIgnoredTopicHash:(id)a3;
- (id)hasNonWakingTopicHash:(id)a3;
- (id)hasOpportunisticTopicHash:(id)a3;
- (id)hasPausedTopicHash:(id)a3;
- (id)hasRecentlyRemovedTopicHash:(id)a3;
- (id)hasTopicHash:(id)a3;
- (id)hasTopicHash:(id)a3 includeRecentlyRemoved:(BOOL)a4;
- (id)topicStatesForConnectionServer:(id)a3;
- (int64_t)_changeFromFilter:(int64_t)a3 toFilter:(int64_t)a4;
- (int64_t)_potentiallyChangeChosenTopicStateForTopic:(id)a3;
- (int64_t)transactionChange;
- (void)_clearPendingFilterTimer;
- (void)_filtersWillPotentiallyBeChanged:(id)a3;
- (void)_forgetRedListTopic:(id)a3;
- (void)_pendingFilterTimerFired;
- (void)_processPendingChangeIfNeeded;
- (void)_processTopicChange:(id)a3 immediately:(BOOL)a4 alertDelegate:(BOOL)a5;
- (void)_rememberRedListTopic:(id)a3;
- (void)_scheduleServerUpdateWithChange:(id)a3 timer:(BOOL)a4;
- (void)_scheduleServerUpdateWithChange:(id)a3 timer:(BOOL)a4 shortInterval:(BOOL)a5;
- (void)addTopicsAndAttributes:(id)a3 connectionServer:(id)a4;
- (void)beginTransaction;
- (void)dealloc;
- (void)endTransaction;
- (void)filtersWillPotentiallyBeChangedByPolicy:(id)a3;
- (void)performFilterBlock:(id)a3;
- (void)performTransactionBlock:(id)a3;
- (void)removeAllTopics;
- (void)removeTopics:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5;
- (void)removeTopicsForConnectionServer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInTransaction:(BOOL)a3;
- (void)setIsPowerEfficientToSendFilter:(BOOL)a3;
- (void)setServerGroup:(id)a3;
- (void)setTopicsChanged:(id)a3;
- (void)setTransactionChange:(int64_t)a3;
@end

@implementation APSTopicManager

- (APSTopicManager)initWithEnvironment:(id)a3 topicHasher:(id)a4 user:(id)a5 userPreferences:(id)a6 ultraConstrainedProvider:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v33 = a6;
  id v17 = a7;
  id v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___APSTopicManager;
  v19 = -[APSTopicManager init](&v34, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_delegate, v18);
    objc_storeStrong((id *)&v20->_user, a5);
    objc_storeStrong((id *)&v20->_userPreferences, a6);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v14 name]);
    environmentName = v20->_environmentName;
    v20->_environmentName = (NSString *)v21;

    v20->_isPowerEfficientToSendFilter = 1;
    v23 = -[APSTopicFilterPolicyEmbedded initWithDelegate:ultraConstrainedProvider:]( objc_alloc(&OBJC_CLASS___APSTopicFilterPolicyEmbedded),  "initWithDelegate:ultraConstrainedProvider:",  v20,  v17);
    policy = v20->_policy;
    v20->_policy = &v23->super;

    v25 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  24LL);
    topicsToTopicsStates = v20->_topicsToTopicsStates;
    v20->_topicsToTopicsStates = v25;

    v27 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  24LL);
    hashesToTopics = v20->_hashesToTopics;
    v20->_hashesToTopics = v27;

    v29 = -[APSTopicGroup initWithEnvironment:topicHasher:user:]( objc_alloc(&OBJC_CLASS___APSTopicGroup),  "initWithEnvironment:topicHasher:user:",  v14,  v15,  v16);
    group = v20->_group;
    v20->_group = v29;

    objc_storeStrong((id *)&v20->_topicHasher, a4);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v31 addObserver:v20 selector:"_filtersWillPotentiallyBeChanged:" name:@"APSFiltersWillPotentiallyBeChangedNotification" object:0];
  }

  return v20;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[APSTopicManager _clearPendingFilterTimer](self, "_clearPendingFilterTimer");
  -[APSTopicFilterPolicy setDelegate:](self->_policy, "setDelegate:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___APSTopicManager;
  -[APSTopicManager dealloc](&v4, "dealloc");
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }
}

- (BOOL)_isValidEnvironmentToTopics:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:self->_environmentName]);
  if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3), (objc_opt_isKindOfClass(v4, v5) & 1) == 0)
    || (v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:&stru_100123240]),
        v6,
        v6))
  {
    BOOL v7 = 0;
  }

  else
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v11 = v9;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v10);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v14]);
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDate, v17);
            char isKindOfClass = objc_opt_isKindOfClass(v16, v18);

            if ((isKindOfClass & 1) != 0) {
              continue;
            }
          }

          BOOL v7 = 0;
          goto LABEL_17;
        }

        id v11 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        BOOL v7 = 1;
        if (v11) {
          continue;
        }
        break;
      }
    }

    else
    {
      BOOL v7 = 1;
    }

- (id)_redListTopics
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserPreferences tokenTopics](self->_userPreferences, "tokenTopics"));
  if ([v3 count]
    && -[APSTopicManager _isValidEnvironmentToTopics:](self, "_isValidEnvironmentToTopics:", v3))
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:self->_environmentName]);
    if (v4)
    {
      id v16 = v3;
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v11]);
            [v12 timeIntervalSinceNow];
            if (v13 <= -691200.0)
            {
              uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                __int128 v22 = self;
                __int16 v23 = 2112;
                uint64_t v24 = v11;
                __int16 v25 = 2112;
                v26 = v12;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: Pruning stale topic %@ last used %@",  buf,  0x20u);
              }
            }

            else
            {
              [v5 addObject:v11];
            }
          }

          id v8 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
        }

        while (v8);
      }

      uint64_t v3 = v16;
    }

    else
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    }
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  return v5;
}

- (void)_rememberRedListTopic:(id)a3
{
  id v9 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserPreferences tokenTopics](self->_userPreferences, "tokenTopics"));
  id v5 = [v4 mutableCopy];

  if (-[APSTopicManager _isValidEnvironmentToTopics:](self, "_isValidEnvironmentToTopics:", v5)
    && (v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:self->_environmentName]),
        id v7 = [v6 mutableCopy],
        v6,
        v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v7 setObject:v8 forKey:v9];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v8,  v9,  0LL));
  }

  if (v5) {
    [v5 setObject:v7 forKey:self->_environmentName];
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v7,  self->_environmentName,  0LL));
  }
  -[APSUserPreferences setTokenTopics:](self->_userPreferences, "setTokenTopics:", v5);
}

- (void)_forgetRedListTopic:(id)a3
{
  id v10 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserPreferences tokenTopics](self->_userPreferences, "tokenTopics"));
  id v5 = [v4 mutableCopy];

  if (-[APSTopicManager _isValidEnvironmentToTopics:](self, "_isValidEnvironmentToTopics:", v5)) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v8 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:self->_environmentName]);
    id v8 = [v7 mutableCopy];

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v10]);

      if (v9)
      {
        [v5 setObject:v8 forKey:self->_environmentName];
        [v8 removeObjectForKey:v10];
        -[APSUserPreferences setTokenTopics:](self->_userPreferences, "setTokenTopics:", v5);
      }
    }
  }
}

- (id)hasEnabledTopicHash:(id)a3
{
  group = self->_group;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](group, "hashesToEnabledTopics"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 topicName]);
  return v7;
}

- (id)hasIgnoredTopicHash:(id)a3
{
  group = self->_group;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToIgnoredTopics](group, "hashesToIgnoredTopics"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 topicName]);
  return v7;
}

- (id)hasPausedTopicHash:(id)a3
{
  group = self->_group;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](group, "hashesToPausedTopics"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 topicName]);
  return v7;
}

- (id)hasOpportunisticTopicHash:(id)a3
{
  group = self->_group;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](group, "hashesToOpportunisticTopics"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 topicName]);
  return v7;
}

- (id)hasNonWakingTopicHash:(id)a3
{
  group = self->_group;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](group, "hashesToNonWakingTopics"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 topicName]);
  return v7;
}

- (BOOL)_hasTopic:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_topicsToTopicsStates, "objectForKey:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)hasTopicHash:(id)a3 includeRecentlyRemoved:(BOOL)a4
{
  return -[NSMutableDictionary objectForKey:](self->_hashesToTopics, "objectForKey:", a3, a4);
}

- (id)hasTopicHash:(id)a3
{
  return -[APSTopicManager hasTopicHash:includeRecentlyRemoved:](self, "hasTopicHash:includeRecentlyRemoved:", a3, 1LL);
}

- (BOOL)hasListeningTopics
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
  if ([v3 count])
  {
    BOOL v4 = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
    if ([v5 count])
    {
      BOOL v4 = 1;
    }

    else
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
      BOOL v4 = [v6 count] != 0;
    }
  }

  return v4;
}

- (BOOL)hasPausedTopics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self->_group, "hashesToPausedTopics"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasListeningTopic:(id)a3
{
  id v4 = a3;
  if (-[APSTopicManager hasListeningTopics](self, "hasListeningTopics"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[APSTopicHasher topicHashForTopic:user:]( self->_topicHasher,  "topicHashForTopic:user:",  v4,  self->_user));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);
    if (v7)
    {
      BOOL v8 = 1;
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v5]);
      if (v10)
      {
        BOOL v8 = 1;
      }

      else
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v5]);
        BOOL v8 = v12 != 0LL;
      }
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hasListeningTopicHash:(id)a3
{
  id v4 = a3;
  if (-[APSTopicManager hasListeningTopics](self, "hasListeningTopics"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
    if (v6)
    {
      BOOL v7 = 1;
    }

    else
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v4]);
      if (v9)
      {
        BOOL v7 = 1;
      }

      else
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v4]);
        BOOL v7 = v11 != 0LL;
      }
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasPausedTopic:(id)a3
{
  id v4 = a3;
  if (-[APSTopicManager hasPausedTopics](self, "hasPausedTopics"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[APSTopicHasher topicHashForTopic:user:]( self->_topicHasher,  "topicHashForTopic:user:",  v4,  self->_user));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager hasPausedTopicHash:](self, "hasPausedTopicHash:", v5));
    BOOL v7 = v6 != 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasSendingTopics
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
  if ([v3 count])
  {
    BOOL v4 = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self->_group, "hashesToPausedTopics"));
    if ([v5 count])
    {
      BOOL v4 = 1;
    }

    else
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
      if ([v6 count])
      {
        BOOL v4 = 1;
      }

      else
      {
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
        BOOL v4 = [v7 count] != 0;
      }
    }
  }

  return v4;
}

- (BOOL)hasSendingTopicHash:(id)a3
{
  id v4 = a3;
  if (-[APSTopicManager hasSendingTopics](self, "hasSendingTopics"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
    if (v6)
    {
      BOOL v7 = 1;
    }

    else
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self->_group, "hashesToPausedTopics"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v4]);
      if (v9)
      {
        BOOL v7 = 1;
      }

      else
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v4]);
        if (v11)
        {
          BOOL v7 = 1;
        }

        else
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
          double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v4]);
          BOOL v7 = v13 != 0LL;
        }
      }
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasSendingTopic:(id)a3
{
  id v4 = a3;
  if (-[APSTopicManager hasSendingTopics](self, "hasSendingTopics"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[APSTopicHasher topicHashForTopic:user:]( self->_topicHasher,  "topicHashForTopic:user:",  v4,  self->_user));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);
    if (v7)
    {
      BOOL v8 = 1;
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self->_group, "hashesToPausedTopics"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v5]);
      if (v10)
      {
        BOOL v8 = 1;
      }

      else
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v5]);
        if (v12)
        {
          BOOL v8 = 1;
        }

        else
        {
          double v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v5]);
          BOOL v8 = v14 != 0LL;
        }
      }
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hasUltraConstrainedPermissionForTopic:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_topicsToTopicsStates,  "objectForKeyedSubscript:",  a3));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)i), "attributes", (void)v11));
        unsigned __int8 v9 = [v8 isUltraConstrainedEnabled];

        if ((v9 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (id)hasRecentlyRemovedTopicHash:(id)a3
{
  return 0LL;
}

- (id)_topicStateForTopic:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5
{
  id v8 = a4;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_topicsToTopicsStates, "objectForKey:", a3));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "connectionServer", (void)v21));
        if (v16 == v8)
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 attributes]);
          id v18 = [v17 filter];

          if (v18 == (id)a5)
          {
            id v19 = v15;
            goto LABEL_13;
          }
        }

        else
        {
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v19 = 0LL;
LABEL_13:

  return v19;
}

- (BOOL)_recategorizeTopic:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 topicHash]);
  if (self->_inTransaction)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager topicsChanged](self, "topicsChanged"));

    if (!v6)
    {
      BOOL v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[APSTopicManager setTopicsChanged:](self, "setTopicsChanged:", v7);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager topicsChanged](self, "topicsChanged"));
    unsigned __int8 v9 = [v8 containsObject:v4];

    if ((v9 & 1) == 0)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager topicsChanged](self, "topicsChanged"));
      [v10 addObject:v4];
    }
  }

  id v11 = [v4 desiredFilter];
  id v12 = [v4 currentFilter];
  if (v11 != v12)
  {
    switch((unint64_t)[v4 desiredFilter])
    {
      case 1uLL:
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
        goto LABEL_13;
      case 2uLL:
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
        goto LABEL_13;
      case 3uLL:
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToIgnoredTopics](self->_group, "hashesToIgnoredTopics"));
        goto LABEL_13;
      case 4uLL:
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
        goto LABEL_13;
      case 5uLL:
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self->_group, "hashesToPausedTopics"));
LABEL_13:
        __int128 v14 = v13;
        [v13 setObject:v4 forKey:v5];

        break;
      default:
        break;
    }

    switch((unint64_t)[v4 currentFilter])
    {
      case 1uLL:
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
        goto LABEL_20;
      case 2uLL:
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
        goto LABEL_20;
      case 3uLL:
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToIgnoredTopics](self->_group, "hashesToIgnoredTopics"));
        goto LABEL_20;
      case 4uLL:
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
        goto LABEL_20;
      case 5uLL:
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self->_group, "hashesToPausedTopics"));
LABEL_20:
        id v16 = v15;
        [v15 removeObjectForKey:v5];

        break;
      default:
        break;
    }

    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 topicName]);
      id v19 = sub_1000619A4((unint64_t)[v4 currentFilter]);
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      __int128 v21 = sub_1000619A4((unint64_t)[v4 desiredFilter]);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      int v24 = 138413058;
      __int16 v25 = self;
      __int16 v26 = 2112;
      v27 = v18;
      __int16 v28 = 2112;
      v29 = v20;
      __int16 v30 = 2112;
      v31 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%@: recategorizing topic %@ from %@ to %@",  (uint8_t *)&v24,  0x2Au);
    }

    objc_msgSend(v4, "setCurrentFilter:", objc_msgSend(v4, "desiredFilter"));
  }

  return v11 != v12;
}

- (BOOL)_addTopic:(id)a3 connectionServer:(id)a4 attributes:(id)a5 change:(int64_t *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_claimAutoreleasedReturnValue( -[APSTopicManager _topicStateForTopic:connectionServer:filter:]( self,  "_topicStateForTopic:connectionServer:filter:",  v9,  v10,  [v11 filter]));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicHashForTopic:user:](self->_topicHasher, "topicHashForTopic:user:", v9, self->_user));
  __int128 v14 = -[APSTopicState initWithTopicName:connectionServer:attributes:topicHash:]( objc_alloc(&OBJC_CLASS___APSTopicState),  "initWithTopicName:connectionServer:attributes:topicHash:",  v9,  v10,  v11,  v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v57 = self;
    __int16 v58 = 2112;
    id v59 = v9;
    __int16 v60 = 2112;
    *(void *)v61 = v13;
    *(_WORD *)&v61[8] = 2112;
    id v62 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@: adding topic %@ (%@) for connection server %@",  buf,  0x2Au);
  }

  v47 = (void *)v13;

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_topicsToTopicsStates, "objectForKey:", v9));
  __int128 v17 = v16;
  if (v12)
  {
    [v16 removeObject:v12];
    [v17 addObject:v14];
  }

  else
  {
    if (v16)
    {
      [v16 addObject:v14];
    }

    else
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v14));
      -[NSMutableDictionary setObject:forKey:](self->_topicsToTopicsStates, "setObject:forKey:", v17, v9);
    }

    if ([v17 count] == (id)1)
    {
      hashesToTopics = self->_hashesToTopics;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState topicHash](v14, "topicHash"));
      -[NSMutableDictionary setObject:forKey:](hashesToTopics, "setObject:forKey:", v9, v19);
    }
  }

  v49 = v11;
  v50 = v10;
  v48 = (void *)v12;
  if ([v17 count] == (id)1)
  {
    __int128 v20 = v14;
LABEL_12:
    __int128 v21 = 0LL;
    id v22 = 0LL;
    goto LABEL_13;
  }

  uint64_t v25 = objc_claimAutoreleasedReturnValue(-[APSTopicFilterPolicy topicChosenByPolicyFromTopics:](self->_policy, "topicChosenByPolicyFromTopics:", v17));
  if ((APSTopicState *)v25 != v14)
  {
    __int16 v26 = (void *)v25;
    int v24 = 0;
    __int128 v21 = 0LL;
    int64_t v27 = -[APSTopicState currentFilter](v14, "currentFilter", 0LL);
    goto LABEL_39;
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v29 = v17;
  id v30 = [v29 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (!v30)
  {

    goto LABEL_12;
  }

  id v31 = v30;
  uint64_t v32 = *(void *)v53;
  while (2)
  {
    for (i = 0LL; i != v31; i = (char *)i + 1)
    {
      if (*(void *)v53 != v32) {
        objc_enumerationMutation(v29);
      }
      objc_super v34 = *(APSTopicState **)(*((void *)&v52 + 1) + 8LL * (void)i);
      if (v34 != v14 && [*(id *)(*((void *)&v52 + 1) + 8 * (void)i) currentFilter])
      {
        __int128 v21 = v34;
        id v22 = -[APSTopicState currentFilter](v21, "currentFilter");
        goto LABEL_46;
      }
    }

    id v31 = [v29 countByEnumeratingWithState:&v52 objects:v64 count:16];
    if (v31) {
      continue;
    }
    break;
  }

  id v22 = 0LL;
  __int128 v21 = 0LL;
LABEL_46:

  id v10 = v50;
LABEL_13:
  -[APSTopicState setDesiredFilter:]( v14,  "setDesiredFilter:",  -[APSTopicFilterPolicy filterChosenByPolicyForTopic:](self->_policy, "filterChosenByPolicyForTopic:", v14));
  if (!v21)
  {
    -[APSTopicManager _recategorizeTopic:](self, "_recategorizeTopic:", v14);
    goto LABEL_19;
  }

  id v23 = -[APSTopicState desiredFilter](v14, "desiredFilter");
  -[APSTopicState setDesiredFilter:](v21, "setDesiredFilter:", 0LL);
  -[APSTopicManager _recategorizeTopic:](self, "_recategorizeTopic:", v21);
  -[APSTopicManager _recategorizeTopic:](self, "_recategorizeTopic:", v14);
  if (v23 != v22)
  {
LABEL_19:
    id v28 = -[APSTopicState currentFilter](v14, "currentFilter");
    if (v28 == (id)3 || v28 == (id)5)
    {
      int v24 = 1;
      if (v28 == (id)3 && v22 == (id)5)
      {
        -[APSTopicManager _forgetRedListTopic:](self, "_forgetRedListTopic:", v9);
        uint64_t v45 = 5LL;
        -[APSTopicManager _removeTopic:connectionServer:filter:]( self,  "_removeTopic:connectionServer:filter:",  v9,  0LL,  5LL);
      }

      else
      {
        uint64_t v45 = (uint64_t)v22;
      }
    }

    else
    {
      uint64_t v45 = (uint64_t)v22;
      if (v10) {
        -[APSTopicManager _rememberRedListTopic:](self, "_rememberRedListTopic:", v9);
      }
      int v24 = 1;
    }

    goto LABEL_38;
  }

  uint64_t v45 = (uint64_t)v22;
  int v24 = 0;
LABEL_38:
  __int16 v26 = v14;
  int64_t v27 = -[APSTopicState currentFilter](v14, "currentFilter", v45);
LABEL_39:
  int64_t v35 = v27;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager serverGroup](self, "serverGroup"));
  id v37 = [v36 currentFilterForTopicState:v26];

  if (v24) {
    int64_t v38 = -[APSTopicManager _changeFromFilter:toFilter:](self, "_changeFromFilter:toFilter:", v37, v35);
  }
  else {
    int64_t v38 = 0LL;
  }
  v39 = a6;
  *a6 = v38;
  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = sub_10003F9C8(*a6);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    *(_DWORD *)buf = 138413570;
    v57 = self;
    __int16 v58 = 2112;
    id v59 = v9;
    __int16 v60 = 1024;
    *(_DWORD *)v61 = v35;
    *(_WORD *)&v61[4] = 1024;
    *(_DWORD *)&v61[6] = v46;
    LOWORD(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 2) = (_DWORD)v37;
    HIWORD(v62) = 2112;
    v63 = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%@: calculated change type for %@ {newTopicFilter: %d, previouslyChosenTopicFilter: %d, previousServerTopicFilter: %d change: %@}",  buf,  0x32u);

    v39 = a6;
  }

  BOOL v43 = *v39 != 0;
  return v43;
}

- (void)beginTransaction
{
}

- (void)endTransaction
{
  context = objc_autoreleasePoolPush();
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager topicsChanged](self, "topicsChanged"));
  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0LL;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        policy = self->_policy;
        topicsToTopicsStates = self->_topicsToTopicsStates;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 topicName]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( topicsToTopicsStates,  "objectForKeyedSubscript:",  v12));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[APSTopicFilterPolicy topicChosenByPolicyFromTopics:]( policy,  "topicChosenByPolicyFromTopics:",  v13));

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager serverGroup](self, "serverGroup"));
        id v16 = [v15 currentFilterForTopicState:v9];

        int64_t v17 = -[APSTopicManager _changeFromFilter:toFilter:]( self,  "_changeFromFilter:toFilter:",  v16,  -[APSTopicFilterPolicy filterChosenByPolicyForTopic:]( self->_policy,  "filterChosenByPolicyForTopic:",  v14));
        if (v6 <= v17) {
          int64_t v6 = v17;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }

    while (v5);
  }

  else
  {
    int64_t v6 = 0LL;
  }

  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = sub_10003F9C8(v6);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager topicsChanged](self, "topicsChanged"));
    *(_DWORD *)buf = 138412802;
    id v33 = self;
    __int16 v34 = 2112;
    int64_t v35 = v20;
    __int16 v36 = 2112;
    id v37 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@: completed transaction - calculated change %@ {topics changed: %@}",  buf,  0x20u);
  }

  id v22 = objc_alloc(&OBJC_CLASS___APSFilterChange);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager topicsChanged](self, "topicsChanged"));
  int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 topicName]);
  __int16 v26 = -[APSFilterChange initWithChange:triggeringTopic:](v22, "initWithChange:triggeringTopic:", v6, v25);

  -[APSTopicManager setTopicsChanged:](self, "setTopicsChanged:", 0LL);
  objc_autoreleasePoolPop(context);
  if (v6) {
    -[APSTopicManager _processTopicChange:immediately:alertDelegate:]( self,  "_processTopicChange:immediately:alertDelegate:",  v26,  0LL,  1LL);
  }
}

- (void)performTransactionBlock:(id)a3
{
  id v4 = (void (**)(id, APSTopicManager *))a3;
  -[APSTopicManager beginTransaction](self, "beginTransaction");
  v4[2](v4, self);

  -[APSTopicManager endTransaction](self, "endTransaction");
}

- (void)addTopicsAndAttributes:(id)a3 connectionServer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    uint64_t v11 = APSPrettyPrintCollection(v10, 0LL, 0LL, 0LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    __int16 v38 = 2112;
    v39 = v12;
    __int16 v40 = 2112;
    id v41 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: adding topics %@ for connection server %@",  buf,  0x20u);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v13 = v6;
  id v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = 0LL;
    char v17 = 0;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        *(void *)buf = 0LL;
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v20, (void)v32));
        unsigned int v22 = -[APSTopicManager _addTopic:connectionServer:attributes:change:]( self,  "_addTopic:connectionServer:attributes:change:",  v20,  v7,  v21,  buf);

        uint64_t v23 = *(void *)buf;
        if (v22) {
          uint64_t v16 = v23;
        }
        v17 |= v22;
      }

      id v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v15);

    id v8 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
    if ((v17 & 1) != 0)
    {
      int v24 = objc_alloc(&OBJC_CLASS___APSFilterChange);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);
      int64_t v27 = -[APSFilterChange initWithChange:triggeringTopic:](v24, "initWithChange:triggeringTopic:", v16, v26);

      -[APSTopicManager _processTopicChange:immediately:alertDelegate:]( self,  "_processTopicChange:immediately:alertDelegate:",  v27,  0LL,  1LL);
      goto LABEL_21;
    }
  }

  else
  {
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager group](self, "group", (void)v32));
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager serverGroup](self, "serverGroup"));
  unsigned int v30 = [v28 isEqual:v29];

  if (v30)
  {
    __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8[275] topicManager]);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%@ no change detected between the new filter and the old server filter - cancelling any pending updates",  buf,  0xCu);
    }

    -[APSTopicManager _clearPendingFilterTimer](self, "_clearPendingFilterTimer");
  }

- (BOOL)_removeTopic:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[APSTopicManager _topicStateForTopic:connectionServer:filter:]( self,  "_topicStateForTopic:connectionServer:filter:",  v8,  v9,  a5));
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    uint64_t v25 = self;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: removing topic %@ for connection server %@",  (uint8_t *)&v24,  0x20u);
  }

  if (v10)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_topicsToTopicsStates, "objectForKey:", v8));
    [v12 removeObject:v10];
    id v13 = [v10 currentFilter];
    if (v13)
    {
      [v10 setDesiredFilter:0];
      -[APSTopicManager _recategorizeTopic:](self, "_recategorizeTopic:", v10);
      if ([v12 count])
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[APSTopicFilterPolicy topicChosenByPolicyFromTopics:]( self->_policy,  "topicChosenByPolicyFromTopics:",  v12));
        objc_msgSend( v14,  "setDesiredFilter:",  -[APSTopicFilterPolicy filterChosenByPolicyForTopic:](self->_policy, "filterChosenByPolicyForTopic:", v14));
        -[APSTopicManager _recategorizeTopic:](self, "_recategorizeTopic:", v14);
        BOOL v15 = v13 != [v14 currentFilter];
      }

      else
      {
        BOOL v15 = 0;
      }

      if ([v12 count]) {
        goto LABEL_16;
      }
      if (v13 == (id)3)
      {
        hashesToTopics = self->_hashesToTopics;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 topicHash]);
        -[NSMutableDictionary removeObjectForKey:](hashesToTopics, "removeObjectForKey:", v18);

        goto LABEL_16;
      }
    }

    else
    {
      BOOL v15 = 0;
      if ([v12 count])
      {
LABEL_16:

        BOOL v16 = v15;
        goto LABEL_17;
      }
    }

    id v19 = self->_hashesToTopics;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 topicHash]);
    -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", v20);

    topicsToTopicsStates = self->_topicsToTopicsStates;
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v10 topicName]);
    -[NSMutableDictionary removeObjectForKey:](topicsToTopicsStates, "removeObjectForKey:", v22);

    if (v13 != (id)5) {
      BOOL v15 = 1;
    }
    goto LABEL_16;
  }

  BOOL v16 = 0;
LABEL_17:

  return v16;
}

- (void)removeTopics:(id)a3 connectionServer:(id)a4 filter:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    int v12 = 0;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v8);
        }
        v12 |= -[APSTopicManager _removeTopic:connectionServer:filter:]( self,  "_removeTopic:connectionServer:filter:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i),  v9,  a5);
      }

      id v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
    if ((v12 & 1) != 0)
    {
      BOOL v15 = objc_alloc(&OBJC_CLASS___APSFilterChange);
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);
      char v17 = -[APSFilterChange initWithChange:triggeringTopic:](v15, "initWithChange:triggeringTopic:", 2LL, v16);

      -[APSTopicManager _processTopicChange:immediately:alertDelegate:]( self,  "_processTopicChange:immediately:alertDelegate:",  v17,  0LL,  1LL);
    }
  }
}

- (void)removeTopicsForConnectionServer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager topicStatesForConnectionServer:](self, "topicStatesForConnectionServer:", v4));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 topicName]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 attributes]);
        unsigned __int8 v14 = -[APSTopicManager _removeTopic:connectionServer:filter:]( self,  "_removeTopic:connectionServer:filter:",  v12,  v4,  [v13 filter]);

        v8 |= v14;
      }

      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
    if ((v8 & 1) != 0)
    {
      BOOL v15 = objc_alloc(&OBJC_CLASS___APSFilterChange);
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      char v17 = (void *)objc_claimAutoreleasedReturnValue([v16 topicName]);
      __int128 v18 = -[APSFilterChange initWithChange:triggeringTopic:](v15, "initWithChange:triggeringTopic:", 2LL, v17);

      -[APSTopicManager _processTopicChange:immediately:alertDelegate:]( self,  "_processTopicChange:immediately:alertDelegate:",  v18,  0LL,  1LL);
    }
  }
}

- (void)removeAllTopics
{
  id v3 = -[NSMutableDictionary count](self->_topicsToTopicsStates, "count");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_topicsToTopicsStates, "allKeys"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  -[NSMutableDictionary removeAllObjects](self->_topicsToTopicsStates, "removeAllObjects");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
  [v5 removeAllObjects];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
  [v6 removeAllObjects];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToIgnoredTopics](self->_group, "hashesToIgnoredTopics"));
  [v7 removeAllObjects];

  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self->_group, "hashesToPausedTopics"));
  [v8 removeAllObjects];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
  [v9 removeAllObjects];

  if (v3)
  {
    id v10 = -[APSFilterChange initWithChange:triggeringTopic:]( objc_alloc(&OBJC_CLASS___APSFilterChange),  "initWithChange:triggeringTopic:",  2LL,  v11);
    -[APSTopicManager _processTopicChange:immediately:alertDelegate:]( self,  "_processTopicChange:immediately:alertDelegate:",  v10,  0LL,  1LL);
  }
}

- (id)topicStatesForConnectionServer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v19 = self;
  id obj = self->_topicsToTopicsStates;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v19->_topicsToTopicsStates,  "objectForKey:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)i)));
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              unsigned __int8 v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)j);
              id v15 = (id)objc_claimAutoreleasedReturnValue([v14 connectionServer]);

              if (v15 == v4) {
                [v5 addObject:v14];
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }

          while (v11);
        }
      }

      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
    }

    while (v7);
  }

  return v5;
}

- (void)setIsPowerEfficientToSendFilter:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isPowerEfficientToSendFilter != a3)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      int v7 = 138412546;
      char v8 = self;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ isPowerEfficientToSendFilter changed to %@",  (uint8_t *)&v7,  0x16u);
    }

    self->_isPowerEfficientToSendFilter = v3;
  }

  if (v3) {
    -[APSTopicManager _processPendingChangeIfNeeded](self, "_processPendingChangeIfNeeded");
  }
}

- (void)_processTopicChange:(id)a3 immediately:(BOOL)a4 alertDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (!-[APSTopicManager inTransaction](self, "inTransaction"))
  {
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = sub_10003F9C8((unint64_t)[v8 topicGroupChange]);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = (void *)v11;
      uint64_t v13 = @"NO";
      *(_DWORD *)__int128 v23 = 138413058;
      *(void *)&v23[4] = self;
      if (v6) {
        unsigned __int8 v14 = @"YES";
      }
      else {
        unsigned __int8 v14 = @"NO";
      }
      if (v5) {
        uint64_t v13 = @"YES";
      }
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[14] = v11;
      __int16 v24 = 2112;
      __int128 v25 = v14;
      __int16 v26 = 2112;
      __int128 v27 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: process topic change with change = %@, immediately = %@, alert = %@",  v23,  0x2Au);
    }

    if ([v8 topicGroupChange])
    {
      if (v6)
      {
        if (!v5)
        {
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 v23 = 138412290;
            *(void *)&v23[4] = self;
            __int128 v22 = "%@ processed change -- would immediately tell our delegate but we were asked not to";
LABEL_21:
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v22, v23, 0xCu);
          }

          goto LABEL_22;
        }

        -[APSTopicManager _clearPendingFilterTimer](self, "_clearPendingFilterTimer");
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 v23 = 138412290;
          *(void *)&v23[4] = self;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ processing immediate change to server topics",  v23,  0xCu);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v17 = objc_opt_respondsToSelector(WeakRetained, "topicManagerRequestToSendFilter:change:");

        if ((v17 & 1) != 0)
        {
          uint64_t v18 = (os_log_s *)objc_loadWeakRetained((id *)&self->_delegate);
          -[os_log_s topicManagerRequestToSendFilter:change:](v18, "topicManagerRequestToSendFilter:change:", self, v8);
LABEL_22:
        }
      }

      else
      {
        switch((unint64_t)[v8 topicGroupChange])
        {
          case 1uLL:
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
            __int128 v19 = self;
            id v20 = v8;
            uint64_t v21 = 0LL;
            goto LABEL_18;
          case 2uLL:
            -[APSTopicManager _scheduleServerUpdateWithChange:timer:shortInterval:]( self,  "_scheduleServerUpdateWithChange:timer:shortInterval:",  v8,  1LL,  0LL);
            break;
          case 3uLL:
          case 9uLL:
          case 0xAuLL:
            -[APSTopicManager _processTopicChange:immediately:alertDelegate:]( self,  "_processTopicChange:immediately:alertDelegate:",  v8,  1LL,  v5);
            break;
          case 8uLL:
            __int128 v19 = self;
            id v20 = v8;
            uint64_t v21 = 1LL;
LABEL_18:
            -[APSTopicManager _scheduleServerUpdateWithChange:timer:]( v19,  "_scheduleServerUpdateWithChange:timer:",  v20,  v21,  *(_OWORD *)v23);
            break;
          default:
            uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_22;
            }
            *(_DWORD *)__int128 v23 = 138412290;
            *(void *)&v23[4] = self;
            __int128 v22 = "%@ no change detected";
            goto LABEL_21;
        }
      }
    }
  }
}

- (int64_t)_potentiallyChangeChosenTopicStateForTopic:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_topicsToTopicsStates, "objectForKey:", a3));
  if ([v4 count])
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          __int16 v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if (objc_msgSend(v9, "currentFilter", (void)v17))
          {
            id v6 = v9;
            id v10 = [v6 currentFilter];
            goto LABEL_12;
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v10 = 0LL;
LABEL_12:

    id v11 = (id)objc_claimAutoreleasedReturnValue( -[APSTopicFilterPolicy topicChosenByPolicyFromTopics:]( self->_policy,  "topicChosenByPolicyFromTopics:",  v5));
    int64_t v12 = -[APSTopicFilterPolicy filterChosenByPolicyForTopic:](self->_policy, "filterChosenByPolicyForTopic:", v11);
    [v11 setDesiredFilter:v12];
    if (v6)
    {
      if (v11 == v6)
      {
        uint64_t v13 = self;
        id v14 = v6;
LABEL_18:
        -[APSTopicManager _recategorizeTopic:](v13, "_recategorizeTopic:", v14, (void)v17);
        if (v10 == (id)v12)
        {
          int64_t v15 = 0LL;
LABEL_26:

          goto LABEL_27;
        }

        if (v10)
        {
          if (v12 == 1)
          {
            int64_t v15 = 8LL;
            goto LABEL_26;
          }
        }

        else if ((unint64_t)(v12 - 1) < 4)
        {
          int64_t v15 = qword_1001028A0[v12 - 1];
          goto LABEL_26;
        }

        int64_t v15 = 1LL;
        goto LABEL_26;
      }

      [v6 setDesiredFilter:0];
      -[APSTopicManager _recategorizeTopic:](self, "_recategorizeTopic:", v6);
    }

    uint64_t v13 = self;
    id v14 = v11;
    goto LABEL_18;
  }

  int64_t v15 = 0LL;
LABEL_27:

  return v15;
}

- (void)filtersWillPotentiallyBeChangedByPolicy:(id)a3
{
  id v4 = a3;
  [v4 logFilterPolicyInformation];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (APSFilterChange *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_topicsToTopicsStates, "allKeys"));
  id v6 = -[APSFilterChange countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v6)
  {
    id v7 = v6;
    id v17 = v4;
    int64_t v8 = 0LL;
    char v9 = 0;
    uint64_t v10 = *(void *)v19;
    id v11 = &stru_100123240;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        int64_t v14 = -[APSTopicManager _potentiallyChangeChosenTopicStateForTopic:]( self,  "_potentiallyChangeChosenTopicStateForTopic:",  v13);
        if (v14)
        {
          int64_t v15 = v14;
          if (v14 <= v8)
          {
            char v9 = 1;
          }

          else
          {
            BOOL v16 = v13;

            char v9 = 1;
            id v11 = v16;
            int64_t v8 = v15;
          }
        }
      }

      id v7 = -[APSFilterChange countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v7);

    if ((v9 & 1) == 0)
    {
      id v4 = v17;
      goto LABEL_17;
    }

    id v5 = -[APSFilterChange initWithChange:triggeringTopic:]( objc_alloc(&OBJC_CLASS___APSFilterChange),  "initWithChange:triggeringTopic:",  v8,  v11);
    -[APSTopicManager _processTopicChange:immediately:alertDelegate:]( self,  "_processTopicChange:immediately:alertDelegate:",  v5,  1LL,  1LL);
    id v4 = v17;
  }

  else
  {
    id v11 = &stru_100123240;
  }

LABEL_17:
}

- (void)_filtersWillPotentiallyBeChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"topic"]);

  if (-[APSTopicManager _hasTopic:](self, "_hasTopic:", v5))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      int64_t v8 = self;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Filter will potentially be changed for topic %@",  (uint8_t *)&v7,  0x16u);
    }

    -[APSTopicManager filtersWillPotentiallyBeChangedByPolicy:]( self,  "filtersWillPotentiallyBeChangedByPolicy:",  self->_policy);
  }
}

- (void)_clearPendingFilterTimer
{
  self->_pendingServerUpdate = 0;
  -[NSTimer invalidate](self->_pendingFilterTimer, "invalidate");
  pendingFilterTimer = self->_pendingFilterTimer;
  self->_pendingFilterTimer = 0LL;
}

- (void)_processPendingChangeIfNeeded
{
  if (self->_pendingServerUpdate)
  {
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ _processPendingChangeIfNeeded, forcing timer to fire!",  (uint8_t *)&v4,  0xCu);
    }

    -[APSTopicManager _pendingFilterTimerFired](self, "_pendingFilterTimerFired");
  }

- (void)_pendingFilterTimerFired
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ _pendingFilterTimerFired",  (uint8_t *)&v5,  0xCu);
  }

  -[APSTopicManager _clearPendingFilterTimer](self, "_clearPendingFilterTimer");
  -[APSTopicManager _processTopicChange:immediately:alertDelegate:]( self,  "_processTopicChange:immediately:alertDelegate:",  self->_pendingChange,  1LL,  1LL);
  pendingChange = self->_pendingChange;
  self->_pendingChange = 0LL;
}

- (void)_scheduleServerUpdateWithChange:(id)a3 timer:(BOOL)a4
{
}

- (void)_scheduleServerUpdateWithChange:(id)a3 timer:(BOOL)a4 shortInterval:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = [v9 topicGroupChange];
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v12 = sub_10003F9C8((unint64_t)[v9 topicGroupChange]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    int64_t v14 = (void *)v13;
    int64_t v15 = @"NO";
    BOOL isPowerEfficientToSendFilter = self->_isPowerEfficientToSendFilter;
    *(_DWORD *)__int128 v25 = 138413314;
    *(void *)&v25[4] = self;
    if (v6) {
      id v17 = @"YES";
    }
    else {
      id v17 = @"NO";
    }
    if (v5) {
      __int128 v18 = @"YES";
    }
    else {
      __int128 v18 = @"NO";
    }
    *(_WORD *)&v25[12] = 2112;
    *(void *)&v25[14] = v13;
    if (isPowerEfficientToSendFilter) {
      int64_t v15 = @"YES";
    }
    *(_WORD *)&v25[22] = 2112;
    __int16 v26 = v17;
    __int16 v27 = 2112;
    __int16 v28 = v18;
    __int16 v29 = 2112;
    unsigned int v30 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ Schedule server update with change %@; withTimer %@; shortInterval %@; isPowerEfficientToSendFilter %@",
      v25,
      0x34u);
  }

  if (self->_isPowerEfficientToSendFilter && v5)
  {
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 v25 = 138412290;
      *(void *)&v25[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@ asked to schedule an update but it's power efficient now. Processing update now.",  v25,  0xCu);
    }

    -[APSTopicManager _pendingFilterTimerFired](self, "_pendingFilterTimerFired");
  }

  else
  {
    if (v6)
    {
      -[APSTopicManager _clearPendingFilterTimer](self, "_clearPendingFilterTimer");
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 v25 = 138412290;
        *(void *)&v25[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@ scheduling a pending filter timer.",  v25,  0xCu);
      }

      double v21 = 300.0;
      if (v5) {
        double v21 = 20.0;
      }
      __int128 v22 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_pendingFilterTimerFired",  0LL,  0LL,  v21,  *(_OWORD *)v25,  *(void *)&v25[16]));
      pendingFilterTimer = self->_pendingFilterTimer;
      self->_pendingFilterTimer = v22;

      -[NSTimer setTolerance:](self->_pendingFilterTimer, "setTolerance:", 2.0);
    }

    else
    {
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 v25 = 138412290;
        *(void *)&v25[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@ Topic change is low priority, not scheduling a timer.",  v25,  0xCu);
      }
    }

    self->_pendingServerUpdate = 1;
  }
}

- (void)performFilterBlock:(id)a3
{
  int v4 = (void (**)(id, void *, void *, void *, void *, void *, void *))a3;
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog topicManager](&OBJC_CLASS___APSLog, "topicManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int64_t v15 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ asked to performFilterBlock",  (uint8_t *)&v14,  0xCu);
  }

  -[APSTopicManager _clearPendingFilterTimer](self, "_clearPendingFilterTimer");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager group](self, "group"));
  id v7 = [v6 copy];
  -[APSTopicManager setServerGroup:](self, "setServerGroup:", v7);

  if (v4)
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToIgnoredTopics](self->_group, "hashesToIgnoredTopics"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self->_group, "hashesToPausedTopics"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicsToSaltsWithUser:](self->_topicHasher, "topicsToSaltsWithUser:", self->_user));
    v4[2](v4, v8, v9, v10, v11, v12, v13);
  }
}

- (id)debugDescription
{
  uint64_t v21 = objc_opt_class(self, a2);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[APSUser name](self->_user, "name"));
  environmentName = self->_environmentName;
  __int128 v20 = (void *)v3;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
  uint64_t v4 = APSPrettyPrintCollection(v23, 0LL, 0LL, 0LL);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self->_group, "hashesToOpportunisticTopics"));
  uint64_t v6 = APSPrettyPrintCollection(v22, 0LL, 0LL, 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self->_group, "hashesToNonWakingTopics"));
  uint64_t v9 = APSPrettyPrintCollection(v8, 0LL, 0LL, 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToIgnoredTopics](self->_group, "hashesToIgnoredTopics"));
  uint64_t v12 = APSPrettyPrintCollection(v11, 0LL, 0LL, 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self->_group, "hashesToPausedTopics"));
  uint64_t v15 = APSPrettyPrintCollection(v14, 0LL, 0LL, 0LL);
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<<%@: %p>: { userName=%@, environment=%@, enabledTopics=%@, opportunisticTopics=%@, nonWakingTopics=%@, ignoredTopics=%@, pausedTopics=%@ }>",  v21,  self,  v20,  environmentName,  v5,  v7,  v10,  v13,  v16));

  return v17;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  environmentName = self->_environmentName;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_user, "name"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; %@; %@>",
                   v3,
                   self,
                   environmentName,
                   v5));

  return v6;
}

- (NSString)logString
{
  __int128 v54 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@: {\n",  self);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 16LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 16LL));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 16LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 16LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 16LL));
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v55 = self;
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self->_group, "hashesToEnabledTopics"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allValues]);

  id v10 = [v9 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v73;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v73 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v72 + 1) + 8 * (void)v13) topicName]);
        [v3 addObject:v14];

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }

    while (v11);
  }

  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToIgnoredTopics](v55->_group, "hashesToIgnoredTopics"));
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allValues]);

  id v17 = [v16 countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v69;
    do
    {
      __int128 v20 = 0LL;
      do
      {
        if (*(void *)v69 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v68 + 1) + 8 * (void)v20) topicName]);
        [v4 addObject:v21];

        __int128 v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v68 objects:v79 count:16];
    }

    while (v18);
  }

  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](v55->_group, "hashesToOpportunisticTopics"));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allValues]);

  id v24 = [v23 countByEnumeratingWithState:&v64 objects:v78 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v65;
    do
    {
      __int16 v27 = 0LL;
      do
      {
        if (*(void *)v65 != v26) {
          objc_enumerationMutation(v23);
        }
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v64 + 1) + 8 * (void)v27) topicName]);
        [v5 addObject:v28];

        __int16 v27 = (char *)v27 + 1;
      }

      while (v25 != v27);
      id v25 = [v23 countByEnumeratingWithState:&v64 objects:v78 count:16];
    }

    while (v25);
  }

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](v55->_group, "hashesToPausedTopics"));
  unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 allValues]);

  id v31 = [v30 countByEnumeratingWithState:&v60 objects:v77 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v61;
    do
    {
      __int128 v34 = 0LL;
      do
      {
        if (*(void *)v61 != v33) {
          objc_enumerationMutation(v30);
        }
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v60 + 1) + 8 * (void)v34) topicName]);
        [v7 addObject:v35];

        __int128 v34 = (char *)v34 + 1;
      }

      while (v32 != v34);
      id v32 = [v30 countByEnumeratingWithState:&v60 objects:v77 count:16];
    }

    while (v32);
  }

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](v55->_group, "hashesToNonWakingTopics"));
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 allValues]);

  id v38 = [v37 countByEnumeratingWithState:&v56 objects:v76 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v57;
    do
    {
      id v41 = 0LL;
      do
      {
        if (*(void *)v57 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v56 + 1) + 8 * (void)v41) topicName]);
        [v6 addObject:v42];

        id v41 = (char *)v41 + 1;
      }

      while (v39 != v41);
      id v39 = [v37 countByEnumeratingWithState:&v56 objects:v76 count:16];
    }

    while (v39);
  }

  -[NSMutableString appendString:](v54, "appendString:", @"\tEnabled");
  uint64_t v43 = APSPrettyPrintCollection(v3, 1LL, 1LL, 0LL);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  -[NSMutableString appendString:](v54, "appendString:", v44);

  -[NSMutableString appendString:](v54, "appendString:", @"\tIgnored");
  uint64_t v45 = APSPrettyPrintCollection(v4, 1LL, 1LL, 0LL);
  int v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  -[NSMutableString appendString:](v54, "appendString:", v46);

  -[NSMutableString appendString:](v54, "appendString:", @"\tOpportunistic");
  uint64_t v47 = APSPrettyPrintCollection(v5, 1LL, 1LL, 0LL);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  -[NSMutableString appendString:](v54, "appendString:", v48);

  -[NSMutableString appendString:](v54, "appendString:", @"\tPaused");
  uint64_t v49 = APSPrettyPrintCollection(v7, 1LL, 1LL, 0LL);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  -[NSMutableString appendString:](v54, "appendString:", v50);

  -[NSMutableString appendString:](v54, "appendString:", @"\tNon-waking");
  uint64_t v51 = APSPrettyPrintCollection(v6, 1LL, 1LL, 0LL);
  __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  -[NSMutableString appendString:](v54, "appendString:", v52);

  -[NSMutableString appendString:](v54, "appendString:", @"\t}");
  return (NSString *)v54;
}

- (int64_t)_changeFromFilter:(int64_t)a3 toFilter:(int64_t)a4
{
  switch(a3)
  {
    case 0LL:
      uint64_t v4 = &unk_1001028C0;
      goto LABEL_12;
    case 1LL:
      uint64_t v4 = &unk_1001028E8;
      goto LABEL_12;
    case 2LL:
      uint64_t v4 = &unk_100102910;
      goto LABEL_12;
    case 3LL:
      uint64_t v4 = &unk_100102938;
      goto LABEL_12;
    case 4LL:
      uint64_t v4 = &unk_100102960;
LABEL_12:
      int64_t result = v4[a4];
      break;
    default:
LABEL_13:
      int64_t result = 1LL;
      break;
  }

  return result;
}

- (APSTopicGroup)group
{
  return self->_group;
}

- (APSTopicManagerDelegate)delegate
{
  return (APSTopicManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)pendingServerUpdate
{
  return self->_pendingServerUpdate;
}

- (APSTopicHasher)topicHasher
{
  return self->_topicHasher;
}

- (NSDictionary)hashesToTopics
{
  return &self->_hashesToTopics->super;
}

- (APSTopicFilterPolicy)policy
{
  return self->_policy;
}

- (BOOL)inTransaction
{
  return self->_inTransaction;
}

- (void)setInTransaction:(BOOL)a3
{
  self->_inTransaction = a3;
}

- (int64_t)transactionChange
{
  return self->_transactionChange;
}

- (void)setTransactionChange:(int64_t)a3
{
  self->_transactionChange = a3;
}

- (NSMutableArray)topicsChanged
{
  return self->_topicsChanged;
}

- (void)setTopicsChanged:(id)a3
{
}

- (APSTopicGroup)serverGroup
{
  return self->_serverGroup;
}

- (void)setServerGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end