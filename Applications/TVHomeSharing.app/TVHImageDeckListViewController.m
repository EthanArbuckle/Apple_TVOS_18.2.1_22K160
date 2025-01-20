@interface TVHImageDeckListViewController
- (NSMutableDictionary)imageDeckViewControllerMap;
- (TVHImageDeckListViewController)initWithMediaLibrary:(id)a3;
- (TVHImageDeckListViewController)initWithMediaLibrary:(id)a3 listViewLayout:(id)a4;
- (id)_imageDeckViewControllerForPreviewFetchIdentifier:(id)a3;
- (id)mediaEntitiesListViewController:(id)a3 previewFetchDescriptorForIdentifier:(id)a4;
- (id)mediaEntitiesListViewController:(id)a3 previewFetchIdentifierForIndexPath:(id)a4;
- (id)mediaEntitiesListViewController:(id)a3 previewViewControllerForIndexPath:(id)a4;
- (void)mediaEntitiesListViewController:(id)a3 updatePreviewViewController:(id)a4 latestMediaEntitiesFetchResult:(id)a5 previousMediaEntitiesFetchResult:(id)a6 changeSet:(id)a7 context:(id)a8;
- (void)setImageDeckViewControllerMap:(id)a3;
@end

@implementation TVHImageDeckListViewController

- (TVHImageDeckListViewController)initWithMediaLibrary:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___TVHListViewLayout);
  -[TVHListViewLayout setItemSize:](v5, "setItemSize:", 388.0, 50.0);
  -[TVHListViewLayout setMinimumLineSpacing:](v5, "setMinimumLineSpacing:", 14.0);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHImageDeckListViewController;
  v6 = -[TVHMediaEntitiesListViewController initWithMediaLibrary:listViewLayout:]( &v8,  "initWithMediaLibrary:listViewLayout:",  v4,  v5);

  if (v6) {
    sub_10004AD5C(v6);
  }

  return v6;
}

- (TVHImageDeckListViewController)initWithMediaLibrary:(id)a3 listViewLayout:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHImageDeckListViewController;
  id v4 = -[TVHMediaEntitiesListViewController initWithMediaLibrary:listViewLayout:]( &v7,  "initWithMediaLibrary:listViewLayout:",  a3,  a4);
  v5 = v4;
  if (v4) {
    sub_10004AD5C(v4);
  }
  return v5;
}

- (id)mediaEntitiesListViewController:(id)a3 previewFetchIdentifierForIndexPath:(id)a4
{
  return 0LL;
}

- (id)mediaEntitiesListViewController:(id)a3 previewFetchDescriptorForIdentifier:(id)a4
{
  return 0LL;
}

- (id)mediaEntitiesListViewController:(id)a3 previewViewControllerForIndexPath:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController delegate](self, "delegate"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntitiesListViewController:self previewFetchIdentifierForIndexPath:v5]);

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVHImageDeckListViewController _imageDeckViewControllerForPreviewFetchIdentifier:]( self,  "_imageDeckViewControllerForPreviewFetchIdentifier:",  v7));
  return v8;
}

- (void)mediaEntitiesListViewController:(id)a3 updatePreviewViewController:(id)a4 latestMediaEntitiesFetchResult:(id)a5 previousMediaEntitiesFetchResult:(id)a6 changeSet:(id)a7 context:(id)a8
{
  id v17 = a4;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v17 imageProxies]);
  id v13 = [v12 count];
  if (a7 || !v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaEntities]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_fullSizeImageProxyForMediaEntities:mediaLibrary:]( &OBJC_CLASS___TVImageProxy,  "tvh_fullSizeImageProxyForMediaEntities:mediaLibrary:",  v14,  v15));

    [v17 setImageProxies:v16];
    v12 = (void *)v16;
  }
}

- (id)_imageDeckViewControllerForPreviewFetchIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHImageDeckListViewController imageDeckViewControllerMap](self, "imageDeckViewControllerMap"));
    v6 = (TVHImageDeckViewController *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
    if (!v6)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___TVHImageDeckViewController);
      -[TVHImageDeckViewController setCrossFadeImageViewMargin:]( v6,  "setCrossFadeImageViewMargin:",  0.0,  90.0,  0.0,  90.0);
      [v5 setObject:v6 forKey:v4];
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (NSMutableDictionary)imageDeckViewControllerMap
{
  return self->_imageDeckViewControllerMap;
}

- (void)setImageDeckViewControllerMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end