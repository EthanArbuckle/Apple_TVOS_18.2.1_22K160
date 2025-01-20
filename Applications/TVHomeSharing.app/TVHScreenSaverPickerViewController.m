@interface TVHScreenSaverPickerViewController
- (TVHKMediaCategoryTypesFetchController)fetchController;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHScreenSaverPickerListViewController)listViewController;
- (TVHScreenSaverPickerViewController)init;
- (TVHScreenSaverPickerViewController)initWithCoder:(id)a3;
- (TVHScreenSaverPickerViewController)initWithMediaLibrary:(id)a3;
- (TVHScreenSaverPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_showNoContentViewController;
- (void)controller:(id)a3 fetchDidCompleteWithResult:(id)a4;
- (void)setListViewController:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVHScreenSaverPickerViewController

- (TVHScreenSaverPickerViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHScreenSaverPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHScreenSaverPickerViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHScreenSaverPickerViewController)initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  if (!v5) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaLibrary");
  }
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVHScreenSaverPickerViewController;
  v6 = -[TVHScreenSaverPickerViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    p_mediaLibrary = &v6->_mediaLibrary;
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
    v9 = -[TVHKMediaCategoryTypesFetchController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHKMediaCategoryTypesFetchController),  "initWithMediaLibrary:",  *p_mediaLibrary);
    fetchController = v7->_fetchController;
    v7->_fetchController = v9;

    v11 = v7->_fetchController;
    v12 = (objc_class *)objc_opt_class(v7);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[TVHKMediaCategoryTypesFetchController setLogName:](v11, "setLogName:", v14);

    -[TVHKMediaCategoryTypesFetchController setDelegate:](v7->_fetchController, "setDelegate:", v7);
    -[TVHKMediaCategoryTypesFetchController enable](v7->_fetchController, "enable");
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryFetchControllerManager managerForMediaLibrary:]( &OBJC_CLASS___TVHKMediaLibraryFetchControllerManager,  "managerForMediaLibrary:",  *p_mediaLibrary));
    [v15 addFetchController:v7->_fetchController];
    v16 = objc_alloc_init(&OBJC_CLASS___TVHLoadingViewController);
    -[TVHScreenSaverPickerViewController tvh_setFullViewChildViewController:]( v7,  "tvh_setFullViewChildViewController:",  v16);
  }

  return v7;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHScreenSaverPickerViewController;
  -[TVHScreenSaverPickerViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  if ((-[TVHScreenSaverPickerViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[TVHScreenSaverPickerViewController isMovingFromParentViewController]( self,  "isMovingFromParentViewController"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPickerViewController fetchController](self, "fetchController"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPickerViewController mediaLibrary](self, "mediaLibrary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryFetchControllerManager managerForMediaLibrary:]( &OBJC_CLASS___TVHKMediaLibraryFetchControllerManager,  "managerForMediaLibrary:",  v5));

    [v6 removeFetchController:v4];
    [v4 cancel];
  }

- (void)controller:(id)a3 fetchDidCompleteWithResult:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "mediaCategoryTypes", a3));
  if ([v9 count])
  {
    id v5 = (TVHScreenSaverPickerListViewController *)objc_claimAutoreleasedReturnValue( -[TVHScreenSaverPickerViewController listViewController]( self,  "listViewController"));
    if (v5)
    {
      v6 = v5;
      -[TVHScreenSaverPickerListViewController updateWithMediaCategoryTypes:](v5, "updateWithMediaCategoryTypes:", v9);
    }

    else
    {
      objc_super v7 = objc_alloc(&OBJC_CLASS___TVHScreenSaverPickerListViewController);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPickerViewController mediaLibrary](self, "mediaLibrary"));
      v6 = -[TVHScreenSaverPickerListViewController initWithMediaLibrary:mediaCategoryTypes:]( v7,  "initWithMediaLibrary:mediaCategoryTypes:",  v8,  v9);

      -[TVHScreenSaverPickerViewController setListViewController:](self, "setListViewController:", v6);
      -[TVHScreenSaverPickerViewController tvh_setFullViewChildViewController:]( self,  "tvh_setFullViewChildViewController:",  v6);
    }
  }

  else
  {
    -[TVHScreenSaverPickerViewController _showNoContentViewController](self, "_showNoContentViewController");
  }
}

- (void)_showNoContentViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"EMPTY_LIBRARY_ERROR_MESSAGE" value:0 table:0]);

  v4 = -[TVHErrorViewController initWithMessage:]( objc_alloc(&OBJC_CLASS___TVHErrorViewController),  "initWithMessage:",  v5);
  -[TVHScreenSaverPickerViewController tvh_setFullViewChildViewController:]( self,  "tvh_setFullViewChildViewController:",  v4);
  -[TVHScreenSaverPickerViewController setListViewController:](self, "setListViewController:", 0LL);
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHKMediaCategoryTypesFetchController)fetchController
{
  return self->_fetchController;
}

- (TVHScreenSaverPickerListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setListViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end