@interface CPLCTLCommand
+ (Class)commandClassWithName:(id)a3;
+ (NSString)commandName;
+ (NSString)help;
+ (NSString)parameters;
+ (NSString)shortDescription;
+ (NSString)toolName;
+ (NSString)toolPath;
+ (id)allCommandNames;
+ (id)commandWithArgc:(int)a3 argv:(char *)a4;
+ (id)commandWithName:(id)a3;
+ (int)executeMainToolWithName:(id)a3 version:(id)a4 argc:(int)a5 argv:(char *)a6;
+ (void)_printUsage;
+ (void)register;
+ (void)registerCommandClass:(Class)a3;
+ (void)setToolName:(id)a3;
+ (void)setToolPath:(id)a3;
- (BOOL)_shouldUseTimeoutForLibraryOpening;
- (BOOL)isATTY;
- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4;
- (BOOL)quiet;
- (BOOL)supportsEscapeSequences;
- (BOOL)usesColor;
- (CPLCTLCommand)init;
- (CPLCTLCommand)parentCommand;
- (CPLDaemonConnection)daemonConnection;
- (CPLOutput)logOutput;
- (CPLOutput)output;
- (CPLPhotosDaemonConnection)photosDaemonConnection;
- (CPLPrivateEngine)privateEngine;
- (CPLStoreCommand)storeCommand;
- (NSString)additionalVersionInfo;
- (NSString)commandVersion;
- (NSString)defaultLibraryIdentifier;
- (NSURL)defaultLibraryURL;
- (char)printHeader;
- (id)_tempFolderURL;
- (id)displayableNameForLibraryManager:(id)a3;
- (id)getEngineWrapperStatusesWithError:(id *)a3;
- (id)getLibraryIdentifiersWithDomain:(int64_t)a3 error:(id *)a4;
- (id)openedLibraryManagerWithError:(id *)a3;
- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 error:(id *)a4;
- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 targetUserIdentifier:(unsigned int)a4 error:(id *)a5;
- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 timeout:(BOOL)a4 error:(id *)a5;
- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 timeout:(BOOL)a4 withTargetUserIdentifier:(unsigned int)a5 error:(id *)a6;
- (id)openedLibraryManagerWithTargetUserIdentifier:(unsigned int)a3 error:(id *)a4;
- (id)openedLibraryManagerWithTimeout:(BOOL)a3 error:(id *)a4;
- (id)openedLibraryManagerWithTimeout:(BOOL)a3 withTargetUserIdentifier:(unsigned int)a4 error:(id *)a5;
- (id)photosLibraryURLFromBaseURL:(id)a3;
- (id)tempFolderURLWithError:(id *)a3;
- (id)urlWithinHomeWithPath:(id)a3 isDirectory:(BOOL)a4;
- (int)execute;
- (int)outputFd;
- (int)remainingSpace;
- (void)_setInterruptionHandler:(id)a3;
- (void)beginOutputTo:(id)a3;
- (void)clearScreen;
- (void)closeLibraryManager:(id)a3;
- (void)closeOutput;
- (void)cplInterrupt;
- (void)cursorDown:(unsigned int)a3;
- (void)cursorGotoLineStart;
- (void)cursorLeft:(unsigned int)a3;
- (void)cursorRestore;
- (void)cursorRight:(unsigned int)a3;
- (void)cursorSave;
- (void)cursorToStartOfLine;
- (void)cursorToTopLeft;
- (void)cursorUp:(unsigned int)a3;
- (void)disableOutput;
- (void)endLine;
- (void)endLineIfNecessary;
- (void)endOutputTo:(id)a3;
- (void)eraseEndOfLine;
- (void)eraseLine;
- (void)eraseScreenDown;
- (void)eraseScreenUp;
- (void)eraseStartOfLine;
- (void)flush;
- (void)forceResetColorsAndAttributes;
- (void)forgetRemainingSpace;
- (void)prepareToRunWithinCommand:(id)a3;
- (void)printError:(id)a3;
- (void)printError:(id)a3 arguments:(char *)a4;
- (void)printFormat:(id)a3;
- (void)printFormat:(id)a3 arguments:(char *)a4;
- (void)printHeaderIfNecessary:(char)a3;
- (void)printJSONData:(id)a3;
- (void)printJSONObject:(id)a3;
- (void)put:(id)a3;
- (void)putBright:(id)a3;
- (void)putBrightF:(id)a3;
- (void)putF:(id)a3;
- (void)putF:(id)a3 arguments:(char *)a4;
- (void)putHighlight:(id)a3;
- (void)putUnderline:(id)a3;
- (void)puts:(const char *)a3;
- (void)resetColorsAndAttributes;
- (void)setLogOutputFd:(int)a3;
- (void)setParentCommand:(id)a3;
- (void)setPrintHeader:(char)a3;
- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5;
- (void)startInterruptibleOperationWithInterruptionBlock:(id)a3;
- (void)startNewLine;
- (void)stopInterruptibleOperation;
@end

