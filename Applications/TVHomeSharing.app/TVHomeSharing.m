}

  ;
}

id sub_100003DD0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tvh_playItemsNext:", *(void *)(a1 + 40));
}

id sub_100003E64(uint64_t a1)
{
  return [*(id *)(a1 + 32) addItems:*(void *)(a1 + 40)];
}

id sub_100003EC0(uint64_t a1, void *a2)
{
  return [a2 setAllowsDiskCaching:*(unsigned __int8 *)(a1 + 32)];
}

void sub_100003F5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  id v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v5 = v7;
    }
    else {
      v5 = 0LL;
    }
  }

  else
  {
    v5 = 0LL;
  }

  id v6 = v5;

  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

uint64_t sub_100005914(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  unsigned int v5 = [v3 isEqual:v4];

  return v5 ^ 1;
}

void sub_100007300(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_tvh_rootViewController"));
  [v2 showMediaEntityCollectionForMediaItem:*(void *)(a1 + 32) mediaEntityCollectionType:1];
}

void sub_100007420(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_tvh_rootViewController"));
  [v2 showMediaEntityCollectionForMediaItem:*(void *)(a1 + 32) mediaEntityCollectionType:2];
}

void sub_100007758(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_tvh_playerPlaylist"));
  objc_msgSend(v2, "tvh_playMediaItemsNext:mediaLibrary:", *(void *)(a1 + 32), *(void *)(a1 + 40));

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHBulletinController sharedController](&OBJC_CLASS___TVHBulletinController, "sharedController"));
  [v3 postPlayNextBulletin];
}

void sub_100007AA8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_tvh_playerPlaylist"));
  objc_msgSend(v2, "tvh_playMediaItemsLast:mediaLibrary:", *(void *)(a1 + 32), *(void *)(a1 + 40));

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHBulletinController sharedController](&OBJC_CLASS___TVHBulletinController, "sharedController"));
  [v3 postPlayLastBulletin];
}

void sub_100007E78(_Unwind_Exception *a1)
{
}

void sub_100007E94(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    if ((unint64_t)[a1[4] count] <= 9)
    {
      do
      {
        id v3 = objc_claimAutoreleasedReturnValue([a1[5] popNextImage]);
        id v4 = [v3 image];

        if (!v4) {
          break;
        }
        unsigned int v5 = -[UIImage initWithCGImage:](objc_alloc(&OBJC_CLASS___UIImage), "initWithCGImage:", v4);
        [WeakRetained _addImage:v5];
      }

      while ((unint64_t)[a1[4] count] < 0xA);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "tvhk_randomizedArray"));
    id v7 = [v6 mutableCopy];
    [WeakRetained setImageViews:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v8 bounds];
    double Width = CGRectGetWidth(v27);

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained imageViews]);
    id v11 = [v10 copy];

    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      double v15 = 0.0;
LABEL_7:
      uint64_t v16 = 0LL;
      while (1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v22 + 1) + 8 * v16) image]);
        [WeakRetained _addImage:v17];
        [v17 size];
        double v15 = v15 + v18;

        if (v15 >= Width) {
          break;
        }
        if (v13 == (id)++v16)
        {
          id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v13) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    [WeakRetained setAdditionalImageViewCount:0];
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 postNotificationName:@"TVHScrollingParadeImageViewWillDisplayNotification" object:WeakRetained];

    v20 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([a1[6] animationGroup]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000812C;
    block[3] = &unk_1000FCEA8;
    block[4] = WeakRetained;
    dispatch_group_notify(v20, &_dispatch_main_q, block);
  }
}

id sub_10000812C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAnimations];
}

void sub_100008C18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
}

void sub_100008C34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    unsigned int v3 = [WeakRetained isAnimating];
    uint64_t v2 = v4;
    if (v3)
    {
      [v4 setAnimating:0];
      [v4 _startAnimations];
      uint64_t v2 = v4;
    }
  }
}

void sub_100009340( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

id sub_10000935C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _previewViewControllerForIndexPath:v3]);

  return v5;
}

void sub_1000097B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

NSString *__cdecl sub_1000097EC(id a1, NSIndexPath *a2, id a3)
{
  return (NSString *)@"ListViewCellIdentifier";
}

void sub_1000097F8(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 withIdentifier:v5];
}

id sub_10000985C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if ([a3 isEqualToString:UICollectionElementKindSectionHeader])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained catalogueDataSource]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionTitleAIndex:", objc_msgSend(v8, "section")));

    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v7 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ListViewSectionHeaderViewIdentifier" forIndexPath:v8]);
    [v12 setTitle:v11];
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

LABEL_11:
    sub_10009BF3C((uint64_t)v4, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_12;
  }

  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController lockupLayoutsDictionary](self, "lockupLayoutsDictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 unplayedMediaEntitiesDataSource]);
  id v12 = (TVHMediaEntitiesGridViewLayout *)objc_claimAutoreleasedReturnValue([v9 partiallyPlayedMediaEntitiesDataSource]);

  id v13 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesPlayedStateViewController);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueViewController mediaLibrary](self, "mediaLibrary"));
  double v15 = -[TVHMediaEntitiesPlayedStateViewController initWithMediaLibrary:unplayedDataSource:partiallyPlayedDataSource:lockupLayoutByMediaEntityType:]( v13,  "initWithMediaLibrary:unplayedDataSource:partiallyPlayedDataSource:lockupLayoutByMediaEntityType:",  v14,  v11,  v12,  v10);

LABEL_7:
  -[TVHMediaEntitiesGridViewController setDelegate:](v15, "setDelegate:", self);

LABEL_14:
  return v15;
}

  return v10;
}

  return v7;
}
}

void sub_10000A1E4(id a1)
{
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType movie](&OBJC_CLASS___TVHKMediaEntityType, "movie"));
  -[NSMutableArray addObject:](v11, "addObject:", v1);

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType movieRental](&OBJC_CLASS___TVHKMediaEntityType, "movieRental"));
  -[NSMutableArray addObject:](v11, "addObject:", v2);

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType homeVideo](&OBJC_CLASS___TVHKMediaEntityType, "homeVideo"));
  -[NSMutableArray addObject:](v11, "addObject:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType show](&OBJC_CLASS___TVHKMediaEntityType, "show"));
  -[NSMutableArray addObject:](v11, "addObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType audiobook](&OBJC_CLASS___TVHKMediaEntityType, "audiobook"));
  -[NSMutableArray addObject:](v11, "addObject:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType iTunesUCourse](&OBJC_CLASS___TVHKMediaEntityType, "iTunesUCourse"));
  -[NSMutableArray addObject:](v11, "addObject:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType podcast](&OBJC_CLASS___TVHKMediaEntityType, "podcast"));
  -[NSMutableArray addObject:](v11, "addObject:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType playlist](&OBJC_CLASS___TVHKMediaEntityType, "playlist"));
  -[NSMutableArray addObject:](v11, "addObject:", v8);

  id v9 = -[NSMutableArray copy](v11, "copy");
  v10 = (void *)qword_100157270;
  qword_100157270 = (uint64_t)v9;
}

LABEL_21:
  v21 = v13;
  __int128 v22 = v12;
  result.height = v22;
  result.width = v21;
  return result;
}

    v16->_canItemsBeAdded = !v16->_isEligibleForPictureInPicture;
    if ((v6 & 2) != 0 && !v16->_isEligibleForPictureInPicture)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
      CGRect v27 = [v26 mediaRepeatMode];

      __int128 v24 = [(id)objc_opt_class(v16) _playlistRepeatModeForMediaRepeatMode:v27];
    }

    else
    {
      __int128 v24 = 0LL;
    }

    -[TVHPlayerPlaylist _setRepeatMode:andUpdateSettings:]( v16,  "_setRepeatMode:andUpdateSettings:",  v24,  0LL,  (void)v28);
    if ((v6 & 1) != 0) {
      -[TVHPlayerPlaylist setShuffleEnabled:preserveCurrentItem:]( v16,  "setShuffleEnabled:preserveCurrentItem:",  1LL,  0LL);
    }
  }

  return v16;
}
}

void sub_10000A610( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000B0C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_10000B0E8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _collectionViewCellForIdentifier:v6 atIndexPath:v7]);

  return v9;
}

NSString *__cdecl sub_10000B4C8(id a1, NSString *a2)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"__TVH__Director__%@", a2);
}

NSString *__cdecl sub_10000B4F8(id a1, NSString *a2)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"__TVH__Actor__%@", a2);
}

NSString *__cdecl sub_10000B528(id a1, NSString *a2)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"__TVH__Producer__%@", a2);
}

NSString *__cdecl sub_10000B558(id a1, NSString *a2)
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"__TVH__Screenwriter__%@",  a2);
}

LABEL_13:
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView _currentSubview](self, "_currentSubview"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContentRatingView tintColor](self, "tintColor"));
  [v15 setTintColor:v16];
}

  return v11;
}

    -[TVHCollectionView setIndexPathForCurrentFocusedItem:](self, "setIndexPathForCurrentFocusedItem:", v9);
  }

  else
  {
    -[TVHCollectionView setIndexPathForCurrentFocusedItem:](self, "setIndexPathForCurrentFocusedItem:", 0LL);
  }
}

void sub_10000D388(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157280;
  qword_100157280 = (uint64_t)v1;
}

void sub_10000D744( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000D780(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000D844;
    v8[3] = &unk_1000FD110;
    id v6 = WeakRetained;
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = v6;
    uint64_t v12 = v7;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(&_dispatch_main_q, v8);
  }
}

void sub_10000D844(uint64_t a1)
{
  if ([*(id *)(a1 + 32) monitorToken] == *(id *)(a1 + 56))
  {
    [*(id *)(a1 + 32) setFetchRequestWorkToken:0];
    if ([*(id *)(a1 + 40) count] == (id)1)
    {
      uint64_t v2 = *(void **)(a1 + 32);
      id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) firstObject]);
      [v2 _handleFetchResponse:v3 player:*(void *)(a1 + 48)];
    }
  }

void sub_10000E87C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_10000E8A4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _collectionViewCellForIdentifier:v6 atIndexPath:v7]);

  return v9;
}

void sub_10000EDE0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDescendantOfView:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void **)(a1 + 48);
    if (v2)
    {
      if (([v2 isDescendantOfView:*(void *)(a1 + 40)] & 1) == 0
        && ([*(id *)(a1 + 48) isDescendantOfView:*(void *)(a1 + 56)] & 1) == 0)
      {
        [*(id *)(a1 + 64) _makeFirstContentSectionCellHeaderLarger];
        uint64_t v15 = *(void *)(a1 + 40);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___TVHTitledProductCollectionViewCell);
        char isKindOfClass = objc_opt_isKindOfClass(v15, v16);
        uint64_t v18 = *(void *)(a1 + 40);
        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___TVHProductCollectionViewCell);
          if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
          {
            v20 = *(void **)(a1 + 64);
            id v22 = *(id *)(a1 + 40);
            else {
              uint64_t v21 = 2LL;
            }
            [*(id *)(a1 + 64) _updateMarginForFirstContentSectionCell:v22 marginMode:v21];
          }

          return;
        }

        uint64_t v12 = *(void **)(a1 + 40);
        uint64_t v13 = 1LL;
LABEL_18:
        [v12 setShowingTitleLabel:v13];
        return;
      }
    }
  }

  if ([*(id *)(a1 + 32) isDescendantOfView:*(void *)(a1 + 72)]
    && ([*(id *)(a1 + 48) isDescendantOfView:*(void *)(a1 + 72)] & 1) == 0)
  {
    [*(id *)(a1 + 64) _makeFirstContentSectionCellHeaderSmaller];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___TVHTitledProductCollectionViewCell);
    char v10 = objc_opt_isKindOfClass(v8, v9);
    uint64_t v11 = *(void *)(a1 + 40);
    if ((v10 & 1) == 0)
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___TVHProductCollectionViewCell);
      if ((objc_opt_isKindOfClass(v11, v14) & 1) == 0) {
        return;
      }
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(a1 + 64);
      uint64_t v7 = 0LL;
      goto LABEL_15;
    }

    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = 0LL;
    goto LABEL_18;
  }

  if ([*(id *)(a1 + 32) isDescendantOfView:*(void *)(a1 + 56)])
  {
    if (([*(id *)(a1 + 48) isDescendantOfView:*(void *)(a1 + 56)] & 1) == 0)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHProductCollectionViewCell);
      if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      {
        uint64_t v5 = *(void *)(a1 + 40);
        id v6 = *(void **)(a1 + 64);
        uint64_t v7 = 2LL;
LABEL_15:
        [v6 _updateMarginForFirstContentSectionCell:v5 marginMode:v7];
      }
    }
  }

void sub_1000102A8(_Unwind_Exception *a1)
{
}

void sub_1000102E4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v17 = (id)objc_claimAutoreleasedReturnValue([v5 viewController]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v17 view]);
  objc_msgSend(v6, "sizeThatFits:", *(double *)(a1 + 72), 1.79769313e308);
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v7
  [v5 spacing];
  double v9 = v8;

  *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v9
  double v10 = 0.0;
  if (!a3)
  {
    if ([*(id *)(a1 + 32) _isSingleItemStyle]
      && [v17 conformsToProtocol:&OBJC_PROTOCOL___TVHRowCellContentViewController])
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
      *(void *)(v13 + 32) = 0LL;
      *(void *)(v13 + 40) = 0LL;
      *(double *)(v13 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v9;
      *(void *)(v13 + 56) = 0LL;
      double v10 = 70.0;
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL)
                                                                              + 24LL)
                                                                  + 70.0;
      uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8LL);
      *(_OWORD *)(v14 + 32) = xmmword_1000C3150;
      *(double *)(v14 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v9;
      *(void *)(v14 + 56) = 0LL;
      sub_10002EE50(35.0);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 32LL) = v15;
    }

    else if ([*(id *)(a1 + 32) _shouldFirstContentSectionCellUseTitledCell])
    {
      [*(id *)(a1 + 32) _contentSectionCellMaxTitleLabelHeightPlusMargin];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v16
    }
  }

  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue tvh_valueWithMargin:](&OBJC_CLASS___NSValue, "tvh_valueWithMargin:", v10, 0.0, v9, 0.0));
  [v11 addObject:v12];
}

void sub_1000108C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000108E8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  __int128 v7 = *(_OWORD *)(v6 + 48);
  *(_OWORD *)(v5 + 32) = *(_OWORD *)(v6 + 32);
  *(_OWORD *)(v5 + 4_Block_object_dispose((const void *)(v9 - 96), 8) = v7;
  id v8 = objc_msgSend(a2, "tvh_marginValue");
  uint64_t v9 = *(void **)(*(void *)(a1 + 48) + 8LL);
  v9[4] = v10;
  v9[5] = v11;
  v9[6] = v12;
  v9[7] = v13;
  if (a3)
  {
    if (BSFloatIsZero(v8, *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 48LL)))
    {
      [*(id *)(a1 + 32) addObject:&off_100105E98];
    }

    else
    {
      uint64_t v14 = *(void **)(a1 + 32);
      id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL)
                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL)));
      [v14 addObject:v15];
    }
  }

LABEL_9:
}
}

  return v12;
}
}

    -[TVHMediaLibraryViewController _reinitializeTabBarViewController](self, "_reinitializeTabBarViewController");
    goto LABEL_10;
  }

  if (off_1001565D0 == a6)
  {
    double v16 = sub_10007A1C8();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v15 = "Received KVO notification that the show cover art shape has changed.";
      goto LABEL_8;
    }

    goto LABEL_9;
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryViewController;
  -[TVHMediaLibraryViewController observeValueForKeyPath:ofObject:change:context:]( &v17,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_10:
}
}

id sub_100010F4C(id a1, TVHProductContentSectionItem *a2)
{
  return -[TVHProductContentSectionItem viewController](a2, "viewController");
}

LABEL_18:
            uint64_t v10 = v27;
          }

          uint64_t v13 = (char *)v13 + 1;
        }

        while (v13 != v10);
        uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
      }

      while (v10);
    }

    __int128 v23 = (NSDictionary *)-[NSMutableDictionary copy](v8, "copy");
    uint64_t v5 = v26;
    sectionByIdentifier = v26->_sectionByIdentifier;
    v26->_sectionByIdentifier = v23;
  }

  return v5;
}

void sub_1000125B8(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___TVHCollectionView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  uint64_t v12 = -[TVHCollectionView initWithFrame:collectionViewLayout:]( v5,  "initWithFrame:collectionViewLayout:",  v3,  CGRectZero.origin.x,  y,  width,  height);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[TVHCollectionView setBackgroundColor:](v12, "setBackgroundColor:", v9);

  -[TVHCollectionView setAutoresizingMask:](v12, "setAutoresizingMask:", 18LL);
  -[TVHCollectionView setShowsVerticalScrollIndicator:](v12, "setShowsVerticalScrollIndicator:", 0LL);
  -[TVHCollectionView setShowsHorizontalScrollIndicator:](v12, "setShowsHorizontalScrollIndicator:", 0LL);
  -[TVHCollectionView setAlwaysBounceVertical:](v12, "setAlwaysBounceVertical:", 1LL);
  -[TVHCollectionView setDelegate:](v12, "setDelegate:", v4);
  uint64_t v10 = -[TVHStackView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHStackView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[TVHStackView setCollectionView:](v10, "setCollectionView:", v12);
  uint64_t v11 = (void *)v4[1];
  v4[1] = v10;
}

void sub_10001536C(_Unwind_Exception *a1)
{
}

id sub_1000153B4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _previewViewControllerForIndexPath:v9 oldIndexPath:v8 oldViewController:v7]);

  return v11;
}

NSString *__cdecl sub_100015438(id a1, NSIndexPath *a2, id a3)
{
  return (NSString *)@"MusicCellIdentifier";
}

void sub_100015444(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 withIdentifier:v5];
}

id sub_1000154A8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if ([a3 isEqualToString:UICollectionElementKindSectionHeader])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained dataSource]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionTitleAIndex:", objc_msgSend(v8, "section")));

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( [v7 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ListViewSectionHeaderViewIdentifier" forIndexPath:v8]);
    [v12 setTitle:v11];
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

TVHMusicGeniusMixPlaylistsViewController *sub_100015EE0(uint64_t a1)
{
  return  -[TVHMusicGeniusMixPlaylistsViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicGeniusMixPlaylistsViewController),  "initWithMediaLibrary:",  *(void *)(a1 + 32));
}

TVHMusicPlaylistsViewController *sub_100015F10(uint64_t a1)
{
  return  -[TVHMusicPlaylistsViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicPlaylistsViewController),  "initWithMediaLibrary:",  *(void *)(a1 + 32));
}

TVHMusicAlbumArtistsViewController *sub_100015F40(uint64_t a1)
{
  return  -[TVHMusicAlbumArtistsViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicAlbumArtistsViewController),  "initWithMediaLibrary:",  *(void *)(a1 + 32));
}

TVHMusicAlbumsViewController *sub_100015F70(uint64_t a1)
{
  uint64_t v2 = sub_10007D608();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = -[TVHMusicAlbumsViewController initWithMediaLibrary:albumsDataSource:]( objc_alloc(&OBJC_CLASS___TVHMusicAlbumsViewController),  "initWithMediaLibrary:albumsDataSource:",  *(void *)(a1 + 32),  v3);

  return v4;
}

TVHMusicSongsViewController *sub_100015FBC(uint64_t a1)
{
  return  -[TVHMusicSongsViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicSongsViewController),  "initWithMediaLibrary:",  *(void *)(a1 + 32));
}

TVHMusicVideosViewController *sub_100015FEC(uint64_t a1)
{
  return  -[TVHMusicVideosViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicVideosViewController),  "initWithMediaLibrary:",  *(void *)(a1 + 32));
}

TVHMusicComposersViewController *sub_10001601C(uint64_t a1)
{
  return  -[TVHMusicComposersViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicComposersViewController),  "initWithMediaLibrary:",  *(void *)(a1 + 32));
}

TVHMusicAlbumsViewController *sub_10001604C(uint64_t a1)
{
  uint64_t v2 = sub_10007D624();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = -[TVHMusicAlbumsViewController initWithMediaLibrary:albumsDataSource:]( objc_alloc(&OBJC_CLASS___TVHMusicAlbumsViewController),  "initWithMediaLibrary:albumsDataSource:",  *(void *)(a1 + 32),  v3);

  return v4;
}

id sub_100016EB0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) thumbnailImageView]);
  id v3 = v2;
  double v4 = 0.0;
  if (!*(_BYTE *)(a1 + 40)) {
    double v4 = 12.0;
  }
  [v2 setCornerRadius:v4];

  return [*(id *)(a1 + 32) _updateColors];
}

void sub_100017164(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_50PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_50PercentWhiteColor"));
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v4,  v1));
  id v3 = (void *)qword_100157298;
  qword_100157298 = v2;
}

void sub_100017234(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor tvh_40PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_40PercentBlackColor"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_30PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_30PercentWhiteColor"));
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v4,  v1));
  id v3 = (void *)qword_1001572A8;
  qword_1001572A8 = v2;
}

id sub_100018398(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) imageView]);
  id v3 = v2;
  double v4 = 0.0;
  if (!*(_BYTE *)(a1 + 40)) {
    double v4 = 12.0;
  }
  [v2 setCornerRadius:v4];

  return [*(id *)(a1 + 32) _updateColors];
}

LABEL_20:
    uint64_t v14 = (os_log_s *)v12;
    if (v14)
    {
LABEL_21:
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController navigationController](self, "navigationController"));
      [v29 pushViewController:v14 animated:1];

LABEL_22:
    }
  }

  return v14;
}

    double width = 444.0;
LABEL_23:
    double height = 250.0;
  }

LABEL_23:
}

  return v9;
}

LABEL_7:
}

  uint64_t v14 = v10;
LABEL_21:

  return v14;
}

void sub_1000198D0(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @" -"));
  uint64_t v2 = (void *)qword_1001572B8;
  qword_1001572B8 = v1;
}

void sub_10001B960(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  id v6 = @"CompletionBlock";
  id v4 = [*(id *)(a1 + 32) copy];
  id v7 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  [v3 postEvent:@"Start" withContext:0 userInfo:v5];
}

void sub_10001BD3C(_Unwind_Exception *a1)
{
}

__CFString *sub_10001BD78(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([a2 currentState]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"CompletionBlock"]);
    [WeakRetained setCompletionBlock:v10];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained mediaLibrary]);
    if ([v11 connectionState] == (id)2)
    {
      [WeakRetained _startFetchingMediaEntities];
      uint64_t v12 = @"Executing Fetch Request";
    }

    else
    {
      [v11 connectWithCompletionHandler:0];
      uint64_t v12 = @"Connecting Media Server";
    }

    id v8 = (__CFString *)v12;
  }

  return v8;
}

__CFString *sub_10001BE54(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([a2 currentState]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvhk_numberForKey:", @"ConnectionState"));
    id v11 = [v10 unsignedIntegerValue];
    if (v11)
    {
      if (v11 == (id)2)
      {
        [WeakRetained _startFetchingMediaEntities];

        id v8 = @"Executing Fetch Request";
      }
    }

    else
    {
      uint64_t v12 = *(void **)(a1 + 32);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10001BF4C;
      v14[3] = &unk_1000FCEA8;
      v14[4] = WeakRetained;
      [v12 executeBlockAfterCurrentStateTransition:v14];

      id v8 = @"Finished";
    }
  }

  return v8;
}

id sub_10001BF4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeWithFetchResponse:0 error:0];
}

CFStringRef sub_10001BF5C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void **)(a1 + 32);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10001C058;
  v16[3] = &unk_1000FD360;
  id v14 = v12;
  id v17 = v14;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  [v13 executeBlockAfterCurrentStateTransition:v16];
  objc_destroyWeak(&v18);

  return @"Finished";
}

void sub_10001C044(_Unwind_Exception *a1)
{
}

void sub_10001C058(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"FetchResponse"]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"Error"]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _completeWithFetchResponse:v4 error:v2];
}

void sub_10001C3C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

uint64_t sub_10001C418(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001C428(uint64_t a1)
{
}

void sub_10001C430(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C50C;
  block[3] = &unk_1000FD3B0;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v12 = v7;
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v16);
}

void sub_10001C50C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = sub_10007A008();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverProviderMediaEntitiesRequest: Finished fetch: %@",  buf,  0xCu);
  }

  if (WeakRetained)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained fetchWorkToken]);
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);

    if (v6 == v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) firstObject]);
      id v9 = (void *)v8;
      if (v8)
      {
        uint64_t v17 = @"FetchResponse";
        uint64_t v18 = v8;
        id v10 = &v18;
        id v11 = &v17;
      }

      else
      {
        uint64_t v12 = *(void *)(a1 + 48);
        if (!v12)
        {
          id v13 = 0LL;
          goto LABEL_10;
        }

        uint64_t v15 = @"Error";
        uint64_t v16 = v12;
        id v10 = &v16;
        id v11 = &v15;
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v11,  1LL,  v15,  v16,  v17,  v18));
LABEL_10:
      [WeakRetained setFetchWorkToken:0];
      id v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
      [v14 postEvent:@"Media Entities Fetch Did Complete" withContext:0 userInfo:v13];
    }
  }
}

