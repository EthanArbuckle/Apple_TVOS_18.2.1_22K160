@interface SATVRegionViewController
- (BYLocaleDataSource)localeDataSource;
- (NSArray)otherCountriesSectionIndexKeys;
- (NSArray)otherCountriesSectionIndexTitles;
- (NSDictionary)otherCountriesSectionIndex;
- (SATVInternationalUtility)internationalUtility;
- (SATVRegionViewController)init;
- (SATVTableViewController)tableViewController;
- (_SATVRegionOtherCountriesContainerView)otherCountriesContainer;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_countryAtSectionIndexPath:(id)a3;
- (id)completionHandler;
- (id)indexPathForPreferredFocusedViewInTableView:(id)a3;
- (id)preferredFocusEnvironments;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)_configureSectionIndex;
- (void)autoAdvance;
- (void)countryScanCompleted:(id)a3;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)setInternationalUtility:(id)a3;
- (void)setLocaleDataSource:(id)a3;
- (void)setOtherCountriesContainer:(id)a3;
- (void)setOtherCountriesSectionIndex:(id)a3;
- (void)setOtherCountriesSectionIndexKeys:(id)a3;
- (void)setOtherCountriesSectionIndexTitles:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVRegionViewController

- (SATVRegionViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVRegionViewController;
  v2 = -[SATVRegionViewController init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    internationalUtility = v2->_internationalUtility;
    v2->_internationalUtility = (SATVInternationalUtility *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"countryScanCompleted:" name:BYCountryScanCompletedNotification object:0];
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVRegionViewController;
  -[SATVRegionViewController dealloc](&v4, "dealloc");
}

- (void)autoAdvance
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController internationalUtility](self, "internationalUtility"));
  [v3 setUserSetSystemRegionCode:@"US"];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController internationalUtility](self, "internationalUtility"));
  [v4 commitRegion];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController completionHandler](self, "completionHandler"));
  if (v5)
  {
    v6 = (void (**)(id, const __CFString *))objc_claimAutoreleasedReturnValue( -[SATVRegionViewController completionHandler]( self,  "completionHandler"));
    v6[2](v6, @"US");
  }

- (void)viewDidLoad
{
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___SATVRegionViewController;
  -[SATVRegionViewController viewDidLoad](&v43, "viewDidLoad");
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SATVTableViewController);
  -[SATVRegionViewController setTableViewController:](self, "setTableViewController:", v3);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  -[SATVRegionViewController tvsk_addChildViewController:](self, "tvsk_addChildViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tableView]);
  [v6 setDelegate:self];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tableView]);
  [v8 setDataSource:self];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 tableView]);
  [v10 setRemembersLastFocusedIndexPath:0];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 userSetSystemLanguageCode]);
  id v13 = +[BYLocaleDataSource newWithLanguage:](&OBJC_CLASS___BYLocaleDataSource, "newWithLanguage:", v12);
  -[SATVRegionViewController setLocaleDataSource:](self, "setLocaleDataSource:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tableView]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell, v16);
  v19 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell, v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v15 registerClass:v17 forCellReuseIdentifier:v21];

  v22 = objc_alloc(&OBJC_CLASS___SATVHeaderView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v26 = -[SATVHeaderView initWithFrame:](v22, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController internationalUtility](self, "internationalUtility"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 regionHeaderStringWithUserSelectedLanguageCode]);

  v29 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  CFStringRef v44 = kCTLanguageAttributeName;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](self, "localeDataSource"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 language]);
  v45 = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
  v33 = -[NSAttributedString initWithString:attributes:](v29, "initWithString:attributes:", v28, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v26, "titleLabel"));
  [v34 setAttributedText:v33];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController internationalUtility](self, "internationalUtility"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 userSetSystemLanguageCode]);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v26, "titleLabel"));
  [v37 setAccessibilityLanguage:v36];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  [v38 setBannerView:v26];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  [v39 setMaxBannerViewWidth:720.0];

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  [v40 setCustomContentTopInset:127.0];

  -[SATVRegionViewController _configureSectionIndex](self, "_configureSectionIndex");
  v41 = -[_SATVRegionOtherCountriesContainerView initWithFrame:]( objc_alloc(&OBJC_CLASS____SATVRegionOtherCountriesContainerView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  otherCountriesContainer = self->_otherCountriesContainer;
  self->_otherCountriesContainer = v41;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVRegionViewController;
  -[SATVRegionViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[SATVRegionViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  2LL,  2LL);
}

- (id)preferredFocusEnvironments
{
  if (self->_tableViewController)
  {
    tableViewController = self->_tableViewController;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &tableViewController,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)countryScanCompleted:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 removeObserver:self name:BYCountryScanCompletedNotification object:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](self, "localeDataSource"));
  [v5 performSelector:"reloadData"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tableView]);
  [v7 reloadSections:v10 withRowAnimation:100];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  [v8 setNeedsFocusUpdate];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController tableViewController](self, "tableViewController"));
  [v9 updateFocusIfNeeded];
}