@implementation CPLCTLCommand

+ (NSString)toolPath
{
  return (NSString *)(id)qword_10003D398;
}

+ (void)setToolPath:(id)a3
{
  id v3 = [a3 copy];
  v4 = (void *)qword_10003D398;
  qword_10003D398 = (uint64_t)v3;
}

+ (void)setToolName:(id)a3
{
  id v5 = a3;
  if (qword_10003D3A0) {
    sub_10001CA3C((uint64_t)a1, a2);
  }
  id v8 = v5;
  id v6 = [v5 copy];
  v7 = (void *)qword_10003D3A0;
  qword_10003D3A0 = (uint64_t)v6;
}

+ (NSString)toolName
{
  if (!qword_10003D3A0) {
    sub_10001CB68((uint64_t)a1, a2);
  }
  return (NSString *)(id)qword_10003D3A0;
}

+ (id)commandWithArgc:(int)a3 argv:(char *)a4
{
  uint64_t v5 = (a3 - 1);
  if (a3 != 1)
  {
    v7 = a4 + 1;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a4[1]));
    if (v8)
    {
      v9 = (CPLHelpCommand *)objc_claimAutoreleasedReturnValue([a1 commandWithName:v8]);
      if (v9)
      {
        v10 = v9;
        if (!-[CPLHelpCommand parseCommandOptionsWithArgc:argv:](v9, "parseCommandOptionsWithArgc:argv:", v5, v7))
        {
          id v6 = objc_alloc_init(&OBJC_CLASS___CPLHelpCommand);
          -[CPLHelpCommand setHelpCommandName:](v6, "setHelpCommandName:", v8);
LABEL_10:

          return v6;
        }
      }

      else
      {
        v10 = (CPLHelpCommand *)objc_claimAutoreleasedReturnValue([a1 commandWithName:@"help"]);
        -[CPLCTLCommand printFormat:](v10, "printFormat:", @"Invalid command '%@'", v8);
      }

      v10 = v10;
      id v6 = v10;
      goto LABEL_10;
    }

    v10 = (CPLHelpCommand *)objc_claimAutoreleasedReturnValue([a1 commandWithName:@"help"]);
    -[CPLCTLCommand printFormat:](v10, "printFormat:", @"Invalid command name");
    id v6 = 0LL;
    goto LABEL_10;
  }

  id v6 = (CPLHelpCommand *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "commandWithName:", @"help", a4));
  return v6;
}

+ (void)register
{
}

+ (id)commandWithName:(id)a3
{
  return objc_alloc_init((Class)[a1 commandClassWithName:a3]);
}

+ (Class)commandClassWithName:(id)a3
{
  return (Class)[(id)qword_10003D3A8 objectForKey:a3];
}

+ (id)allCommandNames
{
  return (id)qword_10003D3B0;
}

+ (void)registerCommandClass:(Class)a3
{
  if (!qword_10003D3A8)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = (void *)qword_10003D3B0;
    qword_10003D3B0 = (uint64_t)v6;

    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v9 = (void *)qword_10003D3A8;
    qword_10003D3A8 = (uint64_t)v8;
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[objc_class commandName](a3, "commandName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003D3A8, "objectForKey:"));

  if (v10) {
    sub_10001CC94((uint64_t)v11, (uint64_t)a2, (uint64_t)a1);
  }
  [(id)qword_10003D3A8 setObject:a3 forKey:v11];
  [(id)qword_10003D3B0 addObject:v11];
}

- (NSString)commandVersion
{
  return 0LL;
}

- (CPLCTLCommand)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLCTLCommand;
  v2 = -[CPLCTLCommand init](&v8, "init");
  if (v2)
  {
    id v3 = -[CPLOutput initWithFileDescriptor:](objc_alloc(&OBJC_CLASS___CPLOutput), "initWithFileDescriptor:", 2LL);
    output = v2->_output;
    v2->_output = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cplctl.interruptionqueue", 0LL);
    interruptionQueue = v2->_interruptionQueue;
    v2->_interruptionQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (BOOL)quiet
{
  return 0;
}

+ (NSString)commandName
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl/CPLCTLCommand.m"));
  uint64_t v6 = objc_opt_class(a1);
  v7 = NSStringFromSelector(a2);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 handleFailureInMethod:a2, a1, v5, 190, @"+[%@ %@] should be overriden", v6, v8 object file lineNumber description];

  abort();
}

+ (NSString)shortDescription
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl/CPLCTLCommand.m"));
  uint64_t v6 = objc_opt_class(a1);
  v7 = NSStringFromSelector(a2);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 handleFailureInMethod:a2, a1, v5, 195, @"+[%@ %@] should be overriden", v6, v8 object file lineNumber description];

  abort();
}

