@interface TVSSDebugOverlordViewController
- (TVSSDebugOverlordViewController)initWithDataSourceControllerOverlord:(id)a3;
- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord;
- (id)debugEntries;
@end

@implementation TVSSDebugOverlordViewController

- (TVSSDebugOverlordViewController)initWithDataSourceControllerOverlord:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSDebugOverlordViewController;
  v8 = -[TVSSDebugListViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_dataSourceControllerOverlord, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (id)debugEntries
{
  v26 = self;
  v25[1] = (id)a2;
  if (!qword_100221CC0)
  {
    v25[0] = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    v11 = -[TVSSDebugOverlordViewController dataSourceControllerOverlord](v26, "dataSourceControllerOverlord");
    id v24 = -[TVSSMenuDataSourceControllerOverlord controllers](v11, "controllers");

    memset(__b, 0, sizeof(__b));
    id obj = v24;
    id v13 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
    if (v13)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0LL;
      id v10 = v13;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(id *)(__b[1] + 8 * v9);
        id v21 = TVSSMenuModeDescription((unint64_t)[v23 mode]);
        objc_super v6 = objc_alloc(&OBJC_CLASS___TVSSDebugMenuEntry);
        id v5 = v21;
        v14 = _NSConcreteStackBlock;
        int v15 = -1073741824;
        int v16 = 0;
        v17 = sub_10006C2E0;
        v18 = &unk_1001B6C68;
        id v19 = v23;
        v20 = -[TVSSDebugMenuEntry initWithEntryTitle:viewControllerProvider:]( v6,  "initWithEntryTitle:viewControllerProvider:",  v5,  &v14);
        [v25[0] addObject:v20];
        objc_storeStrong((id *)&v20, 0LL);
        objc_storeStrong(&v19, 0LL);
        objc_storeStrong(&v21, 0LL);
        ++v9;
        if (v7 + 1 >= (unint64_t)v10)
        {
          uint64_t v9 = 0LL;
          id v10 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    id v2 = [v25[0] copy];
    v3 = (void *)qword_100221CC0;
    qword_100221CC0 = (uint64_t)v2;

    objc_storeStrong(&v24, 0LL);
    objc_storeStrong(v25, 0LL);
  }

  return (id)qword_100221CC0;
}

- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord
{
  return self->_dataSourceControllerOverlord;
}

- (void).cxx_destruct
{
}

@end