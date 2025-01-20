void sub_10000277C(uint64_t a1)
{
  void *v1;
  void *v2;
  __int128 v3;
  _OWORD v4[3];
  v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menuContainerViewController]);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 view]);
  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v2 setTransform:v4];
}

void sub_1000027E0(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 _translation];
    v2 = *(void **)(a1 + 32);
  }

  else
  {
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    __int128 v6 = 0u;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 menuContainerViewController]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  [v4 setTransform:v5];
}

uint64_t sub_100002860(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000365C(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1LL, a2);
  }
  return result;
}

id sub_1000038E4(void *a1, uint64_t a2)
{
  id v3 = a1;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (a2 >= 1)
  {
    do
    {
      -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v3);
      --a2;
    }

    while (a2);
  }

  id v5 = -[NSMutableArray copy](v4, "copy");

  return v5;
}

void sub_100003954(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) testName]);
  [v3 finishedTest:v2 extraResults:0];
}

void sub_100003BA4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (a2
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVPMemoriesTabCollectionViewController, v5),
        (objc_opt_isKindOfClass(v7, v6) & 1) != 0))
  {
    objc_msgSend(v7, "ppt_navigateToLatestInteractiveMemoryWithWillPresentHandler:", *(void *)(a1 + 40));
  }

  else
  {
    [*(id *)(a1 + 32) _failedCurrentTestWithFailure:@"Unable to navigate to Memories tab"];
  }
}

uint64_t sub_100003CF4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_100003D80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100003E60(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_100003EEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100003F70(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  if (a2
    && ((uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryCollectionViewController, v5),
         (objc_opt_isKindOfClass(v10, v6) & 1) != 0)
     || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___PXPhotosUIViewController, v7), (objc_opt_isKindOfClass(v10, v8) & 1) != 0)))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ppt_scrollView"));
    [*(id *)(a1 + 32) _performScrollTestOnScrollView:v9 completionHandler:0];
  }

  else
  {
    [*(id *)(a1 + 32) _failedCurrentTestWithFailure:@"Unable to navigate to Moments tab"];
  }
}

void sub_10000408C(uint64_t a1, int a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([a3 view]);
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
    [v3 _performFocusSwipeTestOnWindow:v4];
  }

  else
  {
    [*(id *)(a1 + 32) _failedCurrentTestWithFailure:@"Unable to navigate to Moments tab"];
  }
}

void sub_100004174(uint64_t a1, int a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([a3 view]);
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
    [v3 _performFocusMoveTestOnWindow:v4];
  }

  else
  {
    [*(id *)(a1 + 32) _failedCurrentTestWithFailure:@"Unable to navigate to Moments tab"];
  }

void sub_10000425C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (a2
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryAlbumsListController, v5),
        (objc_opt_isKindOfClass(v8, v6) & 1) != 0))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ppt_albumListCollectionView"));
    [*(id *)(a1 + 32) _performScrollTestOnScrollView:v7 completionHandler:0];
  }

  else
  {
    [*(id *)(a1 + 32) _failedCurrentTestWithFailure:@"Unable to navigate to Albums tab"];
  }
}

void sub_100004364(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryAlbumsListController, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v10, v5);
  uint64_t v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 window]);
    [v7 _performFocusSwipeTestOnWindow:v9];
  }

  else
  {
    [v7 _failedCurrentTestWithFailure:@"Unable to navigate to Albums tab"];
  }
}

void sub_100004474(uint64_t a1, int a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([a3 view]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
    [v3 _performFocusMoveTestOnWindow:v4];
  }

  else
  {
    [*(id *)(a1 + 32) _failedCurrentTestWithFailure:@"Unable to navigate to Albums tab"];
  }

void sub_1000044F4(id a1, PXStoryPPTPerformer *a2, PXStoryPlayerTestElement *a3, id a4)
{
}

void sub_1000045A0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentStoryPPTPerformer]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004630;
  v6[3] = &unk_1000C9680;
  v6[4] = *(void *)(a1 + 32);
  [v5 runPlaybackStartTestWithElement:v4 completion:v6];
}

id sub_100004630(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedCurrentTest];
}

void sub_100004668(id a1, PXStoryPPTPerformer *a2, PXStoryPlayerTestElement *a3, id a4)
{
}

void sub_10000467C(id a1, PXStoryPPTPerformer *a2, PXStoryViewConfiguration *a3, id a4)
{
}

void sub_100004690(id a1, PXStoryPPTPerformer *a2, PXStoryViewConfiguration *a3, id a4)
{
}

void sub_100004768(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004824;
  v8[3] = &unk_1000C97A0;
  v8[4] = v6;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v7 = v5;
  [v6 _navigateToStoryPlayerWithConfiguration:a2 completion:v8];
}

void sub_100004824(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100004904;
    v7[3] = &unk_1000C9778;
    uint64_t v6 = *(void *)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, uint64_t, id, void *))(v5 + 16))(v5, v6, v8, v7);
  }

  else
  {
    [*(id *)(a1 + 32) _failedCurrentTestWithFailure:@"Unable to navigate to player."];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_100004904(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000498C;
  _OWORD v5[3] = &unk_1000C9750;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  char v7 = a2;
  [v3 _dismissStoryPlayer:v4 completion:v5];
}

id sub_10000498C(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    return (id)(*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48));
  }
  else {
    return [*(id *)(a1 + 32) _failedCurrentTestWithFailure:@"Unable to dismiss player."];
  }
}

void sub_100004A80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[PXMockExtendedTraitCollection alloc] initWithFormFactor:13 orientation:2 visibleChromeElements:0];
  id v8 = -[PXStoryViewConfiguration initWithConfiguration:extendedTraitCollection:]( objc_alloc(&OBJC_CLASS___PXStoryViewConfiguration),  "initWithConfiguration:extendedTraitCollection:",  v6,  v7);

  uint64_t v11 = a1 + 32;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v11 + 8);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100004B74;
  v14[3] = &unk_1000C97F0;
  id v15 = v5;
  v12 = *(void (**)(uint64_t, uint64_t, PXStoryViewConfiguration *, void *))(v10 + 16);
  id v13 = v5;
  v12(v10, v9, v8, v14);
}

uint64_t sub_100004B74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100004B8C(id a1, PXStoryPPTPerformer *a2, PXFeedTestElement *a3, id a4)
{
}

void sub_100004C64(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004D20;
  v8[3] = &unk_1000C9880;
  v8[4] = v6;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v7 = v5;
  [v6 _navigateToStoryFeedWithConfiguration:a2 completion:v8];
}

void sub_100004D20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100004E00;
    v7[3] = &unk_1000C9778;
    uint64_t v6 = *(void *)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, uint64_t, id, void *))(v5 + 16))(v5, v6, v8, v7);
  }

  else
  {
    [*(id *)(a1 + 32) _failedCurrentTestWithFailure:@"Unable to navigate to feed."];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_100004E00(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004E88;
  _OWORD v5[3] = &unk_1000C9750;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  char v7 = a2;
  [v3 _dismissStoryFeed:v4 completion:v5];
}

id sub_100004E88(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    return (id)(*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48));
  }
  else {
    return [*(id *)(a1 + 32) _failedCurrentTestWithFailure:@"Unable to dismiss feed."];
  }
}

void sub_100004EBC(id a1, PXDisplayAssetViewPPTPerformer *a2, NSArray *a3, id a4)
{
}

void sub_100004ED0(id a1, PXDisplayAssetViewPPTPerformer *a2, NSArray *a3, id a4)
{
}

void sub_100005034(uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___PXDisplayAssetViewPPTPerformer);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  uint64_t v4 = -[PXDisplayAssetViewPPTPerformer initWithContainerView:delegate:testOptions:]( v2,  "initWithContainerView:delegate:testOptions:",  v3,  *(void *)(a1 + 40),  *(void *)(a1 + 48));

  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000050F8;
  v7[3] = &unk_1000C9930;
  id v8 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, PXDisplayAssetViewPPTPerformer *, uint64_t, void *))(v5 + 16))(v5, v4, v6, v7);
}

void sub_1000050F8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = PLUIGetLog();
    char v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "asset view test failed: %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_1000055E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  PXPPTDidEndScrollTestOnScrollView(*(void *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

LABEL_18:
        }

        id v10 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      }

      while (v10);

      v21 = v49;
      if (!v49)
      {
        v33 = 0LL;
        uint64_t v4 = v46;
        goto LABEL_29;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v49 photoIndices]);
      v23 = [v22 count];

      int v8 = (void *)objc_claimAutoreleasedReturnValue([v49 photoIndices]);
      [v49 batchFrame];
      v25 = v24;
      [v49 batchFrame];
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:0]);
      v29 = [v28 integerValue];

      uint64_t v4 = v46;
      if (v7 == v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:0]);
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  (int)[v30 intValue],  0));

        v32 = (void *)objc_claimAutoreleasedReturnValue( +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___UICollectionViewLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v31));
        v33 = v32;
        v34 = v25;
LABEL_23:
        objc_msgSend(v32, "setFrame:", v34, v27, 666.0, 666.0);
        -[NSMutableDictionary setObject:forKey:](self->_indexPathToAttributesForCell, "setObject:forKey:", v33, v31);
LABEL_24:

LABEL_27:
LABEL_29:
        id v6 = v33;

        goto LABEL_30;
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:1]);
      if (v7 == [v36 integerValue])
      {

        if ((v23 & 1) == 0)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:1]);
          v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  (int)[v37 intValue],  0));

          v32 = (void *)objc_claimAutoreleasedReturnValue( +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___UICollectionViewLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v31));
          v33 = v32;
          v34 = v25 + 666.0 + 50.0;
          goto LABEL_23;
        }

        v38 = 0;
      }

      else
      {

        v38 = (v23 & 1) == 0LL;
      }

      if (v38) {
        v39 = 2LL;
      }
      else {
        v39 = 1LL;
      }
      if (v39 < (uint64_t)v23)
      {
        v48 = self;
        v33 = 0LL;
        v40 = 0;
        v41 = 716.0;
        if (v38) {
          v41 = 1432.0;
        }
        v42 = v41 + v25;
        while (1)
        {
          v43 = v33;
          v31 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v39]);
          v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  (int)[v31 intValue],  0));
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___UICollectionViewLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v44));

          objc_msgSend(v33, "setFrame:", v42, v27, 308.0, 308.0);
          if ((v40 & 1) != 0)
          {
            v42 = v42 + 358.0;
            [v49 batchFrame];
            v27 = v45;
          }

          else
          {
            v27 = v27 + 358.0;
          }

          v40 ^= 1u;

          if (v23 == (id)++v39)
          {
            uint64_t v4 = v46;
            v21 = v49;
            goto LABEL_27;
          }
        }

        -[NSMutableDictionary setObject:forKey:](v48->_indexPathToAttributesForCell, "setObject:forKey:", v33, v44);

        uint64_t v4 = v46;
        v21 = v49;
        goto LABEL_24;
      }
    }

    else
    {
      v21 = 0LL;
    }

    v33 = 0LL;
    goto LABEL_27;
  }

  id v6 = v5;
LABEL_30:

  return v6;
}

void sub_100006F20(uint64_t a1)
{
  id v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "hidden_init");
  v2 = (void *)qword_100102E60;
  qword_100102E60 = (uint64_t)v1;
}

void sub_100007254(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000072E8;
  v4[3] = &unk_1000C95F0;
  id v3 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v3 presentViewController:v2 animated:1 completion:v4];
}

uint64_t sub_1000072E8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000072FC(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) presentingViewController]);
  if (v2
    && (id v3 = (void *)v2,
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) presentedViewController]),
        unsigned __int8 v5 = [v4 isEqual:*(void *)(a1 + 32)],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) presentingViewController]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100007420;
    v8[3] = &unk_1000C95F0;
    id v9 = *(id *)(a1 + 56);
    [v7 dismissViewControllerAnimated:0 completion:v8];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) presentingViewController]);

    if (v6) {
      [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 48) animated:1 completion:*(void *)(a1 + 64)];
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }
  }

uint64_t sub_100007420(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000742C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_15:
LABEL_16:
}
}
}

    id v9 = &ACAccountStoreDidChangeNotification_ptr;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v39 bounds];
    v41 = v40;

    id v10 = &off_100097000;
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities sharedPhotoStreamCollectionViewWithDataSource:delegate:itemSize:contentInset:frame:]( &OBJC_CLASS___TVPPhotoUtilities,  "sharedPhotoStreamCollectionViewWithDataSource:delegate:itemSize:contentInset:frame:",  self,  self,  308.0,  308.0,  0.0,  90.0,  0.0,  90.0,  0LL,  v29 + 12.0,  v41,  0x4073700000000000LL));
    objc_msgSend( v42,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(TVPSharedPSAlbumDescriptionView, v43),  @"albumGridIdentifier");
    [v42 setTag:1];
    [v3 addSubview:v42];
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController sharedAlbumsCachingManager](self, "sharedAlbumsCachingManager"));
    [v44 setCollectionView:v42];

    id v6 = v29 + 323.0;
  }

  if (-[NSArray count](self->_subscribedAlbums, "count"))
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v46 = v9;
    v47 = (void *)objc_claimAutoreleasedReturnValue( [v45 localizedStringForKey:@"sharedByFamily" value:&stru_1000CC6C8 table:0]);
    v48 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities vibrantLabelWithText:]( &OBJC_CLASS___TVPPhotoUtilities,  "vibrantLabelWithText:",  v47));
    subscribedAlbumHeaderView = self->_subscribedAlbumHeaderView;
    self->_subscribedAlbumHeaderView = v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v51 = (void *)objc_claimAutoreleasedReturnValue( [v50 localizedStringForKey:@"sharedByFamily" value:&stru_1000CC6C8 table:0]);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([(id)v46[271] mainScreen]);
    [v53 bounds];
    +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v51,  v52,  v54);
    v56 = v55;
    v58 = v57;

    if (v83 == (id)1)
    {
      v59 = &off_100097000;
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSMainViewController view](self, "view"));
      [v60 frame];
      v62 = v61 + -90.0 - v56;
    }

    else
    {
      v59 = &off_100097000;
      v62 = 90.0;
    }

    if (-[NSArray count](self->_sharedAlbums, "count")) {
      v63 = 83.0;
    }
    else {
      v63 = 54.0;
    }
    -[UIVisualEffectView setFrame:](self->_subscribedAlbumHeaderView, "setFrame:", v62, v6 + v63, v56, v58);
    -[UIVisualEffectView frame](self->_subscribedAlbumHeaderView, "frame");
    v65 = v6 + v64 + v63;
    [v3 addSubview:self->_subscribedAlbumHeaderView];
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_subscribedAlbumHeaderView, "contentView"));
    v67 = (void *)objc_claimAutoreleasedReturnValue([v66 subviews]);

    v68 = [v67 countByEnumeratingWithState:&v84 objects:v92 count:16];
    if (v68)
    {
      v70 = v68;
      v71 = *(void *)v85;
      while (2)
      {
        for (j = 0LL; j != v70; j = (char *)j + 1)
        {
          if (*(void *)v85 != v71) {
            objc_enumerationMutation(v67);
          }
          v73 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)j);
          v74 = objc_opt_class(&OBJC_CLASS___UILabel, v69);
          if ((objc_opt_isKindOfClass(v73, v74) & 1) != 0)
          {
            -[UIVisualEffectView bounds](self->_subscribedAlbumHeaderView, "bounds");
            objc_msgSend(v73, "setFrame:");
            goto LABEL_33;
          }
        }

        v70 = [v67 countByEnumeratingWithState:&v84 objects:v92 count:16];
        if (v70) {
          continue;
        }
        break;
      }
    }

  [v6 setButtons:v23];

  return v6;
}

void sub_10000767C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewControllers]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastObject]);
  uint64_t v4 = *(void **)(a1 + 40);

  unsigned __int8 v5 = *(void **)(a1 + 32);
  if (v3 == v4)
  {
    [v5 popViewControllerAnimated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 viewControllers]);
    id v8 = [v6 mutableCopy];

    [v8 removeObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setViewControllers:v8];
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }

uint64_t sub_10000773C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007888(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    dispatch_async(&_dispatch_main_q, *(dispatch_block_t *)(a1 + 40));
  }
  [*(id *)(a1 + 32) reset];
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 postNotificationName:@"TVPModalPresenterDismissedNotification" object:0];
}

uint64_t sub_1000078F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000951C(uint64_t a1)
{
  id v2 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [*(id *)(a1 + 32) count]);
  uint64_t v61 = 0LL;
  v62 = &v61;
  uint64_t v63 = 0x2020000000LL;
  uint64_t v64 = 0LL;
  uint64_t v51 = a1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:TVPhotoServiceOptionsMaxSizeInMBKey]);
  id v4 = [v3 integerValue];

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v5 = a1;
  unint64_t v6 = 0LL;
  unint64_t v7 = (void)v4 << 20;
  while (v6 < (unint64_t)[*(id *)(v5 + 32) count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6));
    [v50 addObject:v8];

    ++v6;
    uint64_t v5 = a1;
  }

  objc_msgSend(v50, "tvs_shuffle");
  char v9 = 0;
  do
  {
    unint64_t v10 = *(void *)(*(void *)(*(void *)(v5 + 64) + 8LL) + 24LL);
    char v49 = v9;
    uint64_t v11 = *(void *)(*(void *)(*(void *)(v5 + 64) + 8LL) + 24LL);
    v12 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 15LL);
    while (1)
    {
      id v13 = [*(id *)(v5 + 32) count];
      uint64_t v14 = *(void *)(*(void *)(v5 + 64) + 8LL);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:v11]);
      id v16 = [v15 integerValue];

      v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v51 + 32) objectAtIndex:v16]);
      -[NSMutableArray addObject:](v12, "addObject:", v17);

      ++v11;
      uint64_t v5 = v51;
    }

    *(void *)(v14 + 24) = v11;
    unint64_t v18 = *(void *)(*(void *)(*(void *)(v5 + 64) + 8LL) + 24LL);
    id v19 = [*(id *)(v5 + 32) count];
    v21 = (void *)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, v20);
    [v21 setNetworkAccessAllowed:1];
    [v21 setDeliveryMode:1];
    [v21 setLoadingMode:0x10000];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v23 bounds];
    double v25 = v24;
    double v27 = v26;
    id v28 = [v23 scale];
    double v30 = PXSizeScale(v28, v25, v27, v29);
    double v32 = v31;
    v46 = v23;
    unint64_t v47 = (unint64_t)v19;
    unint64_t v48 = v18;
    v33 = dispatch_group_create();
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    v34 = v12;
    id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v57,  v65,  16LL);
    if (v35)
    {
      uint64_t v36 = *(void *)v58;
      do
      {
        for (i = 0LL; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v58 != v36) {
            objc_enumerationMutation(v34);
          }
          uint64_t v38 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)i);
          dispatch_group_enter(v33);
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472LL;
          v52[2] = sub_100009A34;
          v52[3] = &unk_1000C9A78;
          v55 = &v61;
          unint64_t v56 = v7;
          v52[4] = v38;
          v53 = v2;
          v54 = v33;
          objc_msgSend( v22,  "requestImageForAsset:targetSize:contentMode:options:resultHandler:",  v38,  0,  v21,  v52,  v30,  v32);
        }

        id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v57,  v65,  16LL);
      }

      while (v35);
    }

    dispatch_time_t v39 = dispatch_time(0LL, 240000000000LL);
    dispatch_group_wait(v33, v39);
    if ((v49 & 1) != 0)
    {
      v40 = *(void **)(v51 + 48);
      unint64_t v42 = v47;
      unint64_t v41 = v48;
      id v43 = -[NSMutableArray copy](v2, "copy");
      [v40 updateCacheWithPhotoAssets:v43];
    }

    else
    {
      uint64_t v44 = *(void *)(v51 + 56);
      unint64_t v42 = v47;
      unint64_t v41 = v48;
      id v43 = -[NSMutableArray copy](v2, "copy");
      (*(void (**)(uint64_t, id, void))(v44 + 16))(v44, v43, 0LL);
    }

    if (v41 >= v42) {
      int v45 = 6;
    }
    else {
      int v45 = v62[3] <= v7 ? 0 : 6;
    }

    char v9 = 1;
    uint64_t v5 = v51;
  }

  while (!v45);
  [*(id *)(v5 + 48) didFinishFetchingPhotoAssets];

  _Block_object_dispose(&v61, 8);
}

void sub_1000099D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void sub_100009A34(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:PHImageFileURLKey]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesOfItemAtPath:v5 error:0]);

  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  id v8 = (char *)[v6 fileSize];
  unint64_t v10 = *(void *)(a1 + 64);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = &v8[v7];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) <= v10)
  {
    uint64_t v11 = (void *)objc_opt_new(&OBJC_CLASS___TVMutablePhotoAsset, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localIdentifier]);
    [v11 setAssetIdentifier:v12];

    [v11 setFullResolutionURL:v13];
    [*(id *)(a1 + 40) addObject:v11];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

id sub_10000AB38(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_10000ABD0(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_10000AC60(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) setContentMode:7];
}

void sub_10000B608( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000B624(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained layer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sublayers]);
  [v5 makeObjectsPerformSelector:"removeFromSuperlayer"];

  while (1)
  {
    id v6 = objc_loadWeakRetained(v2);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 layer]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sublayers]);
    id v9 = [v8 count];
    id v10 = objc_loadWeakRetained(v2);
    id v11 = [v10 _maximumImageCount];

    if (v9 >= v11) {
      break;
    }
    id v12 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) popNextImage]);
    id v13 = [v12 image];
    if (!v13)
    {

      break;
    }

    id v14 = v13;
    id v15 = objc_loadWeakRetained(v2);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 layer]);
    id v17 = objc_loadWeakRetained(v2);
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _createLayerForImage:v14]);
    [v16 addSublayer:v18];
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v19 postNotificationName:off_100101600 object:*(void *)(a1 + 32)];

  id v20 = objc_loadWeakRetained(v2);
  [v20 _updateAnimations];
}

NSValue *sub_10000C158(uint64_t a1, void *a2)
{
  return +[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:");
}

BOOL sub_10000C44C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a2 animationForKey:@"ParadeAnimation"]);
  uint64_t v7 = *(void **)(a1 + 32);
  if (v6 == v7) {
    *a4 = 1;
  }
  BOOL v8 = v6 == v7;

  return v8;
}

void sub_10000C724(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___TVPSharedAlbumsActivityFeedCache);
  id v2 = (void *)qword_100102E80;
  qword_100102E80 = (uint64_t)v1;
}

void sub_10000CB14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_10000CB48(uint64_t a1)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[TVPSharedPSUtilities photoStreamBatchesForPhotos:]( &OBJC_CLASS___TVPSharedPSUtilities,  "photoStreamBatchesForPhotos:",  *(void *)(a1 + 32)));
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedPSUtilities sortedPhotosFromPhotoBatches:]( &OBJC_CLASS___TVPSharedPSUtilities,  "sortedPhotosFromPhotoBatches:",  v7));
  [*(id *)(a1 + 40) setSortedMostRecentlyModifiedAssets:v2];
  [*(id *)(a1 + 40) setActivityPhotoBatches:v7];
  id v3 = *(void **)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"ActivityTitleHeader" value:&stru_1000CC6C8 table:0]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection transientAssetCollectionWithAssets:title:]( &OBJC_CLASS___PHAssetCollection,  "transientAssetCollectionWithAssets:title:",  v2,  v5));
  [v3 setActivityFeedCollection:v6];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
}

