@interface _DASTaskDependencyGraph
- (NSMutableDictionary)graph;
- (NSMutableDictionary)taskNodeMap;
- (OS_dispatch_queue)queue;
- (id)constructTaskDependencyGraphForTask:(id)a3 dependencyDataMap:(id)a4;
- (id)initTaskGraph;
- (id)nodeForTaskIdentifier:(id)a3;
- (void)addDependencyEdgeFrom:(id)a3 to:(id)a4;
- (void)addTaskNodeToGraph:(id)a3;
- (void)setGraph:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTaskNodeMap:(id)a3;
@end

@implementation _DASTaskDependencyGraph

- (id)initTaskGraph
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____DASTaskDependencyGraph;
  v2 = -[_DASTaskDependencyGraph init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    graph = v2->_graph;
    v2->_graph = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    taskNodeMap = v2->_taskNodeMap;
    v2->_taskNodeMap = (NSMutableDictionary *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.dasd.taskDependencyGraph", v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;
  }

  return v2;
}

- (void)addTaskNodeToGraph:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005BC90;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)addDependencyEdgeFrom:(id)a3 to:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005BE10;
    block[3] = &unk_100115120;
    block[4] = self;
    id v10 = v8;
    id v11 = v6;
    dispatch_sync(queue, block);
  }
}

- (id)nodeForTaskIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_10005C020;
  v16 = sub_10005C030;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005C038;
  block[3] = &unk_1001154E8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)constructTaskDependencyGraphForTask:(id)a3 dependencyDataMap:(id)a4
{
  id v44 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v7 = v5;
  v48 = v7;
  id v52 = [v7 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v52)
  {
    uint64_t v50 = *(void *)v67;
    do
    {
      for (i = 0LL; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v67 != v50) {
          objc_enumerationMutation(v7);
        }
        uint64_t v9 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 producedResultIdentifiers]);

        __int128 v64 = 0u;
        __int128 v65 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v62 objects:v72 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v63;
          do
          {
            for (j = 0LL; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v63 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)j);
              v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v17]);

              if (!v18)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
                [v6 setObject:v19 forKeyedSubscript:v17];
              }

              v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v17]);
              [v20 addObject:v9];
            }

            id v14 = [v12 countByEnumeratingWithState:&v62 objects:v72 count:16];
          }

          while (v14);
        }

        id v7 = v48;
      }

      id v52 = [v48 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }

    while (v52);
  }

  v49 = v6;

  id v21 = -[_DASTaskDependencyGraph initTaskGraph](self, "initTaskGraph");
  v22 = -[_DASTaskDependencyGraphNode initWithIdentifier:]( objc_alloc(&OBJC_CLASS____DASTaskDependencyGraphNode),  "initWithIdentifier:",  v44);
  [v21 addTaskNodeToGraph:v22];
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v22));
  v43 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v22));
  v25 = v24;
LABEL_18:
  if ([v24 count])
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 taskIdentifier]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v27]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 dependencyIdentifiers]);

    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v30 = v29;
    id v51 = [v30 countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (!v51) {
      goto LABEL_45;
    }
    uint64_t v31 = *(void *)v59;
    uint64_t v45 = *(void *)v59;
    id v47 = v30;
    while (1)
    {
      for (k = 0LL; k != v51; k = (char *)k + 1)
      {
        if (*(void *)v59 != v31) {
          objc_enumerationMutation(v30);
        }
        uint64_t v33 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)k);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v33]);

        if (v34)
        {
          v53 = k;
          v35 = (_DASTaskDependencyGraphNode *)objc_claimAutoreleasedReturnValue([v21 nodeForTaskIdentifier:v33]);
          if (!v35) {
            v35 = -[_DASTaskDependencyGraphNode initWithIdentifier:]( objc_alloc(&OBJC_CLASS____DASTaskDependencyGraphNode),  "initWithIdentifier:",  v33);
          }
          [v21 addDependencyEdgeFrom:v26 to:v35];
          if (([v23 containsObject:v35] & 1) == 0)
          {
            [v23 addObject:v35];
            [v25 addObject:v35];
          }
        }

        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKey:v33]);

          if (!v36) {
            continue;
          }
          v53 = k;
          v35 = (_DASTaskDependencyGraphNode *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:v33]);
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          id v37 = -[_DASTaskDependencyGraphNode countByEnumeratingWithState:objects:count:]( v35,  "countByEnumeratingWithState:objects:count:",  &v54,  v70,  16LL);
          if (v37)
          {
            id v38 = v37;
            uint64_t v39 = *(void *)v55;
            do
            {
              for (m = 0LL; m != v38; m = (char *)m + 1)
              {
                if (*(void *)v55 != v39) {
                  objc_enumerationMutation(v35);
                }
                v41 = (_DASTaskDependencyGraphNode *)objc_claimAutoreleasedReturnValue( [v21 nodeForTaskIdentifier:*(void *)(*((void *)&v54 + 1) + 8 * (void)m)]);
                if (!v41) {
                  v41 = -[_DASTaskDependencyGraphNode initWithIdentifier:]( objc_alloc(&OBJC_CLASS____DASTaskDependencyGraphNode),  "initWithIdentifier:",  v33);
                }
                [v21 addDependencyEdgeFrom:v26 to:v41];
                if (([v23 containsObject:v41] & 1) == 0)
                {
                  [v23 addObject:v41];
                  [v25 addObject:v41];
                }
              }

              id v38 = -[_DASTaskDependencyGraphNode countByEnumeratingWithState:objects:count:]( v35,  "countByEnumeratingWithState:objects:count:",  &v54,  v70,  16LL);
            }

            while (v38);
            id v30 = v47;
            id v7 = v48;
            uint64_t v31 = v45;
          }
        }

        k = v53;
      }

      id v51 = [v30 countByEnumeratingWithState:&v58 objects:v71 count:16];
      if (!v51)
      {
LABEL_45:

        [v25 removeObjectAtIndex:0];
        v24 = v25;
        goto LABEL_18;
      }
    }
  }

  return v21;
}

- (NSMutableDictionary)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
}

- (NSMutableDictionary)taskNodeMap
{
  return self->_taskNodeMap;
}

- (void)setTaskNodeMap:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end