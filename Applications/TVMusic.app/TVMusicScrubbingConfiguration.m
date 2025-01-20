@interface TVMusicScrubbingConfiguration
+ (id)_defaultValues;
+ (void)_enumerateObservableKeysWithBlock:(id)a3;
- (NSString)domain;
- (TVMusicScrubbingConfiguration)init;
- (TVSPreferences)preferences;
- (double)_CGFloatValueForKey:(id)a3;
- (double)chapterSnappingVelocityFactor;
- (double)decelerationRate;
- (double)maxChapterSnappingDistance;
- (double)minChapterSnappingDistance;
- (double)padScalingFactor;
- (id)defaultsDidChangeObserver;
- (int64_t)numberOfObservers;
- (void)_sendDidChangeNotifications;
- (void)_sendWillChangeNotifications;
- (void)_setCGFloat:(double)a3 forKey:(id)a4;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)dealloc;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)setChapterSnappingVelocityFactor:(double)a3;
- (void)setDecelerationRate:(double)a3;
- (void)setDefaultsDidChangeObserver:(id)a3;
- (void)setDomain:(id)a3;
- (void)setMaxChapterSnappingDistance:(double)a3;
- (void)setMinChapterSnappingDistance:(double)a3;
- (void)setNumberOfObservers:(int64_t)a3;
- (void)setPadScalingFactor:(double)a3;
- (void)setPreferences:(id)a3;
@end

@implementation TVMusicScrubbingConfiguration

+ (id)_defaultValues
{
  if (qword_1002BEC18[0] != -1) {
    dispatch_once(qword_1002BEC18, &stru_10026E240);
  }
  return (id)qword_1002BEC10;
}

- (TVMusicScrubbingConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicScrubbingConfiguration;
  v2 = -[TVMusicScrubbingConfiguration init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    domain = v2->_domain;
    v2->_domain = (NSString *)@"com.apple.TVScrubbingConfiguration";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[TVSPreferences preferencesWithDomain:](&OBJC_CLASS___TVSPreferences, "preferencesWithDomain:", v3->_domain));
    preferences = v3->_preferences;
    v3->_preferences = (TVSPreferences *)v5;
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id WeakRetained = objc_loadWeakRetained(&self->_defaultsDidChangeObserver);
  [v3 removeObserver:WeakRetained];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicScrubbingConfiguration;
  -[TVMusicScrubbingConfiguration dealloc](&v5, "dealloc");
}

+ (void)_enumerateObservableKeysWithBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (!v4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The enumeration block must not be nil.");
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_defaultValues", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8LL * (void)i));
      }

      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)_sendWillChangeNotifications
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000D9BDC;
  v2[3] = &unk_100269AE8;
  v2[4] = self;
  objc_msgSend((id)objc_opt_class(self, a2), "_enumerateObservableKeysWithBlock:", v2);
}

- (void)_sendDidChangeNotifications
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000D9C48;
  v2[3] = &unk_100269AE8;
  v2[4] = self;
  objc_msgSend((id)objc_opt_class(self, a2), "_enumerateObservableKeysWithBlock:", v2);
}

- (void)_setCGFloat:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicScrubbingConfiguration preferences](self, "preferences"));
  [v7 setDouble:v6 forKey:a3];

  [v7 synchronize];
}

- (double)_CGFloatValueForKey:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_defaultValues");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);
  [v8 doubleValue];
  double v10 = v9;

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicScrubbingConfiguration preferences](self, "preferences"));
  [v11 doubleForKey:v4 defaultValue:v10];
  double v13 = v12;

  return v13;
}

- (double)padScalingFactor
{
  return result;
}

- (void)setPadScalingFactor:(double)a3
{
}

- (double)decelerationRate
{
  return result;
}

- (void)setDecelerationRate:(double)a3
{
}

- (double)minChapterSnappingDistance
{
  return result;
}

- (void)setMinChapterSnappingDistance:(double)a3
{
}

- (double)maxChapterSnappingDistance
{
  return result;
}

- (void)setMaxChapterSnappingDistance:(double)a3
{
}

- (double)chapterSnappingVelocityFactor
{
  return result;
}

- (void)setChapterSnappingVelocityFactor:(double)a3
{
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVMusicScrubbingConfiguration;
  -[TVMusicScrubbingConfiguration addObserver:forKeyPath:options:context:]( &v21,  "addObserver:forKeyPath:options:context:",  v10,  v11,  a5,  a6);
  int64_t v12 = -[TVMusicScrubbingConfiguration numberOfObservers](self, "numberOfObservers");
  -[TVMusicScrubbingConfiguration setNumberOfObservers:](self, "setNumberOfObservers:", v12 + 1);
  if (!v12)
  {
    objc_initWeak(&location, self);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicScrubbingConfiguration domain](self, "domain"));
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_1000D9F34;
    v18 = &unk_100269B10;
    objc_copyWeak(&v19, &location);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  v13,  &v15));
    -[TVMusicScrubbingConfiguration setDefaultsDidChangeObserver:]( self,  "setDefaultsDidChangeObserver:",  v14,  v15,  v16,  v17,  v18);

    -[TVMusicScrubbingConfiguration _sendWillChangeNotifications](self, "_sendWillChangeNotifications");
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicScrubbingConfiguration;
  -[TVMusicScrubbingConfiguration removeObserver:forKeyPath:](&v8, "removeObserver:forKeyPath:", a3, a4);
  uint64_t v5 = (char *)-[TVMusicScrubbingConfiguration numberOfObservers](self, "numberOfObservers") - 1;
  -[TVMusicScrubbingConfiguration setNumberOfObservers:](self, "setNumberOfObservers:", v5);
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicScrubbingConfiguration defaultsDidChangeObserver](self, "defaultsDidChangeObserver"));
    [v6 removeObserver:v7];
  }

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (TVSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (id)defaultsDidChangeObserver
{
  return objc_loadWeakRetained(&self->_defaultsDidChangeObserver);
}

- (void)setDefaultsDidChangeObserver:(id)a3
{
}

- (int64_t)numberOfObservers
{
  return self->_numberOfObservers;
}

- (void)setNumberOfObservers:(int64_t)a3
{
  self->_numberOfObservers = a3;
}

- (void).cxx_destruct
{
}

@end