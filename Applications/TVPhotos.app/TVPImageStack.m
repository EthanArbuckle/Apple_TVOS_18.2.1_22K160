@interface TVPImageStack
+ (CGSize)_naturalSizeForImageStackSpecification:(id)a3;
+ (id)_imageRepresentationsForImageStackSpecification:(id)a3 fromURL:(id)a4;
+ (id)_imageRepresentationsForUIImage:(id)a3 outFlatImage:(id *)a4 outFlatImageCornerRadius:(double *)a5;
+ (id)_loadingOperationQueue;
- (BOOL)legacy;
- (BOOL)topLayerIsFixedFrame;
- (CGSize)naturalSize;
- (TVPImageStack)init;
- (TVPImageStack)initWithArchivedLayeredImageProxy:(id)a3;
- (TVPImageStack)initWithImageProxies:(id)a3;
- (TVPImageStack)initWithImageURLs:(id)a3;
- (TVPImageStack)initWithImages:(id)a3;
- (TVPImageStack)initWithURL:(id)a3;
- (double)flatImageCornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)flatImage;
- (id)imageProxies;
- (id)layeredImageProxy;
- (id)placeholderImage;
- (int)blendMode;
- (void)_loadImagesAtSize:(CGSize)a3 scaledSize:(CGSize)a4 completion:(id)a5;
- (void)_loadLayeredImageProxy;
- (void)cancel;
- (void)loadImagesAtSize:(CGSize)a3 completion:(id)a4;
- (void)setBlendMode:(int)a3;
- (void)setFlatImage:(id)a3;
- (void)setFlatImageCornerRadius:(double)a3;
- (void)setLegacy:(BOOL)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setTopLayerIsFixedFrame:(BOOL)a3;
@end

@implementation TVPImageStack

- (TVPImageStack)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPImageStack;
  v2 = -[TVPImageStack init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_legacy = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.TVPImageStack", 0LL);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.TVPImageStack._layeredImageLoadingQueue", 0LL);
    layeredImageLoadingQueue = v3->_layeredImageLoadingQueue;
    v3->_layeredImageLoadingQueue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    loadingOperations = v3->_loadingOperations;
    v3->_loadingOperations = v8;
  }

  return v3;
}

- (TVPImageStack)initWithImageURLs:(id)a3
{
  id v4 = a3;
  v5 = -[TVPImageStack init](self, "init");
  if (v5)
  {
    dispatch_queue_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v12);
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSURL, v9);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
          {
            +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"imageURLs must contain NSURL objects",  (void)v20);

            v18 = 0LL;
            goto LABEL_15;
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVPImageRepresentation imageRepresentationWithURL:]( &OBJC_CLASS___TVPImageRepresentation,  "imageRepresentationWithURL:",  v13,  (void)v20));
          if (v15) {
            -[NSMutableArray addObject:](v6, "addObject:", v15);
          }

          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v16 = (NSArray *)-[NSMutableArray copy](v6, "copy");
    imageRepresentations = v5->_imageRepresentations;
    v5->_imageRepresentations = v16;
  }

  v18 = v5;
LABEL_15:

  return v18;
}

- (TVPImageStack)initWithImages:(id)a3
{
  id v4 = a3;
  v5 = -[TVPImageStack init](self, "init");
  if (!v5) {
    goto LABEL_17;
  }
  if ([v4 count] != (id)1)
  {
    dispatch_queue_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v12 = v4;
    id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      id v15 = v13;
      uint64_t v16 = *(void *)v25;
      while (2)
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v17);
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___UIImage, v14);
          if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
          {
            +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"images must contain UIImage objects",  (void)v24);

            goto LABEL_20;
          }

          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVPImageRepresentation imageRepresentationWithImage:]( &OBJC_CLASS___TVPImageRepresentation,  "imageRepresentationWithImage:",  v18,  (void)v24));
          if (v20) {
            -[NSMutableArray addObject:](v6, "addObject:", v20);
          }

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v11 = (NSArray *)-[NSMutableArray copy](v6, "copy");
    goto LABEL_16;
  }

  dispatch_queue_t v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UIImage, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    id v10 = objc_msgSend( (id)objc_opt_class(v5, v9),  "_imageRepresentationsForUIImage:outFlatImage:outFlatImageCornerRadius:",  v6,  &v5->_flatImage,  &v5->_flatImageCornerRadius);
    uint64_t v11 = (NSArray *)objc_claimAutoreleasedReturnValue(v10);
