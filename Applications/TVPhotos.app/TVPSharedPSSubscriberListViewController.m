@interface TVPSharedPSSubscriberListViewController
+ (id)_sharedAlbumSubscribersFromAlbum:(id)a3;
- (CGSize)formSize;
- (NSArray)subscribersList;
- (PHAssetCollection)cloudSharedAlbum;
- (PLCloudSharedAlbum)pl_cloudSharedAlbum;
- (TVPSharedPSSubscribersView)subscribersView;
- (UITapGestureRecognizer)menuGestureRecognizer;
- (int)buttonIdentifier;
- (void)_onSelectActionButton:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
- (void)setButtonIdentifier:(int)a3;
- (void)setCloudSharedAlbum:(id)a3;
- (void)setMenuGestureRcognizer:(id)a3;
- (void)setMenuGestureRecognizer:(id)a3;
- (void)setPl_cloudSharedAlbum:(id)a3;
- (void)setSubscribersList:(id)a3;
- (void)setSubscribersView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVPSharedPSSubscriberListViewController

- (void)setMenuGestureRcognizer:(id)a3
{
}

- (void)setCloudSharedAlbum:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_cloudSharedAlbum, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAssetCollection pl_assetContainer](self->_cloudSharedAlbum, "pl_assetContainer"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___PLCloudSharedAlbum, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_pl_cloudSharedAlbum, v5);
    id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_sharedAlbumSubscribersFromAlbum:", self->_cloudSharedAlbum);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue(v9);
    subscribersList = self->_subscribersList;
    self->_subscribersList = v10;
  }
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVPSharedPSSubscriberListViewController;
  -[TVPSharedPSSubscriberListViewController viewDidLoad](&v28, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS___TVPSharedPSSubscribersView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSSubscriberListViewController view](self, "view"));
  [v4 bounds];
  float v6 = (v5 + -700.0) * 0.5;
  double v7 = floorf(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSSubscriberListViewController view](self, "view"));
  [v8 bounds];
  v10 = -[TVPSharedPSSubscribersView initWithFrame:](v3, "initWithFrame:", v7, 0.0, 700.0, v9 + -72.0);
  subscribersView = self->_subscribersView;
  self->_subscribersView = v10;

  id v12 = self->_subscribersView;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAssetCollection localizedTitle](self->_cloudSharedAlbum, "localizedTitle"));
  -[TVPSharedPSSubscribersView setTitle:](v12, "setTitle:", v13);

  LODWORD(v12) = -[PLCloudSharedAlbum isOwnedCloudSharedAlbum]( self->_pl_cloudSharedAlbum,  "isOwnedCloudSharedAlbum");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v15 = v14;
  if ((_DWORD)v12)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"deleteSharedAlbumStream" value:&stru_1000CC6C8 table:0]);

    v17 = self->_subscribersView;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedStringForKey:@"sharedByYou" value:&stru_1000CC6C8 table:0]);
    -[TVPSharedPSSubscribersView setSubtitle:](v17, "setSubtitle:", v19);

    self->_buttonIdentifier = 1;
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"UnsubscribeFromAlbum" value:&stru_1000CC6C8 table:0]);

    v20 = (void *)objc_claimAutoreleasedReturnValue( -[PLCloudSharedAlbum cloudOwnerDisplayNameIncludingEmail:allowsEmail:]( self->_pl_cloudSharedAlbum,  "cloudOwnerDisplayNameIncludingEmail:allowsEmail:",  0LL,  1LL));
    v21 = self->_subscribersView;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"sharedPersonString" value:&stru_1000CC6C8 table:0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v23, v20));
    -[TVPSharedPSSubscribersView setSubtitle:](v21, "setSubtitle:", v24);

    self->_buttonIdentifier = 2;
  }

  -[TVPSharedPSSubscribersView setActionButtonMessage:](self->_subscribersView, "setActionButtonMessage:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSSubscribersView actionButton](self->_subscribersView, "actionButton"));
  [v25 addTarget:self action:"_onSelectActionButton:" forControlEvents:0x2000];

  -[TVPSharedPSSubscribersView setSubscribers:](self->_subscribersView, "setSubscribers:", self->_subscribersList);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSSubscriberListViewController view](self, "view"));
  [v26 addSubview:self->_subscribersView];

  if (self->_menuGestureRecognizer)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSSubscriberListViewController view](self, "view"));
    [v27 addGestureRecognizer:self->_menuGestureRecognizer];
  }
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVPSharedPSSubscriberListViewController;
  -[TVPSharedPSSubscriberListViewController viewDidLayoutSubviews](&v12, "viewDidLayoutSubviews");
  -[TVPSharedPSSubscribersView sizeThatFits:]( self->_subscribersView,  "sizeThatFits:",  CGSizeZero.width,  CGSizeZero.height);
  double v4 = v3;
  -[TVPSharedPSSubscribersView frame](self->_subscribersView, "frame");
  if (v4 < v5)
  {
    -[TVPSharedPSSubscribersView frame](self->_subscribersView, "frame");
    double v7 = v6;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSSubscriberListViewController view](self, "view"));
    [v8 bounds];
    float v10 = (v9 - v4) * 0.5;
    double v11 = floorf(v10);

    -[TVPSharedPSSubscribersView setFrame:](self->_subscribersView, "setFrame:", v7, v11, 700.0, v4);
  }

