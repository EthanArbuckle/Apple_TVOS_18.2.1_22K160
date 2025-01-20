@interface SHMatchResultBulletinContentDeliverer
- (void)deliverContentForMatchedMediaItem:(id)a3 completion:(id)a4;
- (void)deliverContentForMatchedMediaItem:(id)a3 imageData:(id)a4 completion:(id)a5;
- (void)deliverContentForNoMatchWithCompletion:(id)a3;
- (void)presentBulletin:(id)a3 completion:(id)a4;
@end

@implementation SHMatchResultBulletinContentDeliverer

- (void)deliverContentForMatchedMediaItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 artworkURL]);

  if (v8)
  {
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 artworkURL]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10003ABFC;
    v10[3] = &unk_10006DD78;
    id v11 = v6;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    +[SHMatchResultNotificationAttachmentProviderUtilities downloadImageURL:completionHandler:]( &OBJC_CLASS___SHMatchResultNotificationAttachmentProviderUtilities,  "downloadImageURL:completionHandler:",  v9,  v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  else
  {
    -[SHMatchResultBulletinContentDeliverer deliverContentForMatchedMediaItem:imageData:completion:]( self,  "deliverContentForMatchedMediaItem:imageData:completion:",  v6,  0LL,  v7);
  }
}

- (void)deliverContentForMatchedMediaItem:(id)a3 imageData:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v15 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  3LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
  [v11 setValue:v12 forKey:PBSSystemBulletinTitleKey];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 subtitle]);
  [v11 setValue:v13 forKey:PBSSystemBulletinMessageKey];

  [v11 setValue:v9 forKey:PBSSystemBulletinImageDataKey];
  id v14 = [v11 copy];
  [v15 setMessage:v14];

  -[SHMatchResultBulletinContentDeliverer presentBulletin:completion:](self, "presentBulletin:completion:", v15, v8);
}

- (void)deliverContentForNoMatchWithCompletion:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SHLocalization localizedStringForKey:]( &OBJC_CLASS___SHLocalization,  "localizedStringForKey:",  @"SHAZAM_MODULE_NOTIFICATION_NO_MATCH_SUBTITLE"));
  [v7 setValue:v3 forKey:PBSSystemBulletinTitleKey];

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SHLocalization localizedStringForKey:]( &OBJC_CLASS___SHLocalization,  "localizedStringForKey:",  @"SHAZAM_MODULE_NOTIFICATION_NO_MATCH_BODY"));
  [v7 setValue:v4 forKey:PBSSystemBulletinMessageKey];

  id v5 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
  id v6 = [v7 copy];
  [v5 setMessage:v6];
}

- (void)presentBulletin:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 setViewControllerClassName:PBSSystemBulletinViewControllerClassName];
  [v5 setServiceIdentifier:PBSSystemBulletinServiceName];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSBulletinService sharedInstance](&OBJC_CLASS___PBSBulletinService, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10003B004;
  v10[3] = &unk_10006DDA0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 presentBulletin:v9 withCompletion:v10];
}

@end