LABEL_16:
    imageRepresentations = v5->_imageRepresentations;
    v5->_imageRepresentations = v11;

LABEL_17:
    __int128 v22 = v5;
    goto LABEL_21;
  }

  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"images must contain UIImage objects");
LABEL_20:

  __int128 v22 = 0LL;
LABEL_21:

  return v22;
}

- (TVPImageStack)initWithImageProxies:(id)a3
{
  id v4 = a3;
  v5 = -[TVPImageStack init](self, "init");
  if (v5)
  {
    dispatch_queue_t v6 = (NSArray *)[v4 copy];
    imageProxies = v5->_imageProxies;
    v5->_imageProxies = v6;

    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVPImageRepresentation imageRepresentationWithImageProxy:]( &OBJC_CLASS___TVPImageRepresentation,  "imageRepresentationWithImageProxy:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13),  (void)v18));
          if (v14) {
            -[NSMutableArray addObject:](v8, "addObject:", v14);
          }

          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v11);
    }

    id v15 = (NSArray *)-[NSMutableArray copy](v8, "copy");
    imageRepresentations = v5->_imageRepresentations;
    v5->_imageRepresentations = v15;
  }

  return v5;
}

- (TVPImageStack)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 pathExtension]);
    id v7 = [v6 compare:@"lsr" options:1];

    if (v7)
    {
      uint64_t v8 = objc_alloc(&OBJC_CLASS___TVImageProxy);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVURLImageLoader sharedInstance](&OBJC_CLASS___TVURLImageLoader, "sharedInstance"));
      id v10 = -[TVImageProxy initWithObject:imageLoader:groupType:]( v8,  "initWithObject:imageLoader:groupType:",  v5,  v9,  0LL);

      -[TVImageProxy setCacheOnLoad:](v10, "setCacheOnLoad:", 1LL);
      id v15 = v10;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
      uint64_t v12 = -[TVPImageStack initWithImageProxies:](self, "initWithImageProxies:", v11);
    }

    else
    {
      id v10 = -[TVArchivedLayeredImageProxy initWithArchiveURL:]( objc_alloc(&OBJC_CLASS___TVArchivedLayeredImageProxy),  "initWithArchiveURL:",  v5);
      uint64_t v12 = -[TVPImageStack initWithArchivedLayeredImageProxy:](self, "initWithArchivedLayeredImageProxy:", v10);
    }

    self = v12;
    id v13 = self;
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (TVPImageStack)initWithArchivedLayeredImageProxy:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    dispatch_queue_t v6 = -[TVPImageStack init](self, "init");
    id v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_layeredImageProxy, a3);
    }
    self = v7;
    uint64_t v8 = self;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class(self, a2));
  *((_DWORD *)v4 + 2) = self->_blendMode;
  *((void *)v4 + 2) = *(void *)&self->_flatImageCornerRadius;
  id v5 = -[NSArray copy](self->_imageRepresentations, "copy");
  dispatch_queue_t v6 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v5;

  objc_storeStrong((id *)v4 + 5, self->_layeredImageProxy);
  objc_storeStrong((id *)v4 + 6, self->_imageProxies);
  *((_OWORD *)v4 + 4) = self->_naturalSize;
  *((_BYTE *)v4 + 88) = self->_topLayerIsFixedFrame;
  *((_BYTE *)v4 + 89) = self->_legacy;
  return v4;
}

- (void)cancel
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C4F4;
  block[3] = &unk_1000C9528;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)layeredImageProxy
{
  return self->_layeredImageProxy;
}

- (id)imageProxies
{
  return self->_imageProxies;
}

- (double)flatImageCornerRadius
{
  return self->_flatImageCornerRadius;
}