+ (NSString)parameters
{
  return 0LL;
}

+ (NSString)help
{
  return 0LL;
}

- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4
{
  if (a3 != 1)
  {
    id v6 = [(id)objc_opt_class(self) commandName];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Invalid parameters for %@", v7);
  }

  return a3 == 1;
}

- (void)setLogOutputFd:(int)a3
{
  if (a3 < 0)
  {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"invalid log output fd=%d.", *(void *)&a3);
  }

  else
  {
    v4 = -[CPLOutput initWithFileDescriptor:]( objc_alloc(&OBJC_CLASS___CPLOutput),  "initWithFileDescriptor:",  *(void *)&a3);
    logOutput = self->_logOutput;
    self->_logOutput = v4;
  }

- (int)execute
{
  id v3 = [(id)objc_opt_class(self) commandName];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[CPLCTLCommand printFormat:](self, "printFormat:", @"%@ is not implemented yet.", v4);

  return 1;
}

- (BOOL)_shouldUseTimeoutForLibraryOpening
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 environment]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CPLCTL_TIMEOUT"]);

  if (v4) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 error:(id *)a4
{
  return -[CPLCTLCommand openedLibraryManagerWithLibraryIdentifier:targetUserIdentifier:error:]( self,  "openedLibraryManagerWithLibraryIdentifier:targetUserIdentifier:error:",  a3,  0LL,  a4);
}

- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 targetUserIdentifier:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCTLCommand openedLibraryManagerWithLibraryIdentifier:timeout:withTargetUserIdentifier:error:]( self,  "openedLibraryManagerWithLibraryIdentifier:timeout:withTargetUserIdentifier:error:",  v8,  -[CPLCTLCommand _shouldUseTimeoutForLibraryOpening](self, "_shouldUseTimeoutForLibraryOpening"),  v6,  a5));

  return v9;
}

- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 timeout:(BOOL)a4 error:(id *)a5
{
  return -[CPLCTLCommand openedLibraryManagerWithLibraryIdentifier:timeout:withTargetUserIdentifier:error:]( self,  "openedLibraryManagerWithLibraryIdentifier:timeout:withTargetUserIdentifier:error:",  a3,  a4,  0LL,  a5);
}

- (id)openedLibraryManagerWithLibraryIdentifier:(id)a3 timeout:(BOOL)a4 withTargetUserIdentifier:(unsigned int)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand privateEngine](self, "privateEngine"));
  id v11 = v10;
  if (v10)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue([v10 libraryManager]);
    goto LABEL_20;
  }

  id v12 = [[CPLLibraryManager alloc] initForManagementWithLibraryIdentifier:v9];
  [v12 setDelegate:self];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v46 = 0x3032000000LL;
  v47 = sub_10000ACF8;
  v48 = sub_10000AD08;
  id v49 = 0LL;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10000AD10;
  v38[3] = &unk_100030D38;
  p___int128 buf = &buf;
  v15 = v14;
  v39 = v15;
  [v12 openWithCompletionHandler:v38];
  if (a4)
  {
    dispatch_time_t v16 = dispatch_time(0LL, 30000000000LL);
    if (dispatch_group_wait(v15, v16))
    {
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      v44 = @"Timed out opening library manager";
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
      v18 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  60LL,  v17));

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000AD64;
      block[3] = &unk_100030D88;
      v37 = &buf;
      block[4] = self;
      id v35 = v13;
      id v36 = v12;
      dispatch_group_notify(v15, v20, block);

      goto LABEL_9;
    }
  }

  else
  {
    while (1)
    {
      dispatch_time_t v21 = dispatch_time(0LL, 10000000000LL);
      if (!dispatch_group_wait(v15, v21)) {
        break;
      }
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"Waiting to get a library manager");
    }
  }

  v18 = (NSError *)*(id *)(*((void *)&buf + 1) + 40LL);
LABEL_9:

  _Block_object_dispose(&buf, 8);
  if (v18)
  {
    if (!_CPLSilentLogging)
    {
      id v22 = sub_10000AF08();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Error trying to open daemon's library manager: %@",  (uint8_t *)&buf,  0xCu);
      }
    }

    if (a6)
    {
      if (([v9 isEqualToString:CPLLibraryIdentifierSystemLibrary] & 1) == 0)
      {
        v24 = objc_alloc(&OBJC_CLASS___NSError);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v18, "domain"));
        id v25 = -[NSError code](v18, "code");
        v41[0] = NSLocalizedDescriptionKey;
        v26 = objc_alloc(&OBJC_CLASS___NSString);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v18, "localizedDescription"));
        v28 = -[NSString initWithFormat:](v26, "initWithFormat:", @"%@ (%@)", v27, v9);
        v41[1] = NSUnderlyingErrorKey;
        v42[0] = v28;
        v42[1] = v18;
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));
        v30 = -[NSError initWithDomain:code:userInfo:](v24, "initWithDomain:code:userInfo:", v33, v25, v29);

        v18 = v30;
      }

      v18 = v18;
      *a6 = v18;
    }

    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v18, "localizedDescription"));
      -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"Can't get access to daemon's library manager for %@: %@",  v9,  v31);
    }

    id v12 = 0LL;
  }