void sub_10001C7B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaEntitiesResult]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaEntities]);
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

id sub_10001D760(id a1, TVHFetchResponseHandlingCatalogueItem *a2)
{
  uint64_t v2 = a2;
  else {
    id v3 = 0LL;
  }
  id v4 = v3;

  return v4;
}

void sub_10001D880(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _itemsForFetchRequestIdentifier:v3]);
  if ([v4 count])
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v18 = v4;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "resultForRequestIdentifier:", v3, v18));
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 response]);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 changeSet]);
          unsigned int v13 = [v9 updateWithMediaEntitiesFetchResponse:v11 fetchResponseChangeSet:v12];
          if (v12) {
            BOOL v14 = v13 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14)
          {
            uint64_t v15 = *(void **)(a1 + 48);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
            [v15 addObject:v16];
          }
        }

        id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v6);
      id v4 = v18;
    }
  }

  else
  {
    id v17 = sub_100079DD8();
    id obj = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_ERROR)) {
      sub_10009C074((uint64_t)v3, (os_log_s *)obj);
    }
  }
}

void sub_10001E3E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22)
{
}

uint64_t sub_10001E438(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001E448(uint64_t a1)
{
}

void sub_10001E450(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v3)
  {
    [v3 removeFromSuperview];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0LL;
  }

  [WeakRetained removeFromSuperview];
  if (v2)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 56));
    [v6 addSubview:v2];
  }
}

void sub_10001E4E0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 postNotificationName:@"TVHImageDeckViewReadyNotification" object:*(void *)(a1 + 32)];
}

id sub_10001E5E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_10001E738(_Unwind_Exception *a1)
{
}

void sub_10001E754(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) superview]);

  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 40) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0LL;
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40LL), *(id *)(a1 + 40));
  [*(id *)(a1 + 48) removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained addSubview:*(void *)(*(void *)(a1 + 32) + 40)];
}

void sub_10001F64C(id a1)
{
  id v1 = -[TVHAnalyticsController _init](objc_alloc(&OBJC_CLASS___TVHAnalyticsController), "_init");
  uint64_t v2 = (void *)qword_1001572D0;
  qword_1001572D0 = (uint64_t)v1;
}

NSDictionary *__cdecl sub_10001F838(id a1)
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

id sub_10001F89C(uint64_t a1)
{
  id v1 = [(id)objc_opt_class(*(void *)(a1 + 32)) _mediaCategoryTypeAnalyticsString:*(void *)(a1 + 40)];
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    id v6 = @"type";
    uint64_t v7 = v2;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    uint64_t v4 = &__NSDictionary0__struct;
  }

  return v4;
}

NSDictionary *__cdecl sub_10001F95C(id a1)
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

id sub_10001F9E0(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, @"hasAudiobooks");
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, @"hasHomeVideos");
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, @"hasITunesU");
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, @"hasMovies");
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, @"hasMovieRentals");
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, @"hasMusic");
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, @"hasPhotos");
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, @"hasPodcasts");
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, @"hasTVShows");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = (unint64_t)objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)v7),  "unsignedIntegerValue",  (void)v11)
           - 1;
        if (v8 <= 8) {
          -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanTrue, off_1000FD628[v8]);
        }
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  id v9 = -[NSMutableDictionary copy](v2, "copy");
  return v9;
}

NSDictionary *__cdecl sub_10001FD98(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 slideshowStyle]);
  -[NSMutableDictionary bs_setSafeObject:forKey:](v2, "bs_setSafeObject:forKey:", v3, @"theme");

  id v4 = -[NSMutableDictionary copy](v2, "copy");
  return (NSDictionary *)v4;
}

id sub_10001FE98(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v3 = objc_msgSend( (id)objc_opt_class(*(void *)(a1 + 32)),  "_mediaCategoryTypeAnalyticsString:",  objc_msgSend(*(id *)(a1 + 40), "mediaCategoryType"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4) {
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v4, @"type");
  }
  id v5 = [*(id *)(a1 + 40) mediaItemType];
  if (v5 == (id)1)
  {
    uint64_t v6 = @"audio";
    goto LABEL_7;
  }

  if (v5 == (id)2)
  {
    uint64_t v6 = @"video";
LABEL_7:
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v6, @"subtype");
  }

  id v7 = -[NSMutableDictionary copy](v2, "copy");

  return v7;
}

id sub_10002026C(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

id sub_100020274(uint64_t a1)
{
  return [*(id *)(a1 + 32) title];
}

void sub_100020904( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

NSString *__cdecl sub_10002092C(id a1, NSIndexPath *a2)
{
  return (NSString *)@"TVHMusicComposerListViewCell";
}

void sub_100020938(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 atIndexPath:v5];
}

void sub_1000211AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

void sub_1000211D0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  __int128 v11 = sub_1000212E8;
  __int128 v12 = &unk_1000FD778;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v7 = v5;
  id v13 = v7;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v6,  0LL,  0LL,  &v9));

  if (*(void *)(a1 + 48) == a3) {
    objc_msgSend(v8, "setState:", 1, v9, v10, v11, v12);
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8, v9, v10, v11, v12);

  objc_destroyWeak(&v14);
}

void sub_1000212D0(_Unwind_Exception *a1)
{
}

void sub_1000212E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  [v2 sortContextMenuButton:WeakRetained didSelectSortOption:*(void *)(a1 + 32)];
}

UIMenu *sub_100021338(uint64_t a1)
{
  return +[UIMenu menuWithTitle:children:]( &OBJC_CLASS___UIMenu,  "menuWithTitle:children:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

id sub_100021908(uint64_t a1)
{
  return [*(id *)(a1 + 32) opacity];
}

id sub_100021910(uint64_t a1)
{
  return [*(id *)(a1 + 32) radius];
}

id sub_100021918(uint64_t a1)
{
  return [*(id *)(a1 + 32) verticalOffset];
}

CFStringRef sub_100021A2C(uint64_t a1)
{
  else {
    return off_1000FD838[a1 - 1];
  }
}

void sub_100021AC8(uint64_t a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) _init];
  uint64_t v2 = (void *)qword_1001572D8;
  qword_1001572D8 = (uint64_t)v1;
}

void sub_1000220D4(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaServerByIdentifier]);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaServerIdentifier]);
  [v4 setObject:v2 forKey:v3];
}

void sub_100022204(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaServerByIdentifier]);
  [v1 removeAllObjects];
}

uint64_t sub_100022818(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 8LL) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t sub_100022830(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100022844(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100022858(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_10002286C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100022880(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100022894(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_1000228A8(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_1000228BC(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_1000228D0(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 80LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_1000228E4(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 88LL) = *(void *)(result + 40);
  return result;
}

id sub_1000228F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMediaServerByIdentifier:*(void *)(a1 + 40)];
}

void sub_10002410C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100024130(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    id v5 = WeakRetained;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
    [v4 screenSaverPickerDidChangeScreenSaver:v5];

    id WeakRetained = v5;
  }
}

void sub_1000251E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100025210(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v10 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntitiesResult]);
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntities]);
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchRequestDidCompleteWithMediaItems:v8 error:v5];
}

LABEL_5:
    __int128 v12 = 0LL;
    goto LABEL_9;
  }

  __int128 v12 = (TVHMediaItemsFetchPlaybackViewController *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  1LL));
  id v17 = TVHKMusicMediaItemProperties(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[TVHMediaItemsFetchPlaybackViewController setProperties:](v12, "setProperties:", v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaItemAlbumArtistIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaItemAlbumArtistIdentifierPredicateWithIdentifier:",  v11));
  -[TVHMediaItemsFetchPlaybackViewController setPredicate:](v12, "setPredicate:", v15);
  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
LABEL_7:
  uint64_t v18 = (void *)v16;
  __int128 v21 = v16;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  -[TVHMediaItemsFetchPlaybackViewController setSortDescriptors:](v12, "setSortDescriptors:", v19);

  if (v12)
  {
    self =  -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:]( self,  "initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:",  v10,  v12,  0LL,  1LL);

    __int128 v12 = self;
  }

uint64_t sub_100025A90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a2 albumIdentifier]);
  id v7 = [v6 DMAPPersistentID];

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 albumIdentifier]);
  id v9 = [v8 DMAPPersistentID];

  id v10 = *(void **)(a1 + 32);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  id v12 = [v10 indexOfObject:v11];

  id v13 = *(void **)(a1 + 32);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v9));
  id v15 = [v13 indexOfObject:v14];

  if (v12 < v15) {
    return -1LL;
  }
  else {
    return v12 > v15;
  }
}

void sub_1000266BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000266DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didSelectEpisodeDescriptionText];
}

void sub_100029778( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19)
{
}

CFStringRef sub_1000298A8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _shouldShowContentViewControllerWithResultSet:v7])
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _delegateContentViewControllerWithResultSet:v7 sourceMediaEntity:v8 sourceMediaEntityBackgroundImageInfo:v9]);
    if (v11)
    {
      [WeakRetained setContentViewController:v11];
      id v12 = @"ShowingContentView";
      uint64_t v13 = 3LL;
    }

    else
    {
      id v12 = @"ShowingNoContentView";
      uint64_t v13 = 2LL;
    }

    [WeakRetained setCurrentViewType:v13];
  }

  else
  {
    [WeakRetained setCurrentViewType:2];
    id v12 = @"ShowingNoContentView";
  }

  return v12;
}

void sub_10002998C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained disableFetchingWhenViewDisappears])
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained mediaEntitiesFetchController]);
    [v1 enable];
  }
}

CFStringRef sub_1000299DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCurrentViewType:1];
  if ([WeakRetained enableFetchingWhenViewFirstAppears])
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained mediaEntitiesFetchController]);
    [v2 enable];
  }

  [WeakRetained _loadBackgroundImageInfoForLoadingView];

  return @"ShowingLoadingView";
}

id sub_100029A40(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  [WeakRetained _loadBackgroundImageInfoForContentView];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 currentState]);

  return v6;
}

id sub_100029AAC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentState]);

  return v5;
}

id sub_100029AFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained disableFetchingWhenViewDisappears])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained mediaEntitiesFetchController]);
    [v5 disable];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);

  return v6;
}

NSString *__cdecl sub_100029B70(id a1, TVHKStateMachine *a2, NSString *a3, id a4, NSDictionary *a5)
{
  return (NSString *)-[TVHKStateMachine currentState](a2, "currentState", a3, a4, a5);
}

id sub_100029B78(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained mediaEntitiesFetchController]);
  [v5 enable];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  return v6;
}

id sub_100029BE0(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained mediaEntitiesFetchController]);
  [v5 disable];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  return v6;
}

id sub_100029C48(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"SourceMediaEntity"]);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"FetchControllerResultSet"]);

  if ([WeakRetained _loadBackgroundImageInfoForContentView])
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  else
  {
    uint64_t v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v13);
  }

  id v14 = (void *)v12;

  return v14;
}

uint64_t sub_100029D1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

NSString *__cdecl sub_100029D34(id a1, TVHKStateMachine *a2, NSString *a3, id a4, NSDictionary *a5)
{
  return (NSString *)-[TVHKStateMachine currentState](a2, "currentState", a3, a4, a5);
}

CFStringRef sub_100029D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"FetchControllerResultSet"]);

  if ([WeakRetained _shouldShowContentViewControllerWithResultSet:v8])
  {
    [WeakRetained _delegateUpdateContentViewControllerWithFetchControllerResultSet:v8];
    id v9 = @"ShowingContentView";
  }

  else
  {
    [WeakRetained setCurrentViewType:2];
    id v9 = @"ShowingNoContentView";
  }

  return v9;
}

id sub_100029DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (id *)(a1 + 40);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"FetchControllerResultSet"]);

  uint64_t v10 = *(void *)(a1 + 32);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sourceMediaEntity]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained contentViewBackgroundImageInfo]);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v10 + 16))(v10, v9, v11, v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

id sub_100029E90(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a5;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"SourceMediaEntity"]);

  if ([WeakRetained _shouldLoadBackgroundImage])
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _backgroundImageProxyForMediaEntity:v10]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained contentViewBackgroundImageRequest]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 imageProxy]);
    unsigned int v14 = [v13 isEqual:v11];

    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained contentViewBackgroundImageInfo]);
      [WeakRetained _delegateUpdateContentViewControllerWithSourceMediaEntity:v10 sourceMediaEntityBackgroundImageInfo:v15];
    }

    else
    {
      [WeakRetained _loadBackgroundImageInfoForContentViewWithImageProxy:v11];
    }
  }

  else
  {
    [WeakRetained _delegateUpdateContentViewControllerWithSourceMediaEntity:v10 sourceMediaEntityBackgroundImageInfo:0];
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 currentState]);

  return v16;
}

id sub_100029FBC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setContentViewBackgroundImageInfo:0];
  [WeakRetained _cancelContentViewBackgroundImageLoad];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);

  return v5;
}

id sub_10002A020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (id *)(a1 + 40);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"BackgroundImageInfo"]);

  [WeakRetained setContentViewBackgroundImageInfo:v9];
  uint64_t v10 = *(void *)(a1 + 32);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained fetchResultSet]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sourceMediaEntity]);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v10 + 16))(v10, v11, v12, v9);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

id sub_10002A0E4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a5;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"BackgroundImageInfo"]);

  [WeakRetained setContentViewBackgroundImageInfo:v10];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sourceMediaEntity]);
  [WeakRetained _delegateUpdateContentViewControllerWithSourceMediaEntity:v11 sourceMediaEntityBackgroundImageInfo:v10];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 currentState]);
  return v12;
}

id sub_10002A194(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained currentView]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVHLoadingView);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    id v12 = v10;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"BackgroundImageInfo"]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 image]);
    if (v14)
    {
      [v12 setBackgroundImage:v14];
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 imageColors]);
      uint64_t v16 = v15;
      if (v15) {
        objc_msgSend(v12, "setActivityIndicatorBlurEffectStyle:", objc_msgSend(v15, "recommendedBlurStyle"));
      }
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);

  return v17;
}

id sub_10002A2A8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setContentViewBackgroundImageInfo:0];
  [WeakRetained _delegatePurgeSourceMediaEntityBackgroundImages];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);

  return v5;
}

id sub_10002A30C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained contentViewBackgroundImageInfo]);

  if (!v5) {
    [WeakRetained _loadBackgroundImageInfoForContentView];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);

  return v6;
}

void sub_10002ABF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_10002AC2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002AC3C(uint64_t a1)
{
}

void sub_10002AC44(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

void sub_10002AC80(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) addSubview:v3];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10002B138( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void sub_10002B164(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained contentViewBackgroundImageLoadToken]);
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);

    if (v6 == v7)
    {
      [v5 setContentViewBackgroundImageLoadToken:0];
      if (v3)
      {
        uint64_t v10 = @"BackgroundImageInfo";
        id v11 = v3;
        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
      }

      else
      {
        id v8 = 0LL;
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 stateMachine]);
      [v9 postEvent:@"ContentViewBackgroundImageLoadDidComplete" withContext:0 userInfo:v8];
    }
  }
}

void sub_10002B44C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void sub_10002B478(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained loadingViewBackgroundImageLoadToken]);
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);

    if (v6 == v7)
    {
      [v5 setLoadingViewBackgroundImageLoadToken:0];
      if (v3)
      {
        uint64_t v10 = @"BackgroundImageInfo";
        id v11 = v3;
        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
      }

      else
      {
        id v8 = 0LL;
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 stateMachine]);
      [v9 postEvent:@"LoadingViewBackgroundImageLoadDidComplete" withContext:0 userInfo:v8];
    }
  }
}

void sub_10002B678(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10002C6F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewColors];
}

BOOL sub_10002CB34(id a1, UIPress *a2)
{
  return (id)-[UIPress type](a2, "type") == (id)4;
}

uint64_t sub_10002EE28(double a1)
{
  double v2 = sub_1000954E4();
  return BSFloatRoundForScale(a1, v2);
}

uint64_t sub_10002EE50(double a1)
{
  double v2 = sub_1000954E4();
  return BSFloatFloorForScale(a1, v2);
}

uint64_t sub_10002EE78(double a1)
{
  double v2 = sub_1000954E4();
  return BSFloatCeilForScale(a1, v2);
}

void sub_10002EFAC(id a1)
{
  id v1 = -[TVHBulletinController _init](objc_alloc(&OBJC_CLASS___TVHBulletinController), "_init");
  double v2 = (void *)qword_1001572E8;
  qword_1001572E8 = (uint64_t)v1;
}

void sub_10002F540(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = sub_10007A1C8();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10009C15C((uint64_t)v3, v5);
    }
  }
}

void sub_10002F6E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained currentBulletin]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    unsigned int v5 = [v2 isEqual:v4];

    if (v5) {
      [WeakRetained setCurrentBulletin:0];
    }
  }
}

LABEL_16:
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosItemsViewController gridViewController](self, "gridViewController"));
  [v19 setHeaderSubtitle:v13];
  __int128 v20 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  __int128 v23 = v20;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  [v19 updateWithMediaEntitiesDataSourceFetchResults:v21];
}

  return v9;
}

LABEL_40:
      id v4 = (id)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v8 value:0 table:0]);
LABEL_41:

LABEL_42:
      return (NSString *)v4;
    default:
      goto LABEL_36;
  }

void sub_100031B98(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) playedStateGroups]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a2]);

  unsigned int v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _mediaEntitiesDataSourceForIdentfier:v6]);

  if (v7) {
    [v7 removeAll];
  }
}

id sub_100031C2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3) {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectsAtIndexes:v3]);
  }
  else {
    id v5 = v4;
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( *(id *)(a1 + 40),  "_updateMediaEntitiesDataSourceWithGroup:changeSet:",  *(void *)(*((void *)&v12 + 1) + 8 * (void)v10),  0,  (void)v12);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  return v6;
}

void sub_100031D50(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:a4]);
  [*(id *)(a1 + 40) _updateMediaEntitiesDataSourceWithGroup:v8 changeSet:v7];
}

LABEL_10:
  return v9;
}

id sub_100032760()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  3LL));
  uint64_t v1 = TVHKMovieMediaItemProperties([v0 setIdentifier:@"MoviesFetchRequestIdentifier"]);
  double v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  [v0 setProperties:v2];
  uint64_t v9 = @"genreTitle";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  [v0 setGroupingKeyPaths:v3];
  objc_msgSend(v0, "tvh_addPlayedStateGroupingKeyPath");
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateIndexBarItems);
  -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateGroupingIndexBarItems);
  -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  &__kCFBooleanTrue,  TVHKMediaEntitiesFetchRequestOptionCalculateRecentlyAddedMediaEntities);
  [v0 setOptions:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  id v8 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v0 setSortDescriptors:v6];

  return v0;
}

id sub_1000328F0()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  2LL));
  uint64_t v1 = TVHKMovieRentalMediaItemProperties([v0 setIdentifier:@"MovieRentalsFetchRequestIdentifier"]);
  double v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  [v0 setProperties:v2];
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  id v6 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v0 setSortDescriptors:v4];

  return v0;
}

id sub_100033374(uint64_t a1)
{
  return [*(id *)(a1 + 32) identifier];
}

id sub_100034C44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id sub_100034C50(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  double v2 = *(double *)(*(void *)(a1 + 40) + 32LL);
  [v1 center];
  return [v1 setCenter:v2];
}

id sub_100034F74(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentView]);
  objc_msgSend(v2, "_configureItemView:atIndex:", v3, objc_msgSend(*(id *)(a1 + 32), "focusedItemIndex"));

  id result = *(id *)(a1 + 40);
  if (result)
  {
    [result position];
    objc_msgSend(*(id *)(a1 + 40), "setPosition:");
    [*(id *)(a1 + 40) setAlpha:1.0];
    id v5 = *(void **)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentSupplementaryView]);
    [v5 setSpareSupplementaryView:v6];

    return [*(id *)(a1 + 32) setCurrentSupplementaryView:*(void *)(a1 + 40)];
  }

  return result;
}

void sub_1000350AC(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentView]);
  objc_msgSend(v2, "_configureItemView:atIndex:", v3, objc_msgSend(*(id *)(a1 + 32), "focusedItemIndex"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentSupplementaryView]);
  [v4 position];
  double v6 = v5;
  double v8 = v7;

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentSupplementaryView]);
  objc_msgSend(v9, "setPosition:", v6, v8 + 100.0);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentSupplementaryView]);
  [v10 setAlpha:0.0];

  id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) spareSupplementaryView]);
  [v11 setAlpha:0.0];
}

LABEL_15:
    if ((id)-[TVHOneUpView transition](self, "transition") == (id)3)
    {
      -[TVHOneUpView _performPushTransitionToView:atNewIndex:](self, "_performPushTransitionToView:atNewIndex:", v8, a3);
      goto LABEL_24;
    }

    if ((id)-[TVHOneUpView transition](self, "transition") != (id)5) {
      goto LABEL_24;
    }
    self->_isPerformingTransitionAnimation = 1;
    id v11 = -[TVHOneUpView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    __int128 v12 = -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex");
    if (v11 == (id)1)
    {
      if (v12 >= a3)
      {
LABEL_20:
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));

        [v8 center];
        __int128 v15 = v14;
        id v17 = v16;
        [v8 setCenter:v14 + 2160.0];
        -[TVHOneUpView addSubview:](self, "addSubview:", v8);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_100035B9C;
        v27[3] = &unk_1000FDC40;
        v28 = v13;
        v29 = v8;
        v30 = v15;
        v31 = v17;
        __int128 v21 = _NSConcreteStackBlock;
        __int128 v22 = 3221225472LL;
        __int128 v23 = sub_100035CEC;
        __int128 v24 = &unk_1000FDC18;
        double v7 = v28;
        uint64_t v25 = v7;
        v26 = self;
        +[UIView animateKeyframesWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateKeyframesWithDuration:delay:options:animations:completion:",  0LL,  v27,  &v21,  1.0,  0.0);

        uint64_t v10 = v28;
        goto LABEL_23;
      }
    }

    else if (v12 <= a3)
    {
      goto LABEL_20;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView"));

    [v8 setAlpha:0.0];
    CGAffineTransformMakeScale(&v38, 0.7, 0.7);
    [v8 setTransform:&v38];
    -[TVHOneUpView addSubview:](self, "addSubview:", v8);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000359F4;
    v35[3] = &unk_1000FCDB8;
    v36 = v8;
    v37 = v18;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100035B5C;
    v32[3] = &unk_1000FDC18;
    double v7 = v37;
    v33 = v7;
    v34 = self;
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateKeyframesWithDuration:delay:options:animations:completion:",  0LL,  v35,  v32,  1.0,  0.0);

    uint64_t v10 = v36;
    goto LABEL_23;
  }

  if (v7)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1000359DC;
    v41[3] = &unk_1000FDC18;
    v41[4] = self;
    v42 = v7;
    +[UIView transitionFromView:toView:duration:options:completion:]( &OBJC_CLASS___UIView,  "transitionFromView:toView:duration:options:completion:",  v42,  v8,  0LL,  v41,  0.0);

    goto LABEL_10;
  }

  -[TVHOneUpView addSubview:](self, "addSubview:", v8);
  if ((id)-[TVHOneUpView transition](self, "transition") != (id)2) {
    goto LABEL_15;
  }
LABEL_14:
  -[TVHOneUpView addSubview:](self, "addSubview:", v8);
  double v7 = 0LL;
LABEL_24:
  self->_focusedItemIndex = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView delegate](self, "delegate"));
    objc_msgSend( v19,  "oneUpView:didFocusItemAtIndex:",  self,  -[TVHOneUpView focusedItemIndex](self, "focusedItemIndex"));
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVHOneUpView currentView](self, "currentView", v21, v22, v23, v24));
  -[TVHOneUpView setSpareView:](self, "setSpareView:", v20);

  -[TVHOneUpView setCurrentView:](self, "setCurrentView:", v8);
LABEL_27:
}

  return v18;
}

  return v7;
}

id sub_1000359DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeItemViewInUse:*(void *)(a1 + 40)];
}

id sub_1000359E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeItemViewInUse:*(void *)(a1 + 40)];
}

void sub_1000359F4(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100035AD8;
  v4[3] = &unk_1000FCEA8;
  id v5 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v4,  0.3,  0.7);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100035B28;
  v2[3] = &unk_1000FCEA8;
  id v3 = *(id *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v2,  0.0,  0.7);
}

id sub_100035AD8(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.0, 1.0);
  return [v2 setTransform:&v4];
}

id sub_100035B28(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCenter:v2 + 2160.0];
}

id sub_100035B5C(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 40) + 88LL) = 0;
  return [*(id *)(a1 + 40) _performNextEventTransitionIfRequired];
}

void sub_100035B9C(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100035C88;
  v5[3] = &unk_1000FCEA8;
  id v6 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v5,  0.0,  0.7);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100035CDC;
  v2[3] = &unk_1000FDBF0;
  id v3 = *(id *)(a1 + 40);
  __int128 v4 = *(_OWORD *)(a1 + 48);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v2,  0.3,  0.7);
}

