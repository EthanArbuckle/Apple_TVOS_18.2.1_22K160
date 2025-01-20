@interface SKStateMachine
+ (SKStateMachine)machineWithStateTransitionTable:(id)a3 startState:(id)a4 startEvent:(id)a5;
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

+ (SKStateMachine)machineWithStateTransitionTable:(id)a3 startState:(id)a4 startEvent:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  [v10 setState:v8];

  [v10 setEvent:v7];
  [v10 setTable:v9];

  return (SKStateMachine *)v10;
}

- (BOOL)nextWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  v6 = -[SKStateMachine table](self, "table");
  -[SKStateMachine state](self, "state");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStateMachine event](self, "event");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 entryForState:v7 event:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    SKGetOSLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = -[SKStateMachine state](self, "state");
      v12 = -[SKStateMachine event](self, "event");
      [v9 nextState];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v28 = 136315906;
      v29 = "-[SKStateMachine nextWithError:]";
      __int16 v30 = 2112;
      v31 = v11;
      __int16 v32 = 2112;
      v33 = v12;
      __int16 v34 = 2112;
      v35 = v13;
      _os_log_impl(&dword_188F75000, v10, OS_LOG_TYPE_DEBUG, "%s: State transition (%@,%@)->%@", (uint8_t *)&v28, 0x2Au);
    }

    uint64_t v14 = [v9 action];
    if (v14)
    {
      v15 = (void *)v14;
      uint64_t v16 = [v9 selector];

      if (v16)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( v17,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"SKStateMachine.m",  140,  @"Should have either action or selector, not both");

LABEL_7:
        v18 = 0LL;
LABEL_14:
        -[SKStateMachine setEvent:](self, "setEvent:", v18);
        [v9 nextState];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKStateMachine setState:](self, "setState:", v26);

        BOOL v21 = 1;
        goto LABEL_15;
      }
    }

    [v9 action];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      [v9 action];
      v20 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id *))v20)[2](v20, a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (![v9 selector]) {
        goto LABEL_7;
      }
      v22 = -[SKStateMachine table](self, "table");
      [v22 selectorTarget];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void (*)(void *, uint64_t, id *))objc_msgSend( v23,  "methodForSelector:",  objc_msgSend(v9, "selector"));

      -[SKStateMachine table](self, "table");
      v20 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      [v20 selectorTarget];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v24(v25, [v9 selector], a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v18)
    {
      BOOL v21 = 0;
      goto LABEL_15;
    }

    goto LABEL_14;
  }

  BOOL v21 = +[SKError failWithSKErrorCode:error:](&OBJC_CLASS___SKError, "failWithSKErrorCode:error:", 102LL, a3);
LABEL_15:

  return v21;
}

- (BOOL)finished
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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