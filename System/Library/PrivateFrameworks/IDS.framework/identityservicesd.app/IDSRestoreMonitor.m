@interface IDSRestoreMonitor
+ (IDSRestoreMonitor)sharedInstance;
- (BOOL)hasActionForTarget:(id)a3;
- (IDSRestoreMonitor)initWithTimerBlock:(id)a3;
- (IMTimer)restoreTimer;
- (NSMapTable)actionByTarget;
- (id)timerBlock;
- (void)_timerFired;
- (void)_timerFiredOnMain;
- (void)addTarget:(id)a3 actionBlock:(id)a4;
- (void)removeTarget:(id)a3;
- (void)setActionByTarget:(id)a3;
- (void)setRestoreTimer:(id)a3;
- (void)setTimerBlock:(id)a3;
@end

@implementation IDSRestoreMonitor

+ (IDSRestoreMonitor)sharedInstance
{
  if (qword_1009C0CD8 != -1) {
    dispatch_once(&qword_1009C0CD8, &stru_100903D68);
  }
  return (IDSRestoreMonitor *)(id)qword_1009C0CD0;
}

- (IDSRestoreMonitor)initWithTimerBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___IDSRestoreMonitor;
    v5 = -[IDSRestoreMonitor init](&v10, "init");
    if (v5)
    {
      id v6 = [v4 copy];
      id timerBlock = v5->_timerBlock;
      v5->_id timerBlock = v6;
    }

    self = v5;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (BOOL)hasActionForTarget:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_actionByTarget, "objectForKey:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)addTarget:(id)a3 actionBlock:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  actionByTarget = self->_actionByTarget;
  if (!actionByTarget)
  {
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue( +[NSMapTable weakToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "weakToStrongObjectsMapTable"));
    v9 = self->_actionByTarget;
    self->_actionByTarget = v8;

    actionByTarget = self->_actionByTarget;
  }

  id v10 = objc_retainBlock(v6);
  -[NSMapTable setObject:forKey:](actionByTarget, "setObject:forKey:", v10, v14);

  if (!self->_restoreTimer)
  {
    uint64_t v11 = (*((uint64_t (**)(void))self->_timerBlock + 2))();
    v12 = (IMTimer *)objc_claimAutoreleasedReturnValue(v11);
    restoreTimer = self->_restoreTimer;
    self->_restoreTimer = v12;
  }
}

- (void)removeTarget:(id)a3
{
  if (!-[NSMapTable count](self->_actionByTarget, "count"))
  {
    actionByTarget = self->_actionByTarget;
    self->_actionByTarget = 0LL;

    -[IMTimer invalidate](self->_restoreTimer, "invalidate");
    restoreTimer = self->_restoreTimer;
    self->_restoreTimer = 0LL;
  }

- (void)_timerFired
{
  id v3 = -[NSMapTable copy](self->_actionByTarget, "copy");
  actionByTarget = self->_actionByTarget;
  self->_actionByTarget = 0LL;

  -[IMTimer invalidate](self->_restoreTimer, "invalidate");
  restoreTimer = self->_restoreTimer;
  self->_restoreTimer = 0LL;

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v11, (void)v13));
        v12[2](v12, v11);
      }

      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }
}

- (void)_timerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003B8A10;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (id)timerBlock
{
  return self->_timerBlock;
}

- (void)setTimerBlock:(id)a3
{
}

- (IMTimer)restoreTimer
{
  return self->_restoreTimer;
}

- (void)setRestoreTimer:(id)a3
{
}

- (NSMapTable)actionByTarget
{
  return self->_actionByTarget;
}

- (void)setActionByTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end