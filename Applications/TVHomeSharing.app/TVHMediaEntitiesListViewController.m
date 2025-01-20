@interface TVHMediaEntitiesListViewController
- (NSCopying)currentPreviewFetchIdentifier;
- (NSMutableDictionary)previewFetchControllerForIdentifier;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMediaEntitiesListViewController)initWithItemSize:(CGSize)a3;
- (TVHMediaEntitiesListViewController)initWithListViewLayout:(id)a3;
- (TVHMediaEntitiesListViewController)initWithMediaLibrary:(id)a3 listViewLayout:(id)a4;
- (TVHMediaEntitiesListViewControllerDelegate)delegate;
- (id)_currentPreviewFetchController;
- (id)_previewViewControllerForIndexPath:(id)a3;
- (id)mediaEntitiesForPreviewFetchIdentifier:(id)a3;
- (void)_addPreviewFetchControllerForIdentifier:(id)a3;
- (void)_disableCurrentPreviewFetchController;
- (void)_enableCurrentPreviewFetchController;
- (void)_removeAllPreviewFetchControllers;
- (void)_removePreviewFetchControllerForIdentifier:(id)a3;
- (void)controller:(id)a3 didCompleteWithResult:(id)a4;
- (void)removePreviewFetchIdentifiers:(id)a3;
- (void)setCurrentPreviewFetchIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviewFetchControllerForIdentifier:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVHMediaEntitiesListViewController

- (TVHMediaEntitiesListViewController)initWithItemSize:(CGSize)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaEntitiesListViewController)initWithListViewLayout:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaEntitiesListViewController)initWithMediaLibrary:(id)a3 listViewLayout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaLibrary");
  }
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesListViewController;
  v9 = -[TVHPreviewingListViewController initWithListViewLayout:](&v15, "initWithListViewLayout:", v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, a3);
    objc_initWeak(&location, v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000407F0;
    v12[3] = &unk_1000FCF20;
    objc_copyWeak(&v13, &location);
    -[TVHPreviewingListViewController setAutoUpdatePreviewViewControllerBlock:]( v10,  "setAutoUpdatePreviewViewControllerBlock:",  v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      -[TVHMediaEntitiesListViewController _removeAllPreviewFetchControllers](self, "_removeAllPreviewFetchControllers");
    }
    objc_storeWeak((id *)&self->_delegate, obj);
  }
}

- (id)mediaEntitiesForPreviewFetchIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController previewFetchControllerForIdentifier]( self,  "previewFetchControllerForIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntitiesFetchResult]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntities]);

  return v8;
}

- (void)removePreviewFetchIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController previewFetchControllerForIdentifier]( self,  "previewFetchControllerForIdentifier"));
  [v5 removeObjectsForKeys:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesListViewController;
  -[TVHPreviewingListViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  if ((-[TVHMediaEntitiesListViewController isBeingPresented](self, "isBeingPresented") & 1) == 0
    && (-[TVHMediaEntitiesListViewController isMovingToParentViewController]( self,  "isMovingToParentViewController") & 1) == 0)
  {
    -[TVHMediaEntitiesListViewController _enableCurrentPreviewFetchController]( self,  "_enableCurrentPreviewFetchController");
  }

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesListViewController;
  -[TVHMediaEntitiesListViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if ((-[TVHMediaEntitiesListViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[TVHMediaEntitiesListViewController isMovingFromParentViewController]( self,  "isMovingFromParentViewController"))
  {
    -[TVHMediaEntitiesListViewController _removeAllPreviewFetchControllers](self, "_removeAllPreviewFetchControllers");
  }

  else
  {
    -[TVHMediaEntitiesListViewController _disableCurrentPreviewFetchController]( self,  "_disableCurrentPreviewFetchController");
  }

- (void)controller:(id)a3 didCompleteWithResult:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController previewViewController](self, "previewViewController"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController delegate](self, "delegate"));
  v9 = (void *)v8;
  if (v7)
  {
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvh_identifier"));
      unsigned int v12 = [v10 isEqual:v11];

      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 latestMediaEntitiesFetchResult]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v6 previousMediaEntitiesFetchResult]);
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v6 changeSet]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v17 context]);
        [v9 mediaEntitiesListViewController:self updatePreviewViewController:v7 latestMediaEntitiesFetchResult:v13 previousMediaEntiti esFetchResult:v14 changeSet:v15 context:v16];
      }
    }
  }
}

- (NSMutableDictionary)previewFetchControllerForIdentifier
{
  previewFetchControllerForIdentifier = self->_previewFetchControllerForIdentifier;
  if (!previewFetchControllerForIdentifier)
  {
    objc_super v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = self->_previewFetchControllerForIdentifier;
    self->_previewFetchControllerForIdentifier = v4;

    previewFetchControllerForIdentifier = self->_previewFetchControllerForIdentifier;
  }

  return previewFetchControllerForIdentifier;
}