uint64_t sub_10000CC48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10000DAA4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 traitCollection]);
  id v4 = sub_10000DB0C(a1, (uint64_t)[v3 userInterfaceStyle]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

id sub_10000DB0C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a2 == 2 || a2 == 1000;
  switch(a1)
  {
    case 0LL:
      if (a2 == 1000 || a2 == 2)
      {
        if (qword_100102E98 != -1) {
          dispatch_once(&qword_100102E98, &stru_1000C9BC8);
        }
        uint64_t v5 = (void *)qword_100102E90;
      }

      else
      {
        if (qword_100102EA8 != -1) {
          dispatch_once(&qword_100102EA8, &stru_1000C9BE8);
        }
        uint64_t v5 = (void *)qword_100102EA0;
      }

      id v6 = v5;
      return v6;
    case 1LL:
      id v7 = @"PreloadAsset-GenericPoster";
      BOOL v8 = @"PreloadAsset-Dark-GenericPoster";
      goto LABEL_28;
    case 2LL:
      id v7 = @"PreloadAsset-GenericSquare";
      BOOL v8 = @"PreloadAsset-Dark-GenericSquare";
      goto LABEL_28;
    case 3LL:
      id v7 = @"PreloadAsset-GenericTopShelfBanner";
      BOOL v8 = @"PreloadAsset-Dark-GenericTopShelfBanner";
      goto LABEL_28;
    case 4LL:
      id v7 = @"PreloadAsset-GenericFlowcase";
      BOOL v8 = @"PreloadAsset-Dark-GenericFlowcase";
      goto LABEL_28;
    case 5LL:
      id v7 = @"PreloadAsset-Generic16x9";
      BOOL v8 = @"PreloadAsset-Dark-Generic16x9";
      goto LABEL_28;
    case 6LL:
      id v7 = @"PreloadAsset-Movie";
      BOOL v8 = @"PreloadAsset-Dark-Movie";
      goto LABEL_28;
    case 7LL:
      id v7 = @"PreloadAsset-TV";
      BOOL v8 = @"PreloadAsset-Dark-TV";
      goto LABEL_28;
    case 8LL:
      id v7 = @"PreloadAsset-Music";
      BOOL v8 = @"PreloadAsset-Dark-Music";
      goto LABEL_28;
    case 9LL:
      id v7 = @"PreloadAsset-Podcast";
      BOOL v8 = @"PreloadAsset-Dark-Podcast";
      goto LABEL_28;
    case 10LL:
      id v7 = @"iCloud-Light";
      BOOL v8 = @"iCloud-Dark";
      goto LABEL_28;
    case 11LL:
      id v7 = @"PreloadAsset-Photo";
      BOOL v8 = @"PreloadAsset-Dark-Photos";
      goto LABEL_28;
    case 12LL:
      id v7 = @"PreloadAsset-Photo-Poster";
      BOOL v8 = @"PreloadAsset-Dark-Photos-Poster";
      goto LABEL_28;
    case 13LL:
      id v7 = @"PreloadAsset-Photo-16x9";
      BOOL v8 = @"PreloadAsset-Dark-Photos-16x9";
      goto LABEL_28;
    case 14LL:
      id v7 = @"PreloadAsset-Monogram";
      BOOL v8 = @"PreloadAsset-Dark-Monogram";
LABEL_28:
      if (v4) {
        id v9 = (__CFString *)v8;
      }
      else {
        id v9 = (__CFString *)v7;
      }
      id v10 = v9;
      if (qword_100102EB8 != -1) {
        dispatch_once(&qword_100102EB8, &stru_1000C9C08);
      }
      id v6 = (id)objc_claimAutoreleasedReturnValue([(id)qword_100102EB0 objectForKey:v10]);
      if (!v6)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVKit"));
        id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](&OBJC_CLASS___UIImage, "imageNamed:inBundle:", v10, v11));

        if (v6)
        {
          [(id)qword_100102EB0 setObject:v6 forKey:v10];
        }

        else
        {
          if (_TVSLogInternalLogLevel >= 5)
          {
            uint64_t v12 = TVSSystemLog;
            pthread_main_np();
            pthread_self();
            _TVSLogBase(v2, &_os_log_default, 1LL, 0LL, 5LL, v12);
          }

          id v6 = 0LL;
        }
      }

      break;
    default:
      id v6 = 0LL;
      break;
  }

  return v6;
}

void sub_10000DE84(id a1)
{
  v5.width = 1.0;
  v5.height = 1.0;
  UIGraphicsBeginImageContext(v5);
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.11372549,  0.11372549,  0.11372549,  1.0));
  [v1 setFill];

  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  v6.size.height = 1.0;
  UIRectFillUsingBlendMode(v6, kCGBlendModeCopy);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v3 = objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  BOOL v4 = (void *)qword_100102E90;
  qword_100102E90 = v3;

  UIGraphicsEndImageContext();
}

void sub_10000DF08(id a1)
{
  v5.width = 1.0;
  v5.height = 1.0;
  UIGraphicsBeginImageContext(v5);
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.921568627,  0.921568627,  0.921568627,  1.0));
  [v1 setFill];

  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  v6.size.height = 1.0;
  UIRectFillUsingBlendMode(v6, kCGBlendModeCopy);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v3 = objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  BOOL v4 = (void *)qword_100102EA0;
  qword_100102EA0 = v3;

  UIGraphicsEndImageContext();
}

void sub_10000DF8C(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSCache);
  uint64_t v2 = (void *)qword_100102EB0;
  qword_100102EB0 = (uint64_t)v1;

  [(id)qword_100102EB0 setCountLimit:15];
}

uint64_t sub_10000E424(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_10000EAD4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1) {
    return (*(uint64_t (**)(uint64_t, id))(v1 + 16))(v1, [*(id *)(result + 32) newImage]);
  }
  return result;
}

void sub_10000EC3C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.TVPhotos.TVPImageRepresentation", 0LL);
  uint64_t v2 = (void *)qword_100102EC0;
  qword_100102EC0 = (uint64_t)v1;

  uint64_t v3 = (dispatch_object_s *)qword_100102EC0;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  CGSize v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_set_target_queue(v3, v5);
}

void sub_10000F218( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

uint64_t sub_10000F238(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1) {
    return (*(uint64_t (**)(uint64_t, id))(v1 + 16))( v1,  [*(id *)(result + 32) _imageForOriginalImage:*(void *)(*(void *)(result + 32) + 88)]);
  }
  return result;
}

void sub_10000F284(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [v6 setEnableCache:1];
    CGImageRef v4 = (CGImageRef)v6;
    if (v6) {
      CGImageRef v4 = CGImageRetain((CGImageRef)[v6 image]);
    }
    WeakRetained[11] = v4;
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))( v5, objc_msgSend(WeakRetained, "_imageForOriginalImage:", objc_msgSend(v6, "image")));
    }
  }
}

void sub_10000F438( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000F450(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEnableCache:1];
  id v4 = v3;
  uint64_t v5 = (CGImage *)[v4 image];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = CGImageRetain(v5);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_14:
    unint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotosUIViewController view](self, "view"));
    [v48 addSubview:v21];
  }

LABEL_15:
}

    -[TVPhotosTopShelfViewServiceViewController _dismissWithResult:](self, "_dismissWithResult:", 0LL);
    goto LABEL_15;
  }

  if (!v16)
  {
    v33 = PLUIGetLog(v18);
    double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_time_t v39 = v11;
      double v30 = "[TVPhotosTopShelfViewService] did receive nil assetCollection for memory with identifier: %@";
      double v31 = v29;
      double v32 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  id v19 = [[PXStoryConfiguration alloc] initWithAssetCollection:v16];
  [v19 setLaunchType:PXStoryLaunchTypeTVTopShelf];
  objc_msgSend(v19, "setOptions:", (unint64_t)objc_msgSend(v19, "options") | 0x100);
  uint64_t v36 = 0LL;
  id v20 = (UIViewController *)objc_claimAutoreleasedReturnValue( +[PXStoryUIFactory viewControllerWithConfiguration:contentViewController:]( &OBJC_CLASS___PXStoryUIFactory,  "viewControllerWithConfiguration:contentViewController:",  v19,  &v36));
  v21 = v36;
  movieViewController = self->_movieViewController;
  self->_movieViewController = v20;
  v23 = v21;

  [v23 setRemainsActiveWhileApplicationIsHidden:1];
  [v23 setDismissalDelegate:self];
  -[TVPhotosTopShelfViewServiceViewController addChildViewController:]( self,  "addChildViewController:",  self->_movieViewController);
  double v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_movieViewController, "view"));
  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfViewServiceViewController view](self, "view"));
  [v25 bounds];
  objc_msgSend(v24, "setFrame:");

  double v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_movieViewController, "view"));
  [v26 setAutoresizingMask:18];

  -[UIView setAlpha:](self->_colorOverlayView, "setAlpha:", 0.0);
  double v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfViewServiceViewController view](self, "view"));
  [v27 addSubview:self->_colorOverlayView];

  v34[4] = self;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000659D0;
  v35[3] = &unk_1000C9528;
  v35[4] = self;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000659E8;
  v34[3] = &unk_1000C9680;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v35,  v34,  0.5);
  -[TVPhotosTopShelfViewServiceViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");

LABEL_15:
}
}
}

void sub_100010D40(_Unwind_Exception *a1)
{
}

void sub_100010D6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010DF4;
  v7[3] = &unk_1000C9CC8;
  void v7[4] = WeakRetained;
  id v8 = v3;
  id v5 = v3;
  TVSPerformBlockOnMainThread(v7, v6);
}

id sub_100010DF4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    return [v2 _displaySignInLandingView];
  }
  [v2 setDidPerformLoginAction:1];
  return [*(id *)(a1 + 32) updateAuthenticationStatus];
}

void sub_100010E3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkPhotoSettingsAndUpdateUI];
}

void sub_1000110FC(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance"));
  uint64_t v2 = 0LL;
  byte_100102ED0 = [v1 isEnrolled:&v2];
}

void sub_100011AE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100011B10(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.TVPhotos"));
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100011C48;
  v9[3] = &unk_1000C9D60;
  objc_copyWeak(&v10, v3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100011CB0;
  v6[3] = &unk_1000C9D88;
  id v5 = v2;
  id v7 = v5;
  objc_copyWeak(&v8, v3);
  [WeakRetained _enableAuthenticateSettingsWithAuthenticationType:0 block:v9 completion:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v10);
}

void sub_100011C2C(_Unwind_Exception *a1)
{
}

id sub_100011C48(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained accountManager]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);
  id v6 = objc_msgSend(v5, "tvp_setCPLEnabled:error:", 1, a2);

  return v6;
}

void sub_100011CB0(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) setBool:0 forKey:@"__showICPLOptInOfferPreferencesKey"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _checkPhotoSettingsAndUpdateUI];
}

void sub_100011D04(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.TVPhotos"));
  [v3 setBool:0 forKey:@"__showICPLOptInOfferPreferencesKey"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkPhotoSettingsAndUpdateUI];
}

void sub_10001215C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10001217C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDidPerformLoginAction:0];
  [WeakRetained _checkPhotoSettingsAndUpdateUI];
}

LABEL_9:
}

void sub_1000126D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id location, char a24)
{
}

uint64_t sub_10001271C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001272C(uint64_t a1)
{
}

void sub_100012734(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001284C;
  v8[3] = &unk_1000C9DB0;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v5 = v3;
  id v9 = v5;
  __int128 v10 = *(_OWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000128F0;
  v6[3] = &unk_1000C97F0;
  id v7 = *(id *)(a1 + 32);
  [WeakRetained _enableAuthenticateSettingsWithAuthenticationType:0 block:v8 completion:v6];

  objc_destroyWeak(&v11);
}

void sub_100012838(_Unwind_Exception *a1)
{
}

id sub_10001284C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained accountManager]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeAccount]);

  unsigned int v7 = objc_msgSend(v6, "tvp_setSharedAlbumsEnabled:error:", 1, a2);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v8 == v9) {
    id v10 = 0LL;
  }
  else {
    id v10 = (id)v7;
  }
  if (v8 == v9 && v7 != 0) {
    id v10 = objc_msgSend(v6, "tvp_setCPLEnabled:error:", 1, a2);
  }

  return v10;
}

uint64_t sub_1000128F0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100012904(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkPhotoSettingsAndUpdateUI];
}

uint64_t sub_100012C20(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100012C34(uint64_t a1)
{
  id v2 = 0LL;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100012C98(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationTVContext);
  [v2 setServiceType:1];
  [v2 setShouldAllowAppleIDCreation:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) username]);
  [v2 setUsername:v3];

  [v2 setIsUsernameEditable:0];
  [v2 setPresentingViewController:*(void *)(a1 + 40)];
  [v2 setAuthenticationType:2];
  [v2 setIsEphemeral:1];
  id v4 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100012DB4;
  _OWORD v5[3] = &unk_1000C9E78;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v4 authenticateWithContext:v2 completion:v5];
}

void sub_100012DB4(uint64_t a1, uint64_t a2, void *a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012E5C;
  block[3] = &unk_1000C9E50;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t sub_100012E5C(void *a1)
{
  if (a1[4])
  {
    if (_TVSLogInternalLogLevel >= 3)
    {
      uint64_t v3 = TVSSystemLog;
      pthread_main_np();
      pthread_self();
      _TVSLogBase( v1,  &_os_log_default,  65LL,  0LL,  3LL,  v3,  @"#T:[%@%p] #Error #%@ : User authentication failed: %@ ");
    }

    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }

  else
  {
    if (_TVSLogInternalLogLevel >= 3)
    {
      uint64_t v5 = TVSSystemLog;
      pthread_main_np();
      pthread_self();
      _TVSLogBase( v1,  &_os_log_default,  65LL,  0LL,  3LL,  v5,  @"#T:[%@%p] #Error #%@ : User authentication succeeded ");
    }

    return (*(uint64_t (**)(void))(a1[6] + 16LL))();
  }

void sub_100012F90(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012FF8;
  block[3] = &unk_1000C95F0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t sub_100012FF8(uint64_t a1)
{
  if (_TVSLogInternalLogLevel >= 3)
  {
    uint64_t v3 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    _TVSLogBase( v1,  &_os_log_default,  65LL,  0LL,  3LL,  v3,  @"#T:[%@%p] #Error #%@ : User authentication succeeded ");
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000130A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v4 isEqualToString:CPSErrorDomain] || objc_msgSend(v3, "code") != (id)104)
  {

    goto LABEL_6;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:CPSCancellationReasonErrorKey]);
  unsigned int v7 = [v6 isEqual:&off_1000D1488];

  if (!v7)
  {
LABEL_6:
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000131CC;
    v8[3] = &unk_1000C9EF0;
    id v9 = v3;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(&_dispatch_main_q, v8);

    goto LABEL_7;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_7:
}

uint64_t sub_1000131CC(uint64_t a1)
{
  if (_TVSLogInternalLogLevel >= 3)
  {
    uint64_t v3 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    _TVSLogBase( v1,  &_os_log_default,  65LL,  0LL,  3LL,  v3,  @"#T:[%@%p] #Error #%@ : User authentication failed: %@ ");
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10001327C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) iCloudWelcomeViewController]);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v2 view]);
  [v1 setAlpha:0.0];
}

void sub_1000133BC(_Unwind_Exception *a1)
{
}

id sub_1000133E0(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained _handleTurnOniCloud:*(void *)(a1 + 40) == 0 withError:a2];

  return v5;
}

void sub_100013434(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkPhotoSettingsAndUpdateUI];
}

void sub_1000140D0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  id v2 = (void *)qword_100102EE0;
  qword_100102EE0 = (uint64_t)v1;

  [(id)qword_100102EE0 setFormatterBehavior:1040];
  [(id)qword_100102EE0 setTimeStyle:1];
  uint64_t v3 = (void *)qword_100102EE0;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  [v3 setTimeZone:v4];
}

void sub_1000141C0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  id v2 = (void *)qword_100102EF0;
  qword_100102EF0 = (uint64_t)v1;

  [(id)qword_100102EF0 setFormatterBehavior:1040];
  [(id)qword_100102EF0 setDateStyle:2];
  [(id)qword_100102EF0 setTimeStyle:1];
  uint64_t v3 = (void *)qword_100102EF0;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  [v3 setTimeZone:v4];
}

void sub_1000142BC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  id v2 = (void *)qword_100102F00;
  qword_100102F00 = (uint64_t)v1;

  [(id)qword_100102F00 setFormatterBehavior:1040];
  [(id)qword_100102F00 setDateStyle:2];
  [(id)qword_100102F00 setTimeStyle:0];
  uint64_t v3 = (void *)qword_100102F00;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  [v3 setTimeZone:v4];
}

void sub_10001493C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pl_managedAsset"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 cloudBatchID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v17 cloudBatchPublishDate]);
  if (-[__CFString length](v4, "length"))
  {
    if (v5) {
      goto LABEL_3;
    }
    goto LABEL_14;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v17 dateCreated]);
  [v12 timeIntervalSinceDate:v13];
  id v15 = @"ATVDataPropertyLegacyPhotoStreamEarlierBatchID";
  if (v14 < 1209600.0) {
    id v15 = @"ATVDataPropertyLegacyPhotoStreamLastWeekBatchID";
  }
  if (v14 < 604800.0) {
    id v15 = @"ATVDataPropertyLegacyPhotoStreamThisWeekBatchID";
  }
  id v16 = v15;

  id v4 = v16;
  if (!v5) {
LABEL_14:
  }
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v17 dateCreated]);
LABEL_3:
  else {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v17 cloudOwnerFullName]);
  }
  unsigned int v7 = (TVPPhotoStreamBatch *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v4]);
  if (!v7)
  {
    unsigned int v7 = objc_alloc_init(&OBJC_CLASS___TVPPhotoStreamBatch);
    -[TVPPhotoStreamBatch setID:](v7, "setID:", v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    -[TVPPhotoStreamBatch setModifiedDate:](v7, "setModifiedDate:", v8);

    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[TVPPhotoStreamBatch setPhotosInfo:](v7, "setPhotosInfo:", v9);

    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[TVPPhotoStreamBatch setPhotoIndices:](v7, "setPhotoIndices:", v10);

    -[TVPPhotoStreamBatch setBatchCreatorName:](v7, "setBatchCreatorName:", v6);
    [*(id *)(a1 + 32) setObject:v7 forKey:v4];
    [*(id *)(a1 + 40) addObject:v7];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoStreamBatch photosInfo](v7, "photosInfo"));
  [v11 addObject:v3];

  -[TVPPhotoStreamBatch setModifiedDate:](v7, "setModifiedDate:", v5);
}

int64_t sub_100014B6C(id a1, TVPPhotoStreamBatch *a2, TVPPhotoStreamBatch *a3)
{
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoStreamBatch modifiedDate](a3, "modifiedDate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoStreamBatch modifiedDate](v4, "modifiedDate"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id sub_1000168B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

LABEL_13:
  -[UITableView reloadData](self->_slideshowSettingsView, "reloadData");
}

LABEL_14:
}

LABEL_14:
}

LABEL_14:
}
  }
  }

LABEL_26:
  }
    }

    id v13 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v13) {
      continue;
    }
    break;
  }

LABEL_27:
  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v9, "textLabel"));
  [v25 setText:v13];

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](v9, "detailTextLabel"));
  [v26 setText:v12];

  -[UITableViewCell setAccessoryType:](v9, "setAccessoryType:", v16);
  return v9;
}

id sub_100017B44(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) setNeedsFocusUpdate];
  if (*(_BYTE *)(a1 + 40)) {
    return [*(id *)(*(void *)(a1 + 32) + 64) reloadData];
  }
  return result;
}

id sub_100017B8C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) setScrollsToTop:1];
}

void sub_100018DA0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100018DBC(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ((unint64_t)[WeakRetained[4] count] <= 9)
    {
      do
      {
        id v4 = (void *)objc_claimAutoreleasedReturnValue([v3[5] popNextImage]);
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uiImage]);

        if (!v5) {
          break;
        }
        [v3 _addImageToAnimationContainer:v5];
      }

      while ((unint64_t)[v3[4] count] < 0xA);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "tvs_randomizedArray"));
    id v7 = [v6 mutableCopy];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v7;

    v3[2] = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v10 bounds];
    double Width = CGRectGetWidth(v29);

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v12 = [v3[4] copy];
    id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v25;
      double v16 = 0.0;
LABEL_7:
      uint64_t v17 = 0LL;
      while (1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * v17) image]);
        [v3 _addImageToAnimationContainer:v18];
        [v18 size];
        double v16 = v16 + v19;
        v3[2] = (char *)v3[2] + 1;

        if (v16 >= Width) {
          break;
        }
        if (v14 == (id)++v17)
        {
          id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v14) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v20 postNotificationName:@"TVPScrollingParadeViewWillDisplayNotification" object:v3];

    v21 = *(dispatch_group_s **)(*(void *)(a1 + 32) + 24LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100019058;
    block[3] = &unk_1000C9528;
    v23 = v3;
    dispatch_group_notify(v21, &_dispatch_main_q, block);
  }
}

id sub_100019058(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAnimations];
}

void sub_1000198CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[8])
  {
    WeakRetained[8] = 0;
    id v2 = WeakRetained;
    [WeakRetained _startAnimations];
    id WeakRetained = v2;
  }
}

LABEL_5:
    -[UILabel setHidden:](self->_activityTextLabel, "setHidden:", 0LL);
    return;
  }

  if (self->_activityIndicatorHidden) {
    goto LABEL_5;
  }
}

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10002F784;
  v25[3] = &unk_1000CA798;
  __int128 v26 = v5;
  __int128 v27 = a2;
  v25[4] = self;
  id v14 = v5;
  -[TVPMemoriesTabCollectionViewController _playMemoryWithInfo:willPresentHandler:]( self,  "_playMemoryWithInfo:willPresentHandler:",  v12,  v25);
}

    double v16 = @"oneup";
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    id v6 = self->_allowedModes;
    self->_allowedModes = v5;

    goto LABEL_6;
  }

  id v4 = &OBJC_CLASS___TVPSharedPSOneupView;
LABEL_7:
  id v7 = objc_alloc(v4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v8 bounds];
  id v9 = (TVPOneupView *)objc_msgSend(v7, "initWithFrame:");
  oneUpView = self->_oneUpView;
  self->_oneUpView = v9;

  -[TVPOneupView setDataSource:](self->_oneUpView, "setDataSource:", self);
  -[TVPOneupView setDelegate:](self->_oneUpView, "setDelegate:", self);
  -[TVPOneupView registerItemViewClass:]( self->_oneUpView,  "registerItemViewClass:",  objc_opt_class(&OBJC_CLASS___TVPPhotoView, v11));
  -[TVPOneupView registerSupplementaryViewClass:]( self->_oneUpView,  "registerSupplementaryViewClass:",  objc_opt_class(&OBJC_CLASS___UILabel, v12));
  -[TVPOneupView setCurrentMode:](self->_oneUpView, "setCurrentMode:", 1LL);
  -[TVPOneupView setAllowedModes:]( self->_oneUpView,  "setAllowedModes:",  -[TVPSharedPSOneUpViewController _allowedModesFromModes:](self, "_allowedModesFromModes:", self->_allowedModes));
  -[TVPOneupView setTransition:](self->_oneUpView, "setTransition:", 3LL);
  -[TVPOneupView setContentMode:](self->_oneUpView, "setContentMode:", 1LL);
  id v13 = self->_oneUpView;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[TVPOneupView setBackgroundColor:](v13, "setBackgroundColor:", v14);

  -[TVPOneupView setAdjustedFocusIndex:]( self->_oneUpView,  "setAdjustedFocusIndex:",  -[TVPPhotoLibraryOneUpViewController selectedAssetIndex](self, "selectedAssetIndex"));
  -[TVPSharedPSOneUpViewController setView:](self, "setView:", self->_oneUpView);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController cachingManager](self, "cachingManager"));
  [v15 setOneupView:self->_oneUpView];
}

