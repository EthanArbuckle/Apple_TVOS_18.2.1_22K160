@interface HIDAnalyticsReporter
- (HIDAnalyticsReporter)init;
- (id)createBucketData:(id)a3 fieldvalue:(id)a4 fieldDescription:(id)a5;
- (void)dealloc;
- (void)dispatchAnalyticsForEvent:(id)a3;
- (void)logAnalyticsEvent:(id)a3;
- (void)logAnalyticsEvent:(id)a3 eventDescription:(id)a4 eventValue:(id)a5;
- (void)registerEvent:(id)a3;
- (void)start;
- (void)stop;
- (void)unregisterEvent:(id)a3;
@end

@implementation HIDAnalyticsReporter

- (HIDAnalyticsReporter)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___HIDAnalyticsReporter;
  id v2 = -[HIDAnalyticsReporter init](&v16, sel_init);
  if (v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    *((_DWORD *)v2 + 8) = 0;
    id v3 = objc_alloc_init(MEMORY[0x189603FE0]);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.hidanalytics", v5);
    v7 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v6;

    v8 = (dispatch_queue_s *)*((void *)v2 + 2);
    if (v8)
    {
      dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v8);
      v10 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = v9;

      v11 = (dispatch_source_s *)*((void *)v2 + 3);
      if (v11)
      {
        v13[0] = MEMORY[0x1895F87A8];
        v13[1] = 3221225472LL;
        v13[2] = __28__HIDAnalyticsReporter_init__block_invoke;
        v13[3] = &unk_18A28F5E0;
        objc_copyWeak(&v14, &location);
        dispatch_source_set_event_handler(v11, v13);
        dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
        dispatch_activate(*((dispatch_object_t *)v2 + 3));
        v11 = (dispatch_source_s *)v2;
        objc_destroyWeak(&v14);
      }
    }

    else
    {
      v11 = 0LL;
    }

    objc_destroyWeak(&location);
  }

  else
  {
    v11 = 0LL;
  }

  return (HIDAnalyticsReporter *)v11;
}

void __28__HIDAnalyticsReporter_init__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 8);
    id v3 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithSet:*(void *)&v2[2]._os_unfair_lock_opaque];
    os_unfair_lock_unlock(v2 + 8);
    if (v3)
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      v19 = v3;
      id obj = v3;
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v21 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0LL; i != v5; ++i)
          {
            if (*(void *)v23 != v21) {
              objc_enumerationMutation(obj);
            }
            v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              [v7 name];
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v27 = v8;
              _os_log_impl( &dword_188802000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "HIDAnalytics Timer Send event %@",  buf,  0xCu);
            }

            [v7 value];
            dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue();
            DeepCopy = (void *)CFPropertyListCreateDeepCopy(0LL, v9, 2uLL);

            [v7 name];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v12 = (void *)NSString;
              [v7 name];
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              [v12 stringWithFormat:@"%@", v13];
              id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v14 = @"unknown";
            }

            [v7 desc];
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              objc_super v16 = (void *)NSString;
              [v7 desc];
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              [v16 stringWithFormat:@"%@", v17];
              v18 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v18 = 0LL;
            }

            if (!DeepCopy)
            {

              goto LABEL_24;
            }

            os_unfair_lock_lock(v2 + 8);
            if ([*(id *)&v2[2]._os_unfair_lock_opaque containsObject:v7])
            {
              [v7 setValue:&unk_18A290840];
              os_unfair_lock_unlock(v2 + 8);
              -[os_unfair_lock_s logAnalyticsEvent:eventDescription:eventValue:]( v2,  "logAnalyticsEvent:eventDescription:eventValue:",  v14,  v18,  DeepCopy);
            }

            else
            {
              os_unfair_lock_unlock(v2 + 8);
            }
          }

          uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HIDAnalyticsReporter;
  -[HIDAnalyticsReporter dealloc](&v3, sel_dealloc);
}

- (id)createBucketData:(id)a3 fieldvalue:(id)a4 fieldDescription:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = (objc_class *)MEMORY[0x189603FA8];
    id v11 = v8;
    id v12 = objc_alloc_init(v10);
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __69__HIDAnalyticsReporter_createBucketData_fieldvalue_fieldDescription___block_invoke;
    v17[3] = &unk_18A28F608;
    id v18 = v7;
    id v19 = v9;
    id v13 = v12;
    id v20 = v13;
    [v11 enumerateObjectsUsingBlock:v17];

    id v14 = v20;
    id v15 = v13;
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

