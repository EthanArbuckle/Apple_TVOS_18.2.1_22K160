@interface PBKeyCommandRegistry
- (NSArray)keyCommands;
- (id)_init;
- (id)stateDumpBuilder;
- (void)dealloc;
- (void)registerKeyCommand:(id)a3 action:(id)a4;
- (void)responderHandleKeyCommand:(id)a3;
@end

@implementation PBKeyCommandRegistry

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBKeyCommandRegistry;
  v2 = -[PBKeyCommandRegistry init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    keyCommands = v2->_keyCommands;
    v2->_keyCommands = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  517LL,  0x10000LL));
    actions = v2->_actions;
    v2->_actions = (NSMapTable *)v5;

    id v7 = sub_1000F7E4C(&_dispatch_main_q, v2);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (BSInvalidatable *)v8;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBKeyCommandRegistry;
  -[PBKeyCommandRegistry dealloc](&v3, "dealloc");
}

- (void)registerKeyCommand:(id)a3 action:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (!v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"keyCommandInfo != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028F8B8(a2);
    }
LABEL_9:
    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
    JUMPOUT(0x1001CDF04LL);
  }

  if (!v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"action != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028F974(a2);
    }
    goto LABEL_9;
  }

  id v9 = v7;
  id v10 = [v9 keyCode];
  id v11 = [v9 modifiers];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithKeyCode:modifierFlags:action:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithKeyCode:modifierFlags:action:",  v10,  v11,  "responderHandleKeyCommand:"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 _nonRepeatableKeyCommand]);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeferringEnvironment systemEnvironment]( &OBJC_CLASS___BKSHIDEventDeferringEnvironment,  "systemEnvironment"));
  [v13 _setEventDeferringEnvironment:v14];

  -[NSMutableArray addObject:](self->_keyCommands, "addObject:", v13);
  actions = self->_actions;
  id v16 = objc_retainBlock(v8);
  -[NSMapTable setObject:forKey:](actions, "setObject:forKey:", v16, v13);
}

- (void)responderHandleKeyCommand:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  uint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "events/keyCommand/invoke",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v10);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_actions, "objectForKey:", v4));
  id v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }

  else
  {
    id v8 = sub_1000F6E5C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028FA30((uint64_t)v4, v9);
    }
  }

  os_activity_scope_leave(&v10);
}

- (NSArray)keyCommands
{
  return (NSArray *)-[NSMutableArray copy](self->_keyCommands, "copy");
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = [v3 appendObject:self->_keyCommands withKey:@"keyCommands"];
  return v3;
}

- (void).cxx_destruct
{
}

@end