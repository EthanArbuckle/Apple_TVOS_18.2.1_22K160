@interface UIImage
- (id)_imageResizedForDisplayInInspector;
- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4;
@end

@implementation UIImage

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  v6 = (objc_class *)objc_opt_class(self);
  if (!v6 || (v7 = v6, !object_isClass(v6)))
  {
    v10 = 0LL;
    goto LABEL_4;
  }

  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (!v9)
  {
LABEL_4:
    v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___UIImage);
    v12 = NSStringFromClass(v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_7;
  }

  id v13 = v9;
LABEL_7:
  id v14 = v13;

  v62[0] = @"propertyFormat";
  v62[1] = @"propertyRuntimeType";
  v63[0] = @"image";
  v63[1] = v14;
  v59 = v14;
  id v15 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary, "dictionaryWithObjects:forKeys:count:", v63, v62, 2LL));
  *a3 = v15;
  uint64_t v16 = _UIImageIsFromMainBundle(self);
  uint64_t IsUIKitImage = _UIImageIsUIKitImage(self);
  uint64_t IsSystemSymbol = _UIImageIsSystemSymbol(self);
  v60[0] = @"isFromMainBundle";
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v16));
  v61[0] = v19;
  v60[1] = @"isUIKitImage";
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", IsUIKitImage));
  v61[1] = v20;
  v60[2] = @"isSystemSymbol";
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", IsSystemSymbol));
  v61[2] = v21;
  v60[3] = @"width";
  -[UIImage size](self, "size");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v61[3] = v22;
  v60[4] = @"height";
  -[UIImage size](self, "size");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23));
  v61[4] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  5LL));
  id v26 = [v25 mutableCopy];

  uint64_t v27 = _UIImageIdentityName(self);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  if (v28) {
    [v26 setObject:v28 forKeyedSubscript:@"imageName"];
  }
  uint64_t v29 = _UIImageIdentityBundleIdentifier(self);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  if (v30) {
    [v26 setObject:v30 forKeyedSubscript:@"bundleIdentifier"];
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage symbolConfiguration](self, "symbolConfiguration"));

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage symbolConfiguration](self, "symbolConfiguration"));
    uint64_t v33 = _UIImageSymbolConfigurationTextualSummary();
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

    if (v34) {
      [v26 setObject:v34 forKeyedSubscript:@"symbolConfigurationSummary"];
    }
  }

  if ((objc_opt_respondsToSelector(self, "hasBaseline") & 1) != 0
    && -[UIImage hasBaseline](self, "hasBaseline"))
  {
    -[UIImage baselineOffsetFromBottom](self, "baselineOffsetFromBottom");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v26 setObject:v35 forKeyedSubscript:@"baselineOffsetFromBottom"];
  }

  if ((objc_opt_respondsToSelector(self, "hasMidline") & 1) != 0
    && -[UIImage hasMidline](self, "hasMidline"))
  {
    -[UIImage midlineOffsetFromCenter](self, "midlineOffsetFromCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v26 setObject:v36 forKeyedSubscript:@"midlineOffsetFromCenter"];
  }

  if ((objc_opt_respondsToSelector(self, "hasContentInsets") & 1) != 0
    && -[UIImage hasContentInsets](self, "hasContentInsets"))
  {
    -[UIImage contentInsets](self, "contentInsets");
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v64[0] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v38));
    v64[1] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v40));
    v64[2] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v42));
    v64[3] = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v64, 4LL));

    [v26 setObject:v47 forKeyedSubscript:@"contentInsets"];
  }

  if ((objc_opt_respondsToSelector(self, "_CGPDFPage") & 1) != 0 && -[UIImage _CGPDFPage](self, "_CGPDFPage"))
  {
    v48 = @"PDF";
LABEL_30:
    [v26 setObject:v48 forKeyedSubscript:@"vectorImageType"];
    goto LABEL_31;
  }

  if ((objc_opt_respondsToSelector(self, "_CGSVGDocument") & 1) != 0)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage _CGSVGDocument](self, "_CGSVGDocument"));

    if (v49)
    {
      v48 = @"SVG";
      goto LABEL_30;
    }
  }

- (id)_imageResizedForDisplayInInspector
{
  if (_UIImageIsSystemSymbol(self) && (-[UIImage size](self, "size"), v3 >= 2.22044605e-16))
  {
    -[UIImage size](self, "size");
    double v6 = v5 * 84.0;
    -[UIImage size](self, "size");
    CGFloat v8 = v6 / v7;
    v11.width = v8;
    v11.height = 84.0;
    UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
    -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, v8, 84.0);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
  }

  else
  {
    v4 = self;
  }

  return v4;
}

@end