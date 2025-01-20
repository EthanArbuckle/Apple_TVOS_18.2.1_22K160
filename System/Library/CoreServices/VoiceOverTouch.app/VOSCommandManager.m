@interface VOSCommandManager
- (id)eventForKeyChord:(id)a3;
- (id)eventForKeyChord:(id)a3 resolver:(id)a4;
- (id)eventForKeyChord:(id)a3 resolver:(id)a4 info:(id)a5;
- (id)eventForTouchGesture:(id)a3 resolver:(id)a4;
- (id)eventForTouchGesture:(id)a3 resolver:(id)a4 info:(id)a5;
@end

@implementation VOSCommandManager

- (id)eventForTouchGesture:(id)a3 resolver:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[VOSCommandManager commandForTouchGesture:withResolver:]( self,  "commandForTouchGesture:withResolver:",  v8,  v9));
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 votEventCommandName]);
  v14 = (void *)v12;
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  v12,  v10));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEventUserCommandContext contextWithCommand:gesture:keyChord:resolver:]( &OBJC_CLASS___VOTEventUserCommandContext,  "contextWithCommand:gesture:keyChord:resolver:",  v11,  v8,  0LL,  v9));
    [v15 setUserCommandContext:v16];
  }

  else
  {
    v15 = 0LL;
  }

  uint64_t v17 = VOTLogEvent(v12, v13);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412802;
    v21 = v15;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "resolved event '%@' for gesture '%@' with resolver '%@'",  (uint8_t *)&v20,  0x20u);
  }

  return v15;
}

- (id)eventForTouchGesture:(id)a3 resolver:(id)a4
{
  return -[VOSCommandManager eventForTouchGesture:resolver:info:]( self,  "eventForTouchGesture:resolver:info:",  a3,  a4,  0LL);
}

- (id)eventForKeyChord:(id)a3 resolver:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[VOSCommandManager commandForKeyChord:withResolver:]( self,  "commandForKeyChord:withResolver:",  v8,  v9));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 votEventCommandName]);
  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent keyEventWithCommand:keyInfo:otherInfo:]( &OBJC_CLASS___VOTEvent,  "keyEventWithCommand:keyInfo:otherInfo:",  v12,  v10,  0LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEventUserCommandContext contextWithCommand:gesture:keyChord:resolver:]( &OBJC_CLASS___VOTEventUserCommandContext,  "contextWithCommand:gesture:keyChord:resolver:",  v11,  0LL,  v8,  v9));
    [v13 setUserCommandContext:v14];
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (id)eventForKeyChord:(id)a3 resolver:(id)a4
{
  return -[VOSCommandManager eventForKeyChord:resolver:info:](self, "eventForKeyChord:resolver:info:", a3, a4, 0LL);
}

- (id)eventForKeyChord:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[VOSCommandResolver resolverForCurrentHost]( &OBJC_CLASS___VOSCommandResolver,  "resolverForCurrentHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[VOSCommandManager eventForKeyChord:resolver:info:]( self,  "eventForKeyChord:resolver:info:",  v4,  v5,  0LL));

  return v6;
}

@end