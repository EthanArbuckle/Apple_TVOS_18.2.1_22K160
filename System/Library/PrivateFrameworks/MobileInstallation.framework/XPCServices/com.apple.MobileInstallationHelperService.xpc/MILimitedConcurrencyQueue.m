@interface MILimitedConcurrencyQueue
- (MILimitedConcurrencyQueue)initWithName:(id)a3 width:(unint64_t)a4;
- (NSMutableArray)identifierQueue;
- (NSMutableDictionary)waitingOperations;
- (NSMutableSet)activeIdentifiers;
- (OS_dispatch_queue)internalQueue;
- (unint64_t)width;
- (void)_onQueue_deQueueIfNeeded;
- (void)_onQueue_runAsyncForIdentifier:(id)a3 description:(id)a4 operation:(id)a5;
- (void)runAsyncForIdentifier:(id)a3 description:(id)a4 operation:(id)a5;
@end

@implementation MILimitedConcurrencyQueue

- (MILimitedConcurrencyQueue)initWithName:(id)a3 width:(unint64_t)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MILimitedConcurrencyQueue;
  v7 = -[MILimitedConcurrencyQueue init](&v21, "init");
  v8 = v7;
  if (v7)
  {
    v7->_width = a4;
    v9 = (const char *)[v6 UTF8String];
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create(v9, v11);
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
    waitingOperations = v8->_waitingOperations;
    v8->_waitingOperations = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
    activeIdentifiers = v8->_activeIdentifiers;
    v8->_activeIdentifiers = (NSMutableSet *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
    identifierQueue = v8->_identifierQueue;
    v8->_identifierQueue = (NSMutableArray *)v18;
  }

  return v8;
}

- (void)runAsyncForIdentifier:(id)a3 description:(id)a4 operation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue internalQueue](self, "internalQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000B6EC;
  v15[3] = &unk_10001C9F8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_onQueue_deQueueIfNeeded
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue waitingOperations](self, "waitingOperations"));
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue activeIdentifiers](self, "activeIdentifiers"));
    id v7 = [v6 count];
    unint64_t v8 = -[MILimitedConcurrencyQueue width](self, "width");

    if ((unint64_t)v7 >= v8)
    {
      uint64_t v17 = gLogHandle;
      if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        id v36 = (id)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue activeIdentifiers](self, "activeIdentifiers"));
        [v36 count];
        -[MILimitedConcurrencyQueue width](self, "width");
        MOLogWrite(v17);
      }
    }

    else
    {
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue identifierQueue](self, "identifierQueue"));
      id v10 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v42;
LABEL_5:
        uint64_t v13 = 0LL;
        while (1)
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v41 + 1) + 8 * v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue activeIdentifiers](self, "activeIdentifiers", v34));
          unsigned int v16 = [v15 containsObject:v14];

          if (!v16) {
            break;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            id v34 = v14;
            MOLogWrite(gLogHandle);
          }

          if (v11 == (id)++v13)
          {
            id v11 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_14;
          }
        }

        id v18 = v14;

        if (!v18) {
          goto LABEL_30;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue waitingOperations](self, "waitingOperations"));
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v18]);

        if (v20)
        {
          if ([v20 count])
          {
            objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:0]);
            [v20 removeObjectAtIndex:0];
            if ([v20 count])
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue identifierQueue](self, "identifierQueue"));
              id v23 = [v22 count];

              if (v23 == (id)1) {
                goto LABEL_44;
              }
              if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
              {
                id v34 = v18;
                MOLogWrite(gLogHandle);
              }

              v24 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue identifierQueue](self, "identifierQueue", v34));
              [v24 removeObject:v18];

              v25 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue identifierQueue](self, "identifierQueue"));
              [v25 addObject:v18];
            }

            else
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
              {
                id v34 = v18;
                MOLogWrite(gLogHandle);
              }

              v27 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue waitingOperations](self, "waitingOperations", v34));
              [v27 removeObjectForKey:v18];

              v25 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue identifierQueue](self, "identifierQueue"));
              [v25 removeObject:v18];
            }

LABEL_44:
            uint64_t v28 = gLogHandle;
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              id v34 = v18;
              v35 = (void *)objc_claimAutoreleasedReturnValue([v21 descString]);
              MOLogWrite(v28);
            }

            v29 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue activeIdentifiers](self, "activeIdentifiers", v34, v35));
            [v29 addObject:v18];

            qos_class_t v30 = qos_class_self();
            dispatch_queue_global_t global_queue = dispatch_get_global_queue(v30, 0LL);
            v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10000BCA4;
            block[3] = &unk_10001CA20;
            id v38 = v21;
            v39 = self;
            id v40 = v18;
            id v33 = v21;
            dispatch_async(v32, block);

            goto LABEL_48;
          }

          uint64_t v26 = gLogHandle;
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_48:

            return;
          }
        }

        else
        {
          uint64_t v26 = gLogHandle;
        }

        MOLogWrite(v26);
        goto LABEL_48;
      }

- (void)_onQueue_runAsyncForIdentifier:(id)a3 description:(id)a4 operation:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v10);

  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    id v18 = v20;
    id v19 = v8;
    MOLogWrite(gLogHandle);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue waitingOperations](self, "waitingOperations", v18, v19));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v20]);

  if (!v12)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue waitingOperations](self, "waitingOperations"));
    [v13 setObject:v12 forKeyedSubscript:v20];
  }

  id v14 = -[MILimitedConcurrencyOperation initWithBlock:description:]( objc_alloc(&OBJC_CLASS___MILimitedConcurrencyOperation),  "initWithBlock:description:",  v9,  v8);

  [v12 addObject:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue identifierQueue](self, "identifierQueue"));
  unsigned __int8 v16 = [v15 containsObject:v20];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MILimitedConcurrencyQueue identifierQueue](self, "identifierQueue"));
    [v17 addObject:v20];
  }

  -[MILimitedConcurrencyQueue _onQueue_deQueueIfNeeded](self, "_onQueue_deQueueIfNeeded");
}

- (unint64_t)width
{
  return self->_width;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)waitingOperations
{
  return self->_waitingOperations;
}

- (NSMutableSet)activeIdentifiers
{
  return self->_activeIdentifiers;
}

- (NSMutableArray)identifierQueue
{
  return self->_identifierQueue;
}

- (void).cxx_destruct
{
}

@end