void sub_100019EA8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 16) = 1;
    id v2 = (id *)WeakRetained;
    [*((id *)WeakRetained + 1) setHidden:0];
    [v2[4] startAnimating];
    id WeakRetained = v2;
  }
}

void sub_10001AD8C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001AE84;
  v15[3] = &unk_1000CA0D0;
  id v16 = v8;
  id v17 = v7;
  id v11 = *(void **)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v18 = v9;
  double v19 = v11;
  id v20 = v10;
  id v21 = *(id *)(a1 + 48);
  id v12 = v9;
  id v13 = v7;
  id v14 = v8;
  [v11 _queueOperation:v15];
}

void sub_10001AE84(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) firstObject]);
  if (!*(void *)(a1 + 40))
  {
    id v2 = objc_alloc_init(&OBJC_CLASS___TVPMediaURLCacheRecord);
    -[TVPMediaURLCacheRecord setUrl:](v2, "setUrl:", v4);
    -[TVPMediaURLCacheRecord setExpiration:](v2, "setExpiration:", *(void *)(a1 + 48));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) mediaURLCache]);
    [v3 setObject:v2 forKey:*(void *)(a1 + 64)];
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
}

void sub_10001B358( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_10001B370(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result = [a2 isViewable];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void sub_10001B54C(_Unwind_Exception *a1)
{
}

id sub_10001B564(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result = [a2 isViewable];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void sub_10001B5A4(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "tvs_arrayByMappingObjectsUsingBlock:", &stru_1000CA160));
  [v4 sharedPSAccessObject:v2 albumsDidRemoveForAlbumIDs:v3 byAlsoRemovingViewableAlbums:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

id sub_10001B61C(id a1, MSASAlbum *a2, unint64_t a3)
{
  return -[MSASAlbum GUID](a2, "GUID", a3);
}

void sub_10001B744(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 GUID]);
  [v5 sharedPSAccessObject:v3 albumMetadataDidChangeForAlbum:v2 albumID:v4];
}

void sub_10001BA38(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) GUID]);
  [v4 sharedPSAccessObject:v2 subsribersDidChangeForAlbumID:v3 subscriptionStatusDidChange:*(unsigned __int8 *)(a1 + 48)];
}

void sub_10001BD28(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) GUID]);
  [v4 sharedPSAccessObject:v2 subsribersDidChangeForAlbumID:v3 subscriptionStatusDidChange:*(unsigned __int8 *)(a1 + 48)];
}

void sub_10001BEF0(id *a1)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a1[4] delegate]);
  id v2 = a1[4];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1[5] GUID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[6] personID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1[4] appleAccount]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  objc_msgSend( v7,  "sharedPSAccessObject:subsribersDidChangeForAlbumID:subscriptionStatusDidChange:",  v2,  v3,  objc_msgSend(v4, "isEqualToString:", v6));
}

void sub_10001C0E4(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) GUID]);
  [v4 sharedPSAccessObject:v2 isAlbumUnviewedDidChangeForAlbumID:v3 album:*(void *)(a1 + 40)];
}

void sub_10001C2AC(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) GUID]);
  [v4 sharedPSAccessObject:v2 assetsDidAddForAlbumID:v3 album:*(void *)(a1 + 40) assets:*(void *)(a1 + 48)];
}

void sub_10001C474(id *a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1[4] delegate]);
  id v2 = a1[4];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "tvs_arrayByMappingObjectsUsingBlock:", &stru_1000CA1F0));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[6] GUID]);
  [v5 sharedPSAccessObject:v2 assetsDidRemoveForAssetIDs:v3 albumID:v4];
}

id sub_10001C4F8(id a1, MSASAssetCollection *a2, unint64_t a3)
{
  return -[MSASAssetCollection GUID](a2, "GUID", a3);
}

void sub_10001C680(id *a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1[4] delegate]);
  id v2 = a1[4];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1[5] GUID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[6] GUID]);
  [v5 sharedPSAccessObject:v2 isAssetUnviewedDidChangeForAssetID:v3 albumID:v4];
}

void sub_10001C87C(id *a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1[4] delegate]);
  id v2 = a1[4];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1[5] GUID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[6] GUID]);
  [v5 sharedPSAccessObject:v2 isAssetUnviewedDidChangeForAssetID:v3 albumID:v4];
}

void sub_10001CB14(_Unwind_Exception *a1)
{
}

id sub_10001CB2C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result = [a2 isLike];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void sub_10001CB6C(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) GUID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) GUID]);
  [v5 sharedPSAccessObject:v2 commentsDidChangeForAssetID:v3 albumID:v4 likeStatusDidChange:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
}

void sub_10001CE10(_Unwind_Exception *a1)
{
}

id sub_10001CE28(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result = [a2 isLike];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void sub_10001CE68(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) GUID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) GUID]);
  [v5 sharedPSAccessObject:v2 commentsDidChangeForAssetID:v3 albumID:v4 likeStatusDidChange:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
}

void sub_10001D090(id *a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1[4] delegate]);
  id v2 = a1[4];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1[5] GUID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[6] GUID]);
  objc_msgSend( v5,  "sharedPSAccessObject:commentsDidChangeForAssetID:albumID:likeStatusDidChange:",  v2,  v3,  v4,  objc_msgSend(a1[7], "isLike"));
}

void sub_10001D24C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionHandler]);

  if (v2)
  {
    uint64_t v3 = (void (**)(id, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionHandler]);
    [*(id *)(a1 + 32) setCompletionHandler:0];
    v3[2](v3, *(void *)(a1 + 40));
  }

id sub_10001D548(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishRetrievingAsset:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) imageData:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

void sub_10001D61C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 sharedPSAccessObject:*(void *)(a1 + 32) finishedCheckingForChangesInfo:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void sub_10001D70C(uint64_t a1)
{
  uint64_t v2 = MSASPlatform();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v6 albumSharingDaemon]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appleAccount]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));
  [v3 refreshResetSync:0 personID:v5 info:0];
}

uint64_t sub_10001D9D4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10001DCF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _serverSideModel]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 assetID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 assetCollectionWithGUID:v5]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 albumGUID]);
  unsigned int v8 = [v7 isEqualToString:*(void *)(a1 + 40)];

  if (v8)
  {
    id v9 = *(void **)(a1 + 48);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 asset]);
    [v9 addObject:v10];
  }

  return v8 ^ 1;
}

id sub_10001DE88(uint64_t a1, _BYTE *a2)
{
  if (*a2)
  {
    if (*(void *)(a1 + 32)) {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVImage imageWithData:](&OBJC_CLASS___TVImage, "imageWithData:"));
    }
    else {
      id v3 = 0LL;
    }
    *a2 = 0;
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_10001ECD0(id a1, BOOL a2, NSError *a3)
{
  if (!a2 && _TVSLogInternalLogLevel >= 3)
  {
    uint64_t v4 = TVSSystemLog;
    id v5 = a3;
    pthread_main_np();
    pthread_self();
    _TVSLogBase(v3, &_os_log_default, 65LL, 0LL, 3LL, v4);
  }

void sub_10001ED94(id a1)
{
}

id sub_10001F460(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deactivateApplication];
}

void sub_10001F8EC(id a1, BOOL a2, NSError *a3)
{
  if (!a2 && _TVSLogInternalLogLevel >= 3)
  {
    uint64_t v4 = TVSSystemLog;
    id v5 = a3;
    pthread_main_np();
    pthread_self();
    _TVSLogBase(v3, &_os_log_default, 65LL, 0LL, 3LL, v4);
  }

void sub_10001FA18(id a1, BOOL a2, NSError *a3)
{
  if (!a2 && _TVSLogInternalLogLevel >= 3)
  {
    uint64_t v4 = TVSSystemLog;
    id v5 = a3;
    pthread_main_np();
    pthread_self();
    _TVSLogBase(v3, &_os_log_default, 65LL, 0LL, 3LL, v4);
  }

id sub_1000210D4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[4];
  [v2 focusedMargin];
  [v3 setConstant:-v4];
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)v5[5];
  [v5 focusedMargin];
  [v6 setConstant:-v7];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_100021134(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_10002116C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[6];
  [v2 focusedMargin];
  [v3 setConstant:-v4];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_1000211AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_1000211FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void sub_100022248(uint64_t a1, double a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained oneupView]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 focusedItemView]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:PHImageResultRequestIDKey]);
  unsigned int v12 = [v11 intValue];

  unsigned int v13 = [v10 currentRequestID];
  if (v12) {
    BOOL v14 = v12 == v13;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10002234C;
    v15[3] = &unk_1000C9AC8;
    id v16 = v10;
    double v17 = a2;
    dispatch_async(&_dispatch_main_q, v15);
  }
}

id sub_10002234C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProgress:*(double *)(a1 + 40)];
}

LABEL_19:
  }

  id v35 = x;
  uint64_t v36 = y;
  result.y = v36;
  result.x = v35;
  return result;
}
  }

  if (-[NSArray count](v5->_photoAssets, "count") <= v5->_maxImageBatchPreloadCount
    || (double v32 = -[TVPSlideshowMarimbaViewController _indexOfAssetPathInOrderedAssets:]( v5,  "_indexOfAssetPathInOrderedAssets:",  v55),  v32 == (id)0x7FFFFFFFFFFFFFFFLL)
    || (v33 = v5->_indexOfNextImageToPrefetch, v33 >= -[NSArray count](v5->_photoAssets, "count"))
    || (v34 = v5->_indexOfNextImageToPrefetch, (int64_t)(v34 - (void)v32) > v5->_minImageFetchPreloadGap)
    || v34 >= -[NSArray count](v5->_photoAssets, "count"))
  {
    uint64_t v36 = v8;
  }

  else
  {
    while (1)
    {
      __int128 v58 = 0LL;
      __int128 v59 = &v58;
      __int128 v60 = 0x3032000000LL;
      uint64_t v61 = sub_100031834;
      v62 = sub_100031844;
      uint64_t v63 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v5->_photoAssets, "objectAtIndex:", v5->_indexOfNextImageToPrefetch));
      [(id)v59[5] setPendingRequestID:0];
      ++v5->_indexOfNextImageToPrefetch;
      id v35 = (void *)objc_claimAutoreleasedReturnValue([(id)v59[5] fullResolutionURL]);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 path]);

      _Block_object_dispose(&v58, 8);
      indexOfNextImageToPrefetch = v5->_indexOfNextImageToPrefetch;
      unsigned int v8 = v36;
      if (indexOfNextImageToPrefetch >= -[NSArray count](v5->_photoAssets, "count")) {
        goto LABEL_29;
      }
    }

    dispatch_time_t v39 = (void *)objc_claimAutoreleasedReturnValue([(id)v59[5] photoAsset]);

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([(id)v59[5] photoAsset]);
      if (![(id)v59[5] pendingRequestID])
      {
        unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
        unint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
        [v42 bounds];
        uint64_t v44 = v43;
        v46 = v45;
        unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
        unint64_t v48 = [v47 scale];
        v50 = PXSizeScale(v48, v44, v46, v49);
        v52 = v51;
        v53 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSlideshowMarimbaViewController _defaultImageRequestOptions]( v5,  "_defaultImageRequestOptions"));
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472LL;
        v57[2] = sub_10003184C;
        v57[3] = &unk_1000CA8B0;
        v57[4] = &v58;
        v54 = objc_msgSend( v41,  "requestImageForAsset:targetSize:contentMode:options:resultHandler:",  v40,  0,  v53,  v57,  v50,  v52);
        [(id)v59[5] setPendingRequestID:v54];
      }
    }

    _Block_object_dispose(&v58, 8);
  }

LABEL_11:
}

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController view](self, "view"));
    [v46 addSubview:v19];

    unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController previewAssetManager](self, "previewAssetManager"));
    [v47 clearPreview];

    unint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView"));
    char v49 = (void *)objc_claimAutoreleasedReturnValue([v48 indexPathsForVisibleSupplementaryElementsOfKind:@"sectionHeaderKind"]);

    __int128 v60 = 0u;
    uint64_t v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    v50 = v49;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v51)
    {
      v52 = v51;
      v53 = *(void *)v59;
      do
      {
        for (i = 0LL; i != v52; i = (char *)i + 1)
        {
          if (*(void *)v59 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)i);
          unint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController collectionView](self, "collectionView", (void)v58));
          __int128 v57 = (void *)objc_claimAutoreleasedReturnValue( [v56 supplementaryViewForElementKind:@"sectionHeaderKind" atIndexPath:v55]);

          [v57 setTitleAlpha:0.0];
        }

        v52 = [v50 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }

      while (v52);
    }
  }

  -[TVPMemoriesTabCollectionViewController _updatePreviewGradientViews]( self,  "_updatePreviewGradientViews",  (void)v58);
}

  return v4;
}

  return v5;
}

  return v18;
}
}

    int v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryAlbumsListController view](self, "view"));
    [v45 addSubview:v46];
  }

  objc_msgSend(v5, "reloadCommentsData", (void)v10);
}

id sub_10002775C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSettingsOverride];
}

void sub_10002784C(id a1, UIAlertAction *a2)
{
  uint64_t v2 = a2;
  exit(0);
}

void sub_100028C10(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 152)) {
    uint64_t v2 = 64LL;
  }
  else {
    uint64_t v2 = 80LL;
  }
  double v3 = 20.0;
  if (!*(_BYTE *)(a1 + 152)) {
    double v3 = 15.0;
  }
  double v4 = v3 / *(double *)(a1 + v2) * *(double *)(a1 + 72);
  double v5 = *(double *)(a1 + 88);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100028E50;
  v25[3] = &unk_1000CA4A8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  __int128 v8 = *(_OWORD *)(a1 + 112);
  __int128 v27 = *(_OWORD *)(a1 + 96);
  id v26 = v7;
  __int128 v28 = v8;
  __int128 v29 = *(_OWORD *)(a1 + 128);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100028E8C;
  v23[3] = &unk_1000C9680;
  id v24 = *(id *)(a1 + 40);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  393248LL,  v6,  v25,  v23,  v4,  v5);
  if (*(_BYTE *)(a1 + 152)) {
    uint64_t v9 = 64LL;
  }
  else {
    uint64_t v9 = 80LL;
  }
  double v10 = 15.0 / *(double *)(a1 + v9) * *(double *)(a1 + 72);
  double v11 = *(double *)(a1 + 88);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100028EC8;
  v20[3] = &unk_1000C9AC8;
  uint64_t v12 = *(void *)(a1 + 48);
  id v21 = *(id *)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 144);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  393248LL,  v12,  v20,  0LL,  v10,  v11);
  if (*(_BYTE *)(a1 + 152))
  {
    double v13 = *(double *)(a1 + 64);
    double v14 = *(double *)(a1 + 72) * (15.0 / v13);
    double v15 = *(double *)(a1 + 88) + 5.0 / v13;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100028ED8;
    v17[3] = &unk_1000CA4D0;
    uint64_t v16 = *(void *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    char v19 = *(_BYTE *)(a1 + 152);
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  393248LL,  v16,  v17,  0LL,  v14,  v15);
  }
}

id sub_100028E50(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  __int128 v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

id sub_100028E8C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  __int128 v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v1 setTransform:v4];
}

id sub_100028EC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

void sub_100028ED8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewControllerForKey:UITransitionContextToViewControllerKey]);
}

id sub_100028F38(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "completeTransition:",  objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

void sub_100029330(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 postNotificationName:off_100101C68 object:*(void *)(a1 + 32)];
}

id sub_1000295C0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 40) + 16) setAlpha:0.0];
}

void sub_1000295FC(uint64_t a1)
{
}

void sub_100029AC8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, *(double *)(a1 + 48)));
  [v2 setBackgroundColor:v3];
}

uint64_t sub_100029B28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100029B34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002A114( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id a26)
{
}

id sub_10002A15C(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _layoutSectionForSectionIndex:a2 environment:v5]);

  return v7;
}

void sub_10002A274( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10002A28C(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 snapshot]);
  uint64_t v6 = (uint64_t)[v5 numberOfItems];

  if (v6 >= 1)
  {
    [*(id *)(a1 + 32) _preferredHeaderHeightForSectionAtIndex:a3];
    double v8 = v7;
    [v10 itemSize];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v8
                                                                + v9
  }
}

void sub_10002AE08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10002AE2C(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", a3, a4));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sectionScrollOffsets]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 indexPath]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v11 section]));
  [v9 setObject:v13 forKeyedSubscript:v12];
}

id sub_10002B020(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCollectionView];
}

LABEL_8:
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v10 titleKey]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:v17 value:&stru_1000CC6C8 table:0]);
  [v11 setTitle:v18];

  return v11;
}

  return v12;
}

  double v15 = width;
  uint64_t v16 = height;
  result.height = v16;
  result.width = v15;
  return result;
}
}

LABEL_7:
  id v26 = @"sectionHeaderKind";
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewController sectionScrollOffsets](self, "sectionScrollOffsets"));
  [v10 animateSupplementaryViewsForFocusUpdateInContext:v8 withCoordinator:v9 withKinds:v24 sectionScrollOffsets:v25];
}
}
}
}

void sub_10002C4A8(_Unwind_Exception *a1)
{
}

void sub_10002C500(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) thumbnailActionPerformer]);
  char v3 = *(_BYTE *)(a1 + 48);
  double v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  uint64_t v6 = sub_10002C57C;
  id v7 = &unk_1000CA0A0;
  LOBYTE(v_Block_object_dispose(va, 8) = v3;
  objc_msgSend( v2,  "setFavorite:completionHandler:",  _NSConcreteStackBlock,  3221225472,  sub_10002C57C,  &unk_1000CA0A0,  *(void *)(a1 + 40),  v8);
}

void sub_10002C57C(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v4 = v3;
  if (v2) {
    uint64_t v5 = @"TVPMemoriesBulletinFavoriteAdded";
  }
  else {
    uint64_t v5 = @"TVPMemoriesBulletinFavoriteRemoved";
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v5 value:&stru_1000CC6C8 table:0]);

  if (*(_BYTE *)(a1 + 40)) {
    uint64_t v6 = &PBSSystemBulletinImageIDHeartFavorite;
  }
  else {
    uint64_t v6 = &PBSSystemBulletinImageIDHeartUnfavorite;
  }
  [*(id *)(a1 + 32) _presentBulletinMessage:v7 imageKey:*v6 withCompletion:&stru_1000CA5E0];
}

void sub_10002C62C(id a1, BOOL a2, NSError *a3)
{
  double v4 = a3;
  if (!a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[TVPMemoriesTab] Unable to present bulletin: (error.localizedDescription)",  v5,  2u);
  }
}

void sub_10002C6A0(uint64_t a1, void *a2)
{
  id v16 = a2;
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"TVPMemoriesActionDeleteConfirmationTitle" value:&stru_1000CC6C8 table:0]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"TVPMemoriesActionDeleteConfirmationMessage" value:&stru_1000CC6C8 table:0]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"TVPMemoriesActionDeleteConfirmationChoiceCancel" value:&stru_1000CC6C8 table:0]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002C928;
  v19[3] = &unk_1000C9E00;
  id v10 = (id *)(a1 + 40);
  objc_copyWeak(&v20, (id *)(a1 + 40));
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  1LL,  v19));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"TVPMemoriesActionDeleteConfirmationChoiceDelete" value:&stru_1000CC6C8 table:0]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002C95C;
  v17[3] = &unk_1000CA418;
  id v18 = *(id *)(a1 + 32);
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  2LL,  v17));
  [v7 addAction:v14];

  [v7 addAction:v11];
  [v7 setPreferredAction:v11];
  id WeakRetained = objc_loadWeakRetained(v10);
  [WeakRetained presentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v20);
}

void sub_10002C910(_Unwind_Exception *a1)
{
}

void sub_10002C928(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void sub_10002C95C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) thumbnailActionPerformer]);
  [v1 deleteMemory];
}

void sub_10002C98C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void sub_10002CDDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, char a46, uint64_t a47, uint64_t a48, uint64_t a49, char a50)
{
}

void sub_10002CE30(uint64_t a1, void *a2, uint64_t a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002CEBC;
  v6[3] = &unk_1000CA658;
  id v7 = *(id *)(a1 + 32);
  uint64_t v9 = a3;
  __int128 v8 = *(_OWORD *)(a1 + 40);
  [a2 updateSnapshotWithResolver:v6];
}

void sub_10002CEBC(void *a1, void *a2, void *a3)
{
  id v14 = a2;
  uint64_t v5 = (void *)a1[4];
  id v6 = a3;
  id v7 = -[TVPMemoriesTabSectionUpdateTransaction initWithSectionIndex:changeDetails:completion:]( objc_alloc(&OBJC_CLASS___TVPMemoriesTabSectionUpdateTransaction),  "initWithSectionIndex:changeDetails:completion:",  a1[7],  v14,  v6);

  [v5 addObject:v7];
  uint64_t v8 = *(void *)(a1[5] + 8LL);
  if (*(_BYTE *)(v8 + 24))
  {
    char v9 = 1;
  }

  else
  {
    char v9 = [v14 hasIncrementalChanges] ^ 1;
    uint64_t v8 = *(void *)(a1[5] + 8LL);
  }

  id v10 = v14;
  *(_BYTE *)(v8 + 24) = v9;
  if (!a1[7])
  {
    uint64_t v11 = *(void *)(a1[6] + 8LL);
    if (*(_BYTE *)(v11 + 24))
    {
      *(_BYTE *)(v11 + 24) = 1;
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v14 insertedIndexes]);
      if ([v12 count])
      {
        *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
      }

      else
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 removedIndexes]);
        *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = [v13 count] != 0;
      }

      id v10 = v14;
    }
  }
}

void sub_10002CFEC(uint64_t a1)
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v6 = [v5 sectionIndex];
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 changeDetails]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        char v9 = (void *)objc_claimAutoreleasedReturnValue([v7 insertedIndexes]);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_10002D23C;
        v21[3] = &unk_1000CA6A8;
        id v10 = v8;
        id v22 = v10;
        id v23 = v6;
        [v9 enumerateIndexesUsingBlock:v21];

        [*(id *)(a1 + 40) insertItemsAtIndexPaths:v10];
        [v10 removeAllObjects];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 removedIndexes]);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_10002D28C;
        v18[3] = &unk_1000CA6A8;
        id v19 = v10;
        id v20 = v6;
        id v12 = v10;
        [v11 enumerateIndexesUsingBlock:v18];

        [*(id *)(a1 + 40) deleteItemsAtIndexPaths:v12];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_10002D2DC;
        v15[3] = &unk_1000CA6D0;
        id v16 = *(id *)(a1 + 40);
        id v17 = v6;
        [v7 enumerateMovedIndexesUsingBlock:v15];
        [v5 commit];
      }

      id v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v3);
  }
}

void sub_10002D23C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  a2,  *(void *)(a1 + 40)));
  [v2 addObject:v3];
}

void sub_10002D28C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  a2,  *(void *)(a1 + 40)));
  [v2 addObject:v3];
}

void sub_10002D2DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  a2,  *(void *)(a1 + 40)));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  a3,  *(void *)(a1 + 40)));
  [v5 moveItemAtIndexPath:v7 toIndexPath:v6];
}

id sub_10002D358(id *a1)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = a1[4];
  id v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v7 = [v6 sectionIndex];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 changeDetails]);
        char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 changedIndexes]);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_10002D500;
        v14[3] = &unk_1000CA6F8;
        id v17 = v7;
        id v10 = a1[5];
        id v11 = a1[6];
        id v15 = v10;
        id v16 = v11;
        [v9 enumerateIndexesUsingBlock:v14];
      }

      id v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v3);
  }

  return objc_msgSend(*((id *)a1[6] + 6), "setScrollEnabled:", objc_msgSend(a1[6], "isScrollingEnabled"));
}

