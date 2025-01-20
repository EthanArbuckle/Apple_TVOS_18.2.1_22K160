@interface TVPCollectionViewCachingManager
- (BOOL)allowsHorizontalScrolling;
- (CGRect)previousPreheatRect;
- (CGSize)targetSize;
- (NSSet)previousPreheatIndexPaths;
- (TVPCollectionViewCachingManagerDataSource)dataSource;
- (UICollectionView)collectionView;
- (id)requestOptions;
- (int64_t)contentMode;
- (void)_updateCachedAssets;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllowsHorizontalScrolling:(BOOL)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setPreviousPreheatIndexPaths:(id)a3;
- (void)setPreviousPreheatRect:(CGRect)a3;
- (void)stopPrefetchingAssets;
@end

@implementation TVPCollectionViewCachingManager

- (void)dealloc
{
  v3 = NSStringFromSelector("contentOffset");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)v4;
  if (self->_collectionView) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "-setCollectionView: empty keyPath, NOT removing observer for 'contentOffset'",  buf,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "-setCollectionView: removing observer for keyPath '%{public}@'",  buf,  0xCu);
    }

    -[UICollectionView removeObserver:forKeyPath:context:]( self->_collectionView,  "removeObserver:forKeyPath:context:",  self,  v5,  off_1001014D8);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPCollectionViewCachingManager;
  -[TVPCollectionViewCachingManager dealloc](&v8, "dealloc");
}

- (void)setCollectionView:(id)a3
{
  v5 = (UICollectionView *)a3;
  p_collectionView = (id *)&self->_collectionView;
  if (self->_collectionView != v5)
  {
    v7 = NSStringFromSelector("contentOffset");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)v8;
    if (*p_collectionView) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "-setCollectionView: empty keyPath, NOT removing observer for 'contentOffset'",  (uint8_t *)&v14,  2u);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v14 = 138543362;
        v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "-setCollectionView: removing observer for keyPath '%{public}@'",  (uint8_t *)&v14,  0xCu);
      }

      [*p_collectionView removeObserver:self forKeyPath:v9 context:off_1001014D8];
    }

    objc_storeStrong((id *)&self->_collectionView, a3);
    if (*p_collectionView) {
      BOOL v12 = v9 == 0LL;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "-setCollectionView: empty keyPath, NOT adding observer for 'contentOffset'",  (uint8_t *)&v14,  2u);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v14 = 138543362;
        v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "-setCollectionView: adding observer for keyPath '%{public}@'",  (uint8_t *)&v14,  0xCu);
      }

      [*p_collectionView addObserver:self forKeyPath:v9 options:0 context:off_1001014D8];
    }
  }
}

- (void)stopPrefetchingAssets
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPCollectionViewCachingManager;
  -[TVPCachingManager stopPrefetchingAssets](&v3, "stopPrefetchingAssets");
  -[TVPCollectionViewCachingManager setPreviousPreheatIndexPaths:](self, "setPreviousPreheatIndexPaths:", 0LL);
  -[TVPCollectionViewCachingManager setPreviousPreheatRect:]( self,  "setPreviousPreheatRect:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
}

- (CGSize)targetSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout"));
  [v2 itemSize];
  double v4 = v3;
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  id v8 = [v7 scale];
  double v10 = PXSizeScale(v8, v4, v6, v9);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (int64_t)contentMode
{
  return 1LL;
}