- (NSString)defaultLibraryIdentifier
{
  defaultLibraryIdentifier = self->_defaultLibraryIdentifier;
  if (defaultLibraryIdentifier)
  {
    id v3 = defaultLibraryIdentifier;
  }

  else
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 environment]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CPLDefaultLibraryIdentifier"]);

    if (!v7)
    {
      storeCommand = self->_storeCommand;
      if (storeCommand) {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLStoreCommand defaultLibraryIdentifier](storeCommand, "defaultLibraryIdentifier"));
      }
      else {
        v7 = 0LL;
      }
    }

    id v9 = (void *)CPLLibraryIdentifierSystemLibrary;
    if (v7) {
      id v9 = v7;
    }
    id v3 = v9;
  }

  return v3;
}

- (id)photosLibraryURLFromBaseURL:(id)a3
{
  id v3 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathComponents]);
  unsigned __int8 v5 = (NSURL *)[v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v15 = v3;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v5; i = (NSURL *)((char *)i + 1))
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v10 = objc_autoreleasePoolPush();
        if (v6)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( v6,  "URLByAppendingPathComponent:isDirectory:",  v9,  1LL));

          uint64_t v6 = (NSURL *)v11;
        }

        else
        {
          uint64_t v6 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v9,  1LL);
        }

        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 pathExtension]);
        unsigned int v13 = [v12 isEqualToString:@"photoslibrary"];

        if (v13)
        {
          unsigned __int8 v5 = v6;
          objc_autoreleasePoolPop(v10);
          uint64_t v6 = v5;
          goto LABEL_14;
        }

        objc_autoreleasePoolPop(v10);
      }

      unsigned __int8 v5 = (NSURL *)[v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }

- (id)openedLibraryManagerWithTimeout:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand defaultLibraryIdentifier](self, "defaultLibraryIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCTLCommand openedLibraryManagerWithLibraryIdentifier:timeout:error:]( self,  "openedLibraryManagerWithLibraryIdentifier:timeout:error:",  v7,  v5,  a4));

  return v8;
}

- (id)openedLibraryManagerWithTimeout:(BOOL)a3 withTargetUserIdentifier:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand defaultLibraryIdentifier](self, "defaultLibraryIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCTLCommand openedLibraryManagerWithLibraryIdentifier:timeout:withTargetUserIdentifier:error:]( self,  "openedLibraryManagerWithLibraryIdentifier:timeout:withTargetUserIdentifier:error:",  v9,  v7,  v6,  a5));

  return v10;
}

- (id)openedLibraryManagerWithError:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand defaultLibraryIdentifier](self, "defaultLibraryIdentifier"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCTLCommand openedLibraryManagerWithLibraryIdentifier:error:]( self,  "openedLibraryManagerWithLibraryIdentifier:error:",  v5,  a3));

  return v6;
}

- (id)openedLibraryManagerWithTargetUserIdentifier:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand defaultLibraryIdentifier](self, "defaultLibraryIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCTLCommand openedLibraryManagerWithLibraryIdentifier:targetUserIdentifier:error:]( self,  "openedLibraryManagerWithLibraryIdentifier:targetUserIdentifier:error:",  v7,  v5,  a4));

  return v8;
}

- (void)closeLibraryManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand privateEngine](self, "privateEngine"));
  if (!v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000B3DC;
    v7[3] = &unk_100030DB0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
    uint64_t v6 = v8;
    [v4 closeWithCompletionHandler:v7];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (id)displayableNameForLibraryManager:(id)a3
{
  return @"cplctl";
}

+ (void)_printUsage
{
  id v4 = objc_alloc_init(&OBJC_CLASS___CPLHelpCommand);
  -[CPLHelpCommand setStandaloneTool:](v4, "setStandaloneTool:", 1LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 commandName]);
  -[CPLHelpCommand setHelpCommandName:](v4, "setHelpCommandName:", v3);

  -[CPLHelpCommand execute](v4, "execute");
}