void sub_10002D500(uint64_t a1, uint64_t a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  a2,  *(void *)(a1 + 48)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:"));
  if (v3) {
    [*(id *)(a1 + 40) _configureCell:v3 atIndexPath:v4];
  }
}

void sub_10002DADC(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetLocalId]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localIdentifier]);
    unsigned int v8 = [v6 isEqualToString:v7];

    if (v8) {
      [*(id *)(a1 + 32) setImage:v9];
    }
  }
}

void sub_10002DDBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) previewView]);
  [v2 setImage:v1];
}

void sub_10002F434(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4) {
    [*(id *)(a1 + 32) setCurrentBulletin:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10002F784(void *a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v4 handleFailureInMethod:a1[6], a1[4], @"TVPMemoriesTabCollectionViewController.m", 1088, @"%@ should conform to protocol %@, but it is nil", @"viewController", @"PXStoryPlayerTestElement" object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }

  if (([v3 conformsToProtocol:&OBJC_PROTOCOL___PXStoryPlayerTestElement] & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[4];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "px_descriptionForAssertionMessage"));
    [v4 handleFailureInMethod:v5, v6, @"TVPMemoriesTabCollectionViewController.m", 1088, @"%@ should conform to protocol %@, but %@ doesn't", @"viewController", @"PXStoryPlayerTestElement", v7 object file lineNumber description];

    goto LABEL_6;
  }

LABEL_3:
  (*(void (**)(void))(a1[5] + 16LL))();
}

void sub_10002FF88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([WeakRetained assetsRefreshTimer]);
    dispatch_source_cancel(v3);

    [v4 setAssetsRefreshTimer:0];
    [v4 _refreshMarimbaPreviewWithPhotoAssets:*(void *)(a1 + 32)];
    id WeakRetained = v4;
  }
}

void sub_10003013C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([WeakRetained assetsRefreshTimer]);
    dispatch_source_cancel(v3);

    [v4 setAssetsRefreshTimer:0];
    [v4 _refreshMarimbaPreviewWithPhotoAssets:*(void *)(a1 + 32)];
    id WeakRetained = v4;
  }
}

void sub_100030A94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100030AB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissImagePreloadSpinnerView];
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained slideshowUtilites]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained marimbaView]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 marimbaLayer]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 document]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained photoAssets]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 updateMarimbaDocument:v4 photoAssets:v5]);
  [WeakRetained setAssetKeysToAssetPaths:v6];

  if ([WeakRetained displayThemeOptions])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained slideshowOptionsView]);
    [v7 reloadData];
  }

  else
  {
    [WeakRetained _startSlideshow];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained marimbaView]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained playPauseGestureRecognizer]);
    [v8 addGestureRecognizer:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained marimbaView]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained leftButtonRecognizer]);
    [v10 addGestureRecognizer:v11];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained marimbaView]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained rightButtonRecognizer]);
    [v7 addGestureRecognizer:v12];
  }
}

LABEL_29:
  return v9;
}

void sub_10003179C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000317D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:PHImageFileURLKey]);
  [*(id *)(a1 + 32) setFullResolutionURL:v4];
  [*(id *)(a1 + 32) setPendingRequestID:0];
}

uint64_t sub_100031834(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100031844(uint64_t a1)
{
}

void sub_10003184C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:PHImageFileURLKey]);
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setFullResolutionURL:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setPendingRequestID:0];
}

void sub_1000323E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000323FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissImagePreloadSpinnerView];
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained slideshowUtilites]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained marimbaView]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 marimbaLayer]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 document]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained photoAssets]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 updateMarimbaDocument:v4 photoAssets:v5]);
  [WeakRetained setAssetKeysToAssetPaths:v6];

  [WeakRetained _unpauseMarimbaRenderer];
}

id sub_100032714(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100032780;
  v2[3] = &unk_1000C9528;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v2,  0.0,  0.7);
}

id sub_100032780(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:0.0];
}

void sub_100032798(uint64_t a1)
{
  id v3 = -[TVPRestGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVPRestGestureRecognizer),  "initWithTarget:action:",  *(void *)(a1 + 32),  "_fingerTouchAction:");
  -[TVPRestGestureRecognizer setMinimumPressDuration:](v3, "setMinimumPressDuration:", 0.1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 addGestureRecognizer:v3];
}

id sub_1000328C4(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100032930;
  v2[3] = &unk_1000C9528;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v2,  0.0,  0.7);
}

id sub_100032930(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:1.0];
}

void sub_100032948(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 removeAllGestureRecognizers];

  if ([*(id *)(*(void *)(a1 + 32) + 216) isValid])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 216) userInfo]);
    id v7 = [v3 copy];
  }

  else
  {
    id v7 = 0LL;
  }

  [*(id *)(a1 + 32) _cancelExistingTimer];
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  *(void *)(a1 + 32),  "_didFinishTimedInterval:",  v7,  0LL,  2.0));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v4;
}

void sub_100033400(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v2 = dispatch_group_create();
  if (*((uint64_t *)a1[4] + 26) < 1)
  {
    unint64_t v3 = 0LL;
  }

  else
  {
    unint64_t v3 = 0LL;
    do
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectAtIndexedSubscript:v3]);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 photoAsset]);

      if (v5)
      {
        dispatch_group_enter(v2);
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 photoAsset]);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
        [v8 bounds];
        double v10 = v9;
        double v12 = v11;
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
        id v14 = [v13 scale];
        double v16 = PXSizeScale(v14, v10, v12, v15);
        double v18 = v17;
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([a1[4] _defaultImageRequestOptions]);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_1000337AC;
        v37[3] = &unk_1000CA748;
        id v38 = v4;
        dispatch_time_t v39 = v2;
        objc_msgSend( v7,  "requestImageForAsset:targetSize:contentMode:options:resultHandler:",  v6,  0,  v19,  v37,  v16,  v18);
      }

      ++v3;
    }

    while ((int64_t)v3 < *((void *)a1[4] + 26));
  }

  id v20 = WeakRetained;
  objc_sync_enter(v20);
  [v20 setInitialImagePrefetchCount:v3];
  objc_sync_exit(v20);

  __int128 v21 = objc_alloc_init(&OBJC_CLASS___PXDisplayAssetCountsByPlaybackStyle);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v22 = a1[5];
  id v23 = [v22 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v22);
        }
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * (void)i), "photoAsset", WeakRetained));
        id v27 = [v26 playbackStyle];

        -[PXDisplayAssetCountsByPlaybackStyle addPlaybackStyle:](v21, "addPlaybackStyle:", v27);
      }

      id v23 = [v22 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }

    while (v23);
  }

  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033808;
  block[3] = &unk_1000CA8D8;
  void block[4] = a1[4];
  double v31 = v21;
  id v32 = a1[6];
  __int128 v28 = v21;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_100033790(_Unwind_Exception *a1)
{
}

void sub_1000337AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:PHImageFileURLKey]);
  [*(id *)(a1 + 32) setFullResolutionURL:v4];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_100033808(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10003477C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle1));
  id v2 = (void *)qword_100102F18;
  qword_100102F18 = v1;
}

void sub_1000347F4(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[UIFontDescriptor preferredFontDescriptorWithTextStyle:]( &OBJC_CLASS___UIFontDescriptor,  "preferredFontDescriptorWithTextStyle:",  UIFontTextStyleTitle1));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v4 fontDescriptorWithSymbolicTraits:2]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v1, 0.0));
  unint64_t v3 = (void *)qword_100102F28;
  qword_100102F28 = v2;
}

void sub_1000348B8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
  uint64_t v2 = (void *)qword_100102F38;
  qword_100102F38 = v1;
}

void sub_100034930(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
  uint64_t v2 = (void *)qword_100102F48;
  qword_100102F48 = v1;
}

void sub_1000349A8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  kCTUIFontTextStyleTitle4));
  uint64_t v2 = (void *)qword_100102F58;
  qword_100102F58 = v1;
}

void sub_100034A20(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  uint64_t v2 = (void *)qword_100102F68;
  qword_100102F68 = v1;
}

void sub_100034A98(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline2));
  uint64_t v2 = (void *)qword_100102F78;
  qword_100102F78 = v1;
}

void sub_100034B10(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  kCTUIFontTextStyleHeadline3));
  uint64_t v2 = (void *)qword_100102F88;
  qword_100102F88 = v1;
}

void sub_100034B88(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle1));
  uint64_t v2 = (void *)qword_100102F98;
  qword_100102F98 = v1;
}

void sub_100034C00(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle2));
  uint64_t v2 = (void *)qword_100102FA8;
  qword_100102FA8 = v1;
}

void sub_100034C78(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle3));
  uint64_t v2 = (void *)qword_100102FB8;
  qword_100102FB8 = v1;
}

void sub_100034CF0(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCallout));
  uint64_t v2 = (void *)qword_100102FC8;
  qword_100102FC8 = v1;
}

void sub_100034D68(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  uint64_t v2 = (void *)qword_100102FD8;
  qword_100102FD8 = v1;
}

void sub_100034DE0(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[UIFontDescriptor preferredFontDescriptorWithTextStyle:]( &OBJC_CLASS___UIFontDescriptor,  "preferredFontDescriptorWithTextStyle:",  UIFontTextStyleBody));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v4 fontDescriptorWithSymbolicTraits:2]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v1, 0.0));
  unint64_t v3 = (void *)qword_100102FE8;
  qword_100102FE8 = v2;
}

void sub_100034EA4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubhead));
  uint64_t v2 = (void *)qword_100102FF8;
  qword_100102FF8 = v1;
}

void sub_100034F1C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleFootnote));
  uint64_t v2 = (void *)qword_100103008;
  qword_100103008 = v1;
}

void sub_100034F94(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1));
  uint64_t v2 = (void *)qword_100103018;
  qword_100103018 = v1;
}

void sub_10003500C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
  uint64_t v2 = (void *)qword_100103028;
  qword_100103028 = v1;
}

void sub_1000351BC(id a1)
{
  v3[0] = @"ultralight";
  v3[1] = @"thin";
  v4[0] = kCTFontDescriptorTextStyleUltraLight;
  v4[1] = kCTFontDescriptorTextStyleThin;
  v3[2] = @"light";
  v3[3] = @"regular";
  v4[2] = kCTFontDescriptorTextStyleLight;
  _OWORD v4[3] = kCTFontDescriptorTextStyleRegular;
  v3[4] = @"medium";
  v3[5] = @"semibold";
  void v4[4] = kCTFontDescriptorTextStyleMedium;
  v4[5] = kCTFontDescriptorTextStyleSemibold;
  v3[6] = @"bold";
  v3[7] = @"heavy";
  v4[6] = kCTFontDescriptorTextStyleBold;
  v4[7] = kCTFontDescriptorTextStyleHeavy;
  v3[8] = @"emphasized";
  v3[9] = @"black";
  v4[8] = kCTFontDescriptorTextStyleEmphasized;
  v4[9] = kCTFontDescriptorTextStyleBlack;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  10LL));
  uint64_t v2 = (void *)qword_100103038;
  qword_100103038 = v1;
}

void sub_1000353B4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6));
  uint64_t v2 = (void *)qword_100103048;
  qword_100103048 = v1;
}

void sub_10003542C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.9));
  uint64_t v2 = (void *)qword_100103058;
  qword_100103058 = v1;
}

void sub_1000354FC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.6));
  uint64_t v2 = (void *)qword_100103068;
  qword_100103068 = v1;
}

void sub_100035574(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.7));
  uint64_t v2 = (void *)qword_100103078;
  qword_100103078 = v1;
}

void sub_1000355EC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.7));
  uint64_t v2 = (void *)qword_100103088;
  qword_100103088 = v1;
}

void sub_1000356BC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
  uint64_t v2 = (void *)qword_100103098;
  qword_100103098 = v1;
}

void sub_100035730(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  uint64_t v2 = (void *)qword_1001030A8;
  qword_1001030A8 = v1;
}

void sub_1000357A4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
  uint64_t v2 = (void *)qword_1001030B8;
  qword_1001030B8 = v1;
}

void sub_100035818(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6));
  uint64_t v2 = (void *)qword_1001030C8;
  qword_1001030C8 = v1;
}

void sub_100035890(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  uint64_t v2 = (void *)qword_1001030D8;
  qword_1001030D8 = v1;
}

void sub_100035904(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6));
  uint64_t v2 = (void *)qword_1001030E8;
  qword_1001030E8 = v1;
}

void sub_10003597C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6));
  uint64_t v2 = (void *)qword_1001030F8;
  qword_1001030F8 = v1;
}

void sub_1000359F4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  uint64_t v2 = (void *)qword_100103108;
  qword_100103108 = v1;
}

void sub_100035AC0(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
  uint64_t v2 = (void *)qword_100103118;
  qword_100103118 = v1;
}

void sub_100035B34(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  uint64_t v2 = (void *)qword_100103128;
  qword_100103128 = v1;
}

void sub_100035C00(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
  uint64_t v2 = (void *)qword_100103138;
  qword_100103138 = v1;
}

void sub_100035C74(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  uint64_t v2 = (void *)qword_100103148;
  qword_100103148 = v1;
}

void sub_100035D40(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6));
  uint64_t v2 = (void *)qword_100103158;
  qword_100103158 = v1;
}

void sub_100035DB8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.6));
  uint64_t v2 = (void *)qword_100103168;
  qword_100103168 = v1;
}

void sub_100035E30(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
  uint64_t v2 = (void *)qword_100103178;
  qword_100103178 = v1;
}

void sub_100035EFC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.3));
  uint64_t v2 = (void *)qword_100103188;
  qword_100103188 = v1;
}

void sub_100035F74(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.501960784,  0.482352941,  0.501960784,  0.1));
  uint64_t v2 = (void *)qword_100103198;
  qword_100103198 = v1;
}

void sub_100036054(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.04));
  uint64_t v2 = (void *)qword_1001031A8;
  qword_1001031A8 = v1;
}

void sub_1000360CC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.1));
  uint64_t v2 = (void *)qword_1001031B8;
  qword_1001031B8 = v1;
}

void sub_10003619C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.75));
  uint64_t v2 = (void *)qword_1001031C8;
  qword_1001031C8 = v1;
}

void sub_100036210(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.6));
  uint64_t v2 = (void *)qword_1001031D8;
  qword_1001031D8 = v1;
}

void sub_100036288(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
  uint64_t v2 = (void *)qword_1001031E8;
  qword_1001031E8 = v1;
}

void sub_100036300(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  uint64_t v2 = (void *)qword_1001031F8;
  qword_1001031F8 = v1;
}

void sub_10003636C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.9));
  uint64_t v2 = (void *)qword_100103208;
  qword_100103208 = v1;
}

void sub_1000363E4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.6));
  uint64_t v2 = (void *)qword_100103218;
  qword_100103218 = v1;
}

void sub_10003645C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.4));
  uint64_t v2 = (void *)qword_100103228;
  qword_100103228 = v1;
}

void sub_1000364D4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.9));
  uint64_t v2 = (void *)qword_100103238;
  qword_100103238 = v1;
}

void sub_10003654C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  0.58,  0.12,  1.0));
  uint64_t v2 = (void *)qword_100103248;
  qword_100103248 = v1;
}

void sub_1000365D0(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 colorWithAlphaComponent:0.2]);
  uint64_t v2 = (void *)qword_100103258;
  qword_100103258 = v1;
}

void sub_100036660(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 colorWithAlphaComponent:0.1]);
  uint64_t v2 = (void *)qword_100103268;
  qword_100103268 = v1;
}

void sub_100036E0C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hostViewController]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 navigationController]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contextMenuViewController]);
  objc_msgSend((id)v3, "bs_removeChildViewController:", v4);

  [*(id *)(a1 + 32) setContextMenuViewController:0];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  LOBYTE(v3) = objc_opt_respondsToSelector(v5, "contextMenuPresenterDidDismissContextMenu:");

  if ((v3 & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    [v6 contextMenuPresenterDidDismissContextMenu:*(void *)(a1 + 32)];
  }

id sub_100037060(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFocusIfNeeded];
}

void sub_100037A10(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  uint64_t v2 = (void *)qword_100103278;
  qword_100103278 = (uint64_t)v1;

  [(id)qword_100103278 setFormatterBehavior:1040];
  [(id)qword_100103278 setDateStyle:3];
  [(id)qword_100103278 setTimeStyle:0];
  uint64_t v3 = (void *)qword_100103278;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  [v3 setTimeZone:v4];
}

void sub_100037C40(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  uint64_t v2 = (void *)qword_100103288;
  qword_100103288 = (uint64_t)v1;

  [(id)qword_100103288 setDateFormat:@"MMMM"];
}

void sub_1000382EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_100038318(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100038328(uint64_t a1)
{
}

id sub_100038330(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentView]);
  objc_msgSend(v2, "_configureItemView:atIndex:", v3, objc_msgSend(*(id *)(a1 + 32), "focusedItemIndex"));

  id result = [*(id *)(*(void *)(a1 + 32) + 232) frame];
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 8LL);
  void v5[4] = v6;
  void v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;
  return result;
}

void sub_1000383A8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  char v3 = objc_opt_respondsToSelector(v2, "oneupView:didTransitionToItemInCaptionModeWithIndex:");

  if ((v3 & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    objc_msgSend( v4,  "oneupView:didTransitionToItemInCaptionModeWithIndex:",  *(void *)(a1 + 32),  objc_msgSend(*(id *)(a1 + 32), "focusedItemIndex"));
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataSource]);
  char v6 = objc_opt_respondsToSelector(v5, "oneupView:getSecondaryViewForMode:");

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataSource]);
    id v8 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "oneupView:getSecondaryViewForMode:",  *(void *)(a1 + 32),  objc_msgSend(*(id *)(a1 + 32), "currentMode")));

    if (v8)
    {
      objc_msgSend( *(id *)(a1 + 32),  "_setFrameForSecondaryView:itemViewFrame:",  v8,  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32),  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40),  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48),  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
      [*(id *)(a1 + 32) addSubview:v8];
      [*(id *)(a1 + 32) setNeedsFocusUpdate];
    }
  }

void sub_1000385E4(_Unwind_Exception *a1)
{
}

void sub_1000385FC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentView]);
  objc_msgSend(v2, "_configureItemView:atIndex:", v3, objc_msgSend(*(id *)(a1 + 32), "focusedItemIndex"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _getSecondaryCommentsViewFromParentView]);
  if (v4)
  {
    id v5 = v4;
    [v4 removeFromSuperview];
    id v4 = v5;
  }
}

id sub_100038674(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

LABEL_16:
    }
  }

void sub_100038DFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

id sub_100038E14(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 32LL) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8LL)
                                                                          + 32LL)
                                                              - *(double *)(a1 + 64);
  objc_msgSend( *(id *)(a1 + 40),  "setCenter:",  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32),  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  [*(id *)(a1 + 48) center];
  return [*(id *)(a1 + 48) setCenter:v2 - *(double *)(a1 + 64)];
}

id sub_100038E84(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
  char v3 = objc_opt_respondsToSelector(v2, "oneupView:didFocusItemAtIndex:");

  if ((v3 & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    objc_msgSend( v4,  "oneupView:didFocusItemAtIndex:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 40), "focusedItemIndex"));
  }

  [*(id *)(a1 + 40) setIsPerformingTransitionAnimation:0];
  return [*(id *)(a1 + 40) _performNextEventTransitionIfRequired];
}

void sub_1000393E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100039404(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _makeSnapshotWithDataSource:*(void *)(a1 + 32)]);
  [WeakRetained setSnapshot:v2];
}

void sub_1000396B4(id a1, PXStoryMutableMemoryFeedDataSourceManager *a2)
{
}

void sub_100039884(id a1, PXStoryMutableMemoryFeedDataSourceManager *a2)
{
  double v2 = a2;
  -[PXStoryMutableMemoryFeedDataSourceManager setWantsFavoritesOnly:](v2, "setWantsFavoritesOnly:", 1LL);
  -[PXStoryMutableMemoryFeedDataSourceManager setIsActive:](v2, "setIsActive:", 1LL);
}

LABEL_22:
  return v5;
}
}

int64_t sub_10003A2DC(id a1, MSASComment *a2, MSASComment *a3)
{
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSASComment timestamp](a3, "timestamp"));
  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSASComment timestamp](v4, "timestamp"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10003A348(uint64_t a1, uint64_t a2, unint64_t a3, BOOL *a4)
{
  char v6 = *(void **)(a1 + 32);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _userDictionaryFromMSASComment:a2]);
  [v6 addObject:v7];

  *a4 = a3 > 4;
}

uint64_t sub_10003A55C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

LABEL_24:
  return v10;
}

void sub_10003AA90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10003AAA8(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (([v10 representsVideo] & 1) == 0)
  {
    char v3 = (void *)objc_claimAutoreleasedReturnValue([v10 metadataValueForKey:kMSAssetMetadataPixelWidthKey]);
    [v3 floatValue];
    double v5 = v4;
    char v6 = (void *)objc_claimAutoreleasedReturnValue([v10 metadataValueForKey:kMSAssetMetadataPixelHeightKey]);
    [v6 floatValue];
    float v8 = v7;

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (*(double *)(v9 + 32) < v5)
    {
      *(double *)(v9 + 32) = v5;
      *(double *)(v9 + 40) = v8;
    }
  }
}

void sub_10003B50C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAfterChanges]);
  uint64_t v3 = *(void *)(a1 + 32);
  float v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "pl_assetContainer"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PLCloudSharedAlbum, v5);
  if ((objc_opt_isKindOfClass(obj, v6) & 1) != 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48LL), obj);
    id v8 = objc_msgSend( (id)objc_opt_class(*(void *)(a1 + 32), v7),  "_sharedAlbumSubscribersFromAlbum:",  *(void *)(*(void *)(a1 + 32) + 16));
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = *(void *)(a1 + 32);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) subscribersView]);
    [v12 setSubscribers:*(void *)(*(void *)(a1 + 32) + 40)];
  }
}

void sub_10003B8AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(v4 + 8);
  if (v5 == 2)
  {
    if (*(void *)(v4 + 48))
    {
      id v7 = v3;
      +[PLPhotoSharingHelper unsubscribeFromAlbum:](&OBJC_CLASS___PLPhotoSharingHelper, "unsubscribeFromAlbum:");
      goto LABEL_7;
    }
  }

  else if (v5 == 1 && *(void *)(v4 + 48))
  {
    id v7 = v3;
    +[PLPhotoSharingHelper deleteCloudSharedAlbumFromServer:]( &OBJC_CLASS___PLPhotoSharingHelper,  "deleteCloudSharedAlbumFromServer:");
LABEL_7:
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 postNotificationName:off_100101F88 object:0];

    id v3 = v7;
  }
}

id sub_10003C4F4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
}

LABEL_65:
LABEL_66:
                double v12 = v90;
                double v16 = v95;
                if (v25)
                {
                  -[NSMutableArray addObject:](v86, "addObject:", v25);
                }
              }
            }

            double v16 = (char *)v16 + 1;
          }

          while (v16 != v11);
          double v11 = [v8 countByEnumeratingWithState:&v105 objects:v111 count:16];
        }

        while (v11);
      }

      v74 = -[NSMutableArray copy](v86, "copy");
      id v7 = v76;
      int v5 = v77;
    }

    else
    {
      v74 = 0LL;
    }
  }

  else
  {
    v74 = 0LL;
  }

  return v74;
}

void sub_10003D014(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  uint64_t v2 = (void *)qword_100103298;
  qword_100103298 = (uint64_t)v1;

  [(id)qword_100103298 setQualityOfService:25];
  id v3 = (void *)qword_100103298;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  if ([v5 _graphicsQuality] == (id)100) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  [v3 setMaxConcurrentOperationCount:v4];
}

