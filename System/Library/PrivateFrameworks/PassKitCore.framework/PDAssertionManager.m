@interface PDAssertionManager
- (BOOL)assertionCoordinator:(id)a3 assertionExistsOfType:(unint64_t)a4;
- (BOOL)assertionCoordinator:(id)a3 canAcquireAssertion:(id)a4;
- (BOOL)hasAssertionsOfType:(unint64_t)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PDAssertionManager)init;
- (id)assertionsOfType:(unint64_t)a3;
- (void)acquireAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 reason:(id)a5 handler:(id)a6;
- (void)assertionCoordinator:(id)a3 didAcquireAssertion:(id)a4;
- (void)assertionCoordinator:(id)a3 didInvalidateAssertion:(id)a4;
- (void)dealloc;
- (void)invalidateAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 handler:(id)a5;
- (void)logAssertionsOfTypes:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PDAssertionManager

- (PDAssertionManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDAssertionManager;
  v2 = -[PDAssertionManager init](&v18, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.passd.assertionmanager.reply", v5);
    replyQueue = v3->_replyQueue;
    v3->_replyQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    coordinators = v3->_coordinators;
    v3->_coordinators = v10;

    v12 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v13 = -[NSXPCListener initWithMachServiceName:](v12, "initWithMachServiceName:", PKAssertionMachServiceName);
    coordinatorListener = v3->_coordinatorListener;
    v3->_coordinatorListener = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___RBSProcessMonitor);
    processStateMonitor = v3->_processStateMonitor;
    v3->_processStateMonitor = v15;

    -[NSXPCListener setDelegate:](v3->_coordinatorListener, "setDelegate:", v3);
    -[NSXPCListener resume](v3->_coordinatorListener, "resume");
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDAssertionManager;
  -[PDAssertionManager dealloc](&v3, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(4LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v6 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Adding connection from pid: %d",  (uint8_t *)&buf,  8u);
  }

  v9 = -[PDAssertionCoordinator initWithConnection:]( objc_alloc(&OBJC_CLASS___PDAssertionCoordinator),  "initWithConnection:",  v6);
  uint64_t v10 = PDAssertionCoordinatorInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v6 setExportedInterface:v11];

  [v6 setExportedObject:v9];
  objc_initWeak(&buf, v6);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100326340;
  v22[3] = &unk_10063D688;
  objc_copyWeak(&v24, &buf);
  v22[4] = self;
  v12 = v9;
  v23 = v12;
  [v6 setInvalidationHandler:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10032647C;
  v20[3] = &unk_100653028;
  objc_copyWeak(&v21, &buf);
  [v6 setInterruptionHandler:v20];
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  -[PDAssertionCoordinator remoteProcessIdentifier](v12, "remoteProcessIdentifier")));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v13,  0LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identity]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 embeddedApplicationIdentifier]);
  if (v16
    || (v16 = (void *)objc_claimAutoreleasedReturnValue([v15 xpcServiceIdentifier])) != 0
    || (v17 = (void *)objc_claimAutoreleasedReturnValue([v14 bundle]),
        v16 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]),
        v17,
        v16))
  {
    -[PDAssertionCoordinator setBundleIdentifier:](v12, "setBundleIdentifier:", v16);
  }

  -[PDAssertionCoordinator setIsForegroundApplication:](v12, "setIsForegroundApplication:", sub_100326574(v14));
  sub_1003265EC((uint64_t)self, v12);
  [v6 resume];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&buf);

  return 1;
}

- (BOOL)assertionCoordinator:(id)a3 canAcquireAssertion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 1;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  os_unfair_lock_unlock(p_lock);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100326748;
  v11[3] = &unk_100656FD0;
  v11[4] = &v12;
  v11[5] = [v7 type];
  [v9 enumerateObjectsUsingBlock:v11];

  LOBYTE(v9) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v9;
}

- (void)assertionCoordinator:(id)a3 didAcquireAssertion:(id)a4
{
  id v5 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(4LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Assertion Acquired: %@", buf, 0xCu);
  }

  replyQueue = self->_replyQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1003268BC;
  v10[3] = &unk_1006392B0;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)replyQueue, v10);
}

