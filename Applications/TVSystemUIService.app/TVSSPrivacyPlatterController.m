@interface TVSSPrivacyPlatterController
- (TVSSPrivacyPlatterController)initWithIdentifier:(id)a3 criticalInfo:(id)a4;
- (id)_itemsForGroup:(id)a3;
@end

@implementation TVSSPrivacyPlatterController

- (TVSSPrivacyPlatterController)initWithIdentifier:(id)a3 criticalInfo:(id)a4
{
  v51 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v49 = 0LL;
  objc_storeStrong(&v49, a4);
  v24 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:");
  v54[0] = v24;
  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v23 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v54[1] = v23;
  id v22 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:");
  v54[2] = v22;
  v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 3LL);
  id v48 = -[NSArray mutableCopy](v21, "mutableCopy");

  v30 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v29 =  -[NSBundle localizedStringForKey:value:table:]( v30,  "localizedStringForKey:value:table:",  @"TVSSPrivacy",  &stru_1001BDAC8,  0LL);
  v28 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v27 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"title");
  v53[0] = v27;
  v26 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"separator",  19LL,  0LL);
  v53[1] = v26;
  v25 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 2LL);
  id v47 = -[NSArray mutableCopy](v25, "mutableCopy");

  id v31 = [v49 groups];
  id v32 = [v31 count];

  unint64_t v46 = (unint64_t)v32;
  for (unint64_t i = 0LL; i < v46; ++i)
  {
    if (i)
    {
      id v18 = v48;
      +[TVSPConstants defaultSpacerHeight](&OBJC_CLASS___TVSPConstants, "defaultSpacerHeight");
      id v19 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
      objc_msgSend(v18, "addObject:");
    }

    id v15 = [v49 groups];
    id v44 = [v15 objectAtIndexedSubscript:i];

    id v43 = -[TVSSPrivacyPlatterController _itemsForGroup:](v51, "_itemsForGroup:", v44);
    memset(__b, 0, sizeof(__b));
    id v16 = v43;
    id v17 = [v16 countByEnumeratingWithState:__b objects:v52 count:16];
    if (v17)
    {
      uint64_t v12 = *(void *)__b[2];
      uint64_t v13 = 0LL;
      id v14 = v17;
      while (1)
      {
        uint64_t v11 = v13;
        if (*(void *)__b[2] != v12) {
          objc_enumerationMutation(v16);
        }
        id v42 = *(id *)(__b[1] + 8 * v13);
        id v40 = [v42 row];
        id v39 = [v42 renderer];
        [v48 addObject:v40];
        if (v39) {
          [v47 addObject:v39];
        }
        objc_storeStrong(&v39, 0LL);
        objc_storeStrong(&v40, 0LL);
        ++v13;
        if (v11 + 1 >= (unint64_t)v14)
        {
          uint64_t v13 = 0LL;
          id v14 = [v16 countByEnumeratingWithState:__b objects:v52 count:16];
          if (!v14) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v43, 0LL);
    objc_storeStrong(&v44, 0LL);
  }

  v38 =  +[TVSPLayout layoutWithRows:sizeProviders:]( &OBJC_CLASS___TVSPLayout,  "layoutWithRows:sizeProviders:",  v48,  v47);
  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  *(double *)&__int128 v36 = v4;
  *((double *)&v36 + 1) = v5;
  *(double *)&__int128 v37 = v6;
  *((double *)&v37 + 1) = v7;
  __int128 v34 = v36;
  __int128 v35 = v37;
  -[TVSPLayout setContentInsets:](v38, "setContentInsets:", v4, v5, v6, v7);
  v8 = v51;
  v51 = 0LL;
  v33.receiver = v8;
  v33.super_class = (Class)&OBJC_CLASS___TVSSPrivacyPlatterController;
  v51 = -[TVSSPrivacyPlatterController initWithIdentifier:layout:renderers:]( &v33,  "initWithIdentifier:layout:renderers:",  location[0],  v38,  v47);
  objc_storeStrong((id *)&v51, v51);
  v10 = v51;
  objc_storeStrong((id *)&v38, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v51, 0LL);
  return v10;
}

- (id)_itemsForGroup:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v12 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
  id v28 = -[NSUUID UUIDString](v12, "UUIDString");

  id v27 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", v28);
  id v26 =  +[_TVSSPrivacyAttributionGroupTitleRenderer rendererWithIdentifier:group:]( &OBJC_CLASS____TVSSPrivacyAttributionGroupTitleRenderer,  "rendererWithIdentifier:group:",  v28,  location[0]);
  id v25 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 14.0);
  id v24 = -[_TVSSPrivacyPlatterControllerItem initWithRow:renderer:]( objc_alloc(&OBJC_CLASS____TVSSPrivacyPlatterControllerItem),  "initWithRow:renderer:",  v25,  0LL);
  -[NSMutableArray addObject:](v29, "addObject:", v24);
  id v23 = -[_TVSSPrivacyPlatterControllerItem initWithRow:renderer:]( objc_alloc(&OBJC_CLASS____TVSSPrivacyPlatterControllerItem),  "initWithRow:renderer:",  v27,  v26);
  -[NSMutableArray addObject:](v29, "addObject:", v23);
  +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
  id v22 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  id v21 = -[_TVSSPrivacyPlatterControllerItem initWithRow:renderer:]( objc_alloc(&OBJC_CLASS____TVSSPrivacyPlatterControllerItem),  "initWithRow:renderer:",  v22,  0LL);
  -[NSMutableArray addObject:](v29, "addObject:", v21);
  memset(__b, 0, sizeof(__b));
  id obj = [location[0] items];
  id v14 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
  if (v14)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0LL;
    id v11 = v14;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(__b[1] + 8 * v10);
      double v6 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
      id v18 = -[NSUUID UUIDString](v6, "UUIDString");

      double v7 = v18;
      +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
      id v17 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", v7);
      id v16 =  +[_TVSSPrivacyAttributionItemRenderer rendererWithIdentifier:item:]( &OBJC_CLASS____TVSSPrivacyAttributionItemRenderer,  "rendererWithIdentifier:item:",  v18,  v20);
      v3 = objc_alloc(&OBJC_CLASS____TVSSPrivacyPlatterControllerItem);
      id v15 = -[_TVSSPrivacyPlatterControllerItem initWithRow:renderer:](v3, "initWithRow:renderer:", v17, v16);
      -[NSMutableArray addObject:](v29, "addObject:", v15);
      objc_storeStrong((id *)&v15, 0LL);
      objc_storeStrong((id *)&v16, 0LL);
      objc_storeStrong((id *)&v17, 0LL);
      objc_storeStrong((id *)&v18, 0LL);
      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0LL;
        id v11 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  double v5 = v29;
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong((id *)&v29, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

@end