+ (int)executeMainToolWithName:(id)a3 version:(id)a4 argc:(int)a5 argv:(char *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  [a1 register];
  id v12 = objc_autoreleasePoolPush();
  if (!_CPLSilentLogging)
  {
    id v13 = sub_10000AF08();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Hello from %@", buf, 0xCu);
    }
  }

  +[CPLCTLCommand setToolName:](&OBJC_CLASS___CPLCTLCommand, "setToolName:", v10);
  if ((_DWORD)v7 != 2) {
    goto LABEL_10;
  }
  id v15 = a6[1];
  if (!strcmp(v15, "-v") || !strcmp(v15, "--version"))
  {
    id v21 = [a1 newMainCommandWithToolname:v10];
    id v22 = v21;
    if (v21)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v21 commandVersion]);
      v24 = v23;
      if (v23)
      {
        if (v11)
        {
          id v25 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ (%@)",  v11,  v23);

          id v11 = v25;
        }

        else
        {
          id v11 = v23;
        }
      }

      uint64_t v26 = objc_claimAutoreleasedReturnValue([v22 additionalVersionInfo]);
      v27 = (void *)v26;
      if (v26)
      {
        uint64_t v28 = objc_claimAutoreleasedReturnValue([v11 stringByAppendingFormat:@" [%@]", v26]);

        id v11 = (id)v28;
      }
    }

    if (!v11)
    {
      uint64_t v29 = __CPLVersion();
      id v11 = (id)objc_claimAutoreleasedReturnValue(v29);
    }

    v30 = __stdoutp;
    v31 = basename(*a6);
    id v11 = v11;
    fprintf(v30, "%s %s\n", v31, (const char *)[v11 UTF8String]);

    goto LABEL_28;
  }

  if (!strcmp(v15, "-h") || !strcmp(v15, "--help"))
  {
    [a1 _printUsage];
LABEL_28:
    int v20 = 0;
    goto LABEL_29;
  }

- (NSString)additionalVersionInfo
{
  return 0LL;
}

- (CPLDaemonConnection)daemonConnection
{
  p_daemonConnection = &self->_daemonConnection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonConnection);

  if (WeakRetained)
  {
    id v4 = (CPLDaemonConnection *)objc_loadWeakRetained((id *)p_daemonConnection);
  }

  else
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___CPLDaemonConnection);
    objc_storeWeak((id *)p_daemonConnection, v4);
  }

  return v4;
}

- (id)getEngineWrapperStatusesWithError:(id *)a3
{
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  v54 = sub_10000ACF8;
  v55 = sub_10000AD08;
  id v56 = 0LL;
  uint64_t v45 = 0LL;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = sub_10000ACF8;
  id v49 = sub_10000AD08;
  id v50 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand daemonConnection](self, "daemonConnection"));
  v43[0] = 0LL;
  v43[1] = v43;
  v43[2] = 0x2020000000LL;
  char v44 = 1;
  v41[0] = 0LL;
  v41[1] = v41;
  void v41[2] = 0x2020000000LL;
  char v42 = 0;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_10000ACF8;
  v39[4] = sub_10000AD08;
  id v40 = 0LL;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10000BBB4;
  v35[3] = &unk_100030DD8;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 queue]);
  id v36 = v5;
  v37 = v41;
  v38 = v39;
  uint64_t v6 = objc_retainBlock(v35);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10000BC1C;
  v29[3] = &unk_100030E28;
  v32 = v39;
  v33 = v41;
  id v7 = v4;
  id v30 = v7;
  dispatch_semaphore_t v8 = v6;
  id v31 = v8;
  id v34 = &v45;
  id v9 = objc_retainBlock(v29);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000BDF4;
  v23[3] = &unk_100030E78;
  uint64_t v26 = v39;
  id v10 = v5;
  id v24 = v10;
  id v11 = v8;
  id v25 = v11;
  v27 = &v45;
  uint64_t v28 = v43;
  id v12 = objc_retainBlock(v23);
  uint64_t v13 = ((uint64_t (*)(void *))v9[2])(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000BF60;
  v19[3] = &unk_100030EC8;
  id v15 = v11;
  id v20 = v15;
  id v21 = &v51;
  id v22 = &v45;
  [v14 getEngineWrapperStatusesWithCompletionHandler:v19];

  ((void (*)(void *))v12[2])(v12);
  __int128 v16 = (void *)v52[5];
  if (a3 && !v16)
  {
    *a3 = (id) v46[5];
    __int128 v16 = (void *)v52[5];
  }

  id v17 = v16;

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v17;
}

- (CPLPhotosDaemonConnection)photosDaemonConnection
{
  p_photosDaemonConnection = &self->_photosDaemonConnection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photosDaemonConnection);

  if (WeakRetained)
  {
    id v4 = (CPLPhotosDaemonConnection *)objc_loadWeakRetained((id *)p_photosDaemonConnection);
  }

  else
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___CPLPhotosDaemonConnection);
    objc_storeWeak((id *)p_photosDaemonConnection, v4);
  }

  return v4;
}

