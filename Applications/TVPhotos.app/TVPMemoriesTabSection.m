@interface TVPMemoriesTabSection
- (BOOL)updateSnapshotWithResolver:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (PXLibraryFilterState)libraryFilterState;
- (PXSectionedDataSourceManager)dataSourceManager;
- (TVPMemoriesTabSection)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4;
- (TVPMemoriesTabSectionDelegate)delegate;
- (TVPMemoriesTabSectionItems)snapshot;
- (TVPMemoriesTabSpecManager)specManager;
- (id)_flattenedChangeDetailsFromSectionedChangeDetails:(id)a3;
- (id)_makeSnapshotWithDataSource:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setSpecManager:(id)a3;
@end

@implementation TVPMemoriesTabSection

- (TVPMemoriesTabSection)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabSection;
  v9 = -[TVPMemoriesTabSection init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_libraryFilterState, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection _makeDataSourceManager](v10, "_makeDataSourceManager"));
    dataSourceManager = v10->_dataSourceManager;
    v10->_dataSourceManager = (PXSectionedDataSourceManager *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PXSectionedDataSourceManager dataSource](v10->_dataSourceManager, "dataSource"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection _makeSnapshotWithDataSource:](v10, "_makeSnapshotWithDataSource:", v13));
    snapshot = v10->_snapshot;
    v10->_snapshot = (TVPMemoriesTabSectionItems *)v14;

    -[PXSectionedDataSourceManager registerChangeObserver:context:]( v10->_dataSourceManager,  "registerChangeObserver:context:",  v10,  0LL);
    v16 = objc_alloc_init(&OBJC_CLASS___TVPMemoriesTabSpecManager);
    specManager = v10->_specManager;
    v10->_specManager = v16;

    -[PXLibraryFilterState registerChangeObserver:context:]( v10->_libraryFilterState,  "registerChangeObserver:context:",  v10,  off_100101F20);
  }

  return v10;
}

- (BOOL)updateSnapshotWithResolver:(id)a3
{
  v4 = (void (**)(id, void *, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection snapshot](self, "snapshot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dataSource]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection dataSourceManager](self, "dataSourceManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dataSource]);

  if (v6 != v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection dataSourceManager](self, "dataSourceManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 changeDetailsFromDataSource:v6 toDataSource:v8]);

    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[TVPMemoriesTabSection _flattenedChangeDetailsFromSectionedChangeDetails:]( self,  "_flattenedChangeDetailsFromSectionedChangeDetails:",  v10));
    if (!v4) {
      sub_100079C54();
    }
    v12 = (void *)v11;
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100039404;
    v14[3] = &unk_1000C9AF0;
    objc_copyWeak(&v16, &location);
    id v15 = v8;
    v4[2](v4, v12, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v6 != v8;
}

- (id)_flattenedChangeDetailsFromSectionedChangeDetails:(id)a3
{
  return [a3 itemChangesInSection:0];
}

- (id)_makeSnapshotWithDataSource:(id)a3
{
  id v3 = a3;
  v4 = -[TVPMemoriesTabSectionItems initWithDataSource:]( objc_alloc(&OBJC_CLASS___TVPMemoriesTabSectionItems),  "initWithDataSource:",  v3);

  return v4;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSection delegate](self, "delegate", a3, a4, a5));
  [v6 sectionHasUpdates:self];
}

- (TVPMemoriesTabSectionItems)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (TVPMemoriesTabSectionDelegate)delegate
{
  return (TVPMemoriesTabSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (TVPMemoriesTabSpecManager)specManager
{
  return self->_specManager;
}

- (void)setSpecManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end