void sub_10003D34C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10003D374(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003D384(uint64_t a1)
{
}

uint64_t sub_10003D38C(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003D468(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSBlockOperation);
  objc_initWeak(&location, v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003D588;
  v7[3] = &unk_1000CB2A0;
  objc_copyWeak(&v9, &location);
  id v3 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  id v8 = v3;
  -[NSBlockOperation addExecutionBlock:](v2, "addExecutionBlock:", v7);
  [*(id *)(*(void *)(a1 + 32) + 56) addObject:v2];
  id v5 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), v4), "_loadingOperationQueue");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v6 addOperation:v2];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void sub_10003D568(_Unwind_Exception *a1)
{
}

void sub_10003D588(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned __int8 v4 = [WeakRetained isCancelled];

  if ((v4 & 1) != 0) {
    return;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(dispatch_queue_s **)(v5 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003DB9C;
  block[3] = &unk_1000C9528;
  void block[4] = v5;
  dispatch_sync(v6, block);
  uint64_t v7 = *(void *)(a1 + 32);
  double v60 = *(double *)(v7 + 72);
  double v61 = *(double *)(v7 + 64);
  id v8 = [*(id *)(v7 + 24) copy];
  id v9 = objc_loadWeakRetained(v2);
  unsigned __int8 v10 = [v9 isCancelled];

  if ((v10 & 1) != 0) {
    goto LABEL_48;
  }
  uint64_t v59 = a1;
  uint64_t v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  uint64_t v63 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v57 = v8;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  __int128 v58 = v11;
  if (!v12) {
    goto LABEL_28;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v71;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  BOOL v18 = v60 == CGSizeZero.height && v61 == CGSizeZero.width;
  while (2)
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v71 != v14) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
      id v21 = objc_loadWeakRetained(v2);
      unsigned __int8 v22 = [v21 isCancelled];

      if ((v22 & 1) != 0)
      {
        id v8 = v57;
        goto LABEL_47;
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 _originalImageCacheKey]);
      if (v23)
      {
        uint64_t v24 = (CGImage *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v63, "objectForKey:", v23));
        if (!v24)
        {
          __int128 v25 = (CGImage *)[v20 _originalImage];
          if (!v25) {
            goto LABEL_26;
          }
          uint64_t v24 = v25;
          -[NSMutableDictionary setObject:forKey:](v63, "setObject:forKey:", v25, v23);
        }
      }

      else
      {
        uint64_t v24 = (CGImage *)[v20 _originalImage];
        if (!v24) {
          goto LABEL_26;
        }
      }

      __int128 v26 = (CGImage *)[v20 _imageForOriginalImage:v24];
      CGImageRelease(v24);
      if (v26)
      {
        double x = CGRectZero.origin.x;
        double v28 = y;
        double v29 = width;
        double v30 = height;
        if (!v18)
        {
          [v20 destinationRect];
          double x = v31;
          double v28 = v32;
          double v29 = v33;
          double v30 = v34;
        }

        v77.origin.double x = x;
        v77.origin.CGFloat y = v28;
        v77.size.CGFloat width = v29;
        v77.size.CGFloat height = v30;
        v78.origin.double x = CGRectZero.origin.x;
        v78.origin.CGFloat y = y;
        v78.size.CGFloat width = width;
        v78.size.CGFloat height = height;
        if (!CGRectEqualToRect(v77, v78))
        {
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
          [v35 scale];
          CGFloat v37 = v36;
          v76.CGFloat height = v60;
          v76.CGFloat width = v61;
          UIGraphicsBeginImageContextWithOptions(v76, 0, v37);

          id v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](&OBJC_CLASS___UIImage, "imageWithCGImage:", v26));
          objc_msgSend(v38, "drawInRect:blendMode:alpha:", 0, x, v28, v29, v30, 1.0);

          ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
          id v40 = objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
          CGImageRef v41 = CGImageRetain((CGImageRef)[v40 CGImage]);

          UIGraphicsEndImageContext();
          if (v41)
          {
            CGImageRelease(v26);
            __int128 v26 = v41;
          }

          uint64_t v11 = v58;
        }

        -[NSMutableArray addObject:](v11, "addObject:", v26);
        CGImageRelease(v26);
      }

LABEL_28:
  id obj = -[NSMutableArray copy](v11, "copy");
  if (!*(void *)(*(void *)(v59 + 32) + 104LL)) {
    goto LABEL_39;
  }
  CFTypeID TypeID = CGImageGetTypeID();
  if (TypeID != CFGetTypeID(*(CFTypeRef *)(*(void *)(v59 + 32) + 104LL)))
  {
    unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v47 handleFailureInMethod:*(void *)(v59 + 72) object:*(void *)(v59 + 32) file:@"TVPImageStack.m" lineNumber:617 description:@"flatImage isn't a CGImageRef"];

    goto LABEL_39;
  }

  double v43 = (double)CGImageGetWidth(*(CGImageRef *)(*(void *)(v59 + 32) + 104LL));
  double v44 = vabdd_f64(*(double *)(v59 + 64), (double)CGImageGetHeight(*(CGImageRef *)(*(void *)(v59 + 32) + 104LL)));
  BOOL v45 = vabdd_f64(*(double *)(v59 + 56), v43) < 30.0 && v44 < 30.0;
  if (!v45 || (CGImageRef v46 = (CGImageRef)*(id *)(*(void *)(v59 + 32) + 104LL)) == 0LL) {
LABEL_39:
  }
    CGImageRef v46 = sub_10003DBB8( obj,  (CGBlendMode)*(_DWORD *)(*(void *)(v59 + 32) + 8LL),  *(unsigned __int8 *)(*(void *)(v59 + 32) + 89LL),  *(double *)(v59 + 56),  *(double *)(v59 + 64),  *(double *)(*(void *)(v59 + 32) + 16LL));
  id v48 = objc_loadWeakRetained(v2);
  unsigned __int8 v49 = [v48 isCancelled];

  if ((v49 & 1) == 0)
  {
    v50 = *(void **)(v59 + 40);
    if (v50)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v52 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472LL;
      v66[2] = sub_10003DFA4;
      v66[3] = &unk_1000CB278;
      id v69 = v50;
      v67 = v46;
      id v68 = obj;
      dispatch_async(v52, v66);
    }

    id v53 = objc_loadWeakRetained(v2);
    v54 = v53;
    if (v53)
    {
      uint64_t v55 = *(void *)(v59 + 32);
      unint64_t v56 = *(dispatch_queue_s **)(v55 + 80);
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472LL;
      v64[2] = sub_10003DFB8;
      v64[3] = &unk_1000C9CC8;
      v64[4] = v55;
      id v65 = v53;
      dispatch_async(v56, v64);
    }
  }

  id v8 = v57;
  uint64_t v11 = v58;
LABEL_47:

LABEL_48:
}

void *sub_10003DB9C(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[5])
  {
    if (!result[3]) {
      return [result _loadLayeredImageProxy];
    }
  }

  return result;
}

CGImageRef sub_10003DBB8(void *a1, CGBlendMode a2, int a3, double a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = [v11 count];
  BOOL v13 = a6 <= 0.0 && v12 == (id)1;
  if (!v13
    || ((uint64_t v14 = (CGImage *)[v11 firstObject],
         size_t v15 = CGImageGetWidth(v14),
         size_t v16 = CGImageGetHeight(v14),
         double v17 = round(a4),
         round(a5) == (double)v16)
      ? (BOOL v18 = v17 == (double)v15)
      : (BOOL v18 = 0),
        !v18 ? (BOOL v19 = a3 == 0) : (BOOL v19 = 0),
        v19))
  {
    if ([v11 count]
      && (DeviceRGB = CGColorSpaceCreateDeviceRGB(),
          unsigned __int8 v22 = CGBitmapContextCreate(0LL, (unint64_t)a4, (unint64_t)a5, 8uLL, 0LL, DeviceRGB, 0x2002u),
          CFRelease(DeviceRGB),
          v22))
    {
      double v54 = a6;
      ClipBoundingBodouble x = CGContextGetClipBoundingBox(v22);
      double x = ClipBoundingBox.origin.x;
      double y = ClipBoundingBox.origin.y;
      double width = ClipBoundingBox.size.width;
      double height = ClipBoundingBox.size.height;
      CGContextSetInterpolationQuality(v22, kCGInterpolationHigh);
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      id v27 = v11;
      id v28 = [v27 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v57;
        do
        {
          for (i = 0LL; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v57 != v30) {
              objc_enumerationMutation(v27);
            }
            double v32 = *(CGImage **)(*((void *)&v56 + 1) + 8LL * (void)i);
            size_t v33 = CGImageGetWidth(v32);
            size_t v34 = CGImageGetHeight(v32);
            double v35 = a4;
            double v36 = a4 / (double)v33;
            double v37 = (double)v34;
            CGAffineTransformMakeScale(&v55, v36, v36);
            v63.origin.double x = 0.0;
            v63.origin.double y = 0.0;
            v63.size.double width = (double)v33;
            v63.size.double height = v37;
            CGRect v64 = CGRectApplyAffineTransform(v63, &v55);
            double v38 = v64.size.width;
            double v39 = v64.size.height;
            CGContextSaveGState(v22);
            if (a2) {
              CGContextSetBlendMode(v22, a2);
            }
            v65.origin.double x = round(x + (width - v38) * 0.5);
            v65.origin.double y = round(y + (height - v39) * 0.5);
            v65.size.double width = v38;
            v65.size.double height = v39;
            CGContextDrawImage(v22, v65, v32);
            CGContextRestoreGState(v22);
            a4 = v35;
          }

          id v29 = [v27 countByEnumeratingWithState:&v56 objects:v60 count:16];
        }

        while (v29);
      }

      if (v54 > 0.0)
      {
        CGRect v66 = CGContextGetClipBoundingBox(v22);
        double v40 = v66.origin.x;
        double v41 = v66.origin.y;
        double v42 = v66.size.width;
        double v43 = v66.size.height;
        CGRect v67 = CGContextGetClipBoundingBox(v22);
        CGFloat v44 = v67.size.width;
        CGFloat v45 = v67.size.height;
        CGImageRef v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen", v67.origin.x, v67.origin.y));
        [v46 scale];
        CGFloat v48 = v47;
        v61.double width = v44;
        v61.double height = v45;
        UIGraphicsBeginImageContextWithOptions(v61, 0, v48);

        unsigned __int8 v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
        [v49 setFill];

        v68.origin.double x = v40;
        v68.origin.double y = v41;
        v68.size.double width = v42;
        v68.size.double height = v43;
        UIRectFillUsingBlendMode(v68, kCGBlendModeCopy);
        v50 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  v40,  v41,  v42,  v43,  v54));
        [v50 fillWithBlendMode:16 alpha:1.0];

        ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
        v52 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
        UIGraphicsEndImageContext();
        UIGraphicsPushContext(v22);
        objc_msgSend(v52, "drawInRect:blendMode:alpha:", 23, v40, v41, v42, v43, 1.0);
        UIGraphicsPopContext();
      }

      CGImageRef Image = CGBitmapContextCreateImage(v22);
      CFRelease(v22);
    }

    else
    {
      CGImageRef Image = 0LL;
    }
  }

  else
  {
    CGImageRef Image = CGImageRetain(v14);
  }

  return Image;
}

uint64_t sub_10003DFA4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

id sub_10003DFB8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
}

void sub_10003E118(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoAssets]);
  id v3 = [v2 count];

  if (!v3)
  {
    [*(id *)(a1 + 32) dismissLoadingView];
    id v16 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = PXLocalizedString(@"EMPTY_MY_PHOTO_STREAM_TITLE");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    size_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewWithBounds:title:message:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewWithBounds:title:message:",  v14,  0LL,  v6,  v8,  v10,  v12));
    [v16 addSubview:v15];
  }

void sub_10003E3E4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetLocalIdentifier]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localIdentifier]);
  unsigned int v5 = [v3 isEqualToString:v4];

  double v6 = v7;
  if (v7 && v5)
  {
    [*(id *)(a1 + 32) setPhotoImage:v7];
    [*(id *)(a1 + 32) setTag:0];
    double v6 = v7;
  }
}

UIColor *__cdecl sub_10003F77C(id a1, UITraitCollection *a2)
{
  return +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor,  "colorWithWhite:alpha:",  dbl_100097C80[(id)-[UITraitCollection userInterfaceStyle](a2, "userInterfaceStyle") == (id)2],  0.3);
}

UIColor *__cdecl sub_10003F7B8(id a1, UITraitCollection *a2)
{
  return +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor,  "colorWithWhite:alpha:",  dbl_100097C90[(id)-[UITraitCollection userInterfaceStyle](a2, "userInterfaceStyle") == (id)2],  1.0);
}

void sub_10003FBA4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _drawImage]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003FC5C;
  _OWORD v5[3] = &unk_1000C9AF0;
  objc_copyWeak(&v7, v1);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10003FC5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPhotoImage:*(void *)(a1 + 32)];
}

void sub_1000401E8(id a1)
{
  v4.tv_sec = 0LL;
  v4.tv_nsec = 0LL;
  if (!gethostuuid(v5, &v4))
  {
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v5, 16LL));
    uint64_t v2 = objc_claimAutoreleasedReturnValue([v1 MSHexString]);
    id v3 = (void *)qword_1001032B0;
    qword_1001032B0 = v2;
  }

void sub_1000402CC(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___NSString);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[TVSDevice deviceName](&OBJC_CLASS___TVSDevice, "deviceName"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemVersion](&OBJC_CLASS___TVSDevice, "systemVersion"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemBuildVersion](&OBJC_CLASS___TVSDevice, "systemBuildVersion"));
  timespec v4 = -[NSString initWithFormat:](v1, "initWithFormat:", @"%@;%@;%@", v6, v2, v3);
  uuid_t v5 = (void *)qword_1001032B8;
  qword_1001032B8 = (uint64_t)v4;
}

id sub_100040820(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___TVPDaemon);
  id v3 = (void *)qword_1001032C8;
  qword_1001032C8 = (uint64_t)v2;

  return [(id)qword_1001032C8 setDelegate:*(void *)(a1 + 32)];
}

id sub_100041FC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTag:10];
}

id sub_10004209C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTag:0];
}

void sub_1000425D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_100042618(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVImage imageWithCGImageRef:preserveAlpha:]( TVImage, "imageWithCGImageRef:preserveAlpha:", [v10 CGImage], 0));
    uint64_t v8 = objc_opt_class(*(void *)(a1 + 48), v7);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_sync_enter(v9);
    [*(id *)(a1 + 32) addObject:v6];
    objc_sync_exit(v9);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1000426CC(_Unwind_Exception *a1)
{
}

void sub_10004373C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  double v9 = v7;
  if (v8)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, id, id))(v8 + 16))(v8, v7, v6);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_1000438D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000439B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100043A98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10004429C(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIButton, v3);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
    [*(id *)(a1 + 32) addSubview:v5];
  }
}

void sub_1000442F4(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v10 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIButton, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v10, v5);
  id v7 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    id v8 = v10;
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 superview]);

    if (v9) {
      [v8 removeFromSuperview];
    }

    id v7 = v10;
  }
}

void sub_1000457F0(_Unwind_Exception *a1)
{
}

void sub_100045828(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v7)
  {
    [v7 setEnableCache:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageWithCGImage:]( UIImage, "imageWithCGImage:", [v7 image]));
  }

  else
  {
    id v10 = 0LL;
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000459B4;
  v15[3] = &unk_1000CB508;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  id v11 = WeakRetained;
  id v16 = v11;
  id v12 = v10;
  id v17 = v12;
  char v20 = a4;
  id v13 = v8;
  id v18 = v13;
  uint64_t v14 = objc_retainBlock(v15);
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    ((void (*)(void *))v14[2])(v14);
  }
  else {
    dispatch_async(&_dispatch_main_q, v14);
  }

  objc_destroyWeak(&v19);
}

void sub_1000459A0(_Unwind_Exception *a1)
{
}

void sub_1000459B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained imageProxy]);
    unsigned int v4 = [v3 isEqual:*(void *)(a1 + 32)];

    id WeakRetained = v8;
    if (v4)
    {
      if (*(void *)(a1 + 40) && *(_BYTE *)(a1 + 64))
      {
        objc_msgSend(v8, "_setImage:");
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v5 postNotificationName:@"TVPImageViewImageDidLoadNotification" object:v8];
      }

      [v8 setImageLoaded:*(unsigned __int8 *)(a1 + 64)];
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 completion]);

      id WeakRetained = v8;
      if (v6)
      {
        id v7 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v8 completion]);
        v7[2](v7, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

        [v8 setCompletion:0];
        id WeakRetained = v8;
      }
    }
  }
}

void sub_100045AB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 32);
  if ((id)v3[10] == WeakRetained)
  {
    id v5 = WeakRetained;
    unsigned int v4 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v3 completion]);
    v4[2](v4, 0LL, 0LL, 1LL);

    [*(id *)(a1 + 32) setCompletion:0];
    [*(id *)(a1 + 32) setImageLoaded:0];
    id WeakRetained = v5;
  }
}

void sub_100046094( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000460AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000460BC(uint64_t a1)
{
}

void sub_1000460C4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  if ([v7 tabMode] == *(id *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

void sub_100046BB4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id a26)
{
}

void sub_100046BE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showLibraryFilterView];
}

uint64_t sub_1000471D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48),  *(void *)(a1 + 32));
}

id sub_1000473B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) save];
}

void sub_1000475B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadLibraryFilterButton];
}

void sub_100047714(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadLibraryFilterButton];
}

void sub_100047740(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadLibraryFilterButton];
}

void sub_1000479C0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___TVPDiagnosticsAgent);
  uint64_t v2 = (void *)qword_1001032D8;
  qword_1001032D8 = (uint64_t)v1;
}

void sub_100047A6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _descriptionForUIState:*(void *)(a1 + 48)]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100047D14(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 4)
  {
    if (v2 == 4)
    {
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "px_URLByAppendingPathComponentFollowedByCurrentDateAndTime:",  @"Memories"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100047E20;
      v8[3] = &unk_1000CB618;
      id v5 = *(id *)(a1 + 40);
      id v9 = v4;
      id v10 = v5;
      id v6 = v4;
      +[PXStoryView dumpTapToRadarDiagnosticAttachmentsToURL:completionHandler:]( &OBJC_CLASS___PXStoryView,  "dumpTapToRadarDiagnosticAttachmentsToURL:completionHandler:",  v6,  v8);
    }
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Dumping state %li isn't implemented on the current platform\n",  v2));
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v7);
  }

void sub_100047E20(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Dumped Memory diagnostics to: %@\n",  v5));
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to dump Memory diagnostics: %@\n",  a3));
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

void sub_100047FA4(void *a1)
{
  char v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unint64_t v2 = (void *)a1[4];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_claimAutoreleasedReturnValue([v20 temporaryDirectory]);
  }
  unsigned int v4 = v3;
  id v34 = 0LL;
  unsigned __int8 v5 = [v20 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v34];
  id v6 = v34;
  id v19 = v6;
  if ((v5 & 1) != 0)
  {
    uint64_t v28 = 0LL;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000LL;
    double v31 = sub_100048310;
    double v32 = sub_100048320;
    id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100048328;
    v25[3] = &unk_1000CB668;
    id v26 = v4;
    id v27 = &v28;
    +[PXGView enumerateAllViewsUsingBlock:](&OBJC_CLASS___PXGView, "enumerateAllViewsUsingBlock:", v25);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"No recordings were started. Ensure that current renderers support recording."));
    if ([(id)v29[5] count])
    {
      id v8 = [(id)v29[5] count];
      id v9 = &stru_1000CC6C8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"Started recording%@:\n  ",  v9));

      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v11 = (id)v29[5];
      id v12 = [v11 countByEnumeratingWithState:&v21 objects:v35 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v22;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v11);
            }
            size_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)i) recordingURL]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
            [v10 appendFormat:@"%@\n  ", v16];
          }

          id v12 = [v11 countByEnumeratingWithState:&v21 objects:v35 count:16];
        }

        while (v12);
      }
    }

    else
    {
      id v10 = v7;
    }

    objc_storeStrong((id *)(a1[5] + 8LL), (id)v29[5]);
    (*(void (**)(void))(a1[6] + 16LL))();

    _Block_object_dispose(&v28, 8);
  }

  else
  {
    uint64_t v17 = a1[6];
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0LL, v18);
  }
}

void sub_1000482E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

uint64_t sub_100048310(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100048320(uint64_t a1)
{
}

void sub_100048328(uint64_t a1, void *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a2 engine]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 startRecordingToDirectoryURL:*(void *)(a1 + 32)]);
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
  }
}

uint64_t sub_100048408(uint64_t a1)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8LL);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 8);
  *(void *)(v8 + _Block_object_dispose(va, 8) = 0LL;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100048BC8(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 diagnosticDescription]);
  [v3 appendString:v4];
}

uint64_t start(int a1, char **a2)
{
  id v4 = objc_autoreleasePoolPush();
  PXPrototypeToolsUIPrepare();
  id v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVPApplication, v5);
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  id v10 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVPhotosAppDelegate, v9);
  __int128 v11 = NSStringFromClass(v10);
  __int128 v12 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = UIApplicationMain(a1, a2, v8, v12);

  objc_autoreleasePoolPop(v4);
  return v13;
}

void sub_100049124(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetLocalIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localIdentifier]);
  unsigned int v5 = [v3 isEqualToString:v4];

  id v6 = v7;
  if (v7 && v5)
  {
    [*(id *)(a1 + 32) setPhotoImage:v7];
    [*(id *)(a1 + 32) setTag:0];
    id v6 = v7;
  }
}

void sub_100049F04(_Unwind_Exception *a1)
{
}

uint64_t sub_100049F4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100049F5C(uint64_t a1)
{
}

void sub_100049F64(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isFinished])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      [WeakRetained _setPreviewImage:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forMemory:*(void *)(a1 + 40)];
      [v4 setCurrentPreviewProgress:0];
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);
      [v3 previewManagerDidUpdatePreview:v4];

      id WeakRetained = v4;
    }
  }

uint64_t sub_100049FF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100049FFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[TVPMemoriesTab] Curated asset not found for: %{public}@",  buf,  0xCu);
    }

    id v4 = *(void **)(a1 + 40);
  }

  id v6 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004A170;
  v11[3] = &unk_1000CB708;
  id v12 = *(id *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v10;
  __int128 v13 = v10;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _fetchImageForAsset:v6 completion:v11]);

  [*(id *)(a1 + 48) addChild:v9 withPendingUnitCount:1];
}

void sub_10004A170(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079D38(a1);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10004A394(id *a1)
{
  id v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained && ([a1[4] isCancelled] & 1) == 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchCuratedAssetsInAssetCollection:]( &OBJC_CLASS___PHAsset,  "fetchCuratedAssetsInAssetCollection:",  a1[5]));
    id v5 = [v4 countOfAssetsWithMediaType:1];
    id v6 = [v4 countOfAssetsWithMediaType:2];
    v20[0] = PHMemoryCurationAvailabilityOptionImageCountKey;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
    v21[0] = v7;
    v20[1] = PHMemoryCurationAvailabilityOptionVideoCountKey;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6));
    v21[1] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));

    id v10 = a1[5];
    id v11 = [v10 currentCurationLengthWithOptions:v9];
    [WeakRetained previewSizeInPixels];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fetchPreviewAssetForLength:targetSize:", v11));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10004A5B4;
    v14[3] = &unk_1000CB758;
    objc_copyWeak(&v19, v2);
    id v15 = v12;
    id v16 = a1[5];
    id v17 = a1[4];
    id v18 = a1[6];
    id v13 = v12;
    dispatch_async(&_dispatch_main_q, v14);

    objc_destroyWeak(&v19);
  }
}