- (id)getLibraryIdentifiersWithDomain:(int64_t)a3 error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand photosDaemonConnection](self, "photosDaemonConnection"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 managementServiceWithError:a4]);
  if (v7)
  {
    dispatch_semaphore_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 queue]);
    uint64_t v40 = 0LL;
    v41 = &v40;
    uint64_t v42 = 0x3032000000LL;
    NSErrorUserInfoKey v43 = sub_10000ACF8;
    char v44 = sub_10000AD08;
    id v45 = 0LL;
    uint64_t v34 = 0LL;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000LL;
    v37 = sub_10000ACF8;
    v38 = sub_10000AD08;
    id v39 = 0LL;
    id v9 = objc_alloc_init(&OBJC_CLASS___PLPhotoLibrarySearchCriteria);
    -[PLPhotoLibrarySearchCriteria setDomain:](v9, "setDomain:", a3);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    v32[0] = 0LL;
    v32[1] = v32;
    v32[2] = 0x2020000000LL;
    char v33 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10000C3BC;
    v26[3] = &unk_100030EF0;
    id v11 = v8;
    v27 = v11;
    uint64_t v29 = v32;
    id v30 = &v34;
    id v31 = &v40;
    id v12 = v10;
    uint64_t v28 = v12;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10000C460;
    v24[3] = &unk_100030F18;
    uint64_t v13 = objc_retainBlock(v26);
    id v25 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteObjectProxyWithErrorHandler:v24]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000C474;
    v22[3] = &unk_100030F40;
    id v15 = v13;
    id v23 = v15;
    [v14 findPhotoLibraryIdentifiersMatchingSearchCriteria:v9 reply:v22];

    dispatch_time_t v16 = dispatch_time(0LL, 30000000000LL);
    if (dispatch_semaphore_wait(v12, v16))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10000C480;
      v20[3] = &unk_100030F68;
      id v21 = v15;
      dispatch_sync(v11, v20);
    }

    id v17 = (void *)v35[5];
    if (a4 && !v17)
    {
      *a4 = (id) v41[5];
      id v17 = (void *)v35[5];
    }

    id v18 = v17;

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v40, 8);
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (void)printFormat:(id)a3 arguments:(char *)a4
{
  output = self->_output;
  id v7 = a3;
  -[CPLOutput printFormat:arguments:](output, "printFormat:arguments:", v7, a4);
  -[CPLOutput printFormat:arguments:](self->_logOutput, "printFormat:arguments:", v7, a4);
}

- (void)printFormat:(id)a3
{
  output = self->_output;
  id v5 = a3;
  -[CPLOutput printFormat:arguments:](output, "printFormat:arguments:", v5, &v6);
  -[CPLOutput printFormat:arguments:](self->_logOutput, "printFormat:arguments:", v5, &v6);
}

- (void)printError:(id)a3
{
}

- (void)printError:(id)a3 arguments:(char *)a4
{
  output = self->_output;
  id v7 = a3;
  -[CPLOutput printError:arguments:](output, "printError:arguments:", v7, a4);
  -[CPLOutput printError:arguments:](self->_logOutput, "printError:arguments:", v7, a4);
}

- (int)outputFd
{
  output = self->_output;
  if (output) {
    return -[CPLOutput outputFd](output, "outputFd");
  }
  else {
    return -1;
  }
}

- (void)putBright:(id)a3
{
}

- (void)putHighlight:(id)a3
{
}

- (void)putUnderline:(id)a3
{
}

- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
}

- (void)resetColorsAndAttributes
{
}

- (void)forceResetColorsAndAttributes
{
}

- (void)clearScreen
{
}

- (void)eraseEndOfLine
{
}

- (void)eraseStartOfLine
{
}

- (void)eraseLine
{
}

- (void)eraseScreenDown
{
}

- (void)eraseScreenUp
{
}

- (void)cursorSave
{
}

- (void)cursorRestore
{
}

- (void)cursorToStartOfLine
{
}

- (void)cursorGotoLineStart
{
}

- (void)cursorToTopLeft
{
}

- (void)cursorUp:(unsigned int)a3
{
}

- (void)cursorDown:(unsigned int)a3
{
}

- (void)cursorRight:(unsigned int)a3
{
}

- (void)cursorLeft:(unsigned int)a3
{
}

- (void)startNewLine
{
}

- (void)endLine
{
}

- (void)endLineIfNecessary
{
}

- (void)flush
{
}

- (int)remainingSpace
{
  return -[CPLOutput remainingSpace](self->_output, "remainingSpace");
}

- (void)forgetRemainingSpace
{
}

- (void)puts:(const char *)a3
{
}

- (void)put:(id)a3
{
  output = self->_output;
  id v5 = a3;
  -[CPLOutput put:](output, "put:", v5);
  -[CPLOutput put:](self->_logOutput, "put:", v5);
}

