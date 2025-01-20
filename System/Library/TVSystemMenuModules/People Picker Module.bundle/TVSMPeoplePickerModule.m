@interface TVSMPeoplePickerModule
+ (id)availableStyles;
- (TVSMPeoplePickerModule)init;
- (id)childModules;
- (void)_updateContentViewControllerForModule:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TVSMPeoplePickerModule

+ (id)availableStyles
{
  return &off_CF90;
}

- (TVSMPeoplePickerModule)init
{
  SEL v8 = a2;
  v9 = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSMPeoplePickerModule;
  v6 = -[TVSMPeoplePickerModule init](&v7, "init");
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TVPeoplePickerDataSource);
    dataSource = v9->_dataSource;
    v9->_dataSource = v2;

    -[TVPeoplePickerDataSource addObserver:forKeyPath:options:context:]( v9->_dataSource,  "addObserver:forKeyPath:options:context:",  v9,  @"currentUser",  0LL,  off_12B70);
  }

  v5 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  return v5;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVPeoplePickerDataSource removeObserver:forKeyPath:context:]( self->_dataSource,  "removeObserver:forKeyPath:context:",  self,  @"currentUser",  off_12B70);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSMPeoplePickerModule;
  -[TVSMPeoplePickerModule dealloc](&v2, "dealloc");
}

- (id)childModules
{
  v18 = self;
  v17[1] = (id)a2;
  if (!self->_childModules)
  {
    v17[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_super v7 = -[TVPeoplePickerDataSource users](v18->_dataSource, "users");
    v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    v13 = sub_44E8;
    v14 = &unk_C1D8;
    v15 = v18;
    id v16 = v17[0];
    -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", &v10);

    SEL v8 = -[TVPeoplePickerDataSource suggestedUsers](v18->_dataSource, "suggestedUsers");
    id location = -[NSArray bs_map:](v8, "bs_map:", &stru_C218);

    objc_storeStrong((id *)&v18->_suggestedUserModules, location);
    [v17[0] addObjectsFromArray:location];
    if (-[TVPeoplePickerDataSource canShowAddNewUserOption](v18->_dataSource, "canShowAddNewUserOption"))
    {
      id v5 = v17[0];
      v6 = objc_alloc_init(&OBJC_CLASS___TVSMPeoplePickerAddUserModule);
      objc_msgSend(v5, "addObject:");
    }

    objc_super v2 = (NSArray *)[v17[0] copy];
    childModules = v18->_childModules;
    v18->_childModules = v2;

    objc_storeStrong(&location, 0LL);
    objc_storeStrong(&v16, 0LL);
    objc_storeStrong((id *)&v15, 0LL);
    objc_storeStrong(v17, 0LL);
  }

  return v18->_childModules;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v19 = 0LL;
  objc_storeStrong(&v19, a5);
  v18 = a6;
  if (a6 == off_12B70)
  {
    memset(__b, 0, sizeof(__b));
    id v10 = -[TVSMPeoplePickerModule childModules](v22, "childModules");
    id v11 = [v10 countByEnumeratingWithState:__b objects:v23 count:16];
    if (v11)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0LL;
      id v9 = v11;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(__b[1] + 8 * v8);
        -[TVSMPeoplePickerModule _updateContentViewControllerForModule:]( v22,  "_updateContentViewControllerForModule:",  v17);
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0LL;
          id v9 = [v10 countByEnumeratingWithState:__b objects:v23 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }
  }

  else
  {
    v15.receiver = v22;
    v15.super_class = (Class)&OBJC_CLASS___TVSMPeoplePickerModule;
    -[TVSMPeoplePickerModule observeValueForKeyPath:ofObject:change:context:]( &v15,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v20,  v19,  v18);
  }

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateContentViewControllerForModule:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSMPeoplePickerPersonModule);
  if ((objc_opt_isKindOfClass(v7, v3) & 1) != 0)
  {
    id v9 = location[0];
    uint64_t v8 = (TVPeoplePickerUser *)[v9 user];
    id v5 = v9;
    v4 = v8;
    uint64_t v6 = -[TVPeoplePickerDataSource currentUser](v11->_dataSource, "currentUser");
    [v5 setSelected:v4 == v6];

    objc_storeStrong((id *)&v8, 0LL);
    objc_storeStrong(&v9, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end