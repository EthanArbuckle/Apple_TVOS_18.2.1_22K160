@interface TVSSSleepTimerPanelPlatterController
- (NSDictionary)sleepRequestsByIdentifier;
- (TVSSSleepTimerController)sleepTimerController;
- (TVSSSleepTimerPanelPlatterController)initWithSleepTimerController:(id)a3;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)setSleepRequestsByIdentifier:(id)a3;
- (void)setSleepTimerController:(id)a3;
@end

@implementation TVSSSleepTimerPanelPlatterController

- (TVSSSleepTimerPanelPlatterController)initWithSleepTimerController:(id)a3
{
  id v66 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v46 = TVSSLocString(@"TVSSSleepTimerPanelTitle");
  v45 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v44 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Sleep Timer",  2LL);
  v68[0] = v44;
  v43 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Separator",  19LL,  0LL);
  v68[1] = v43;
  v42 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:", @"Temp");
  v41 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Temp",  18LL);
  v68[2] = v41;
  v40 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:", @"Temp2");
  v39 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Temp2",  18LL);
  v68[3] = v39;
  v38 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:", @"Temp3");
  v37 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Temp3",  18LL);
  v68[4] = v37;
  v36 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:", @"Temp4");
  v35 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Temp4",  18LL);
  v68[5] = v35;
  id v64 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 6LL);

  id v63 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v62 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v34 = v62;
  v33 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Sleep Timer");
  objc_msgSend(v34, "addObject:");

  id v32 = v62;
  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v31 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", v3);
  objc_msgSend(v32, "addObject:");

  id v30 = v62;
  id v29 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"Separator");
  objc_msgSend(v30, "addObject:");

  id v28 = v62;
  +[TVSPConstants topSpacerHeight](&OBJC_CLASS___TVSPConstants, "topSpacerHeight");
  id v27 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", v4);
  objc_msgSend(v28, "addObject:");

  memset(__b, 0, sizeof(__b));
  id obj = [location[0] availableScheduledSleepRequests];
  id v26 = [obj countByEnumeratingWithState:__b objects:v67 count:16];
  if (v26)
  {
    uint64_t v22 = *(void *)__b[2];
    uint64_t v23 = 0LL;
    id v24 = v26;
    while (1)
    {
      uint64_t v21 = v23;
      if (*(void *)__b[2] != v22) {
        objc_enumerationMutation(obj);
      }
      id v61 = *(id *)(__b[1] + 8 * v23);
      id v20 = v62;
      id v19 = [v61 localizedValue];
      +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
      v18 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", v19, v5);
      objc_msgSend(v20, "addObject:");

      id v16 = v61;
      id v17 = v63;
      id v15 = [v61 localizedValue];
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16);

      ++v23;
      if (v21 + 1 >= (unint64_t)v24)
      {
        uint64_t v23 = 0LL;
        id v24 = [obj countByEnumeratingWithState:__b objects:v67 count:16];
        if (!v24) {
          break;
        }
      }
    }
  }

  id v59 =  +[TVSPLayout layoutWithRows:sizeProviders:]( &OBJC_CLASS___TVSPLayout,  "layoutWithRows:sizeProviders:",  v62,  v64);
  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  *(void *)&__int128 v14 = v6;
  *((void *)&v14 + 1) = v7;
  __int128 v57 = v14;
  *(void *)&__int128 v58 = v8;
  *((void *)&v58 + 1) = v9;
  __int128 v55 = v14;
  __int128 v56 = v58;
  objc_msgSend(v59, "setContentInsets:", v14, v58);
  id v10 = v66;
  id v66 = 0LL;
  v54.receiver = v10;
  v54.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerPanelPlatterController;
  id v66 = -[TVSSSleepTimerPanelPlatterController initWithIdentifier:layout:renderers:rendererProvider:]( &v54,  "initWithIdentifier:layout:renderers:rendererProvider:",  @"SleepTimerPlatter",  v59,  v64,  0LL);
  objc_storeStrong(&v66, v66);
  if (v66)
  {
    objc_initWeak(&from, v66);
    id v13 = v66;
    v47 = _NSConcreteStackBlock;
    int v48 = -1073741824;
    int v49 = 0;
    v50 = sub_10002C914;
    v51 = &unk_1001B6940;
    objc_copyWeak(&v52, &from);
    [v13 setRendererProvider:&v47];
    [v66 setSleepTimerController:location[0]];
    [v66 setSleepRequestsByIdentifier:v63];
    objc_destroyWeak(&v52);
    objc_destroyWeak(&from);
  }

  v12 = (TVSSSleepTimerPanelPlatterController *)v66;
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(&v63, 0LL);
  objc_storeStrong(&v64, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v66, 0LL);
  return v12;
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  uint64_t v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  v18.receiver = v21;
  v18.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerPanelPlatterController;
  -[TVSSSleepTimerPanelPlatterController rendererWasSelected:context:]( &v18,  "rendererWasSelected:context:",  location[0],  v19);
  id v17 = [location[0] identifier];
  uint64_t v7 = -[TVSSSleepTimerPanelPlatterController sleepRequestsByIdentifier](v21, "sleepRequestsByIdentifier");
  id v16 = -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v17);

  objc_initWeak(&from, v21);
  double v5 = -[TVSSSleepTimerPanelPlatterController sleepTimerController](v21, "sleepTimerController");
  id v4 = v16;
  uint64_t v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_10002CC94;
  v12 = &unk_1001B6AA8;
  objc_copyWeak(v14, &from);
  id v13 = v19;
  -[TVSSSleepTimerController scheduleSleepWithRequest:completion:](v5, "scheduleSleepWithRequest:completion:", v4, &v8);

  objc_storeStrong(&v13, 0LL);
  objc_destroyWeak(v14);
  objc_destroyWeak(&from);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSSleepTimerController)sleepTimerController
{
  return self->_sleepTimerController;
}

- (void)setSleepTimerController:(id)a3
{
}

- (NSDictionary)sleepRequestsByIdentifier
{
  return self->_sleepRequestsByIdentifier;
}

- (void)setSleepRequestsByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end