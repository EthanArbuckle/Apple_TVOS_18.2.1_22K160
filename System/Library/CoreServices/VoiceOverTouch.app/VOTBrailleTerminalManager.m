@interface VOTBrailleTerminalManager
+ (id)sharedManager;
- (BOOL)handleDelete;
- (BOOL)handleEscape;
- (BOOL)handleForwardDelete;
- (BOOL)handleLeftArrow;
- (BOOL)handleReturn;
- (BOOL)handleRightArrow;
- (NSString)commandLine;
- (VOTBrailleTerminalManager)init;
- (VOTBrailleTerminalOutputProtocol)outputManager;
- (id)nameSearcherEntriesPassingSearchFrom:(id)a3;
- (int64_t)cursor;
- (unint64_t)_currentContext;
- (unint64_t)state;
- (void)_executeCommand;
- (void)_refresh;
- (void)commandInsertString:(id)a3;
- (void)handleFirstElement;
- (void)handleLastElement;
- (void)replaceCommandRange:(_NSRange)a3 withString:(id)a4 cursor:(int64_t)a5;
- (void)setCommandLine:(id)a3;
- (void)setCursor:(int64_t)a3;
- (void)setOutputManager:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)turnOff;
@end

@implementation VOTBrailleTerminalManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2C34;
  block[3] = &unk_100176EE0;
  block[4] = a1;
  if (qword_1001AD078 != -1) {
    dispatch_once(&qword_1001AD078, block);
  }
  return (id)qword_1001AD080;
}

- (VOTBrailleTerminalManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VOTBrailleTerminalManager;
  v2 = -[VOTBrailleTerminalManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_state = 0LL;
    -[VOTBrailleTerminalManager setCommandLine:](v2, "setCommandLine:", &stru_10017A920);
    -[VOTBrailleTerminalManager setCursor:](v3, "setCursor:", 0LL);
    -[VOTBrailleTerminalManager setOutputManager:](v3, "setOutputManager:", 0LL);
    v4 = v3;
  }

  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  unint64_t state = self->_state;
  if (state != a3)
  {
    if (a3 != 2)
    {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager outputManager](self, "outputManager"));
      [v6 deactivate];

      -[VOTBrailleTerminalManager setOutputManager:](self, "setOutputManager:", 0LL);
      unint64_t state = self->_state;
    }

    if (!state)
    {
      -[VOTBrailleTerminalManager setCommandLine:](self, "setCommandLine:", &stru_10017A920);
      -[VOTBrailleTerminalManager setCursor:](self, "setCursor:", 0LL);
    }

    self->_unint64_t state = a3;
    -[VOTBrailleTerminalManager _refresh](self, "_refresh");
  }

- (void)turnOff
{
}

- (unint64_t)_currentContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentElement]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 application]);
  if ([v4 isSpringBoard])
  {

LABEL_4:
    unint64_t v8 = 0LL;
    goto LABEL_8;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 immediateRemoteParent]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 application]);
  unsigned __int8 v7 = [v6 isSpringBoard];

  if ((v7 & 1) != 0) {
    goto LABEL_4;
  }
  else {
    unint64_t v8 = 2LL;
  }
LABEL_8:

  return v8;
}

- (BOOL)handleReturn
{
  unint64_t v3 = -[VOTBrailleTerminalManager state](self, "state");
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager outputManager](self, "outputManager"));
      -[VOTBrailleTerminalManager setState:](self, "setState:", [v4 selectCurrentOutput]);
    }

    else if (v3 == 1)
    {
      -[VOTBrailleTerminalManager _executeCommand](self, "_executeCommand");
    }

    return 1;
  }

  else
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
    unsigned int v8 = [v7 hasActiveBrailleDisplay];

    if (v8)
    {
      BOOL v5 = 1;
      -[VOTBrailleTerminalManager setState:](self, "setState:", 1LL);
    }

    else
    {
      return 0;
    }
  }

  return v5;
}