id sub_100035C88(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.7, 0.7);
  return [v2 setTransform:&v4];
}

id sub_100035CDC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id sub_100035CEC(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.0, 1.0);
  [v2 setTransform:&v4];
  [*(id *)(a1 + 40) _removeItemViewInUse:*(void *)(a1 + 32)];
  *(_BYTE *)(*(void *)(a1 + 40) + 88LL) = 0;
  return [*(id *)(a1 + 40) _performNextEventTransitionIfRequired];
}

id sub_100035F3C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "setPosition:", *(double *)(a1 + 64), *(double *)(a1 + 72));
}

id sub_100035F6C(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 40) + 88LL) = 0;
  return [*(id *)(a1 + 40) _performNextEventTransitionIfRequired];
}

void sub_100036214( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10003622C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003623C(uint64_t a1)
{
}

void sub_100036244(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

void sub_100036344(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    id v7 = (id)(*(uint64_t (**)(uint64_t, id))(v6 + 16))(v6, [v11 integerValue]);
  }
  else {
    id v7 = [v11 integerValue];
  }
  id v8 = v7;
  id v9 = *(_BYTE **)(a1 + 32);
  if ((v9[24] & 0x20) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
    [v10 oneUpView:*(void *)(a1 + 32) didEndDisplayingView:v5 forItemAtIndex:v8];
  }
}

void sub_1000373D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000373F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didSelectContentDescriptionText];
}

id sub_100037E0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    double v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIMenu menuWithTitle:children:]( &OBJC_CLASS___UIMenu,  "menuWithTitle:children:",  v1,  *(void *)(a1 + 40)));
  }
  else {
    double v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](&OBJC_CLASS___UIMenu, "menuWithChildren:", *(void *)(a1 + 40)));
  }
  return v2;
}

id sub_100038C80(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateColors];
}

void sub_1000390C8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockup]);
  [v2 setHighlighted:*(unsigned __int8 *)(a1 + 40)];
}

void sub_10003A334(id a1, TVHRootViewController *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](a2, "stateMachine"));
  [v2 postEvent:@"MediaServerDiscoveryConfigurationDidChange" withContext:0 userInfo:0];
}

void sub_10003A374(id a1, TVHRootViewController *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](a2, "stateMachine"));
  [v2 postEvent:@"MediaLibrariesDidChange" withContext:0 userInfo:0];
}

void sub_10003A4C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    CGAffineTransform v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentMediaLibrary]);

    if (v3 == v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      v9[0] = @"MediaLibrary";
      v9[1] = @"MediaLibraryConnectionState";
      uint64_t v6 = *(void *)(a1 + 48);
      v10[0] = v5;
      v10[1] = v6;
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
      [v8 postEvent:@"CurrentMediaLibraryConnectionStateDidChange" withContext:0 userInfo:v7];
    }

    objc_msgSend( WeakRetained,  "_mediaLibrary:connectionStateDidChange:",  *(void *)(a1 + 32),  objc_msgSend(*(id *)(a1 + 48), "unsignedIntegerValue"));
  }
}

void sub_10003AF34( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20, id *a21, id *a22)
{
}

NSString *__cdecl sub_10003B090(id a1, TVHRootViewController *a2, TVHKMediaLibrary *a3, id *a4)
{
  uint64_t v6 = a2;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = -[TVHKMediaLibrary connectionState](v7, "connectionState");
  if (v9 == (id)2)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVHRootViewController _browseViewControllersAndClearOpenURLWithMediaLibrary:]( v6,  "_browseViewControllersAndClearOpenURLWithMediaLibrary:",  v7));
    -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v10);

    id v11 = @"BrowsingMediaLibrary";
  }

  else
  {
    id v12 = v9;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController _activityIndicatorViewController](v6, "_activityIndicatorViewController"));
    -[NSMutableArray addObject:](v8, "addObject:", v13);
    if (v12 != (id)1)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController stateMachine](v6, "stateMachine"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10003B1E8;
      v16[3] = &unk_1000FCEA8;
      id v17 = v7;
      [v14 executeBlockAfterCurrentStateTransition:v16];
    }

    id v11 = @"ConnectingMediaLibrary";
  }

  -[TVHRootViewController setCurrentMediaLibrary:](v6, "setCurrentMediaLibrary:", v7);
  if (a4) {
    *a4 = -[NSMutableArray copy](v8, "copy");
  }

  return &v11->isa;
}

id sub_10003B1E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectWithCompletionHandler:0];
}

__CFString *sub_10003B1F4(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaServerDiscoveryConfiguration]);

  if (([v7 isDiscoveringMediaServers] & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 _setupHomeSharingViewController]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 _navigationController]);
    v39 = v8;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
    [v9 setViewControllers:v13];
    uint64_t v16 = @"ShowingHomeSharingSetup";
    goto LABEL_30;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _mediaLibrariesManager]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaLibraries]);
  id v10 = [v9 count];
  if ((a3 & 2) == 0 || v10)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 openURL]);
    uint64_t v18 = v17;
    if (!v17)
    {
      __int128 v13 = 0LL;
      goto LABEL_17;
    }

    if ([v17 requiresMediaLibrary])
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v5 _mediaLibraryForOpenURL:v18]);
      if (v19)
      {
        __int128 v13 = (void *)v19;
LABEL_16:
        a3 = 1;
LABEL_17:
        [v5 _stopMediaLibrariesWaitTimer];
        __int128 v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        if ([v7 isDiscoveringMediaServers])
        {
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v8 connectableMediaLibraries]);
          __int128 v22 = v21;
          if (v13
            || (id v28 = [v21 count], (a3 & 1) != 0)
            && v28 == (id)1
            && (__int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v22 anyObject])) != 0)
          {
            uint64_t v23 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
            uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue(v23);
            id v24 = 0LL;
            -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v24);
            v35 = v20;
            uint64_t v25 = v18;
            id v26 = [v22 count];

            BOOL v27 = (unint64_t)v26 >= 2;
            uint64_t v18 = v25;
            __int128 v20 = v35;
            if (!v27) {
              goto LABEL_28;
            }
          }

          else
          {
            if (![v9 count])
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue([v5 _noMediaLibrariesDiscoveredViewController]);
              -[NSMutableArray addObject:](v20, "addObject:", v34);

              __int128 v13 = 0LL;
              uint64_t v16 = @"ShowingNoMediaLibraries";
              goto LABEL_28;
            }

            __int128 v13 = 0LL;
            uint64_t v16 = @"ShowingMediaLibraryPicker";
          }

          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mediaLibraryPickerViewController", v35));
          -[NSMutableArray insertObject:atIndex:](v20, "insertObject:atIndex:", v29, 0LL);
        }

        else
        {
          uint64_t v16 = 0LL;
        }

LABEL_28:
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_navigationController", v35));
        [v30 setViewControllers:v20];

LABEL_29:
        goto LABEL_30;
      }

      if ((a3 & 2) != 0)
      {
        __int128 v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v5 _activityIndicatorViewController]);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v5 _navigationController]);
        v37 = v20;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
        [v32 setViewControllers:v33];

        [v5 _startMediaLibrariesWaitTimer];
        __int128 v13 = 0LL;
        uint64_t v16 = @"WaitingForMediaLibraries";
        goto LABEL_29;
      }

      [v5 setOpenURL:0];
      uint64_t v18 = 0LL;
    }

    __int128 v13 = 0LL;
    goto LABEL_16;
  }

  id v11 = sub_100079F98();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No media libraries have been found. Will start waiting.",  buf,  2u);
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 _activityIndicatorViewController]);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 _navigationController]);
  v38 = v13;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
  [v14 setViewControllers:v15];

  [v5 _startMediaLibrariesWaitTimer];
  uint64_t v16 = @"WaitingForMediaLibraries";
LABEL_30:

  return v16;
}

id sub_10003B620(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setOpenURL:0];

  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

__CFString *sub_10003B698(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!+[TVSNetworkUtilities physicalNetworkAvailable]( &OBJC_CLASS___TVSNetworkUtilities,  "physicalNetworkAvailable"))
    {
      uint64_t v8 = TVHKError(-2LL, 0LL);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      [WeakRetained _presentFatalErrorDialogWithError:v9];

      id v7 = @"ShowingFatalError";
      goto LABEL_7;
    }

    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  id v7 = (__CFString *)v6;
LABEL_7:

  return v7;
}

id sub_10003B74C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v5 terminateWithSuccess];
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);

  return v6;
}

id sub_10003B7C0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"URL"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVHURL URLFromURL:](&OBJC_CLASS___TVHURL, "URLFromURL:", v10));
    [WeakRetained setOpenURL:v11];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
    if (v11)
    {
      uint64_t v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

      id v12 = (void *)v14;
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  return v12;
}

id sub_10003B8B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  id v7 = (void *)v6;

  return v7;
}

id sub_10003B92C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"ViewController"]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___TVHMediaLibraryPickerViewController);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10003BA84;
      v19[3] = &unk_1000FCEF8;
      objc_copyWeak(&v20, v13);
      [v9 executeBlockAfterCurrentStateTransition:v19];
      objc_destroyWeak(&v20);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 currentState]);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 currentState]);
  }

  return v17;
}

void sub_10003BA70(_Unwind_Exception *a1)
{
}

void sub_10003BA84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  [v1 postEvent:@"MediaLibraryPickerDocumentWillAppear" withContext:0 userInfo:0];
}

id sub_10003BAD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  id v7 = (void *)v6;

  return v7;
}

id sub_10003BB4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _mediaLibrariesManager]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaLibraries]);
    id v7 = [v6 count];

    if ((unint64_t)v7 < 2)
    {
      uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
      uint64_t v8 = objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_6;
    }

    [WeakRetained _updateMediaLibraryPickerController];
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 currentState]);
LABEL_6:
  id v10 = (void *)v8;

  return v10;
}

id sub_10003BC04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _mediaLibrariesManager]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaLibraries]);
    id v7 = [v6 count];

    if ((unint64_t)v7 >= 2)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _navigationController]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 viewControllers]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVHMediaLibraryPickerViewController);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
      {
        id v12 = sub_100079F98();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v18 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "More media libraries have become available while browsing the only media library. Will add the media library view controller into the nav stack.",  v18,  2u);
        }

        id v14 = [v9 mutableCopy];
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _mediaLibraryPickerViewController]);
        [v14 insertObject:v15 atIndex:0];
        [v8 setViewControllers:v14 animated:0];
      }
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);

  return v16;
}

id sub_10003BD80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _presentRestartingMediaLibraryDiscoveryViewController];
    [v5 performSelector:"_dismissRestartingMediaLibraryDiscoveryViewController" withObject:0 afterDelay:5.0];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _mediaLibrariesManager]);
    [v6 stop];
    [v6 start];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  return v7;
}

id sub_10003BE2C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"MediaLibrary"]);
    uint64_t v11 = *(void *)(a1 + 32);
    id v18 = 0LL;
    uint64_t v12 = (*(uint64_t (**)(void))(v11 + 16))();
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = v18;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _navigationController]);
    [v16 pushViewController:v15 animated:1];
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  return v13;
}

__CFString *sub_10003BF30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateMediaLibraryPickerController];
    [v5 setCurrentMediaLibrary:0];
    uint64_t v6 = @"ShowingMediaLibraryPicker";
  }

  else
  {
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  return v6;
}

id sub_10003BFA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  id v7 = (void *)v6;

  return v7;
}

__CFString *sub_10003C01C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int128 v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 currentState]);
  if (WeakRetained)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"MediaLibrary"]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"MediaLibraryConnectionState"]);
    id v18 = [v17 unsignedIntegerValue];

    if (v18 == (id)2)
    {
      id v28 = v10;
      id v21 = sub_100079F98();
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Connected to media server", buf, 2u);
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _browseViewControllersAndClearOpenURLWithMediaLibrary:v16]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _navigationController]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 viewControllers]);
      id v26 = [v25 mutableCopy];

      [v26 removeLastObject];
      [v26 addObjectsFromArray:v23];
      [v24 setViewControllers:v26 animated:0];

      __int128 v15 = @"BrowsingMediaLibrary";
      id v10 = v28;
    }

    else if (!v18)
    {
      id v19 = sub_100079F98();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Media library connection failed while trying to browse a media library. Will show the connection failed error.",  buf,  2u);
      }

      [WeakRetained setCurrentMediaLibrary:0];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10003C2A4;
      v29[3] = &unk_1000FCEF8;
      objc_copyWeak(&v30, v13);
      [WeakRetained _presentConnectionFailedDialogWithMediaLibrary:v16 completionHandler:v29];

      objc_destroyWeak(&v30);
      __int128 v15 = @"ShowingConnectionFailedError";
    }
  }

  return v15;
}

void sub_10003C290(_Unwind_Exception *a1)
{
}

void sub_10003C2A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  [v1 postEvent:@"FinishedShowingConnectionFailedError" withContext:0 userInfo:0];
}

id sub_10003C2F8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 currentState]);

  if (WeakRetained)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"MediaLibraryConnectionState"]);
    id v12 = [v11 unsignedIntegerValue];

    if (!v12)
    {
      id v13 = sub_100079F98();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Disconnected while browsing media library. Resetting UI.",  v18,  2u);
      }

      [WeakRetained setCurrentMediaLibrary:0];
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);

      id v10 = (void *)v16;
    }
  }

  return v10;
}

id sub_10003C410(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = sub_100079F98();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Finished showing the connection error. Resetting UI.",  v11,  2u);
    }

    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  id v9 = (void *)v8;

  return v9;
}

id sub_10003C4D0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ViewController"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Animate"]);
    id v12 = [v11 BOOLValue];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RemovePlaybackViewControllers"]);
    id v14 = [v13 BOOLValue];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ViewControllersToRemove"]);
    [WeakRetained _addViewControllerToNavigationController:v10 animate:v12 removePlaybackViewControllers:v14 otherViewControllersToRemove:v15];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  return v16;
}

id sub_10003C5F4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ViewController"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Animate"]);
    id v12 = [v11 BOOLValue];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"CanReuseExistingPlaybackViewController"]);
    unsigned int v14 = [v13 BOOLValue];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ViewControllersToRemove"]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _navigationController]);
    id v17 = v16;
    if (!v14
      || (id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 topViewController]),
          unsigned __int8 v19 = [v18 conformsToProtocol:&OBJC_PROTOCOL___TVHPlaybackViewController],
          v18,
          (v19 & 1) == 0))
    {
      [*(id *)(a1 + 32) _addViewControllerToNavigationController:v10 animate:v12 removePlaybackViewControllers:1 otherViewControllersToRemove:v15];
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  return v20;
}

id sub_10003C760(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Animate"]);
    id v11 = [v10 BOOLValue];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _navigationController]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvh_viewControllersWithNoPlaybackViewControllers"));
    [v12 setViewControllers:v13 animated:v11];
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  else
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  return v14;
}

uint64_t sub_10003CBFC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10003CDAC(id a1, UIAlertAction *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v2 terminateWithSuccess];
}

void sub_10003D088(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    id WeakRetained = v3;
  }
}

void sub_10003D3EC(uint64_t a1)
{
  id v2 = sub_100079F98();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Media libraries wait timer expired.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  [v5 postEvent:@"MediaLibrariesWaitTimerDidFire"];
}

void sub_10003DA6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

NSString *__cdecl sub_10003DA94(id a1, NSIndexPath *a2, id a3)
{
  return (NSString *)@"CellIdentifier";
}

void sub_10003DAA0(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 withIdentifier:v5];
}

void sub_10003E5F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

NSString *__cdecl sub_10003E628(id a1, NSIndexPath *a2)
{
  return (NSString *)@"TVHMusicSongListViewCell";
}

void sub_10003E634(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 atIndexPath:v5];
}

id sub_10003E698(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if ([a3 isEqualToString:UICollectionElementKindSectionHeader])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _sectionHeaderViewForCollectionView:v7 atIndexPath:v8]);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

id sub_10003E98C(uint64_t a1)
{
  return +[UIMenu tvh_contextMenuWithMediaItem:options:]( &OBJC_CLASS___UIMenu,  "tvh_contextMenuWithMediaItem:options:",  *(void *)(a1 + 32),  3LL);
}

void sub_10003ECD8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 dataSource]);
  [v4 setCurrentSortOption:v3];
}

id sub_10003F638(uint64_t a1)
{
  return [*(id *)(a1 + 32) contentViewSize];
}

id sub_10003F640(uint64_t a1)
{
  return [*(id *)(a1 + 32) contentViewToFooterViewSpacing];
}

id sub_10003F648(uint64_t a1)
{
  return [*(id *)(a1 + 32) footerViewLayout];
}

void sub_10003FBE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10003FC04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003FC14(uint64_t a1)
{
}

void sub_10003FC1C(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) itemIdentifiersInSectionWithIdentifier:a2]);
  id v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](&OBJC_CLASS___NSIndexPath, "indexPathForItem:inSection:", 0LL, a3));
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }

void sub_10003FF60( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_10003FF88(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _cellForCollectionView:v9 atIndexPath:v8 withItemIdentifier:v7]);

  return v11;
}

id sub_100040268(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateVisibleCellsWithItemIdentifiers:a2];
}

void sub_100040274(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) collectionView]);
  [v1 setNeedsLayout];
}

void sub_1000407D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

id sub_1000407F0(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _previewViewControllerForIndexPath:v3]);

  return v5;
}

void sub_100041BD0(id a1, AVAudioSession *a2)
{
  id v2 = a2;
  id v3 = sub_100079E48();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting audio session category with default mode",  buf,  2u);
  }

  id v9 = 0LL;
  unsigned __int8 v5 = -[AVAudioSession setCategory:mode:options:error:]( v2,  "setCategory:mode:options:error:",  AVAudioSessionCategoryPlayback,  AVAudioSessionModeDefault,  0LL,  &v9);

  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    id v7 = sub_100079E48();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009C304((uint64_t)v6, v8);
    }
  }
}

void sub_1000423B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000423D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _displayCollectionForMediaItem:*(void *)(a1 + 32) collectionType:1];
}

void sub_10004256C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100042590(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _displayCollectionForMediaItem:*(void *)(a1 + 32) collectionType:2];
}

void sub_100045260( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_100045288(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _cellForCollectionView:v9 withIdentifier:v7 atIndexPath:v8]);

  return v11;
}

id sub_1000456C0(id a1, TVHKMediaLibrary *a2)
{
  return -[TVHKMediaLibrary identifier](a2, "identifier");
}

int64_t sub_1000458B4(id a1, id a2, id a3)
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([a2 title]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id sub_1000462B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateColors];
}

void sub_100046EF4(_Unwind_Exception *a1)
{
}

void sub_100046F10(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] layer]);
  [v2 setShouldRasterize:0];

  id v3 = a1[5];
  __int128 v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v7[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v7[1] = v4;
  v7[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v3 setTransform:v7];
  [a1[5] setAlpha:1.0];
  [a1[5] removeFromSuperview];
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([a1[5] layer]);
  [v5 setShouldRasterize:0];

  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend( WeakRetained,  "completeTransition:",  objc_msgSend(WeakRetained, "transitionWasCancelled") ^ 1);
}

id sub_100046FC4(uint64_t a1)
{
  return [*(id *)(a1 + 40) setAlpha:1.0];
}

void sub_100046FF4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CATransaction animationTimingFunction](&OBJC_CLASS___CATransaction, "animationTimingFunction"));
  LODWORD(v3) = 1051260355;
  LODWORD(v4) = 1040522936;
  LODWORD(v5) = 1041865114;
  LODWORD(v6) = 1.0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v3,  v4,  v5,  v6));
  +[CATransaction setAnimationTimingFunction:](&OBJC_CLASS___CATransaction, "setAnimationTimingFunction:", v7);

  id v8 = *(void **)(a1 + 32);
  __int128 v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v8 setTransform:v12];
  uint64_t v10 = *(void **)(a1 + 40);
  CGAffineTransformMakeScale(&v11, 0.8, 0.8);
  [v10 setTransform:&v11];
  +[CATransaction setAnimationTimingFunction:](&OBJC_CLASS___CATransaction, "setAnimationTimingFunction:", v2);
}

uint64_t sub_1000470D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

BOOL sub_100047A64(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = v4;
  if (v3
    && (id v6 = [v4 numberOfSections], (uint64_t)objc_msgSend(v3, "section") >= 1)
    && (id v7 = [v3 section], v7 < v6)
    && (id v8 = v7, (uint64_t)[v3 row] >= 1))
  {
    id v9 = [v5 numberOfItemsInSection:v8];
    BOOL v10 = [v3 row] < v9;
  }

  else
  {
    BOOL v10 = 0LL;
  }

  return v10;
}

id sub_100047FB0(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_CLASS___TVHCollectionView;
  return objc_msgSendSuper2( &v2,  "setContentInset:",  *(double *)(a1 + 40),  *(double *)(a1 + 48),  *(double *)(a1 + 56),  *(double *)(a1 + 64));
}

void sub_100048370( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100048388(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  LOBYTE(v3) = [v5 collectionView:*(void *)(a1 + 32) shouldHandleLongPressForItemAtIndexPath:v4];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)v3;
}

void sub_1000484E8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  [v5 collectionView:*(void *)(a1 + 32) didPlayItemAtIndexPath:v4];
}

void sub_1000485B4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  [v5 collectionView:*(void *)(a1 + 32) didLongPressItemAtIndexPath:v4];
}

LABEL_8:
}

    id v9 = 1;
    goto LABEL_14;
  }

  id v9 = 0;
  if ((id)v7 == v4 && !v6)
  {
LABEL_11:
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 player]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));
    id v9 = v14 != v15;

    if (v5 != v4 || v14 != v15) {
      goto LABEL_14;
    }
LABEL_13:
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaybackManager videoPlaybackContexts](self, "videoPlaybackContexts"));
    id v9 = [v16 count] == 0;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController productViewController](self, "productViewController"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bannerView]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 infoView]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 controls]);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);

  [v19 setTitle:v20];
  [v19 setTitleTextColor:v12];
}

void sub_1000490E4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10004AD5C(void *a1)
{
  id v3 = a1;
  id v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  objc_super v2 = (void *)v3[14];
  v3[14] = v1;

  [v3 setListViewBackdropMode:1];
  [v3 setListViewBackdropSize:1];
  objc_msgSend(v3, "setListViewMargin:", 249.0, 0.0, 205.0, 116.0);
  [v3 setListViewRespectSafeAreaInsets:0];
  [v3 setAnimatesPreviewTransition:0];
  [v3 setDelegate:v3];
}

BOOL sub_10004C680(id a1, TVHKMediaEntity *a2)
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntity type](a2, "type"));
  BOOL v3 = [v2 subtype] == (id)1;

  return v3;
}

void sub_10004CDFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    IOHIDEventSystemClientDispatchEvent(WeakRetained[1], *(void *)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_10004CEC4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = objc_alloc(&OBJC_CLASS___TVHShelfView);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v6 bounds];
  id v7 = -[TVHShelfView initWithFrame:layout:](v5, "initWithFrame:layout:", v3);

  id v8 = v4[2];
  v4[2] = v7;

  [v4[2] setAutoresizingMask:18];
  id v9 = v4[2];

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v9 setBackgroundColor:v10];
}

LABEL_34:
        id v20 = 0LL;
        goto LABEL_35;
      }

      if (v15 != (id)1)
      {
LABEL_31:
        id v20 = 0LL;
        goto LABEL_36;
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 albumIdentifier]);
      if (!v16) {
        goto LABEL_34;
      }
      id v17 = -[TVHMusicAlbumLookupViewController initWithAlbumIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicAlbumLookupViewController),  "initWithAlbumIdentifier:mediaLibrary:",  v16,  v6);
LABEL_25:
      id v20 = (TVHShowSeasonLookupViewController *)v17;
LABEL_35:

LABEL_36:
      return v20;
    case 2uLL:
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemIdentifier]);
      if (!v16) {
        goto LABEL_34;
      }
      id v17 = -[TVHMovieRentalLookupViewController initWithMovieRentalIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMovieRentalLookupViewController),  "initWithMovieRentalIdentifier:mediaLibrary:",  v16,  v6);
      goto LABEL_25;
    case 3uLL:
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemIdentifier]);
      if (!v16) {
        goto LABEL_34;
      }
      id v17 = -[TVHMovieLookupViewController initWithMovieIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMovieLookupViewController),  "initWithMovieIdentifier:mediaLibrary:",  v16,  v6);
      goto LABEL_25;
    case 4uLL:
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 seasonIdentifier]);
      id v18 = objc_claimAutoreleasedReturnValue([v5 showTitle]);
      unsigned __int8 v19 = (void *)v18;
      id v20 = 0LL;
      if (v16 && v18) {
        id v20 = -[TVHShowSeasonLookupViewController initWithShowTitle:seasonIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHShowSeasonLookupViewController),  "initWithShowTitle:seasonIdentifier:mediaLibrary:",  v18,  v16,  v6);
      }

      goto LABEL_35;
    case 5uLL:
      id v21 = sub_10007A158();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009C59C();
      }
      goto LABEL_30;
    case 6uLL:
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 albumIdentifier]);
      if (!v16) {
        goto LABEL_34;
      }
      id v17 = -[TVHPodcastLookupViewController initWithPodcastIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHPodcastLookupViewController),  "initWithPodcastIdentifier:mediaLibrary:",  v16,  v6);
      goto LABEL_25;
    case 7uLL:
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 albumIdentifier]);
      if (!v16) {
        goto LABEL_34;
      }
      id v17 = -[TVHITunesUCourseLookupViewController initWithITunesUCourseIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHITunesUCourseLookupViewController),  "initWithITunesUCourseIdentifier:mediaLibrary:",  v16,  v6);
      goto LABEL_25;
    case 8uLL:
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 albumIdentifier]);
      if (!v16) {
        goto LABEL_34;
      }
      id v17 = -[TVHAudiobookLookupViewController initWithAudiobookIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHAudiobookLookupViewController),  "initWithAudiobookIdentifier:mediaLibrary:",  v16,  v6);
      goto LABEL_25;
    case 9uLL:
      __int128 v22 = sub_10007A158();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009C62C();
      }
      goto LABEL_30;
    default:
      goto LABEL_31;
  }

id sub_10004E134(uint64_t a1)
{
  return [*(id *)(a1 + 40) setAlpha:1.0];
}

id sub_10004E164(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "didMoveToParentViewController:");
}

id sub_10004E290(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 40) + 32) setAlpha:0.0];
}

uint64_t sub_10004E2CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 16) removeFromParentViewController];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0LL;

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

BOOL sub_10004ECC4(id a1, UIPress *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = (id)-[UIPress type](v2, "type") == (id)4 || (id)-[UIPress type](v2, "type") == (id)6;

  return v3;
}

void sub_10004ED38(id a1)
{
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHListViewCell);
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFloatingContentView appearanceWhenContainedInInstancesOfClasses:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedInInstancesOfClasses:",  v1));

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  2LL));
  [v2 setFocusAnimationConfiguration:v3];
}

void sub_10004F9DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

NSString *__cdecl sub_10004FA04(id a1, NSIndexPath *a2, id a3)
{
  return (NSString *)@"CellIdentifier";
}

void sub_10004FA10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 withIdentifier:v5];
}

void sub_10004FD58(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"selectedMediaCategoryType", 0LL));
  uint64_t v2 = (void *)qword_100157300;
  qword_100157300 = v1;
}

TVHMediaEntitiesShelfViewController *sub_100050E88(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  CGAffineTransform v11 = (void *)objc_claimAutoreleasedReturnValue([v7 _shelfViewLayout]);
  objc_msgSend(v11, "setHeaderViewMargin:", 0.0, 90.0, 12.0, 0.0);
  id v12 = -[TVHMediaEntitiesShelfViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesShelfViewController),  "initWithDataSource:layout:",  v10,  v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController titleLabel](v12, "titleLabel"));
  [v13 setText:v9];

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
  [v13 setFont:v14];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicAlbumArtist](&OBJC_CLASS___TVHKMediaEntityType, "musicAlbumArtist"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v15));
  unsigned int v17 = [v8 isEqualToSet:v16];

  id v18 = &off_1000FC3E8;
  if (!v17) {
    id v18 = off_1000FC4E8;
  }
  -[TVHMediaEntitiesShelfViewController setLockupClass:](v12, "setLockupClass:", objc_opt_class(*v18));
  -[TVHMediaEntitiesShelfViewController setDelegate:](v12, "setDelegate:", *(void *)(a1 + 32));
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](v12, "collectionView"));
  objc_msgSend(v19, "setContentInset:", 0.0, 90.0, 0.0, 90.0);

  return v12;
}

void sub_10005128C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

NSString *__cdecl sub_1000512B4(id a1, NSIndexPath *a2, id a3)
{
  return (NSString *)@"CellReuseIdentifier";
}

void sub_1000512C0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 withIdentifier:v5];
}

LABEL_6:
}

  -[TVHMediaImageView _updateImageViewApperance](self, "_updateImageViewApperance");
}

void sub_100051AE4(id a1)
{
  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType audiobook](&OBJC_CLASS___TVHKMediaEntityType, "audiobook"));
  -[NSMutableArray addObject:](v20, "addObject:", v1);

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType audiobookChapter](&OBJC_CLASS___TVHKMediaEntityType, "audiobookChapter"));
  -[NSMutableArray addObject:](v20, "addObject:", v2);

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType homeVideo](&OBJC_CLASS___TVHKMediaEntityType, "homeVideo"));
  -[NSMutableArray addObject:](v20, "addObject:", v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType iTunesUCourse](&OBJC_CLASS___TVHKMediaEntityType, "iTunesUCourse"));
  -[NSMutableArray addObject:](v20, "addObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType iTunesUAudioEpisode](&OBJC_CLASS___TVHKMediaEntityType, "iTunesUAudioEpisode"));
  -[NSMutableArray addObject:](v20, "addObject:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType iTunesUVideoEpisode](&OBJC_CLASS___TVHKMediaEntityType, "iTunesUVideoEpisode"));
  -[NSMutableArray addObject:](v20, "addObject:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType movie](&OBJC_CLASS___TVHKMediaEntityType, "movie"));
  -[NSMutableArray addObject:](v20, "addObject:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType movieRental](&OBJC_CLASS___TVHKMediaEntityType, "movieRental"));
  -[NSMutableArray addObject:](v20, "addObject:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicAlbum](&OBJC_CLASS___TVHKMediaEntityType, "musicAlbum"));
  -[NSMutableArray addObject:](v20, "addObject:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicAlbumArtist](&OBJC_CLASS___TVHKMediaEntityType, "musicAlbumArtist"));
  -[NSMutableArray addObject:](v20, "addObject:", v10);

  CGAffineTransform v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicSong](&OBJC_CLASS___TVHKMediaEntityType, "musicSong"));
  -[NSMutableArray addObject:](v20, "addObject:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicVideo](&OBJC_CLASS___TVHKMediaEntityType, "musicVideo"));
  -[NSMutableArray addObject:](v20, "addObject:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType podcast](&OBJC_CLASS___TVHKMediaEntityType, "podcast"));
  -[NSMutableArray addObject:](v20, "addObject:", v13);

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType podcastAudioEpisode](&OBJC_CLASS___TVHKMediaEntityType, "podcastAudioEpisode"));
  -[NSMutableArray addObject:](v20, "addObject:", v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType podcastVideoEpisode](&OBJC_CLASS___TVHKMediaEntityType, "podcastVideoEpisode"));
  -[NSMutableArray addObject:](v20, "addObject:", v15);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType show](&OBJC_CLASS___TVHKMediaEntityType, "show"));
  -[NSMutableArray addObject:](v20, "addObject:", v16);

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType showEpisode](&OBJC_CLASS___TVHKMediaEntityType, "showEpisode"));
  -[NSMutableArray addObject:](v20, "addObject:", v17);

  id v18 = -[NSMutableArray copy](v20, "copy");
  unsigned __int8 v19 = (void *)qword_100157310;
  qword_100157310 = (uint64_t)v18;
}

LABEL_24:
  id v26 = width;
  BOOL v27 = height;
  result.double height = v27;
  result.double width = v26;
  return result;
}

  v38 = 0;
  v37 = 0LL;
LABEL_25:
  v61 = _NSConcreteStackBlock;
  v62 = v8[2];
  v39 = v62;
  v63 = sub_1000903F4;
  v64 = &unk_1000FFA38;
  v65 = self;
  v40 = v14;
  v66 = v40;
  v41 = v6;
  v67 = v41;
  v42 = v7;
  v68 = v42;
  v43 = objc_retainBlock(&v61);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = v39;
  v59[2] = sub_100090430;
  v59[3] = &unk_1000FD260;
  v60 = a4;
  v59[4] = self;
  v44 = objc_retainBlock(v59);
  v45 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesDataSource changeSetDataSourceContentProviderDelegate]( self,  "changeSetDataSourceContentProviderDelegate"));
  if (v45)
  {
    v57[0] = _NSConcreteStackBlock;
    v57[1] = v39;
    v57[2] = sub_100090498;
    v57[3] = &unk_1000FEA20;
    v58 = v43;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = v39;
    v55[2] = sub_1000904A4;
    v55[3] = &unk_1000FEA20;
    v56 = v44;
    [v45 changeSetDataSourceContentProvider:self contentDidChangeWithSectionsChangeSet:v37 updateUnderlyingModelHandler:v57 animateChang es:v38 completionHandler:v55];
  }

  else
  {
    ((void (*)(void ***))v43[2])(v43);
    ((void (*)(void *))v44[2])(v44);
  }
}

void sub_1000525CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

NSString *__cdecl sub_1000525F4(id a1, NSIndexPath *a2, id a3)
{
  return (NSString *)@"PhotoItemCellIdentifier";
}

void sub_100052600(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 withIdentifier:v5];
}

void sub_1000544C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

NSString *__cdecl sub_1000544E8(id a1, NSIndexPath *a2)
{
  return (NSString *)@"MediaItemCellIdentifier";
}

void sub_1000544F4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _delegateConfigureCell:v6 atIndexPath:v5];
}

id sub_100054814(uint64_t a1)
{
  return +[UIMenu tvh_contextMenuWithMediaItem:options:]( UIMenu,  "tvh_contextMenuWithMediaItem:options:",  *(void *)(a1 + 40),  [*(id *)(a1 + 32) _delegateContextMenuOptionsForMediaItem:*(void *)(a1 + 40)]);
}

id sub_100054A6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDescriptionPreviewViewAtIndexPath:*(void *)(a1 + 40)];
}

id sub_1000561A4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [(id)objc_opt_class(v2) _nameLabel];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 setText:v3];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHVibrantLabelView vibrantLabelViewWithLabel:]( &OBJC_CLASS___TVHVibrantLabelView,  "vibrantLabelViewWithLabel:",  v5));
  return v6;
}

void sub_1000569F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deleteChange]);
  objc_msgSend(v3, "_tvh_applyDeleteSectionsChange:applyChangeHandler:", v4, *(void *)(a1 + 64));

  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) insertChange]);
  objc_msgSend(v5, "_tvh_applyInsertSectionsChange:applyChangeHandler:", v6, *(void *)(a1 + 64));

  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) moveChanges]);
  objc_msgSend(v7, "_tvh_applyMoveSectionsChanges:applyChangeHandler:", v8, *(void *)(a1 + 64));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) amendChanges]);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 amendChangeSet]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 sourceIndexes]);
        id v17 = [v16 firstIndex];

        id v18 = *(void **)(a1 + 32);
        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v15 deleteChange]);
        objc_msgSend( v18,  "_tvh_applyDeleteItemsChange:sectionIndex:applyChangeHandler:",  v19,  v17,  *(void *)(a1 + 64));

        id v20 = *(void **)(a1 + 32);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 insertChange]);
        objc_msgSend( v20,  "_tvh_applyInsertItemsChange:sectionIndex:applyChangeHandler:",  v21,  v17,  *(void *)(a1 + 64));

        __int128 v22 = *(void **)(a1 + 32);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v15 moveChanges]);
        objc_msgSend(v22, "_tvh_applyMoveItemsChanges:sectionIndex:applyChangeHandler:", v23, v17, *(void *)(a1 + 64));

        id v24 = (void *)objc_claimAutoreleasedReturnValue([v15 amendChanges]);
        if (v24)
        {
          uint64_t v25 = *(void **)(a1 + 48);
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v17));
          [v25 setObject:v24 forKey:v26];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v11);
  }
}

void sub_100056C6C(uint64_t a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100056D04;
  v6[3] = &unk_1000FE308;
  id v4 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
}

void sub_100056D04(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  objc_msgSend( v5,  "_tvh_applyAmendItemsChanges:sectionIndex:applyChangeHandler:",  v6,  objc_msgSend(a2, "unsignedIntegerValue"),  *(void *)(a1 + 40));
}

void sub_1000578B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  a2,  *(void *)(a1 + 40)));
  [v2 addObject:v3];
}

BOOL sub_100057DF4(id a1, UIViewController *a2)
{
  return -[UIViewController conformsToProtocol:]( a2,  "conformsToProtocol:",  &OBJC_PROTOCOL___TVHPlaybackViewController) ^ 1;
}

void sub_100058438(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) albumIdentifier]);
  if (v3)
  {
    uint64_t v2 = -[TVHMusicAlbumLookupViewController initWithAlbumIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicAlbumLookupViewController),  "initWithAlbumIdentifier:mediaLibrary:",  v3,  *(void *)(a1 + 40));
    [*(id *)(a1 + 48) pushViewController:v2 animated:1];
  }
}

void sub_1000584A4(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) albumArtistIdentifier]);
  if (v3)
  {
    uint64_t v2 = -[TVHMusicAlbumArtistLookupViewController initWithAlbumArtistIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicAlbumArtistLookupViewController),  "initWithAlbumArtistIdentifier:mediaLibrary:",  v3,  *(void *)(a1 + 40));
    [*(id *)(a1 + 48) pushViewController:v2 animated:1];
  }
}

void sub_100058510(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  objc_msgSend(v2, "tvh_playMediaItemsNext:mediaLibrary:", v3, a1[6]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVHBulletinController sharedController](&OBJC_CLASS___TVHBulletinController, "sharedController"));
  [v4 postPlayNextBulletin];
}

void sub_1000585BC(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  objc_msgSend(v2, "tvh_playMediaItemsLast:mediaLibrary:", v3, a1[6]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVHBulletinController sharedController](&OBJC_CLASS___TVHBulletinController, "sharedController"));
  [v4 postPlayLastBulletin];
}

void sub_100058964(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) playlist]);
  objc_msgSend(v2, "tvh_playMediaItemsNext:mediaLibrary:", *(void *)(a1 + 40), *(void *)(a1 + 48));

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHBulletinController sharedController](&OBJC_CLASS___TVHBulletinController, "sharedController"));
  [v3 postPlayNextBulletin];
}

void sub_1000589C0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) playlist]);
  objc_msgSend(v2, "tvh_playMediaItemsLast:mediaLibrary:", *(void *)(a1 + 40), *(void *)(a1 + 48));

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHBulletinController sharedController](&OBJC_CLASS___TVHBulletinController, "sharedController"));
  [v3 postPlayLastBulletin];
}

void sub_100058B68(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = sub_100058C58;
  id v13 = &unk_1000FE3E8;
  id v7 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v7;
  id v8 = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  0LL,  &v10));

  if (*(void *)(a1 + 48) == a3) {
    objc_msgSend(v9, "_setChecked:", 1, v10, v11, v12, v13, v14, v15);
  }
  objc_msgSend(*(id *)(a1 + 32), "addAction:", v9, v10, v11, v12, v13);
}

uint64_t sub_100058C58(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t start(int a1, char **a2)
{
  id v4 = objc_autoreleasePoolPush();
  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVHApplicationDelegate);
  id v6 = NSStringFromClass(v5);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = UIApplicationMain(a1, a2, 0LL, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_100059680(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a2 mediaItem]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaServerIdentifier]);
  unsigned int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

void sub_10005977C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained interactivePlaylistPlaybackContext]);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playbackViewController]);

    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 delegate]);
    [v4 playbackManager:v5 showPlaybackViewController:v3 options:3 viewControllersToRemove:0];

    id WeakRetained = v5;
  }
}

LABEL_14:
  return v9;
}

  -[TVHMediaLibraryTabBarViewController setMediaCategoryTypes:](self, "setMediaCategoryTypes:", v4);
}

void sub_100059E24(uint64_t a1)
{
  id v2 = sub_100079E48();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10009C918(v3);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendKeepAlive];
}

TVPPlayer *__cdecl sub_10005A2C0(id a1, TVHPlaybackContext *a2)
{
  return (TVPPlayer *)-[TVHPlaybackContext player](a2, "player");
}

BOOL sub_10005A308(id a1, TVPPlayer *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer state](a2, "state"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  BOOL v4 = v2 != v3;

  return v4;
}

BOOL sub_10005A394(id a1, TVHVideoPlaybackContext *a2)
{
  return (id)-[TVHVideoPlaybackContext state](a2, "state") == (id)3;
}

BOOL sub_10005A3F4(id a1, TVHVideoPlaybackContext *a2)
{
  return (id)-[TVHVideoPlaybackContext state](a2, "state") == (id)1;
}

BOOL sub_10005A460(id a1, TVHPlaybackContext *a2)
{
  return -[TVHPlaybackContext usingDiskCaching](a2, "usingDiskCaching");
}

void sub_10005C700(uint64_t a1)
{
  id v2 = sub_10007A1C8();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Rental expiration update timer fired.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePlayButton];
}

uint64_t sub_10005DA04(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  unsigned int v5 = [v3 isEqual:v4];

  return v5 ^ 1;
}

void sub_10005DE2C(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___TVHSortOption);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"ARTIST_SORT_OPTION_TITLE" value:0 table:0]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingArtistTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingArtistTitleSortDescriptor"));
  v9[0] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  v9[1] = v5;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  id v7 = -[TVHSortOption _initWithSortMode:title:sortDescriptors:]( v1,  "_initWithSortMode:title:sortDescriptors:",  0LL,  v3,  v6);
  uint64_t v8 = (void *)qword_100157328;
  qword_100157328 = (uint64_t)v7;
}

void sub_10005DF88(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___TVHSortOption);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"NEWEST_FIRST_SORT_OPTION_TITLE" value:0 table:0]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_descendingReleaseYearSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_descendingReleaseYearSortDescriptor"));
  v9[0] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  v9[1] = v5;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  id v7 = -[TVHSortOption _initWithSortMode:title:sortDescriptors:]( v1,  "_initWithSortMode:title:sortDescriptors:",  1LL,  v3,  v6);
  uint64_t v8 = (void *)qword_100157338;
  qword_100157338 = (uint64_t)v7;
}

void sub_10005E0E4(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___TVHSortOption);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"OLDEST_FIRST_SORT_OPTION_TITLE" value:0 table:0]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingReleaseYearSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingReleaseYearSortDescriptor"));
  v9[0] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  v9[1] = v5;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  id v7 = -[TVHSortOption _initWithSortMode:title:sortDescriptors:]( v1,  "_initWithSortMode:title:sortDescriptors:",  2LL,  v3,  v6);
  uint64_t v8 = (void *)qword_100157348;
  qword_100157348 = (uint64_t)v7;
}

void sub_10005E240(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___TVHSortOption);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"TITLE_SORT_OPTION_TITLE" value:0 table:0]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingPlaylistTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingPlaylistTitleSortDescriptor"));
  uint64_t v8 = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  id v6 = -[TVHSortOption _initWithSortMode:title:sortDescriptors:]( v1,  "_initWithSortMode:title:sortDescriptors:",  6LL,  v3,  v5);
  id v7 = (void *)qword_100157358;
  qword_100157358 = (uint64_t)v6;
}

void sub_10005E384(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___TVHSortOption);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"PLAYLIST_TYPE_SORT_OPTION_TITLE" value:0 table:0]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingPlaylistTypeSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingPlaylistTypeSortDescriptor"));
  v9[0] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingPlaylistTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingPlaylistTitleSortDescriptor"));
  v9[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  id v7 = -[TVHSortOption _initWithSortMode:title:sortDescriptors:]( v1,  "_initWithSortMode:title:sortDescriptors:",  3LL,  v3,  v6);
  uint64_t v8 = (void *)qword_100157368;
  qword_100157368 = (uint64_t)v7;
}

void sub_10005E4E0(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___TVHSortOption);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"RECENTLY_ADDED_SORT_OPTION_TITLE" value:0 table:0]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_descendingAddedDateSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_descendingAddedDateSortDescriptor"));
  v9[0] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  v9[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  id v7 = -[TVHSortOption _initWithSortMode:title:sortDescriptors:]( v1,  "_initWithSortMode:title:sortDescriptors:",  4LL,  v3,  v6);
  uint64_t v8 = (void *)qword_100157378;
  qword_100157378 = (uint64_t)v7;
}

void sub_10005E63C(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___TVHSortOption);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"TITLE_SORT_OPTION_TITLE" value:0 table:0]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingTitleSortDescriptor"));
  uint64_t v8 = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  id v6 = -[TVHSortOption _initWithSortMode:title:sortDescriptors:]( v1,  "_initWithSortMode:title:sortDescriptors:",  5LL,  v3,  v5);
  id v7 = (void *)qword_100157388;
  qword_100157388 = (uint64_t)v6;
}

id sub_10005F260(id a1, TVHCatalogueItem *a2)
{
  id v2 = a2;
  if (-[TVHCatalogueItem shouldDisplay](v2, "shouldDisplay")) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }
  BOOL v4 = v3;

  return v4;
}

id sub_10005F4A4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _itemsWithGrouping:*(void *)(a1 + 40) atGroupIndexes:a2];
}

void sub_10005F4B4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v13 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 groups]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:a4]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _mediaEntitiesDataSourceFetchResultWithGroup:v10 changeSet:v8]);
  if ([v13 updateWithMediaEntitiesDataSourceFetchResult:v11])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    [*(id *)(a1 + 48) addObject:v12];
  }
}

TVHCatalogueGroupItem *sub_10005F808(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_alloc(&OBJC_CLASS___TVHCatalogueGroupItem);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvh_displayTitle"));
  id v7 = -[TVHCatalogueGroupItem initWithIdentifier:title:](v4, "initWithIdentifier:title:", v5, v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _mediaEntitiesDataSourceFetchResultWithGroup:v3 changeSet:0]);
  -[TVHCatalogueGroupItem updateWithMediaEntitiesDataSourceFetchResult:]( v7,  "updateWithMediaEntitiesDataSourceFetchResult:",  v8);

  return v7;
}

void sub_10005FC14( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
}

void sub_10005FC44(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  [v7 setEnableCache:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uiImage]);
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_10005FD94;
  id v15 = &unk_1000FE730;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  objc_copyWeak(&v18, (id *)(a1 + 40));
  char v19 = a4;
  id v10 = v9;
  id v16 = v10;
  uint64_t v11 = objc_retainBlock(&v12);
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread", v12, v13, v14, v15)) {
    ((void (*)(void ***))v11[2])(v11);
  }
  else {
    dispatch_async(&_dispatch_main_q, v11);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
}

void sub_10005FD78(_Unwind_Exception *a1)
{
}

void sub_10005FD94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained imageProxy]);
    unsigned int v4 = [v3 isEqual:v2];

    if (v4)
    {
      [WeakRetained setState:2 * *(unsigned __int8 *)(a1 + 56)];
      if (*(_BYTE *)(a1 + 56))
      {
        [WeakRetained setImage:*(void *)(a1 + 32)];
        [WeakRetained _notifyDelegate];
      }
    }
  }
}

void sub_10005FF64(id a1)
{
  id v1 = -[TVHPPTController _init](objc_alloc(&OBJC_CLASS___TVHPPTController), "_init");
  id v2 = (void *)qword_100157398;
  qword_100157398 = (uint64_t)v1;
}

BOOL sub_100060300( id a1, TVHPPTController *a2, UIApplication *a3, TVHMediaLibraryTabBarViewController *a4, NSString *a5)
{
  return -[TVHPPTController _workQueue_selectTabWithTabItemType:inTabBarController:]( a2,  "_workQueue_selectTabWithTabItemType:inTabBarController:",  1LL,  a4,  a5);
}

BOOL sub_10006030C( id a1, TVHPPTController *a2, UIApplication *a3, TVHMediaLibraryTabBarViewController *a4, NSString *a5)
{
  return -[TVHPPTController _workQueue_selectTabWithTabItemType:inTabBarController:]( a2,  "_workQueue_selectTabWithTabItemType:inTabBarController:",  3LL,  a4,  a5);
}

BOOL sub_100060318( id a1, TVHPPTController *a2, UIApplication *a3, TVHMediaLibraryTabBarViewController *a4, NSString *a5)
{
  return -[TVHPPTController _workQueue_selectTabWithTabItemType:inTabBarController:]( a2,  "_workQueue_selectTabWithTabItemType:inTabBarController:",  0LL,  a4,  a5);
}

