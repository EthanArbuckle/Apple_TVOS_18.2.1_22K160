@interface CLIProgram
+ (BOOL)handleFormatOption:(id)a3 longOption:(id)a4 argument:(id)a5;
+ (CLIProgram)sharedProgram;
+ (id)commandToOptionsDict;
+ (id)globalOptionSet;
+ (id)nextOptionParser;
+ (void)handleFormatOptionInDictionary:(id)a3;
+ (void)registerGlobalFormatOption;
- (BOOL)startRunLoop;
- (CLIProgram)init;
- (CLIProgramDelegate)delegate;
- (NSString)commandName;
- (NSString)programName;
- (int)main;
- (void)endRunLoopWithSuccess:(BOOL)a3;
- (void)registerAllCLICommands;
- (void)setDelegate:(id)a3;
- (void)setProgramName:(id)a3;
@end

@implementation CLIProgram

+ (id)globalOptionSet
{
  return [(id)qword_100025408 _copiedSet];
}

+ (id)commandToOptionsDict
{
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = (id)qword_100025400;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100025400, "objectForKey:", v8, (void)v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 _copiedSet]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v10, v11);
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v5);
  }

  return v2;
}

+ (CLIProgram)sharedProgram
{
  if ((id)objc_opt_class(&OBJC_CLASS___CLIProgram) != a1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v5 handleFailureInMethod:a2 object:a1 file:@"CLIProgram.m" lineNumber:52 description:@"Calling +sharedProgram will not return a CLIProgram subclass"];
  }

  if (qword_100025420 != -1) {
    dispatch_once(&qword_100025420, &stru_10001C870);
  }
  return (CLIProgram *)(id)qword_100025428;
}

- (CLIProgram)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLIProgram;
  v2 = -[CLIProgram init](&v6, "init");
  if (v2)
  {
    id v3 = objc_opt_new(&OBJC_CLASS___NSObject);
    runLoopStateLock = v2->_runLoopStateLock;
    v2->_runLoopStateLock = v3;

    v2->_runLoopState = 0LL;
  }

  return v2;
}

+ (void)registerGlobalFormatOption
{
}

+ (BOOL)handleFormatOption:(id)a3 longOption:(id)a4 argument:(id)a5
{
  id v7 = a5;
  unsigned int v8 = [a4 isEqualToString:@"format"];
  if (v8) {
    sub_100010A10((uint64_t)a1, v7);
  }

  return v8;
}

+ (void)handleFormatOptionInDictionary:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"format"]);
  if (v4)
  {
    id v5 = v4;
    sub_100010A10((uint64_t)a1, v4);
    id v4 = v5;
  }
}

+ (id)nextOptionParser
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 arguments]);

  uint64_t v4 = qword_100025440;
  id v5 = (char *)[v3 count];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndexesInRange:",  v4,  &v5[-qword_100025440]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectsAtIndexes:v6]);
  unsigned int v8 = v7;
  if (!qword_100025440)
  {
    v11 = 0LL;
    goto LABEL_8;
  }

  if (![v7 count]) {
    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CLICommand registeredCommandWithName:](&OBJC_CLASS___CLICommand, "registeredCommandWithName:", v10));

  if (!v11)
  {
    if (v9)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CLICommand registeredCommandNames](&OBJC_CLASS___CLICommand, "registeredCommandNames"));
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[CLISuggest correctionForWord:fromCorpus:]( &OBJC_CLASS___CLISuggest,  "correctionForWord:fromCorpus:",  v9,  v14));

      if (v15)
      {
        sub_100011B4C( @"ambiguous command %@ - did you mean %@?",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v9);
      }

      else
      {
        sub_100011B4C(@"unknown command \"%@\"", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v9);
        sub_10000EB34(0LL);
      }

      exit(64);
    }

