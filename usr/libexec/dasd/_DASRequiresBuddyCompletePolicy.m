@interface _DASRequiresBuddyCompletePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)buddyCompleteWithActivity:(id)a3 withState:(id)a4;
- (BOOL)fwIsAvailable;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSMutableDictionary)buddyCompleteForUserIdentifier;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (_DASRequiresBuddyCompletePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)_updateCache;
- (void)setBuddyCompleteForUserIdentifier:(id)a3;
- (void)setFwIsAvailable:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASRequiresBuddyCompletePolicy

- (_DASRequiresBuddyCompletePolicy)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____DASRequiresBuddyCompletePolicy;
  v2 = -[_DASRequiresBuddyCompletePolicy init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Requires Buddy Complete Policy";

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    buddyCompleteForUserIdentifier = v3->_buddyCompleteForUserIdentifier;
    v3->_buddyCompleteForUserIdentifier = v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.dasd.buddyComplete", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    v3->_fwIsAvailable = 1;
  }

  return v3;
}

- (void)_updateCache
{
  if (self->_fwIsAvailable)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    uint64_t v22 = 0LL;
    v23 = &v22;
    uint64_t v24 = 0x2020000000LL;
    v3 = (uint64_t (*)(void))off_1001576F0;
    v25 = off_1001576F0;
    if (!off_1001576F0)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000309D0;
      v21[3] = &unk_100115300;
      v21[4] = &v22;
      sub_1000309D0((uint64_t)v21);
      v3 = (uint64_t (*)(void))v23[3];
    }

    _Block_object_dispose(&v22, 8);
    if (!v3)
    {
      sub_1000B2404();
      __break(1u);
    }

    int v4 = v3();
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keyEnumerator](self->_buddyCompleteForUserIdentifier, "keyEnumerator"));
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4 ^ 1u));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_buddyCompleteForUserIdentifier,  "setObject:forKeyedSubscript:",  v10,  v9);
        }

        id v6 = [v5 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }

      while (v6);
    }

    timer = self->_timer;
    if ((v4 & 1) != 0)
    {
      if (!timer)
      {
        objc_super v12 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
        v13 = self->_timer;
        self->_timer = v12;

        dispatch_set_qos_class_fallback(self->_timer, 17LL);
        dispatch_source_set_timer((dispatch_source_t)self->_timer, 0LL, 0x37E11D600uLL, 0x3B9ACA00uLL);
        v14 = self->_timer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_100030588;
        handler[3] = &unk_1001150D0;
        handler[4] = self;
        dispatch_source_set_event_handler((dispatch_source_t)v14, handler);
        dispatch_activate((dispatch_object_t)self->_timer);
      }
    }

    else if (timer)
    {
      dispatch_source_cancel((dispatch_source_t)timer);
      v15 = self->_timer;
      self->_timer = 0LL;
    }
  }

+ (id)policyInstance
{
  if (qword_1001576E0 != -1) {
    dispatch_once(&qword_1001576E0, &stru_100115970);
  }
  return (id)qword_1001576E8;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_fwIsAvailable)
  {
    if ([v4 requiresBuddyComplete])
    {
      BOOL v6 = 1;
    }

    else
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 fastPass]);
      BOOL v6 = v7 != 0LL;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (BOOL)buddyCompleteWithActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  BOOL v6 = v5;
  if (self->_fwIsAvailable)
  {
    uint64_t v14 = 0LL;
    v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100030740;
    block[3] = &unk_1001152D8;
    id v11 = v5;
    objc_super v12 = self;
    v13 = &v14;
    dispatch_sync(queue, block);
    BOOL v8 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }

  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  BOOL v7 = -[_DASRequiresBuddyCompletePolicy buddyCompleteWithActivity:withState:]( self,  "buddyCompleteWithActivity:withState:",  v6,  a4);
  BOOL v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"buddyComplete = %@",  v9));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v10);

  if (v7)
  {
    uint64_t v11 = 0LL;
  }

  else if (-[_DASRequiresBuddyCompletePolicy appliesToActivity:](self, "appliesToActivity:", v6))
  {
    uint64_t v11 = 33LL;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v11,  v8,  (double)0x384uLL));

  return v12;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)buddyCompleteForUserIdentifier
{
  return self->_buddyCompleteForUserIdentifier;
}

- (void)setBuddyCompleteForUserIdentifier:(id)a3
{
}

- (BOOL)fwIsAvailable
{
  return self->_fwIsAvailable;
}

- (void)setFwIsAvailable:(BOOL)a3
{
  self->_fwIsAvailable = a3;
}

- (void).cxx_destruct
{
}

@end