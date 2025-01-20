@interface TVSettingsNumberingSystemsFacade
- (NSArray)availableNumberingSystems;
- (TVSettingsNumberingSystem)currentNumberingSystem;
- (TVSettingsNumberingSystemsFacade)init;
- (void)_currentLocaleDidChange;
- (void)_reloadNumberingSystems;
- (void)dealloc;
- (void)setCurrentNumberingSystem:(id)a3;
@end

@implementation TVSettingsNumberingSystemsFacade

- (TVSettingsNumberingSystemsFacade)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsNumberingSystemsFacade;
  v2 = -[TVSettingsNumberingSystemsFacade init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[TVSettingsNumberingSystemsFacade _reloadNumberingSystems](v2, "_reloadNumberingSystems");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"_currentLocaleDidChange" name:NSCurrentLocaleDidChangeNotification object:0];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v3 selector:"_currentLocaleDidChange" name:@"AppleNumberPreferencesChangedNotification" object:0];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsNumberingSystemsFacade;
  -[TVSettingsNumberingSystemsFacade dealloc](&v4, "dealloc");
}

- (void)setCurrentNumberingSystem:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects(v6, self->_currentNumberingSystem) & 1) == 0)
  {
    -[TVSettingsNumberingSystemsFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"currentNumberingSystem");
    -[TVSettingsNumberingSystem setIsSelected:](self->_currentNumberingSystem, "setIsSelected:", 0LL);
    [v6 setIsSelected:1];
    objc_storeStrong((id *)&self->_currentNumberingSystem, a3);
    -[TVSettingsNumberingSystemsFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"currentNumberingSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue([v6 localeIdentifier]);
    +[NSLocale setLocaleOnly:](&OBJC_CLASS___NSLocale, "setLocaleOnly:", v5);
  }
}

- (void)_currentLocaleDidChange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localeIdentifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNumberingSystem localeIdentifier](self->_currentNumberingSystem, "localeIdentifier"));
  char v6 = BSEqualStrings(v4, v5);

  if ((v6 & 1) == 0)
  {
    -[TVSettingsNumberingSystemsFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"currentNumberingSystem");
    -[TVSettingsNumberingSystemsFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"availableNumberingSystems");
    -[TVSettingsNumberingSystemsFacade _reloadNumberingSystems](self, "_reloadNumberingSystems");
    -[TVSettingsNumberingSystemsFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"currentNumberingSystem");
    -[TVSettingsNumberingSystemsFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"availableNumberingSystems");
  }

- (void)_reloadNumberingSystems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localeIdentifier]);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale componentsFromLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "componentsFromLocaleIdentifier:",  v3));

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v2 availableNumberingSystems]);
  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v9 = [v22 mutableCopy];
        [v9 setObject:v8 forKeyedSubscript:@"numbers"];
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeIdentifierFromComponents:]( &OBJC_CLASS___NSLocale,  "localeIdentifierFromComponents:",  v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForNumberingSystem:v8 short:0]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForNumberingSystem:v8 short:1]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v2 numberingSystem]);
        id v14 = [v8 isEqual:v13];

        v15 = -[TVSettingsNumberingSystem initWithLocaleIdentifier:displayName:shortDisplayName:isSelected:]( objc_alloc(&OBJC_CLASS___TVSettingsNumberingSystem),  "initWithLocaleIdentifier:displayName:shortDisplayName:isSelected:",  v10,  v11,  v12,  v14);
        -[NSMutableArray addObject:](v21, "addObject:", v15);
        if ((_DWORD)v14) {
          objc_storeStrong((id *)&self->_currentNumberingSystem, v15);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v6);
  }

  v16 = (NSArray *)-[NSMutableArray copy](v21, "copy");
  availableNumberingSystems = self->_availableNumberingSystems;
  self->_availableNumberingSystems = v16;
}

- (TVSettingsNumberingSystem)currentNumberingSystem
{
  return self->_currentNumberingSystem;
}

- (NSArray)availableNumberingSystems
{
  return self->_availableNumberingSystems;
}

- (void).cxx_destruct
{
}

@end