- (id)requestOptions
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___PHImageRequestOptions, a2);
  [v2 setNetworkAccessAllowed:1];
  [v2 setDeliveryMode:0];
  [v2 setAllowSecondaryDegradedImage:1];
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001014D8 == a6
    && (double v13 = NSStringFromSelector("contentOffset"),
        double v14 = (void *)objc_claimAutoreleasedReturnValue(v13),
        unsigned int v15 = [v10 isEqualToString:v14],
        v14,
        v15))
  {
    -[TVPCollectionViewCachingManager _updateCachedAssets](self, "_updateCachedAssets");
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___TVPCollectionViewCachingManager;
    -[TVPCollectionViewCachingManager observeValueForKeyPath:ofObject:change:context:]( &v16,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_updateCachedAssets
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView window](self->_collectionView, "window"));

  if (!v3) {
    return;
  }
  -[UICollectionView bounds](self->_collectionView, "bounds");
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  unsigned int v12 = -[TVPCollectionViewCachingManager allowsHorizontalScrolling](self, "allowsHorizontalScrolling");
  CGFloat v13 = v5;
  CGFloat v14 = v7;
  CGFloat v15 = v9;
  CGFloat v16 = v11;
  if (v12)
  {
    double v17 = -CGRectGetWidth(*(CGRect *)&v13);
    double v18 = 0.0;
  }

  else
  {
    double v18 = -CGRectGetHeight(*(CGRect *)&v13);
    double v17 = 0.0;
  }

  v127.origin.double x = v5;
  v127.origin.double y = v7;
  v127.size.double width = v9;
  v127.size.double height = v11;
  CGRect v128 = CGRectInset(v127, v17, v18);
  double x = v128.origin.x;
  double y = v128.origin.y;
  double width = v128.size.width;
  double height = v128.size.height;
  unsigned int v23 = -[TVPCollectionViewCachingManager allowsHorizontalScrolling](self, "allowsHorizontalScrolling");
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  if (v23)
  {
    double MidX = CGRectGetMidX(*(CGRect *)&v24);
    uint64_t v29 = 48LL;
    double v30 = MidX - CGRectGetMidX(self->_previousPreheatRect);
    if (v30 >= 0.0) {
      double v31 = v30;
    }
    else {
      double v31 = -v30;
    }
    -[UICollectionView bounds](self->_collectionView, "bounds");
    if (v31 < CGRectGetWidth(v129) / 3.0) {
      return;
    }
LABEL_15:
    v35 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView tvphotoLibrary_indexPathsForElementsInRect:]( self->_collectionView,  "tvphotoLibrary_indexPathsForElementsInRect:",  x,  y,  width,  height));
    v36 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v35));
    v37 = &ACAccountStoreDidChangeNotification_ptr;
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithSet:]( &OBJC_CLASS___NSMutableSet,  "setWithSet:",  self->_previousPreheatIndexPaths));
    [v38 minusSet:v36];
    if ([v38 count])
    {
      v108 = v36;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager dataSource](self, "dataSource"));
      char v40 = objc_opt_respondsToSelector(v39, "collectionViewCachingManager:assetWithTargetSizeAtIndexPath:");

      if ((v40 & 1) != 0)
      {
        v102 = v35;
        uint64_t v104 = 48LL;
        __int128 v121 = 0u;
        __int128 v122 = 0u;
        __int128 v119 = 0u;
        __int128 v120 = 0u;
        v106 = v38;
        id obj = v38;
        id v41 = [obj countByEnumeratingWithState:&v119 objects:v126 count:16];
        if (v41)
        {
          id v42 = v41;
          uint64_t v113 = *(void *)v120;
          do
          {
            for (i = 0LL; i != v42; i = (char *)i + 1)
            {
              if (*(void *)v120 != v113) {
                objc_enumerationMutation(obj);
              }
              uint64_t v44 = *(void *)(*((void *)&v119 + 1) + 8LL * (void)i);
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager dataSource](self, "dataSource", v102, v104));
              v46 = (void *)objc_claimAutoreleasedReturnValue( [v45 collectionViewCachingManager:self assetWithTargetSizeAtIndexPath:v44]);

              v47 = (void *)objc_claimAutoreleasedReturnValue([v46 allKeys]);
              v48 = (void *)objc_claimAutoreleasedReturnValue([v47 firstObject]);

              if (v48)
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
                v125 = v48;
                v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v125,  1LL));
                v51 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKey:v48]);
                [v51 CGSizeValue];
                double v53 = v52;
                double v55 = v54;
                int64_t v56 = -[TVPCollectionViewCachingManager contentMode](self, "contentMode");
                v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager requestOptions](self, "requestOptions"));
                objc_msgSend(v49, "stopCachingImagesForAssets:targetSize:contentMode:options:", v50, v56, v57, v53, v55);
              }
            }

            id v42 = [obj countByEnumeratingWithState:&v119 objects:v126 count:16];
          }

          while (v42);
        }

        v35 = v102;
        uint64_t v29 = v104;
        v38 = v106;
        v36 = v108;
        v37 = &ACAccountStoreDidChangeNotification_ptr;
      }

      else
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager dataSource](self, "dataSource"));
        char v59 = objc_opt_respondsToSelector(v58, "collectionViewCachingManager:assetsForIndexPaths:");

        v36 = v108;
        if ((v59 & 1) != 0)
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager dataSource](self, "dataSource"));
          v61 = (void *)objc_claimAutoreleasedReturnValue([v60 collectionViewCachingManager:self assetsForIndexPaths:v38]);

          v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
          -[TVPCollectionViewCachingManager targetSize](self, "targetSize");
          double v64 = v63;
          double v66 = v65;
          int64_t v67 = -[TVPCollectionViewCachingManager contentMode](self, "contentMode");
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager requestOptions](self, "requestOptions"));
          objc_msgSend(v62, "stopCachingImagesForAssets:targetSize:contentMode:options:", v61, v67, v68, v64, v66);

          v37 = &ACAccountStoreDidChangeNotification_ptr;
        }
      }
    }

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v37[132], "setWithSet:", v36, v102, v104));
    [v69 minusSet:self->_previousPreheatIndexPaths];
    if (![v69 count]) {
      goto LABEL_45;
    }
    v110 = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager dataSource](self, "dataSource"));
    char v71 = objc_opt_respondsToSelector(v70, "collectionViewCachingManager:assetWithTargetSizeAtIndexPath:");

    if ((v71 & 1) != 0)
    {
      v107 = v38;
      __int128 v117 = 0u;
      __int128 v118 = 0u;
      __int128 v115 = 0u;
      __int128 v116 = 0u;
      v69 = v110;
      id obja = v110;
      id v72 = [obja countByEnumeratingWithState:&v115 objects:v124 count:16];
      if (!v72)
      {
LABEL_44:

        goto LABEL_45;
      }

      id v73 = v72;
      v109 = v36;
      v103 = v35;
      uint64_t v105 = v29;
      uint64_t v114 = *(void *)v116;
      do
      {
        for (j = 0LL; j != v73; j = (char *)j + 1)
        {
          if (*(void *)v116 != v114) {
            objc_enumerationMutation(obja);
          }
          uint64_t v75 = *(void *)(*((void *)&v115 + 1) + 8LL * (void)j);
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager dataSource](self, "dataSource", v103, v105));
          v77 = (void *)objc_claimAutoreleasedReturnValue([v76 collectionViewCachingManager:self assetWithTargetSizeAtIndexPath:v75]);

          v78 = (void *)objc_claimAutoreleasedReturnValue([v77 allKeys]);
          v79 = (void *)objc_claimAutoreleasedReturnValue([v78 firstObject]);

          if (v79)
          {
            v80 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
            v123 = v79;
            v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v123,  1LL));
            v82 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKey:v79]);
            [v82 CGSizeValue];
            double v84 = v83;
            double v86 = v85;
            int64_t v87 = -[TVPCollectionViewCachingManager contentMode](self, "contentMode");
            v88 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager requestOptions](self, "requestOptions"));
            objc_msgSend(v80, "startCachingImagesForAssets:targetSize:contentMode:options:", v81, v87, v88, v84, v86);
          }
        }

        id v73 = [obja countByEnumeratingWithState:&v115 objects:v124 count:16];
      }

      while (v73);
      v35 = v103;
      LODWORD(v29) = v105;
      v38 = v107;
      v36 = v109;
    }

    else
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager dataSource](self, "dataSource"));
      char v90 = objc_opt_respondsToSelector(v89, "collectionViewCachingManager:assetsForIndexPaths:");

      v69 = v110;
      if ((v90 & 1) == 0)
      {
LABEL_45:
        previousPreheatIndexPaths = self->_previousPreheatIndexPaths;
        self->_previousPreheatIndexPaths = v36;

        v101 = (double *)((char *)self + (int)v29);
        double *v101 = x;
        v101[1] = y;
        v101[2] = width;
        v101[3] = height;

        return;
      }

      v91 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager dataSource](self, "dataSource"));
      uint64_t v92 = objc_claimAutoreleasedReturnValue([v91 collectionViewCachingManager:self assetsForIndexPaths:v110]);

      v93 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCachingManager cachingImageManager](self, "cachingImageManager"));
      -[TVPCollectionViewCachingManager targetSize](self, "targetSize");
      double v95 = v94;
      double v97 = v96;
      int64_t v98 = -[TVPCollectionViewCachingManager contentMode](self, "contentMode");
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[TVPCollectionViewCachingManager requestOptions](self, "requestOptions"));
      id obja = (id)v92;
      objc_msgSend(v93, "startCachingImagesForAssets:targetSize:contentMode:options:", v92, v98, v99, v95, v97);
    }

    v69 = v110;
    goto LABEL_44;
  }

  double MidY = CGRectGetMidY(*(CGRect *)&v24);
  double v33 = MidY - CGRectGetMidY(self->_previousPreheatRect);
  if (v33 >= 0.0) {
    double v34 = v33;
  }
  else {
    double v34 = -v33;
  }
  -[UICollectionView bounds](self->_collectionView, "bounds");
  uint64_t v29 = 48LL;
  if (v34 >= CGRectGetHeight(v130) / 3.0) {
    goto LABEL_15;
  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (BOOL)allowsHorizontalScrolling
{
  return self->_allowsHorizontalScrolling;
}

- (void)setAllowsHorizontalScrolling:(BOOL)a3
{
  self->_allowsHorizontalScrolling = a3;
}

- (TVPCollectionViewCachingManagerDataSource)dataSource
{
  return (TVPCollectionViewCachingManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (CGRect)previousPreheatRect
{
  double x = self->_previousPreheatRect.origin.x;
  double y = self->_previousPreheatRect.origin.y;
  double width = self->_previousPreheatRect.size.width;
  double height = self->_previousPreheatRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousPreheatRect:(CGRect)a3
{
  self->_previousPreheatRect = a3;
}

- (NSSet)previousPreheatIndexPaths
{
  return self->_previousPreheatIndexPaths;
}

- (void)setPreviousPreheatIndexPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end