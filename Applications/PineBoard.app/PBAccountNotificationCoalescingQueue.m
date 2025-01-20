@interface PBAccountNotificationCoalescingQueue
- (NSMutableArray)allNotifications;
- (NSMutableDictionary)notificationByIdentifier;
- (NSMutableSet)coalescedSet;
- (PBAccountNotificationCoalescingQueue)init;
- (id)coalescedNotifications;
- (void)_keepNotification:(id)a3 forAccountIdentifier:(id)a4 removingNotification:(id)a5;
- (void)addNotification:(id)a3;
@end

@implementation PBAccountNotificationCoalescingQueue

- (PBAccountNotificationCoalescingQueue)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBAccountNotificationCoalescingQueue;
  v2 = -[PBAccountNotificationCoalescingQueue init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    allNotifications = v2->_allNotifications;
    v2->_allNotifications = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    coalescedSet = v2->_coalescedSet;
    v2->_coalescedSet = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    notificationByIdentifier = v2->_notificationByIdentifier;
    v2->_notificationByIdentifier = v7;
  }

  return v2;
}

- (void)addNotification:(id)a3
{
  id v4 = a3;
  -[NSMutableArray addObject:](self->_allNotifications, "addObject:", v4);
  v5 = objc_alloc(&OBJC_CLASS____PBAccountIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountTypeIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
  v8 = -[_PBAccountIdentifier initWithAccountType:altDSID:](v5, "initWithAccountType:altDSID:", v6, v7);

  if ([v4 type] == (id)3)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[_PBAccountIdentifier anyAccountIdentifier](&OBJC_CLASS____PBAccountIdentifier, "anyAccountIdentifier"));

    v8 = (_PBAccountIdentifier *)v9;
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_notificationByIdentifier,  "objectForKeyedSubscript:",  v8));
  if (!v10)
  {
    v12 = self;
    id v13 = v4;
    v14 = v8;
    v15 = 0LL;
    goto LABEL_7;
  }

  id v11 = [v4 type];
  if (v11 == [v10 type])
  {
LABEL_5:
    v12 = self;
    id v13 = v4;
    v14 = v8;
    v15 = v10;
LABEL_7:
    -[PBAccountNotificationCoalescingQueue _keepNotification:forAccountIdentifier:removingNotification:]( v12,  "_keepNotification:forAccountIdentifier:removingNotification:",  v13,  v14,  v15);
    goto LABEL_8;
  }

  if ([v10 type] || objc_msgSend(v4, "type") != (id)1)
  {
    if ([v10 type] == (id)1 && objc_msgSend(v4, "type") == (id)2) {
      goto LABEL_5;
    }
    if ([v10 type] || objc_msgSend(v4, "type") != (id)2)
    {
      if ([v10 type] == (id)2 && !objc_msgSend(v4, "type"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v10 accountIdentifier]);
        unsigned __int8 v21 = [v19 isEqualToString:v20];

        if ((v21 & 1) == 0) {
          goto LABEL_5;
        }
      }
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v10 accountIdentifier]);
      unsigned int v18 = [v16 isEqualToString:v17];

      if (v18)
      {
        -[NSMutableSet removeObject:](self->_coalescedSet, "removeObject:", v10);
        -[NSMutableDictionary removeObjectForKey:](self->_notificationByIdentifier, "removeObjectForKey:", v8);
      }
    }
  }

- (id)coalescedNotifications
{
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  uint64_t v27 = 0LL;
  uint64_t v20 = 0LL;
  unsigned __int8 v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = 0LL;
  allNotifications = self->_allNotifications;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000712D0;
  v11[3] = &unk_1003D2D40;
  v11[4] = self;
  v11[5] = &v24;
  v11[6] = &v20;
  v11[7] = &v16;
  v11[8] = &v12;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray bs_filter:](allNotifications, "bs_filter:", v11));
  if (v25[3] >= 1)
  {
    id v4 = sub_100084608();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v25[3];
      uint64_t v7 = v21[3];
      uint64_t v8 = v17[3];
      uint64_t v9 = v13[3];
      *(_DWORD *)buf = 134218752;
      uint64_t v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = v7;
      __int16 v32 = 2048;
      uint64_t v33 = v8;
      __int16 v34 = 2048;
      uint64_t v35 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Some account notifications were filtered out. {totalCount=%ld, didAddCount=%ld, didUpdateCount=%ld, didRemoveCount=%ld}",  buf,  0x2Au);
    }
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v3;
}

- (void)_keepNotification:(id)a3 forAccountIdentifier:(id)a4 removingNotification:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    -[NSMutableSet removeObject:](self->_coalescedSet, "removeObject:", a5);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_notificationByIdentifier,  "setObject:forKeyedSubscript:",  v8,  v9);
  -[NSMutableSet addObject:](self->_coalescedSet, "addObject:", v8);
}

- (NSMutableArray)allNotifications
{
  return self->_allNotifications;
}

- (NSMutableSet)coalescedSet
{
  return self->_coalescedSet;
}

- (NSMutableDictionary)notificationByIdentifier
{
  return self->_notificationByIdentifier;
}

- (void).cxx_destruct
{
}

@end