@interface CSAttendingUsecaseManager
- (CSAttendingUsecaseManager)init;
- (NSHashTable)activeUsecases;
- (NSHashTable)idleUsecases;
- (OS_dispatch_queue)queue;
- (id)usecaseForType:(int64_t)a3;
- (void)_cleanupUsecases:(id)a3;
- (void)setActiveUsecases:(id)a3;
- (void)setIdleUsecases:(id)a3;
- (void)setQueue:(id)a3;
- (void)startAttending:(id)a3 options:(id)a4 completion:(id)a5;
- (void)stopAttending:(id)a3 reason:(int64_t)a4;
@end

@implementation CSAttendingUsecaseManager

- (CSAttendingUsecaseManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSAttendingUsecaseManager;
  v2 = -[CSAttendingUsecaseManager init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"CSAttendingUsecaseManager Queue",  33LL));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    idleUsecases = v2->_idleUsecases;
    v2->_idleUsecases = (NSHashTable *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    activeUsecases = v2->_activeUsecases;
    v2->_activeUsecases = (NSHashTable *)v7;
  }

  return v2;
}

- (id)usecaseForType:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAttendingUsecaseFactory attendingUseCaseByAttendingType:]( &OBJC_CLASS___CSAttendingUsecaseFactory,  "attendingUseCaseByAttendingType:",  a3));
  if (v4)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttendingUsecaseManager queue](self, "queue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100064F10;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }

  return v4;
}

- (void)startAttending:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100064DD4;
  v15[3] = &unk_10022E650;
  id v8 = a5;
  id v16 = v8;
  v9 = objc_retainBlock(v15);
  objc_super v10 = v9;
  if (v7)
  {
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttendingUsecaseManager queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100064DE8;
    v12[3] = &unk_10022E7D0;
    v12[4] = self;
    id v13 = v7;
    id v14 = v10;
    dispatch_async(v11, v12);
  }

  else
  {
    ((void (*)(void *, void, void))v9[2])(v9, 0LL, 0LL);
  }
}

- (void)stopAttending:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSAttendingUsecaseManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100064D20;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  objc_super v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)_cleanupUsecases:(id)a3
{
  id v3 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v10;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*((void *)&v9 + 1) + 8LL * (void)i)) {
        ++v6;
      }
    }

    id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }

  while (v5);
  if (!v6) {
LABEL_11:
  }
    [v3 removeAllObjects];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)idleUsecases
{
  return self->_idleUsecases;
}

- (void)setIdleUsecases:(id)a3
{
}

- (NSHashTable)activeUsecases
{
  return self->_activeUsecases;
}

- (void)setActiveUsecases:(id)a3
{
}

- (void).cxx_destruct
{
}

@end