@interface MRDPlaybackQueueParticipantDataSource
- (MRDPlaybackQueueParticipantDataSource)initWithDelegate:(id)a3;
- (MRDPlaybackQueueParticipantDataSourceDelegate)delegate;
- (MSVTimer)pepperExpirationTimer;
- (NSArray)participants;
- (NSDate)pepperExpirationDate;
- (NSMapTable)localIdentityMap;
- (NSMapTable)remoteIdentityMap;
- (NSString)pepper;
- (NSUserDefaults)storage;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)donateAttribution:(id)a3;
- (void)dealloc;
- (void)handleGroupSessionServerDidStartNotification:(id)a3;
- (void)handleMusicStateUpdateNotification:(id)a3;
- (void)loadFromStorage;
- (void)loadLocalIdentities;
- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)rebuildParticipants;
- (void)rotatePepper;
- (void)setParticipants:(id)a3;
- (void)setPepper:(id)a3;
- (void)setPepperExpirationDate:(id)a3;
- (void)setPepperExpirationTimer:(id)a3;
- (void)updatePepperIfNeededWithSession:(id)a3;
@end

@implementation MRDPlaybackQueueParticipantDataSource

- (MRDPlaybackQueueParticipantDataSource)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v6 = [v5 supportGroupSessionAttribution];

  if (v6)
  {
    v35.receiver = self;
    v35.super_class = (Class)&OBJC_CLASS___MRDPlaybackQueueParticipantDataSource;
    v7 = -[MRDPlaybackQueueParticipantDataSource init](&v35, "init");
    v9 = v7;
    if (v7)
    {
      objc_storeWeak((id *)&v7->_delegate, v4);
      dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
      dispatch_queue_t v12 = dispatch_queue_create("com.apple.amp.MediaRemote.MRDPlaybackQueueParticipantDataSource.queue", v11);
      queue = v9->_queue;
      v9->_queue = (OS_dispatch_queue *)v12;

      dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
      id v16 = sub_1000F1FC8();
      v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
      dispatch_queue_t v18 = dispatch_queue_create_with_target_V2( "com.apple.amp.MediaRemote.MRDPlaybackQueueParticipantDataSource.delegateQueue",  v15,  v17);
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = (OS_dispatch_queue *)v18;

      uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
      localIdentityMap = v9->_localIdentityMap;
      v9->_localIdentityMap = (NSMapTable *)v20;

      uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
      remoteIdentityMap = v9->_remoteIdentityMap;
      v9->_remoteIdentityMap = (NSMapTable *)v22;

      participants = v9->_participants;
      v9->_participants = (NSArray *)&__NSArray0__struct;

      uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
      pepperExpirationDate = v9->_pepperExpirationDate;
      v9->_pepperExpirationDate = (NSDate *)v25;

      v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](v9, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000F25A8;
      block[3] = &unk_100399250;
      v34 = v9;
      dispatch_async(v27, block);
    }

    uint64_t v28 = _MRLogForCategory(12LL, v8);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v32 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[MRDPlaybackQueueParticipantDataSource] Initialized",  (uint8_t *)&v32,  2u);
    }

    self = v9;
    v30 = self;
  }

  else
  {
    v30 = 0LL;
  }

  return v30;
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(12LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDPlaybackQueueParticipantDataSource] Dealloc",  buf,  2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDPlaybackQueueParticipantDataSource;
  -[MRDPlaybackQueueParticipantDataSource dealloc](&v5, "dealloc");
}

