@interface CUStateMachine
- (CUState)initialState;
- (NSArray)states;
- (void)_firstTimeInit;
- (void)dealloc;
- (void)dispatchEvent:(id)a3;
- (void)invalidate;
- (void)setInitialState:(id)a3;
- (void)setStates:(id)a3;
- (void)start;
- (void)transitionToState:(id)a3;
@end

@implementation CUStateMachine

- (void)dealloc
{
  if (self->_currentState || self->_targetState) {
    FatalErrorF("State machine invalidate not called");
  }
  -[NSMutableArray removeAllObjects](self->_eventQueue, "removeAllObjects");
  eventQueue = self->_eventQueue;
  self->_eventQueue = 0LL;

  -[NSPointerArray setCount:](self->_lcaPath, "setCount:", 0LL);
  lcaPath = self->_lcaPath;
  self->_lcaPath = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUStateMachine;
  -[CUStateMachine dealloc](&v5, sel_dealloc);
}

- (void)start
{
  if (self->_started) {
    FatalErrorF("Attempt to start an already-started state machine");
  }
  -[CUStateMachine _firstTimeInit](self, "_firstTimeInit");
  initialState = self->_initialState;
  if (!initialState) {
    FatalErrorF("No initial state");
  }
  v4 = initialState;
  uint64_t v5 = -1LL;
  do
  {
    uint64_t v6 = v5++;
    -[NSPointerArray replacePointerAtIndex:withPointer:](self->_lcaPath, "replacePointerAtIndex:withPointer:", v5, v4);
    v7 = (id *)v4[5];

    v4 = v7;
  }

  while (v7);
  self->_dispatching = 1;
  if (v6 != -2)
  {
    do
    {
      -[NSPointerArray pointerAtIndex:](self->_lcaPath, "pointerAtIndex:", v5);
      v8 = (CUState *)objc_claimAutoreleasedReturnValue();
      eventHandler = (void (**)(id, void *))v8->_eventHandler;
      v10 = +[CUStateEvent enterState](&OBJC_CLASS___CUStateEvent, "enterState");
      eventHandler[2](eventHandler, v10);

      currentState = self->_currentState;
      self->_currentState = v8;

      --v5;
    }

    while (v5 != -1);
  }

  v12 = (void (**)(id, void *))self->_currentState->_eventHandler;
  v13 = +[CUStateEvent initialTransition](&OBJC_CLASS___CUStateEvent, "initialTransition");
  v12[2](v12, v13);

  for (i = self->_targetState; i; i = self->_targetState)
  {
    v15 = i;
    v16 = v15;
    if (v15 == self->_currentState)
    {

LABEL_20:
      FatalErrorF("Bad initial transition %@ -> %@");
    }

    uint64_t v17 = 0LL;
    do
    {
      v18 = v16;
      uint64_t v19 = v17++;
      -[NSPointerArray replacePointerAtIndex:withPointer:]( self->_lcaPath,  "replacePointerAtIndex:withPointer:",  v19,  v16);
      v16 = v16->_parent;
    }

    while (v16 != self->_currentState);

    if (!v17) {
      goto LABEL_20;
    }
    do
    {
      v20 = -[NSPointerArray pointerAtIndex:](self->_lcaPath, "pointerAtIndex:", v19);
      uint64_t v21 = v20[1];
      v22 = +[CUStateEvent enterState](&OBJC_CLASS___CUStateEvent, "enterState");
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

      --v19;
    }

    while (v19 != -1);
    objc_storeStrong((id *)&self->_currentState, self->_targetState);
    targetState = self->_targetState;
    self->_targetState = 0LL;

    v24 = (void (**)(id, void *))self->_currentState->_eventHandler;
    v25 = +[CUStateEvent initialTransition](&OBJC_CLASS___CUStateEvent, "initialTransition");
    v24[2](v24, v25);
  }

  self->_dispatching = 0;
  v26 = -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
  if (v26)
  {
    id v28 = v26;
    id v27 = v26;

    -[NSMutableArray removeObjectAtIndex:](self->_eventQueue, "removeObjectAtIndex:", 0LL);
    -[CUStateMachine dispatchEvent:](self, "dispatchEvent:", v27);
    v26 = v28;
  }
}

- (void)invalidate
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  currentState = self->_currentState;
  self->_currentState = 0LL;

  -[NSMutableArray removeAllObjects](self->_eventQueue, "removeAllObjects");
  eventQueue = self->_eventQueue;
  self->_eventQueue = 0LL;

  -[NSPointerArray setCount:](self->_lcaPath, "setCount:", 0LL);
  lcaPath = self->_lcaPath;
  self->_lcaPath = 0LL;

  targetState = self->_targetState;
  self->_targetState = 0LL;

  -[CUState invalidate](self->_initialState, "invalidate");
  initialState = self->_initialState;
  self->_initialState = 0LL;

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v8 = self->_states;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "invalidate", (void)v14);
      }

      while (v10 != v12);
      uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v10);
  }

  states = self->_states;
  self->_states = 0LL;
}

