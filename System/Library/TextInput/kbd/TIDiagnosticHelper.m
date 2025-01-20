@interface TIDiagnosticHelper
+ (id)sharedInstance;
- (TIDiagnosticHelper)init;
- (id)registerForSignal:(int)a3 withBlock:(id)a4;
- (void)dealloc;
- (void)handleMachMessage:(void *)a3;
- (void)unregisterSignalHandler:(id)a3;
@end

@implementation TIDiagnosticHelper

+ (id)sharedInstance
{
  if (qword_10001E1E8 != -1) {
    dispatch_once(&qword_10001E1E8, &stru_100014708);
  }
  return (id)qword_10001E1E0;
}

- (TIDiagnosticHelper)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TIDiagnosticHelper;
  v2 = -[TIDiagnosticHelper init](&v9, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMachPort port](&OBJC_CLASS___NSMachPort, "port"));
    port = v2->_port;
    v2->_port = (NSMachPort *)v5;

    dword_10001E1F0 = -[NSMachPort machPort](v2->_port, "machPort");
    -[NSMachPort setDelegate:](v2->_port, "setDelegate:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v7 addPort:v2->_port forMode:NSDefaultRunLoopMode];
  }

  return v2;
}

- (void)dealloc
{
  dword_10001E1F0 = 0;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v3 removePort:self->_port forMode:NSDefaultRunLoopMode];

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_handlers, "allKeys"));
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        signal((int)[*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) intValue], 0);
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TIDiagnosticHelper;
  -[TIDiagnosticHelper dealloc](&v9, "dealloc");
}

- (void)handleMachMessage:(void *)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  handlers = self->_handlers;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *((unsigned int *)a3 + 5), 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](handlers, "objectForKey:", v4));

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9) + 16LL))();
        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (id)registerForSignal:(int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_handlers, "objectForKey:", v7));
  if (!v8)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKey:](self->_handlers, "setObject:forKey:", v8, v7);
    signal(v4, (void (__cdecl *)(int))sub_100003814);
  }

  id v9 = [v6 copy];
  id v10 = objc_retainBlock(v9);
  [v8 addObject:v10];

  v14[0] = v7;
  id v11 = objc_retainBlock(v9);
  v14[1] = v11;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));

  return v12;
}

- (void)unregisterSignalHandler:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_handlers, "objectForKey:"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:1]);

  [v5 removeObject:v6];
  if (![v5 count])
  {
    -[NSMutableDictionary removeObjectForKey:](self->_handlers, "removeObjectForKey:", v7);
    signal((int)[v7 intValue], 0);
  }
}

- (void).cxx_destruct
{
}

@end