- (void)assertionCoordinator:(id)a3 didInvalidateAssertion:(id)a4
{
  id v5 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(4LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Assertion Invalidated: %@", buf, 0xCu);
  }

  replyQueue = self->_replyQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100326AD0;
  v10[3] = &unk_1006392B0;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)replyQueue, v10);
}

- (BOOL)assertionCoordinator:(id)a3 assertionExistsOfType:(unint64_t)a4
{
  return -[PDAssertionManager hasAssertionsOfType:](self, "hasAssertionsOfType:", a4);
}

- (id)assertionsOfType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = -[NSMutableArray copy](self->_coordinators, "copy");
  os_unfair_lock_unlock(p_lock);
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_100326CE0;
  uint64_t v14 = sub_100326CF0;
  id v15 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100326CF8;
  v9[3] = &unk_100657020;
  v9[4] = &v10;
  v9[5] = a3;
  [v6 enumerateObjectsUsingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)hasAssertionsOfType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = -[NSMutableArray copy](self->_coordinators, "copy");
  os_unfair_lock_unlock(p_lock);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)i),  "hasAssertionsOfType:",  a3,  (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v4 && !-[NSHashTable containsObject:](self->_observers, "containsObject:", v4)) {
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)logAssertionsOfTypes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v26 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@"|"]);
  id v7 = -[NSMutableString initWithFormat:]( v5,  "initWithFormat:",  @"PDAssertionManager: All Assertion Coordinators & Assertions of types %@",  v6);

  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  obj = self->_coordinators;
  id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v46,  16LL);
  if (v27)
  {
    uint64_t v25 = *(void *)v39;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v8;
        id v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
        -[NSMutableString appendFormat:](v7, "appendFormat:", @"\n%@", v10, lock);

        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        id v29 = v26;
        id v11 = [v29 countByEnumeratingWithState:&v34 objects:v45 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v35;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v35 != v13) {
                objc_enumerationMutation(v29);
              }
              __int128 v15 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
              __int128 v30 = 0u;
              __int128 v31 = 0u;
              __int128 v32 = 0u;
              __int128 v33 = 0u;
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assertionsOfType:", objc_msgSend(v15, "unsignedIntegerValue")));
              id v17 = [v16 countByEnumeratingWithState:&v30 objects:v44 count:16];
              if (v17)
              {
                id v18 = v17;
                uint64_t v19 = *(void *)v31;
                do
                {
                  for (j = 0LL; j != v18; j = (char *)j + 1)
                  {
                    if (*(void *)v31 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    -[NSMutableString appendFormat:]( v7,  "appendFormat:",  @"\n   - %@",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)j));
                  }

                  id v18 = [v16 countByEnumeratingWithState:&v30 objects:v44 count:16];
                }

                while (v18);
              }
            }

            id v12 = [v29 countByEnumeratingWithState:&v34 objects:v45 count:16];
          }

          while (v12);
        }

        uint64_t v8 = v28 + 1;
      }

      while ((id)(v28 + 1) != v27);
      id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v46,  16LL);
    }

    while (v27);
  }

  os_unfair_lock_unlock(lock);
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    v43 = v7;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void).cxx_destruct
{
}

- (void)acquireAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 reason:(id)a5 handler:(id)a6
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  os_unfair_lock_lock(p_lock);
  __int128 v14 = self->_localCoordinator;
  if (!v14)
  {
    __int128 v14 = -[PDAssertionCoordinator initWithConnection:]( objc_alloc(&OBJC_CLASS___PDAssertionCoordinator),  "initWithConnection:",  0LL);
    objc_storeStrong((id *)&self->_localCoordinator, v14);
    sub_1003272F0((uint64_t)self, v14);
  }

  os_unfair_lock_unlock(p_lock);
  -[PDAssertionCoordinator acquireAssertionOfType:withIdentifier:reason:handler:]( v14,  "acquireAssertionOfType:withIdentifier:reason:handler:",  a3,  v13,  v12,  v11);
}

- (void)invalidateAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 handler:(id)a5
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v9 = a5;
  id v11 = a4;
  os_unfair_lock_lock(p_lock);
  uint64_t v10 = self->_localCoordinator;
  os_unfair_lock_unlock(p_lock);
  -[PDAssertionCoordinator invalidateAssertionOfType:withIdentifier:handler:]( v10,  "invalidateAssertionOfType:withIdentifier:handler:",  a3,  v11,  v9);
}

@end