- (CGSize)naturalSize
{
  double width = self->_naturalSize.width;
  double height = self->_naturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFlatImageCornerRadius:(double)a3
{
  self->_flatImageCornerRadius = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (BOOL)topLayerIsFixedFrame
{
  return self->_topLayerIsFixedFrame;
}

- (void)setTopLayerIsFixedFrame:(BOOL)a3
{
  self->_topLayerIsFixedFrame = a3;
}

- (void)loadImagesAtSize:(CGSize)a3 completion:(id)a4
{
}

+ (id)_imageRepresentationsForUIImage:(id)a3 outFlatImage:(id *)a4 outFlatImageCornerRadius:(double *)a5
{
  id v7 = a3;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 _primitiveImageAsset]);
  if (v8
    && (id v9 = (void *)v8,
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 imageAsset]),
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _layerStack]),
        v10,
        v9,
        v11))
  {
    if (a4)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 flattenedImage]);
      id v13 = *a4;
      *a4 = v12;
    }

    if (a5 && (objc_opt_respondsToSelector(v11, "flatImageContainsCornerRadius") & 1) != 0)
    {
      unsigned int v14 = [v11 flatImageContainsCornerRadius];
      double v15 = 0.0;
      if (v14) {
        double v15 = 6.0;
      }
      *a5 = v15;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layers", 0));
    id v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVPImageRepresentation imageRepresentationWithNamedLayerImage:]( &OBJC_CLASS___TVPImageRepresentation,  "imageRepresentationWithNamedLayerImage:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)i)));
          if (v22) {
            [v16 addObject:v22];
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v19);
    }

    id v23 = [v16 copy];
  }

  else
  {
    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[TVPImageRepresentation imageRepresentationWithImage:]( &OBJC_CLASS___TVPImageRepresentation,  "imageRepresentationWithImage:",  v7));
    id v11 = (void *)v24;
    if (v24)
    {
      uint64_t v30 = v24;
      id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    }

    else
    {
      id v23 = 0LL;
    }
  }

  return v23;
}

