@interface MTCompositeResultsController
+ (MTCompositeResultsController)controllerWithControllers:(id)a3;
- (BOOL)hasObjects;
- (MTCompositeResultsController)initWithControllers:(id)a3;
- (NSArray)controllers;
- (id)allObjects;
- (id)controllerAtIndex:(unint64_t)a3;
- (id)delegate;
- (id)indexPathForObject:(id)a3;
- (id)indexPathsForObject:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (unint64_t)indexOfController:(id)a3;
- (unint64_t)numberOfObjectsInSection:(unint64_t)a3;
- (void)_setControllers:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)reloadData;
- (void)setDelegate:(id)a3;
@end

@implementation MTCompositeResultsController

+ (MTCompositeResultsController)controllerWithControllers:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithControllers:", v4);

  return (MTCompositeResultsController *)v6;
}

- (MTCompositeResultsController)initWithControllers:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTCompositeResultsController;
  uint64_t v5 = -[MTCompositeResultsController init](&v8, "init");
  id v6 = v5;
  if (v5) {
    -[MTCompositeResultsController _setControllers:](v5, "_setControllers:", v4);
  }

  return v6;
}

- (void)_setControllers:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  controllers = self->_controllers;
  if (controllers != v5)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    v7 = controllers;
    id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * (void)v11) setDelegate:0];
          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
      }

      while (v9);
    }

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v12 = v5;
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v16), "setDelegate:", self, (void)v17);
          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
      }

      while (v14);
    }

    objc_storeStrong((id *)&self->_controllers, a3);
  }
}

- (void)reloadData
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) reloadData];
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (id)indexPathForObject:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_1000182E4;
  v16 = sub_1000182F4;
  id v17 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000182FC;
  v9[3] = &unk_100240760;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTCompositeResultsController controllerAtIndex:]( self,  "controllerAtIndex:",  [v4 section]));
    if (v6) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "row")));
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (unint64_t)numberOfObjectsInSection:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllerAtIndex:](self, "controllerAtIndex:", a3));
  id v4 = [v3 numberOfObjects];

  return (unint64_t)v4;
}

- (id)indexPathsForObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers"));
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_100018524;
  uint64_t v14 = &unk_100240788;
  id v7 = v4;
  id v15 = v7;
  id v8 = v5;
  id v16 = v8;
  [v6 enumerateObjectsUsingBlock:&v11];

  if (objc_msgSend(v8, "count", v11, v12, v13, v14)) {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v8));
  }
  else {
    __int128 v9 = 0LL;
  }

  return v9;
}

- (id)controllerAtIndex:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers"));
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    id v8 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a3]);
  }

  return v8;
}

- (unint64_t)indexOfController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers"));
  id v6 = [v5 indexOfObject:v4];

  return (unint64_t)v6;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController delegate](self, "delegate"));
  [v5 controllerWillChangeContent:v4];
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController delegate](self, "delegate"));
  [v5 controllerDidChangeContent:v4];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v21 = a5;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  unint64_t v15 = -[MTCompositeResultsController indexOfController:](self, "indexOfController:", v14);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    [v16 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/FRC/MTCompositeResultsController.m", 142, @"Observed change for object %@ in section %@ but can't find the section index", v13, v14 lineNumber format];
  }

  else
  {
    unint64_t v17 = v15;
    id v18 = v21;
    if (v21)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  [v21 row],  v17));

      id v18 = (id)v19;
    }

    id v21 = v18;
    if (v12)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  [v12 row],  v17));

      id v12 = (id)v20;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController delegate](self, "delegate"));
    [v16 controller:v14 didChangeObject:v13 atIndexPath:v21 forChangeType:a6 newIndexPath:v12];
  }
}

- (id)allObjects
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) allObjects]);
        if (v9) {
          -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v9);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v10 = -[NSMutableArray copy](v3, "copy");
  return v10;
}

- (BOOL)hasObjects
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeResultsController controllers](self, "controllers", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) hasObjects])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)controllers
{
  return self->_controllers;
}

- (void).cxx_destruct
{
}

@end