BOOL sub_100060324( id a1, TVHPPTController *a2, UIApplication *a3, TVHMediaLibraryTabBarViewController *a4, NSString *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a2;
  -[TVHPPTController _workQueue_selectTabWithTabItemType:inTabBarController:]( v9,  "_workQueue_selectTabWithTabItemType:inTabBarController:",  1LL,  v8);
  -[TVHPPTController _workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:]( v9,  "_workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:",  2LL,  @"Movies",  v8);

  -[TVHPPTController _workQueue_dispatchHIDEventWithType:](v9, "_workQueue_dispatchHIDEventWithType:", 3LL);
  LOBYTE(v_Block_object_dispose(va, 8) = -[TVHPPTController _workQueue_performScrollViewTest:testOptions:scrollAxis:scrollViewBlock:]( v9,  "_workQueue_performScrollViewTest:testOptions:scrollAxis:scrollViewBlock:",  v7,  0LL,  2LL,  &stru_1000FE858);

  return (char)v8;
}

UIScrollView *__cdecl sub_1000603C4(id a1, TVHPPTController *a2, UIViewController *a3)
{
  unsigned int v4 = a3;
  unsigned int v5 = a2;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v6 = -[TVHPPTController _findChildViewControllerWithClass:inViewController:]( v5,  "_findChildViewControllerWithClass:inViewController:",  objc_opt_class(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  id v9 = -[TVHPPTController _findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:]( v5,  "_findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:",  v8,  objc_opt_class(&OBJC_CLASS___UICollectionView),  0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (UIScrollView *)v10;
}

BOOL sub_100060474( id a1, TVHPPTController *a2, UIApplication *a3, TVHMediaLibraryTabBarViewController *a4, NSString *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a2;
  -[TVHPPTController _workQueue_selectTabWithTabItemType:inTabBarController:]( v9,  "_workQueue_selectTabWithTabItemType:inTabBarController:",  1LL,  v8);
  -[TVHPPTController _workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:]( v9,  "_workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:",  2LL,  @"Recently Added",  v8);

  -[TVHPPTController _workQueue_dispatchHIDEventWithType:](v9, "_workQueue_dispatchHIDEventWithType:", 3LL);
  -[TVHPPTController _workQueue_dispatchHIDEventWithType:](v9, "_workQueue_dispatchHIDEventWithType:", 6LL);
  -[TVHPPTController _workQueue_waitForLoadingToCompleteForNavigationControllerVisibleViewController]( v9,  "_workQueue_waitForLoadingToCompleteForNavigationControllerVisibleViewController");
  -[TVHPPTController _workQueue_dispatchHIDEventWithType:](v9, "_workQueue_dispatchHIDEventWithType:", 1LL);
  -[TVHPPTController _workQueue_dispatchHIDEventWithType:](v9, "_workQueue_dispatchHIDEventWithType:", 1LL);
  LOBYTE(a2) = -[TVHPPTController _workQueue_performScrollViewTest:testOptions:scrollAxis:scrollViewBlock:]( v9,  "_workQueue_performScrollViewTest:testOptions:scrollAxis:scrollViewBlock:",  v7,  0LL,  1LL,  &stru_1000FE898);

  return (char)a2;
}

UIScrollView *__cdecl sub_100060540(id a1, TVHPPTController *a2, UIViewController *a3)
{
  unsigned int v4 = a3;
  unsigned int v5 = a2;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v6 = -[TVHPPTController _findChildViewControllerWithClass:inViewController:]( v5,  "_findChildViewControllerWithClass:inViewController:",  objc_opt_class(&OBJC_CLASS___TVHContributorsShelfViewController),  v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  id v9 = -[TVHPPTController _findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:]( v5,  "_findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:",  v8,  objc_opt_class(&OBJC_CLASS___UICollectionView),  0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (UIScrollView *)v10;
}

BOOL sub_1000605F0( id a1, TVHPPTController *a2, UIApplication *a3, TVHMediaLibraryTabBarViewController *a4, NSString *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a2;
  -[TVHPPTController _workQueue_selectTabWithTabItemType:inTabBarController:]( v9,  "_workQueue_selectTabWithTabItemType:inTabBarController:",  1LL,  v8);
  -[TVHPPTController _workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:]( v9,  "_workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:",  2LL,  @"Recently Added",  v8);

  -[TVHPPTController _workQueue_dispatchHIDEventWithType:](v9, "_workQueue_dispatchHIDEventWithType:", 3LL);
  -[TVHPPTController _workQueue_dispatchHIDEventWithType:](v9, "_workQueue_dispatchHIDEventWithType:", 6LL);
  -[TVHPPTController _workQueue_waitForLoadingToCompleteForNavigationControllerVisibleViewController]( v9,  "_workQueue_waitForLoadingToCompleteForNavigationControllerVisibleViewController");
  -[TVHPPTController _workQueue_dispatchHIDEventWithType:](v9, "_workQueue_dispatchHIDEventWithType:", 1LL);
  LOBYTE(a2) = -[TVHPPTController _workQueue_performScrollViewTest:testOptions:scrollAxis:scrollViewBlock:]( v9,  "_workQueue_performScrollViewTest:testOptions:scrollAxis:scrollViewBlock:",  v7,  0LL,  1LL,  &stru_1000FE8D8);

  return (char)a2;
}

UIScrollView *__cdecl sub_1000606B0(id a1, TVHPPTController *a2, UIViewController *a3)
{
  unsigned int v4 = a3;
  unsigned int v5 = a2;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v6 = -[TVHPPTController _findChildViewControllerWithClass:inViewController:]( v5,  "_findChildViewControllerWithClass:inViewController:",  objc_opt_class(&OBJC_CLASS___TVHMediaEntitiesShelfViewController),  v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  id v9 = -[TVHPPTController _findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:]( v5,  "_findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:",  v8,  objc_opt_class(&OBJC_CLASS___UICollectionView),  0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (UIScrollView *)v10;
}

BOOL sub_100060760( id a1, TVHPPTController *a2, UIApplication *a3, TVHMediaLibraryTabBarViewController *a4, NSString *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a2;
  -[TVHPPTController _workQueue_selectTabWithTabItemType:inTabBarController:]( v9,  "_workQueue_selectTabWithTabItemType:inTabBarController:",  3LL,  v8);
  -[TVHPPTController _workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:]( v9,  "_workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:",  2LL,  @"TV Shows",  v8);

  -[TVHPPTController _workQueue_dispatchHIDEventWithType:](v9, "_workQueue_dispatchHIDEventWithType:", 3LL);
  LOBYTE(v_Block_object_dispose(va, 8) = -[TVHPPTController _workQueue_performScrollViewTest:testOptions:scrollAxis:scrollViewBlock:]( v9,  "_workQueue_performScrollViewTest:testOptions:scrollAxis:scrollViewBlock:",  v7,  0LL,  2LL,  &stru_1000FE918);

  return (char)v8;
}

UIScrollView *__cdecl sub_100060800(id a1, TVHPPTController *a2, UIViewController *a3)
{
  unsigned int v4 = a3;
  unsigned int v5 = a2;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v6 = -[TVHPPTController _findChildViewControllerWithClass:inViewController:]( v5,  "_findChildViewControllerWithClass:inViewController:",  objc_opt_class(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  id v9 = -[TVHPPTController _findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:]( v5,  "_findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:",  v8,  objc_opt_class(&OBJC_CLASS___UICollectionView),  0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (UIScrollView *)v10;
}

BOOL sub_1000608B0( id a1, TVHPPTController *a2, UIApplication *a3, TVHMediaLibraryTabBarViewController *a4, NSString *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a2;
  -[TVHPPTController _workQueue_selectTabWithTabItemType:inTabBarController:]( v9,  "_workQueue_selectTabWithTabItemType:inTabBarController:",  0LL,  v8);
  -[TVHPPTController _workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:]( v9,  "_workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:",  2LL,  @"Albums",  v8);

  -[TVHPPTController _workQueue_waitForVisibleChildViewControllerToFinishLoadingWithClass:]( v9,  "_workQueue_waitForVisibleChildViewControllerToFinishLoadingWithClass:",  objc_opt_class(&OBJC_CLASS___TVHMusicAlbumsViewController));
  -[TVHPPTController _workQueue_dispatchHIDEventWithType:](v9, "_workQueue_dispatchHIDEventWithType:", 3LL);
  LOBYTE(a2) = -[TVHPPTController _workQueue_performScrollViewTest:testOptions:scrollAxis:scrollViewBlock:]( v9,  "_workQueue_performScrollViewTest:testOptions:scrollAxis:scrollViewBlock:",  v7,  0LL,  2LL,  &stru_1000FE958);

  return (char)a2;
}

UIScrollView *__cdecl sub_100060968(id a1, TVHPPTController *a2, UIViewController *a3)
{
  unsigned int v4 = a3;
  unsigned int v5 = a2;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v4, "view"));

  id v7 = -[TVHPPTController _findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:]( v5,  "_findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:",  v6,  objc_opt_class(&OBJC_CLASS___UICollectionView),  0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (UIScrollView *)v8;
}

void sub_100060AD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100060AF0(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result = [*(id *)(a1 + 32) hasPrefix:a2];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void sub_100060C34(_Unwind_Exception *a1)
{
}

void sub_100060C48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_workQueue_runTest:application:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_100060F34( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id location)
{
}

void sub_100060F6C(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained workQueue]);
    dispatch_assert_queue_V2(v4);

    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_workQueue_prepareForPPT"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 testsManifest]);
    uint64_t v22 = 0LL;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    uint64_t v25 = sub_100061200;
    id v26 = sub_100061228;
    id v27 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100061230;
    v18[3] = &unk_1000FE9D0;
    id v19 = a1[4];
    id v21 = &v22;
    id v8 = v6;
    id v20 = v8;
    [v7 enumerateObjectsUsingBlock:v18];
    uint64_t v9 = v23[5];
    if (v9)
    {
      int v10 = (*(uint64_t (**)(uint64_t, void *, id, void *, id))(v9 + 16))(v9, v3, a1[5], v5, a1[4]);
      id v11 = sub_100079F28();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = a1[4];
        *(_DWORD *)buf = 138412546;
        id v29 = v13;
        __int16 v30 = 1024;
        int v31 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Test block complete. test=%@, result=%{BOOL}d",  buf,  0x12u);
      }
    }

    else
    {
      LOBYTE(v10) = 0;
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000612A0;
    v14[3] = &unk_1000FE9F8;
    char v17 = v10;
    id v15 = a1[4];
    id v16 = a1[5];
    dispatch_sync(&_dispatch_main_q, v14);

    _Block_object_dispose(&v22, 8);
  }
}

void sub_1000611DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

id sub_100061200(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100061228(uint64_t a1)
{
}

void sub_100061230(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:"))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v9]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

id sub_1000612A0(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = sub_100079F28();
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Finished test with success. test=%@",  (uint8_t *)&v9,  0xCu);
    }

    return [*(id *)(a1 + 40) finishedTest:*(void *)(a1 + 32) waitForCommit:1 extraResults:0];
  }

  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed test. test=%@", (uint8_t *)&v9, 0xCu);
    }

    return [*(id *)(a1 + 40) failedTest:*(void *)(a1 + 32)];
  }

void sub_1000613B0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 80)) {
    [*(id *)(a1 + 32) startedTest:*(void *)(a1 + 40)];
  }
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _libraryViewController]);
  if (!v2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v3 = *(void **)(a1 + 48);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100061490;
    v4[3] = &unk_1000FD2E8;
    objc_copyWeak(&v6, (id *)(a1 + 72));
    id v5 = *(id *)(a1 + 56);
    [v3 setApplicationLoadCompletion:v4];

    objc_destroyWeak(&v6);
  }
}

void sub_10006147C(_Unwind_Exception *a1)
{
}

void sub_100061490(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained workQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061528;
  block[3] = &unk_1000FEA20;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(v3, block);
}

uint64_t sub_100061528(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000616B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_1000616D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000616E4(uint64_t a1)
{
}

void sub_1000616EC(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _libraryViewController]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100061724(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _findChildViewControllerWithClass:objc_opt_class(TVHMediaLibraryTabBarViewController) inViewController:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10006191C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10006193C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _viewControllerIndexWithTabItemType:*(void *)(a1 + 56) inTabBarController:*(void *)(a1 + 40)];
  if (v2 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = v2;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    [*(id *)(a1 + 40) setSelectedIndex:v2];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) viewControllers]);
    id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:v3]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    [v5 tabBarController:*(void *)(a1 + 40) didSelectViewController:v6];
  }

void sub_100061B04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100061B1C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _viewControllerIndexWithTabItemType:*(void *)(a1 + 56) inTabBarController:*(void *)(a1 + 40)];
  if (v2 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = v2;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) viewControllers]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectAtIndex:v3]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___TVHMediaEntitiesFetchViewController);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      id v10 = [*(id *)(a1 + 32) _findChildViewControllerWithClass:objc_opt_class(TVHMediaEntitiesFetchViewController) inViewController:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }

void sub_100061CD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100061CEC(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _navigationController]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 visibleViewController]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100061E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100061EA0(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "tvh_ppt_isLoading");
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_100061FB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100061FC8(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _navigationController]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v6 visibleViewController]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _findChildViewControllerWithClass:*(void *)(a1 + 48) inViewController:v2]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100062384( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

void sub_1000623C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v21 = WeakRetained;
    if (v3)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v5 = v3;
      id v6 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v5;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _navigationController]);
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 visibleViewController]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVHMediaLibraryTabBarViewController);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        id v12 = *(id *)(a1 + 32);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v21 _selectedViewControllerInTabBarController:v12]);
        uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
        id v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;
      }
    }

    uint64_t v16 = *(void *)(a1 + 48);
    if (v16)
    {
      uint64_t v17 = (*(uint64_t (**)(uint64_t, id, void))(v16 + 16))( v16,  v21,  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    }

    else
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( [v21 _findScrollViewInViewController:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)]);
    }

    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    id WeakRetained = v21;
  }
}

void sub_1000624FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  uint64_t v4 = *(unsigned int *)(a1 + 68);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000625B4;
  v6[3] = &unk_1000FEB80;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v2 _performScrollTest:v5 iterations:5 delta:v3 length:v4 scrollAxis:v1 extraResultsBlock:&stru_1000FEB58 completionBlock:v6];
}

NSDictionary *__cdecl sub_1000625A8(id a1)
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

uint64_t sub_1000625B4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000627DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, id a27, char a28)
{
}

void sub_100062810(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v14 = WeakRetained;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _selectedViewControllerInTabBarController:*(void *)(a1 + 32)]);
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHPreviewingListViewController);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      id v5 = v3;
    }

    else
    {
      id v6 = [*(id *)(a1 + 40) _findChildViewControllerWithClass:objc_opt_class(TVHPreviewingListViewController) inViewController:v3];
      id v5 = (id)objc_claimAutoreleasedReturnValue(v6);
    }

    id v7 = v5;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
    id v9 = [v14 _findScrollViewInView:v8 desiredScrollViewClass:objc_opt_class(TVHListView)];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v14 _findCellWithTitle:*(void *)(a1 + 48) inCollectionView:v10]);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id WeakRetained = v14;
  }
}

id sub_100062918(uint64_t a1)
{
  id result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isFocused];
  if ((_DWORD)result) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1LL;
  }
  return result;
}

void sub_100062A4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100062A64(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v11 = a2;
  if ((objc_opt_isKindOfClass(v11, *(void *)(a1 + 48)) & 1) != 0)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v7 = v11;
    uint64_t v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _findChildViewControllerWithClass:*(void *)(a1 + 48) inViewController:v11]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v8 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
    *a4 = 1;
  }
}

void sub_100062CF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100062D18(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "tvh_identifier"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 40)));
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a3;
    *a4 = 1;
  }

void sub_100062E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100062EA0(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVHMediaLibraryViewController);
  id v8 = v6;
  id v13 = v8;
  if (v7)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      unsigned int v9 = v13;
    }
    else {
      unsigned int v9 = 0LL;
    }
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  id v10 = v9;

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    *a4 = 1;
  }
}

void sub_100063190( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1000631A8(uint64_t a1)
{
  uint64_t v2 = 0LL;
  return (id)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _findScrollViewInView:*(void *)(a1 + 40) desiredScrollViewClass:*(void *)(a1 + 48) numScrollSubviewsToSkip:*(void *)(a1 + 56) numScr ollSubviewsFound:&v2]);
}

void sub_1000631DC(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id sub_1000635F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UILabel);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 text]);
  id v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  return v7;
}

void sub_100063D94(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100064090( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1000640A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _startPhotoAssetsRequestWithScreenSaverDescriptor:*(void *)(a1 + 32) photoServiceResponseBlock:*(void *)(a1 + 40)];
}

void sub_1000641A8(_Unwind_Exception *a1)
{
}

void sub_1000641BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setRemotePhotoServerInterface:*(void *)(a1 + 32)];
}

void sub_100064360( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10006437C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained inflightRequests]);
    [v6 removeObject:*(void *)(a1 + 32)];

    id v7 = [v3 responseCount];
    id v8 = sub_10007A008();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 == (id)1)
    {
      if (v10)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 photoAssets]);
        int v19 = 67109120;
        unsigned int v20 = [v11 count];
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverProviderService: Returning initial set of assets [%u]",  (uint8_t *)&v19,  8u);
      }

      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 photoAssets]);
      (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0LL);
    }

    else
    {
      if (v10)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 photoAssets]);
        int v19 = 67109120;
        unsigned int v20 = [v14 count];
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverProviderService: Updating cache with assets [%u]",  (uint8_t *)&v19,  8u);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 remotePhotoServerInterface]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 photoAssets]);
      [v13 updateCacheWithPhotoAssets:v15];
    }

    if ([v3 finishedRequest])
    {
      id v16 = sub_10007A008();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverProviderService: Sending didFinishFetchingPhotoAssets as all assets returned",  (uint8_t *)&v19,  2u);
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 remotePhotoServerInterface]);
      [v18 didFinishFetchingPhotoAssets];
    }
  }
}

LABEL_50:
}

id sub_1000655E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateColors];
}

void sub_10006594C(uint64_t a1)
{
  id v1 = [(id)objc_opt_class(*(void *)(a1 + 32)) _playedStateImageConfiguration];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"circle.fill",  v2));

  [v4 size];
  qword_1001573A8 = v3;
}

double sub_100065D94()
{
  return 25.0;
}

void sub_10006652C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10006654C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000665DC;
  v2[3] = &unk_1000FDBF0;
  id v3 = *(id *)(a1 + 32);
  __int128 v4 = *(_OWORD *)(a1 + 40);
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateKeyframesWithDuration:delay:options:animations:completion:",  0LL,  v2,  0LL,  0.0,  0.0);
}

void sub_1000665DC(uint64_t a1)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100066718;
  v8[3] = &unk_1000FDBF0;
  id v9 = *(id *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v8,  0.0,  0.333333333);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100066740;
  v5[3] = &unk_1000FDBF0;
  id v6 = *(id *)(a1 + 32);
  __int128 v7 = *(_OWORD *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v5,  0.333333333,  0.333333333);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100066758;
  v2[3] = &unk_1000FDBF0;
  id v3 = *(id *)(a1 + 32);
  __int128 v4 = *(_OWORD *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v2,  0.666666667,  0.333333333);
}

id sub_100066718(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48) * 7.0 / 12.0);
}

id sub_100066740(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id sub_100066758(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48) * 5.0 / 12.0);
}

void sub_100066780(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    BOOL v3 = [WeakRetained internalState] == (id)1;
    id WeakRetained = v4;
    if (v3)
    {
      [v4 _createAnimationForBarIndex:*(void *)(a1 + 40)];
      id WeakRetained = v4;
    }
  }
}

id sub_100066A1C(uint64_t a1)
{
  double v3 = v2;
  [*(id *)(a1 + 40) bounds];
  CGFloat v4 = CGRectGetHeight(v6) * 0.3;
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", CGPointZero.x, CGPointZero.y, v3, v4);
}

id sub_100067108(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

id sub_100067110(uint64_t a1)
{
  return [*(id *)(a1 + 32) buttonSize];
}

id sub_100067118(uint64_t a1)
{
  return [*(id *)(a1 + 32) buttonToTitleLabelSpacing];
}

void sub_1000674A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000674C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    [WeakRetained _startTimer];
    [v3 _loadNextImage:v3[1]];
    double v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v2 postNotificationName:off_100156A08 object:v3];

    id WeakRetained = v3;
  }
}

id sub_100067A34(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 40) + 16) setAlpha:0.0];
}

void sub_100067A70(uint64_t a1)
{
}

void sub_100068A10(id *a1, void *a2)
{
  id v4 = a2;
  id v5 = a1;
  [v5[3] setAutoresizingMask:18];
  [v5[3] setContentInsetAdjustmentBehavior:2];
  [v5[3] setClipsToBounds:0];
  [v5[3] setRemembersLastFocusedIndexPath:1];
  [v5[3] configureDefaultGradientMaskForDirection:3];
  objc_msgSend(v5[3], "tvh_setDebugLayoutColorType:", 6);
  [v5 addSubview:v5[3]];
  __int128 v6 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
  __int128 v7 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.bottom;
  *(_OWORD *)(v5 + 19) = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
  *(_OWORD *)(v5 + 21) = v7;
  *(_OWORD *)(v5 + 15) = v6;
  *(_OWORD *)(v5 + 17) = v7;
  *(_OWORD *)(v5 + 23) = v6;
  *(_OWORD *)(v5 + 25) = v7;
  *(_OWORD *)(v5 + 11) = xmmword_1000C3560;
  *(_OWORD *)(v5 + 13) = xmmword_1000C3560;
  id v8 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
  id v9 = v5[10];
  v5[10] = v8;

  id v10 = v5[10];
  id v18 = v5[3];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  [v10 setPreferredFocusEnvironments:v11];

  [v5[10] setEnabled:1];
  [v5 addLayoutGuide:v5[10]];
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
  id v13 = v5[9];
  v5[9] = v12;

  id v14 = v5[9];
  id v17 = v5[3];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  [v14 setPreferredFocusEnvironments:v15];

  [v5 addLayoutGuide:v5[9]];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));

  [v5 setBackgroundColor:v16];
}

id sub_10006914C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setAlpha:*(double *)(a1 + 40)];
}

id sub_1000694A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_1000694B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  double v3 = *(double *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100069550;
  v4[3] = &unk_1000FCEA8;
  id v5 = *(id *)(a1 + 40);
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v4, v3);
}