- (void)putBrightF:(id)a3
{
  output = self->_output;
  id v5 = a3;
  -[CPLOutput startFgColor:bgColor:attr:](output, "startFgColor:bgColor:attr:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, 2LL);
  -[CPLOutput putF:arguments:](self->_output, "putF:arguments:", v5, &v6);
  -[CPLOutput putF:arguments:](self->_logOutput, "putF:arguments:", v5, &v6);

  -[CPLOutput resetColorsAndAttributes](self->_output, "resetColorsAndAttributes");
}

- (void)putF:(id)a3
{
  output = self->_output;
  id v5 = a3;
  -[CPLOutput putF:arguments:](output, "putF:arguments:", v5, &v6);
  -[CPLOutput putF:arguments:](self->_logOutput, "putF:arguments:", v5, &v6);
}

- (void)putF:(id)a3 arguments:(char *)a4
{
  output = self->_output;
  id v7 = a3;
  -[CPLOutput putF:arguments:](output, "putF:arguments:", v7, a4);
  -[CPLOutput putF:arguments:](self->_logOutput, "putF:arguments:", v7, a4);
}

- (void)disableOutput
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___CPLOutputToVoid);
  -[CPLCTLCommand beginOutputTo:](self, "beginOutputTo:", v3);
}

- (void)beginOutputTo:(id)a3
{
  id v4 = (CPLOutput *)a3;
  outputStack = self->_outputStack;
  if (!outputStack)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = self->_outputStack;
    self->_outputStack = v6;

    outputStack = self->_outputStack;
  }

  -[NSMutableArray addObject:](outputStack, "addObject:", self->_output);
  -[CPLOutput setPrintHeader:](v4, "setPrintHeader:", -[CPLOutput printHeader](self->_output, "printHeader"));
  output = self->_output;
  self->_output = v4;
}

- (void)endOutputTo:(id)a3
{
  id v7 = (CPLOutput *)a3;
  if (!-[NSMutableArray count](self->_outputStack, "count")) {
    sub_10001CE3C();
  }
  if (self->_output != v7) {
    sub_10001CE64();
  }
  id v4 = (CPLOutput *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_outputStack, "lastObject"));
  output = self->_output;
  self->_output = v4;

  -[CPLOutput setPrintHeader:](self->_output, "setPrintHeader:", -[CPLOutput printHeader](v7, "printHeader"));
  -[NSMutableArray removeLastObject](self->_outputStack, "removeLastObject");
  if (!-[NSMutableArray count](self->_outputStack, "count"))
  {
    outputStack = self->_outputStack;
    self->_outputStack = 0LL;
  }
}

- (void)prepareToRunWithinCommand:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_output, a3);
  uint64_t v6 = (CPLOutput *)objc_claimAutoreleasedReturnValue([v5 logOutput]);
  logOutput = self->_logOutput;
  self->_logOutput = v6;

  storeCommand = self->_storeCommand;
  self->_storeCommand = (CPLStoreCommand *)v5;
}

- (CPLPrivateEngine)privateEngine
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand storeCommand](self, "storeCommand"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 store]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentPrivateEngine]);

  return (CPLPrivateEngine *)v4;
}

- (void)setPrintHeader:(char)a3
{
  uint64_t v3 = a3;
  -[CPLOutput setPrintHeader:](self->_output, "setPrintHeader:");
  outputStack = self->_outputStack;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000CB64;
  v6[3] = &unk_100030F88;
  char v7 = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](outputStack, "enumerateObjectsUsingBlock:", v6);
  -[CPLOutput setPrintHeader:](self->_logOutput, "setPrintHeader:", v3);
}

- (void)printHeaderIfNecessary:(char)a3
{
  uint64_t v3 = a3;
  -[CPLOutput printHeaderIfNecessary:](self->_output, "printHeaderIfNecessary:");
  -[CPLOutput printHeaderIfNecessary:](self->_logOutput, "printHeaderIfNecessary:", v3);
}

- (void)printJSONObject:(id)a3
{
  output = self->_output;
  id v5 = a3;
  -[CPLOutput printJSONObject:](output, "printJSONObject:", v5);
  -[CPLOutput printJSONObject:](self->_logOutput, "printJSONObject:", v5);
}

- (void)printJSONData:(id)a3
{
  output = self->_output;
  id v5 = a3;
  -[CPLOutput printJSONData:](output, "printJSONData:", v5);
  -[CPLOutput printJSONData:](self->_logOutput, "printJSONData:", v5);
}

- (BOOL)isATTY
{
  return -[CPLOutput isATTY](self->_output, "isATTY");
}

- (char)printHeader
{
  return -[CPLOutput printHeader](self->_output, "printHeader");
}

- (BOOL)supportsEscapeSequences
{
  return -[CPLOutput supportsEscapeSequences](self->_output, "supportsEscapeSequences");
}

- (BOOL)usesColor
{
  return -[CPLOutput usesColor](self->_output, "usesColor");
}

- (void)closeOutput
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___CPLOutputToVoid);
  output = self->_output;
  self->_output = (CPLOutput *)v3;

  logOutput = self->_logOutput;
  self->_logOutput = 0LL;
}

