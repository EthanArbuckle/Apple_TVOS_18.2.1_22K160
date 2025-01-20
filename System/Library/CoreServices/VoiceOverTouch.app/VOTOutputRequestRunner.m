@interface VOTOutputRequestRunner
- (BOOL)isActive;
- (BOOL)onHold;
- (VOTOutputRequest)currentRequest;
- (VOTOutputRequestRunner)init;
- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 count:(unsigned int)a5 objects:(id)a6;
- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 waitTime:(double)a5 cancelMask:(unsigned int)a6 count:(unsigned int)a7 objects:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_handleNotifications:(id)a3;
- (void)_handleProcessActions:(id)a3;
- (void)_initializeThread;
- (void)_performAction:(id)a3 withComponent:(id)a4;
- (void)_processActions;
- (void)dealloc;
- (void)handleEvent:(id)a3;
- (void)resume;
- (void)runOutputRequest:(id)a3;
- (void)sendNotification:(unsigned int)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setOnHold:(BOOL)a3;
@end

@implementation VOTOutputRequestRunner

- (VOTOutputRequestRunner)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VOTOutputRequestRunner;
  v2 = -[VOTOutputRequestRunner init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SCRCThread);
    runnerThread = v2->_runnerThread;
    v2->_runnerThread = v3;

    -[SCRCThread performSelector:onTarget:count:objects:]( v2->_runnerThread,  "performSelector:onTarget:count:objects:",  "_initializeThread",  v2,  0LL,  0LL);
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTOutputRequestRunner;
  -[VOTOutputRequestRunner dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  v4[3] = self->_currentActionIndex;
  id v5 = -[NSArray copy](self->_currentActions, "copy");
  v6 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v5;

  *((_BYTE *)v4 + 24) = self->_didProcessNoSyncActions;
  *((_OWORD *)v4 + 2) = self->_currentRange;
  return v4;
}

- (void)_initializeThread
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  v4 = (objc_class *)objc_opt_class(self, v3);
  id v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v7 setName:v6];
}

- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 count:(unsigned int)a5 objects:(id)a6
{
  return result;
}

- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 waitTime:(double)a5 cancelMask:(unsigned int)a6 count:(unsigned int)a7 objects:(id)a8
{
  return result;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)runOutputRequest:(id)a3
{
  id v4 = a3;
  id v6 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:4];
  id v5 = [objc_allocWithZone(AXIndexMap) init];
  [v5 setObject:v6 forIndex:1];
  [v5 setObject:v4 forIndex:14];

  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( self->_runnerThread,  "performSelector:onTarget:cancelMask:count:objects:",  "handleEvent:",  self,  0xFFFFFFFFLL,  1LL,  v5);
}

- (void)sendNotification:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [objc_allocWithZone(AXIndexMap) init];
  id v5 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:v3];
  id v6 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:5];
  [v7 setObject:v5 forIndex:10];
  [v7 setObject:v6 forIndex:1];
  -[SCRCThread performSelector:onTarget:count:objects:]( self->_runnerThread,  "performSelector:onTarget:count:objects:",  "handleEvent:",  self,  1LL,  v7);
}

- (void)handleEvent:(id)a3
{
  id v8 = a3;
  unsigned __int8 v4 = -[VOTOutputRequestRunner onHold](self, "onHold");
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForIndex:1]);
    unsigned int v7 = [v6 unsignedIntValue];

    if (v7 == 5)
    {
      -[VOTOutputRequestRunner _handleNotifications:](self, "_handleNotifications:", v8);
      goto LABEL_6;
    }

    id v5 = v8;
    if (v7 == 4)
    {
      -[VOTOutputRequestRunner _handleProcessActions:](self, "_handleProcessActions:", v8);
LABEL_6:
      id v5 = v8;
    }
  }
}

- (void)resume
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_currentActions, "objectAtIndex:", self->_currentActionIndex));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v6 originalString]);
  NSUInteger location = self->_currentRange.location;
  if (location < (unint64_t)[v3 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 substringFromIndex:self->_currentRange.location]);
    [v6 setString:v5];
  }

  [v6 setHasBeenDispatched:0];
  -[VOTOutputRequestRunner _processActions](self, "_processActions");
}

- (void)_handleNotifications:(id)a3
{
  id v4 = a3;
  if (!self->_currentActions) {
    goto LABEL_17;
  }
  id v19 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForIndex:10]);
  unsigned int v6 = [v5 unsignedIntValue];

  if (v6 == 22)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForIndex:14]);
    self->_currentRange.NSUInteger location = (NSUInteger)[v7 rangeValue];
    self->_currentRange.length = v10;