void sub_10004A5B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained previewAssetCache]);
      [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
    }

    if (([*(id *)(a1 + 48) isCancelled] & 1) == 0 && *(void *)(a1 + 56))
    {
      [*(id *)(a1 + 48) setCompletedUnitCount:1];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }
  }
}

void sub_10004A844(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0 && *(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setCompletedUnitCount:1];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_10004A8A4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
  [v2 cancelImageRequest:*(unsigned int *)(a1 + 32)];
}

void sub_10004AA64(_Unwind_Exception *a1)
{
}

void sub_10004AA84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    unsigned __int8 v3 = [*(id *)(a1 + 32) isCancelled];
    id WeakRetained = v4;
    if ((v3 & 1) == 0)
    {
      if (*(void *)(a1 + 40))
      {
        [*(id *)(a1 + 32) setCompletedUnitCount:1];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        id WeakRetained = v4;
      }
    }
  }
}

id sub_10004AAF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

id sub_10004BC58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVisualState];
}

void sub_10004BF00(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"checkmark"));
  uint64_t v2 = (void *)qword_1001032E8;
  qword_1001032E8 = v1;
}

uint64_t TVPPreferencesHasWelcomeScreenDisplayed()
{
  return PXPreferencesGetBool(@"WelcomeScreenDisplayed", 0LL);
}

uint64_t TVPPreferencesSetWelcomeScreenDisplayed(uint64_t a1)
{
  return PXPreferencesSetBool(@"WelcomeScreenDisplayed", a1);
}

void sub_10004C9E4(uint64_t a1)
{
  uint64_t v2 = MSPlatform();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v4 theDaemon]);
  [v3 forgetPersonID:*(void *)(a1 + 32)];
}

void sub_10004CAAC(uint64_t a1, void *a2)
{
  id v9 = a2;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v9 _imageTokenForAssetID:*(void *)(a1 + 32)]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVPAsset, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v7 = (void *)objc_opt_class(*(void *)(a1 + 40), v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 assetID]);
    [v7 _cancelFetchForAccessObject:v9 assetID:v8];
  }
}

void sub_10004CC4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accessObject]);
  LODWORD(v4) = [v4 isEqual:v5];

  if ((_DWORD)v4) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void sub_10004CCB8(id a1, TVPImageFetchRecord *a2, unint64_t a3, BOOL *a4)
{
  id v6 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageFetchRecord completionHandler](v6, "completionHandler"));

  if (v4)
  {
    uint64_t v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[TVPImageFetchRecord completionHandler](v6, "completionHandler"));
    v5[2](v5, 0LL);
  }
}

uint64_t sub_10004CE10(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10004CFC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_10004D010(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10004D020(uint64_t a1)
{
}

void sub_10004D028(uint64_t a1, void *a2)
{
  id v17 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v17 metadata]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMSAssetMetadataPixelWidthKey]);
  id v6 = [v5 unsignedLongValue];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v17 metadata]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kMSAssetMetadataPixelHeightKey]);
  id v9 = [v8 unsignedLongValue];

  if (([v17 representsVideo] & 1) == 0)
  {
    unint64_t v10 = (void)v9 * (void)v6;
    if (4LL * (void)v9 * (void)v6 <= (unint64_t)*(int *)(a1 + 64))
    {
      if (*(float *)(a1 + 68) >= (float)v10)
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
        if (v10 <= *(void *)(v14 + 24)) {
          goto LABEL_12;
        }
        *(void *)(v14 + 24) = v10;
        uint64_t v13 = *(void *)(a1 + 56);
      }

      else
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
        if (v10 >= *(void *)(v12 + 24)) {
          goto LABEL_12;
        }
        *(void *)(v12 + 24) = v10;
        uint64_t v13 = *(void *)(a1 + 40);
      }

      uint64_t v15 = *(void *)(v13 + 8);
      id v16 = v17;
      id v11 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v16;
      goto LABEL_11;
    }

    if (_TVSLogInternalLogLevel >= 5)
    {
      pthread_main_np();
      pthread_self();
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 type]);
      _TVSLogBase(v2, &_os_log_default, 1LL, 0LL, 5LL, @"P");
LABEL_11:
    }
  }

LABEL_12:
}

void sub_10004D2A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10004D2B8(uint64_t a1, void *a2)
{
  id v11 = a2;
  unsigned int v4 = [v11 representsVideo];
  uint64_t v5 = v11;
  if (v4)
  {
    id v6 = [v11 mediaAssetType];
    uint64_t v7 = 3LL;
    if (v6 != (id)7) {
      uint64_t v7 = v6 == (id)6;
    }
    if (v6 == (id)4) {
      unint64_t v8 = 2LL;
    }
    else {
      unint64_t v8 = v7;
    }
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mediaAssetType];
    if (v9 == (id)4)
    {
      unint64_t v10 = 2LL;
    }

    else if (v9 == (id)7)
    {
      unint64_t v10 = 3LL;
    }

    else
    {
      unint64_t v10 = v9 == (id)6;
    }

    uint64_t v5 = v11;
    if (v8 > v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
      uint64_t v5 = v11;
    }
  }
}

void sub_10004D5CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10004D5E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    id v3 = v6;
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void sub_10004D644(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8 = a2;
  if (([v8 isActive] & 1) == 0)
  {
    unsigned int v7 = [v8 priority];
    if (v7 < [*(id *)(a1 + 32) priority])
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
      *a4 = 1;
    }
  }
}

id sub_10004D998(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessObject]);
  if ([v4 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 assetID]);
    id v6 = [v5 isEqualToString:*(void *)(a1 + 40)];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

void sub_10004DA10(id a1, TVPImageFetchRecord *a2, unint64_t a3, BOOL *a4)
{
  id v6 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageFetchRecord completionHandler](v6, "completionHandler"));

  if (v4)
  {
    uint64_t v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[TVPImageFetchRecord completionHandler](v6, "completionHandler"));
    v5[2](v5, 0LL);
  }
}

uint64_t sub_10004DB34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_10:
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

void sub_10004DD90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_10004DDC8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8 = a2;
  if ([v8 isActive])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  }

  else
  {
    if ([*(id *)(a1 + 32) count] && *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) firstObject]);
      unsigned int v7 = [v6 priority];
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7 == [v8 priority];
    }

    [*(id *)(a1 + 32) addObject:v8];
  }

  if ([*(id *)(a1 + 32) count] == (id)2) {
    *a4 = 1;
  }
}

uint64_t sub_10004DE9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 accessObject]);
  if (!v7) {
    sub_100079E08();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accessObject]);
  unsigned int v9 = [v8 isEqual:*(void *)(a1 + 32)];

  if (v9) {
    [*(id *)(a1 + 40) addObject:v5];
  }

  return v9 ^ 1;
}

id sub_10004DF34(id a1, TVPImageFetchRecord *a2, unint64_t a3)
{
  id v3 = a2;
  -[TVPImageFetchRecord setIsActive:](v3, "setIsActive:", 1LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageFetchRecord imageToken](v3, "imageToken"));

  return v4;
}

id sub_10004E05C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessObject]);
  if ([v4 isEqual:*(void *)(a1 + 32)])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 imageToken]);
    id v6 = [v5 isEqual:*(void *)(a1 + 40)];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

uint64_t sub_10004E208(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10004E354(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) runSetup];
}

id sub_10004E41C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
  return [*(id *)(a1 + 32) tearDown];
}

void sub_10004E4D0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessObject]);
  if (v2)
  {
    id v3 = v2;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    uint64_t v2 = v3;
  }
}

void sub_10004F254(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v17 = a2;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 superview]);
  uint64_t v12 = *(void **)(a1 + 32);

  if (v11 != v12)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"TVPSharedPSActivityBannerView.m", 223, @"Invalid parameter not satisfying: %@", @"subview.superview == overlayView" object file lineNumber description];
  }

  if (*(_BYTE *)(a1 + 88))
  {
    a3 = PXRectByFlippingHorizontallyInRect( a3,  a4,  a5,  a6,  *(double *)(a1 + 56),  *(double *)(a1 + 64),  *(double *)(a1 + 72),  *(double *)(a1 + 80));
    a4 = v13;
    a5 = v14;
    a6 = v15;
  }

  objc_msgSend(v17, "setFrame:", a3, a4, a5, a6);
}

void sub_10005068C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_1000506BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000506CC(uint64_t a1)
{
}

void sub_1000506D4(void *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unsigned int v7 = (void *)a1[4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a2 localIdentifier]);
  LODWORD(v7) = [v7 isEqualToString:v8];

  if ((_DWORD)v7)
  {
    id v9 = [*(id *)(a1[5] + 24) indexOfObject:a1[6]];
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](&OBJC_CLASS___NSIndexPath, "indexPathForRow:inSection:", a3, v9));
      uint64_t v11 = *(void *)(a1[7] + 8LL);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }

    *a4 = 1;
  }

void sub_100051EA0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100051ECC(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100051F84;
  block[3] = &unk_1000CBA90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_100051F84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _displayPlaybackViewControllerWithPlayerItem:*(void *)(a1 + 32) asset:*(void *)(a1 + 40)];
}

void sub_100052540( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

uint64_t sub_1000525A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000525B0(uint64_t a1)
{
}

void sub_1000525B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) tag] == *(id *)(a1 + 48))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PHImageErrorKey]);
    if (v7) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) displayError];
    }
    if (v5)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000526EC;
      v9[3] = &unk_1000CBAE0;
      id v8 = *(void **)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 40);
      v13[1] = v8;
      id v10 = v5;
      objc_copyWeak(v13, &location);
      id v11 = v6;
      dispatch_async(&_dispatch_main_q, v9);

      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
}

void sub_1000526EC(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) tag] == *(id *)(a1 + 64))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) displayLivePhoto:*(void *)(a1 + 32)];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v3 = objc_claimAutoreleasedReturnValue([WeakRetained view]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) livePhotoGestureRecognizer]);
    [(id)v3 addGestureRecognizer:v4];

    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:PHImageResultIsDegradedKey]);
    LOBYTE(v3) = [v5 BOOLValue];

    if ((v3 & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setProgress:1.0];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) hideProgress];
    }
  }

void sub_1000527E4(void *a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(*(void *)(a1[4] + 8) + 40) tag];
  id v4 = v5;
  if (v5 && v3 == (id)a1[6] && !*(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    [*(id *)(*(void *)(a1[4] + 8) + 40) displayImage:v5];
    id v4 = v5;
  }
}

void sub_10005285C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PHImageErrorKey]);
  if (v7) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) displayError];
  }
  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100052948;
    block[3] = &unk_1000CBB58;
    uint64_t v12 = *(void *)(a1 + 48);
    __int128 v11 = *(_OWORD *)(a1 + 32);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(&_dispatch_main_q, block);
  }
}

void sub_100052948(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) tag] == *(id *)(a1 + 64))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) displayAnimatedImage:*(void *)(a1 + 32)];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:PHImageResultIsDegradedKey]);
    unsigned __int8 v3 = [v2 BOOLValue];

    if ((v3 & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setProgress:1.0];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) hideProgress];
    }
  }

void sub_100052A08(void *a1, void *a2)
{
  id v6 = a2;
  id v4 = [*(id *)(*(void *)(a1[4] + 8) + 40) tag];
  id v5 = v6;
  if (v6 && v4 == (id)a1[7] && !*(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a2);
    [*(id *)(*(void *)(a1[4] + 8) + 40) displayAutoloopVideo:0 placeholderImage:v6];
    id v5 = v6;
  }
}

void sub_100052A9C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(*(void *)(a1[4] + 8) + 40) tag] == (id)a1[7])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PHImageErrorKey]);
    if (v7) {
      [*(id *)(*(void *)(a1[4] + 8) + 40) displayError];
    }
    if (v5)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100052BAC;
      v10[3] = &unk_1000CBBD0;
      uint64_t v15 = a1[7];
      __int128 v13 = *((_OWORD *)a1 + 2);
      id v8 = v5;
      uint64_t v9 = a1[6];
      id v11 = v8;
      uint64_t v14 = v9;
      id v12 = v6;
      dispatch_async(&_dispatch_main_q, v10);
    }
  }
}

void sub_100052BAC(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) tag] == *(id *)(a1 + 72))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) displayAutoloopVideo:*(void *)(a1 + 32) placeholderImage:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:PHImageResultIsDegradedKey]);
    unsigned __int8 v3 = [v2 BOOLValue];

    if ((v3 & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setProgress:1.0];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) hideProgress];
    }
  }

void sub_100052C78(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) tag] == *(id *)(a1 + 40))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:PHImageErrorKey]);
    if (v6) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) displayError];
    }
    if (v9)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) displayImage:v9];
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:PHImageResultIsDegradedKey]);
      unsigned __int8 v8 = [v7 BOOLValue];

      if ((v8 & 1) == 0)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setProgress:1.0];
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) hideProgress];
      }
    }
  }
}

void sub_100052D84(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) tag];
  id v4 = v7;
  if (v7 && v3 == *(id *)(a1 + 56))
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "displayImage:");
    id v5 = *(_BYTE **)(a1 + 32);
    if (v5[32])
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) displayVideoLoadingSpinnerOverlay];
      [*(id *)(a1 + 32) startVideoPlaybackForItem:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) setStartVideoPlaybackOnLoad:0];
LABEL_7:
      id v4 = v7;
      goto LABEL_8;
    }

    unsigned __int8 v6 = [v5 isVideoAssetDownloading];
    id v4 = v7;
    if ((v6 & 1) == 0)
    {
      [*(id *)(a1 + 32) _updateVideoOverlayForItemView:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      goto LABEL_7;
    }
  }

void sub_100052E44(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
  id v1 = [v2 popViewControllerAnimated:0];
}

void sub_10005306C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[1];
  id v3 = (id)objc_claimAutoreleasedReturnValue([v1 focusedAsset]);
  objc_msgSend(v1, "_configureFavoriteAction:isFavorite:", v2, objc_msgSend(v3, "isFavorite"));
}

id sub_1000532BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) performReloadOnLibraryChangeNotificationIfRequired:*(void *)(a1 + 40)];
}

void sub_100053948( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id a24, char a25)
{
}

void sub_1000539AC(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) ^= 1u;
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _updateFavoriteOnAsset:*(void *)(a1 + 32) favorite:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) action:v4];
}

void sub_100053A20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained player]);
  __int128 v3 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v2 seekToTime:&v3];
}

void sub_100053C5C(_Unwind_Exception *a1)
{
}

void sub_100053C80(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[PHAssetChangeRequest changeRequestForAsset:]( &OBJC_CLASS___PHAssetChangeRequest,  "changeRequestForAsset:",  *(void *)(a1 + 32)));
  [v2 setFavorite:*(unsigned __int8 *)(a1 + 40)];
}

void sub_100053CC8(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100053E18;
    block[3] = &unk_1000CBCC0;
    objc_copyWeak(&v11, (id *)(a1 + 48));
    id v10 = *(id *)(a1 + 32);
    char v12 = *(_BYTE *)(a1 + 56);
    dispatch_async(&_dispatch_main_q, block);

    objc_destroyWeak(&v11);
  }

  else if (_TVSLogInternalLogLevel >= 3)
  {
    uint64_t v7 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localIdentifier]);
    _TVSLogBase(v3, &_os_log_default, 65LL, 0LL, 3LL, v7);
  }
}

void sub_100053E18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _configureFavoriteAction:*(void *)(a1 + 32) isFavorite:*(unsigned __int8 *)(a1 + 48)];
}

void sub_1000544F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAVResourcesReclaimationEvent];
}

void sub_1000555B4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachingManager]);
  [v2 stopPrefetchingAssets];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40LL), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _cancelExistingTimer];
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  *(void *)(a1 + 32),  "_didFinishTimedInterval:",  0LL,  0LL,  1.5));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 88);
  *(void *)(v4 + 8_Block_object_dispose((const void *)(v51 - 152), 8) = v3;
}

void sub_100056124(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a3;
  id v11 = a2;
  id v12 = [a4 copy];
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 16);
  *(void *)(v13 + 16) = v12;

  id v15 = [v9 copy];
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(v16 + 24);
  *(void *)(v16 + 24) = v15;

  id v18 = -[TVPFetchManager initWithFetchResult:](objc_alloc(&OBJC_CLASS___TVPFetchManager), "initWithFetchResult:", v11);
  uint64_t v19 = *(void *)(a1 + 32);
  char v20 = *(void **)(v19 + 64);
  *(void *)(v19 + 64) = v18;

  __int128 v21 = -[TVPFetchManager initWithFetchResult:](objc_alloc(&OBJC_CLASS___TVPFetchManager), "initWithFetchResult:", v10);
  uint64_t v22 = *(void *)(a1 + 32);
  __int128 v23 = *(void **)(v22 + 72);
  *(void *)(v22 + 72) = v21;

  if ([*(id *)(a1 + 32) _isSharedAlbumContentAvailable])
  {
    [*(id *)(a1 + 32) _dismissLoadingView];
    [*(id *)(a1 + 32) _layoutSharedAlbumsView];
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sharedAlbumsCachingManager]);
    [v24 startPrefetchingAssets];

    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) subscribedAlbumsCachingManager]);
    [v25 startPrefetchingAssets];

    [*(id *)(a1 + 32) _loadUpActivityAssetsAndPopulateBanner];
  }

  else
  {
    dispatch_time_t v26 = dispatch_time(0LL, (uint64_t)(60.0 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000562F8;
    block[3] = &unk_1000C9528;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v26, &_dispatch_main_q, block);
  }

void sub_1000562F8(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _isSharedAlbumContentAvailable] & 1) == 0)
  {
    [*(id *)(a1 + 32) _dismissLoadingView];
    id v16 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
    [v2 bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"TVPSharedAlbumsEmptyTitle" value:&stru_1000CC6C8 table:0]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"TVPSharedAlbumsEmptyMessage" value:&stru_1000CC6C8 table:0]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewWithBounds:title:messageFormat:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewWithBounds:title:messageFormat:",  v12,  v14,  v4,  v6,  v8,  v10));
    [v16 addSubview:v15];
  }

void sub_100056A50(uint64_t a1, void *a2)
{
  id v7 = a2;
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cellIdentifier]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localIdentifier]);
  unsigned int v5 = [v3 isEqualToString:v4];

  double v6 = v7;
  if (v7 && v5)
  {
    [*(id *)(a1 + 32) setPhotoImage:v7];
    [*(id *)(a1 + 32) setTag:0];
    double v6 = v7;
  }
}

LABEL_17:
}
}

void sub_10005702C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) rootFetchResult]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 72) rootFetchResult]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) changeDetailsForFetchResult:v2]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) changeDetailsForFetchResult:v3]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v2 photoLibrary]);
  if (v4 | v5)
  {
    if (v4)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 64) fetchManagerByApplyingChange:*(void *)(a1 + 40)]);
      uint64_t v8 = *(void *)(a1 + 32);
      double v9 = *(void **)(v8 + 64);
      *(void *)(v8 + 64) = v7;
      id v10 = v7;

      uint64_t v11 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) rootFetchResult]);
      id v2 = (void *)v11;
    }

    if (v5)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 72) fetchManagerByApplyingChange:*(void *)(a1 + 40)]);
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(v13 + 72);
      *(void *)(v13 + 72) = v12;
      id v15 = v12;

      uint64_t v16 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 72) rootFetchResult]);
      double v3 = (void *)v16;
    }
  }

  else if (([*(id *)(a1 + 32) _hasSharedAlbumsWithPendingInvitationsInPhotoLibrary:v6] & 1) == 0)
  {
    goto LABEL_9;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sharedAlbumsCachingManager]);
  [v17 stopPrefetchingAssets];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) subscribedAlbumsCachingManager]);
  [v18 stopPrefetchingAssets];

  uint64_t v19 = *(void **)(a1 + 32);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  void v20[2] = sub_10005721C;
  v20[3] = &unk_1000CBD48;
  void v20[4] = v19;
  [v19 _loadSharedStreamContentFromFetchResult:v2 photoStreamFetchResult:v3 completion:v20];
LABEL_9:
}

void sub_10005721C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000572C8;
  block[3] = &unk_1000CA1B0;
  void block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_sync(&_dispatch_main_q, block);
}

void sub_1000572C8(id *a1)
{
  id v2 = [a1[5] copy];
  double v3 = a1[4];
  uint64_t v4 = (void *)v3[2];
  v3[2] = v2;

  id v5 = [a1[6] copy];
  id v6 = a1[4];
  id v7 = (void *)v6[3];
  v6[3] = v5;

  if ([a1[4] _isSharedAlbumContentAvailable])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1[4] loadingView]);
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 superview]);

    id v10 = a1[4];
    if (v9)
    {
      [v10 _dismissLoadingView];
      [a1[4] _layoutSharedAlbumsView];
    }

    else
    {
      v10[8] = 1;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([a1[4] view]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVPUIUtilities photoLibraryEmptyViewInView:]( &OBJC_CLASS___TVPUIUtilities,  "photoLibraryEmptyViewInView:",  v11));

      if (v12) {
        [v12 removeFromSuperview];
      }
      if (!*((void *)a1[4] + 12))
      {
        uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  3.0));
        uint64_t v14 = a1[4];
        id v15 = (void *)v14[12];
        v14[12] = v13;
      }
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1[4] sharedAlbumsCachingManager]);
    [v16 startPrefetchingAssets];

    id v17 = (id)objc_claimAutoreleasedReturnValue([a1[4] subscribedAlbumsCachingManager]);
    [v17 startPrefetchingAssets];
  }

void sub_100057834(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 librarySpecificFetchOptions]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  1LL,  101LL,  v3));

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 librarySpecificFetchOptions]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  1LL,  100LL,  v5));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100057964;
  v11[3] = &unk_1000CBD98;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v4;
  id v9 = v6;
  id v10 = v4;
  [v7 _loadSharedStreamContentFromFetchResult:v10 photoStreamFetchResult:v9 completion:v11];
}

void sub_100057964(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057A48;
  block[3] = &unk_1000CBD70;
  id v14 = a1[6];
  id v10 = a1[4];
  id v11 = a1[5];
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_sync(&_dispatch_main_q, block);
}

uint64_t sub_100057A48(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16LL))( a1[8],  a1[4],  a1[5],  a1[6],  a1[7]);
}

LABEL_33:
    id v9 = &ACAccountStoreDidChangeNotification_ptr;
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v75 bounds];
    CGRect v77 = v76;

    CGRect v78 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities sharedPhotoStreamCollectionViewWithDataSource:delegate:itemSize:contentInset:frame:]( &OBJC_CLASS___TVPPhotoUtilities,  "sharedPhotoStreamCollectionViewWithDataSource:delegate:itemSize:contentInset:frame:",  self,  self,  308.0,  308.0,  0.0,  *((double *)v59 + 362),  0.0,  *((double *)v59 + 362),  0LL,  v65 + 12.0,  v77,  0x4073700000000000LL));
    objc_msgSend( v78,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(TVPSharedPSAlbumDescriptionView, v79),  @"albumGridIdentifier");
    [v78 setTag:0];
    [v3 addSubview:v78];
    v80 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSMainViewController subscribedAlbumsCachingManager]( self,  "subscribedAlbumsCachingManager"));
    [v80 setCollectionView:v78];

    id v6 = v65 + 323.0;
    id v10 = v59;
  }

  v81 = (void *)objc_claimAutoreleasedReturnValue([(id)v9[271] mainScreen]);
  [v81 bounds];
  objc_msgSend(v3, "setContentSize:", v82, v6 + *((double *)v10 + 362));
}