- (void)dispatchEvent:(id)a3
{
  id v4 = a3;
  id v32 = v4;
  if (self->_dispatching)
  {
    -[NSMutableArray addObject:](self->_eventQueue, "addObject:", v4);
  }

  else
  {
    id v5 = v4;
    p_currentState = &self->_currentState;
    v7 = self->_currentState;
    while (1)
    {
      uint64_t v8 = (uint64_t)v7;
      while (1)
      {
        self->_dispatching = 1;
        uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(v8 + 8) + 16LL))();
        self->_dispatching = 0;
        if (v9 != 1) {
          break;
        }
        if (self->_targetState) {
          FatalErrorF("State %@ unhandled, but transitioned to state %@");
        }
        id v10 = *(id *)(v8 + 40);

        uint64_t v8 = (uint64_t)v10;
        if (!v10) {
          FatalErrorF("Event %@ unhandled\n");
        }
      }

      if (v9 != 2) {
        FatalErrorF("State %@ bad result %ld");
      }
      self->_dispatching = 1;
      while (1)
      {
        targetState = self->_targetState;
        if (!targetState) {
          break;
        }
        [*(id *)(v8 + 24) pointerAtIndex:targetState->_index];
        uint64_t v12 = (CUState *)objc_claimAutoreleasedReturnValue();
        for (i = *p_currentState; *p_currentState != v12; i = *p_currentState)
        {
          eventHandler = (void (**)(id, void *))i->_eventHandler;
          +[CUStateEvent exitState](&OBJC_CLASS___CUStateEvent, "exitState");
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          eventHandler[2](eventHandler, v15);

          objc_storeStrong((id *)&self->_currentState, (*p_currentState)->_parent);
        }

        __int128 v16 = self->_targetState;
        if ((CUState *)v8 == v16)
        {
          uint64_t v24 = *(void *)(v8 + 8);
          v25 = +[CUStateEvent exitState](&OBJC_CLASS___CUStateEvent, "exitState");
          (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);

          uint64_t v26 = *(void *)(v8 + 8);
          +[CUStateEvent enterState](&OBJC_CLASS___CUStateEvent, "enterState");
          id v27 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);

          objc_storeStrong((id *)&self->_currentState, (id)v8);
        }

        else
        {
          p_isa = v16;

          uint64_t v8 = (uint64_t)v12;
          if (p_isa != (id *)v12)
          {
            uint64_t v18 = 0LL;
            do
            {
              uint64_t v19 = v18++;
              -[NSPointerArray replacePointerAtIndex:withPointer:]( self->_lcaPath,  "replacePointerAtIndex:withPointer:",  v19,  p_isa);
              v20 = (CUState *)p_isa[5];

              p_isa = (id *)&v20->super.isa;
            }

            while (v20 != v12);
            uint64_t v21 = v12;
            uint64_t v8 = (uint64_t)v12;
            if (v18)
            {
              do
              {
                uint64_t v8 = -[NSPointerArray pointerAtIndex:](self->_lcaPath, "pointerAtIndex:", v19);

                uint64_t v22 = *(void *)(v8 + 8);
                v23 = +[CUStateEvent enterState](&OBJC_CLASS___CUStateEvent, "enterState");
                (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

                objc_storeStrong((id *)&self->_currentState, (id)v8);
                --v19;
                uint64_t v21 = (void *)v8;
              }

              while (v19 != -1);
            }
          }
        }

        currentState = self->_currentState;
        if (currentState != self->_targetState) {
          FatalErrorF("Transitioned state %@ not target %@");
        }
        self->_targetState = 0LL;

        v29 = (void (**)(id, void *))self->_currentState->_eventHandler;
        v30 = +[CUStateEvent initialTransition](&OBJC_CLASS___CUStateEvent, "initialTransition");
        v29[2](v29, v30);
      }

      self->_dispatching = 0;
      v7 = self->_currentState;
      v31 = -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
      if (!v31) {
        break;
      }
      id v5 = v31;

      -[NSMutableArray removeObjectAtIndex:](self->_eventQueue, "removeObjectAtIndex:", 0LL);
    }
  }
}

- (void)transitionToState:(id)a3
{
  id v4 = (CUState *)a3;
  if (!self->_dispatching) {
    FatalErrorF("Transition to state %@ only allowed from a state handler");
  }
  if (self->_targetState) {
    FatalErrorF("Transition to state %@ while transitioning to state %@");
  }
  self->_targetState = v4;
}