- (NSArray)participants
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  dispatch_queue_attr_t v10 = sub_1000F27F8;
  v11 = sub_1000F2808;
  id v12 = 0LL;
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F2810;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)donateAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000F27F8;
  id v16 = sub_1000F2808;
  id v17 = 0LL;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F292C;
  block[3] = &unk_100399CB8;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_async_and_wait(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)rebuildParticipants
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource localIdentityMap](self, "localIdentityMap"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyEnumerator]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

  uint64_t v8 = v7;
  id v9 = [v7 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)v12);
        uint64_t v14 = objc_alloc(&OBJC_CLASS___MRPlaybackQueueParticipant);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource localIdentityMap](self, "localIdentityMap"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v13]);
        id v17 = -[MRPlaybackQueueParticipant initWithIdentifier:identity:](v14, "initWithIdentifier:identity:", v16, v13);

        [v4 addObject:v17];
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }

    while (v10);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  dispatch_queue_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource remoteIdentityMap](self, "remoteIdentityMap"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 keyEnumerator]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allObjects]);

  id v21 = [v20 countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v41;
    do
    {
      v24 = 0LL;
      do
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)v24);
        v26 = objc_alloc(&OBJC_CLASS___MRPlaybackQueueParticipant);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource remoteIdentityMap](self, "remoteIdentityMap"));
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:v25]);
        v29 = -[MRPlaybackQueueParticipant initWithIdentifier:identity:](v26, "initWithIdentifier:identity:", v28, v25);

        [v4 addObject:v29];
        v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v40 objects:v51 count:16];
    }

    while (v22);
  }

  v30 = -[NSSortDescriptor initWithKey:ascending:selector:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:selector:",  @"identity.displayName",  1LL,  "localizedStandardCompare:");
  v50 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v50, 1LL));
  [v4 sortUsingDescriptors:v31];

  if (!-[NSArray isEqualToArray:](self->_participants, "isEqualToArray:", v4))
  {
    uint64_t v33 = _MRLogForCategory(12LL, v32);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[MRDPlaybackQueueParticipantDataSource] Updated participants: %@",  buf,  0xCu);
    }

    id v35 = [v4 copy];
    objc_storeStrong((id *)&self->_participants, v35);
    -[MRDPlaybackQueueParticipantDataSource saveToStorage](self, "saveToStorage");
    v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource delegateQueue](self, "delegateQueue"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000F2E54;
    v38[3] = &unk_100398E60;
    v38[4] = self;
    id v39 = v35;
    id v37 = v35;
    dispatch_async(v36, v38);
  }
}

- (void)loadFromStorage
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = _MRLogForCategory(12LL, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDPlaybackQueueParticipantDataSource] loadFromStorage.",  buf,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource storage](self, "storage"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"MRDPQPDS.PPR"]);

  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource storage](self, "storage"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"MRDPQPDS.PED"]);

      if (v11)
      {
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          [v11 timeIntervalSinceNow];
          if (v13 > 60.0)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource storage](self, "storage"));
            v48 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"MRDPQPDS.RPS"]);

            if (v48)
            {
              uint64_t v15 = objc_opt_class(&OBJC_CLASS___MRUserIdentity);
              id v55 = 0LL;
              id v16 = +[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:",  v15,  objc_opt_class(&OBJC_CLASS___NSString),  v48,  &v55);
              __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(v16);
              id v46 = v55;
              if ([v47 count])
              {
                __int128 v53 = 0u;
                __int128 v54 = 0u;
                __int128 v51 = 0u;
                __int128 v52 = 0u;
                id v17 = v47;
                id v18 = [v17 countByEnumeratingWithState:&v51 objects:v60 count:16];
                if (v18)
                {
                  uint64_t v19 = *(void *)v52;
                  do
                  {
                    for (i = 0LL; i != v18; i = (char *)i + 1)
                    {
                      if (*(void *)v52 != v19) {
                        objc_enumerationMutation(v17);
                      }
                      uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)i);
                      id v22 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPlaybackQueueParticipantDataSource remoteIdentityMap]( self,  "remoteIdentityMap"));
                      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v21]);
                      [v22 setObject:v23 forKey:v21];
                    }

                    id v18 = [v17 countByEnumeratingWithState:&v51 objects:v60 count:16];
                  }

                  while (v18);
                }

                uint64_t v25 = _MRLogForCategory(12LL, v24);
                v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  id v27 = [v17 count];
                  [v11 timeIntervalSinceNow];
                  *(_DWORD *)buf = 134218240;
                  id v57 = v27;
                  __int16 v58 = 2048;
                  uint64_t v59 = v28;
                  _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[MRDPlaybackQueueParticipantDataSource] Rehydrated %lu remote participants with remaining time %f.",  buf,  0x16u);
                }

                -[MRDPlaybackQueueParticipantDataSource setPepper:](self, "setPepper:", v8);
                -[MRDPlaybackQueueParticipantDataSource setPepperExpirationDate:](self, "setPepperExpirationDate:", v11);
                objc_initWeak((id *)buf, self);
                v29 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPlaybackQueueParticipantDataSource pepperExpirationDate]( self,  "pepperExpirationDate"));
                [v29 timeIntervalSinceNow];
                double v31 = v30;
                uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
                v49[0] = _NSConcreteStackBlock;
                v49[1] = 3221225472LL;
                v49[2] = sub_1000F342C;
                v49[3] = &unk_10039A668;
                objc_copyWeak(&v50, (id *)buf);
                uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:queue:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:queue:block:",  0LL,  v32,  v49,  v31 + 1.0));
                -[MRDPlaybackQueueParticipantDataSource setPepperExpirationTimer:]( self,  "setPepperExpirationTimer:",  v33);

                objc_destroyWeak(&v50);
                objc_destroyWeak((id *)buf);
              }
            }
          }
        }
      }
    }
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource pepper](self, "pepper"));
  BOOL v35 = v34 == 0LL;

  if (v35)
  {
    uint64_t v37 = _MRLogForCategory(12LL, v36);
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "[MRDPlaybackQueueParticipantDataSource] Did not rehydrate.",  buf,  2u);
    }

    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource storage](self, "storage"));
    [v39 setObject:0 forKey:@"MRDPQPDS.RPS"];

    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource storage](self, "storage"));
    [v40 setObject:0 forKey:@"MRDPQPDS.PED"];

    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource storage](self, "storage"));
    [v41 setObject:0 forKey:@"MRDPQPDS.PPR"];
  }

  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v42 groupSessionServer]);
  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 sessionManager]);

  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 session]);
  -[MRDPlaybackQueueParticipantDataSource updatePepperIfNeededWithSession:]( self,  "updatePepperIfNeededWithSession:",  v45);
}

- (void)updatePepperIfNeededWithSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource pepperExpirationDate](self, "pepperExpirationDate"));
  [v6 timeIntervalSinceNow];
  double v8 = v7;

  unsigned int v9 = [v4 isHosted];
  if (v8 < 0.0 && v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource pepper](self, "pepper"));

    if (v10) {
      return;
    }
LABEL_6:
    -[MRDPlaybackQueueParticipantDataSource rotatePepper](self, "rotatePepper");
    return;
  }

  if (v8 < 0.0) {
    goto LABEL_6;
  }
}

- (void)rotatePepper
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = MSVNanoIDCreateTaggedPointer();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[MRDPlaybackQueueParticipantDataSource setPepper:](self, "setPepper:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v7 groupSessionAttributionValidityDuration];
  double v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:"));
  -[MRDPlaybackQueueParticipantDataSource setPepperExpirationDate:](self, "setPepperExpirationDate:", v8);

  objc_initWeak(&location, self);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource pepperExpirationDate](self, "pepperExpirationDate"));
  [v9 timeIntervalSinceNow];
  double v11 = v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1000F3758;
  id v18 = &unk_10039A668;
  objc_copyWeak(&v19, &location);
  double v13 = (void *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:queue:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:queue:block:",  0LL,  v12,  &v15,  v11 + 1.0));
  -[MRDPlaybackQueueParticipantDataSource setPepperExpirationTimer:]( self,  "setPepperExpirationTimer:",  v13,  v15,  v16,  v17,  v18);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource remoteIdentityMap](self, "remoteIdentityMap"));
  [v14 removeAllObjects];

  -[MRDPlaybackQueueParticipantDataSource saveToStorage](self, "saveToStorage");
  -[MRDPlaybackQueueParticipantDataSource rebuildParticipants](self, "rebuildParticipants");
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)loadLocalIdentities
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMusicUserStateCenter sharedCenter](&OBJC_CLASS___MRDMusicUserStateCenter, "sharedCenter"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localUserIdentities]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource localIdentityMap](self, "localIdentityMap"));
  [v6 removeAllObjects];

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        double v13 = (void *)objc_claimAutoreleasedReturnValue( +[MRPlaybackQueueParticipant expectedIdentifierForUserIdentity:withRandomData:]( &OBJC_CLASS___MRPlaybackQueueParticipant,  "expectedIdentifierForUserIdentity:withRandomData:",  v12,  0LL,  (void)v15));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource localIdentityMap](self, "localIdentityMap"));
        [v14 setObject:v13 forKey:v12];
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  -[MRDPlaybackQueueParticipantDataSource rebuildParticipants](self, "rebuildParticipants");
}

- (void)handleMusicStateUpdateNotification:(id)a3
{
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F39E8;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleGroupSessionServerDidStartNotification:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 groupSessionServer]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 sessionManager]);

  [v6 addObserver:self];
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F3AF8;
  v8[3] = &unk_100398E60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPlaybackQueueParticipantDataSource queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F3B9C;
  v8[3] = &unk_100398E60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)setParticipants:(id)a3
{
}

- (MRDPlaybackQueueParticipantDataSourceDelegate)delegate
{
  return (MRDPlaybackQueueParticipantDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSUserDefaults)storage
{
  return self->_storage;
}

- (NSMapTable)localIdentityMap
{
  return self->_localIdentityMap;
}

- (NSMapTable)remoteIdentityMap
{
  return self->_remoteIdentityMap;
}

- (NSString)pepper
{
  return self->_pepper;
}

- (void)setPepper:(id)a3
{
}

- (NSDate)pepperExpirationDate
{
  return self->_pepperExpirationDate;
}

- (void)setPepperExpirationDate:(id)a3
{
}

- (MSVTimer)pepperExpirationTimer
{
  return self->_pepperExpirationTimer;
}

- (void)setPepperExpirationTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end