- (id)_countryAtSectionIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndex:]( self->_otherCountriesSectionIndexKeys,  "objectAtIndex:",  (char *)[v4 section] - 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_otherCountriesSectionIndex, "objectForKey:", v5));
    id v7 = [v4 row];

    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v7]);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](self, "localeDataSource"));
    id v9 = [v4 row];

    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 recommendedLocaleAtIndex:v9]);
  }

  return v8;
}

- (void)_configureSectionIndex
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](self, "localeDataSource"));
  v5 = (char *)[v4 numberOfOtherLocales];

  v60 = self;
  if (v5)
  {
    for (i = 0LL; i != v5; ++i)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](self, "localeDataSource"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 otherLocaleAtIndex:i]);

      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
      id v10 = [v9 sectionForObject:v8 collationStringSelector:"name"];

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v3, "objectForKey:", v11));

      if (v12)
      {
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 arrayByAddingObject:v8]);
      }

      else
      {
        v72 = v8;
        uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v72, 1LL));
      }

      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, v15);

      self = v60;
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](self, "localeDataSource"));
  id v18 = [v17 numberOfRecommendedLocales];

  if (v18)
  {
    unint64_t v19 = 0LL;
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](self, "localeDataSource"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 recommendedLocaleAtIndex:v19]);

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
      id v23 = [v22 sectionForObject:v21 collationStringSelector:"name"];

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v3, "objectForKey:", v24));

      if (v25)
      {
        uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 arrayByAddingObject:v21]);
      }

      else
      {
        v71 = v21;
        uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v71, 1LL));
      }

      v27 = (void *)v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v27, v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23));
      [v16 addObject:v29];

      ++v19;
      self = v60;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](v60, "localeDataSource"));
      id v31 = [v30 numberOfRecommendedLocales];
    }

    while (v19 < (unint64_t)v31);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](self, "localeDataSource"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 language]);
  if ([v33 length])
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](self, "localeDataSource"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 language]);
    uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v35));

    if (!v36) {
      goto LABEL_24;
    }
    v59 = (void *)v36;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[BYLocaleCountry comparatorForLocale:](&OBJC_CLASS___BYLocaleCountry, "comparatorForLocale:", v36));
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id v37 = v16;
    id v38 = [v37 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v66;
      do
      {
        for (j = 0LL; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v66 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)j);
          objc_super v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v42));
          CFStringRef v44 = (void *)objc_claimAutoreleasedReturnValue([v43 sortedArrayUsingComparator:v33]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v44, v42);
        }

        id v39 = [v37 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }

      while (v39);
    }

    v32 = v59;
    self = v60;
  }