- (BOOL)handleLeftArrow
{
  unint64_t v3 = -[VOTBrailleTerminalManager state](self, "state");
  if (v3 == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager outputManager](self, "outputManager"));
    [v4 moveToPreviousOutput];

    return 1;
  }

  if (v3 == 1)
  {
    if (-[VOTBrailleTerminalManager cursor](self, "cursor") >= 1) {
      -[VOTBrailleTerminalManager replaceCommandRange:withString:cursor:]( self,  "replaceCommandRange:withString:cursor:",  0LL,  0LL,  &stru_10017A920,  (char *)-[VOTBrailleTerminalManager cursor](self, "cursor") - 1);
    }
    return 1;
  }

  return 0;
}

- (BOOL)handleRightArrow
{
  unint64_t v3 = -[VOTBrailleTerminalManager state](self, "state");
  if (v3 == 2)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager outputManager](self, "outputManager"));
    [v7 moveToNextOutput];

    return 1;
  }

  if (v3 == 1)
  {
    unint64_t v4 = -[VOTBrailleTerminalManager cursor](self, "cursor");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager commandLine](self, "commandLine"));
    id v6 = [v5 length];

    if (v4 < (unint64_t)v6) {
      -[VOTBrailleTerminalManager replaceCommandRange:withString:cursor:]( self,  "replaceCommandRange:withString:cursor:",  0LL,  0LL,  &stru_10017A920,  (char *)-[VOTBrailleTerminalManager cursor](self, "cursor") + 1);
    }
    return 1;
  }

  return 0;
}

- (BOOL)handleDelete
{
  unint64_t v3 = -[VOTBrailleTerminalManager state](self, "state");
  if (v3 == 2) {
    return -[VOTBrailleTerminalManager handleEscape](self, "handleEscape");
  }
  if (v3 != 1) {
    return 0;
  }
  BOOL v4 = 1;
  if (-[VOTBrailleTerminalManager cursor](self, "cursor") >= 1) {
    -[VOTBrailleTerminalManager replaceCommandRange:withString:cursor:]( self,  "replaceCommandRange:withString:cursor:",  (char *)-[VOTBrailleTerminalManager cursor](self, "cursor") - 1,  1LL,  &stru_10017A920,  (char *)-[VOTBrailleTerminalManager cursor](self, "cursor") - 1);
  }
  return v4;
}

- (BOOL)handleForwardDelete
{
  unint64_t v3 = -[VOTBrailleTerminalManager state](self, "state");
  if (v3 == 2) {
    return -[VOTBrailleTerminalManager handleEscape](self, "handleEscape");
  }
  if (v3 != 1) {
    return 0;
  }
  unint64_t v4 = -[VOTBrailleTerminalManager cursor](self, "cursor");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager commandLine](self, "commandLine"));
  id v6 = [v5 length];

  BOOL v7 = 1;
  -[VOTBrailleTerminalManager replaceCommandRange:withString:cursor:]( self,  "replaceCommandRange:withString:cursor:",  -[VOTBrailleTerminalManager cursor](self, "cursor"),  1LL,  &stru_10017A920,  -[VOTBrailleTerminalManager cursor](self, "cursor"));
  return v7;
}

- (BOOL)handleEscape
{
  unint64_t v3 = -[VOTBrailleTerminalManager state](self, "state");
  if (v3 == 1)
  {
    uint64_t v4 = 0LL;
    goto LABEL_5;
  }

  if (v3 == 2)
  {
    uint64_t v4 = 1LL;
LABEL_5:
    -[VOTBrailleTerminalManager setState:](self, "setState:", v4);
    return 1;
  }

  return 0;
}

- (void)_refresh
{
  unint64_t v3 = -[VOTBrailleTerminalManager state](self, "state");
  if (v3 == 1)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager commandLine](self, "commandLine"));
    objc_msgSend( v5,  "refreshBrailleForTerminalCommand:cursor:",  v4,  -[VOTBrailleTerminalManager cursor](self, "cursor"));
  }

  else
  {
    if (v3) {
      return;
    }
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
    [v5 refreshBrailleForTerminalOff];
  }
}

- (void)replaceCommandRange:(_NSRange)a3 withString:(id)a4 cursor:(int64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a4;
  if ((id)-[VOTBrailleTerminalManager state](self, "state") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager commandLine](self, "commandLine"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", location, length, v11));
    -[VOTBrailleTerminalManager setCommandLine:](self, "setCommandLine:", v10);

    -[VOTBrailleTerminalManager setCursor:](self, "setCursor:", a5);
    -[VOTBrailleTerminalManager _refresh](self, "_refresh");
  }
}

