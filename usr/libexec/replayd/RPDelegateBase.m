@interface RPDelegateBase
- (BOOL)containsDelegate:(id)a3;
- (BOOL)hasDelegate:(id)a3;
- (BOOL)valid;
- (OS_dispatch_queue)delegateQueue;
- (Protocol)protocol;
- (RPDelegateBase)init;
- (unint64_t)delegateCount;
- (void)addDelegate:(id)a3;
- (void)callDelegate:(id)a3;
- (void)callDelegate:(id)a3 forProtocol:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)removeAllDelegates;
- (void)removeDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation RPDelegateBase

- (RPDelegateBase)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RPDelegateBase;
  v2 = -[RPDelegateBase init](&v11, "init");
  if (v2)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "-[RPDelegateBase init]";
      __int16 v14 = 1024;
      int v15 = 25;
      __int16 v16 = 2048;
      v17 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
    }

    uint64_t v3 = objc_opt_class(v2);
    BOOL v4 = v3 != objc_opt_class(&OBJC_CLASS___RPDelegateBase) || dword_100084688 > 2;
    if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004563C();
    }
    v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
    delegateArray = v2->_delegateArray;
    v2->_delegateArray = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSLock);
    lock = v2->_lock;
    v2->_lock = v7;

    v2->_isValid = 1;
    delegateQueue = v2->_delegateQueue;
    v2->_protocol = 0LL;
    v2->_delegateQueue = 0LL;
  }

  return v2;
}

- (void)dealloc
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPDelegateBase dealloc]";
    __int16 v6 = 1024;
    int v7 = 39;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPDelegateBase;
  -[RPDelegateBase dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  if (self->_isValid)
  {
    -[NSMutableArray removeAllObjects](self->_delegateArray, "removeAllObjects");
    self->_isValid = 0;
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)valid
{
  BOOL isValid = self->_isValid;
  -[NSLock unlock](self->_lock, "unlock");
  return isValid;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_isValid && !-[RPDelegateBase containsDelegate:](self, "containsDelegate:", v4)) {
    -[NSMutableArray addObject:](self->_delegateArray, "addObject:", v4);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_isValid)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    v5 = self->_delegateArray;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          if (*(id *)(*((void *)&v10 + 1) + 8LL * (void)i) == v4)
          {
            -[NSMutableArray removeObject:](self->_delegateArray, "removeObject:", v4, (void)v10);
            -[NSLock unlock](self->_lock, "unlock");

            goto LABEL_13;
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }
  }

  -[NSLock unlock](self->_lock, "unlock", (void)v10);
LABEL_13:
}

- (void)removeAllDelegates
{
  if (self->_isValid) {
    -[NSMutableArray removeAllObjects](self->_delegateArray, "removeAllObjects");
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (unint64_t)delegateCount
{
  id v3 = -[NSMutableArray count](self->_delegateArray, "count");
  -[NSLock unlock](self->_lock, "unlock");
  return (unint64_t)v3;
}

- (BOOL)hasDelegate:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  -[NSLock lock](lock, "lock");
  LOBYTE(lock) = -[RPDelegateBase containsDelegate:](self, "containsDelegate:", v5);

  -[NSLock unlock](self->_lock, "unlock");
  return (char)lock;
}

- (void)callDelegate:(id)a3
{
}

- (void)callDelegate:(id)a3 forProtocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NSLock lock](self->_lock, "lock");
  if (self->_isValid)
  {
    id v8 = -[NSMutableArray copy](self->_delegateArray, "copy");
    -[NSLock unlock](self->_lock, "unlock");
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v22;
      *(void *)&__int128 v11 = 136446466LL;
      __int128 v18 = v11;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v9);
          }
          int v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          if (objc_msgSend(v15, "conformsToProtocol:", v7, v18))
          {
            delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
            if (delegateQueue)
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_10002CD54;
              block[3] = &unk_100071930;
              id v17 = v6;
              block[4] = v15;
              id v20 = v17;
              dispatch_async(delegateQueue, block);
            }

            else
            {
              (*((void (**)(id, void *))v6 + 2))(v6, v15);
            }
          }

          else if (dword_100084688 <= 2 {
                 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          }
          {
            *(_DWORD *)buf = v18;
            v26 = "-[RPDelegateBase callDelegate:forProtocol:]";
            __int16 v27 = 1024;
            int v28 = 145;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d calling delegate does not conform to protocol",  buf,  0x12u);
          }
        }

        id v12 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }

      while (v12);
    }
  }

  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (BOOL)containsDelegate:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_delegateArray;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8LL * (void)i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  self->_protocol = (Protocol *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end