- (void)registerAllCLICommands
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___CLICommand);
  for (i = objc_opt_new(&OBJC_CLASS___NSMutableArray); ; -[NSMutableArray removeAllObjects](i, "removeAllObjects"))
  {
    uint64_t v4 = objc_copyClassList(&outCount);
    if (outCount)
    {
      for (unint64_t j = 0LL; j < outCount; ++j)
      {
        objc_super v6 = v4[j];
        if (v6 != (objc_class *)v2)
        {
          Name = class_getName(v4[j]);
          if (strncmp(Name, "NSKVONotifying_", 0xFuLL))
          {
            Superclass = v6;
            while (1)
            {
              Superclass = class_getSuperclass(Superclass);
              if (!Superclass) {
                break;
              }
              if (Superclass == (objc_class *)v2)
              {
                break;
              }
            }
          }
        }
      }
    }

    free(v4);
    int ClassList = objc_getClassList(0LL, 0);
    if (ClassList < 0 || ClassList == outCount) {
      break;
    }
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v10 = i;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (k = 0LL; k != v12; k = (char *)k + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = (void *)objc_opt_new(*(void *)(*((void *)&v16 + 1) + 8LL * (void)k));
        objc_msgSend(v15, "register", (void)v16);
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
    }

    while (v12);
  }
}

- (NSString)programName
{
  programName = self->_programName;
  if (programName)
  {
    id v3 = programName;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    objc_super v6 = (NSString *)objc_claimAutoreleasedReturnValue([v5 processName]);
    id v7 = self->_programName;
    self->_programName = v6;

    id v3 = v6;
  }

  return v3;
}

- (int)main
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 environment]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PWD"]);

  chdir((const char *)[v5 fileSystemRepresentation]);
  objc_super v6 = objc_autoreleasePoolPush();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIProgram delegate](self, "delegate"));
  sub_100010D1C((uint64_t)self);
  if ((objc_opt_respondsToSelector(v7, "shouldAutomaticallyRegisterCommands") & 1) == 0
    || [v7 shouldAutomaticallyRegisterCommands])
  {
    -[CLIProgram registerAllCLICommands](self, "registerAllCLICommands");
  }

  if ((objc_opt_respondsToSelector(v7, "registerGlobalOptions") & 1) != 0) {
    [v7 registerGlobalOptions];
  }
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CLIProgram nextOptionParser](&OBJC_CLASS___CLIProgram, "nextOptionParser"));
  if ((objc_opt_respondsToSelector(v7, "parseGlobalOptions:") & 1) != 0
    && ![v7 parseGlobalOptions:v8])
  {
    int v15 = 1;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CLIProgram nextOptionParser](&OBJC_CLASS___CLIProgram, "nextOptionParser"));
    [v9 validateArguments];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 command]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 commandName]);
    uint64_t v13 = v12;
    if (!v12) {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
    }
    if (self) {
      objc_setProperty_nonatomic_copy(self, v11, v13, 40LL);
    }
    if (!v12) {

    }
    unsigned int v14 = [v10 runWithOptions:v9];
    int v15 = v14 ^ 1;
  }

  objc_autoreleasePoolPop(v6);
  exit(v15);
}

- (BOOL)startRunLoop
{
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRunLoopRef Main = CFRunLoopGetMain();
  if (!CFEqual(Current, Main))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:self file:@"CLIProgram.m" lineNumber:313 description:@"-startRunLoop must be called on the main thread"];
  }

  objc_super v6 = self->_runLoopStateLock;
  objc_sync_enter(v6);
  if (self->_runLoopState)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"CLIProgram.m" lineNumber:316 description:@"-startRunLoop called more than once"];
  }

  self->_int64_t runLoopState = 1LL;
  objc_sync_exit(v6);

  CFRunLoopRun();
  id v7 = self->_runLoopStateLock;
  objc_sync_enter(v7);
  int64_t runLoopState = self->_runLoopState;
  if ((runLoopState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2 object:self file:@"CLIProgram.m" lineNumber:324 description:@"run loop exited without endRunLoopWithSuccess: being called"];
  }

  self->_int64_t runLoopState = 0LL;
  objc_sync_exit(v7);

  return runLoopState == 2;
}

- (void)endRunLoopWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v6 = self->_runLoopStateLock;
  objc_sync_enter(v6);
  if (self->_runLoopState != 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2 object:self file:@"CLIProgram.m" lineNumber:333 description:@"-endRunLoopWithSuccess: called without -startRunLoop"];
  }

  int64_t v7 = 2LL;
  if (!v3) {
    int64_t v7 = 3LL;
  }
  self->_int64_t runLoopState = v7;
  objc_sync_exit(v6);

  CFRunLoopRef Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

- (CLIProgramDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void)setProgramName:(id)a3
{
}

- (NSString)commandName
{
  return self->_commandName;
}

- (void).cxx_destruct
{
}

@end