void __69__HIDAnalyticsReporter_createBucketData_fieldvalue_fieldDescription___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [NSString stringWithFormat:@"%@BucketID", *(void *)(a1 + 32)];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
    dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFormat:@"%@BucketCount", *(void *)(a1 + 32)];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v12;
    [NSString stringWithFormat:@"%@Description", *(void *)(a1 + 32)];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = *(id *)(a1 + 40);
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v11 setObject:v6 forKeyedSubscript:v5];
    [v11 setObject:v8 forKeyedSubscript:v7];
    if (v10) {
      [v11 setObject:v10 forKeyedSubscript:v9];
    }
  }
}

- (void)logAnalyticsEvent:(id)a3 eventDescription:(id)a4 eventValue:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a5)
  {
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke;
    v11[3] = &unk_18A28F608;
    v11[4] = self;
    id v12 = v8;
    id v13 = v10;
    [a5 enumerateObjectsUsingBlock:v11];
  }
}

void __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke( uint64_t a1,  void *a2)
{
  v15[2] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;
    [v4 objectForKeyedSubscript:@"Name"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"Type"];
    dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"Value"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || !v5 || !v6) {
      goto LABEL_10;
    }
    if ([v6 unsignedIntegerValue] == 1)
    {
      uint64_t v8 = [*(id *)(a1 + 32) createBucketData:v5 fieldvalue:v7 fieldDescription:*(void *)(a1 + 40)];
      if (!v8)
      {
LABEL_10:

        goto LABEL_11;
      }

      id v9 = (id)v8;
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_2;
      v12[3] = &unk_18A28F658;
      id v13 = *(id *)(a1 + 48);
      [v9 enumerateObjectsUsingBlock:v12];
      id v10 = v13;
    }

    else
    {
      v14[0] = @"FieldName";
      v14[1] = @"FieldValue";
      v15[0] = v5;
      v15[1] = v7;
      [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = v11;
      AnalyticsSendEventLazy();
      id v10 = v11;
    }

    goto LABEL_10;
  }

void __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

id __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __70__HIDAnalyticsReporter_logAnalyticsEvent_eventDescription_eventValue___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logAnalyticsEvent:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  [v4 value];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0LL, v5, 2uLL);

  [v4 name];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64_t v8 = (void *)NSString;
    [v4 name];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringWithFormat:@"%@", v9];
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = @"unknown";
  }

  [v4 desc];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    id v12 = (void *)NSString;
    [v4 desc];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 stringWithFormat:@"%@", v13];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v14 = 0LL;
  }

  if (DeepCopy)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __42__HIDAnalyticsReporter_logAnalyticsEvent___block_invoke;
    block[3] = &unk_18A28F680;
    objc_copyWeak(&v20, &location);
    v17 = v10;
    id v18 = v14;
    id v19 = DeepCopy;
    dispatch_async((dispatch_queue_t)queue, block);

    objc_destroyWeak(&v20);
  }

  objc_destroyWeak(&location);
}

void __42__HIDAnalyticsReporter_logAnalyticsEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained logAnalyticsEvent:*(void *)(a1 + 32) eventDescription:*(void *)(a1 + 40) eventValue:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)registerEvent:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet addObject:](self->_events, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeObject:](self->_events, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  if (([v4 isLogged] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v4 name];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl( &dword_188802000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "HIDAnalytics Unregister Send event %@",  (uint8_t *)&v6,  0xCu);
    }

    -[HIDAnalyticsReporter logAnalyticsEvent:](self, "logAnalyticsEvent:", v4);
  }
}

- (void)start
{
  timer = self->_timer;
  dispatch_time_t v3 = dispatch_time(0x8000000000000000LL, 0LL);
  dispatch_source_set_timer((dispatch_source_t)timer, v3, 0x274A48A78000uLL, 0LL);
}

- (void)stop
{
}

- (void)dispatchAnalyticsForEvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  int v5 = -[NSMutableSet containsObject:](self->_events, "containsObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v4 name];
      int v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl( &dword_188802000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "HIDAnalytics Set Value Send event %@",  (uint8_t *)&v7,  0xCu);
    }

    -[HIDAnalyticsReporter logAnalyticsEvent:](self, "logAnalyticsEvent:", v4);
  }
}

- (void).cxx_destruct
{
}

@end