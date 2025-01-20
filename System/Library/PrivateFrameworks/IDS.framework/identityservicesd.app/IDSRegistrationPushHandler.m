@interface IDSRegistrationPushHandler
+ (id)commandToHandlerBlock;
- (BOOL)registered;
- (NSData)pushToken;
- (id)_pushTopics;
- (id)copyHandlersForEnumerating;
- (void)_acceptIncomingPushes;
- (void)_ignoreIncomingPushes;
- (void)_updateListenerIfNeeded;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)handler:(id)a3 pushTokenChanged:(id)a4;
- (void)removeListener:(id)a3;
- (void)setRegistered:(BOOL)a3;
@end

@implementation IDSRegistrationPushHandler

+ (id)commandToHandlerBlock
{
  if (qword_1009C0878 != -1) {
    dispatch_once(&qword_1009C0878, &stru_1008FF4B0);
  }
  return (id)qword_1009C0870;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSRegistrationPushHandler;
  -[IDSRegistrationPushHandler dealloc](&v4, "dealloc");
}

- (NSData)pushToken
{
  if (self->_registeredForPush)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
    v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pushToken]);
  }

  else
  {
    v3 = 0LL;
  }

  return (NSData *)v3;
}

- (void)_updateListenerIfNeeded
{
  if (self->_registeredForPush)
  {
    v3 = objc_autoreleasePoolPush();
    BOOL isListening = self->_isListening;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationPushHandler _pushTopics](self, "_pushTopics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
    if (isListening)
    {
      [v5 setTopics:v8 forListener:self];
    }

    else
    {
      id v9 = objc_msgSend((id)objc_opt_class(self, v7), "commandToHandlerBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
      uint64_t v14 = im_primary_queue(v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      [v5 addListener:self topics:v8 commands:v12 queue:v15];

      self->_BOOL isListening = 1;
    }

    objc_autoreleasePoolPop(v3);
  }

- (void)_acceptIncomingPushes
{
  if (!self->_registeredForPush)
  {
    self->_registeredForPush = 1;
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "IDSRegistrationPushHandler - Accepting incoming pushes",  v4,  2u);
    }

    -[IDSRegistrationPushHandler _updateListenerIfNeeded](self, "_updateListenerIfNeeded");
  }

- (void)_ignoreIncomingPushes
{
  if (self->_registeredForPush)
  {
    self->_registeredForPush = 0;
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "IDSRegistrationPushHandler - No longer accepting incoming pushes",  v6,  2u);
    }

    objc_super v4 = objc_autoreleasePoolPush();
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
    [v5 removeListener:self];

    self->_BOOL isListening = 0;
    objc_autoreleasePoolPop(v4);
  }

- (void)setRegistered:(BOOL)a3
{
  if (a3) {
    -[IDSRegistrationPushHandler _acceptIncomingPushes](self, "_acceptIncomingPushes");
  }
  else {
    -[IDSRegistrationPushHandler _ignoreIncomingPushes](self, "_ignoreIncomingPushes");
  }
}

- (BOOL)registered
{
  return self->_registeredForPush;
}

- (id)_pushTopics
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v5 = 0LL;
  IMGetIDSSettings(0LL, 0LL, &v5, 0LL, 0LL);
  id v3 = v5;
  if ([v3 count]) {
    -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", v3);
  }

  return v2;
}

- (id)copyHandlersForEnumerating
{
  return -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray nonRetainingArray](&OBJC_CLASS___NSMutableArray, "nonRetainingArray"));
      v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }

    -[NSMutableArray addObject:](handlers, "addObject:", v7);
  }
}

- (void)removeListener:(id)a3
{
  if (!-[NSMutableArray count](self->_handlers, "count"))
  {
    handlers = self->_handlers;
    self->_handlers = 0LL;
  }

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v16 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
  id v10 = sub_100283384(v9, v16, @"c");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v12)
  {
    id v13 = objc_msgSend((id)objc_opt_class(self, v11), "commandToHandlerBlock");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v14 objectForKey:v12]);

    if (v15) {
      ((void (**)(void, IDSRegistrationPushHandler *, id))v15)[2](v15, self, v16);
    }
  }
}

- (void)handler:(id)a3 pushTokenChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "handler:pushTokenChanged:") & 1) != 0) {
          [v13 handler:self pushTokenChanged:v7];
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }
}

- (void).cxx_destruct
{
}

@end