void sub_10005852C(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([*(id *)(a1 + 32) count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) firstObject]);
    -[NSMutableArray addObject:](v2, "addObject:", v5);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) photoLibrary]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000586CC;
  v18[3] = &unk_1000CA268;
  id v7 = *(void **)(a1 + 40);
  void v18[4] = *(void *)(a1 + 48);
  id v19 = v6;
  id v20 = v7;
  id v8 = v3;
  __int128 v21 = v8;
  id v9 = v6;
  [v9 performBlockAndWait:v18];
  id v10 = *(void **)(a1 + 56);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10005881C;
  v14[3] = &unk_1000CBDC0;
  id v15 = v2;
  uint64_t v16 = v8;
  id v17 = v4;
  id v11 = v4;
  id v12 = v8;
  id v13 = v2;
  [v10 enumerateObjectsUsingBlock:v14];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void sub_1000586CC(uint64_t a1)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_sharedAlbumsInPhotoLibrary:", *(void *)(a1 + 40), 0));
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cloudRelationshipState]);
        unsigned int v9 = [v8 intValue];

        if (v9 == 1)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection pl_PHAssetCollectionForAssetContainer:photoLibrary:]( &OBJC_CLASS___PHAssetCollection,  "pl_PHAssetCollectionForAssetContainer:photoLibrary:",  v7,  *(void *)(a1 + 48)));
          [*(id *)(a1 + 56) addObject:v10];
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }
}

void sub_10005881C(uint64_t a1, void *a2)
{
  id v5 = a2;
  unsigned int v3 = [v5 isOwnedCloudSharedAlbum];
  uint64_t v4 = 40LL;
  if (v3) {
    uint64_t v4 = 32LL;
  }
  [*(id *)(a1 + v4) addObject:v5];
  [*(id *)(a1 + 48) addObject:v5];
}

PHFetchResult *sub_1000589B0(uint64_t a1)
{
  return +[PHAsset fetchKeyAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchKeyAssetsInAssetCollection:options:",  *(void *)(a1 + 32),  0LL);
}

void sub_100058AD4(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) rootFetchResult]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100058C34;
  v9[3] = &unk_1000CBE38;
  uint64_t v4 = v2;
  id v10 = v4;
  [v3 enumerateObjectsUsingBlock:v9];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100058CCC;
  v6[3] = &unk_1000CBE60;
  objc_copyWeak(&v7, &location);
  void v6[4] = *(void *)(a1 + 32);
  +[TVPUIUtilities activityBannerImageFromAssets:imageManager:completion:]( &OBJC_CLASS___TVPUIUtilities,  "activityBannerImageFromAssets:imageManager:completion:",  v4,  v5,  v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void sub_100058C18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100058C34(uint64_t a1, uint64_t a2)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[PHAsset fetchKeyAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchKeyAssetsInAssetCollection:options:",  a2,  0LL));
  if ((unint64_t)[*(id *)(a1 + 32) count] <= 2)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    if (v3)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
      [v4 addObject:v5];
    }
  }
}

void sub_100058CCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058D74;
  block[3] = &unk_1000CBA90;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
}

void sub_100058D74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 32))
  {
    id v4 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained bannerView]);
    [v3 setBannerImage:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) setNeedsFocusUpdate];
    id WeakRetained = v4;
  }
}

void sub_1000591A4(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005922C;
  _OWORD v5[3] = &unk_1000CBE88;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  +[PLPhotoSharingHelper acceptPendingInvitationForAlbum:completionHandler:]( &OBJC_CLASS___PLPhotoSharingHelper,  "acceptPendingInvitationForAlbum:completionHandler:",  v2,  v5);
}

void sub_10005922C(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v3 = objc_alloc(&OBJC_CLASS___TVPPhotoLibraryAlbumViewController);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) libraryFilterState]);
    uint64_t v7 = -[TVPPhotoLibraryAlbumViewController initWithAlbum:libraryFilterState:]( v3,  "initWithAlbum:libraryFilterState:",  v4,  v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) navigationController]);
    [v6 pushViewController:v7 animated:1];
  }

void sub_1000592BC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  *(void *)(*(void *)(a1 + 40) + 24LL)));
  [v2 removeObject:*(void *)(a1 + 48)];
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view", 0));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 subviews]);

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v16;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        __int128 v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v12);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___TVPCollectionView, v9);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0 && ![v13 tag]) {
          [v13 reloadData];
        }
        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }
}

void sub_10005950C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100059524(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_sharedAlbumsInPhotoLibrary:", *(void *)(a1 + 40), 0));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)i) cloudRelationshipState]);
        unsigned int v8 = [v7 intValue];

        if (v8 == 1)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

void sub_10005A66C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[6];
  id v9 = a2;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 photoLibrary]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[PHCollectionList transientCollectionListWithCollections:title:identifier:photoLibrary:]( &OBJC_CLASS___PHCollectionList,  "transientCollectionListWithCollections:title:identifier:photoLibrary:",  v8,  0LL,  0LL,  v10));

  CGImageRef v46 = (void *)v11;
  uint64_t v12 = objc_claimAutoreleasedReturnValue( +[PHCollectionList fetchCollectionsInCollectionList:options:]( &OBJC_CLASS___PHCollectionList,  "fetchCollectionsInCollectionList:options:",  v11,  0LL));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PHCollectionList transientCollectionListWithCollections:title:identifier:photoLibrary:]( &OBJC_CLASS___PHCollectionList,  "transientCollectionListWithCollections:title:identifier:photoLibrary:",  v6,  0LL,  0LL,  v13));

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[PHCollectionList fetchCollectionsInCollectionList:options:]( &OBJC_CLASS___PHCollectionList,  "fetchCollectionsInCollectionList:options:",  v14,  0LL));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) changedObjects]);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v16));

  [v17 unionSet:*(void *)(a1 + 48)];
  double v47 = v6;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  [v17 intersectSet:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
  CGFloat v45 = (void *)v12;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[PHFetchResultChangeDetails changeDetailsFromFetchResult:toFetchResult:changedObjects:]( &OBJC_CLASS___PHFetchResultChangeDetails,  "changeDetailsFromFetchResult:toFetchResult:changedObjects:",  v12,  v15,  v19));

  unsigned __int8 v49 = (void *)objc_claimAutoreleasedReturnValue([v20 removedIndexes]);
  CGFloat v48 = (void *)objc_claimAutoreleasedReturnValue([v20 insertedIndexes]);
  __int128 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 changedIndexes]);
  -[NSMutableIndexSet addIndexes:](v21, "addIndexes:", v22);

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachingManager]);
  [v23 stopPrefetchingAssets];

  __int128 v24 = -[TVPFetchManager initWithFetchResult:](objc_alloc(&OBJC_CLASS___TVPFetchManager), "initWithFetchResult:", v9);
  uint64_t v25 = *(void *)(a1 + 32);
  dispatch_time_t v26 = *(void **)(v25 + 32);
  *(void *)(v25 + 32) = v24;

  id v27 = *(id *)(*(void *)(a1 + 32) + 48LL);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48LL), a3);
  id v28 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  id v29 = *(void **)(a1 + 32);
  if (v28)
  {
    [v29 _dismissAllLoadingAndEmptyViews];
    if ([v20 hasIncrementalChanges]
      && ([v20 hasMoves] & 1) == 0
      && objc_msgSend(*(id *)(a1 + 32), "px_isVisible"))
    {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath px_indexPathsForItems:inSection:]( &OBJC_CLASS___NSIndexPath,  "px_indexPathsForItems:inSection:",  v49,  0LL));
      double v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath px_indexPathsForItems:inSection:]( &OBJC_CLASS___NSIndexPath,  "px_indexPathsForItems:inSection:",  v48,  0LL));
      double v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath px_indexPathsForItems:inSection:]( &OBJC_CLASS___NSIndexPath,  "px_indexPathsForItems:inSection:",  v21,  0LL));
      uint64_t v32 = *(void *)(a1 + 32);
      CGFloat v44 = *(void **)(v32 + 16);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472LL;
      v52[2] = sub_10005AB38;
      v52[3] = &unk_1000CA268;
      id v53 = v30;
      uint64_t v54 = v32;
      id v55 = v27;
      id v56 = v43;
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_10005ACAC;
      v50[3] = &unk_1000CA520;
      v50[4] = *(void *)(a1 + 32);
      id v51 = v31;
      id v33 = v31;
      id v34 = v43;
      id v35 = v30;
      [v44 performBatchUpdates:v52 completion:v50];
    }

    else
    {
      double v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewIfLoaded]);
      double v37 = (void *)objc_claimAutoreleasedReturnValue([v36 window]);

      double v38 = *(id **)(a1 + 32);
      if (v37)
      {
        [v38[2] reloadData];
        double v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachingManager]);
        [v39 startPrefetchingAssets];
      }

      else
      {
        [v38 setNeedsReload:1];
      }
    }
  }

  else
  {
    double v40 = (void *)objc_claimAutoreleasedReturnValue([v29 viewIfLoaded]);
    double v41 = (void *)objc_claimAutoreleasedReturnValue([v40 window]);

    double v42 = *(id **)(a1 + 32);
    if (v41) {
      [v42[2] reloadData];
    }
    else {
      [v42 setNeedsReload:1];
    }
    [*(id *)(a1 + 32) _displayEmptyOrLoadingMessageIfNeeded];
  }
}

id sub_10005AB38(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        id v6 = 0LL;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 64LL);
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 48),  "objectAtIndexedSubscript:",  objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v6), "row", (void)v10)));
          [v7 setObject:0 forKeyedSubscript:v8];

          id v6 = (char *)v6 + 1;
        }

        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v4);
    }

    [*(id *)(*(void *)(a1 + 40) + 16) deleteItemsAtIndexPaths:*(void *)(a1 + 32)];
  }

  id result = objc_msgSend(*(id *)(a1 + 56), "count", (void)v10);
  if (result) {
    return [*(id *)(*(void *)(a1 + 40) + 16) insertItemsAtIndexPaths:*(void *)(a1 + 56)];
  }
  return result;
}

void sub_10005ACAC(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) reloadItemsAtIndexPaths:*(void *)(a1 + 40)];
    id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachingManager]);
    [v3 startPrefetchingAssets];
  }

void sub_10005B0DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005B108(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10005B118(uint64_t a1)
{
}

void sub_10005B120(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) cellIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) localIdentifier]);
  unsigned int v5 = [v3 isEqualToString:v4];

  id v6 = v7;
  if (v7 && v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setPhotoImage:v7];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setTag:0];
    id v6 = v7;
  }
}

PHFetchResult *sub_10005B598(uint64_t a1)
{
  return +[PHCollection fetchCollectionsInCollectionList:options:]( &OBJC_CLASS___PHCollection,  "fetchCollectionsInCollectionList:options:",  *(void *)(a1 + 32),  0LL);
}

id sub_10005B5B0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _libraryFetchOptions]);
  [v2 setFetchLimit:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchKeyAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchKeyAssetsInAssetCollection:options:",  *(void *)(a1 + 40),  v2));

  return v3;
}

void sub_10005B608(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tableThumbnailDataForAsset:v6 dataSpecification:&v10]);

  if (v8)
  {
    id v9 = -[UIImage initWithData:](objc_alloc(&OBJC_CLASS___UIImage), "initWithData:", v8);
    [*(id *)(a1 + 40) setImage:v9 forQuadrant:a3];
  }
}

void sub_10005BCA8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 librarySpecificFetchOptions]);

  [v3 setIncludeScreenRecordingsSmartAlbum:1];
  [v3 setIncludeProResSmartAlbum:1];
  id v4 = *(id *)(*(void *)(a1 + 32) + 56LL);
  if (!v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[PHCollectionList fetchRootAlbumCollectionListWithOptions:]( &OBJC_CLASS___PHCollectionList,  "fetchRootAlbumCollectionListWithOptions:",  v3));
    id v4 = (id)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), v4);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PHCollection fetchCollectionsInCollectionList:options:]( &OBJC_CLASS___PHCollection,  "fetchCollectionsInCollectionList:options:",  v4,  v3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10005BEDC;
  v22[3] = &unk_1000CBF78;
  v22[4] = *(void *)(a1 + 32);
  id v9 = v7;
  id v23 = v9;
  uint64_t v10 = v8;
  __int128 v24 = v10;
  [v6 enumerateObjectsUsingBlock:v22];
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005C090;
  block[3] = &unk_1000CBFA0;
  objc_copyWeak(&v20, &location);
  __int128 v16 = v10;
  id v11 = *(id *)(a1 + 40);
  id v18 = v9;
  id v19 = v11;
  id v17 = v6;
  id v12 = v9;
  id v13 = v6;
  uint64_t v14 = v10;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void sub_10005BEDC(id *a1, void *a2)
{
  id v12 = a2;
  if ([v12 canContainAssets])
  {
    id v4 = v12;
    BOOL v5 = ([v4 assetCollectionType] != (id)2
       || [v4 assetCollectionSubtype] != (id)1000000201
       && [v4 assetCollectionSubtype] != (id)205
       && [v4 assetCollectionSubtype] != (id)206)
      && (uint64_t)[a1[4] _assetCountForCollection:v4] >= 1
      && [v4 assetCollectionType] != (id)9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1[4] libraryStatusProvider]);
    unsigned int v11 = [v10 hasSharedLibrary];

    if (v11)
    {
    }

    else if (!v5)
    {
LABEL_21:

      goto LABEL_22;
    }

    [a1[5] addObject:v4];
    goto LABEL_21;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PHCollectionList, v3);
  if ((objc_opt_isKindOfClass(v12, v6) & 1) != 0)
  {
    id v7 = v12;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1[4] _libraryFetchOptions]);
    [v8 setFetchLimit:1];
    if ([v7 collectionListSubtype] == (id)100)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PHCollection fetchCollectionsInCollectionList:options:]( &OBJC_CLASS___PHCollection,  "fetchCollectionsInCollectionList:options:",  v7,  v8));
      [a1[6] setObject:v9 forKeyedSubscript:v7];
      if ([v9 count]) {
        [a1[5] addObject:v7];
      }
    }

    goto LABEL_21;
  }

uint64_t sub_10005C090(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _folderCountFetchResults]);
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

PHFetchResult *sub_10005C4E4(uint64_t a1)
{
  return +[PHAsset fetchKeyAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchKeyAssetsInAssetCollection:options:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

void sub_10005C5C8(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  id v6 = a2;
  id v7 = -[TVPFetchManager initWithFetchResult:](objc_alloc(&OBJC_CLASS___TVPFetchManager), "initWithFetchResult:", v6);

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48LL), a3);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) albumsListView]);
  [v10 reloadData];

  id v11 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  id v12 = *(void **)(a1 + 32);
  if (v11)
  {
    [v12 _dismissAllLoadingAndEmptyViews];
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachingManager]);
    [v13 startPrefetchingAssets];
  }

  else
  {
    [v12 _displayEmptyOrLoadingMessageIfNeeded];
  }
}

id sub_10005D080(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 assetID]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id sub_10005D32C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSubscriber:*(void *)(a1 + 40)];
}

id sub_10005D3B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didRequestAssetRetrievalForAssetCollections:*(void *)(a1 + 40)];
}

id sub_10005D4D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishRetrievingAsset:*(void *)(a1 + 40) imageData:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_10005D564(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveDeleteForAssetCollections:*(void *)(a1 + 40)];
}

id sub_10005D5C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCompleteCheckForNewAssetCollections];
}

id sub_10005D6F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishDeletingAssetCollection:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void sub_10005D750(uint64_t a1)
{
  uint64_t v2 = MSPlatform();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v6 theDaemon]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appleAccount]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));
  [v3 pollForSubscriptionUpdatesForPersonID:v5];
}

id sub_10005DA4C(id a1, TVPAsset *a2, unint64_t a3)
{
  uint64_t v3 = a2;
  -[TVPAsset setState:](v3, "setState:", 1LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAsset asset](v3, "asset"));

  return v4;
}

void sub_10005DF68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

int64_t sub_10005DF94(id a1, TVPAsset *a2, TVPAsset *a3)
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAsset dateContentCreated](a2, "dateContentCreated"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAsset dateContentCreated](v4, "dateContentCreated"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

uint64_t sub_10005E000(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10005E010(uint64_t a1)
{
}

void sub_10005E018(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a2 asset]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 metadataValueForKey:kMSAssetMetadataFileSizeKey]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v8 unsignedIntegerValue];

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) > 0x11800000uLL
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assets]),
        uint64_t v10 = (char *)[v9 count] - a3,
        v9,
        (unint64_t)v10 >= 0x3E9))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assets]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subarrayWithRange:", 0, a3 + 1));
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }

void sub_10005E2F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

id sub_10005E30C(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 asset]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 masterAssetHash]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) masterAssetHash]);
  id v6 = [v4 isEqualToData:v5];

  return v6;
}

void sub_10005E37C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v5 = (void *)objc_opt_class(*(void *)(a1 + 32), v4);
  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005E468;
  v10[3] = &unk_1000CC0C0;
  id v11 = v6;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v8;
  uint64_t v13 = v9;
  [v5 _postProcessFetchForAccessObject:v7 imageToken:v11 withHandler:v10];

  objc_destroyWeak(&v14);
}

void sub_10005E454(_Unwind_Exception *a1)
{
}

id sub_10005E468(uint64_t a1, _BYTE *a2)
{
  if (*a2)
  {
    [*(id *)(a1 + 32) setState:2];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _updateDBAsset:*(void *)(a1 + 32) newState:2];

    *a2 = 0;
  }

  else if (*(void *)(a1 + 40))
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      if (pthread_main_np()) {
        id v6 = @"Main:";
      }
      else {
        id v6 = &stru_1000CC6C8;
      }
      pthread_t v7 = pthread_self();
      __int128 v15 = @"P";
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetID]);
      uint64_t v13 = v6;
      pthread_t v14 = v7;
      _TVSLogBase(v2, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", v13, v14, v15, v16));
    [v8 removeItemAtPath:*(void *)(a1 + 40) error:0];
  }

  uint64_t v9 = *(void **)(a1 + 48);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 _imageForAssetID:v10]);

  return v11;
}

TVImage *__cdecl sub_10005E5C0(id a1, BOOL *a2)
{
  *a2 = 0;
  return 0LL;
}

id sub_10005E7AC(id a1, MSAssetCollection *a2, unint64_t a3)
{
  return -[MSAssetCollection masterAssetHash](a2, "masterAssetHash", a3);
}

id sub_10005E7B4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 asset]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 masterAssetHash]);
  id v5 = [v2 containsObject:v4];

  return v5;
}

id sub_10005E904(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 masterAssetHash]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 asset]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 masterAssetHash]);
  id v7 = [v4 isEqualToData:v6];

  return v7;
}

id sub_10005EA60(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 assetID]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t sub_10005EE80(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void sub_10005EEA0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v6 = (void *)objc_opt_class(v3, v5);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 assetID]);
  [v6 _cancelFetchForAccessObject:v7 assetID:v8];

  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 assetID]);

  [v9 _purgeImageForAssetID:v10];
}

int64_t sub_10005F428(id a1, TVPAsset *a2, TVPAsset *a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAsset dateContentCreated](a2, "dateContentCreated"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAsset dateContentCreated](v4, "dateContentCreated"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10005FA24(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  uint64_t v2 = (void *)qword_100103348;
  qword_100103348 = (uint64_t)v1;

  [(id)qword_100103348 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  uint64_t v3 = (void *)qword_100103348;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](&OBJC_CLASS___NSTimeZone, "timeZoneForSecondsFromGMT:", 0LL));
  [v3 setTimeZone:v4];
}

void sub_100060000(_Unwind_Exception *a1)
{
}

void sub_100060028(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v15 = 0LL;
      __int128 v16 = &v15;
      uint64_t v17 = 0x3032000000LL;
      id v18 = sub_10005E000;
      id v19 = sub_10005E010;
      id v20 = 0LL;
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      uint64_t v3 = TVAssetDidWriteNotification;
      uint64_t v4 = *(void *)(a1 + 32);
      id v7 = _NSConcreteStackBlock;
      uint64_t v8 = 3221225472LL;
      uint64_t v9 = sub_1000601BC;
      id v10 = &unk_1000CC220;
      id v12 = *(id *)(a1 + 48);
      objc_copyWeak(&v14, (id *)(a1 + 64));
      id v11 = *(id *)(a1 + 32);
      uint64_t v13 = &v15;
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v2 addObserverForName:v3 object:v4 queue:0 usingBlock:&v7]);
      id v6 = (void *)v16[5];
      v16[5] = v5;

      objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40),  "setImageAsset:forKey:inGroupOfType:expiryDate:",  *(void *)(a1 + 40),  *(void *)(a1 + 32),  4,  0,  v7,  v8,  v9,  v10);
      objc_destroyWeak(&v14);

      _Block_object_dispose(&v15, 8);
    }
  }

void sub_100060190( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

void sub_1000601BC(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100060268;
  _OWORD v4[3] = &unk_1000CC1F8;
  id v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = v2;
  uint64_t v7 = v3;
  dispatch_async(&_dispatch_main_q, v4);

  objc_destroyWeak(&v8);
}

void sub_100060268(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _imagePathForAssetID:*(void *)(a1 + 32)]);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

id sub_100060C70(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) performReloadOnLibraryChangeNotificationIfRequired:*(void *)(a1 + 40)];
  return result;
}

id sub_100061038(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "setUserCloudSharedLiked:",  objc_msgSend(*(id *)(a1 + 32), "userCloudSharedLiked") ^ 1);
}

id sub_10006119C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCloudHasUnseenComments:0];
}

id sub_100062E30(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setHidden:*(unsigned __int8 *)(a1 + 40)];
}

id sub_1000634E0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setFocusAvoidanceContentTransform:&v4];
}

id sub_100063534(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  __int128 v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v1 setFocusAvoidanceContentTransform:v4];
}

id sub_1000659D0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:1.0];
}

id sub_1000659E8(uint64_t a1, int a2)
{
  uint64_t v3 = *(id **)(a1 + 32);
  if (!a2) {
    return [v3[2] removeFromSuperview];
  }
  CGAffineTransform v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  CGAffineTransform v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) view]);
  [v4 insertSubview:v5 belowSubview:*(void *)(*(void *)(a1 + 32) + 16)];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100065AF4;
  v8[3] = &unk_1000C9528;
  uint64_t v9 = *(void *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100065B0C;
  v7[3] = &unk_1000C9680;
  void v7[4] = v9;
  return +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v8,  v7,  0.5);
}

id sub_100065AF4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:0.0];
}

id sub_100065B0C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeFromSuperview];
}

id sub_100065D14(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:1.0];
}

void sub_100065D2C(uint64_t a1, int a2)
{
  CGAffineTransform v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) view]);
  [v4 removeFromSuperview];

  [*(id *)(*(void *)(a1 + 32) + 8) removeFromParentViewController];
  if (a2)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100065E48;
    v9[3] = &unk_1000C9528;
    CGAffineTransform v5 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100065E60;
    v7[3] = &unk_1000CC2C0;
    void v7[4] = v10;
    id v8 = v5;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v9,  v7,  0.5);
  }

  else
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeFromSuperview];
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }

id sub_100065E48(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:0.0];
}

uint64_t sub_100065E60(uint64_t a1)
{
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);
  CGAffineTransform v4 = (void *)objc_claimAutoreleasedReturnValue([v3 window]);
  [v4 makeKeyWindow];

  [*(id *)(*(void *)(a1 + 32) + 16) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100066384( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000663A4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Succesfully saved account update",  v6,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100079FA0((uint64_t)v5);
    }
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 4_Block_object_dispose(va, 8) = v5;
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000668D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000668E8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  LOBYTE(v3) = [v5 collectionView:*(void *)(a1 + 32) shouldHandleLongPressForItemAtIndexPath:v4];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)v3;
}

void sub_100066D68(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  [v5 collectionView:*(void *)(a1 + 32) didReceivePhysicalPlayForItemAtIndexPath:v4];
}

void sub_100066E34(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  [v5 collectionView:*(void *)(a1 + 32) didReceiveLongPressForItemAtIndexPath:v4];
}