id sub_100069550(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void sub_10006A680(void *a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  id v13 = a3;
  if (!v12)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___TVHLockupShadow);
    -[TVHLockupShadow setOpacity:](v12, "setOpacity:", 0.3);
    -[TVHLockupShadow setRadius:](v12, "setRadius:", 25.0);
    -[TVHLockupShadow setVerticalOffset:](v12, "setVerticalOffset:", 20.0);
  }

  v93 = v12;
  objc_storeStrong(v11 + 1, v12);
  if (!v13)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___TVHLockupShadow);
    -[TVHLockupShadow setOpacity:](v13, "setOpacity:", 0.15);
    -[TVHLockupShadow setRadius:](v13, "setRadius:", 4.0);
    -[TVHLockupShadow setVerticalOffset:](v13, "setVerticalOffset:", 4.0);
  }

  id v14 = v11[2];
  v11[2] = v13;
  v92 = v13;

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(id)objc_opt_class(v11) _configureFloatingContentViewAppearance];
  id v15 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
  id v16 = v11[3];
  v11[3] = v15;

  objc_msgSend(v11[3], "setContentMotionRotation:translation:", CGPointZero.x, CGPointZero.y, 4.0, 4.0);
  [v11[3] setCornerRadius:a6 * 0.5];
  [v11[3] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11[3] setFocusedSizeIncrease:60.0];
  [v11 addSubview:v11[3]];
  id v17 = objc_alloc_init(&OBJC_CLASS___TVHMediaImageView);
  id v18 = v11[4];
  v11[4] = v17;

  [v11[4] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11[4] setCornerRadius:a6 * 0.5];
  [v11[4] setContentMode:2];
  int v19 = objc_alloc(&OBJC_CLASS___TVSUIOuterShadowView);
  [v11[1] verticalOffset];
  double v21 = v20;
  [v11[1] radius];
  uint64_t v23 = -[TVSUIOuterShadowView initWithCornerRadius:continuousCorners:shadowOffset:shadowRadius:]( v19,  "initWithCornerRadius:continuousCorners:shadowOffset:shadowRadius:",  0LL,  a6 * 0.5,  0.0,  v21,  v22);
  id v24 = v11[5];
  v11[5] = v23;

  [v11[5] setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v25 = objc_alloc(&OBJC_CLASS___TVSUIOuterShadowView);
  [v11[2] verticalOffset];
  double v27 = v26;
  [v11[2] radius];
  id v29 = -[TVSUIOuterShadowView initWithCornerRadius:continuousCorners:shadowOffset:shadowRadius:]( v25,  "initWithCornerRadius:continuousCorners:shadowOffset:shadowRadius:",  0LL,  a6 * 0.5,  0.0,  v27,  v28);
  id v30 = v11[6];
  v11[6] = v29;

  [v11[6] setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v11[3] contentView]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 layer]);
  [v32 setAllowsGroupBlending:0];

  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v31 addSubview:v11[4]];
  [v31 addSubview:v11[5]];
  [v31 addSubview:v11[6]];
  v91 = (void *)objc_claimAutoreleasedReturnValue([v11[3] topAnchor]);
  v90 = (void *)objc_claimAutoreleasedReturnValue([v11 topAnchor]);
  v89 = (void *)objc_claimAutoreleasedReturnValue([v91 constraintEqualToAnchor:v90]);
  v94[0] = v89;
  v88 = (void *)objc_claimAutoreleasedReturnValue([v11[3] bottomAnchor]);
  v87 = (void *)objc_claimAutoreleasedReturnValue([v11 bottomAnchor]);
  v86 = (void *)objc_claimAutoreleasedReturnValue([v88 constraintEqualToAnchor:v87]);
  v94[1] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue([v11[3] leadingAnchor]);
  v84 = (void *)objc_claimAutoreleasedReturnValue([v11 leadingAnchor]);
  v83 = (void *)objc_claimAutoreleasedReturnValue([v85 constraintEqualToAnchor:v84]);
  v94[2] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue([v11[3] trailingAnchor]);
  v81 = (void *)objc_claimAutoreleasedReturnValue([v11 trailingAnchor]);
  v80 = (void *)objc_claimAutoreleasedReturnValue([v82 constraintEqualToAnchor:v81]);
  v94[3] = v80;
  v79 = (void *)objc_claimAutoreleasedReturnValue([v31 topAnchor]);
  v78 = (void *)objc_claimAutoreleasedReturnValue([v11[3] topAnchor]);
  v77 = (void *)objc_claimAutoreleasedReturnValue([v79 constraintEqualToAnchor:v78]);
  v94[4] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue([v31 bottomAnchor]);
  v75 = (void *)objc_claimAutoreleasedReturnValue([v11[3] bottomAnchor]);
  v74 = (void *)objc_claimAutoreleasedReturnValue([v76 constraintEqualToAnchor:v75]);
  v94[5] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue([v31 leadingAnchor]);
  v72 = (void *)objc_claimAutoreleasedReturnValue([v11[3] leadingAnchor]);
  v71 = (void *)objc_claimAutoreleasedReturnValue([v73 constraintEqualToAnchor:v72]);
  v94[6] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue([v31 trailingAnchor]);
  v69 = (void *)objc_claimAutoreleasedReturnValue([v11[3] trailingAnchor]);
  v68 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v69]);
  v94[7] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue([v11[5] topAnchor]);
  v66 = (void *)objc_claimAutoreleasedReturnValue([v31 topAnchor]);
  v65 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToAnchor:v66]);
  v94[8] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue([v11[5] bottomAnchor]);
  v63 = (void *)objc_claimAutoreleasedReturnValue([v31 bottomAnchor]);
  v62 = (void *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToAnchor:v63]);
  v94[9] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue([v11[5] leadingAnchor]);
  v60 = (void *)objc_claimAutoreleasedReturnValue([v31 leadingAnchor]);
  v59 = (void *)objc_claimAutoreleasedReturnValue([v61 constraintEqualToAnchor:v60]);
  v94[10] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue([v11[5] trailingAnchor]);
  v57 = (void *)objc_claimAutoreleasedReturnValue([v31 trailingAnchor]);
  v56 = (void *)objc_claimAutoreleasedReturnValue([v58 constraintEqualToAnchor:v57]);
  v94[11] = v56;
  v54 = (void *)objc_claimAutoreleasedReturnValue([v11[6] topAnchor]);
  v53 = (void *)objc_claimAutoreleasedReturnValue([v31 topAnchor]);
  v52 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintEqualToAnchor:v53]);
  v94[12] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue([v11[6] bottomAnchor]);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v31 bottomAnchor]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v50]);
  v94[13] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue([v11[6] leadingAnchor]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v31 leadingAnchor]);
  v46 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v47]);
  v94[14] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue([v11[6] trailingAnchor]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v31 trailingAnchor]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v44]);
  v94[15] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue([v11[4] widthAnchor]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToConstant:a6]);
  v94[16] = v41;
  v33 = (void *)objc_claimAutoreleasedReturnValue([v11[4] heightAnchor]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToConstant:a7]);
  v94[17] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v11[4] centerXAnchor]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v31 centerXAnchor]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v36]);
  v94[18] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue([v11[4] centerYAnchor]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v31 centerYAnchor]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintEqualToAnchor:v39]);
  v94[19] = v40;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v94, 20LL));

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v55);
  [v11 updateAppearanceForLockupState:0];
}

void sub_10006B4DC(uint64_t a1)
{
  uint64_t v7 = objc_opt_class(*(void *)(a1 + 32));
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFloatingContentView appearanceWhenContainedInInstancesOfClasses:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedInInstancesOfClasses:",  v1));

  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  1LL));
  [v2 setFocusAnimationConfiguration:v3];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  [v2 setBackgroundColor:v4 forState:8];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.6));
  [v2 setBackgroundColor:v5 forState:1];

  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.6));
  [v2 setBackgroundColor:v6 forState:0];

  [v2 setShadowEnabled:0];
  [v2 setClipsContentToBounds:0];
}

void sub_10006C3D4(id a1, AVAudioSession *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100079E48();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting audio session category with movie playback mode",  buf,  2u);
  }

  id v15 = 0LL;
  unsigned __int8 v5 = -[AVAudioSession setCategory:mode:options:error:]( v2,  "setCategory:mode:options:error:",  AVAudioSessionCategoryPlayback,  AVAudioSessionModeMoviePlayback,  0LL,  &v15);

  id v6 = v15;
  if ((v5 & 1) == 0)
  {
    id v7 = sub_100079E48();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009CAB4((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

void sub_10006C5C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained restoreUserInterfaceCompletionHandler]);
    if (v3)
    {
      id v4 = sub_100079E48();
      unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Video player view controller view has appeared and we have a pending restore-user-interface completion handler . Will complete.",  v6,  2u);
      }

      [v2 _completeRestoreUserInterfaceWithSuccess:1];
    }
  }
}

void sub_10006CCF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id location)
{
}

uint64_t sub_10006CD34(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10006CD48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006CD54(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(&_dispatch_main_q);
    if (a2)
    {
      id v5 = sub_100079E48();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10009CB7C(a1, v6, v7, v8, v9, v10, v11, v12);
      }

      [WeakRetained _completeRestoreUserInterfaceWithSuccess:0];
    }
  }
}

void sub_10006DA24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

NSString *__cdecl sub_10006DA58(id a1, NSIndexPath *a2)
{
  return (NSString *)@"CellIdentifier";
}

void sub_10006DA64(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 atIndexPath:v5];
}

void sub_10006EC14(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSCache);
  uint64_t v2 = (void *)qword_1001573C0;
  qword_1001573C0 = (uint64_t)v1;
}

void sub_10006ECB0(uint64_t a1)
{
  id v20 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _audiobookPlaceholderDescription]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _contributorPlaceholderDescription]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _homeVideoPlaceholderDescription]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _iTunesUPlaceholderDescription]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _moviePlaceholderDescription]);
  int v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _musicAlbumArtistPlaceholderDescription]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _musicAlbumPlaceholderDescription]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _musicSongPlaceholderDescription]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _musicVideoPlaceholderDescription]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _photoPlaceholderDescription]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _playlistPlaceholderDescription]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _playlistFolderPlaceholderDescription]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _geniusPlaylistPlaceholderDescription]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _smartPlaylistPlaceholderDescription]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _podcastPlaceholderDescription]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _showPlaceholderDescription]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _showEpisodePlaceholderDescription]);
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v8 = (void *)qword_1001573D0;
  qword_1001573D0 = (uint64_t)v7;

  [(id)qword_1001573D0 setObject:v20 forKey:&off_100106210];
  [(id)qword_1001573D0 setObject:v20 forKey:&off_100106228];
  [(id)qword_1001573D0 setObject:v16 forKey:&off_100106240];
  [(id)qword_1001573D0 setObject:v15 forKey:&off_100106258];
  [(id)qword_1001573D0 setObject:v17 forKey:&off_100106270];
  [(id)qword_1001573D0 setObject:v17 forKey:&off_100106288];
  [(id)qword_1001573D0 setObject:v13 forKey:&off_1001062A0];
  [(id)qword_1001573D0 setObject:v19 forKey:&off_1001062B8];
  [(id)qword_1001573D0 setObject:v18 forKey:&off_1001062D0];
  [(id)qword_1001573D0 setObject:v2 forKey:&off_1001062E8];
  [(id)qword_1001573D0 setObject:v3 forKey:&off_100106300];
  [(id)qword_1001573D0 setObject:v9 forKey:&off_100106318];
  [(id)qword_1001573D0 setObject:v9 forKey:&off_100106330];
  [(id)qword_1001573D0 setObject:v10 forKey:&off_100106348];
  [(id)qword_1001573D0 setObject:v11 forKey:&off_100106360];
  [(id)qword_1001573D0 setObject:v4 forKey:&off_100106378];
  [(id)qword_1001573D0 setObject:v4 forKey:&off_100106390];
  [(id)qword_1001573D0 setObject:v12 forKey:&off_1001063A8];
  [(id)qword_1001573D0 setObject:v12 forKey:&off_1001063C0];
  [(id)qword_1001573D0 setObject:v5 forKey:&off_1001063D8];
  [(id)qword_1001573D0 setObject:v5 forKey:&off_1001063F0];
  [(id)qword_1001573D0 setObject:v6 forKey:&off_100106408];
  [(id)qword_1001573D0 setObject:v6 forKey:&off_100106420];
  [(id)qword_1001573D0 setObject:v14 forKey:&off_100106438];
}

void sub_10006F0F4(uint64_t a1)
{
  double v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v2 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32)), "_symbolConfiguration_666x666");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 666.0, 666.0));
  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v3, v4);

  id v5 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32)), "_symbolConfiguration_640x640");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 640.0, 640.0));
  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v6, v7);

  id v8 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32)), "_symbolConfiguration_400x600");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 400.0, 600.0));
  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v9, v10);

  id v11 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32)), "_symbolConfiguration_622x350");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 622.0, 350.0));
  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v12, v13);

  id v14 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32)), "_symbolConfiguration_350x350");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 350.0, 350.0));
  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v15, v16);

  id v17 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32)), "_symbolConfiguration_550x309");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 550.0, 309.0));
  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v18, v19);

  id v20 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32)), "_symbolConfiguration_273x273");
  double v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 273.0, 273.0));
  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v21, v22);

  id v23 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32)), "_symbolConfiguration_148x222");
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 148.0, 222.0));
  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v24, v25);

  id v26 = -[NSMutableDictionary copy](v28, "copy");
  double v27 = (void *)qword_1001573E0;
  qword_1001573E0 = (uint64_t)v26;
}

void sub_100070FD8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue([a2 dataSource]);
  [v6 _updateDataSource:v9 withMediaEntities:v8 andChangeSet:v7];
}

void sub_1000724CC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.07));
  id v2 = (void *)qword_1001573F0;
  qword_1001573F0 = v1;
}

void sub_100072544(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1));
  id v2 = (void *)qword_100157400;
  qword_100157400 = v1;
}

void sub_1000725BC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.25));
  id v2 = (void *)qword_100157410;
  qword_100157410 = v1;
}

void sub_100072630(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.3));
  id v2 = (void *)qword_100157420;
  qword_100157420 = v1;
}

void sub_1000726A8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
  id v2 = (void *)qword_100157430;
  qword_100157430 = v1;
}

void sub_10007271C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.6));
  id v2 = (void *)qword_100157440;
  qword_100157440 = v1;
}

void sub_100072794(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.7));
  id v2 = (void *)qword_100157450;
  qword_100157450 = v1;
}

void sub_10007280C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.8));
  id v2 = (void *)qword_100157460;
  qword_100157460 = v1;
}

void sub_100072884(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.9));
  id v2 = (void *)qword_100157470;
  qword_100157470 = v1;
}

void sub_1000728FC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.1));
  id v2 = (void *)qword_100157480;
  qword_100157480 = v1;
}

void sub_100072974(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
  id v2 = (void *)qword_100157490;
  qword_100157490 = v1;
}

void sub_1000729EC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6));
  id v2 = (void *)qword_1001574A0;
  qword_1001574A0 = v1;
}

void sub_100072A64(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.7));
  id v2 = (void *)qword_1001574B0;
  qword_1001574B0 = v1;
}

void sub_100072ADC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.8));
  id v2 = (void *)qword_1001574C0;
  qword_1001574C0 = v1;
}

void sub_100072B54(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.921568627,  0.921568627,  0.921568627,  1.0));
  id v2 = (void *)qword_1001574D0;
  qword_1001574D0 = v1;
}

void sub_100072BD4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.152941176,  0.152941176,  0.152941176,  1.0));
  id v2 = (void *)qword_1001574E0;
  qword_1001574E0 = v1;
}

void sub_100072C54(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.82745098,  0.82745098,  0.82745098,  1.0));
  id v2 = (void *)qword_1001574F0;
  qword_1001574F0 = v1;
}

void sub_100072CD4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.294117647,  0.28627451,  0.28627451,  1.0));
  id v2 = (void *)qword_100157500;
  qword_100157500 = v1;
}

void sub_100072D8C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tvh_placeholderLightStyleColor"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tvh_placeholderDarkStyleColor"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tvh_dynamicColorWithLightStyleColor:darkStyleColor:", v6, v3));
  id v5 = (void *)qword_100157510;
  qword_100157510 = v4;
}

id sub_100072EB0(uint64_t a1, void *a2)
{
  id v3 = [a2 userInterfaceStyle];
  if ((unint64_t)v3 < 2)
  {
    uint64_t v4 = (id *)(a1 + 32);
LABEL_6:
    id v5 = *v4;
    return v5;
  }

  if (v3 == (id)2)
  {
    uint64_t v4 = (id *)(a1 + 40);
    goto LABEL_6;
  }

  id v5 = 0LL;
  return v5;
}

UIColor *sub_100072F5C(uint64_t a1, void *a2)
{
  id v3 = [a2 userInterfaceStyle];
  uint64_t v4 = 40LL;
  return +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor,  "colorWithWhite:alpha:",  *(double *)(a1 + 48),  *(double *)(a1 + v4));
}

uint64_t sub_100073068()
{
  uint64_t result = _os_feature_enabled_impl("UIKit", "tv_context_menu");
  if ((_DWORD)result) {
    return _os_feature_enabled_impl("TVHomeSharing", "tv_context_menu");
  }
  return result;
}

id sub_1000733F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaEntities]);
  if (!v3) {
    id v3 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  0,  [v4 count]);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectsAtIndexes:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mediaLibrary]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_1000734F4;
  v10[3] = &unk_1000FF1F0;
  id v11 = v6;
  id v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_map:", v10));

  return v8;
}

TVHMusicMainItem *sub_1000734F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___TVHMusicMainItem);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvh_displayTitle"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_1000735BC;
  v9[3] = &unk_1000FF1C8;
  id v10 = v3;
  id v11 = *(id *)(a1 + 32);
  id v6 = v3;
  id v7 = -[TVHMusicMainItem initWithTitle:mediaEntitiesFetchViewControllerBlock:]( v4,  "initWithTitle:mediaEntitiesFetchViewControllerBlock:",  v5,  v9);

  return v7;
}

TVHMusicAlbumsViewController *sub_1000735BC(uint64_t a1)
{
  id v2 = sub_10007D640(*(void **)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = -[TVHMusicAlbumsViewController initWithMediaLibrary:albumsDataSource:]( objc_alloc(&OBJC_CLASS___TVHMusicAlbumsViewController),  "initWithMediaLibrary:albumsDataSource:",  *(void *)(a1 + 40),  v3);

  return v4;
}

id sub_1000743E0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "setFrame:",  *(double *)(a1 + 40),  *(double *)(a1 + 48),  *(double *)(a1 + 56),  *(double *)(a1 + 64));
}

uint64_t sub_1000743F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100074400(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100075E58( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id a28)
{
}

void sub_100075E80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didSelectContentDescriptionText];
}

void sub_100076CCC(id a1, TVHApplicationDelegate *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHApplicationDelegate mediaLibrariesManager](a2, "mediaLibrariesManager"));
  [v2 stop];
  [v2 start];
}

void sub_100076DB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    id WeakRetained = v3;
  }
}

unint64_t sub_100076E5C(id a1, PBSMigrationContext *a2, id *a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance", a3));
  if ([v3 playlistsSortMode] == (id)5)
  {
    [v3 setPlaylistsSortMode:6];
    unint64_t v4 = 3LL;
  }

  else
  {
    unint64_t v4 = 2LL;
  }

  return v4;
}

void sub_100077874( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000778B0(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained processingQueue]);
    dispatch_assert_queue_V2(v5);

    if (a2)
    {
      id v6 = sub_10007A008();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10009CC4C(v4, v7);
      }

      [v4 _stopListentingToMediaLibrariesManagerNotificationsAndInvalidateWatchdog];
      [v4 _completeRequestEarly];
    }
  }
}

void sub_100077AA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100077AB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained isFetchingPhotoAssets] & 1) == 0
    && [v2 _startFetchingPhotoAssets])
  {
    id v3 = sub_10007A008();
    unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 screenSaverDescriptor]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaServerIdentifier]);
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverPhotoAssetsRequest: Started fetching photo assets from media library with identifier: %@. Will sto p listening for media library notifications",  (uint8_t *)&v7,  0xCu);
    }

    [v2 _stopListentingToMediaLibrariesManagerNotificationsAndInvalidateWatchdog];
  }
}

void sub_100078098( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_1000780C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  from = (id *)(a1 + 56);
  uint64_t v32 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = sub_10007A008();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v32 + 32) mediaServerName]);
      id v8 = (char *)[v3 count];
      uint64_t v9 = TVHKMediaCategoryTypeLogString(*(void *)(v32 + 64));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = *(void *)(v32 + 40);
      *(_DWORD *)buf = 138413058;
      id v39 = v7;
      __int16 v40 = 2048;
      v41 = v8;
      __int16 v42 = 2112;
      v43 = v10;
      __int16 v44 = 2112;
      uint64_t v45 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverPhotoAssetsRequest: %@ returned %lu media entities(s) for media category %@ in collection '%@'",  buf,  0x2Au);
    }

    [WeakRetained setMediaEntitiesRequest:0];
    if ([v3 count])
    {
      uint64_t v12 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
      if ([v3 count])
      {
        id v14 = 0LL;
        unint64_t v15 = 0LL;
        *(void *)&__int128 v13 = 134218496LL;
        __int128 v30 = v13;
        do
        {
          id v16 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 15LL);
          if (v15 < (unint64_t)[v3 count] && v15 <= 0xFFFFFFFFFFFFFFF0)
          {
            unint64_t v17 = v15 + 15;
            do
            {
              id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v15, v30));
              -[NSMutableArray addObject:](v16, "addObject:", v18);

              ++v15;
            }

            while (v15 < (unint64_t)[v3 count] && v15 < v17);
          }

          id v19 = [(id)objc_opt_class(WeakRetained) _photoAssetsFromMediaEntities:v16 mediaLibrary:*(void *)(v32 + 48)];
          id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v20);

          ++v14;
          id v21 = [v3 count];
          id v22 = sub_10007A008();
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = -[NSMutableArray count](v12, "count");
            *(_DWORD *)buf = v30;
            id v39 = v24;
            __int16 v40 = 2048;
            v41 = v14;
            __int16 v42 = 1024;
            LODWORD(v43) = v15 >= (unint64_t)v21;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverPhotoAssetsRequest: Calling response handler. photoAssetsCount=%lu, responseCount=%lu, finis hedRequest=%{BOOL}d",  buf,  0x1Cu);
          }

          BOOL v25 = v15 >= (unint64_t)v21;

          id v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained processingQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000784C4;
          block[3] = &unk_1000FF2C0;
          objc_copyWeak(v36, from);
          v35 = v12;
          v36[1] = v14;
          BOOL v37 = v25;
          dispatch_async(v26, block);

          objc_destroyWeak(v36);
        }

        while (v15 < (unint64_t)[v3 count]);
      }
    }

    else
    {
      id v27 = sub_10007A008();
      double v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverPhotoAssetsRequest: Calling response handler after no media entities returned",  buf,  2u);
      }

      id v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained processingQueue]);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10007851C;
      v33[3] = &unk_1000FCEA8;
      v33[4] = WeakRetained;
      dispatch_async(v29, v33);
    }
  }
}

void sub_1000784C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) copy];
  [WeakRetained _callRequestResponseHandlerWithPhotoAssets:v2 responseCount:*(void *)(a1 + 48) finishedRequest:*(unsigned __int8 *)(a1 + 56)];
}

id sub_10007851C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callRequestResponseHandlerWithPhotoAssets:0 responseCount:1 finishedRequest:1];
}

void sub_1000788D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, id location, id a32)
{
}

void sub_100078908(uint64_t a1, void *a2, void *a3, int a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = 0LL;
  if (v14 && a4)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___TVMutablePhotoAsset);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v14, 0LL));
    [v8 setFullResolutionURL:v9];
  }

  [*(id *)(a1 + 32) lock];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v11 = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v12 = v11;
  if (WeakRetained
    && (id v13 = [v11 indexOfObjectIdenticalTo:WeakRetained], v13 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [v12 removeObjectAtIndex:v13];
    if (v8) {
      [*(id *)(a1 + 40) addObject:v8];
    }
    [*(id *)(a1 + 32) unlock];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

  else
  {
    [*(id *)(a1 + 32) unlock];
  }
}

void sub_100078A28(uint64_t a1)
{
  id v2 = sub_10007A008();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "TVHScreenSaverPhotoAssetsRequest: Screen saver asset timer triggered. Cancelling remaining image proxies",  buf,  2u);
  }

  [*(id *)(a1 + 32) lock];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained copy];

  [*(id *)(a1 + 32) unlock];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "cancel", (void)v11);
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v8);
  }
}

void sub_100078F20( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100079754( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_10007976C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10007977C(uint64_t a1)
{
}

BOOL sub_100079784(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 == -1 || [v5 changeKind] != (id)3)
  {
    BOOL v14 = 0LL;
  }

  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _visibleCells]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationIndexes]);
    id v11 = [v10 firstIndex];

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v11,  a2));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKey:v12]);
    BOOL v14 = v13 != 0LL;
    if (v13)
    {
      id v15 = sub_100079C18();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Item amend change is for a visible cell. Will update cell. indexPath=%@",  (uint8_t *)&v18,  0xCu);
      }

      [*(id *)(a1 + 32) _updateCell:v13 atIndexPath:v12];
    }
  }

  return v14;
}

uint64_t sub_10007991C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100079BA8()
{
  if (qword_100157528 != -1) {
    dispatch_once(&qword_100157528, &stru_1000FF380);
  }
  return (id)qword_100157520;
}

void sub_100079BE8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ApplicationDelegate");
  id v2 = (void *)qword_100157520;
  qword_100157520 = (uint64_t)v1;
}

id sub_100079C18()
{
  if (qword_100157538 != -1) {
    dispatch_once(&qword_100157538, &stru_1000FF3A0);
  }
  return (id)qword_100157530;
}

void sub_100079C58(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ChangeSetDataSource");
  id v2 = (void *)qword_100157530;
  qword_100157530 = (uint64_t)v1;
}

id sub_100079C88()
{
  if (qword_100157548 != -1) {
    dispatch_once(&qword_100157548, &stru_1000FF3C0);
  }
  return (id)qword_100157540;
}

void sub_100079CC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "DiffableDataSource");
  id v2 = (void *)qword_100157540;
  qword_100157540 = (uint64_t)v1;
}

id sub_100079CF8()
{
  if (qword_100157558 != -1) {
    dispatch_once(&qword_100157558, &stru_1000FF3E0);
  }
  return (id)qword_100157550;
}

void sub_100079D38(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ImageProxyQueueLoader");
  id v2 = (void *)qword_100157550;
  qword_100157550 = (uint64_t)v1;
}

id sub_100079D68()
{
  if (qword_100157568 != -1) {
    dispatch_once(&qword_100157568, &stru_1000FF400);
  }
  return (id)qword_100157560;
}

void sub_100079DA8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "MainSceneDelegate");
  id v2 = (void *)qword_100157560;
  qword_100157560 = (uint64_t)v1;
}

id sub_100079DD8()
{
  if (qword_100157578 != -1) {
    dispatch_once(&qword_100157578, &stru_1000FF420);
  }
  return (id)qword_100157570;
}

void sub_100079E18(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "MediaEntityFetching");
  id v2 = (void *)qword_100157570;
  qword_100157570 = (uint64_t)v1;
}

id sub_100079E48()
{
  if (qword_100157588 != -1) {
    dispatch_once(&qword_100157588, &stru_1000FF440);
  }
  return (id)qword_100157580;
}

void sub_100079E88(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Playback");
  id v2 = (void *)qword_100157580;
  qword_100157580 = (uint64_t)v1;
}

id sub_100079EB8()
{
  if (qword_100157598 != -1) {
    dispatch_once(&qword_100157598, &stru_1000FF460);
  }
  return (id)qword_100157590;
}

void sub_100079EF8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Playlist");
  id v2 = (void *)qword_100157590;
  qword_100157590 = (uint64_t)v1;
}

id sub_100079F28()
{
  if (qword_1001575A8 != -1) {
    dispatch_once(&qword_1001575A8, &stru_1000FF480);
  }
  return (id)qword_1001575A0;
}

void sub_100079F68(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "PPT");
  id v2 = (void *)qword_1001575A0;
  qword_1001575A0 = (uint64_t)v1;
}

