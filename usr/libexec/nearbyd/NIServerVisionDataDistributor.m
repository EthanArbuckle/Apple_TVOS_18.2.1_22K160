@interface NIServerVisionDataDistributor
+ (id)sharedProvider;
- (id).cxx_construct;
- (id)initPrivate;
- (void)processVisionInput:(id)a3;
- (void)registerForVisionInput:(id)a3;
- (void)unregisterForVisionInput:(id)a3;
@end

@implementation NIServerVisionDataDistributor

- (id)initPrivate
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NIServerVisionDataDistributor;
  v2 = -[NIServerVisionDataDistributor init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    consumers = v3->_consumers;
    v3->_consumers = (NSHashTable *)v4;
  }

  return v3;
}

+ (id)sharedProvider
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E171C;
  block[3] = &unk_1007A2398;
  block[4] = a1;
  if (qword_1007F9AB0 != -1) {
    dispatch_once(&qword_1007F9AB0, block);
  }
  return (id)qword_1007F9AA8;
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  uint64_t v6 = sub_100250408((uint64_t)&self->_machTimeConverter, v5);
  if (v7)
  {
    [v4 overrideTimestamp:*(double *)&v6];
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    obj = self->_consumers;
    id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getQueueForInputingData", lock));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1001E1928;
          block[3] = &unk_1007A2248;
          block[4] = v11;
          id v16 = v4;
          dispatch_async(v12, block);
        }

        id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v8);
    }

    os_unfair_lock_unlock(lock);
  }
}

- (void)registerForVisionInput:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (([v6 supportsCameraAssistance] & 1) == 0)
  {
    id v4 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_10039CF48(v4);
    }
    double v5 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v8 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/VIO/NIServerVisionDataDistributor.mm";
      __int16 v9 = 1024;
      int v10 = 59;
      __int16 v11 = 2080;
      v12 = "-[NIServerVisionDataDistributor registerForVisionInput:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: assertion failure in %s", buf, 0x1Cu);
    }

    abort();
  }

  -[NSHashTable addObject:](self->_consumers, "addObject:", v6);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterForVisionInput:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_consumers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end