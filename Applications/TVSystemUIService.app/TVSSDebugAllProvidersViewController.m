@interface TVSSDebugAllProvidersViewController
- (id)debugEntries;
@end

@implementation TVSSDebugAllProvidersViewController

- (id)debugEntries
{
  v17[2] = self;
  v17[1] = (id)a2;
  if (!qword_100221918)
  {
    v17[0] = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___TVSSExampleMenuItemProvider);
    id v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL);
    memset(__b, 0, sizeof(__b));
    id obj = v16;
    id v12 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0LL;
      id v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(obj);
        }
        Class v15 = *(Class *)(__b[1] + 8 * v9);
        v5 = objc_alloc(&OBJC_CLASS___TVSSDebugMenuEntry);
        v6 = NSStringFromClass(v15);
        v13 = -[TVSSDebugMenuEntry initWithEntryTitle:viewControllerProvider:]( v5,  "initWithEntryTitle:viewControllerProvider:");

        [v17[0] addObject:v13];
        objc_storeStrong((id *)&v13, 0LL);
        ++v9;
        if (v7 + 1 >= (unint64_t)v10)
        {
          uint64_t v9 = 0LL;
          id v10 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    id v2 = [v17[0] copy];
    v3 = (void *)qword_100221918;
    qword_100221918 = (uint64_t)v2;

    objc_storeStrong(&v16, 0LL);
    objc_storeStrong(v17, 0LL);
  }

  return (id)qword_100221918;
}

@end