LABEL_24:
  objc_storeStrong((id *)&self->_otherCountriesSectionIndex, v3);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v3, "allKeys"));
  v46 = (void *)objc_claimAutoreleasedReturnValue([v45 sortedArrayUsingSelector:"compare:"]);

  v47 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v47 sectionIndexTitles]);

  v49 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v46 count]);
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  v50 = v46;
  id v51 = -[NSArray countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v61,  v69,  16LL);
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v62;
    do
    {
      for (k = 0LL; k != v52; k = (char *)k + 1)
      {
        if (*(void *)v62 != v53) {
          objc_enumerationMutation(v50);
        }
        v55 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v48,  "objectAtIndex:",  objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * (void)k), "unsignedIntegerValue")));
        -[NSMutableArray addObject:](v49, "addObject:", v55);
      }

      id v52 = -[NSArray countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v61,  v69,  16LL);
    }

    while (v52);
  }

  otherCountriesSectionIndexTitles = v60->_otherCountriesSectionIndexTitles;
  v60->_otherCountriesSectionIndexTitles = &v49->super;
  v57 = v49;

  otherCountriesSectionIndexKeys = v60->_otherCountriesSectionIndexKeys;
  v60->_otherCountriesSectionIndexKeys = v50;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  return self->_otherCountriesSectionIndexTitles;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return a5 + 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)-[NSArray count](self->_otherCountriesSectionIndexTitles, "count", a3) + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell, v8);
  id v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v11 forIndexPath:v6]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController _countryAtSectionIndexPath:](self, "_countryAtSectionIndexPath:", v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 textLabel]);
  [v15 setText:v14];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController internationalUtility](self, "internationalUtility"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 userSetSystemLanguageCode]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 textLabel]);
  [v18 setAccessibilityLanguage:v17];

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_otherCountriesSectionIndexKeys, "objectAtIndex:", a4 - 1));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_otherCountriesSectionIndex, "objectForKey:", v5));
    id v7 = [v6 count];
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController localeDataSource](self, "localeDataSource", a3));
    id v7 = [v5 numberOfRecommendedLocales];
  }

  return (int64_t)v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController _countryAtSectionIndexPath:](self, "_countryAtSectionIndexPath:", a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 code]);
  [v6 setUserSetSystemRegionCode:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController internationalUtility](self, "internationalUtility"));
  LOBYTE(v7) = [v8 commitLocaleWillRestartSystem];

  if ((v7 & 1) != 0)
  {
    v13[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100007B80;
    v14[3] = &unk_1000C9468;
    v14[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100007BB4;
    v13[3] = &unk_1000C9490;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v14,  v13,  0.3);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController internationalUtility](self, "internationalUtility"));
    [v9 commitRegion];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController completionHandler](self, "completionHandler"));
    if (v10)
    {
      v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[SATVRegionViewController completionHandler]( self,  "completionHandler"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v5 code]);
      ((void (**)(void, void *))v11)[2](v11, v12);
    }
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4 = 0.0;
  if (a4 == 1)
  {
    id v6 = a3;
    [v6 frame];
    double v8 = v7;
    [v6 layoutMargins];
    double v10 = v8 - v9;
    [v6 layoutMargins];
    double v12 = v11;

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRegionViewController otherCountriesContainer](self, "otherCountriesContainer"));
    objc_msgSend(v13, "sizeThatFits:", v10 - v12, 3.40282347e38);
    double v4 = v14;
  }

  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4 == 1) {
    return (id)objc_claimAutoreleasedReturnValue( -[SATVRegionViewController otherCountriesContainer]( self,  "otherCountriesContainer",  a3,  v4,  v5));
  }
  else {
    return 0LL;
  }
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  0,  (uint64_t)[a3 numberOfRowsInSection:0] < 1));
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BYLocaleDataSource)localeDataSource
{
  return self->_localeDataSource;
}

- (void)setLocaleDataSource:(id)a3
{
}

- (_SATVRegionOtherCountriesContainerView)otherCountriesContainer
{
  return self->_otherCountriesContainer;
}

- (void)setOtherCountriesContainer:(id)a3
{
}

- (NSArray)otherCountriesSectionIndexTitles
{
  return self->_otherCountriesSectionIndexTitles;
}

- (void)setOtherCountriesSectionIndexTitles:(id)a3
{
}

- (NSDictionary)otherCountriesSectionIndex
{
  return self->_otherCountriesSectionIndex;
}

- (void)setOtherCountriesSectionIndex:(id)a3
{
}

- (NSArray)otherCountriesSectionIndexKeys
{
  return self->_otherCountriesSectionIndexKeys;
}

- (void)setOtherCountriesSectionIndexKeys:(id)a3
{
}

- (SATVInternationalUtility)internationalUtility
{
  return self->_internationalUtility;
}

- (void)setInternationalUtility:(id)a3
{
}

- (SATVTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end