- (void)setCurrentPreviewFetchIdentifier:(id)a3
{
  id v7 = a3;
  if ((-[NSCopying isEqual:](self->_currentPreviewFetchIdentifier, "isEqual:") & 1) == 0)
  {
    -[TVHMediaEntitiesListViewController _disableCurrentPreviewFetchController]( self,  "_disableCurrentPreviewFetchController");
    objc_super v4 = (NSCopying *)[v7 copy];
    currentPreviewFetchIdentifier = self->_currentPreviewFetchIdentifier;
    self->_currentPreviewFetchIdentifier = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController _currentPreviewFetchController]( self,  "_currentPreviewFetchController"));
    if (v6) {
      -[TVHMediaEntitiesListViewController _enableCurrentPreviewFetchController]( self,  "_enableCurrentPreviewFetchController");
    }
    else {
      -[TVHMediaEntitiesListViewController _addPreviewFetchControllerForIdentifier:]( self,  "_addPreviewFetchControllerForIdentifier:",  self->_currentPreviewFetchIdentifier);
    }
  }
}

- (void)_removeAllPreviewFetchControllers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController previewFetchControllerForIdentifier]( self,  "previewFetchControllerForIdentifier"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[TVHMediaEntitiesListViewController _removePreviewFetchControllerForIdentifier:]( self,  "_removePreviewFetchControllerForIdentifier:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9),  (void)v10);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)_removePreviewFetchControllerForIdentifier:(id)a3
{
  id v7 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController previewFetchControllerForIdentifier]( self,  "previewFetchControllerForIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v7]);
  id v6 = v5;
  if (v5)
  {
    [v5 invalidate];
    [v4 removeObjectForKey:v7];
  }
}

- (void)_addPreviewFetchControllerForIdentifier:(id)a3
{
  id v9 = a3;
  -[TVHMediaEntitiesListViewController _removePreviewFetchControllerForIdentifier:]( self,  "_removePreviewFetchControllerForIdentifier:");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController delegate](self, "delegate"));
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaEntitiesListViewController:self previewFetchDescriptorForIdentifier:v9]);
    if (v6)
    {
      id v7 = -[TVHMediaEntityPreviewFetchController initWithFetchDescriptor:]( objc_alloc(&OBJC_CLASS___TVHMediaEntityPreviewFetchController),  "initWithFetchDescriptor:",  v6);
      -[TVHMediaEntityPreviewFetchController setDelegate:](v7, "setDelegate:", self);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController previewFetchControllerForIdentifier]( self,  "previewFetchControllerForIdentifier"));
      [v8 setObject:v7 forKey:v9];
    }
  }
}

- (void)_enableCurrentPreviewFetchController
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController _currentPreviewFetchController]( self,  "_currentPreviewFetchController"));
  [v2 enable];
}

- (void)_disableCurrentPreviewFetchController
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController _currentPreviewFetchController]( self,  "_currentPreviewFetchController"));
  [v2 disable];
}

- (id)_currentPreviewFetchController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController previewFetchControllerForIdentifier]( self,  "previewFetchControllerForIdentifier"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController currentPreviewFetchIdentifier]( self,  "currentPreviewFetchIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4]);

  return v5;
}

- (id)_previewViewControllerForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController delegate](self, "delegate"));
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntitiesListViewController:self previewFetchIdentifierForIndexPath:v4]);
    -[TVHMediaEntitiesListViewController setCurrentPreviewFetchIdentifier:]( self,  "setCurrentPreviewFetchIdentifier:",  v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntitiesListViewController:self previewViewControllerForIndexPath:v4]);
    objc_msgSend(v8, "tvh_setIdentifier:", v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesListViewController _currentPreviewFetchController]( self,  "_currentPreviewFetchController"));
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaEntitiesFetchControllerIdentifier]);
    objc_msgSend(v8, "tvh_setFetchControllerIdentifier:", v10);

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaEntitiesFetchResult]);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 context]);
    [v6 mediaEntitiesListViewController:self updatePreviewViewController:v8 latestMediaEntitiesFetchResult:v11 previousMediaEntitiesFe tchResult:0 changeSet:0 context:v12];
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHMediaEntitiesListViewControllerDelegate)delegate
{
  return (TVHMediaEntitiesListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setPreviewFetchControllerForIdentifier:(id)a3
{
}

- (NSCopying)currentPreviewFetchIdentifier
{
  return self->_currentPreviewFetchIdentifier;
}

- (void).cxx_destruct
{
}

@end