- (void)_firstTimeInit
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSArray count](self->_states, "count");
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  v47 = self;
  id v4 = self->_states;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v62,  v68,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v63;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v63 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        if (*(void *)(v10 + 24)) {
          FatalErrorF("Duplicate state %@");
        }
        *(void *)(v10 + 16) = v7 + i;
        uint64_t v11 = [objc_alloc(MEMORY[0x1896079B8]) initWithOptions:2];
        uint64_t v12 = *(void **)(v10 + 24);
        *(void *)(v10 + 24) = v11;

        [*(id *)(v10 + 24) setCount:v3];
      }

      v7 += i;
      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v62,  v68,  16LL);
    }

    while (v6);
  }

  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  obj = v47->_states;
  uint64_t v48 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v58,  v67,  16LL);
  unint64_t v13 = 0LL;
  if (v48)
  {
    uint64_t v46 = *(void *)v59;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v59 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v14;
        uint64_t v15 = *(void *)(*((void *)&v58 + 1) + 8 * v14);
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v16 = v47->_states;
        uint64_t v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v54,  v66,  16LL);
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v55;
          uint64_t v50 = *(void *)v55;
          v51 = v16;
          do
          {
            uint64_t v20 = 0LL;
            uint64_t v52 = v18;
            do
            {
              if (*(void *)v55 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v54 + 1) + 8 * v20);
              if (v21 == v15)
              {
                [*(id *)(v15 + 24) replacePointerAtIndex:*(void *)(v15 + 16) withPointer:v15];
              }

              else
              {
                uint64_t v22 = [*(id *)(v21 + 24) pointerAtIndex:*(void *)(v15 + 16)];
                if (v22)
                {
                  v23 = (void *)v22;
                  [*(id *)(v15 + 24) replacePointerAtIndex:*(void *)(v21 + 16) withPointer:v22];
                }

                else
                {
                  id v24 = objc_alloc_init(MEMORY[0x189603FA8]);
                  v25 = (id *)(id)v15;
                  do
                  {
                    [v24 insertObject:v25 atIndex:0];
                    uint64_t v26 = (id *)v25[5];

                    v25 = v26;
                  }

                  while (v26);
                  id v27 = objc_alloc_init(MEMORY[0x189603FA8]);
                  id v28 = (id *)(id)v21;
                  v29 = v28;
                  if (v28)
                  {
                    do
                    {
                      [v27 insertObject:v29 atIndex:0];
                      v30 = (id *)v29[5];

                      v29 = v30;
                    }

                    while (v30);
                  }

                  unint64_t v31 = [v24 count];
                  if (v31 >= [v27 count]) {
                    id v32 = v27;
                  }
                  else {
                    id v32 = v24;
                  }
                  uint64_t v33 = [v32 count];
                  if (!v33) {
                    goto LABEL_50;
                  }
                  uint64_t v34 = v33;
                  unint64_t v53 = v13;
                  uint64_t v35 = 0LL;
                  v36 = 0LL;
                  while (1)
                  {
                    [v24 objectAtIndexedSubscript:v35];
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    [v27 objectAtIndexedSubscript:v35];
                    v37 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v23 != v37) {
                      break;
                    }

                    ++v35;
                    v36 = v23;
                    if (v34 == v35) {
                      goto LABEL_36;
                    }
                  }

                  v23 = v36;
LABEL_36:
                  unint64_t v13 = v53;
                  if (!v23) {
LABEL_50:
                  }
                    FatalErrorF("Find LCA failed...invalid state graph");
                  [*(id *)(v15 + 24) replacePointerAtIndex:v28[2] withPointer:v23];
                  unint64_t v38 = [v24 count];
                  if (v38 <= [v27 count]) {
                    v39 = v27;
                  }
                  else {
                    v39 = v24;
                  }
                  unint64_t v40 = [v39 count];
                  if (v40 > v53) {
                    unint64_t v13 = v40;
                  }

                  uint64_t v19 = v50;
                  __int128 v16 = v51;
                  uint64_t v18 = v52;
                }
              }

              ++v20;
            }

            while (v20 != v18);
            uint64_t v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v54,  v66,  16LL);
          }

          while (v18);
        }

        uint64_t v14 = v49 + 1;
      }

      while (v49 + 1 != v48);
      uint64_t v48 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v58,  v67,  16LL);
    }

    while (v48);
  }

  v41 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  eventQueue = v47->_eventQueue;
  v47->_eventQueue = v41;

  uint64_t v43 = [objc_alloc(MEMORY[0x1896079B8]) initWithOptions:2];
  lcaPath = v47->_lcaPath;
  v47->_lcaPath = (NSPointerArray *)v43;

  -[NSPointerArray setCount:](v47->_lcaPath, "setCount:", v13);
  v47->_started = 1;
}

- (CUState)initialState
{
  return self->_initialState;
}

- (void)setInitialState:(id)a3
{
}

- (NSArray)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end