id sub_100079F98()
{
  if (qword_1001575B8 != -1) {
    dispatch_once(&qword_1001575B8, &stru_1000FF4A0);
  }
  return (id)qword_1001575B0;
}

void sub_100079FD8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "RootViewController");
  id v2 = (void *)qword_1001575B0;
  qword_1001575B0 = (uint64_t)v1;
}

id sub_10007A008()
{
  if (qword_1001575C8 != -1) {
    dispatch_once(&qword_1001575C8, &stru_1000FF4C0);
  }
  return (id)qword_1001575C0;
}

void sub_10007A048(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ScreenSaver");
  id v2 = (void *)qword_1001575C0;
  qword_1001575C0 = (uint64_t)v1;
}

id sub_10007A078()
{
  if (qword_1001575D8 != -1) {
    dispatch_once(&qword_1001575D8, &stru_1000FF4E0);
  }
  return (id)qword_1001575D0;
}

void sub_10007A0B8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Search");
  id v2 = (void *)qword_1001575D0;
  qword_1001575D0 = (uint64_t)v1;
}

id sub_10007A0E8()
{
  if (qword_1001575E8 != -1) {
    dispatch_once(&qword_1001575E8, &stru_1000FF500);
  }
  return (id)qword_1001575E0;
}

void sub_10007A128(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Settings");
  id v2 = (void *)qword_1001575E0;
  qword_1001575E0 = (uint64_t)v1;
}

id sub_10007A158()
{
  if (qword_1001575F8 != -1) {
    dispatch_once(&qword_1001575F8, &stru_1000FF520);
  }
  return (id)qword_1001575F0;
}

void sub_10007A198(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "URLHandler");
  id v2 = (void *)qword_1001575F0;
  qword_1001575F0 = (uint64_t)v1;
}

id sub_10007A1C8()
{
  if (qword_100157608 != -1) {
    dispatch_once(&qword_100157608, &stru_1000FF540);
  }
  return (id)qword_100157600;
}

void sub_10007A208(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "UserInterface");
  id v2 = (void *)qword_100157600;
  qword_100157600 = (uint64_t)v1;
}

__CFString *sub_10007A238(unint64_t a1)
{
  if (a1 > 2) {
    return 0LL;
  }
  else {
    return off_1000FF560[a1];
  }
}

void sub_10007AEE4(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a2 imageIdentifier]);
  id v5 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:"));
  if (!v5)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }

  -[NSMutableIndexSet addIndex:](v5, "addIndex:", a3);
}

void sub_10007B128( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10007B148(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (!a3 || a4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10007B1FC;
    _OWORD v7[3] = &unk_1000FF5A8;
    objc_copyWeak(v10, (id *)(a1 + 48));
    id v8 = *(id *)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(void **)(a1 + 56);
    id v9 = v5;
    v10[1] = v6;
    dispatch_async(&_dispatch_main_q, v7);

    objc_destroyWeak(v10);
  }

void sub_10007B1FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained imageProxyByImageIdentifier]);
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:*(void *)(a1 + 32)]);

    if (*(void **)(a1 + 40) == v4)
    {
      id v5 = *(id *)(a1 + 56);
      if (v5 == [v9 lastCreatedImageViewIndex])
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 oneUpView]);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 focusedItemView]);

        id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 _imageProxyForIndex:*(void *)(a1 + 56) forCaching:0]);
        [v7 setImageProxy:v8];
      }
    }

    id WeakRetained = v9;
  }
}

void sub_10007B3DC(uint64_t a1, void *a2)
{
  id v3 = a2;
}

uint64_t sub_10007B738(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a2));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:v3]);

  if (v4) {
    uint64_t v5 = (uint64_t)[v4 integerValue];
  }
  else {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

_TVHMusicAlbumsViewControllerAlbumsDataSource *sub_10007D608()
{
  return objc_alloc_init(&OBJC_CLASS____TVHMusicAlbumsViewControllerAlbumsDataSource);
}

_TVHMusicAlbumsViewControllerCompilationAlbumsDataSource *sub_10007D624()
{
  return objc_alloc_init(&OBJC_CLASS____TVHMusicAlbumsViewControllerCompilationAlbumsDataSource);
}

_TVHMusicAlbumsViewControllerGenreAlbumsDataSource *sub_10007D640(void *a1)
{
  id v1 = a1;
  id v2 = -[_TVHMusicAlbumsViewControllerGenreAlbumsDataSource initWithGenre:]( objc_alloc(&OBJC_CLASS____TVHMusicAlbumsViewControllerGenreAlbumsDataSource),  "initWithGenre:",  v1);

  return v2;
}

_TVHMusicAlbumsViewControllerComposerAlbumsDataSource *sub_10007D684(void *a1)
{
  id v1 = a1;
  id v2 = -[_TVHMusicAlbumsViewControllerComposerAlbumsDataSource initWithComposer:]( objc_alloc(&OBJC_CLASS____TVHMusicAlbumsViewControllerComposerAlbumsDataSource),  "initWithComposer:",  v1);

  return v2;
}

id sub_10007D6C8(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:",  1LL,  1LL));
  uint64_t v3 = TVHKMusicAlbumProperties(v2);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v2 setProperties:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v1 sortDescriptors]);

  [v2 setSortDescriptors:v5];
  uint64_t v8 = TVHKMediaEntitiesFetchRequestOptionCalculateIndexBarItems;
  id v9 = &__kCFBooleanTrue;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  [v2 setOptions:v6];

  return v2;
}

void sub_10007DA28(_BYTE *a1, void *a2)
{
  a1[8] = 1;
  id v3 = a2;
  unint64_t v4 = a1;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  BOOL v14 = -[TVHPreviewingListView initWithFrame:listViewLayout:]( objc_alloc(&OBJC_CLASS___TVHPreviewingListView),  "initWithFrame:listViewLayout:",  v3,  v7,  v9,  v11,  v13);
  id v15 = v4[6];
  v4[6] = v14;

  id v16 = (id)objc_claimAutoreleasedReturnValue([v4[6] listView]);
  [v16 setDelegate:v4];
}

id sub_10007E228(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) previewViewController]);
  [v2 didMoveToParentViewController:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 40) _updateListViewBackdropAfterSettingPreviewViewIfNecessary];
}

LABEL_12:
  }

  -[TVHPreviewingListViewController _setPreviewPaused:](self, "_setPreviewPaused:", 0LL);
}

void sub_10007ED04(_Unwind_Exception *a1)
{
}

void sub_10007ED20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateListViewBackdropAfterSettingPreviewViewIfNecessary];
}

void sub_10007F43C(id *a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = a1;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));

  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"NO_SHOW_ERROR_MESSAGE" value:0 table:0]);
  [v5 setNoContentErrorMessage:v7];
  [v5 setDelegate:v5];
  [v5 setEnableFetchingWhenViewFirstAppears:1];
}

void sub_10007F890( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10007F8B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10007F8C4(uint64_t a1)
{
}

void sub_10007F8CC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v9 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
  unsigned int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

void sub_1000800F4(id a1)
{
  v5[0] = &off_100106498;
  id v1 = objc_alloc_init(&OBJC_CLASS___NSCache);
  v5[1] = &off_1001064B0;
  v6[0] = v1;
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSCache);
  v6[1] = v2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL));
  id v4 = (void *)qword_100157610;
  qword_100157610 = v3;
}

void sub_100080564(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v12 = a2;
  [v2 setFill];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v12 format]);
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v12, "fillRect:", v5, v7, v9, v11);
}

void sub_100081BE8(uint64_t a1, void *a2, void *a3)
{
  double v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 array]);
  [v4 setObject:v6 forKey:v5];
}

id sub_100083350(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFooterGeometry];
}

BOOL sub_1000836FC(id a1, UIPress *a2)
{
  return (id)-[UIPress type](a2, "type") == (id)4;
}

id sub_100083EF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateColors];
}

void sub_10008420C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  double v11 = objc_alloc_init(&OBJC_CLASS___TVHSimpleLockupLayout);
  [v5 CGSizeValue];
  double v8 = v7;
  double v10 = v9;

  -[TVHSimpleLockupLayout setContentViewSize:](v11, "setContentViewSize:", v8, v10);
  -[TVHSimpleLockupLayout setFooterViewLayout:](v11, "setFooterViewLayout:", *(void *)(a1 + 32));
  [*(id *)(a1 + 40) setObject:v11 forKey:v6];
}

id sub_1000854BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) startAnimating];
}

__CFString *sub_10008561C(unint64_t a1)
{
  if (a1 > 0xA) {
    return 0LL;
  }
  else {
    return off_1000FF7B0[a1];
  }
}

id sub_10008563C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      double v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = (unint64_t)objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v7),  "unsignedIntegerValue",  (void)v12);
        if (v8 > 0xA) {
          double v9 = 0LL;
        }
        else {
          double v9 = off_1000FF7B0[v8];
        }
        -[NSMutableArray addObject:](v2, "addObject:", v9);
        double v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v2, "componentsJoinedByString:", @","));
  return v10;
}

void sub_1000870B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000870E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_1000871C4;
  v9[3] = &unk_1000FF810;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(&_dispatch_main_q, v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
}

void sub_1000871C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2)
  {
    if (*(void *)(a1 + 32)) {
      objc_msgSend(WeakRetained, "_imageProxyDidLoad:withImage:", v2);
    }
    else {
      [WeakRetained _imageProxyDidFail:v2 withError:*(void *)(a1 + 40)];
    }
  }
}

id sub_100087590(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

id sub_1000877EC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.5, 1.5);
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_10008783C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  __int128 v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v5[1] = v3;
  void v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v2 setTransform:v5];
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 32) removeFromSuperview];
  CGAffineTransform v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) layer]);
  [v4 setShouldRasterize:0];
}

id sub_1000878B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t sub_1000878C0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) layer]);
  [v2 setShouldRasterize:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100088E3C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transformedValue:a2];
}

void sub_100089770( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

TVHMediaEntitiesShelfViewController *sub_100089794(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGAffineTransform v4 = objc_alloc_init(&OBJC_CLASS___TVHMediaEntitiesShelfViewLayout);
  -[TVHMediaEntitiesShelfViewLayout setLockupLayoutByMediaEntityType:]( v4,  "setLockupLayoutByMediaEntityType:",  *(void *)(a1 + 32));
  -[TVHShelfViewLayout setMinimumInteritemSpacing:](v4, "setMinimumInteritemSpacing:", 35.0);
  id v5 = -[TVHMediaEntitiesShelfViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesShelfViewController),  "initWithDataSource:layout:",  v3,  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController titleLabel](v5, "titleLabel"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
  [v6 setFont:v7];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[TVHMediaEntitiesShelfViewController setDelegate:](v5, "setDelegate:", WeakRetained);

  return v5;
}

void sub_100089AC4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

NSString *__cdecl sub_100089AEC(id a1, NSIndexPath *a2, id a3)
{
  return (NSString *)@"CellReuseIdentifier";
}

void sub_100089AF8(uint64_t a1, void *a2, void *a3)
{
  CGAffineTransform v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 withIdentifier:v5];
}

id sub_10008B564(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectsAtIndexes:a2]);
  id v4 = [*(id *)(a1 + 40) _newTabBarItemViewControllersWithTabBarItemTypes:v3 mediaCategoryTypes:*(void *)(a1 + 48)];

  return v4;
}

void sub_10008C38C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10008C3A4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v12 = a2;
  unsigned int v7 = [v12 conformsToProtocol:&OBJC_PROTOCOL___TVHMediaLibraryTabBarItemViewController];
  id v8 = v12;
  if (v7)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaCategoryTypes]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 40)));
    unsigned int v11 = [v9 containsObject:v10];

    if (v11)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a3;
      *a4 = 1;
    }

    id v8 = v12;
  }
}

void sub_10008C500( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10008C518(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___TVHMediaLibraryTabBarItemViewController]
    && [v7 type] == *(id *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a3;
    *a4 = 1;
  }
}

void sub_10008CC10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !*(void *)(a1 + 48))
  {
    id v5 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained playbackManager]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    [v3 didDisconnectMediaLibraryWithIdentifier:v4];

    id WeakRetained = v5;
  }
}

void sub_10008F0A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10008F0B8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a2 changeSet]);
  id v7 = v6;
  if (!v6 || (v9 = v6, v8 = [v6 hasChanges], id v7 = v9, v8))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }
}

void sub_10008F45C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10008F474(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10008F484(uint64_t a1)
{
}

void sub_10008F48C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = [a2 itemIndexForIndexTitle:*(void *)(a1 + 32)];
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](&OBJC_CLASS___NSIndexPath, "indexPathForItem:inSection:", v7, a3));
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }

void sub_10008F888(id *a1, void *a2, uint64_t a3)
{
  id v19 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v19 sortDescriptors]);
  if ([a1[4] isEqual:v5])
  {
    [a1[5] addObject:v19];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v19 mediaEntities]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingDescriptors:a1[4]]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1[6] objectAtIndex:a3]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaEntities]);
    id v10 = v9;
    if (v9)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 sortedArrayUsingDescriptors:a1[4]]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryUtilities changeSetFromCurrentMediaEntities:toLatestMediaEntities:]( &OBJC_CLASS___TVHKMediaLibraryUtilities,  "changeSetFromCurrentMediaEntities:toLatestMediaEntities:",  v11,  v7));
    }

    else
    {
      id v12 = 0LL;
    }

    if ([a1[7] _isProvidingIndexTitles])
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([a1[4] firstObject]);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tvhk_preferredKey"));

      if (v14) {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryUtilities indexBarItemsForMediaEntities:indexBarItemPropertyKey:]( &OBJC_CLASS___TVHKMediaLibraryUtilities,  "indexBarItemsForMediaEntities:indexBarItemPropertyKey:",  v7,  v14));
      }
      else {
        __int128 v15 = 0LL;
      }
    }

    else
    {
      __int128 v15 = 0LL;
    }

    id v16 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
    int v18 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( v16,  "initWithIdentifier:mediaEntities:",  v17,  v7);

    -[TVHMediaEntitiesDataSourceFetchResult setSortDescriptors:](v18, "setSortDescriptors:", a1[4]);
    -[TVHMediaEntitiesDataSourceFetchResult setIndexBarItems:](v18, "setIndexBarItems:", v15);
    -[TVHMediaEntitiesDataSourceFetchResult setChangeSet:](v18, "setChangeSet:", v12);
    [a1[5] addObject:v18];
  }
}

void sub_1000901B4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) itemCollectionDescriptors]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:a3]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);
  if ([v9 count])
  {
    id v10 = -[TVHMediaEntitiesDataSourceSectionItemCollection initWithMediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceSectionItemCollection),  "initWithMediaEntities:",  v9);
    unsigned int v11 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceSection);
    __int128 v15 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    id v13 = -[TVHMediaEntitiesDataSourceSection initWithIdentifier:fetchResultIdentifier:itemCollections:]( v11,  "initWithIdentifier:fetchResultIdentifier:itemCollections:",  v6,  v6,  v12);

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
    -[TVHMediaEntitiesDataSourceSection setTitle:](v13, "setTitle:", v14);

    [*(id *)(a1 + 40) addObject:v13];
  }
}

NSCopying *__cdecl sub_10009031C(id a1, TVHMediaEntitiesDataSourceSection *a2)
{
  return (NSCopying *)-[TVHMediaEntitiesDataSourceSection identifier](a2, "identifier");
}

id sub_100090324(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) count] == (id)1
    && ([*(id *)(a1 + 40) _isProvidingMultipleSectionsForIndexTitles] & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) firstObject]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 changeSet]);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntities]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryUtilities changeSetFromCurrentMediaEntities:toLatestMediaEntities:]( &OBJC_CLASS___TVHKMediaLibraryUtilities,  "changeSetFromCurrentMediaEntities:toLatestMediaEntities:",  v7,  v8));
  }

  return v9;
}

id sub_1000903F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSections:*(void *)(a1 + 56)];
}

void sub_100090430(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue([v1 currentSortOption]);
    objc_msgSend(v1, "_notifyDelegateCurrentSortDidChange:");
  }

  else
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue([v1 mediaEntities]);
    objc_msgSend(v1, "_notifyDelegateMediaEntitiesDidChange:");
  }
}

uint64_t sub_100090498(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000904A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100090F40(uint64_t a1)
{
  id v2 = sub_100079D68();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Finishied waiting. Will update root view controller for URL",  v7,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) anyObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URL]);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateRootViewControllerWithURL:v5];
}

void sub_100091E4C(id a1)
{
  v3[0] = &off_100106540;
  v3[1] = &off_100106570;
  v4[0] = &off_100106558;
  v4[1] = &off_100106588;
  v3[2] = &off_1001065A0;
  v3[3] = &off_1001065D0;
  v4[2] = &off_1001065B8;
  v4[3] = &off_1001065E8;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
  id v2 = (void *)qword_100157620;
  qword_100157620 = v1;
}

int64_t sub_100091F0C(id a1, NSNumber *a2, NSNumber *a3)
{
  id v4 = (void *)qword_100157620;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:a2]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157620 objectForKey:v5]);

  id v8 = [v6 compare:v7];
  return (int64_t)v8;
}

id sub_100092000(id a1, TVHPhotosMainItem *a2)
{
  return +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[TVHPhotosMainItem type](a2, "type"));
}

LABEL_22:
      return v3;
    }

    if (a3 == 4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
      id v8 = [v5 showCoverArtShape];
      uint64_t v9 = v8 == (id)2;
      if (v9) {
        id v3 = 0LL;
      }
      else {
        id v3 = 2LL;
      }
      goto LABEL_22;
    }

    return 2LL;
  }

  return 0LL;
}

id sub_100093D28(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

void sub_1000947BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000947D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009489C;
  block[3] = &unk_1000FE9A8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
}

void sub_10009489C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v9 = WeakRetained;
    if (v3)
    {
      id v4 = [v3 code];
      [v9 setAuthenticationInProgress:0];
      if (v4 == (id)-7003LL)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
        id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiTunesAccount"));

        if (v6) {
          [v9 _showShouldUseAccountDialog:v6];
        }
        else {
          [v9 _notifyDidCancel];
        }
      }

      else
      {
        [v9 _presentError];
      }
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:AKAuthenticationUsernameKey]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:AKAuthenticationPasswordKey]);
      [v9 _enableHomeSharingWithAccountName:v7 password:v8];
    }

    id WeakRetained = v9;
  }
}

void sub_100094D20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
}

void sub_100094D74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showLoginWithAccount:*(void *)(a1 + 32)];
}

void sub_100094DB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showLoginWithAccount:0];
}

void sub_100094DE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDidCancel];
}

void sub_100094EF4(_Unwind_Exception *a1)
{
}

void sub_100094F18(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100094FB8;
  block[3] = &unk_1000FFB80;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v6);
}

void sub_100094FB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setAuthenticationInProgress:0];
    if (*(_BYTE *)(a1 + 48)) {
      [v3 _notifyDidSucceedWithAccountName:*(void *)(a1 + 32)];
    }
    else {
      [v3 _presentError];
    }
    id WeakRetained = v3;
  }
}

void sub_1000951F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10009521C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDidCancel];
}

CGFloat sub_100095340( double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v16.origin.x = a5;
  v16.origin.double y = a6;
  v16.size.double width = a7;
  v16.size.double height = a8;
  double v14 = a1 - CGRectGetMinX(v16);
  v17.origin.x = a5;
  v17.origin.double y = a6;
  v17.size.double width = a7;
  v17.size.double height = a8;
  return CGRectGetMaxX(v17) - v14 - a3;
}

CGFloat sub_1000953D0( int a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (a1)
  {
    v17.origin.x = a6;
    v17.origin.double y = a7;
    v17.size.double width = a8;
    v17.size.double height = a9;
    double v15 = a2 - CGRectGetMinX(v17);
    v18.origin.x = a6;
    v18.origin.double y = a7;
    v18.size.double width = a8;
    v18.size.double height = a9;
    return CGRectGetMaxX(v18) - v15 - a4;
  }

  return a2;
}

uint64_t sub_100095468(double a1, double a2, double a3)
{
  double v3 = 1.0;
  if (a3 > 0.0 && a1 > 0.0 && a2 > 0.0)
  {
    if (a1 <= a2) {
      a1 = a2;
    }
    double v3 = (a1 + a3) / a1;
  }

  return BSFloatGreaterThanFloat(v3, 1.0);
}

double sub_1000954E4()
{
  if (qword_100157638 != -1) {
    dispatch_once(&qword_100157638, &stru_1000FFBC8);
  }
  return *(double *)&qword_100157630;
}

void sub_100095524(id a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 scale];
  qword_100157630 = v1;
}

id sub_100095CA8()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://%@",  @"com.apple.TVHomeSharing",  @"selectScreenSaver"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v0));

  return v1;
}

LABEL_4:
  if (![(id)a3 length])
  {
    CGRect v16 = 0LL;
    goto LABEL_11;
  }

  double v14 = &AKAuthenticationPasswordKey_ptr;
  double v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:maximumContentSizeCategory:",  a3,  v11));
  CGRect v16 = v15;
  if (!v15)
  {
LABEL_11:
    BOOL v25 = 0LL;
    goto LABEL_22;
  }

  CGRect v17 = (void *)objc_claimAutoreleasedReturnValue([v15 fontDescriptor]);
  if (a5)
  {
    CGRect v18 = (void *)qword_100157648;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v19]);

    if (v20 && v17)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:UIFontDescriptorTraitsAttribute]);
      id v22 = [v21 mutableCopy];

      [v22 setObject:v20 forKey:UIFontWeightTrait];
      double v28 = UIFontDescriptorTraitsAttribute;
      id v29 = v22;
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      id v24 = objc_claimAutoreleasedReturnValue([v17 fontDescriptorByAddingAttributes:v23]);

      CGRect v17 = (void *)v24;
      double v14 = &AKAuthenticationPasswordKey_ptr;
    }
  }

  else
  {
    id v20 = 0LL;
  }

  if (a5 == 10) {
    a7 |= 2u;
  }
  if (a7 && v17)
  {
    id v26 = objc_claimAutoreleasedReturnValue( objc_msgSend( v17,  "fontDescriptorWithSymbolicTraits:",  objc_msgSend(v17, "symbolicTraits") | a7));

    CGRect v17 = (void *)v26;
  }

  if (v17) {
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v14[194] fontWithDescriptor:v17 size:a6]);
  }
  else {
    BOOL v25 = 0LL;
  }

LABEL_22:
  return v25;
}

void sub_1000969E8(id a1)
{
  v16[0] = &off_100106648;
  v16[1] = &off_100106660;
  v17[0] = UIFontTextStyleTitle0;
  v17[1] = UIFontTextStyleTitle1;
  v16[2] = &off_100106678;
  v16[3] = &off_100106690;
  v17[2] = UIFontTextStyleTitle2;
  v17[3] = UIFontTextStyleTitle3;
  void v16[4] = &off_1001066A8;
  v16[5] = &off_1001066C0;
  v17[4] = kCTUIFontTextStyleTitle4;
  v17[5] = UIFontTextStyleHeadline;
  v16[6] = &off_1001066D8;
  v16[7] = &off_1001066F0;
  v17[6] = UIFontTextStyleHeadline2;
  v17[7] = kCTUIFontTextStyleHeadline3;
  v16[8] = &off_100106708;
  v16[9] = &off_100106720;
  v17[8] = UIFontTextStyleSubtitle1;
  v17[9] = UIFontTextStyleSubtitle2;
  v16[10] = &off_100106738;
  v16[11] = &off_100106750;
  v17[10] = UIFontTextStyleSubtitle3;
  v17[11] = UIFontTextStyleCallout;
  v16[12] = &off_100106768;
  v16[13] = &off_100106780;
  v17[12] = UIFontTextStyleBody;
  v17[13] = UIFontTextStyleSubhead;
  v16[14] = &off_100106798;
  v16[15] = &off_1001067B0;
  v17[14] = UIFontTextStyleFootnote;
  v17[15] = UIFontTextStyleCaption1;
  v16[16] = &off_1001067C8;
  v16[17] = &off_1001067E0;
  v17[16] = UIFontTextStyleCaption2;
  v17[17] = kCTUIFontTextStyleShortHeadline;
  v16[18] = &off_1001067F8;
  v16[19] = &off_100106810;
  v17[18] = kCTUIFontTextStyleShortBody;
  v17[19] = kCTUIFontTextStyleShortSubhead;
  v16[20] = &off_100106828;
  v16[21] = &off_100106840;
  v17[20] = kCTUIFontTextStyleShortFootnote;
  v17[21] = kCTUIFontTextStyleShortCaption1;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  22LL));
  id v2 = (void *)qword_100157640;
  qword_100157640 = v1;

  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  UIFontWeightUltraLight,  &off_100106858));
  v15[0] = v3;
  v14[1] = &off_100106870;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightThin));
  v15[1] = v4;
  v14[2] = &off_100106888;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightLight));
  v15[2] = v5;
  v14[3] = &off_1001068A0;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightRegular));
  v15[3] = v6;
  void v14[4] = &off_1001068B8;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightMedium));
  v15[4] = v7;
  void v14[5] = &off_1001068D0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightSemibold));
  v15[5] = v8;
  v14[6] = &off_1001068E8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightBold));
  v15[6] = v9;
  v14[7] = &off_100106900;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightHeavy));
  v15[7] = v10;
  v14[8] = &off_100106918;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightBlack));
  v15[8] = v11;
  uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  9LL));
  id v13 = (void *)qword_100157648;
  qword_100157648 = v12;
}