BOOL sub_100067014(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 && (id v6 = [v4 numberOfSections], objc_msgSend(v3, "section") < v6))
  {
    id v7 = objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(v3, "section"));
    BOOL v8 = [v3 row] < v7;
  }

  else
  {
    BOOL v8 = 0LL;
  }

  return v8;
}

void sub_1000670E4(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVPRootSettings sharedInstance](&OBJC_CLASS___TVPRootSettings, "sharedInstance"));
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 applicationSettings]);
  __int128 v2 = (void *)qword_100103358;
  qword_100103358 = v1;
}

id sub_100069184(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id sub_100069190(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  double v2 = *(double *)(*(void *)(a1 + 40) + 32LL);
  [v1 center];
  return [v1 setCenter:v2];
}

id sub_1000694AC(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentView]);
  objc_msgSend(v2, "_configureItemView:atIndex:", v3, objc_msgSend(*(id *)(a1 + 32), "focusedItemIndex"));

  id result = *(id *)(a1 + 40);
  if (result)
  {
    [result center];
    objc_msgSend(*(id *)(a1 + 40), "setCenter:");
    [*(id *)(a1 + 40) setAlpha:1.0];
    id v5 = *(void **)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentSupplementaryView]);
    [v5 setSpareSupplementaryView:v6];

    return [*(id *)(a1 + 32) setCurrentSupplementaryView:*(void *)(a1 + 40)];
  }

  return result;
}

void sub_1000695E4(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentView]);
  objc_msgSend(v2, "_configureItemView:atIndex:", v3, objc_msgSend(*(id *)(a1 + 32), "focusedItemIndex"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentSupplementaryView]);
  [v4 center];
  double v6 = v5;
  double v8 = v7;

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentSupplementaryView]);
  objc_msgSend(v9, "setCenter:", v6, v8 + 100.0);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentSupplementaryView]);
  [v10 setAlpha:0.0];

  id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) spareSupplementaryView]);
  [v11 setAlpha:0.0];
}

void sub_100069F74(uint64_t a1)
{
  double v2 = *(_BYTE **)(a1 + 32);
  if ((v2[24] & 1) != 0)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([v2 delegate]);
    objc_msgSend( v3,  "oneupView:didFocusItemAtIndex:",  *(void *)(a1 + 32),  objc_msgSend(*(id *)(a1 + 32), "focusedItemIndex"));
  }

void sub_100069FE8(uint64_t a1)
{
  double v2 = *(_BYTE **)(a1 + 32);
  if ((v2[24] & 1) != 0)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([v2 delegate]);
    objc_msgSend( v3,  "oneupView:didFocusItemAtIndex:",  *(void *)(a1 + 32),  objc_msgSend(*(id *)(a1 + 32), "focusedItemIndex"));
  }

void sub_10006A05C(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006A140;
  _OWORD v4[3] = &unk_1000C9528;
  id v5 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v4,  0.3,  0.7);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10006A190;
  v2[3] = &unk_1000C9528;
  id v3 = *(id *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v2,  0.0,  0.7);
}

id sub_10006A140(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.0, 1.0);
  return [v2 setTransform:&v4];
}

id sub_10006A190(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCenter:v2 + 2160.0];
}

id sub_10006A1C4(uint64_t a1)
{
  double v2 = *(_BYTE **)(a1 + 40);
  if ((v2[24] & 1) != 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);
    objc_msgSend( v3,  "oneupView:didFocusItemAtIndex:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 40), "focusedItemIndex"));

    double v2 = *(_BYTE **)(a1 + 40);
  }

  v2[81] = 0;
  return [*(id *)(a1 + 40) _performNextEventTransitionIfRequired];
}

void sub_10006A244(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10006A330;
  _OWORD v5[3] = &unk_1000C9528;
  id v6 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v5,  0.0,  0.7);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10006A384;
  v2[3] = &unk_1000CC3A8;
  id v3 = *(id *)(a1 + 40);
  __int128 v4 = *(_OWORD *)(a1 + 48);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:]( &OBJC_CLASS___UIView,  "addKeyframeWithRelativeStartTime:relativeDuration:animations:",  v2,  0.3,  0.7);
}

id sub_10006A330(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.7, 0.7);
  return [v2 setTransform:&v4];
}

id sub_10006A384(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id sub_10006A394(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v6, 1.0, 1.0);
  [v2 setTransform:&v6];
  id v3 = *(_BYTE **)(a1 + 40);
  if ((v3[24] & 1) != 0)
  {
    CGAffineTransform v4 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
    objc_msgSend( v4,  "oneupView:didFocusItemAtIndex:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 40), "focusedItemIndex"));

    id v3 = *(_BYTE **)(a1 + 40);
  }

  v3[81] = 0;
  return [*(id *)(a1 + 40) _performNextEventTransitionIfRequired];
}

void sub_10006A620( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

id sub_10006A638(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 32LL) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8LL)
                                                                          + 32LL)
                                                              - *(double *)(a1 + 64);
  objc_msgSend( *(id *)(a1 + 40),  "setCenter:",  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32),  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  [*(id *)(a1 + 48) center];
  return [*(id *)(a1 + 48) setCenter:v2 - *(double *)(a1 + 64)];
}

id sub_10006A6A0(uint64_t a1)
{
  double v2 = *(_BYTE **)(a1 + 40);
  if ((v2[24] & 1) != 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);
    objc_msgSend( v3,  "oneupView:didFocusItemAtIndex:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 40), "focusedItemIndex"));

    double v2 = *(_BYTE **)(a1 + 40);
  }

  v2[81] = 0;
  return [*(id *)(a1 + 40) _performNextEventTransitionIfRequired];
}

void sub_10006B2FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10006B314(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  LOBYTE(v3) = [v5 tableView:*(void *)(a1 + 32) shouldHandleLongPressForItemAtIndexPath:v4];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)v3;
}

void sub_10006B5C4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  [v5 tableView:*(void *)(a1 + 32) didReceivePhysicalPlayForItemAtIndexPath:v4];
}

void sub_10006B6C0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  [v5 tableView:*(void *)(a1 + 32) didReceiveLongPressForItemAtIndexPath:v4];
}

void sub_10006CFE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10006CFFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v58 = 0LL;
  __int128 v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  CGSize v61 = sub_10006D51C;
  v62 = sub_10006D52C;
  id v39 = v5;
  id v63 = v39;
  uint64_t v52 = 0LL;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  id v55 = sub_10006D51C;
  id v56 = sub_10006D52C;
  id v57 = v6;
  id v38 = v57;
  id v8 = [v57 count];
  uint64_t v40 = a1;
  if (!v39 && !v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) placeholderImage]);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVPImageStack, v10);
    char isKindOfClass = objc_opt_isKindOfClass(v9, v11);

    if ((isKindOfClass & 1) != 0)
    {
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) placeholderImage]);
      uint64_t v15 = (double *)(*(void *)(a1 + 32) + 32LL);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_10006D534;
      v48[3] = &unk_1000CC400;
      v50 = &v58;
      id v51 = &v52;
      __int128 v16 = v13;
      unsigned __int8 v49 = v16;
      objc_msgSend(v14, "_loadImagesAtSize:scaledSize:completion:", v48, *v15, v15[1], *v15, v15[1]);
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    }
  }

  uint64_t v17 = v59[5];
  [*(id *)(a1 + 40) setFlattenedImage:v17];
  if (v17)
  {
    size_t Width = CGImageGetWidth((CGImageRef)[*(id *)(a1 + 40) flattenedImage]);
    objc_msgSend( *(id *)(a1 + 40), "setSize:", (double)Width, (double)CGImageGetHeight((CGImageRef)objc_msgSend(*(id *)(a1 + 40), "flattenedImage")));
    uint64_t v19 = *(void *)(a1 + 32);
    [*(id *)(a1 + 40) size];
    *(void *)(v19 + 32) = v20;
    *(void *)(v19 + 40) = v21;
  }

  id v22 = (id)v53[5];
  __int128 v24 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v23);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v25 = v22;
  id v26 = [v25 countByEnumeratingWithState:&v44 objects:v64 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v25);
        }
        id v29 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v25 lastObject]);

        uint64_t v32 = (void *)objc_opt_new(&OBJC_CLASS___TVUINamedLayerImage, v31);
        id v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](&OBJC_CLASS___UIImage, "imageWithCGImage:", v29));
        [v32 setImageObj:v33];

        [v32 setImage:v29];
        id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [v25 indexOfObject:v29]));
        [v32 setName:v34];

        objc_msgSend( v32,  "setFrame:",  0.0,  0.0,  *(double *)(*(void *)(v40 + 32) + 32),  *(double *)(*(void *)(v40 + 32) + 40));
        [v32 setOpacity:1.0];
        objc_msgSend(v32, "setBlendMode:", objc_msgSend(WeakRetained, "blendMode"));
        if (v29 == v30) {
          id v35 = [WeakRetained topLayerIsFixedFrame];
        }
        else {
          id v35 = 0LL;
        }
        [v32 setFixedFrame:v35];
        [v24 addObject:v32];
      }

      id v26 = [v25 countByEnumeratingWithState:&v44 objects:v64 count:16];
    }

    while (v26);
  }

  [*(id *)(v40 + 40) setLayers:v24];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006D5BC;
  block[3] = &unk_1000CA1B0;
  double v36 = *(void **)(v40 + 40);
  void block[4] = *(void *)(v40 + 32);
  id v42 = WeakRetained;
  id v43 = v36;
  id v37 = WeakRetained;
  dispatch_async(&_dispatch_main_q, block);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
}

void sub_10006D4CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

uint64_t sub_10006D51C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10006D52C(uint64_t a1)
{
}

void sub_10006D534(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10006D5BC(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) imageStack]);
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    BOOL v4 = +[CATransaction disableActions](&OBJC_CLASS___CATransaction, "disableActions");
    +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48LL), *(id *)(a1 + 48));
    [*(id *)(*(void *)(a1 + 32) + 8) setLayerStack:*(void *)(*(void *)(a1 + 32) + 48)];
    +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 postNotificationName:@"TVPImageStackViewImagesDidUpdateNotification" object:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) setImageLoaded:1];
  }

id sub_10006F4E0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) setAlpha:1.0];
}

id sub_10006F5E8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) setAlpha:1.0];
}

id sub_10006F7A0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) setAlpha:0.0];
}

void sub_10006F7B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0LL;
}

id sub_10006F884(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) setAlpha:0.0];
}

void sub_10006F89C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0LL;
}

void sub_100070274( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000702A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100070388;
  v9[3] = &unk_1000CC450;
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

void sub_100070388(uint64_t a1)
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

void sub_100070A40(id a1, PXMutablePhotosDetailsContext *a2)
{
}

void sub_1000710E0(_Unwind_Exception *a1)
{
}

void sub_1000710FC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) photoLibrary]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 librarySpecificFetchOptions]);

  [v3 setFetchLimit:20];
  id v4 = [*(id *)(a1 + 32) assetCollectionType];
  uint64_t v32 = a1;
  id v33 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4 == (id)4) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchCuratedAssetsInAssetCollection:]( &OBJC_CLASS___PHAsset,  "fetchCuratedAssetsInAssetCollection:",  v5));
  }
  else {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  v5,  v3));
  }
  id v7 = v6;
  id v8 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  id v10 = (void *)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, v9);
  [v10 setNetworkAccessAllowed:1];
  [v10 setDeliveryMode:1];
  id v35 = v10;
  [v10 setLoadingMode:0x10000];
  double v36 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](&OBJC_CLASS___PHImageManager, "defaultManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  uint64_t v31 = v11;
  id v16 = [v11 scale];
  double v18 = PXSizeScale(v16, v13, v15, v17);
  double v20 = v19;
  uint64_t v21 = dispatch_group_create();
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v22 = v7;
  id v23 = [v22 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v23)
  {
    id v24 = v23;
    unint64_t v34 = 0LL;
    uint64_t v25 = *(void *)v45;
LABEL_6:
    uint64_t v26 = 0LL;
    if (v34 <= 0x14) {
      unint64_t v27 = 20 - v34;
    }
    else {
      unint64_t v27 = 0LL;
    }
    while (1)
    {
      if (*(void *)v45 != v25) {
        objc_enumerationMutation(v22);
      }
      if (v27 == v26) {
        break;
      }
      uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * v26);
      dispatch_group_enter(v21);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_100071494;
      v41[3] = &unk_1000CA748;
      id v42 = v8;
      id v43 = v21;
      objc_msgSend( v36,  "requestImageForAsset:targetSize:contentMode:options:resultHandler:",  v28,  0,  v35,  v41,  v18,  v20);

      if (v24 == (id)++v26)
      {
        id v24 = [v22 countByEnumeratingWithState:&v44 objects:v48 count:16];
        v34 += v26;
        if (v24) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  dispatch_time_t v29 = dispatch_time(0LL, 30000000000LL);
  dispatch_group_wait(v21, v29);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007153C;
  block[3] = &unk_1000CBA90;
  objc_copyWeak(&v40, (id *)(v32 + 40));
  id v38 = v8;
  id v39 = *(id *)(v32 + 32);
  uint64_t v30 = v8;
  dispatch_async(&_dispatch_main_q, block);

  objc_destroyWeak(&v40);
}

void sub_100071494(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:PHImageFileURLKey]);
  id v4 = objc_alloc(&OBJC_CLASS___TVImageProxy);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVURLImageLoader sharedInstance](&OBJC_CLASS___TVURLImageLoader, "sharedInstance"));
  id v6 = -[TVImageProxy initWithObject:imageLoader:groupType:](v4, "initWithObject:imageLoader:groupType:", v7, v5, 0LL);

  [*(id *)(a1 + 32) addObject:v6];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10007153C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateViewWithImageProxies:*(void *)(a1 + 32) inCollection:*(void *)(a1 + 40)];
}

void sub_100072168( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location, char a23)
{
}

uint64_t sub_1000721B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000721C8(uint64_t a1)
{
}

void sub_1000721D0(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v2)
  {
    [v2 removeFromSuperview];
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0LL;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeFromSuperview];

  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    id v7 = objc_loadWeakRetained((id *)(a1 + 48));
    [v8 addSubview:v7];
  }

void sub_100072290(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 postNotificationName:@"TVPDeckImageViewReadyNotification" object:*(void *)(a1 + 32)];
}

id sub_100072390(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_1000724E8(_Unwind_Exception *a1)
{
}

void sub_100072504(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) superview]);

  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 40) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0LL;
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40LL), *(id *)(a1 + 40));
  [*(id *)(a1 + 48) removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained addSubview:*(void *)(*(void *)(a1 + 32) + 40)];
}

void sub_100073DF4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[UIViewController px_viewControllerWithSettings:]( &OBJC_CLASS___UIViewController,  "px_viewControllerWithSettings:",  v2));
  [v3 pushViewController:v4 animated:1];
}

void sub_1000743F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100074410(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6 = a2;
  if (a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000744BC;
    v9[3] = &unk_1000C9CC8;
    id v10 = v6;
    id v11 = WeakRetained;
    id v8 = WeakRetained;
    dispatch_async(&_dispatch_main_q, v9);
  }
}

void sub_1000744BC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = objc_claimAutoreleasedReturnValue( +[UIImage imageWithCGImage:]( UIImage, "imageWithCGImage:", [v2 image]));
    [*(id *)(a1 + 40) setImageLoaded:1];
    [*(id *)(a1 + 40) setImage:v3];
  }

void sub_100075438(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetLocalIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localIdentifier]);
  unsigned int v5 = [v3 isEqualToString:v4];

  id v6 = v7;
  if (v7 && v5)
  {
    [*(id *)(a1 + 32) setPhotoImage:v7];
    id v6 = v7;
  }
}

void sub_100075F48(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  *(void *)(a1 + 32),  "_didFinishTimedInterval:",  0LL,  0LL,  1.5));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;
}

id sub_10007634C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_1000767B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  a2,  0LL));
  [v2 addObject:v3];
}

void sub_100076B98( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100076BB4(uint64_t a1, void *a2)
{
  id v26 = a2;
  [v26 size];
  if (v3 > 0.0)
  {
    [v26 size];
    if (v4 > 0.0)
    {
      unsigned int v5 = (id *)(a1 + 32);
      id WeakRetained = objc_loadWeakRetained(v5);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained spinnerView]);
      [v7 stopAnimating];

      id v8 = objc_loadWeakRetained(v5);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 spinnerView]);
      [v9 removeFromSuperview];

      id v10 = objc_loadWeakRetained(v5);
      [v10 setSpinnerView:0];

      [v26 size];
      double v12 = v11;
      [v26 size];
      float v14 = v12 / v13;
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.2f", v14));
      [v15 floatValue];
      float v17 = v16;

      id v18 = objc_loadWeakRetained(v5);
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 oneUpItemView]);
      double v20 = v19;
      if (v17 > 1.77 || v17 < 1.5) {
        uint64_t v22 = 1LL;
      }
      else {
        uint64_t v22 = 2LL;
      }
      [v19 setContentMode:v22];

      id v23 = objc_loadWeakRetained(v5);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 oneUpItemView]);
      [v24 setImage:v26];

      id v25 = objc_loadWeakRetained(v5);
      [v25 _configureVideoBadgeView];
    }
  }
}

void sub_1000775F4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSAlbumSharingDaemon);
  uint64_t v2 = (void *)qword_1001033A8;
  qword_1001033A8 = (uint64_t)v1;
}

void sub_100078EC4(_Unwind_Exception *a1)
{
}

void sub_100078EE4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 2LL;
  [*(id *)(a1 + 32) setTimePerSlide:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) detailTextLabel]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) stringFromTimeInterval:(double)*(uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)]);
  [v3 setText:v2];
}

void sub_100078F6C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 3LL;
  [*(id *)(a1 + 32) setTimePerSlide:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) detailTextLabel]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) stringFromTimeInterval:(double)*(uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)]);
  [v3 setText:v2];
}

void sub_100078FF4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 5LL;
  [*(id *)(a1 + 32) setTimePerSlide:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) detailTextLabel]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) stringFromTimeInterval:(double)*(uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)]);
  [v3 setText:v2];
}

void sub_10007907C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 10LL;
  [*(id *)(a1 + 32) setTimePerSlide:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) detailTextLabel]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) stringFromTimeInterval:(double)*(uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)]);
  [v3 setText:v2];
}

void sub_100079104(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 20LL;
  [*(id *)(a1 + 32) setTimePerSlide:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) detailTextLabel]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) stringFromTimeInterval:(double)*(uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)]);
  [v3 setText:v2];
}

void sub_100079A20()
{
}

void sub_100079A48()
{
}

void sub_100079A70()
{
}

void sub_100079A98()
{
}

void sub_100079AC0()
{
}

void sub_100079AE8()
{
}

void sub_100079B10()
{
}

void sub_100079B38()
{
}

void sub_100079B60()
{
}

void sub_100079B88(uint64_t a1, uint64_t a2)
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a1 object:a2 file:@"TVPMemoriesTabCollectionViewController.m" lineNumber:1074 description:@"Code which should be unreachable has been reached"];

  abort();
}

void sub_100079BDC()
{
}

void sub_100079C04()
{
}

void sub_100079C2C()
{
}

void sub_100079C54()
{
}

void sub_100079C7C(uint64_t a1, uint64_t a2)
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a1 object:a2 file:@"TVPFetchManager.m" lineNumber:46 description:@"Code which should be unreachable has been reached"];

  abort();
}

void sub_100079CD0()
{
}

void sub_100079CF8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "There should only be 1 sections in the datasource.",  v1,  2u);
}

void sub_100079D38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[TVPMemoriesTab] Preview image fetch failed for: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_100079DB8()
{
}

void sub_100079DE0()
{
}

void sub_100079E08()
{
}

void sub_100079E30(uint64_t a1, uint64_t a2)
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a1 object:a2 file:@"TVPPhotoLibraryOneUpViewController.m" lineNumber:724 description:@"Code which should be unreachable has been reached"];

  abort();
}

void sub_100079E84(uint64_t a1, uint64_t a2)
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a1 object:a2 file:@"TVPPhotoLibraryAlbumsListController.m" lineNumber:494 description:@"Code which should be unreachable has been reached"];

  abort();
}

void sub_100079ED8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "unsupported collectionList %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100079F4C(uint64_t a1, uint64_t a2)
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a1 object:a2 file:@"TVPPhotoLibraryAlbumsListController.m" lineNumber:562 description:@"Code which should be unreachable has been reached"];

  abort();
}

void sub_100079FA0(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to save account update %@",  (uint8_t *)&v1,  0xCu);
}

void sub_10007A01C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  int v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[TVPDeckImageView setImageProxies:]"));
  [v0 handleFailureInFunction:v1 file:@"TVPPhotoCollectionPreviewViewController.m" lineNumber:367 description:@"Code which should be unreachable has been reached"];

  abort();
}

id objc_msgSend__loadSharedStreamContentFromFetchResult_photoStreamFetchResult_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadSharedStreamContentFromFetchResult:photoStreamFetchResult:completion:");
}

id objc_msgSend__performScrollTest_iterations_delta_length_scrollAxis_extraResultsBlock_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:");
}

id objc_msgSend__updateFloatingContentControlIsFocused_withAnimationCoordinator_animated_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateFloatingContentControlIsFocused:withAnimationCoordinator:animated:");
}

id objc_msgSend_animateSupplementaryViewsForFocusUpdateInContext_withCoordinator_withKinds_sectionScrollOffsets_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "animateSupplementaryViewsForFocusUpdateInContext:withCoordinator:withKinds:sectionScrollOffsets:");
}

id objc_msgSend_initWithDataSourceManager_mediaProvider_selectionManager_assetActionManager_assetCollectionActionManager_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:");
}

id objc_msgSend_initWithDelegate_libraryFilterState_initialContentFilterState_sharedLibraryStatusProvider_filterControllerOptions_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDelegate:libraryFilterState:initialContentFilterState:sharedLibraryStatusProvider:filterControllerOptions:");
}

id objc_msgSend_initWithPhotosDataSource_displayTitleInfo_parentContext_keyAssetsFetchResult_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:");
}

id objc_msgSend_logSlideshowDidStartWithAssetCountsByPlaybackStyle_repeating_shuffled_defaultSlideDuration_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logSlideshowDidStartWithAssetCountsByPlaybackStyle:repeating:shuffled:defaultSlideDuration:");
}

id objc_msgSend_px_localizedAttributedStringForUserPostWithCountsSet_defaultTextAttributes_subjectName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "px_localizedAttributedStringForUserPostWithCountsSet:defaultTextAttributes:subjectName:");
}

id objc_msgSend_sharedPSAccessObject_albumsDidAddByAlsoAddingViewableAlbums_viewableAlbumsAdded_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPSAccessObject:albumsDidAddByAlsoAddingViewableAlbums:viewableAlbumsAdded:");
}

id objc_msgSend_sharedPSAccessObject_albumsDidRemoveForAlbumIDs_byAlsoRemovingViewableAlbums_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPSAccessObject:albumsDidRemoveForAlbumIDs:byAlsoRemovingViewableAlbums:");
}

id objc_msgSend_sharedPSAccessObject_commentsDidChangeForAssetID_albumID_likeStatusDidChange_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPSAccessObject:commentsDidChangeForAssetID:albumID:likeStatusDidChange:");
}

id objc_msgSend_sharedPSAccessObject_subsribersDidChangeForAlbumID_subscriptionStatusDidChange_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPSAccessObject:subsribersDidChangeForAlbumID:subscriptionStatusDidChange:");
}

id objc_msgSend_sharedPhotoStreamCollectionViewWithDataSource_delegate_itemSize_contentInset_frame_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPhotoStreamCollectionViewWithDataSource:delegate:itemSize:contentInset:frame:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}