- (void)commandInsertString:(id)a3
{
  id v4 = a3;
  -[VOTBrailleTerminalManager replaceCommandRange:withString:cursor:]( self,  "replaceCommandRange:withString:cursor:",  -[VOTBrailleTerminalManager cursor](self, "cursor"),  0,  v4,  (char *)-[VOTBrailleTerminalManager cursor](self, "cursor") + (void)[v4 length]);
}

- (void)_executeCommand
{
  if ((id)-[VOTBrailleTerminalManager state](self, "state") == (id)1)
  {
    unint64_t v3 = -[VOTBrailleTerminalManager _currentContext](self, "_currentContext");
    if (v3 >= 2)
    {
      if (v3 == 2)
      {
        id v10 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
        id v6 = -[VOTNameSearcherElementSource initWithElement:]( objc_alloc(&OBJC_CLASS___VOTNameSearcherElementSource),  "initWithElement:",  v10);
        BOOL v7 = -[VOTBrailleTerminalNameSearchOutputManager initWithItemSource:filter:]( objc_alloc(&OBJC_CLASS___VOTBrailleTerminalNameSearchOutputManager),  "initWithItemSource:filter:",  v6,  self);
        -[VOTBrailleTerminalManager setOutputManager:](self, "setOutputManager:", v7);

        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager outputManager](self, "outputManager"));
        [v8 activate];

        -[VOTBrailleTerminalManager setState:](self, "setState:", 2LL);
      }
    }

    else
    {
      v9 = -[VOTNameSearcherAppSource initWithLaunchContext:]( objc_alloc(&OBJC_CLASS___VOTNameSearcherAppSource),  "initWithLaunchContext:",  v3 != 0);
      id v4 = -[VOTBrailleTerminalNameSearchOutputManager initWithItemSource:filter:]( objc_alloc(&OBJC_CLASS___VOTBrailleTerminalNameSearchOutputManager),  "initWithItemSource:filter:",  v9,  self);
      -[VOTBrailleTerminalManager setOutputManager:](self, "setOutputManager:", v4);

      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager outputManager](self, "outputManager"));
      [v5 activate];

      -[VOTBrailleTerminalManager setState:](self, "setState:", 2LL);
    }
  }

- (void)handleFirstElement
{
  if ((id)-[VOTBrailleTerminalManager state](self, "state") == (id)2)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager outputManager](self, "outputManager"));
    [v3 moveToFirstOutput];
  }

- (void)handleLastElement
{
  if ((id)-[VOTBrailleTerminalManager state](self, "state") == (id)2)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager outputManager](self, "outputManager"));
    [v3 moveToLastOutput];
  }

- (id)nameSearcherEntriesPassingSearchFrom:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager commandLine](self, "commandLine"));
  id v6 = [v5 length];

  if (v6)
  {
    v26 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v23 = v4;
    v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = v4;
    id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name", v23));
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager commandLine](self, "commandLine"));
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lowercaseString]);
          unsigned __int8 v16 = [v13 hasPrefix:v15];

          v17 = v26;
          if ((v16 & 1) == 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleTerminalManager commandLine](self, "commandLine"));
            unsigned int v20 = [v18 localizedCaseInsensitiveContainsString:v19];

            v17 = v24;
            if (!v20) {
              continue;
            }
          }

          -[NSMutableArray addObject:](v17, "addObject:", v11);
        }

        id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v8);
    }

    id v21 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray arrayByAddingObjectsFromArray:](v26, "arrayByAddingObjectsFromArray:", v24));
    id v4 = v23;
  }

  else
  {
    id v21 = v4;
  }

  return v21;
}

- (NSString)commandLine
{
  return self->_commandLine;
}

- (void)setCommandLine:(id)a3
{
}

- (int64_t)cursor
{
  return self->_cursor;
}

- (void)setCursor:(int64_t)a3
{
  self->_cursor = a3;
}

- (VOTBrailleTerminalOutputProtocol)outputManager
{
  return self->_outputManager;
}

- (void)setOutputManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end