+ (id)_imageRepresentationsForImageStackSpecification:(id)a3 fromURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isFileURL])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvs_arrayForKey:", @"layers"));
    if ([v7 count])
    {
      id v77 = v5;
      v86 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v7 count]);
      __int128 v105 = 0u;
      __int128 v106 = 0u;
      __int128 v107 = 0u;
      __int128 v108 = 0u;
      v76 = v7;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 reverseObjectEnumerator]);
      id v9 = [v8 countByEnumeratingWithState:&v105 objects:v111 count:16];
      if (v9)
      {
        id v11 = v9;
        uint64_t v12 = *(void *)v106;
        CGFloat y = CGRectZero.origin.y;
        CGFloat width = CGRectZero.size.width;
        CGFloat height = CGRectZero.size.height;
        id v83 = v6;
        v85 = v8;
        uint64_t v90 = *(void *)v106;
        do
        {
          uint64_t v16 = 0LL;
          id v91 = v11;
          do
          {
            if (*(void *)v106 != v12) {
              objc_enumerationMutation(v8);
            }
            v17 = *(void **)(*((void *)&v105 + 1) + 8LL * (void)v16);
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
            {
              id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tvs_stringForKey:", @"filename"));
              if ([v19 length])
              {
                v95 = v16;
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
                __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByDeletingLastPathComponent]);
                uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathComponent:v19]);

                id v23 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
                __int128 v101 = 0u;
                __int128 v102 = 0u;
                __int128 v103 = 0u;
                __int128 v104 = 0u;
                v94 = v23;
                v96 = (void *)v22;
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager enumeratorAtPath:](v23, "enumeratorAtPath:", v22));
                id v25 = [v24 countByEnumeratingWithState:&v101 objects:v110 count:16];
                if (v25)
                {
                  v92 = v19;
                  uint64_t v26 = *(void *)v102;
LABEL_12:
                  uint64_t v27 = 0LL;
                  while (1)
                  {
                    if (*(void *)v102 != v26) {
                      objc_enumerationMutation(v24);
                    }
                    __int128 v28 = *(void **)(*((void *)&v101 + 1) + 8 * v27);
                    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 pathExtension]);
                    unsigned __int8 v30 = [v29 isEqualToString:@"imageset"];

                    if ((v30 & 1) != 0) {
                      break;
                    }
                    if (v25 == (id)++v27)
                    {
                      id v25 = [v24 countByEnumeratingWithState:&v101 objects:v110 count:16];
                      if (v25) {
                        goto LABEL_12;
                      }
                      v31 = v24;
                      uint64_t v8 = v85;
                      id v11 = v91;
                      id v19 = v92;
                      goto LABEL_65;
                    }
                  }

                  v31 = (void *)objc_claimAutoreleasedReturnValue([v96 stringByAppendingPathComponent:v28]);

                  if (!v31)
                  {
                    id v25 = 0LL;
                    uint64_t v8 = v85;
                    id v11 = v91;
                    id v19 = v92;
                    goto LABEL_66;
                  }

                  uint64_t v32 = objc_claimAutoreleasedReturnValue([v31 stringByAppendingPathComponent:@"Contents.json"]);
                  id v19 = v92;
                  v89 = (void *)v32;
                  if (v32
                    && (uint64_t v34 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v32))) != 0)
                  {
                    v88 = (void *)v34;
                    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v34,  0LL,  0LL));
                  }

                  else
                  {
                    v35 = 0LL;
                    v88 = 0LL;
                  }

                  uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSDictionary, v33);
                  v87 = v35;
                  if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0)
                  {
                    __int128 v99 = 0u;
                    __int128 v100 = 0u;
                    __int128 v97 = 0u;
                    __int128 v98 = 0u;
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "tvs_arrayForKey:", @"images"));
                    id v38 = [v37 countByEnumeratingWithState:&v97 objects:v109 count:16];
                    if (v38)
                    {
                      id v40 = v38;
                      v41 = 0LL;
                      uint64_t v42 = *(void *)v98;
                      do
                      {
                        for (i = 0LL; i != v40; i = (char *)i + 1)
                        {
                          if (*(void *)v98 != v42) {
                            objc_enumerationMutation(v37);
                          }
                          v44 = *(void **)(*((void *)&v97 + 1) + 8LL * (void)i);
                          uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSDictionary, v39);
                          if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
                          {
                            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "tvs_stringForKey:", @"filename"));
                            if (v46)
                            {
                              uint64_t v47 = objc_claimAutoreleasedReturnValue([v31 stringByAppendingPathComponent:v46]);

                              v41 = (void *)v47;
                            }
                          }
                        }

                        id v40 = [v37 countByEnumeratingWithState:&v97 objects:v109 count:16];
                      }

                      while (v40);
                    }

                    else
                    {
                      v41 = 0LL;
                    }

                    id v19 = v92;
                  }

                  else
                  {
                    v41 = 0LL;
                  }

                  v48 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageWithContentsOfFile:]( &OBJC_CLASS___UIImage,  "imageWithContentsOfFile:",  v41));
                  id v25 = (id)objc_claimAutoreleasedReturnValue( +[TVPImageRepresentation imageRepresentationWithImage:]( &OBJC_CLASS___TVPImageRepresentation,  "imageRepresentationWithImage:",  v48));

                  v50 = (void *)objc_claimAutoreleasedReturnValue([v96 stringByAppendingPathComponent:@"Contents.json"]);
                  if (v50)
                  {
                    uint64_t v51 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v50));
                    id v11 = v91;
                    if (v51)
                    {
                      v93 = (void *)v51;
                      v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v51,  0LL,  0LL));
                    }

                    else
                    {
                      v52 = 0LL;
                      v93 = 0LL;
                    }
                  }

                  else
                  {
                    v52 = 0LL;
                    v93 = 0LL;
                    id v11 = v91;
                  }

                  uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSDictionary, v49);
                  if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0)
                  {
                    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "tvs_dictionaryForKey:", @"properties"));
                    if (v54)
                    {
                      id v84 = v54;
                      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "tvs_dictionaryForKey:", @"frame-size"));
                      v56 = v55;
                      double v57 = height;
                      double v58 = width;
                      if (v55)
                      {
                        id v78 = v50;
                        uint64_t v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "tvs_numberForKey:", @"width"));
                        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "tvs_numberForKey:", @"height"));
                        double v57 = height;
                        double v58 = width;
                        v81 = (void *)v59;
                        if (v59)
                        {
                          double v57 = height;
                          double v58 = width;
                          if (v60)
                          {
                            v61 = v60;
                            [v81 doubleValue];
                            double v58 = v62;
                            [v61 doubleValue];
                            v60 = v61;
                            double v57 = v63;
                          }
                        }

                        v50 = v78;
                      }

                      double x = CGRectZero.origin.x;
                      double v65 = y;
                      v80 = v56;
                      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "tvs_dictionaryForKey:", @"frame-center"));
                      if (v82)
                      {
                        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "tvs_numberForKey:", @"x"));
                        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "tvs_numberForKey:", @"y"));
                        double x = CGRectZero.origin.x;
                        double v65 = y;
                        if (v66)
                        {
                          double x = CGRectZero.origin.x;
                          double v65 = y;
                          if (v67)
                          {
                            id v79 = v67;
                            [v66 doubleValue];
                            double v69 = v68;
                            v112.origin.double x = CGRectZero.origin.x;
                            v112.origin.CGFloat y = y;
                            v112.size.CGFloat width = v58;
                            v112.size.CGFloat height = v57;
                            double x = v69 - CGRectGetWidth(v112) * 0.5;
                            [v79 doubleValue];
                            double v71 = v70;
                            v113.origin.double x = CGRectZero.origin.x;
                            v113.origin.CGFloat y = y;
                            v113.size.CGFloat width = v58;
                            v113.size.CGFloat height = v57;
                            CGFloat v72 = CGRectGetHeight(v113);
                            v67 = v79;
                            double v65 = v71 - v72 * 0.5;
                          }
                        }
                      }

                      objc_msgSend(v25, "setDestinationRect:", x, v65, v58, v57);
                      else {
                        uint64_t v73 = (uint64_t)objc_msgSend(v84, "tvs_BOOLForKey:defaultValue:", @"editorial", 0);
                      }
                      [v25 setFixedFrame:v73];

                      v54 = v84;
                    }
                  }

                  uint64_t v8 = v85;
                  id v6 = v83;
                }

                else
                {
                  v31 = v24;
                  id v11 = v91;
                }

