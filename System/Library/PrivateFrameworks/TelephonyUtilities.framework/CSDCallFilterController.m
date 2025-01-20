@interface CSDCallFilterController
- (BOOL)containsOutgoingRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)containsRecentsRestrictedHandle:(id)a3;
- (BOOL)containsRestrictedHandle:(id)a3;
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)isUnknownCaller:(id)a3;
- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4;
- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (CSDCallFilterController)init;
- (NSMutableArray)filters;
- (int64_t)filterStatusForAddresses:(id)a3 withBundleIdentifier:(id)a4;
- (os_unfair_lock_s)accessorLock;
- (void)addCallFilter:(id)a3;
- (void)removeCallFilter:(id)a3;
@end

@implementation CSDCallFilterController

- (CSDCallFilterController)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSDCallFilterController;
  v2 = -[CSDCallFilterController init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    filters = v3->_filters;
    v3->_filters = v4;
  }

  return v3;
}

- (void)addCallFilter:(id)a3
{
  id v6 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  [v5 addObject:v6];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)removeCallFilter:(id)a3
{
  id v6 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  [v5 removeObject:v6];

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)containsOutgoingRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100181B38;
  v16[3] = &unk_1003DBFE0;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  BOOL v19 = a5;
  unsigned __int8 v14 = objc_msgSend(v11, "tu_containsObjectPassingTest:", v16);

  os_unfair_lock_unlock(p_accessorLock);
  return v14;
}

- (BOOL)containsRecentsRestrictedHandle:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100181C10;
  v10[3] = &unk_1003DC008;
  id v7 = v4;
  id v11 = v7;
  unsigned __int8 v8 = objc_msgSend(v6, "tu_containsObjectPassingTest:", v10);

  os_unfair_lock_unlock(p_accessorLock);
  return v8;
}

- (BOOL)containsRestrictedHandle:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100181CE4;
  v10[3] = &unk_1003DC008;
  id v7 = v4;
  id v11 = v7;
  unsigned __int8 v8 = objc_msgSend(v6, "tu_containsObjectPassingTest:", v10);

  os_unfair_lock_unlock(p_accessorLock);
  return v8;
}

- (int64_t)filterStatusForAddresses:(id)a3 withBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v9);
      }
      id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) filterStatusForAddresses:v6 withBundleIdentifier:v7];
      if (v13) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    id v13 = 0LL;
  }

  os_unfair_lock_unlock(p_accessorLock);
  return (int64_t)v13;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100181F74;
  v17[3] = &unk_1003DC030;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  id v15 = v10;
  id v20 = v15;
  LOBYTE(v10) = objc_msgSend(v12, "tu_containsObjectPassingTest:", v17);

  os_unfair_lock_unlock(p_accessorLock);
  return (char)v10;
}

- (BOOL)isUnknownCaller:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10018204C;
  v10[3] = &unk_1003DC008;
  id v7 = v4;
  id v11 = v7;
  unsigned __int8 v8 = objc_msgSend(v6, "tu_containsObjectPassingTest:", v10);

  os_unfair_lock_unlock(p_accessorLock);
  return v8;
}

- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10018220C;
  v24[3] = &unk_1003DC058;
  id v10 = v6;
  id v25 = v10;
  id v11 = v7;
  id v26 = v11;
  unsigned __int8 v12 = objc_msgSend(v9, "tu_containsObjectPassingTest:", v24);

  if ((v12 & 1) != 0) {
    goto LABEL_2;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  if (!objc_msgSend(v14, "tu_containsObjectPassingTest:", &stru_1003DC098))
  {

LABEL_9:
    BOOL v13 = 0;
    goto LABEL_10;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  id v20 = sub_100182364;
  v21 = &unk_1003DC058;
  id v22 = v10;
  id v23 = v11;
  unsigned __int8 v16 = objc_msgSend(v15, "tu_containsObjectPassingTest:", &v18);

  if ((v16 & 1) != 0) {
    goto LABEL_9;
  }
LABEL_2:
  BOOL v13 = 1;
LABEL_10:

  os_unfair_lock_unlock(p_accessorLock);
  return v13;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100182570;
  v16[3] = &unk_1003DBFE0;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  BOOL v19 = a5;
  unsigned __int8 v14 = objc_msgSend(v11, "tu_containsObjectPassingTest:", v16);

  os_unfair_lock_unlock(p_accessorLock);
  return v14;
}

- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallFilterController filters](self, "filters"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100182674;
  v14[3] = &unk_1003DC058;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  unsigned __int8 v12 = objc_msgSend(v9, "tu_containsObjectPassingTest:", v14);

  os_unfair_lock_unlock(p_accessorLock);
  return v12;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void).cxx_destruct
{
}

@end