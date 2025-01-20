@interface DVTTVHangsDetailViewController
+ (id)durationFormatter;
- (DVTTVHangsDetailFacade)hangTracerDetailsFacade;
- (DVTTVHangsDetailViewController)initWithHangsDataEntries:(id)a3;
- (TSKPreviewViewController)logPreviewViewController;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)setHangTracerDetailsFacade:(id)a3;
- (void)setLogPreviewViewController:(id)a3;
- (void)shareFile:(id)a3;
@end

@implementation DVTTVHangsDetailViewController

+ (id)durationFormatter
{
  if (qword_1E680 != -1) {
    dispatch_once(&qword_1E680, &stru_18888);
  }
  return (id)qword_1E678;
}

- (DVTTVHangsDetailViewController)initWithHangsDataEntries:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DVTTVHangsDetailViewController;
  v5 = -[DVTTVHangsDetailViewController init](&v9, "init");
  if (v5)
  {
    v6 = -[DVTTVHangsDetailFacade initWithLogEntries:]( objc_alloc(&OBJC_CLASS___DVTTVHangsDetailFacade),  "initWithLogEntries:",  v4);
    hangTracerDetailsFacade = v5->_hangTracerDetailsFacade;
    v5->_hangTracerDetailsFacade = v6;
  }

  return v5;
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsDetailFacade hangsDataEntries](self->_hangTracerDetailsFacade, "hangsDataEntries"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
  -[DVTTVHangsDetailViewController setTitle:](self, "setTitle:", v5);

  uint64_t v6 = HTUIDurationLabel();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v7,  0LL,  v4,  @"durationMeasurement"));

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[DVTTVHangsDetailViewController durationFormatter]( &OBJC_CLASS___DVTTVHangsDetailViewController,  "durationFormatter"));
  [v8 setLocalizedValueFormatter:v9];

  uint64_t v10 = HTUITimestampLabel();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v11,  0LL,  v4,  @"creationDate"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[HTHangsDataEntry dateFormatter](&OBJC_CLASS___HTHangsDataEntry, "dateFormatter"));
  [v12 setLocalizedValueFormatter:v13];

  v27[0] = v8;
  v27[1] = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v14));

  id inited = objc_initWeak(&location, self);
  uint64_t v17 = HTUILogsSectionTitle(inited);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  hangTracerDetailsFacade = self->_hangTracerDetailsFacade;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_D778;
  v23[3] = &unk_18900;
  objc_copyWeak(&v24, &location);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v18,  hangTracerDetailsFacade,  @"hangsDataEntries",  v23));

  v26[0] = v15;
  v26[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v21;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsDetailViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 representedObject]);
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___HTHangsDataEntry);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    logPreviewViewController = self->_logPreviewViewController;
    if (!logPreviewViewController)
    {
      v11 = (TSKPreviewViewController *)objc_claimAutoreleasedReturnValue( +[DVTTVHangsMainViewController hangLogPreviewViewControllerForHangsDataEntry:]( &OBJC_CLASS___DVTTVHangsMainViewController,  "hangLogPreviewViewControllerForHangsDataEntry:",  v6));
      v12 = self->_logPreviewViewController;
      self->_logPreviewViewController = v11;

      logPreviewViewController = self->_logPreviewViewController;
    }

    v13 = logPreviewViewController;
  }

  else
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___DVTTVHangsDetailViewController;
    id v14 = -[DVTTVHangsDetailViewController previewForItemAtIndexPath:](&v17, "previewForItemAtIndexPath:", v4);
    v13 = (TSKPreviewViewController *)objc_claimAutoreleasedReturnValue(v14);
  }

  v15 = v13;

  return v15;
}

- (void)shareFile:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v6, 0LL));
  objc_super v17 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

  id v9 = [[SFAirDropSharingViewControllerTV alloc] initWithSharingItems:v8];
  objc_initWeak(&location, v9);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_DDA0;
  id v14 = &unk_18928;
  objc_copyWeak(&v15, &location);
  [v9 setCompletionHandler:&v11];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[DVTTVHangsDetailViewController navigationController]( self,  "navigationController",  v11,  v12,  v13,  v14));
  [v10 presentViewController:v9 animated:1 completion:0];

  +[HTHangsAnalytics sendLogSharedEvent](&OBJC_CLASS___HTHangsAnalytics, "sendLogSharedEvent");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (DVTTVHangsDetailFacade)hangTracerDetailsFacade
{
  return self->_hangTracerDetailsFacade;
}

- (void)setHangTracerDetailsFacade:(id)a3
{
}

- (TSKPreviewViewController)logPreviewViewController
{
  return self->_logPreviewViewController;
}

- (void)setLogPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end