id sub_100097128(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

id sub_100097130(uint64_t a1)
{
  return [*(id *)(a1 + 32) labelHeight];
}

id sub_100097138(uint64_t a1)
{
  return [*(id *)(a1 + 32) labelSpacing];
}

void sub_100097D64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

NSString *__cdecl sub_100097D9C(id a1, NSIndexPath *a2)
{
  return (NSString *)@"GridCellIdentifier";
}

void sub_100097DA8(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _configureCell:v6 atIndexPath:v5];
}

id sub_100097E0C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if ([a3 isEqualToString:UICollectionElementKindSectionHeader])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _sectionHeaderViewForCollectionView:v7 atIndexPath:v8]);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

id sub_100098E80(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setCurrentSortOption:a2];
}

BOOL sub_100099090(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([a2 fetchResultIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaEntitiesForFetchResultIdentifier:v3]);

  BOOL v5 = [v4 count] != 0;
  return v5;
}

int64_t sub_100099908(id a1, TVHKMediaEntityGroup *a2, TVHKMediaEntityGroup *a3)
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntityGroup identifier](a2, "identifier"));
  id v6 = [v5 integerValue];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntityGroup identifier](v4, "identifier"));
  id v8 = [v7 integerValue];

  int64_t v10 = v6 == (id)1 && v8 != (id)1;
  if (v8 != (id)2 && v6 == (id)2) {
    return -1LL;
  }
  else {
    return v10;
  }
}

void sub_100099D2C(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tvh_dateFormatterWithFormatTemplate:", @"EEEE"));
  id v2 = (void *)qword_100157658;
  qword_100157658 = v1;
}

void sub_100099DD0(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tvh_dateFormatterWithFormatTemplate:", @"EEE"));
  id v2 = (void *)qword_100157668;
  qword_100157668 = v1;
}

void sub_100099E74(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tvh_dateFormatterWithFormatTemplate:", @"MMMM d"));
  id v2 = (void *)qword_100157678;
  qword_100157678 = v1;
}

void sub_100099F18(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tvh_dateFormatterWithFormatTemplate:", @"MMM d"));
  id v2 = (void *)qword_100157688;
  qword_100157688 = v1;
}

void sub_100099FBC(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tvh_dateFormatterWithFormatTemplate:", @"MMMM d, yyyy"));
  id v2 = (void *)qword_100157698;
  qword_100157698 = v1;
}

void sub_10009A060(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tvh_dateFormatterWithFormatTemplate:", @"MMM d, yyyy"));
  id v2 = (void *)qword_1001576A8;
  qword_1001576A8 = v1;
}

id sub_10009A7F0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _label]);
  [v4 setText:v3];

  [v4 sizeToFit];
  return v4;
}

void sub_10009BF3C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009BFA4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009C00C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009C074(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "No items found for fetch request identifier: %@. This probably indicates a misconfigured section object",  (uint8_t *)&v2,  0xCu);
}

void sub_10009C0E8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Playback request failed with error {%@}",  (uint8_t *)&v2,  0xCu);
}

void sub_10009C15C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to present bulletin with error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10009C1D0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "No media server identifier representation found in dictionary: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10009C244(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to convert media server identifier representation into object",  v1,  2u);
}

void sub_10009C284(os_log_t log)
{
  int v1 = 138412290;
  int v2 = @"playedState";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "No grouping found in the response for grouping key: %@. This probably indicates a misconfigured section model",  (uint8_t *)&v1,  0xCu);
}

void sub_10009C304(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to set audio session category with default mode. error=%@",  (uint8_t *)&v2,  0xCu);
}

void sub_10009C378(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Invalid playback start index (%lu). Will reset start index to 0",  (uint8_t *)&v2,  0xCu);
}

void sub_10009C3EC()
{
  sub_1000490E4( (void *)&_mh_execute_header,  v0,  v1,  "No playable media items available! Empty playlist will be returned.",  v2,  v3,  v4,  v5,  v6);
  sub_1000490F4();
}

void sub_10009C418()
{
}

void sub_10009C444()
{
}

void sub_10009C470()
{
}

void sub_10009C49C()
{
}

void sub_10009C4C8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "TVHMediaLibraryViewController: Unable to find ourselves on the view controller nav stack! Bailing.",  v1,  2u);
}

void sub_10009C508(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 requests]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Parade fetch failed for requests: {%@}",  (uint8_t *)&v4,  0xCu);
}

void sub_10009C59C()
{
}

void sub_10009C5C8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009C62C()
{
}

void sub_10009C658( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009C6BC()
{
}

void sub_10009C6E8()
{
}

void sub_10009C714()
{
}

void sub_10009C740()
{
}

void sub_10009C76C()
{
}

void sub_10009C798()
{
  sub_10000A610( (void *)&_mh_execute_header,  v0,  v1,  "Unable to find shelf view controller for identifier when starting to display cell. identifier=%@",  v2,  v3,  v4,  v5,  v6);
  sub_10004DBA0();
}

void sub_10009C7F8()
{
  sub_10000A610( (void *)&_mh_execute_header,  v0,  v1,  "About to display shelf view controller but it has already been added to the child view controllers. shelfViewController=%@",  v2,  v3,  v4,  v5,  v6);
  sub_10004DBA0();
}

void sub_10009C858()
{
  sub_10000A610( (void *)&_mh_execute_header,  v0,  v1,  "Unable to find shelf view controller for identifier when ending display of cell. identifier=%@",  v2,  v3,  v4,  v5,  v6);
  sub_10004DBA0();
}

void sub_10009C8B8()
{
  sub_10000A610( (void *)&_mh_execute_header,  v0,  v1,  "About to end display of shelf view controller but it was never added to the child view controllers. shelfViewController=%@",  v2,  v3,  v4,  v5,  v6);
  sub_10004DBA0();
}

void sub_10009C918(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "KeepAlive timer fired.", v1, 2u);
}

void sub_10009C958(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_100063D94((void *)&_mh_execute_header, a2, a3, "Failed to find scrollview for test '%@'", (uint8_t *)&v3);
}

void sub_10009C9C4(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100063D94((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unable to find tab: %@", (uint8_t *)a2);
}

void sub_10009CA10(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "TVHScreenSaverProviderService: No response block",  v1,  2u);
}

void sub_10009CA50( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A610( (void *)&_mh_execute_header,  a2,  a3,  "Unable to restore PiP video to fullscreen as we PiP is not active. context=%@",  a5,  a6,  a7,  a8,  2u);
  sub_10004DBA0();
}

void sub_10009CAB4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A610( (void *)&_mh_execute_header,  a2,  a3,  "Unable to set audio session category with movie playback mode. error=%@",  a5,  a6,  a7,  a8,  2u);
  sub_10004DBA0();
}

void sub_10009CB18( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A610( (void *)&_mh_execute_header,  a2,  a3,  "Received restoreUserInterfaceForPictureInPictureStop but we already have a restore in progress. Will complete immedi ately. context=%@",  a5,  a6,  a7,  a8,  2u);
  sub_10004DBA0();
}

void sub_10009CB7C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A610( (void *)&_mh_execute_header,  a2,  a3,  "Received restoreUserInterfaceForPictureInPictureStop. Will restore PiP video to fullscreen. context=%@",  a5,  a6,  a7,  a8,  2u);
  sub_10004DBA0();
}

void sub_10009CBE4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009CC18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009CC4C(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 screenSaverDescriptor]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaServerIdentifier]);
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "TVHScreenSaverPhotoAssetsRequest: Media library watchdog fired. Unable to find media library with identifier: %@",  (uint8_t *)&v5,  0xCu);

  sub_100078F10();
}

void sub_10009CCEC(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 firstObject]);
  sub_100078F34();
  sub_100078F20( (void *)&_mh_execute_header,  v3,  v4,  "TVHScreenSaverPhotoAssetsRequest: Filtered media entities (%u) [%@]",  v5,  v6,  v7,  v8,  v9);

  sub_100078F10();
}

void sub_10009CD78(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 firstObject]);
  sub_100078F34();
  sub_100078F20( (void *)&_mh_execute_header,  v3,  v4,  "TVHScreenSaverPhotoAssetsRequest: Filtering media entities (%u) [%@]",  v5,  v6,  v7,  v8,  v9);

  sub_100078F10();
}

void sub_10009CE04(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Tried to add a UIFocusGuide for an unsupported direction",  v1,  2u);
}

void sub_10009CE44(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "TVHImageProxyQueueLoader failed to load image with error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10009CEB8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Index bar items contain duplicate entries! Will ignore",  v1,  2u);
}

id objc_msgSend__addViewControllerToNavigationController_animate_removePlaybackViewControllers_otherViewControllersToRemove_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_addViewControllerToNavigationController:animate:removePlaybackViewControllers:otherViewControllersToRemove:");
}

id objc_msgSend__beginZoomAnimationFromViewController_toViewController_containerView_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_beginZoomAnimationFromViewController:toViewController:containerView:completion:");
}

id objc_msgSend__callRequestResponseHandlerWithPhotoAssets_responseCount_finishedRequest_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_callRequestResponseHandlerWithPhotoAssets:responseCount:finishedRequest:");
}

id objc_msgSend__contentSizeAndContentSectionCellMargins_contentSectionFirstCellPartialMargin_contentSectionFirstCellZeroTopMargin_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_contentSizeAndContentSectionCellMargins:contentSectionFirstCellPartialMargin:contentSectionFirstCellZeroTopMargin:");
}

id objc_msgSend__dataSourceContentDidChangeWithAnimateChanges_itemIdentifiersOfAmendedItems_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dataSourceContentDidChangeWithAnimateChanges:itemIdentifiersOfAmendedItems:");
}

id objc_msgSend__delegateContentViewControllerWithResultSet_sourceMediaEntity_sourceMediaEntityBackgroundImageInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_delegateContentViewControllerWithResultSet:sourceMediaEntity:sourceMediaEntityBackgroundImageInfo:");
}

id objc_msgSend__delegateUpdateContentViewControllerWithSourceMediaEntity_sourceMediaEntityBackgroundImageInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_delegateUpdateContentViewControllerWithSourceMediaEntity:sourceMediaEntityBackgroundImageInfo:");
}

id objc_msgSend__findScrollViewInView_desiredScrollViewClass_numScrollSubviewsToSkip_numScrollSubviewsFound_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_findScrollViewInView:desiredScrollViewClass:numScrollSubviewsToSkip:numScrollSubviewsFound:");
}

id objc_msgSend__performScrollTest_iterations_delta_length_scrollAxis_extraResultsBlock_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:");
}

id objc_msgSend__showViewController_animate_removePlaybackViewControllers_otherViewControllersToRemove_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showViewController:animate:removePlaybackViewControllers:otherViewControllersToRemove:");
}

id objc_msgSend__startPhotoAssetsRequestWithScreenSaverDescriptor_photoServiceResponseBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startPhotoAssetsRequestWithScreenSaverDescriptor:photoServiceResponseBlock:");
}

id objc_msgSend__tvh_imageDecoratorForMediaEntityImageLoadParams_imageDecoratorType_scaleToSize_scaleMode_cornerRadius_focusedSizeIncrease_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_tvh_imageDecoratorForMediaEntityImageLoadParams:imageDecoratorType:scaleToSize:scaleMode:cornerRadius:focusedSizeIncrease:");
}

id objc_msgSend__tvh_imageProxyWithMediaEntityImageLoadParams_mediaLibrary_imageDecoratorType_scaleToSize_scaleMode_cornerRadius_focusedSizeIncrease_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_tvh_imageProxyWithMediaEntityImageLoadParams:mediaLibrary:imageDecoratorType:scaleToSize:scaleMode:cornerRad ius:focusedSizeIncrease:");
}

id objc_msgSend__tvh_mediaItemContextMenuButtonTitlesWithMediaItem_outPlayNextTitle_outPlayLaterTitle_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tvh_mediaItemContextMenuButtonTitlesWithMediaItem:outPlayNextTitle:outPlayLaterTitle:");
}

id objc_msgSend__tvh_performBatchUpdatesWithSectionsChangeSet_updateDataSourceHandler_applyChangeHandler_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_tvh_performBatchUpdatesWithSectionsChangeSet:updateDataSourceHandler:applyChangeHandler:completionHandler:");
}

id objc_msgSend__updateAncestorFocusedAndAppearanceForFocusUpdateContext_withAnimationCoordinator_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAncestorFocusedAndAppearanceForFocusUpdateContext:withAnimationCoordinator:");
}

id objc_msgSend__workQueue_moveFocusInDirection_toListItemWithTitle_inSelectedViewControllerOfTabBarController_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_workQueue_moveFocusInDirection:toListItemWithTitle:inSelectedViewControllerOfTabBarController:");
}

id objc_msgSend__workQueue_waitForLoadingToCompleteForNavigationControllerVisibleViewController( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_workQueue_waitForLoadingToCompleteForNavigationControllerVisibleViewController");
}

id objc_msgSend_bestMatchingMediaEntityCollectionForIdentifier_fromMediaEntityCollections_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bestMatchingMediaEntityCollectionForIdentifier:fromMediaEntityCollections:");
}

id objc_msgSend_changeSetDataSourceContentProvider_contentDidChangeWithSectionsChangeSet_updateUnderlyingModelHandler_animateChanges_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "changeSetDataSourceContentProvider:contentDidChangeWithSectionsChangeSet:updateUnderlyingModelHandler:animate Changes:completionHandler:");
}

id objc_msgSend_diffableDataSourceContentProvider_contentDidChangeWithAnimateChanges_itemIdentifiersOfAmendedItems_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "diffableDataSourceContentProvider:contentDidChangeWithAnimateChanges:itemIdentifiersOfAmendedItems:");
}

id objc_msgSend_initWithCollectionView_contentProvider_cellReuseIdentifierProvider_cellConfigurator_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:");
}

id objc_msgSend_initWithLatestMediaEntitiesFetchResult_previousMediaEntitiesFetchResult_changeSet_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLatestMediaEntitiesFetchResult:previousMediaEntitiesFetchResult:changeSet:");
}

id objc_msgSend_initWithMediaEntityCollection_mediaLibrary_imageShape_backgroundImageInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediaEntityCollection:mediaLibrary:imageShape:backgroundImageInfo:");
}

id objc_msgSend_initWithMediaLibrary_fetchRequestIdentifier_sortOptions_initialSortOption_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediaLibrary:fetchRequestIdentifier:sortOptions:initialSortOption:");
}

id objc_msgSend_initWithMediaLibrary_fetchRequests_sourceMediaEntity_sourceMediaEntitiesFetchContext_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediaLibrary:fetchRequests:sourceMediaEntity:sourceMediaEntitiesFetchContext:");
}

id objc_msgSend_initWithMediaLibrary_mediaCategoryType_mediaEntityCollectionType_mediaEntityCollectionIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionType:mediaEntityCollectionIdentifier:");
}

id objc_msgSend_initWithMediaLibrary_unplayedDataSource_partiallyPlayedDataSource_lockupLayoutByMediaEntityType_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithMediaLibrary:unplayedDataSource:partiallyPlayedDataSource:lockupLayoutByMediaEntityType:");
}

id objc_msgSend_initWithPlaylist_mediaLibrary_playlistsFetchContext_playlistItemMediaCategoryTypes_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:");
}

id objc_msgSend_initWithPlaylistFolder_mediaLibrary_playlistsFetchContext_playlistItemMediaCategoryTypes_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPlaylistFolder:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:");
}

id objc_msgSend_initWithSeason_seasonsFetchContext_show_showsFetchContext_showsInfoCenter_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSeason:seasonsFetchContext:show:showsFetchContext:showsInfoCenter:");
}

id objc_msgSend_initWithUnplayedDataSource_partiallyPlayedDataSource_shelfViewControllerBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnplayedDataSource:partiallyPlayedDataSource:shelfViewControllerBlock:");
}

id objc_msgSend_initWithUnplayedMediaEntitiesDataSource_partiallyPlayedMediaEntitiesDataSource_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnplayedMediaEntitiesDataSource:partiallyPlayedMediaEntitiesDataSource:");
}

id objc_msgSend_interactivePlaylistPlaybackContext_showMediaEntityCollectionForMediaItem_mediaEntityCollectionType_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "interactivePlaylistPlaybackContext:showMediaEntityCollectionForMediaItem:mediaEntityCollectionType:");
}

id objc_msgSend_mediaEntitiesFetchViewController_contentViewControllerWithFetchControllerResultSet_sourceMediaEntity_sourceMediaEntityBackgroundImageInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "mediaEntitiesFetchViewController:contentViewControllerWithFetchControllerResultSet:sourceMediaEntity:sourceMe diaEntityBackgroundImageInfo:");
}

id objc_msgSend_mediaEntitiesFetchViewController_purgeSourceMediaEntityBackgroundImagesForContentViewController_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "mediaEntitiesFetchViewController:purgeSourceMediaEntityBackgroundImagesForContentViewController:");
}

id objc_msgSend_mediaEntitiesFetchViewController_shouldShowContentViewControllerWithFetchControllerResultSet_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "mediaEntitiesFetchViewController:shouldShowContentViewControllerWithFetchControllerResultSet:");
}

id objc_msgSend_mediaEntitiesFetchViewController_updateContentViewController_withFetchControllerResultSet_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaEntitiesFetchViewController:updateContentViewController:withFetchControllerResultSet:");
}

id objc_msgSend_mediaEntitiesFetchViewController_updateContentViewController_withSourceMediaEntity_sourceMediaEntityBackgroundImageInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "mediaEntitiesFetchViewController:updateContentViewController:withSourceMediaEntity:sourceMediaEntityBackgroundImageInfo:");
}

id objc_msgSend_mediaEntitiesListViewController_updatePreviewViewController_latestMediaEntitiesFetchResult_previousMediaEntitiesFetchResult_changeSet_context_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "mediaEntitiesListViewController:updatePreviewViewController:latestMediaEntitiesFetchResult:previousMediaEntit iesFetchResult:changeSet:context:");
}

id objc_msgSend_mediaEntityCollectionContentDescriptionPreviewViewDidSelectContentDescription_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaEntityCollectionContentDescriptionPreviewViewDidSelectContentDescription:");
}

id objc_msgSend_mediaEntityCollectionDetailsViewController_contextMenuOptionsForMediaItem_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaEntityCollectionDetailsViewController:contextMenuOptionsForMediaItem:");
}

id objc_msgSend_mediaEntityCollectionDetailsViewController_updateHeaderView_forMediaEntityCollection_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaEntityCollectionDetailsViewController:updateHeaderView:forMediaEntityCollection:");
}

id objc_msgSend_mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType_mediaCategoryType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:");
}

id objc_msgSend_moreContextMenuActionsForMediaEntityCollectionPreviewPlaybackControlsView_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moreContextMenuActionsForMediaEntityCollectionPreviewPlaybackControlsView:");
}

id objc_msgSend_playbackManager_showMediaEntityCollectionForMediaItem_mediaEntityCollectionType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackManager:showMediaEntityCollectionForMediaItem:mediaEntityCollectionType:");
}

id objc_msgSend_playbackManager_showPlaybackViewController_options_viewControllersToRemove_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackManager:showPlaybackViewController:options:viewControllersToRemove:");
}

id objc_msgSend_playlistViewControllerWithPlaylist_mediaLibrary_playlistsFetchContext_playlistItemMediaCategoryTypes_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "playlistViewControllerWithPlaylist:mediaLibrary:playlistsFetchContext:playlistItemMediaCategoryTypes:");
}

id objc_msgSend_setMediaServerDiscoveryConfigurationWithMode_homeSharingAccountName_homeSharingPassword_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setMediaServerDiscoveryConfigurationWithMode:homeSharingAccountName:homeSharingPassword:completionHandler:");
}

id objc_msgSend_tvh_diffableDataSourceSnapshotWithContentProvider_itemIdentifiersOfAmendedItems_itemIdentifiersToReloadBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "tvh_diffableDataSourceSnapshotWithContentProvider:itemIdentifiersOfAmendedItems:itemIdentifiersToReloadBlock:");
}

id objc_msgSend_tvh_imagePreviewFetchRequestWithMediaCategoryType_photoPlaylistIdentifier_maxMediaEntities_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvh_imagePreviewFetchRequestWithMediaCategoryType:photoPlaylistIdentifier:maxMediaEntities:");
}

id objc_msgSend_tvh_imageProxyWithContributorName_mediaItem_scaleToSize_focusedSizeIncrease_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvh_imageProxyWithContributorName:mediaItem:scaleToSize:focusedSizeIncrease:");
}

id objc_msgSend_tvh_imageProxyWithMediaEntity_mediaLibrary_imageType_imageDecoratorType_scaleToSize_scaleMode_cornerRadius_focusedSizeIncrease_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "tvh_imageProxyWithMediaEntity:mediaLibrary:imageType:imageDecoratorType:scaleToSize:scaleMode:cornerRadius:fo cusedSizeIncrease:");
}

id objc_msgSend_tvh_imageProxyWithMediaEntity_mediaLibrary_scaleToSize_scaleMode_cornerRadius_focusedSizeIncrease_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:scaleMode:cornerRadius:focusedSizeIncrease:");
}

id objc_msgSend_tvh_mediaEntityCollectionViewControllerForMediaItem_mediaEntityCollectionType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvh_mediaEntityCollectionViewControllerForMediaItem:mediaEntityCollectionType:");
}

id objc_msgSend_tvh_mediaItemContextMenuAlertControllerWithMediaItem_mediaLibrary_navigationController_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "tvh_mediaItemContextMenuAlertControllerWithMediaItem:mediaLibrary:navigationController:options:");
}

id objc_msgSend_tvh_moreAlertControllerWithMediaEntityCollection_mediaItems_mediaLibrary_player_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvh_moreAlertControllerWithMediaEntityCollection:mediaItems:mediaLibrary:player:");
}

id objc_msgSend_tvh_performBatchUpdatesWithSectionsChangeSet_updateDataSourceHandler_applyChangeHandler_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "tvh_performBatchUpdatesWithSectionsChangeSet:updateDataSourceHandler:applyChangeHandler:completionHandler:");
}

id objc_msgSend_tvh_sortOptionAlertControllerWithSortOptions_currentSortOptionIndex_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvh_sortOptionAlertControllerWithSortOptions:currentSortOptionIndex:completionHandler:");
}

id objc_msgSend_tvh_toplevelPlaylistsFetchRequestWithIdentifier_playlistItemMediaCategoryTypes_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvh_toplevelPlaylistsFetchRequestWithIdentifier:playlistItemMediaCategoryTypes:");
}

id objc_msgSend_tvhk_applyChangeSetIfAvailable_destinationObjectsBlock_amendObjectBlock_replaceContentsOnNilChangeSet_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "tvhk_applyChangeSetIfAvailable:destinationObjectsBlock:amendObjectBlock:replaceContentsOnNilChangeSet:");
}

id objc_msgSend_tvhk_applyChangeSetIfAvailable_destinationObjectsBlock_replaceContentsOnNilChangeSet_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvhk_applyChangeSetIfAvailable:destinationObjectsBlock:replaceContentsOnNilChangeSet:");
}

id objc_msgSend_updateWithMediaEntitiesFetchControllerResultSet_itemIdentifiersOfAmendedItems_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithMediaEntitiesFetchControllerResultSet:itemIdentifiersOfAmendedItems:");
}

id objc_msgSend_videoPlayerViewController_didStartPictureInPictureWithAVPlayerViewController_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoPlayerViewController:didStartPictureInPictureWithAVPlayerViewController:");
}

id objc_msgSend_videoPlayerViewController_didStopPictureInPictureWithAVPlayerViewController_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoPlayerViewController:didStopPictureInPictureWithAVPlayerViewController:");
}

id objc_msgSend_videoPlayerViewController_failedToStartPictureInPictureWithAVPlayerViewController_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoPlayerViewController:failedToStartPictureInPictureWithAVPlayerViewController:error:");
}

id objc_msgSend_videoPlayerViewController_restoreUserInterfaceForPictureInPictureStopWithAVPlayerViewController_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "videoPlayerViewController:restoreUserInterfaceForPictureInPictureStopWithAVPlayerViewController:completionHandler:");
}

id objc_msgSend_videoPlayerViewController_willStartPictureInPictureWithAVPlayerViewController_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoPlayerViewController:willStartPictureInPictureWithAVPlayerViewController:");
}

id objc_msgSend_videoPlayerViewController_willStopPictureInPictureWithAVPlayerViewController_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoPlayerViewController:willStopPictureInPictureWithAVPlayerViewController:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}