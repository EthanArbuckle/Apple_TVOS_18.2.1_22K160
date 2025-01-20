@interface IAMWebProcessJSO
+ (id)eventStringForEvent:(int64_t)a3;
+ (id)stateStringForState:(int64_t)a3;
- (BOOL)hasFiredReadyEvent;
- (IAMWebProcessJSO)init;
- (IAMWebProcessJSODelegate)delegate;
- (NSArray)contentPages;
- (NSMutableDictionary)listenersDictionary;
- (id)getContentPages;
- (id)getState;
- (id)getVersion;
- (int64_t)state;
- (void)_callListenersOfEvent:(int64_t)a3 withArguments:(id)a4;
- (void)addEventListener:(id)a3 listener:(id)a4;
- (void)close;
- (void)initializeInContext:(id)a3;
- (void)open:(id)a3 options:(id)a4;
- (void)performAction:(id)a3 options:(id)a4;
- (void)removeEventListener:(id)a3 listener:(id)a4;
- (void)reportEvent:(id)a3;
- (void)setContentPages:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasFiredReadyEvent:(BOOL)a3;
- (void)setListenersDictionary:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation IAMWebProcessJSO

- (IAMWebProcessJSO)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IAMWebProcessJSO;
  v2 = -[IAMWebProcessJSO init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_state = 0LL;
    v2->_hasFiredReadyEvent = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    listenersDictionary = v3->_listenersDictionary;
    v3->_listenersDictionary = (NSMutableDictionary *)v4;
  }

  return v3;
}

+ (id)eventStringForEvent:(int64_t)a3
{
  else {
    return *(&off_8180 + a3);
  }
}

+ (id)stateStringForState:(int64_t)a3
{
  v3 = &stru_8290;
  if (a3 == 1) {
    v3 = @"default";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"loading";
  }
}

- (void)initializeInContext:(id)a3
{
  id v3 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[JSValue valueWithNewObjectInContext:](&OBJC_CLASS___JSValue, "valueWithNewObjectInContext:", v3));
  objc_msgSend( v7,  "_IAM_setConstantValue:forProperty:",  @"IAMWebProcessShouldDismissPresentationBeforeOpen",  @"IAMOpenURLOptionsDismissBeforeOpenKey");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 globalObject]);
  objc_msgSend(v4, "_IAM_setConstantValue:forProperty:", v7, @"IAMOpenURLOptions");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[JSValue valueWithNewObjectInContext:](&OBJC_CLASS___JSValue, "valueWithNewObjectInContext:", v3));
  objc_msgSend( v5,  "_IAM_setConstantValue:forProperty:",  @"IAMWebProcessShouldDismissPresentationBeforePerformingAction",  @"IAMPerformActionOptionsDismissBeforeActionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 globalObject]);

  objc_msgSend(v6, "_IAM_setConstantValue:forProperty:", v5, @"IAMPerformActionOptions");
}

- (void)setContentPages:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_contentPages != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contentPages, a3);
    v5 = v6;
    if (self->_state != 1)
    {
      -[IAMWebProcessJSO setState:](self, "setState:", 1LL);
      v5 = v6;
    }
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO getState](self, "getState"));
    id v7 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
    -[IAMWebProcessJSO _callListenersOfEvent:withArguments:](self, "_callListenersOfEvent:withArguments:", 3LL, v6);

    if (a3 == 1 && !-[IAMWebProcessJSO hasFiredReadyEvent](self, "hasFiredReadyEvent"))
    {
      -[IAMWebProcessJSO _callListenersOfEvent:withArguments:](self, "_callListenersOfEvent:withArguments:", 1LL, 0LL);
      -[IAMWebProcessJSO setHasFiredReadyEvent:](self, "setHasFiredReadyEvent:", 1LL);
    }
  }

- (void)_callListenersOfEvent:(int64_t)a3 withArguments:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IAMWebProcessJSO eventStringForEvent:](&OBJC_CLASS___IAMWebProcessJSO, "eventStringForEvent:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO listenersDictionary](self, "listenersDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  if (v9 && [v9 count])
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v14);
          id v16 = objc_msgSend(v6, "copy", (void)v18);
          id v17 = [v15 callWithArguments:v16];

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v12);
    }
  }
}

- (void)addEventListener:(id)a3 listener:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO listenersDictionary](self, "listenersDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v10]);

  if (!v8)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO listenersDictionary](self, "listenersDictionary"));
    [v9 setObject:v8 forKey:v10];
  }
}

- (void)removeEventListener:(id)a3 listener:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO listenersDictionary](self, "listenersDictionary"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v14]);
  if (!v8) {
    goto LABEL_4;
  }
  v9 = (void *)v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO listenersDictionary](self, "listenersDictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v14]);
  unsigned int v12 = [v11 containsObject:v6];

  if (v12)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO listenersDictionary](self, "listenersDictionary"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v14]);
    [v13 removeObject:v6];

LABEL_4:
  }
}

- (id)getState
{
  return +[IAMWebProcessJSO stateStringForState:]( &OBJC_CLASS___IAMWebProcessJSO,  "stateStringForState:",  -[IAMWebProcessJSO state](self, "state"));
}

- (id)getVersion
{
  return @"1.2";
}

- (id)getContentPages
{
  return -[IAMWebProcessJSO contentPages](self, "contentPages");
}

- (void)reportEvent:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO delegate](self, "delegate"));
  char v5 = objc_opt_respondsToSelector(v4, "webProcessJSODidReportEvent:");

  if ((v5 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO delegate](self, "delegate"));
    [v6 webProcessJSODidReportEvent:v7];
  }
}

- (void)performAction:(id)a3 options:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "webProcessJSODidCallPerformAction:options:");

  if (v6)
  {
    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( [v6 objectForKey:@"IAMWebProcessShouldDismissPresentationBeforePerformingAction"]);

      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO delegate](self, "delegate"));
        [v10 webProcessJSODidCallPerformAction:v11 options:v6];
      }
    }
  }
}

- (void)open:(id)a3 options:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "webProcessJSODidCallOpen:options:");

  if (v6)
  {
    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"IAMWebProcessShouldDismissPresentationBeforeOpen"]);

      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO delegate](self, "delegate"));
        [v10 webProcessJSODidCallOpen:v11 options:v6];
      }
    }
  }
}

- (void)close
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO delegate](self, "delegate"));
  char v4 = objc_opt_respondsToSelector(v3, "webProcessJSODidCallClose");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[IAMWebProcessJSO delegate](self, "delegate"));
    [v5 webProcessJSODidCallClose];
  }

- (IAMWebProcessJSODelegate)delegate
{
  return (IAMWebProcessJSODelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)contentPages
{
  return self->_contentPages;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)hasFiredReadyEvent
{
  return self->_hasFiredReadyEvent;
}

- (void)setHasFiredReadyEvent:(BOOL)a3
{
  self->_hasFiredReadyEvent = a3;
}

- (NSMutableDictionary)listenersDictionary
{
  return self->_listenersDictionary;
}

- (void)setListenersDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end