LABEL_16:

    id v4 = v19;
    goto LABEL_17;
  }

  if (v6 == 21)
  {
    currentActions = self->_currentActions;
    self->_currentActions = 0LL;

    -[VOTOutputRequest setFinishedSuccessfully:](self->_currentRequest, "setFinishedSuccessfully:", 0LL);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    [v7 finishedOutputRequest:self->_currentRequest];
    goto LABEL_16;
  }

  id v4 = v19;
  if (v6 == 19)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForIndex:14]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 outputRequest]);
    if (-[NSArray indexOfObject:](self->_currentActions, "indexOfObject:", v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v8 setFinishedSuccessfully:0];
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      [v9 finishedOutputRequest:v8];
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForIndex:20]);
      unsigned __int8 v13 = [v12 BOOLValue];

      v14 = self->_currentActions;
      if ((v13 & 1) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v14, "objectAtIndex:", self->_currentActionIndex));

        if (v15 == v7)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v8 actionCompletionBlock]);

          if (v16)
          {
            v17 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v8 actionCompletionBlock]);
            ((void (**)(void, void *, void *))v17)[2](v17, v8, v7);
          }

          -[VOTOutputRequestRunner _processActions](self, "_processActions");
        }
      }

      else
      {
        self->_currentActions = 0LL;

        self->_isActive = 0;
        -[VOTOutputRequest setFinishedSuccessfully:](self->_currentRequest, "setFinishedSuccessfully:", 0LL);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        [v18 finishedOutputRequest:self->_currentRequest];
      }
    }

    goto LABEL_16;
  }

- (void)_handleProcessActions:(id)a3
{
  id v4 = (VOTOutputRequest *)objc_claimAutoreleasedReturnValue([a3 objectForIndex:14]);
  id v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest outputActions](v4, "outputActions"));
  self->_didProcessNoSyncActions = 0;
  self->_currentActionIndex = 0;
  currentActions = self->_currentActions;
  self->_currentActions = v5;
  unsigned int v7 = v5;

  currentRequest = self->_currentRequest;
  self->_currentRequest = v4;

  -[VOTOutputRequestRunner _processActions](self, "_processActions");
}

- (void)_performAction:(id)a3 withComponent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "outputEvents", 0));
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        [v14 sendEvent:v13];

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  [v6 setHasBeenDispatched:1];
  [v7 performAction:v6 owner:self];
}

- (void)_processActions
{
  NSUInteger v3 = -[NSArray count](self->_currentActions, "count");
  unint64_t v4 = v3;
  if (!self->_didProcessNoSyncActions)
  {
    NSUInteger v27 = v3;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v5 = self->_currentActions;
    id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          if (([v10 hasBeenDispatched] & 1) == 0
            && ([v10 synchronization] & 1) != 0)
          {
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentForType:", objc_msgSend(v10, "component")));

            if (v12)
            {
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
              unsigned __int8 v14 = [v12 isEqual:v13];

              if ((v14 & 1) == 0) {
                -[VOTOutputRequestRunner _performAction:withComponent:](self, "_performAction:withComponent:", v10, v12);
              }
            }
          }
        }

        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      }

      while (v7);
    }

    self->_didProcessNoSyncActions = 1;
    unint64_t v4 = v27;
  }

  if (v4 > self->_currentActionIndex)
  {
    char v15 = 0;
    while (1)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_currentActions, "objectAtIndex:"));
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForVariant:61]);
      unsigned __int8 v18 = [v17 BOOLValue];

      if (([v16 hasBeenDispatched] & 1) == 0)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentForType:", objc_msgSend(v16, "component")));

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          unsigned __int8 v22 = [v20 isEqual:v21];

          if ((v22 & 1) == 0)
          {
            -[VOTOutputRequestRunner _performAction:withComponent:](self, "_performAction:withComponent:", v16, v20);
            if (([v16 synchronization] & 2) != 0)
            {

              return;
            }
          }
        }
      }

      v15 |= v18;
      ++self->_currentActionIndex;

      if (v4 <= self->_currentActionIndex) {
        goto LABEL_26;
      }
    }
  }

  char v15 = 0;
LABEL_26:
  currentActions = self->_currentActions;
  self->_currentActions = 0LL;

  self->_isActive = 0;
  self->_didProcessNoSyncActions = 0;
  -[VOTOutputRequest setFinishedSuccessfully:](self->_currentRequest, "setFinishedSuccessfully:", 1LL);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  [v24 finishedOutputRequest:self->_currentRequest];

  currentRequest = self->_currentRequest;
  self->_currentRequest = 0LL;

  if ((v15 & 1) != 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kAXDidFinishSpeakingAssistantNotification, 0LL, 0LL, 1u);
  }

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VOTOutputRequestRunner;
  id v3 = -[VOTOutputRequestRunner description](&v7, "description");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - %@",  v4,  self->_currentRequest));

  return v5;
}

- (BOOL)onHold
{
  return self->_onHold;
}

- (void)setOnHold:(BOOL)a3
{
  self->_onHold = a3;
}

- (VOTOutputRequest)currentRequest
{
  return self->_currentRequest;
}

- (void).cxx_destruct
{
}

@end