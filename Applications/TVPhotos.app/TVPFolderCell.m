@interface TVPFolderCell
- (CGRect)_squareCropForImage:(id)a3;
- (NSMutableDictionary)_photoCells;
- (TVPFolderCell)initWithFrame:(CGRect)a3;
- (UIImage)backgroundImage;
- (id)_drawImage;
- (void)layoutSubviews;
- (void)setBackgroundImage:(id)a3;
- (void)setImage:(id)a3 forQuadrant:(int64_t)a4;
- (void)updateFolderImage;
@end

@implementation TVPFolderCell

- (TVPFolderCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVPFolderCell;
  v3 = -[TVPSharedPSAlbumDescriptionView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    photoCells = v3->__photoCells;
    v3->__photoCells = v4;
  }

  return v3;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVPFolderCell;
  -[TVPSharedPSAlbumDescriptionView layoutSubviews](&v2, "layoutSubviews");
}

- (void)setImage:(id)a3 forQuadrant:(int64_t)a4
{
  photoCells = self->__photoCells;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](photoCells, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)updateFolderImage
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003FBA4;
  v4[3] = &unk_1000C9D18;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (CGRect)_squareCropForImage:(id)a3
{
  id v3 = a3;
  double Width = (double)CGImageGetWidth((CGImageRef)[v3 CGImage]);
  id v5 = v3;
  id v6 = (CGImage *)[v5 CGImage];

  size_t Height = CGImageGetHeight(v6);
  else {
    double v8 = Width;
  }
  double v9 = (Width - v8) * 0.5;
  double v10 = ((double)Height - v8) * 0.5;
  double v11 = v8;
  result.size.height = v11;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)_drawImage
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 scale];
  CGFloat v5 = v4;

  -[TVPFolderCell bounds](self, "bounds");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  unsigned __int8 v10 = -[TVPFolderCell isOpaque](self, "isOpaque");
  v33.width = v7;
  v33.height = v9;
  UIGraphicsBeginImageContextWithOptions(v33, v10, v5);
  backgroundImage = self->_backgroundImage;
  -[TVPFolderCell bounds](self, "bounds");
  -[UIImage drawInRect:](backgroundImage, "drawInRect:");
  for (unint64_t i = 0LL; i != 4; ++i)
  {
    photoCells = self->__photoCells;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", i));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](photoCells, "objectForKeyedSubscript:", v14));

    if (v15)
    {
      -[TVPFolderCell bounds](self, "bounds");
      double v17 = (v16 + -24.0) * 0.5;
      id v18 = -[TVPFolderCell _squareCropForImage:](self, "_squareCropForImage:", v15);
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v27 = PXSizeScale(v18, v17, v17, v5);
      v29 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "px_imageByCroppingRect:pixelTargetSize:cornerRadius:",  v20,  v22,  v24,  v26,  v27,  v28,  6.0));

      objc_msgSend( v29,  "drawInRect:",  (v17 + 8.0) * (double)(i & 1) + 8.0,  (v17 + 8.0) * (double)(i >> 1) + 8.0,  v17,  v17);
    }
  }

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v31 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v31;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (NSMutableDictionary)_photoCells
{
  return self->__photoCells;
}

- (void).cxx_destruct
{
}

@end