+ (id)_loadingOperationQueue
{
  if (qword_1001032A0 != -1) {
    dispatch_once(&qword_1001032A0, &stru_1000CB228);
  }
  return (id)qword_100103298;
}

+ (CGSize)_naturalSizeForImageStackSpecification:(id)a3
{
  id v3 = a3;
  CGFloat width = CGSizeZero.width;
  CGFloat height = CGSizeZero.height;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  if ([v6 _graphicsQuality] != (id)100)
  {
LABEL_7:

    goto LABEL_8;
  }

  id v7 = [v3 count];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_dictionaryForKey:", @"properties"));
    id v6 = v8;
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvs_dictionaryForKey:", @"canvasSize"));
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvs_numberForKey:", @"width"));
        [v11 doubleValue];
        CGFloat width = v12;

        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tvs_numberForKey:", @"height"));
        [v13 doubleValue];
        CGFloat height = v14;
      }
    }

    goto LABEL_7;
  }

- (void)_loadLayeredImageProxy
{
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_10003D374;
  uint64_t v27 = sub_10003D384;
  id v28 = 0LL;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  layeredImageProxCGFloat y = self->_layeredImageProxy;
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  id v19 = sub_10003D38C;
  uint64_t v20 = &unk_1000CB250;
  uint64_t v22 = &v23;
  id v5 = v3;
  __int128 v21 = v5;
  -[TVArchivedLayeredImageProxy loadWithCompletion:](layeredImageProxy, "loadWithCompletion:", &v17);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v24[5], "stringByAppendingPathComponent:", @"Contents.json", v17, v18, v19, v20));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v6));
    if (v7)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  0LL));
      if (v9)
      {
        objc_msgSend((id)objc_opt_class(self, v8), "_naturalSizeForImageStackSpecification:", v9);
        self->_naturalSize.CGFloat width = v10;
        self->_naturalSize.CGFloat height = v11;
        id v13 = (void *)objc_opt_class(self, v12);
        double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
        double v15 = (NSArray *)objc_claimAutoreleasedReturnValue([v13 _imageRepresentationsForImageStackSpecification:v9 fromURL:v14]);
        imageRepresentations = self->_imageRepresentations;
        self->_imageRepresentations = v15;
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  _Block_object_dispose(&v23, 8);
}

- (void)_loadImagesAtSize:(CGSize)a3 scaledSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D468;
  block[3] = &unk_1000CB2C8;
  CGFloat v14 = width;
  CGFloat v15 = height;
  SEL v16 = a2;
  block[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (id)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (id)flatImage
{
  return self->_flatImage;
}

- (void)setFlatImage:(id)a3
{
}

- (BOOL)legacy
{
  return self->_legacy;
}

- (void)setLegacy:(BOOL)a3
{
  self->_legacCGFloat y = a3;
}

- (void).cxx_destruct
{
}

@end