- (CGSize)formSize
{
  double v2 = 700.0;
  double v3 = 1080.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)photoLibraryDidChange:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue([a3 changeDetailsForObject:self->_cloudSharedAlbum]);
  double v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10003B50C;
    v6[3] = &unk_1000C9CC8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, v6);
  }
}

- (void)_onSelectActionButton:(id)a3
{
  int buttonIdentifier = self->_buttonIdentifier;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", a3));
  double v6 = v5;
  if (buttonIdentifier == 1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"deleteSharedStreamNotificationMessage" value:&stru_1000CC6C8 table:0]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLCloudSharedAlbum localizedTitle](self->_pl_cloudSharedAlbum, "localizedTitle"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));

    float v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"deleteSharedAlbumStream" value:&stru_1000CC6C8 table:0]);

    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v13 = v12;
    v14 = @"cancelToDeleteSharedStream";
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"unsubscribeNotificationMessage" value:&stru_1000CC6C8 table:0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PLCloudSharedAlbum localizedTitle](self->_pl_cloudSharedAlbum, "localizedTitle"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v16));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"UnsubscribeFromAlbum" value:&stru_1000CC6C8 table:0]);

    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v13 = v12;
    v14 = @"cancelToUnsubscribe";
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:v14 value:&stru_1000CC6C8 table:0]);

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  &stru_1000CC6C8,  1LL));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10003B8AC;
  v22[3] = &unk_1000CA418;
  v22[4] = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v22));
  [v19 addAction:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  1LL,  0LL));
  [v19 addAction:v21];

  -[TVPSharedPSSubscriberListViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v19,  1LL,  0LL);
}

+ (id)_sharedAlbumSubscribersFromAlbum:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pl_assetContainer"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PLCloudSharedAlbum, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v6 = v3;
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 invitationRecords]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 inviteeFullName]);

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue([v13 inviteeFullName]);
            -[NSMutableArray addObject:](v7, "addObject:", v15);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v10);
    }

    id v16 = -[NSMutableArray copy](v7, "copy");
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

- (PHAssetCollection)cloudSharedAlbum
{
  return self->_cloudSharedAlbum;
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  return self->_menuGestureRecognizer;
}

- (void)setMenuGestureRecognizer:(id)a3
{
}

- (TVPSharedPSSubscribersView)subscribersView
{
  return self->_subscribersView;
}

- (void)setSubscribersView:(id)a3
{
}

- (NSArray)subscribersList
{
  return self->_subscribersList;
}

- (void)setSubscribersList:(id)a3
{
}

- (int)buttonIdentifier
{
  return self->_buttonIdentifier;
}

- (void)setButtonIdentifier:(int)a3
{
  self->_int buttonIdentifier = a3;
}

- (PLCloudSharedAlbum)pl_cloudSharedAlbum
{
  return self->_pl_cloudSharedAlbum;
}

- (void)setPl_cloudSharedAlbum:(id)a3
{
}

- (void).cxx_destruct
{
}

@end