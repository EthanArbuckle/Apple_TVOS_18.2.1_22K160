@interface TVPPhotosUIViewController
- (BOOL)initialSyncComplete;
- (PXCPLUIStatusProvider)statusProvider;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryStatusProvider)libraryStatusProvider;
- (TVPPhotosUIViewController)initWithConfiguration:(id)a3;
- (TVPPhotosUIViewController)initWithConfiguration:(id)a3 photoLibrary:(id)a4 libraryFilterState:(id)a5;
- (UIView)loadingView;
- (int64_t)tabMode;
- (void)_dismissAllLoadingAndEmptyViews;
- (void)_dismissEmptyView;
- (void)_dismissLoadingView;
- (void)_displayEmptyOrLoadingMessageIfNeeded;
- (void)_displayLoadingView;
- (void)_updateCPLStatus;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setInitialSyncComplete:(BOOL)a3;
- (void)setLibraryFilterState:(id)a3;
- (void)setLibraryStatusProvider:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setStatusProvider:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVPPhotosUIViewController

- (TVPPhotosUIViewController)initWithConfiguration:(id)a3 photoLibrary:(id)a4 libraryFilterState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVPPhotosUIViewController;
  v10 = -[TVPPhotosUIViewController initWithConfiguration:](&v17, "initWithConfiguration:", a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_libraryFilterState, a5);
    -[PXLibraryFilterState registerChangeObserver:context:]( v11->_libraryFilterState,  "registerChangeObserver:context:",  v11,  off_100101728);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:]( &OBJC_CLASS___PXSharedLibraryStatusProvider,  "sharedLibraryStatusProviderWithPhotoLibrary:",  v8));
    libraryStatusProvider = v11->_libraryStatusProvider;
    v11->_libraryStatusProvider = (PXSharedLibraryStatusProvider *)v12;

    v14 = -[PXCPLUIStatusProvider initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___PXCPLUIStatusProvider),  "initWithPhotoLibrary:",  v8);
    statusProvider = v11->_statusProvider;
    v11->_statusProvider = v14;

    -[PXCPLUIStatusProvider registerChangeObserver:context:]( v11->_statusProvider,  "registerChangeObserver:context:",  v11,  off_100101730);
  }

  return v11;
}

- (TVPPhotosUIViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v6,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPPhotosUIViewController.m",  57,  @"%s is not available as initializer",  "-[TVPPhotosUIViewController initWithConfiguration:]");

  abort();
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPPhotosUIViewController;
  -[TVPPhotosUIViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController viewModel](self, "viewModel"));
  [v3 registerChangeObserver:self context:off_100101738];
  -[TVPPhotosUIViewController _displayEmptyOrLoadingMessageIfNeeded](self, "_displayEmptyOrLoadingMessageIfNeeded");
  -[TVPPhotosUIViewController _updateCPLStatus](self, "_updateCPLStatus");
}

- (void)_updateCPLStatus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController statusProvider](self, "statusProvider"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 status]);

  if (![v4 state])
  {
    -[TVPPhotosUIViewController setInitialSyncComplete:]( self,  "setInitialSyncComplete:",  [v4 hasCompletedInitialSync]);
    -[TVPPhotosUIViewController _displayEmptyOrLoadingMessageIfNeeded](self, "_displayEmptyOrLoadingMessageIfNeeded");
  }
}

- (void)_displayLoadingView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController loadingView](self, "loadingView"));

  if (!v3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController view](self, "view"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"TVPLoadingStateTitle" value:&stru_1000CC6C8 table:0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities embedPhotosLoadingViewInView:topMargin:message:]( &OBJC_CLASS___TVPUIUtilities,  "embedPhotosLoadingViewInView:topMargin:message:",  v7,  v5,  0.0));
    -[TVPPhotosUIViewController setLoadingView:](self, "setLoadingView:", v6);
  }

- (void)_dismissLoadingView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController loadingView](self, "loadingView"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController loadingView](self, "loadingView"));
    [v4 removeFromSuperview];

    -[TVPPhotosUIViewController setLoadingView:](self, "setLoadingView:", 0LL);
  }

- (void)_dismissEmptyView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController view](self, "view"));
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewInView:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewInView:",  v2));

  v3 = v4;
  if (v4)
  {
    [v4 removeFromSuperview];
    v3 = v4;
  }
}

