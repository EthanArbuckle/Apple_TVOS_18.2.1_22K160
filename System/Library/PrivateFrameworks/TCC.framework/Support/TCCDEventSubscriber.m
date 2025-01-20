@interface TCCDEventSubscriber
- (TCCDEventSubscriber)initWithToken:(unint64_t)a3 filter:(id)a4 fromPublisher:(id)a5;
- (id)description;
- (unint64_t)token;
- (void)_addPendingEvent:(id)a3;
- (void)_checkEntitlement;
- (void)_publishPendingEvents;
- (void)_sendEvent:(id)a3;
- (void)publish:(id)a3;
@end

@implementation TCCDEventSubscriber

- (TCCDEventSubscriber)initWithToken:(unint64_t)a3 filter:(id)a4 fromPublisher:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TCCDEventSubscriber;
  v11 = -[TCCDEventSubscriber init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    v11->_token = a3;
    objc_storeStrong((id *)&v11->_filter, a4);
    objc_storeWeak((id *)&v12->_publisher, v10);
    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_state = 0LL;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingEvents = v12->_pendingEvents;
    v12->_pendingEvents = (NSMutableArray *)v13;

    codeSigningIdentity = v12->_codeSigningIdentity;
    v12->_codeSigningIdentity = 0LL;
  }

  return v12;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  unint64_t v4 = self->_state - 1;
  if (v4 > 2) {
    v5 = "Initial";
  }
  else {
    v5 = off_100066150[v4];
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: token=%llu, state=%s, csid=%@>",  v3,  self->_token,  v5,  self->_codeSigningIdentity);
}

- (void)_checkEntitlement
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_state = 1LL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publisher);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003A988;
  v5[3] = &unk_100066130;
  v5[4] = self;
  [WeakRetained checkEntitlementForSubscriber:self completionHandler:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_addPendingEvent:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_pendingEvents, "addObject:", v4);
  if ((unint64_t)-[NSMutableArray count](self->_pendingEvents, "count") >= 0x21)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_pendingEvents, "removeObjectAtIndex:", 0LL);
    id v5 = tcc_events_log();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10003AE44((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_publishPendingEvents
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t v3 = self->_pendingEvents;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[TCCDEventSubscriber publish:]( self,  "publish:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  (void)v8);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_pendingEvents, "removeAllObjects");
}

- (void)_sendEvent:(id)a3
{
  p_publisher = &self->_publisher;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_publisher);
  [WeakRetained sendEvent:v5 toSubscriber:self];
}

- (void)publish:(id)a3
{
  id v7 = a3;
  unsigned int v4 = -[TCCDEventFilter matches:](self->_filter, "matches:", v7);
  id v5 = v7;
  if (v4)
  {
    int64_t state = self->_state;
    switch(state)
    {
      case 2LL:
        -[TCCDEventSubscriber _sendEvent:](self, "_sendEvent:", v7);
        goto LABEL_8;
      case 1LL:
        -[TCCDEventSubscriber _addPendingEvent:](self, "_addPendingEvent:", v7);
        goto LABEL_8;
      case 0LL:
        -[TCCDEventSubscriber _addPendingEvent:](self, "_addPendingEvent:", v7);
        -[TCCDEventSubscriber _checkEntitlement](self, "_checkEntitlement");
LABEL_8:
        id v5 = v7;
        break;
    }
  }
}

- (unint64_t)token
{
  return self->_token;
}

- (void).cxx_destruct
{
}

@end