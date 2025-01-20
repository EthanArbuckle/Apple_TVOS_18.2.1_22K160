@interface TVPMemoriesTabSectionItems
- (PXSectionedDataSource)dataSource;
- (TVPMemoriesTabSectionItems)initWithDataSource:(id)a3;
- (id)objectReferenceAtIndex:(int64_t)a3;
- (int64_t)numberOfItems;
@end

@implementation TVPMemoriesTabSectionItems

- (TVPMemoriesTabSectionItems)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabSectionItems;
  v6 = -[TVPMemoriesTabSectionItems init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (int64_t)numberOfItems
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSectionItems dataSource](self, "dataSource"));
  id v4 = [v3 numberOfSections];

  if (v4 != (id)1)
  {
    uint64_t Log = PXAssertGetLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100079CF8(v6);
    }
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSectionItems dataSource](self, "dataSource"));
  id v8 = [v7 numberOfSections];

  if (v8 != (id)1) {
    return 0LL;
  }
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSectionItems dataSource](self, "dataSource"));
  id v10 = [v9 numberOfItemsInSection:0];

  return (int64_t)v10;
}

- (id)objectReferenceAtIndex:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  a3,  0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSectionItems dataSource](self, "dataSource"));
  v8[0] = [v5 identifier];
  v8[1] = [v4 section];
  v8[2] = [v4 item];
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectReferenceAtIndexPath:v8]);

  return v6;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

@end