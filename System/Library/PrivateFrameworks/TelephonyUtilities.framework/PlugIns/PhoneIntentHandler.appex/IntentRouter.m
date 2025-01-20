@interface IntentRouter
- (IntentRouter)init;
- (NSMutableArray)recentIntentHandlersAndIdentifiers;
- (id)existingHandlerForIntentIdentifier:(id)a3;
- (id)handlerForIntent:(id)a3;
- (void)registerForProvider;
- (void)setRecentIntentHandlersAndIdentifiers:(id)a3;
- (void)updateRecentlyUsedHandlersWithHandler:(id)a3;
@end

@implementation IntentRouter

- (IntentRouter)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IntentRouter;
  v2 = -[IntentRouter init](&v8, "init");
  if (v2)
  {
    id v3 = IntentHandlerDefaultLog();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002031C(v4);
    }

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    recentIntentHandlersAndIdentifiers = v2->_recentIntentHandlersAndIdentifiers;
    v2->_recentIntentHandlersAndIdentifiers = v5;
  }

  -[IntentRouter registerForProvider](v2, "registerForProvider");
  return v2;
}

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v6 = (IntentHandlerAndIdentifier *)objc_claimAutoreleasedReturnValue( -[IntentRouter existingHandlerForIntentIdentifier:]( self,  "existingHandlerForIntentIdentifier:",  v5));

  if (!v6)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___INStartCallIntent);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    {
      v10 = &OBJC_CLASS___StartCallIntentHandler;
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___INHangUpCallIntent);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
      {
        id v12 = IntentHandlerDefaultLog();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        os_signpost_id_t v14 = os_signpost_id_generate(v13);

        id v15 = IntentHandlerDefaultLog();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
        {
          LOWORD(v31) = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "HangUpIntentHandlerWaitForProvider",  " enableTelemetry=YES ",  (uint8_t *)&v31,  2u);
        }

        group = self->_group;
        dispatch_time_t v19 = dispatch_time(0LL, 1000000000LL);
        if (dispatch_group_wait((dispatch_group_t)group, v19))
        {
          id v20 = IntentHandlerDefaultLog();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v31 = 134217984;
            uint64_t v32 = 1LL;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "registerForCallbacksForProvider did not complete before the %ld second timeout.",  (uint8_t *)&v31,  0xCu);
          }
        }

        id v22 = IntentHandlerDefaultLog();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        v24 = v23;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
        {
          LOWORD(v31) = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_END,  v14,  "HangUpIntentHandlerWaitForProvider",  (const char *)&unk_1000275CF,  (uint8_t *)&v31,  2u);
        }

        v10 = &OBJC_CLASS___HangUpCallIntentHandler;
      }

      else
      {
        uint64_t v25 = objc_opt_class(&OBJC_CLASS___INSearchCallHistoryIntent);
        if ((objc_opt_isKindOfClass(v4, v25) & 1) == 0)
        {
          id v29 = IntentHandlerDefaultLog();
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_10002035C();
          }

          goto LABEL_26;
        }

        v10 = &OBJC_CLASS___SearchCallHistoryIntentHandler;
      }
    }

    id v26 = objc_alloc_init(v10);
    if (v26)
    {
      v27 = objc_alloc(&OBJC_CLASS___IntentHandlerAndIdentifier);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      v6 = -[IntentHandlerAndIdentifier initWithHandler:intentIdentifier:]( v27,  "initWithHandler:intentIdentifier:",  v26,  v28);

      if (!v6) {
        goto LABEL_3;
      }
      goto LABEL_2;
    }

- (id)existingHandlerForIntentIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    id v17 = IntentHandlerDefaultLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[WARN] Intent does not have an identifier set. Creating new handler.",  buf,  2u);
    }

    id v7 = 0LL;
    goto LABEL_20;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IntentRouter recentIntentHandlersAndIdentifiers](self, "recentIntentHandlersAndIdentifiers"));
  objc_sync_enter(v5);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IntentRouter recentIntentHandlersAndIdentifiers](self, "recentIntentHandlersAndIdentifiers", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 intentIdentifier]);
        unsigned int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          id v13 = IntentHandlerDefaultLog();
          os_signpost_id_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            sub_10002041C();
          }

          id v7 = v10;
          goto LABEL_14;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)updateRecentlyUsedHandlersWithHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 intentIdentifier]);
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IntentRouter recentIntentHandlersAndIdentifiers](self, "recentIntentHandlersAndIdentifiers"));
    objc_sync_enter(v7);
    *(void *)buf = 0LL;
    v24 = buf;
    uint64_t v25 = 0x2020000000LL;
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentRouter recentIntentHandlersAndIdentifiers](self, "recentIntentHandlersAndIdentifiers"));
    id v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    __int128 v19 = sub_10000B028;
    __int128 v20 = &unk_100034708;
    id v9 = v4;
    id v21 = v9;
    __int128 v22 = buf;
    [v8 enumerateObjectsUsingBlock:&v17];

    uint64_t v10 = *((void *)v24 + 3);
    if (v10)
    {
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[IntentRouter recentIntentHandlersAndIdentifiers]( self,  "recentIntentHandlersAndIdentifiers",  v17,  v18,  v19,  v20));
        [v11 removeObjectAtIndex:*((void *)v24 + 3)];
      }

      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[IntentRouter recentIntentHandlersAndIdentifiers]( self,  "recentIntentHandlersAndIdentifiers",  v17,  v18,  v19,  v20));
      [v12 insertObject:v9 atIndex:0];

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IntentRouter recentIntentHandlersAndIdentifiers](self, "recentIntentHandlersAndIdentifiers"));
      id v14 = [v13 count];

      if ((unint64_t)v14 >= 6)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IntentRouter recentIntentHandlersAndIdentifiers](self, "recentIntentHandlersAndIdentifiers"));
        [v15 removeLastObject];
      }
    }

    _Block_object_dispose(buf, 8);
    objc_sync_exit(v7);
  }

  else
  {
    id v16 = IntentHandlerDefaultLog();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Attempting to update recently used intent handler cache for an intent with no intentIdentifier. Ignoring.",  buf,  2u);
    }
  }
}

- (void)registerForProvider
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TUConversationProviderManager);
  conversationProviderManager = self->_conversationProviderManager;
  self->_conversationProviderManager = v3;

  v5 = (OS_dispatch_group *)dispatch_group_create();
  group = self->_group;
  self->_group = v5;

  dispatch_group_enter((dispatch_group_t)self->_group);
  id v7 = IntentHandlerDefaultLog();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = IntentHandlerDefaultLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  unsigned int v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "HangUpIntentHandlerRegisterForProvider",  " enableTelemetry=YES ",  buf,  2u);
  }

  id v13 = IntentHandlerDefaultLog();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Registering for drop-in calls", buf, 2u);
  }

  id v15 = self->_conversationProviderManager;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000B208;
  v16[3] = &unk_100034730;
  v16[4] = self;
  v16[5] = v9;
  -[TUConversationProviderManager registerForCallbacksForProvider:completionHandler:]( v15,  "registerForCallbacksForProvider:completionHandler:",  @"com.apple.private.alloy.dropin.communication",  v16);
}

- (NSMutableArray)recentIntentHandlersAndIdentifiers
{
  return self->_recentIntentHandlersAndIdentifiers;
}

- (void)setRecentIntentHandlersAndIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end