- (void)_setInterruptionHandler:(id)a3
{
  id v4 = a3;
  interruptionQueue = (dispatch_queue_s *)self->_interruptionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CD18;
  block[3] = &unk_100030FD8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(interruptionQueue, block);
}

- (void)startInterruptibleOperationWithInterruptionBlock:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_storeCommand)
  {
    interruptionQueue = (dispatch_queue_s *)self->_interruptionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CF20;
    block[3] = &unk_100031000;
    block[4] = self;
    id v8 = v4;
    dispatch_sync(interruptionQueue, block);
    -[CPLStoreCommand startInterruptibleOperation:](self->_storeCommand, "startInterruptibleOperation:", self);
  }

  else
  {
    -[CPLCTLCommand _setInterruptionHandler:](self, "_setInterruptionHandler:", v4);
  }
}

- (void)stopInterruptibleOperation
{
  if (self->_storeCommand)
  {
    interruptionQueue = (dispatch_queue_s *)self->_interruptionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CFEC;
    block[3] = &unk_100030B88;
    block[4] = self;
    dispatch_sync(interruptionQueue, block);
    -[CPLStoreCommand stopInterruptibleOperation:](self->_storeCommand, "stopInterruptibleOperation:", self);
  }

  else
  {
    -[CPLCTLCommand _setInterruptionHandler:](self, "_setInterruptionHandler:", 0LL);
  }

- (void)cplInterrupt
{
  interruptionQueue = (dispatch_queue_s *)self->_interruptionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D068;
  block[3] = &unk_100030B88;
  block[4] = self;
  dispatch_sync(interruptionQueue, block);
}

- (id)urlWithinHomeWithPath:(id)a3 isDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([@"/var/mobile" stringByAppendingPathComponent:a3]);
  id v6 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v5,  v4);

  return v6;
}

- (id)_tempFolderURL
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand storeCommand](self, "storeCommand"));
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 store]);
    id v6 = v5;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand privateEngine](self, "privateEngine"));
    id v6 = v5;
    if (!v5)
    {
      id v9 = NSTemporaryDirectory();
      dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      char v7 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v10,  1LL);

      goto LABEL_5;
    }
  }

  char v7 = (NSURL *)objc_claimAutoreleasedReturnValue([v5 tempFolderURL]);
LABEL_5:

  return v7;
}

- (id)tempFolderURLWithError:(id *)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CPLCTLCommand _tempFolderURL](self, "_tempFolderURL"));
  if (!v5) {
    sub_10001CF54();
  }
  id v6 = (void *)v5;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = (objc_class *)objc_opt_class(self);
  id v9 = NSStringFromClass(v8);
  dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if ([v10 hasPrefix:@"CPL"])
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 substringFromIndex:3]);

    dispatch_semaphore_t v10 = (void *)v11;
  }

  if ([v10 hasSuffix:@"Command"])
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "substringToIndex:",  (_BYTE *)objc_msgSend(v10, "length") - (_BYTE *)objc_msgSend(@"Command", "length")));

    dispatch_semaphore_t v10 = (void *)v12;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand storeCommand](self, "storeCommand"));
  v14 = v13;
  if (v13)
  {
    id v15 = [v13 currentStepIndex];
    dispatch_time_t v16 = objc_alloc(&OBJC_CLASS___NSString);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v18 = -[NSString initWithFormat:](v16, "initWithFormat:", @"%lu-%@-%@", v15, v10, v17);
  }

  else
  {
    unsigned int v19 = objc_alloc(&OBJC_CLASS___NSString);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v18 = -[NSString initWithFormat:](v19, "initWithFormat:", @"%@-%@", v10, v17, v29);
  }

  id v20 = v18;

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:v20 isDirectory:1]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 path]);
  unsigned int v23 = [v7 fileExistsAtPath:v22 isDirectory:&v31];

  if (v23 && v31)
  {
    id v24 = v21;
  }

  else if (v23)
  {
    id v24 = 0LL;
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    }
  }

  else
  {
    id v30 = 0LL;
    unsigned int v25 = [v7 createDirectoryAtURL:v21 withIntermediateDirectories:0 attributes:0 error:&v30];
    id v26 = v30;
    v27 = v26;
    if (v25)
    {
      id v24 = v21;
    }

    else
    {
      id v24 = 0LL;
      if (a3) {
        *a3 = v26;
      }
    }
  }

  return v24;
}

- (CPLCTLCommand)parentCommand
{
  return self->_parentCommand;
}

- (void)setParentCommand:(id)a3
{
}

- (NSURL)defaultLibraryURL
{
  return self->_defaultLibraryURL;
}

- (CPLOutput)output
{
  return self->_output;
}

- (CPLOutput)logOutput
{
  return self->_logOutput;
}

- (CPLStoreCommand)storeCommand
{
  return self->_storeCommand;
}

- (void).cxx_destruct
{
}

@end