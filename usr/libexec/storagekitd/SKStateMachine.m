@interface SKStateMachine
+ (id)machineWithStateTransitionTable:(id)a3 startState:(id)a4 startEvent:(id)a5;
- (BOOL)finished;
- (BOOL)nextWithError:(id *)a3;
- (BOOL)runWithError:(id *)a3;
- (NSString)event;
- (NSString)state;
- (SKStateTransitionTable)table;
- (void)setEvent:(id)a3;
- (void)setState:(id)a3;
- (void)setTable:(id)a3;
@end

@implementation SKStateMachine

+ (id)machineWithStateTransitionTable:(id)a3 startState:(id)a4 startEvent:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)objc_opt_class(a1));
  [v11 setState:v9];

  [v11 setEvent:v8];
  [v11 setTable:v10];

  return v11;
}

- (BOOL)nextWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine table](self, "table"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine event](self, "event"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 entryForState:v6 event:v7]);

  if (v8)
  {
    id v9 = sub_10000E2BC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine state](self, "state"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine event](self, "event"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 nextState]);
      int v29 = 136315906;
      v30 = "-[SKStateMachine nextWithError:]";
      __int16 v31 = 2112;
      v32 = v11;
      __int16 v33 = 2112;
      v34 = v12;
      __int16 v35 = 2112;
      v36 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s: State transition (%@,%@)->%@",  (uint8_t *)&v29,  0x2Au);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v8 action]);
    if (v14)
    {
      v15 = (void *)v14;
      id v16 = [v8 selector];

      if (v16) {
        goto LABEL_6;
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 action]);

    if (v18)
    {
      v19 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v8 action]);
      uint64_t v20 = ((uint64_t (**)(void, id *))v19)[2](v19, a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
    }

    else
    {
      if (![v8 selector])
      {
LABEL_6:
        v17 = 0LL;
LABEL_13:
        -[SKStateMachine setEvent:](self, "setEvent:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v8 nextState]);
        -[SKStateMachine setState:](self, "setState:", v27);

        unsigned __int8 v21 = 1;
        goto LABEL_14;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine table](self, "table"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 selectorTarget]);
      v24 = (uint64_t (*)(void *, id, id *))objc_msgSend( v23,  "methodForSelector:",  objc_msgSend(v8, "selector"));

      v19 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(-[SKStateMachine table](self, "table"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v19 selectorTarget]);
      uint64_t v26 = v24(v25, [v8 selector], a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v26);
    }

    if (!v17)
    {
      unsigned __int8 v21 = 0;
      goto LABEL_14;
    }

    goto LABEL_13;
  }

  unsigned __int8 v21 = +[SKError failWithSKErrorCode:error:]( &OBJC_CLASS___SKError,  "failWithSKErrorCode:error:",  102LL,  a3);
LABEL_14:

  return v21;
}

- (BOOL)finished
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateMachine state](self, "state"));
  BOOL v3 = v2 == 0LL;

  return v3;
}

- (BOOL)runWithError:(id *)a3
{
  do
    BOOL v5 = -[SKStateMachine finished](self, "finished");
  while (!v5 && -[SKStateMachine nextWithError:](self, "nextWithError:", a3));
  return v5;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (SKStateTransitionTable)table
{
  return self->_table;
}

- (void)setTable:(id)a3
{
}

- (NSString)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end