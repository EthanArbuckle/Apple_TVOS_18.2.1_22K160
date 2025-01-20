@interface MTDefaultsChangeNotifier
- (BOOL)isRunning;
- (MTDefaultsChangeNotifier)initWithProperties:(id)a3 defaults:(id)a4;
- (NSUserDefaults)defaults;
- (void)_defaultsChanged;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDefaults:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation MTDefaultsChangeNotifier

- (MTDefaultsChangeNotifier)initWithProperties:(id)a3 defaults:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTDefaultsChangeNotifier;
  v8 = -[MTDictionaryDiff initWithProperties:](&v11, "initWithProperties:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_defaults, a4);
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTDefaultsChangeNotifier;
  -[MTDefaultsChangeNotifier dealloc](&v3, "dealloc");
}

- (void)start
{
  if (!-[MTDefaultsChangeNotifier isRunning](self, "isRunning"))
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff properties](self, "properties", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[NSUserDefaults addObserver:forKeyPath:options:context:]( self->_defaults,  "addObserver:forKeyPath:options:context:",  self,  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  0LL,  self);
          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }

    -[MTDefaultsChangeNotifier setRunning:](self, "setRunning:", 1LL);
    -[MTDefaultsChangeNotifier _defaultsChanged](self, "_defaultsChanged");
  }

- (void)stop
{
  if (-[MTDefaultsChangeNotifier isRunning](self, "isRunning"))
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff properties](self, "properties", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_defaults,  "removeObserver:forKeyPath:context:",  self,  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  self);
          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }

    -[MTDefaultsChangeNotifier setRunning:](self, "setRunning:", 0LL);
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == self) {
    objc_msgSend(a6, "_defaultsChanged", a3, a4, a5);
  }
}

- (void)_defaultsChanged
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryRepresentation](v2->_defaults, "dictionaryRepresentation"));
  v4.receiver = v2;
  v4.super_class = (Class)&OBJC_CLASS___MTDefaultsChangeNotifier;
  -[MTDictionaryDiff setDictionary:](&v4, "setDictionary:", v3);

  objc_sync_exit(v2);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end