- (void)_dismissAllLoadingAndEmptyViews
{
}

- (void)_displayEmptyOrLoadingMessageIfNeeded
{
  id v49 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController viewModel](self, "viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v49 currentDataSource]);
  unsigned __int8 v4 = -[TVPPhotosUIViewController initialSyncComplete](self, "initialSyncComplete");
  unsigned __int8 v5 = [v3 containsAnyItems];
  char v6 = v5;
  if ((v4 & 1) == 0 && (v5 & 1) == 0)
  {
    -[TVPPhotosUIViewController _dismissEmptyView](self, "_dismissEmptyView");
    -[TVPPhotosUIViewController _displayLoadingView](self, "_displayLoadingView");
    goto LABEL_15;
  }

  -[TVPPhotosUIViewController _dismissAllLoadingAndEmptyViews](self, "_dismissAllLoadingAndEmptyViews");
  if ([v49 emptyPlaceholderState] == (id)3) {
    char v7 = v6;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController view](self, "view"));
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"TVPMomentsEmptyTitle" value:&stru_1000CC6C8 table:0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"TVPMomentsEmptyMessage" value:&stru_1000CC6C8 table:0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewWithBounds:title:messageFormat:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewWithBounds:title:messageFormat:",  v18,  v20,  v10,  v12,  v14,  v16));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController libraryStatusProvider](self, "libraryStatusProvider"));
    LODWORD(v17) = [v22 hasSharedLibrary];

    if ((_DWORD)v17)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController libraryFilterState](self, "libraryFilterState"));
      id v24 = [v23 viewMode];

      if ((unint64_t)v24 < 2)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController view](self, "view"));
        [v25 bounds];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        uint64_t v35 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_tvOS_EmptyLibraries_Title", v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v38 = @"PXSharedLibrary_tvOS_EmptyBothOrPersonal_Message";
LABEL_13:
        uint64_t v45 = PXLocalizedSharedLibraryString(v38, v36);
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        uint64_t v47 = objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewWithBounds:title:messageFormat:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewWithBounds:title:messageFormat:",  v37,  v46,  v27,  v29,  v31,  v33));

        v21 = (void *)v47;
        goto LABEL_14;
      }

      if (v24 == (id)2)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController view](self, "view"));
        [v25 bounds];
        double v27 = v39;
        double v29 = v40;
        double v31 = v41;
        double v33 = v42;
        uint64_t v44 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_tvOS_EmptyLibraries_Title", v43);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v44);
        v38 = @"PXSharedLibrary_tvOS_EmptyShared_Message";
        goto LABEL_13;
      }
    }

- (int64_t)tabMode
{
  return 0LL;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if (off_100101738 == a5)
  {
    if ((a4 & 0x200000001LL) != 0) {
      -[TVPPhotosUIViewController _displayEmptyOrLoadingMessageIfNeeded](self, "_displayEmptyOrLoadingMessageIfNeeded");
    }
  }

  else if (off_100101730 == a5)
  {
    if ((a4 & 0x10000) != 0) {
      -[TVPPhotosUIViewController _updateCPLStatus](self, "_updateCPLStatus");
    }
  }

  else if (off_100101728 == a5)
  {
    if ((a4 & 1) != 0)
    {
      -[TVPPhotosUIViewController _displayEmptyOrLoadingMessageIfNeeded](self, "_displayEmptyOrLoadingMessageIfNeeded");
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController contentController](self, "contentController"));
      [v9 scrollToInitialPositionAnimated:0 withCompletionHandler:0];
    }
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___TVPPhotosUIViewController;
    -[TVPPhotosUIViewController observable:didChange:context:](&v10, "observable:didChange:context:", v8, a4, a5);
  }
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (PXCPLUIStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void)setStatusProvider:(id)a3
{
}

- (BOOL)initialSyncComplete
{
  return self->_initialSyncComplete;
}

- (void)setInitialSyncComplete:(BOOL)a3
{
  self->_initialSyncComplete = a3;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setLibraryFilterState:(id)a3
{
}

- (PXSharedLibraryStatusProvider)libraryStatusProvider
{
  return self->_libraryStatusProvider;
}

- (void)setLibraryStatusProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end