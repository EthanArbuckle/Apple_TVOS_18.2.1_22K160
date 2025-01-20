BOOL ZWUseVibrantBlendModes()
{
  void *v0;
  char *v1;
  BOOL v2;
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  v1 = (char *)[v0 _graphicsQuality];

  v2 = !UIAccessibilityIsReduceTransparencyEnabled();
  return v1 != (_BYTE *)&dword_8 + 2 && v2;
}

double ZWConvertPointInScreenPixelsToViewCoordinates(void *a1, double a2, double a3)
{
  id v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 screen]);
  [v7 scale];
  double v9 = v8;

  objc_msgSend(v5, "zw_convertPointFromScreenCoordinates:", a2 / v9, a3 / v9);
  double v11 = v10;

  return v11;
}

double ZWConvertPointInScreenPixelsToScreenCoordinates(double a1, double a2, double a3)
{
  return a1 / a3;
}

id ZWLocString(void *a1)
{
  uint64_t v1 = ZWLocString_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ZWLocString_onceToken, &__block_literal_global_251);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", ZWLocString_principalClass));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v2 value:&stru_6D450 table:@"ZoomWindow"]);

  return v4;
}

double ZWZoomLensBorderThicknessForTouches()
{
  return 30.0;
}

id ZWLensInnerColor()
{
  if (ZWUseVibrantBlendModes() && AXDeviceIsPhone()) {
    v0 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.564705882,  0.564705882,  0.619607843,  1.0));
  }
  else {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.7));
  }
  return v0;
}

id ZWLensOuterColor()
{
  if (ZWUseVibrantBlendModes() && AXDeviceIsPhone()) {
    v0 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.494117647,  0.494117647,  0.552941176,  1.0));
  }
  else {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.7));
  }
  return v0;
}

double ZWLensInnerBorderWidth()
{
  return 2.0;
}

double ZWLensOuterBorderWidth()
{
  return 2.0;
}

double ZWLensCornerRadius()
{
  return 10.0;
}

UIColor *ZWSlugDefaultRingColor()
{
  return +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
}

id ZWSlugRepositioningRingColor()
{
  return +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
}

id ZWMenuButtonSelectedColor()
{
  return +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
}

double ZWDefaultFadeAnimationDuration()
{
  return 0.2;
}

double ZWDefaultZoomAnimationDuration()
{
  return 0.2;
}

double ZWZoomEdgeSlackAmount()
{
  return 10.0;
}

id ZWOuterLensBorderForBounds(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
  v38.origin.x = a2;
  v38.origin.y = a3;
  v38.size.width = a4;
  v38.size.height = a5;
  double MinX = CGRectGetMinX(v38);
  double v12 = MinX;
  if ((a1 & 1) != 0)
  {
    v39.origin.x = a2;
    v39.origin.y = a3;
    v39.size.width = a4;
    v39.size.height = a5;
    [v10 addArcWithCenter:1 radius:v12 startAngle:CGRectGetMinY(v39) endAngle:11.0 clockwise:0.0];
    v40.origin.x = a2;
    v40.origin.y = a3;
    v40.size.width = a4;
    v40.size.height = a5;
    CGFloat v13 = CGRectGetMinX(v40) + 11.0;
    v41.origin.x = a2;
    v41.origin.y = a3;
    v41.size.width = a4;
    v41.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v13, CGRectGetMinY(v41));
    v42.origin.x = a2;
    v42.origin.y = a3;
    v42.size.width = a4;
    v42.size.height = a5;
    double MidX = CGRectGetMidX(v42);
    v43.origin.x = a2;
    v43.origin.y = a3;
    v43.size.width = a4;
    v43.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  MidX,  CGRectGetMinY(v43),  11.0,  -3.14159265,  3.14159265);
    v44.origin.x = a2;
    v44.origin.y = a3;
    v44.size.width = a4;
    v44.size.height = a5;
    CGFloat v15 = CGRectGetMidX(v44) + 11.0;
    v45.origin.x = a2;
    v45.origin.y = a3;
    v45.size.width = a4;
    v45.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v15, CGRectGetMinY(v45));
    v46.origin.x = a2;
    v46.origin.y = a3;
    v46.size.width = a4;
    v46.size.height = a5;
    double MaxX = CGRectGetMaxX(v46);
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  MaxX,  CGRectGetMinY(v47),  11.0,  -3.14159265,  3.14159265);
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    double v17 = CGRectGetMaxX(v48);
    v49.origin.x = a2;
    v49.origin.y = a3;
    v49.size.width = a4;
    v49.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v17, CGRectGetMinY(v49) + 11.0);
    v50.origin.x = a2;
    v50.origin.y = a3;
    v50.size.width = a4;
    v50.size.height = a5;
    double v18 = CGRectGetMaxX(v50);
    v51.origin.x = a2;
    v51.origin.y = a3;
    v51.size.width = a4;
    v51.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v18,  CGRectGetMidY(v51),  11.0,  -1.57079633,  4.71238898);
    v52.origin.x = a2;
    v52.origin.y = a3;
    v52.size.width = a4;
    v52.size.height = a5;
    double v19 = CGRectGetMaxX(v52);
    v53.origin.x = a2;
    v53.origin.y = a3;
    v53.size.width = a4;
    v53.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v19, CGRectGetMidY(v53) + 11.0);
    v54.origin.x = a2;
    v54.origin.y = a3;
    v54.size.width = a4;
    v54.size.height = a5;
    double v20 = CGRectGetMaxX(v54);
    v55.origin.x = a2;
    v55.origin.y = a3;
    v55.size.width = a4;
    v55.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v20,  CGRectGetMaxY(v55),  11.0,  -1.57079633,  4.71238898);
    v56.origin.x = a2;
    v56.origin.y = a3;
    v56.size.width = a4;
    v56.size.height = a5;
    CGFloat v21 = CGRectGetMaxX(v56) + -11.0;
    v57.origin.x = a2;
    v57.origin.y = a3;
    v57.size.width = a4;
    v57.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v21, CGRectGetMaxY(v57));
    v58.origin.x = a2;
    v58.origin.y = a3;
    v58.size.width = a4;
    v58.size.height = a5;
    double v22 = CGRectGetMidX(v58);
    v59.origin.x = a2;
    v59.origin.y = a3;
    v59.size.width = a4;
    v59.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v22,  CGRectGetMaxY(v59),  11.0,  0.0,  6.28318531);
    v60.origin.x = a2;
    v60.origin.y = a3;
    v60.size.width = a4;
    v60.size.height = a5;
    CGFloat v23 = CGRectGetMidX(v60) + -11.0;
    v61.origin.x = a2;
    v61.origin.y = a3;
    v61.size.width = a4;
    v61.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v23, CGRectGetMaxY(v61));
    v62.origin.x = a2;
    v62.origin.y = a3;
    v62.size.width = a4;
    v62.size.height = a5;
    double v24 = CGRectGetMinX(v62);
    v63.origin.x = a2;
    v63.origin.y = a3;
    v63.size.width = a4;
    v63.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v24,  CGRectGetMaxY(v63),  11.0,  0.0,  6.28318531);
    v64.origin.x = a2;
    v64.origin.y = a3;
    v64.size.width = a4;
    v64.size.height = a5;
    double v25 = CGRectGetMinX(v64);
    v65.origin.x = a2;
    v65.origin.y = a3;
    v65.size.width = a4;
    v65.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v25, CGRectGetMaxY(v65) + -11.0);
    v66.origin.x = a2;
    v66.origin.y = a3;
    v66.size.width = a4;
    v66.size.height = a5;
    double v26 = CGRectGetMinX(v66);
    v67.origin.x = a2;
    v67.origin.y = a3;
    v67.size.width = a4;
    v67.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v26,  CGRectGetMidY(v67),  11.0,  1.57079633,  7.85398163);
    v68.origin.x = a2;
    v68.origin.y = a3;
    v68.size.width = a4;
    v68.size.height = a5;
    double v27 = CGRectGetMinX(v68);
    v69.origin.x = a2;
    v69.origin.y = a3;
    v69.size.width = a4;
    v69.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v27, CGRectGetMidY(v69) + -11.0);
  }

  else
  {
    double v28 = MinX + 11.0;
    v70.origin.x = a2;
    v70.origin.y = a3;
    v70.size.width = a4;
    v70.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v28,  CGRectGetMinY(v70) + 11.0,  11.0);
    v71.origin.x = a2;
    v71.origin.y = a3;
    v71.size.width = a4;
    v71.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  CGRectGetMaxX(v71) + -11.0,  11.0,  11.0,  -1.57079633,  0.0);
    v72.origin.x = a2;
    v72.origin.y = a3;
    v72.size.width = a4;
    v72.size.height = a5;
    CGFloat v29 = CGRectGetMaxX(v72) + -11.0;
    v73.origin.x = a2;
    v73.origin.y = a3;
    v73.size.width = a4;
    v73.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v29,  CGRectGetMaxY(v73) + -11.0,  11.0,  0.0,  1.57079633);
    v74.origin.x = a2;
    v74.origin.y = a3;
    v74.size.width = a4;
    v74.size.height = a5;
    CGFloat v30 = CGRectGetMidX(v74) + 25.0 + -6.0 + -1.0;
    v75.origin.x = a2;
    v75.origin.y = a3;
    v75.size.width = a4;
    v75.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v30,  CGRectGetMaxY(v75),  6.0,  0.0,  -1.57079633);
    v76.origin.x = a2;
    v76.origin.y = a3;
    v76.size.width = a4;
    v76.size.height = a5;
    CGFloat v31 = CGRectGetMidX(v76) + -25.0 + 6.0 + 1.0;
    v77.origin.x = a2;
    v77.origin.y = a3;
    v77.size.width = a4;
    v77.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v31,  CGRectGetMaxY(v77),  6.0,  -1.57079633,  1.57079633);
    v78.origin.x = a2;
    v78.origin.y = a3;
    v78.size.width = a4;
    v78.size.height = a5;
    CGFloat v32 = CGRectGetMidX(v78) + 25.0 + -6.0 + -1.0;
    v79.origin.x = a2;
    v79.origin.y = a3;
    v79.size.width = a4;
    v79.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v32,  CGRectGetMaxY(v79),  6.0,  1.57079633,  0.0);
    v80.origin.x = a2;
    v80.origin.y = a3;
    v80.size.width = a4;
    v80.size.height = a5;
    CGFloat v33 = CGRectGetMidX(v80) + 25.0 + -6.0 + -1.0;
    v81.origin.x = a2;
    v81.origin.y = a3;
    v81.size.width = a4;
    v81.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v33,  CGRectGetMaxY(v81),  6.0,  0.0,  -1.57079633);
    v82.origin.x = a2;
    v82.origin.y = a3;
    v82.size.width = a4;
    v82.size.height = a5;
    CGFloat v34 = CGRectGetMidX(v82) + -25.0 + 6.0 + 1.0;
    v83.origin.x = a2;
    v83.origin.y = a3;
    v83.size.width = a4;
    v83.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v34,  CGRectGetMaxY(v83),  6.0,  -1.57079633,  -3.14159265);
    v84.origin.x = a2;
    v84.origin.y = a3;
    v84.size.width = a4;
    v84.size.height = a5;
    CGFloat v35 = CGRectGetMinX(v84) + 11.0;
    v85.origin.x = a2;
    v85.origin.y = a3;
    v85.size.width = a4;
    v85.size.height = a5;
    objc_msgSend( v10,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v35,  CGRectGetMaxY(v85) + -11.0,  11.0,  1.57079633,  3.14159265);
  }

  v86.origin.x = a2;
  v86.origin.y = a3;
  v86.size.width = a4;
  v86.size.height = a5;
  double v36 = CGRectGetMinX(v86);
  v87.origin.x = a2;
  v87.origin.y = a3;
  v87.size.width = a4;
  v87.size.height = a5;
  objc_msgSend(v10, "addLineToPoint:", v36, CGRectGetMinY(v87) + 11.0);
  return v10;
}

UIBezierPath *ZWInnerLensBorderForBounds(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v10 = objc_alloc_init(&OBJC_CLASS___UIBezierPath);
  double v11 = v10;
  if ((a1 & 1) != 0)
  {
    double v12 = v10;
    v36.origin.x = a2;
    v36.origin.y = a3;
    v36.size.width = a4;
    v36.size.height = a5;
    double MinX = CGRectGetMinX(v36);
    v37.origin.x = a2;
    v37.origin.y = a3;
    v37.size.width = a4;
    v37.size.height = a5;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  MinX,  CGRectGetMinY(v37),  13.0,  1.44079633,  0.13);
    v38.origin.x = a2;
    v38.origin.y = a3;
    v38.size.width = a4;
    v38.size.height = a5;
    double MidX = CGRectGetMidX(v38);
    v39.origin.x = a2;
    v39.origin.y = a3;
    v39.size.width = a4;
    v39.size.height = a5;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  MidX,  CGRectGetMinY(v39),  13.0,  -3.27159265,  0.13);
    v40.origin.x = a2;
    v40.origin.y = a3;
    v40.size.width = a4;
    v40.size.height = a5;
    double MaxX = CGRectGetMaxX(v40);
    v41.origin.x = a2;
    v41.origin.y = a3;
    v41.size.width = a4;
    v41.size.height = a5;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  MaxX,  CGRectGetMinY(v41),  13.0,  -3.27159265,  1.70079633);
    v42.origin.x = a2;
    v42.origin.y = a3;
    v42.size.width = a4;
    v42.size.height = a5;
    double v16 = CGRectGetMaxX(v42);
    v43.origin.x = a2;
    v43.origin.y = a3;
    v43.size.width = a4;
    v43.size.height = a5;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v16,  CGRectGetMidY(v43),  13.0,  -1.70079633,  1.70079633);
    v44.origin.x = a2;
    v44.origin.y = a3;
    v44.size.width = a4;
    v44.size.height = a5;
    double v17 = CGRectGetMaxX(v44);
    v45.origin.x = a2;
    v45.origin.y = a3;
    v45.size.width = a4;
    v45.size.height = a5;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v17,  CGRectGetMaxY(v45),  13.0,  -1.70079633,  -3.01159265);
    v46.origin.x = a2;
    v46.origin.y = a3;
    v46.size.width = a4;
    v46.size.height = a5;
    double v18 = CGRectGetMidX(v46);
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v18,  CGRectGetMaxY(v47),  13.0,  -0.13,  -3.01159265);
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    double v19 = CGRectGetMinX(v48);
    v49.origin.x = a2;
    v49.origin.y = a3;
    v49.size.width = a4;
    v49.size.height = a5;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v19,  CGRectGetMaxY(v49),  13.0,  -0.13,  -1.44079633);
    v50.origin.x = a2;
    v50.origin.y = a3;
    v50.size.width = a4;
    v50.size.height = a5;
    double v20 = CGRectGetMinX(v50);
    v51.origin.x = a2;
    v51.origin.y = a3;
    v51.size.width = a4;
    v51.size.height = a5;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v20,  CGRectGetMidY(v51),  13.0,  1.44079633,  -1.44079633);
    -[UIBezierPath closePath](v12, "closePath");
  }

  else
  {
    CGFloat v21 = a5 + -4.0;
    CGFloat v22 = a4 + -4.0;
    CGFloat v23 = a3 + 2.0;
    CGFloat v24 = a2 + 2.0;
    v52.origin.x = v24;
    v52.origin.y = v23;
    v52.size.width = v22;
    v52.size.height = v21;
    CGFloat v25 = CGRectGetMinX(v52) + 9.0;
    v53.origin.x = v24;
    v53.origin.y = v23;
    v53.size.width = v22;
    v53.size.height = v21;
    double v26 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v25,  CGRectGetMinY(v53) + 9.0,  9.0);
    double v12 = (UIBezierPath *)objc_claimAutoreleasedReturnValue(v26);

    v54.origin.x = v24;
    v54.origin.y = v23;
    v54.size.width = v22;
    v54.size.height = v21;
    CGFloat v27 = CGRectGetMaxX(v54) + -9.0;
    v55.origin.x = v24;
    v55.origin.y = v23;
    v55.size.width = v22;
    v55.size.height = v21;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v27,  CGRectGetMinY(v55) + 9.0,  9.0,  -1.57079633,  0.0);
    v56.origin.x = v24;
    v56.origin.y = v23;
    v56.size.width = v22;
    v56.size.height = v21;
    CGFloat v28 = CGRectGetMaxX(v56) + -9.0;
    v57.origin.x = v24;
    v57.origin.y = v23;
    v57.size.width = v22;
    v57.size.height = v21;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v28,  CGRectGetMaxY(v57) + -9.0,  9.0,  0.0);
    v58.origin.x = v24;
    v58.origin.y = v23;
    v58.size.width = v22;
    v58.size.height = v21;
    CGFloat v29 = CGRectGetMidX(v58) + 25.0 + 1.0;
    v59.origin.x = v24;
    v59.origin.y = v23;
    v59.size.width = v22;
    v59.size.height = v21;
    -[UIBezierPath addLineToPoint:](v12, "addLineToPoint:", v29, CGRectGetMaxY(v59));
    v60.origin.x = v24;
    v60.origin.y = v23;
    v60.size.width = v22;
    v60.size.height = v21;
    CGFloat v30 = CGRectGetMidX(v60) + 25.0 + -6.5 + 1.0;
    v61.origin.x = v24;
    v61.origin.y = v23;
    v61.size.width = v22;
    v61.size.height = v21;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v30,  CGRectGetMaxY(v61) + 1.0,  6.5,  0.0,  -1.57079633);
    v62.origin.x = v24;
    v62.origin.y = v23;
    v62.size.width = v22;
    v62.size.height = v21;
    CGFloat v31 = CGRectGetMidX(v62) + -25.0 + 6.5 + -1.0;
    v63.origin.x = v24;
    v63.origin.y = v23;
    v63.size.width = v22;
    v63.size.height = v21;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v31,  CGRectGetMaxY(v63) + 1.0,  6.5,  -1.57079633,  -3.14159265);
    v64.origin.x = v24;
    v64.origin.y = v23;
    v64.size.width = v22;
    v64.size.height = v21;
    CGFloat v32 = CGRectGetMidX(v64) + -25.0 + -1.0;
    v65.origin.x = v24;
    v65.origin.y = v23;
    v65.size.width = v22;
    v65.size.height = v21;
    -[UIBezierPath addLineToPoint:](v12, "addLineToPoint:", v32, CGRectGetMaxY(v65));
    v66.origin.x = v24;
    v66.origin.y = v23;
    v66.size.width = v22;
    v66.size.height = v21;
    CGFloat v33 = CGRectGetMinX(v66) + 9.0;
    v67.origin.x = v24;
    v67.origin.y = v23;
    v67.size.width = v22;
    v67.size.height = v21;
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v33,  CGRectGetMaxY(v67) + -9.0,  9.0,  1.57079633,  3.14159265);
    v68.origin.x = v24;
    v68.origin.y = v23;
    v68.size.width = v22;
    v68.size.height = v21;
    double v34 = CGRectGetMinX(v68);
    v69.origin.x = v24;
    v69.origin.y = v23;
    v69.size.width = v22;
    v69.size.height = v21;
    -[UIBezierPath addLineToPoint:](v12, "addLineToPoint:", v34, CGRectGetMinY(v69) + 9.0);
  }

  return v12;
}

UIBezierPath *ZWResizeGrabberPath(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8 = objc_alloc_init(&OBJC_CLASS___UIBezierPath);
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  double MinX = CGRectGetMinX(v18);
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  MinX,  CGRectGetMinY(v19),  10.0,  -3.14159265,  3.14159265);
  -[UIBezierPath closePath](v8, "closePath");
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  double MidX = CGRectGetMidX(v20);
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  MidX,  CGRectGetMinY(v21),  10.0,  -3.14159265,  3.14159265);
  -[UIBezierPath closePath](v8, "closePath");
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  double MaxX = CGRectGetMaxX(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  MaxX,  CGRectGetMinY(v23),  10.0,  -3.14159265,  3.14159265);
  -[UIBezierPath closePath](v8, "closePath");
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  double v12 = CGRectGetMinX(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v12,  CGRectGetMidY(v25),  10.0,  -3.14159265,  3.14159265);
  -[UIBezierPath closePath](v8, "closePath");
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  double v13 = CGRectGetMaxX(v26);
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v13,  CGRectGetMidY(v27),  10.0,  -3.14159265,  3.14159265);
  -[UIBezierPath closePath](v8, "closePath");
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  double v14 = CGRectGetMinX(v28);
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v14,  CGRectGetMaxY(v29),  10.0,  -3.14159265,  3.14159265);
  -[UIBezierPath closePath](v8, "closePath");
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  double v15 = CGRectGetMidX(v30);
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v15,  CGRectGetMaxY(v31),  10.0,  -3.14159265,  3.14159265);
  -[UIBezierPath closePath](v8, "closePath");
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  double v16 = CGRectGetMaxX(v32);
  v33.origin.x = a1;
  v33.origin.y = a2;
  v33.size.width = a3;
  v33.size.height = a4;
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v16,  CGRectGetMaxY(v33),  10.0,  -3.14159265,  3.14159265);
  -[UIBezierPath closePath](v8, "closePath");
  return v8;
}

void ZWSetTestingScreenSize(double a1, double a2)
{
  TestingScreenSize_0 = *(void *)&a1;
  TestingScreenSize_1 = *(void *)&a2;
}

double ZWGetTestingScreenSize()
{
  return *(double *)&TestingScreenSize_0;
}

void sub_5668( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_57D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

LABEL_34:
          CGRect v32 = (void *)objc_claimAutoreleasedReturnValue([v7 normalizedEventRepresentation:0 scale:1]);
          [v32 setAllowsZoomOrb:1];
LABEL_69:
          CGRect v28 = -[ZOTFullscreenEventHandler handleEvent:](self->_fullscreenEventHandler, "handleEvent:", v32);
          v7 = v32;
          goto LABEL_70;
        }

  if (fabs(self->_accruedOvershoot) > 15.0)
  {
    self->_isSweepingToNextZoomRow = 1;
    self->_accruedOvershoot = 0.0;
    self->_haveTriedScrollingDuringZoomSweep = 0;
  }

LABEL_33:
        if ((v29 & 0x800) != 0) {
          goto LABEL_22;
        }
        goto LABEL_34;
      }
    }

    else
    {
      v69.x = v12;
      v69.y = v14;
      CGRect v31 = CGRectContainsPoint(v57[1], v69);
      if (v6 != 1 || !v31) {
        goto LABEL_35;
      }
      CGRect v29 = WORD4(v68);
    }

    self->_firstTouchWentIntoSlug = 1;
    if ((v29 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_33;
  }

LABEL_35:
  IsEmpty = CGRectIsEmpty(v57[2]);
  v70.x = v12;
  v70.y = v14;
  if (!CGRectContainsPoint(v57[2], v70) || (BYTE8(v68) & 4) != 0 || v15 >= 2)
  {
    if (!IsEmpty)
    {
      CGRect v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
      [v43 didGetTouchOutsideZoomMenuWithEventProcessor:self];
LABEL_46:

      goto LABEL_47;
    }

    double v34 = ZWZoomLensBorderThicknessForTouches();
    CGRect v74 = CGRectInset(v57[0], v34, v34);
    x = v74.origin.x;
    y = v74.origin.y;
    height = v74.size.height;
    width = v74.size.width;
    CGRect v75 = CGRectInset(v57[0], -v34, -v34);
    CGRect v37 = v75.origin.x;
    CGRect v38 = v75.origin.y;
    CGRect v39 = v75.size.width;
    CGRect v40 = v75.size.height;
    CGRect v41 = WORD4(v68);
    if ((BYTE8(v68) & 0x10) != 0)
    {
      CGRect v42 = 0;
    }

    else
    {
      v71.x = v12;
      v71.y = v14;
      CGRect v42 = CGRectContainsPoint(v75, v71);
      CGRect v41 = WORD4(v68);
    }

    if ((v41 & 0x100) != 0 && !v42)
    {
      CGRect v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
      [v43 didGetTouchOutsideLensChromeWithEventProcessor:self];
      goto LABEL_46;
    }

    if (v6 == 1)
    {
      v76.origin.x = x;
      v76.origin.y = y;
      v76.size.height = height;
      v76.size.width = width;
      v72.x = v12;
      v72.y = v14;
      CGRect v44 = CGRectContainsPoint(v76, v72);
      self->_firstTouchWentIntoLensContent = v44;
      -[ZOTFullscreenEventHandler setFirstTouchWentIntoLensContent:]( self->_fullscreenEventHandler,  "setFirstTouchWentIntoLensContent:",  v44 | ((BYTE8(v68) & 0x10) >> 4));
      v77.origin.x = v37;
      v77.origin.y = v38;
      v77.size.width = v39;
      v77.size.height = v40;
      v73.x = v12;
      v73.y = v14;
      self->_firstTouchWentIntoLensContentOuterPerimeter = CGRectContainsPoint(v77, v73);
      CGRect v41 = WORD4(v68);
    }

    CGRect v45 = (v41 & 0x90) == 0 && v42;
    firstTouchWentIntoLensContent = self->_firstTouchWentIntoLensContent;
    if (v45)
    {
      if (self->_firstTouchWentIntoLensContent)
      {
        firstTouchWentIntoLensContent = 1;
      }

      else if (v15 == 1 && (v41 & 4) == 0)
      {
LABEL_23:
        if (self->_userIsTouchingScreen)
        {
          CGRect v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
          [v30 blockHomeGestureIfNeededWithEventProcessor:self];
        }

        goto LABEL_13;
      }
    }

    if ((v41 & 4) != 0)
    {
      if (v6 != 1 || (v41 & 0x100) != 0) {
        goto LABEL_68;
      }
    }

    else if ((v41 & 0x20) != 0)
    {
      if ((v41 & 0x140) != 0x40 || !firstTouchWentIntoLensContent) {
        goto LABEL_68;
      }
    }

    else
    {
      CGRect v47 = (v41 >> 8) & 1;
      if (v6 != 1) {
        CGRect v47 = 1;
      }
      if (((v47 | v42) & 1) != 0) {
        goto LABEL_68;
      }
    }

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = __43__ZWTouchEventProcessor__handleTouchEvent___block_invoke_3;
    v51[3] = &unk_6CBC0;
    v51[4] = self;
    dispatch_async(&_dispatch_main_q, v51);
LABEL_68:
    CGRect v32 = (void *)objc_claimAutoreleasedReturnValue([v7 normalizedEventRepresentation:0 scale:1]);

    goto LABEL_69;
  }

  if (![v4 fingerCount]
    && (([v4 isLift] & 1) != 0 || objc_msgSend(v4, "isInRangeLift")))
  {
    if (self->_isZoomPanning)
    {
      CGFloat v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
      [v35 wantsToStopAutopannerWithATVEventProcessor:self];
    }

    if (self->_twoFingersDown)
    {
      twoFingersDownTime = self->_twoFingersDownTime;
      CGRect v37 = +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      if (vabdd_f64(v38, twoFingersDownTime) < 0.25
        && (CGRect v39 = self->_twoFingerTapCount + 1, self->_twoFingerTapCount = v39, v39 <= 5)
        && (_AXSVoiceOverTouchEnabled(v37) || self->_twoFingerTapCount < 2))
      {
        self->_didGetTwoFingerMultiTapGesture = 1;
        objc_initWeak(&location, self);
        CGRect v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor twoFingerTapTimer](self, "twoFingerTapTimer"));
        CGRect v48 = _NSConcreteStackBlock;
        CGRect v49 = 3221225472LL;
        CGRect v50 = __45__ZWAppleTVEventProcessor__handleTouchEvent___block_invoke;
        CGRect v51 = &unk_6CB98;
        objc_copyWeak(&v52, &location);
        [v40 afterDelay:&v48 processBlock:0.25];

        objc_destroyWeak(&v52);
        objc_destroyWeak(&location);
      }

      else
      {
        self->_twoFingerTapCount = 0LL;
      }
    }

    else
    {
      self->_twoFingerTapCount = 0LL;
    }

    CGRect v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor selectButtonTimer](self, "selectButtonTimer", v48, v49, v50, v51));
    CGRect v42 = [v41 isPending];

    if (self->_isZoomPanning
      || (self->_isAdjustingZoomLevel ? (CGRect v43 = 1) : (CGRect v43 = v42),
          (v43 & 1) != 0 || self->_didGetTwoFingerMultiTapGesture || self->_twoFingerTapCount))
    {
      CGRect v44 = 0LL;
    }

    else if (self->_tapPossible && self->_oneFingerDown)
    {
      CGRect v47 = (void *)objc_claimAutoreleasedReturnValue(-[ZWEventProcessor mainDisplayDelegate](self, "mainDisplayDelegate"));
      CGRect v44 = [v47 shouldSendTapEventWithATVEventProcessor:self];
    }

    else
    {
      CGRect v44 = &dword_0 + 1;
    }

    CGRect v45 = (void *)objc_claimAutoreleasedReturnValue(-[ZWAppleTVEventProcessor touchEventRepostQueue](self, "touchEventRepostQueue"));
    -[ZWAppleTVEventProcessor _drainEventRepostQueue:replayEvents:]( self,  "_drainEventRepostQueue:replayEvents:",  v45,  v44);

    self->_twoFingersDown = 0;
    self->_oneFingerDown = 0;
    self->_isZoomPanning = 0;
    self->_isAdjustingZoomLevel = 0;
    self->_isDragging = 0;
    self->_lastTouchDownLocation = CGPointZero;
    -[ZWEventProcessor setCurrentTouchOffset:](self, "setCurrentTouchOffset:", CGPointZero.x, CGPointZero.y);
  }

  return 1;
}

LABEL_13:
  CGRect v28 = 0;
LABEL_70:

  return v28;
}

  return v31;
}

LABEL_15:
  }

  return v6;
}

LABEL_20:
  -[ZWTouchEventProcessor _flipCoordinates:orientation:screenSize:]( self,  "_flipCoordinates:orientation:screenSize:",  v22,  v31,  v33,  v27,  v29,  v40);
  CGRect v39 = v19;
  if ((unint64_t)(v22 - 3) < 2)
  {
    CGRect v19 = v20;
    CGRect v20 = v39;
  }

LABEL_22:
  result.y = v20;
  result.x = v19;
  return result;
}
  }
}
}

LABEL_23:
      id v5 = 0LL;
      break;
  }

  return v5;
}

LABEL_12:
  }
}

    double v13 = 1;
    goto LABEL_13;
  }

  if (v11 == v6)
  {
    double v9 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController longPressGestureRecognizer](self, "longPressGestureRecognizer"));
    if (v9 == v7)
    {
      double v13 = 1;
      goto LABEL_14;
    }

    double v11 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController tapGestureRecognizer](self, "tapGestureRecognizer"));
    double v13 = v11 == v7;
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }

  double v12 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController tapGestureRecognizer](self, "tapGestureRecognizer"));

  if (v12 == v6)
  {
    double v9 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController dummyScrollView](self, "dummyScrollView"));
    double v11 = (id)objc_claimAutoreleasedReturnValue([v9 panGestureRecognizer]);
    if (v11 != v7)
    {
      double v14 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController longPressGestureRecognizer](self, "longPressGestureRecognizer"));
      goto LABEL_11;
    }

    goto LABEL_12;
  }

  double v13 = 0;
LABEL_15:

  return v13;
}

LABEL_42:
        if ([v5 handEventType] == 1
          || [v5 handEventType] == 5)
        {
          objc_storeStrong((id *)&self->_lastDownEvent, obj);
          double v11 = (char *)v193;
        }

        if (!-[ZOTFullscreenEventHandler isMainDisplayZoomedIn](self, "isMainDisplayZoomedIn")
          && !self->_zooming
          && !self->_shouldPerformEditingGesture)
        {
          eventReplayQueue = self->_eventReplayQueue;
          CGRect v51 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
          -[NSMutableArray addObject:](eventReplayQueue, "addObject:", v51);

          double v11 = (char *)v193;
        }

        if (self->_anyFingerDown)
        {
          CGRect v52 = ZOTTimeUnset;
          if (self->_anyFingerDownTime == ZOTTimeUnset) {
            self->_anyFingerDownTime = v7;
          }
          goto LABEL_71;
        }

        CGRect v52 = ZOTTimeUnset;
        *(void *)&self->_twoFingerTapDownWithHold = ZOTTimeUnset;
        self->_firstFingerDownTime = v52;
        self->_secondFingerDownTime = v52;
        self->_thirdFingerDownTime = v52;
        if (((uint64_t (*)(void))_AXSVoiceOverTouchEnabled)())
        {
          Average = SCRCMathGetAverage(&self->_averageVelocity);
          if (Average > 125.0 && self->_shouldPerformEditingGesture)
          {
            currentVector = self->_currentVector;
            CGRect v55 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
            CGRect v56 = ZOTConvertVectorToScreenStandard( (uint64_t)[v55 interfaceOrientationWithFullscreenEventHandler:self],  currentVector);

            CGRect v57 = 43LL;
            if (v56 > 45.0 && v56 < 315.0)
            {
              if (v56 <= 45.0 || v56 > 135.0)
              {
                if (v56 <= 135.0 || v56 > 225.0)
                {
                  if (v56 < 225.0 || v56 > 315.0) {
                    goto LABEL_70;
                  }
                  CGRect v57 = 40LL;
                }

                else
                {
                  CGRect v57 = 42LL;
                }
              }

              else
              {
                CGRect v57 = 41LL;
              }
            }

            CGRect v58 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
            [v58 triggerCommand:v57];
          }
        }

LABEL_70:
        -[ZOTFullscreenEventHandler _scheduleTapTimeout](self, "_scheduleTapTimeout");
LABEL_71:
        v212 = 0u;
        v213 = 0u;
        v210 = 0u;
        v211 = 0u;
        CGRect v59 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
        CGRect v60 = (void *)objc_claimAutoreleasedReturnValue([v59 handInfo]);
        CGRect v61 = (void *)objc_claimAutoreleasedReturnValue([v60 paths]);

        CGRect v62 = [v61 countByEnumeratingWithState:&v210 objects:v218 count:16];
        if (v62)
        {
          CGRect v63 = *(void *)v211;
          CGRect v64 = 0.0;
          do
          {
            for (i = 0LL; i != v62; i = (char *)i + 1)
            {
              if (*(void *)v211 != v63) {
                objc_enumerationMutation(v61);
              }
              CGRect v66 = *(void **)(*((void *)&v210 + 1) + 8LL * (void)i);
              [v66 orbValue];
              if (v64 < v67)
              {
                [v66 orbValue];
                CGRect v64 = v68;
              }
            }

            CGRect v62 = [v61 countByEnumeratingWithState:&v210 objects:v218 count:16];
          }

          while (v62);
        }

        if ((_DWORD)multiTapTimer
          && !self->_snarfing
          && (v193 == 3 || self->_isTrackingHoverText)
          && !self->_ignoreSnarfingForFingerSession
          && -[ZOTFullscreenEventHandler _verifyZoomActionIsAppropriate:](self, "_verifyZoomActionIsAppropriate:", v5))
        {
          -[AXThreadTimer cancel](self->_eventPostTimer, "cancel");
          CGRect v69 = &_dispatch_main_q;
          v209[0] = _NSConcreteStackBlock;
          v209[1] = 3221225472LL;
          v209[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_4;
          v209[3] = &unk_6CBC0;
          v209[4] = self;
          dispatch_async(&_dispatch_main_q, v209);

          self->_snarfing = 1;
          -[ZOTFullscreenEventHandler _middleFingerForEvent:](self, "_middleFingerForEvent:", v5);
          self->_tapPoint.x = v70;
          self->_tapPoint.y = v71;
          -[AXThreadTimer cancel](self->_autopanTimer, "cancel");
          CGRect v72 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
          -[ZOTFullscreenEventHandler postHandCancelWithSenderID:]( self,  "postHandCancelWithSenderID:",  [v72 senderID]);

          autopanDownEvent = self->_autopanDownEvent;
          self->_autopanDownEvent = 0LL;

          CGRect v74 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
          [v74 disableSleepTimer:1];
        }

        IsPad = AXDeviceIsPad();
        CGRect v76 = v193;
        if (v193 > 3) {
          CGRect v77 = IsPad;
        }
        else {
          CGRect v77 = 0;
        }
        if (v77 == 1 && !self->_zooming && !self->_zoomPanning) {
          self->_ignoreSnarfingForFingerSession = 1;
        }
        if (!self->_snarfing) {
          goto LABEL_110;
        }
        CGRect v78 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
        CGRect v79 = (void *)objc_claimAutoreleasedReturnValue([v78 handInfo]);
        if ([v79 initialFingerCount])
        {
          CGRect v80 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
          CGRect v81 = (void *)objc_claimAutoreleasedReturnValue([v80 handInfo]);
          CGRect v82 = [v81 lifetimeFingerCount] < 3;

          if (v82)
          {
            self->_snarfLastTime = v52;
            CGRect v83 = ZOOMLogEvents();
            CGRect v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
            if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
            {
              multiTapTimer = (AXThreadTimer *)objc_claimAutoreleasedReturnValue([v5 record]);
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = multiTapTimer;
              _os_log_impl( &dword_0,  v84,  OS_LOG_TYPE_INFO,  "one of the fingers we were tracking with zoom was cancelled, so stop snarfing: %@",  buf,  0xCu);
            }

            -[AXThreadTimer cancel](self->_tapCountResetTimer, "cancel");
            goto LABEL_100;
          }
        }

        else
        {
        }

        CGRect v76 = v193;
        if (!self->_snarfing)
        {
LABEL_110:
          if (v76) {
            v92 = (char)multiTapTimer;
          }
          else {
            v92 = 1;
          }
          if ((v92 & 1) == 0)
          {
            v95 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
            [v95 dispatchEventToSystem:v5];

            if (self->_allowTimedEventPosting)
            {
              objc_initWeak((id *)buf, self);
              eventPostTimer = self->_eventPostTimer;
              v197[0] = _NSConcreteStackBlock;
              v197[1] = 3221225472LL;
              v197[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_8;
              v197[3] = &unk_6CBC0;
              v197[4] = self;
              -[AXThreadTimer afterDelay:processBlock:](eventPostTimer, "afterDelay:processBlock:", v197, 0.0799999982);
              objc_destroyWeak((id *)buf);
            }

            goto LABEL_229;
          }

          if (v76)
          {
            v93 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
            v94 = [v93 isZoomMovingWithVelocityWithFullscreenEventHandler:self];

            if (v94)
            {
              v196[0] = _NSConcreteStackBlock;
              v196[1] = 3221225472LL;
              v196[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_9;
              v196[3] = &unk_6CBC0;
              v196[4] = self;
              dispatch_async(&_dispatch_main_q, v196);
              self->_snarfLastTime = v7;
            }

            else
            {
              v104 = -[ZOTFullscreenEventHandler _hasReachedFlickVelocity:](self, "_hasReachedFlickVelocity:", v5);
              if (v193 == 1) {
                v105 = v104;
              }
              else {
                v105 = 0;
              }
              if (v105 == 1)
              {
                -[AXThreadTimer cancel](self->_autopanTimer, "cancel");
                if (self->_autopanDownEvent)
                {
                  v106 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
                  [v106 dispatchEventToSystem:self->_autopanDownEvent];

                  v107 = self->_autopanDownEvent;
                  self->_autopanDownEvent = 0LL;
                }

                self->_borderpanMode = 0;
                v108 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
                [v108 dispatchEventToSystem:v5];
              }

              else
              {
                v109 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
                [v109 dispatchEventToSystem:v5];

                v110 = self->_autopanDownEvent;
                self->_autopanDownEvent = 0LL;
              }
            }

            goto LABEL_229;
          }

LABEL_119:
          if (self->_sendingUnzoomedPanFingers)
          {
            v97 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
            [v97 postHandCancelWithSenderID:0x8000000817319374];

            self->_sendingUnzoomedPanFingers = 0;
            -[ZOTFullscreenEventHandler _clearState](self, "_clearState");
          }

          else
          {
            if (self->_anyFingerDownTime == v52
              && !self->_wasPassingThroughSystemGesture
              && (-[ZOTEvent handEventType](self->_lastEvent, "handEventType") != 9
               || [v5 handEventType] != 10))
            {
              v194 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
              v191 = (void *)objc_claimAutoreleasedReturnValue([v194 handInfo]);
              v133 = [v191 isStylus];
              if (v133
                && (v189 = (void *)objc_claimAutoreleasedReturnValue([v5 record]),
                    v188 = (void *)objc_claimAutoreleasedReturnValue([v189 handInfo]),
                    v187 = (void *)objc_claimAutoreleasedReturnValue([v188 paths]),
                    multiTapTimer = (AXThreadTimer *)objc_claimAutoreleasedReturnValue([v187 firstObject]),
                    -[AXThreadTimer altitude](multiTapTimer, "altitude"),
                    v134 > 0.0))
              {
              }

              else
              {
                v169 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
                v170 = (void *)objc_claimAutoreleasedReturnValue([v169 handInfo]);
                v171 = (void *)objc_claimAutoreleasedReturnValue([v170 pathsIncludingMayBeginEvents]);
                v172 = [v171 count];

                if (v133)
                {
                }

                if (!v172) {
                  goto LABEL_229;
                }
              }
            }

            if (-[AXThreadTimer isPending](self->_autopanTimer, "isPending"))
            {
              if ((-[AXThreadTimer isCancelled](self->_autopanTimer, "isCancelled") & 1) == 0)
              {
                autopanEvent = self->_autopanEvent;
                if (autopanEvent)
                {
                  if (!self->_snarfing)
                  {
                    v100 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
                    [v100 dispatchEventToSystem:self->_autopanEvent];

                    autopanEvent = self->_autopanEvent;
                  }

                  self->_autopanEvent = 0LL;
                }
              }
            }

            v101 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
            [v101 endZoomMovementWithFullscreenEventHandler:self];

            if (!self->_snarfing || self->_wasPassingThroughSystemGesture)
            {
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
              [v102 dispatchEventToSystem:v5];
            }

            -[ZOTFullscreenEventHandler _clearState](self, "_clearState");
            -[AXThreadTimer cancel](self->_passthruEventTimer, "cancel");
            v103 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
            [v103 resetEventQueue];
          }

LABEL_229:
          objc_storeStrong((id *)&self->_lastEvent, obj);
          _handleEvent__LastEventTime = *(void *)&v7;
          _handleEvent__LastEventType = v9;
          goto LABEL_230;
        }

        if (!self->_zooming && !self->_zoomPanning && v193 >= 4)
        {
          self->_snarfing = 0;
          self->_ignoreSnarfingForFingerSession = 1;
          self->_eventFingersTracking = 0;
          v98 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
          [v98 dispatchEventToSystem:v5];

          goto LABEL_229;
        }

        if (!(_DWORD)multiTapTimer || self->_isTrackingHoverText)
        {
LABEL_108:
          if (v76) {
            goto LABEL_229;
          }
          goto LABEL_119;
        }

        self->_snarfLastTime = v7;
        -[AXThreadTimer cancel](self->_eventPostTimer, "cancel");
        v111 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
        [v111 resetEventQueue];

        self->_eventFingersTracking = 1;
        snarfFingerCount = self->_snarfFingerCount;
        if (v193)
        {
          v113 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerWithIdentifier:self->_snarfFingerIdentifier]);
          if (v113 && ([v5 chordChanged] | (snarfFingerCount != v193)) != 1)
          {
            [v113 location];
            v117 = v135;
            v118 = v136;
            v114 = v113;
          }

          else
          {
            v114 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerAtIndex:0]);

            self->_snarfFingerIdentifier = (int64_t)[v114 identifier];
            [v114 location];
            v117 = v116;
            v118 = v115;
            if (fabs(v116) == INFINITY || fabs(v115) == INFINITY)
            {
              v119 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
              [v119 location];
              v117 = v120;
              v118 = v121;
            }

            y = self->_trackingLocation.y;
            self->_offsetLocation.x = self->_trackingLocation.x - v117;
            self->_offsetLocation.y = y - v118;
            self->_velocityLastTime = v52;
          }

          v137 = v193;
          if (fabs(v117) == INFINITY || fabs(v118) == INFINITY)
          {
            v138 = (void *)objc_claimAutoreleasedReturnValue([v5 record]);
            [v138 location];
            v117 = v139;
            v118 = v140;

            v137 = v193;
          }

          self->_snarfFingerCount = v137;
          v141 = v117 + self->_offsetLocation.x;
          v142 = v118 + self->_offsetLocation.y;
          self->_trackingLocation.x = v141;
          self->_trackingLocation.y = v142;
          tapCount = self->_tapCount;
          if (tapCount > 1)
          {
            v162 = 0.0;
          }

          else
          {
            *(void *)buf = 0LL;
            v208 = 0.0;
            v144 = [v5 averageLocation];
            v148 = v146;
            v149 = v147;
            if (self->_velocityLastTime == v52)
            {
              self->_velocityLocation.x = v146;
              self->_velocityLocation.y = v147;
              self->_lastPanTime = v52;
            }

            v150 = ZOTDenormalizePoint((uint64_t)v144, v145, v146);
            v190 = ZOTFlipDenormalizedPoint(v151, v152, v150);
            v192 = v153;
            v156 = ZOTDenormalizePoint(v154, v155, self->_velocityLocation.x);
            v159 = ZOTFlipDenormalizedPoint(v157, v158, v156);
            self->_velocityLocation.x = v148;
            self->_velocityLocation.y = v149;
            SCRCMathGetVectorAndDistanceForPoints(buf, &v208, v190, v192, v159, v160);
            v161 = ZOTMainScreenScaleFactor();
            tapCount = self->_tapCount;
            v162 = v208 / v161;
          }

          if (tapCount)
          {
            if (tapCount == 1)
            {
              [v5 averageLocation];
              -[ZOTFullscreenEventHandler _updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:]( self,  "_updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:",  0LL);
              -[AXThreadTimer cancel](self->_tapCountResetTimer, "cancel");
              -[AXThreadTimer cancel](self->_multiTapTimer, "cancel");
              -[ZOTFullscreenEventHandler _handleDoubleTapEvent:newLocation:]( self,  "_handleDoubleTapEvent:newLocation:",  v5,  v141,  v142);
            }

LABEL_228:
            goto LABEL_229;
          }

          v163 = _AXSVoiceOverTouchEnabled(-[AXThreadTimer cancel](self->_tapCountResetTimer, "cancel"));
          if (!(_DWORD)v163 && fabs(self->_mainDisplayZoomLevel + -1.0) < 0.1 && v162 < 20.0)
          {
            self->_sendingUnzoomedPanFingers = 1;
            v164 = self->_lastEvent;
            objc_initWeak((id *)buf, self);
            autopanTimer = self->_autopanTimer;
            v205[0] = _NSConcreteStackBlock;
            v205[1] = 3221225472LL;
            v205[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_183;
            v205[3] = &unk_6CCC0;
            objc_copyWeak(&v207, (id *)buf);
            v166 = v164;
            v206 = v166;
            -[AXThreadTimer afterDelay:processBlock:](autopanTimer, "afterDelay:processBlock:", v205, 0.5);

            objc_destroyWeak(&v207);
            objc_destroyWeak((id *)buf);
          }

          if (self->_sendingUnzoomedPanFingers) {
            goto LABEL_226;
          }
          v167 = fabs(v162) + self->_pannerTrackDistance;
          self->_pannerTrackDistance = v167;
          self->_lastPanTime = v7;
          if (snarfFingerCount != v193) {
            self->_borderpanStartTime = v7 + 0.300000012;
          }
          if (v193 == 1)
          {
            if (self->_borderpanMode) {
              goto LABEL_221;
            }
            if (v7 > self->_borderpanStartTime) {
              goto LABEL_196;
            }
            if (SCRCMathGetAverage(&self->_averageVelocity) < 125.0)
            {
              if (self->_borderpanMode)
              {
LABEL_221:
                x = CGPointZero.x;
                if (CGPointZero.x == self->_initialSingleFingerLocation.x)
                {
                  x = CGPointZero.y;
                  if (x == self->_initialSingleFingerLocation.y)
                  {
                    [v5 magneticLocation];
                    self->_initialSingleFingerLocation.x = x;
                    self->_initialSingleFingerLocation.y = v181;
                  }
                }

                if (self->_snarfing) {
                  -[ZOTFullscreenEventHandler _autoPanIfNecessaryWithEvent:]( self,  "_autoPanIfNecessaryWithEvent:",  v5,  x);
                }
                goto LABEL_226;
              }

LABEL_196:
              v168 = &_dispatch_main_q;
              v204[0] = _NSConcreteStackBlock;
              v204[1] = 3221225472LL;
              v204[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_2_184;
              v204[3] = &unk_6CBC0;
              v204[4] = self;
              dispatch_async(&_dispatch_main_q, v204);

              self->_borderpanMode = 1;
              goto LABEL_221;
            }

            if (!self->_borderpanMode)
            {
LABEL_226:
              if (v7 - *(double *)&_handleEvent__LastUpdateTime >= 0.016)
              {
                objc_msgSend(v5, "averageLocation", v7 - *(double *)&_handleEvent__LastUpdateTime);
                -[ZOTFullscreenEventHandler _updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:]( self,  "_updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:",  0LL);
                _handleEvent__LastUpdateTime = *(void *)&v7;
              }

              goto LABEL_228;
            }
          }

          else if (!self->_borderpanMode)
          {
LABEL_211:
            self->_zoomPanning = 1;
            v175 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
            objc_msgSend( v175,  "fullscreenEventHandler:updateZoomMovementWithPoint:",  self,  ZOTDenormalizePoint((uint64_t)v175, v176, self->_trackingLocation.x));

            goto LABEL_226;
          }

          -[AXThreadTimer cancel](self->_autopanTimer, "cancel");
          self->_borderpanMode = 0;
          goto LABEL_211;
        }

        if (!snarfFingerCount || [v5 handEventType] == 8)
        {
LABEL_100:
          self->_velocityLastTime = v52;
          self->_offsetLocation = CGPointZero;
          SCRCMathClearAverage(&self->_averageVelocity);
          self->_zooming = 0;
          self->_zoomStartOffset = 0.0;
          self->_pannerTrackDistance = 0.0;
          self->_tapDoubleTracking = 0;
          self->_eventFingersTracking = 0;
          self->_zoomPanning = 0;
          self->_snarfFingerCount = 0LL;
          -[AXThreadTimer cancel](self->_editingGestureHoldTimer, "cancel");
          self->_shouldPerformEditingGesture = 0;
          CGRect v85 = &_dispatch_main_q;
          v198[0] = _NSConcreteStackBlock;
          v198[1] = 3221225472LL;
          v198[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_7;
          v198[3] = &unk_6CBC0;
          v198[4] = self;
          dispatch_async(&_dispatch_main_q, v198);

          CGRect v76 = v193;
          if (!self->_currentlyTransititioningBetweenApps || v7 - self->_lastAppTransition > 1.0)
          {
            CGRect v86 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
            multiTapTimer = (AXThreadTimer *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
            -[AXThreadTimer storedZoomLevelWithFullscreenEventHandler:]( multiTapTimer,  "storedZoomLevelWithFullscreenEventHandler:",  self);
            v88 = v87;
            v89 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
            [v89 zoomLocationWithFullscreenEventHandler:self];
            objc_msgSend( v86,  "fullscreenEventHandler:storeZoomLevel:location:zoomed:forKey:",  self,  -[ZOTFullscreenEventHandler isMainDisplayZoomedIn](self, "isMainDisplayZoomedIn") ^ 1,  self->_applicationKey,  v88,  v90,  v91);

            CGRect v76 = v193;
          }

          goto LABEL_108;
        }

        if (self->_pannerTrackDistance > 20.0 && !self->_borderpanMode)
        {
          v123 = &_dispatch_main_q;
          v203[0] = _NSConcreteStackBlock;
          v203[1] = 3221225472LL;
          v203[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_3_185;
          v203[3] = &unk_6CBC0;
          v203[4] = self;
          dispatch_async(&_dispatch_main_q, v203);

          v124 = SCRCMathGetAverage(&self->_averageVelocity);
          if (self->_tapCount != 2)
          {
            if (((uint64_t (*)(void))_AXSVoiceOverTouchEnabled)())
            {
              if (self->_snarfing)
              {
                if (v7 - self->_anyFingerDownTime < 0.35
                  || (v125 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate")),
                      [v125 zoomLevelWithFullscreenEventHandler:self],
                      v127 = v126 < AXZoomMinimumZoomLevel + 0.000001,
                      v125,
                      v127))
                {
                  v128 = self->_currentVector;
                  v129 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
                  v130 = ZOTConvertVectorToScreenStandard( (uint64_t)[v129 interfaceOrientationWithFullscreenEventHandler:self],  v128);

                  if (v124 <= 125.0)
                  {
                    v183 = 0LL;
                  }

                  else
                  {
                    v131 = v130;
                    if (v131 <= 45.0 || v131 >= 315.0)
                    {
                      v132 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerFlickRight](&OBJC_CLASS___VOSGesture, "ThreeFingerFlickRight"));
                    }

                    else if (v131 <= 45.0 || v131 > 135.0)
                    {
                      if (v131 <= 135.0 || v131 > 225.0)
                      {
                        v183 = 0LL;
                        if (v131 < 225.0 || v131 > 315.0) {
                          goto LABEL_246;
                        }
                        v132 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerFlickDown](&OBJC_CLASS___VOSGesture, "ThreeFingerFlickDown"));
                      }

                      else
                      {
                        v132 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerFlickLeft](&OBJC_CLASS___VOSGesture, "ThreeFingerFlickLeft"));
                      }
                    }

                    else
                    {
                      v132 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerFlickUp](&OBJC_CLASS___VOSGesture, "ThreeFingerFlickUp"));
                    }

                    v183 = (void *)v132;
                  }

LABEL_246:
                  multiTapTimer = (AXThreadTimer *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v183,  1LL,  0LL));
                  v186 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
                  [v186 triggerGesture:multiTapTimer];

                  goto LABEL_100;
                }
              }
            }
          }

          multiTapTimer = (AXThreadTimer *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
          -[AXThreadTimer fullscreenEventHandler:continueZoomMovementWithVelocity:angle:]( multiTapTimer,  "fullscreenEventHandler:continueZoomMovementWithVelocity:angle:",  self,  v124,  self->_currentVector);
        }

        if ((v15 & 1) != 0 || v7 - self->_lastPanTime < 0.25 || self->_zooming || self->_shouldPerformEditingGesture)
        {
          self->_tapCount = 0LL;
          if (self->_shouldPerformEditingGesture)
          {
            v173 = objc_alloc(&OBJC_CLASS___NSMutableArray);
            multiTapTimer = (AXThreadTimer *)objc_claimAutoreleasedReturnValue([v5 record]);
            v174 = -[NSMutableArray initWithObjects:](v173, "initWithObjects:", multiTapTimer, 0LL);

            -[ZOTFullscreenEventHandler _drainEventRepostQueue:replayEvents:updateEventTimestamps:]( self,  "_drainEventRepostQueue:replayEvents:updateEventTimestamps:",  v174,  1LL,  1LL);
          }

          self->_tapLastTime = v52;
          self->_tapDoubleLastTime = v52;
          self->_lastPanTime = v52;
        }

        else
        {
          v177 = self->_tapCount;
          if (v177 < 1 || v7 - self->_tapLastTime <= 0.25)
          {
            self->_tapCount = v177 + 1;
            self->_tapLastTime = v7;
            v178 = (id)((uint64_t (*)(void))_AXSVoiceOverTouchEnabled)();
            if (!(_DWORD)v178) {
              v178 = -[ZOTFullscreenEventHandler _scheduleTapTimeout](self, "_scheduleTapTimeout");
            }
            if (_AXSVoiceOverTouchEnabled(v178))
            {
              -[AXThreadTimer cancel](self->_multiTapTimer, "cancel");
              objc_initWeak((id *)buf, self);
              v179 = (void *)self->_tapCount;
              multiTapTimer = self->_multiTapTimer;
              v199[0] = _NSConcreteStackBlock;
              v199[1] = 3221225472LL;
              v199[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_5;
              v199[3] = &unk_6CCE8;
              objc_copyWeak(v201, (id *)buf);
              v200 = v5;
              v201[1] = v179;
              -[AXThreadTimer afterDelay:processBlock:cancelBlock:]( multiTapTimer,  "afterDelay:processBlock:cancelBlock:",  v199,  &__block_literal_global_1,  0.275);

              objc_destroyWeak(v201);
              objc_destroyWeak((id *)buf);
            }

            else
            {
              v184 = self->_tapCount;
              if (v184 >= 3)
              {
                if (v184 == 3)
                {
                  -[AXThreadTimer cancel](self->_tapCountResetTimer, "cancel");
                  -[AXThreadTimer cancel](self->_editingGestureHoldTimer, "cancel");
                  v185 = &_dispatch_main_q;
                  v202[0] = _NSConcreteStackBlock;
                  v202[1] = 3221225472LL;
                  v202[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_4_188;
                  v202[3] = &unk_6CBC0;
                  v202[4] = self;
                  dispatch_async(&_dispatch_main_q, v202);
                }

                self->_tapCount = 0LL;
                self->_tapLastTime = v52;
              }
            }
          }

          else
          {
            self->_tapCount = 1LL;
            self->_tapLastTime = v7;
            self->_sendingUnzoomedPanFingers = 0;
          }
        }

        goto LABEL_100;
      }
    }

    if (v18)
    {
      orbFinger = self->_orbFinger;
      if (orbFinger == -1)
      {
        CGRect v30 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerAtIndex:0]);
        self->_orbFinger = (int64_t)[v30 identifier];

        orbFinger = self->_orbFinger;
      }

      CGRect v31 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerWithIdentifier:orbFinger]);
      [v31 location];
      CGRect v33 = v32;

      v214[0] = _NSConcreteStackBlock;
      v214[1] = 3221225472LL;
      v214[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_3;
      v214[3] = &unk_6CC98;
      v214[4] = self;
      v214[5] = ZOTDenormalizePoint(v34, v35, v33);
      v214[6] = v36;
      dispatch_async(&_dispatch_main_q, v214);
    }

    else
    {
      CGRect v37 = -[ZOTFullscreenEventHandler _middleFingerForEvent:](self, "_middleFingerForEvent:", v5);
      v215[0] = _NSConcreteStackBlock;
      v215[1] = 3221225472LL;
      v215[2] = __42__ZOTFullscreenEventHandler__handleEvent___block_invoke_2;
      v215[3] = &unk_6CC98;
      v215[4] = self;
      v215[5] = ZOTDenormalizePoint((uint64_t)v37, v38, v39);
      v215[6] = v40;
      dispatch_async(&_dispatch_main_q, v215);
      self->_orbSnarfing = 0;
      self->_orbFinger = -1LL;
    }
  }

LABEL_230:
  return 1;
}

void sub_E60C(_Unwind_Exception *a1)
{
}

LABEL_17:
  if (self->_anyTrackpadFingerDown)
  {
    anyTrackpadFingerDownTime = self->_anyTrackpadFingerDownTime;
    double v15 = ZOTTimeUnset;
    if (anyTrackpadFingerDownTime == ZOTTimeUnset) {
      self->_anyTrackpadFingerDownTime = *(double *)&v6;
    }
  }

  else
  {
    double v15 = ZOTTimeUnset;
    *(void *)&self->_firstTrackpadFingerDownTime = ZOTTimeUnset;
    self->_secondTrackpadFingerDownTime = v15;
    self->_thirdTrackpadFingerDownTime = v15;
    -[ZOTFullscreenEventHandler _scheduleTrackpadTapTimeout](self, "_scheduleTrackpadTapTimeout");
  }

  trackpadSnarfing = self->_trackpadSnarfing;
  if (v9 && !self->_trackpadSnarfing && v7 == (_BYTE *)&dword_0 + 3)
  {
    secondTrackpadFingerDownTime = self->_secondTrackpadFingerDownTime;
    double v12 = *(double *)&v6 - secondTrackpadFingerDownTime;
    CGRect v18 = secondTrackpadFingerDownTime == v15;
    anyTrackpadFingerDownTime = 0.75;
    CGRect v19 = v18 || v12 <= 0.75;
    if (!v19
      || (firstTrackpadFingerDownTime = self->_firstTrackpadFingerDownTime, firstTrackpadFingerDownTime != v15)
      && (anyTrackpadFingerDownTime = *(double *)&v6 - firstTrackpadFingerDownTime,
          double v12 = 0.75,
          anyTrackpadFingerDownTime > 0.75))
    {
      if (self->_trackpadSnarfing) {
        CGRect v21 = v9;
      }
      else {
        CGRect v21 = 0;
      }
      if (v21 != 1) {
        goto LABEL_88;
      }
      self->_trackpadEventFingersTracking = 1;
      goto LABEL_49;
    }

    self->_trackpadSnarfing = 1;
    CGRect v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTEvent record](v4, "record"));
    -[ZOTFullscreenEventHandler postHandCancelWithSenderID:]( self,  "postHandCancelWithSenderID:",  [v22 senderID]);

    CGRect v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
    [v23 disableSleepTimer:1];

    trackpadSnarfing = self->_trackpadSnarfing;
  }

  if (trackpadSnarfing)
  {
    CGRect v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTEvent record](v4, "record"));
    CGRect v25 = (void *)objc_claimAutoreleasedReturnValue([v24 handInfo]);
    if ([v25 initialFingerCount])
    {
      CGRect v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTEvent record](v4, "record"));
      CGRect v27 = (void *)objc_claimAutoreleasedReturnValue([v26 handInfo]);
      CGRect v28 = [v27 lifetimeFingerCount];

      if (v28 <= 2)
      {
        CGRect v29 = ZOOMLogEvents();
        CGRect v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          CGRect v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTEvent record](v4, "record"));
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v31;
          _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_INFO,  "one of the trackpad fingers we were tracking with zoom was cancelled, so stop snarfing: %@",  buf,  0xCu);
        }

        -[AXThreadTimer cancel](self->_trackpadTapCountResetTimer, "cancel");
        goto LABEL_80;
      }
    }

    else
    {
    }
  }

  if (self->_trackpadSnarfing) {
    CGRect v32 = v9;
  }
  else {
    CGRect v32 = 0;
  }
  if ((v32 & 1) != 0)
  {
    self->_trackpadEventFingersTracking = 1;
    if (v7)
    {
LABEL_49:
      trackpadSnarfFingerCount = self->_trackpadSnarfFingerCount;
      double v34 = (void *)objc_claimAutoreleasedReturnValue( -[ZOTEvent fingerWithIdentifier:]( v4,  "fingerWithIdentifier:",  self->_trackpadSnarfFingerIdentifier,  anyTrackpadFingerDownTime,  v12));
      if (v34 && !-[ZOTEvent chordChanged](v4, "chordChanged") && (char *)trackpadSnarfFingerCount == v7)
      {
        [v34 location];
        CGRect v36 = v35;
        CGRect v38 = v37;
      }

      else
      {
        CGRect v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTEvent fingerAtIndex:](v4, "fingerAtIndex:", 0LL));

        self->_trackpadSnarfFingerIdentifier = (int64_t)[v39 identifier];
        [v39 location];
        CGRect v36 = v41;
        CGRect v38 = v40;
        if (fabs(v41) == INFINITY || fabs(v40) == INFINITY)
        {
          CGRect v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTEvent record](v4, "record"));
          [v42 location];
          CGRect v36 = v43;
          CGRect v38 = v44;
        }

        y = self->_trackingTrackpadLocation.y;
        self->_trackpadOffsetLocation.x = self->_trackingTrackpadLocation.x - v36;
        self->_trackpadOffsetLocation.y = y - v38;
        self->_trackpadVelocityLastTime = v15;
        double v34 = v39;
      }

      if (fabs(v36) == INFINITY || fabs(v38) == INFINITY)
      {
        CGRect v46 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTEvent record](v4, "record"));
        [v46 location];
        CGRect v36 = v47;
        CGRect v38 = v48;
      }

      self->_trackpadSnarfFingerCount = (unint64_t)v7;
      CGRect v49 = v36 + self->_trackpadOffsetLocation.x;
      CGRect v50 = v38 + self->_trackpadOffsetLocation.y;
      self->_trackingTrackpadLocation.x = v49;
      self->_trackingTrackpadLocation.y = v50;
      trackpadTapCount = self->_trackpadTapCount;
      if (trackpadTapCount > 1) {
        goto LABEL_64;
      }
      CGRect v72 = 0LL;
      *(void *)buf = 0LL;
      -[ZOTEvent averageLocation](v4, "averageLocation");
      CGRect v18 = self->_trackpadVelocityLastTime == v15;
      CGRect v54 = v53;
      x = v52;
      if (!v18)
      {
        x = self->_trackpadVelocityLocation.x;
        CGRect v54 = self->_trackpadVelocityLocation.y;
      }

      self->_trackpadVelocityLocation.x = v52;
      self->_trackpadVelocityLocation.y = v53;
      SCRCMathGetVectorAndDistanceForPoints(buf, &v72, v52, v53, x, v54);
      trackpadTapCount = self->_trackpadTapCount;
      if (trackpadTapCount)
      {
LABEL_64:
        if (trackpadTapCount == 1)
        {
          -[ZOTEvent averageLocation](v4, "averageLocation");
          -[ZOTFullscreenEventHandler _updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:]( self,  "_updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:",  1LL);
          -[AXThreadTimer cancel](self->_trackpadTapCountResetTimer, "cancel");
          -[ZOTFullscreenEventHandler _handleTrackpadDoubleTapEvent:newLocation:]( self,  "_handleTrackpadDoubleTapEvent:newLocation:",  v4,  v49,  v50);
        }
      }

      else
      {
        -[AXThreadTimer cancel](self->_trackpadTapCountResetTimer, "cancel");
      }

      goto LABEL_88;
    }

    if (!self->_trackpadSnarfFingerCount || -[ZOTEvent handEventType](v4, "handEventType") == 8) {
      goto LABEL_80;
    }
    if (self->_trackpadZooming)
    {
      self->_trackpadTapCount = 0LL;
      self->_trackpadTapLastTime = v15;
      self->_trackpadTapDoubleLastTime = v15;
    }

    else
    {
      CGRect v56 = self->_trackpadTapCount;
      if (v56 < 1 || *(double *)&v6 - self->_trackpadTapLastTime <= 0.25)
      {
        self->_trackpadTapCount = v56 + 1;
        self->_trackpadTapLastTime = *(double *)&v6;
        -[ZOTFullscreenEventHandler _scheduleTrackpadTapTimeout](self, "_scheduleTrackpadTapTimeout");
        CGRect v57 = self->_trackpadTapCount;
        if (v57 == 3)
        {
          -[AXThreadTimer cancel](self->_trackpadTapCountResetTimer, "cancel");
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = __50__ZOTFullscreenEventHandler__handleTrackpadEvent___block_invoke;
          block[3] = &unk_6CBC0;
          block[4] = self;
          dispatch_async(&_dispatch_main_q, block);
        }

        else if (v57 < 4)
        {
          goto LABEL_80;
        }

        self->_trackpadTapCount = 0LL;
        self->_trackpadTapLastTime = v15;
        goto LABEL_80;
      }

      self->_trackpadTapCount = 1LL;
      self->_trackpadTapLastTime = *(double *)&v6;
    }

  v8[17] = 0LL;
}

    LOBYTE(v20) = 0;
    goto LABEL_18;
  }

  CGRect v38 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  objc_msgSend(v38, "offsetByPanningWithDelta:axis:zoomFactor:", 4, x, y, v39);
  CGRect v28 = v40;

  CGRect v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  objc_msgSend(v41, "offsetIgnoringValidOffsetConstraintsByPanningWithDelta:axis:zoomFacotr:", 4, x, y, v42);
  CGRect v44 = v43;

LABEL_16:
  CGRect v45 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  objc_msgSend(v45, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", v9, v27, v44, v33, v28);

  -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", v33, v28);
  CGRect v46 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  objc_msgSend(v46, "updateZoomFactor:panOffset:animated:animationDuration:completion:", v11, 0);

LABEL_18:
  CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensDragXConstraint](self, "lensDragXConstraint"));
  CGRect v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensDragYConstraint](self, "lensDragYConstraint"));
  if (-[ZWKeyboardContext isKeyboardVisible](self->_kbContext, "isKeyboardVisible")
    && !-[ZWKeyboardContext userMovedKeyboardLens](self->_kbContext, "userMovedKeyboardLens"))
  {
    CGRect v77 = v8;
    CGRect v49 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    CGRect v50 = (void *)objc_claimAutoreleasedReturnValue([v49 zoomPreferredCurrentLensMode]);
    CGRect v51 = [v50 isEqual:AXZoomLensModeWindow];

    if (v51)
    {
      CGRect v52 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
      [v52 zoomWindowFrame];
      CGRect v54 = v53;
      CGRect v56 = v55;

      CGRect v57 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensWidthConstraint](self, "lensWidthConstraint"));
      [v57 setConstant:v54];

      CGRect v58 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensHeightConstraint](self, "lensHeightConstraint"));
      [v58 setConstant:v56];

      CGRect v59 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      CGRect v60 = (void *)objc_claimAutoreleasedReturnValue([v59 view]);
      [v60 frame];
      CGRect v62 = (v61 - v54) * 0.5;
      [v18 constant];
      [v18 setConstant:v63 + v62];

      CGRect v64 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      CGRect v65 = (void *)objc_claimAutoreleasedReturnValue([v64 view]);
      [v65 frame];
      CGRect v67 = v66 - v56;
      [v19 constant];
      [v19 setConstant:v68 + v67];
    }

    a6 = v21;
    if ((v77 & 1) != 0) {
      goto LABEL_21;
    }
LABEL_26:
    double v17 = v11;
LABEL_27:
    [v18 constant];
    [v18 setConstant:x + v69];
    CGRect v47 = 0;
    CGRect v48 = 0;
    if ((v20 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_29;
  }

  if ((v8 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_21:
  CGRect v47 = 1;
  double v17 = v11;
  if ((v20 & 1) == 0)
  {
LABEL_28:
    [v19 constant];
    [v19 setConstant:y + v70];
    CGRect v48 = 1;
    goto LABEL_29;
  }

  CGRect v48 = 0;
LABEL_29:
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke;
  v85[3] = &unk_6CDA8;
  CGRect v71 = v15;
  CGRect v86 = v71;
  CGRect v87 = self;
  v88 = a6;
  CGRect v72 = objc_retainBlock(v85);
  CGRect v73 = v72;
  if ((v48 & 1) != 0 || !v47)
  {
    CGRect v75 = v78 == v15;
    CGRect v74 = v79;
    [v79 setNeedsLayout];
    if (v17) {
      CGRect v76 = 0.4;
    }
    else {
      CGRect v76 = 0.0;
    }
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472LL;
    v83[2] = __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke_2;
    v83[3] = &unk_6CBC0;
    CGRect v84 = v79;
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472LL;
    v80[2] = __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke_3;
    v80[3] = &unk_6D258;
    CGRect v82 = v75;
    v80[4] = self;
    CGRect v81 = v73;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v83,  v80,  v76);
  }

  else
  {
    ((void (*)(void *))v72[2])(v72);
    CGRect v74 = v79;
  }
}

    CGRect v61 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
    [v61 setNeedsLayout];

    CGRect v62 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotingView](self, "circlePivotingView"));
    [v62 setNeedsLayout];

    CGRect v63 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController slugRingView](self, "slugRingView"));
    [v63 setNeedsLayout];

    CGRect v64 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController topTriangleView](self, "topTriangleView"));
    [v64 setNeedsLayout];

    CGRect v65 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController rightTriangleView](self, "rightTriangleView"));
    [v65 setNeedsLayout];

    CGRect v66 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController bottomTriangleView](self, "bottomTriangleView"));
    [v66 setNeedsLayout];

    CGRect v67 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController leftTriangleView](self, "leftTriangleView"));
    [v67 setNeedsLayout];

    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = __57__ZWZoomSlugViewController__updateSlugAppearanceForMode___block_invoke;
    v68[3] = &unk_6CBC0;
    v68[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v68,  0LL,  ZWDefaultZoomAnimationDuration(),  0.0);
    -[ZWZoomSlugViewController setSlugAppearanceState:](self, "setSlugAppearanceState:", a3);
  }

LABEL_80:
    self->_trackpadVelocityLastTime = v15;
    self->_trackpadOffsetLocation = CGPointZero;
    SCRCMathClearAverage(&self->_averageTrackpadVelocity);
    self->_trackpadZooming = 0;
    self->_zoomStartOffset = 0.0;
    self->_tapDoubleTrackingForTrackpad = 0;
    self->_trackpadEventFingersTracking = 0;
    self->_trackpadSnarfFingerCount = 0LL;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = __50__ZOTFullscreenEventHandler__handleTrackpadEvent___block_invoke_2;
    v70[3] = &unk_6CBC0;
    v70[4] = self;
    dispatch_async(&_dispatch_main_q, v70);
    if (!self->_currentlyTransititioningBetweenApps || *(double *)&v6 - self->_lastAppTransition > 1.0)
    {
      CGRect v58 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
      CGRect v59 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
      [v59 storedZoomLevelWithFullscreenEventHandler:self];
      CGRect v61 = v60;
      CGRect v62 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
      [v62 zoomLocationWithFullscreenEventHandler:self];
      objc_msgSend( v58,  "fullscreenEventHandler:storeZoomLevel:location:zoomed:forKey:",  self,  -[ZOTFullscreenEventHandler isMainDisplayZoomedIn](self, "isMainDisplayZoomedIn") ^ 1,  self->_applicationKey,  v61,  v63,  v64);
    }
  }

  if (!v7
    && (self->_anyTrackpadFingerDownTime != v15
     || -[ZOTEvent handEventType](self->_lastTrackpadEvent, "handEventType") == 9
     && -[ZOTEvent handEventType](v4, "handEventType") == 10))
  {
    CGRect v65 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler zoomDelegate](self, "zoomDelegate"));
    [v65 zoomLevelWithFullscreenEventHandler:self];
    self->_mainDisplayZoomLevel = v66;

    self->_anyTrackpadFingerDownTime = v15;
    self->_trackpadZooming = 0;
  }

LABEL_88:
  lastTrackpadEvent = self->_lastTrackpadEvent;
  self->_lastTrackpadEvent = v4;

  if (v11)
  {
    CGRect v68 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTFullscreenEventHandler eventDelegate](self, "eventDelegate"));
    [v68 postHandCancelWithSenderID:0x8000000817319374];
  }

  return v11;
}

void sub_F538( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_F784( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

LABEL_28:
      CGRect v20 = 139LL;
      goto LABEL_29;
    }

    if (v16 > 0.2)
    {
      double v17 = 216LL;
      if (v6) {
        double v17 = 656LL;
      }
      SCRCMathClearAverage((char *)self + v17);
    }
  }

  if (!v6) {
    goto LABEL_28;
  }
LABEL_25:
  CGRect v20 = 140LL;
LABEL_29:
  *(double *)&(&self->super.isa)[v20] = Current;
}

void sub_10E2C(_Unwind_Exception *a1)
{
}

void sub_11950( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_154A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

LABEL_11:
  CGRect v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v42 frame];
  CGRect v44 = v43;
  CGRect v46 = v45;

  y = CGPointZero.y;
  CGRect v48 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
  objc_msgSend(v48, "setFrame:", CGPointZero.x, y, v44, v46);

  CGRect v49 = -[ZWZoomDockedLensViewController dockPosition](self, "dockPosition");
  CGRect v50 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
  [v50 setDockPosition:v49];

  CGRect v51 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
  [v51 setNeedsLayout];
}

  CGRect v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  CGRect v30 = objc_msgSend(v29, "lensEdgeForTouchAtLocation:", v21, v23);

  CGRect v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  double v34 = (void *)objc_claimAutoreleasedReturnValue([v33 view]);
  if ([v34 isHidden])
  {

    CGRect v31 = 1;
  }

  else
  {
    CGFloat v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
    CGRect v36 = (void *)objc_claimAutoreleasedReturnValue([v35 view]);
    CGRect v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
    CGRect v38 = (void *)objc_claimAutoreleasedReturnValue([v37 view]);
    objc_msgSend(v7, "convertPoint:toView:", v38, x, y);
    CGRect v39 = objc_msgSend(v36, "pointInside:withEvent:", 0);

    CGRect v31 = v39 ^ 1;
  }

LABEL_10:
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}
}

LABEL_51:
      -[ZWZoomDockedLensViewController _layoutDockUIWithFrames:restOfScreeFrame:positionOrientationChanged:]( self,  "_layoutDockUIWithFrames:restOfScreeFrame:positionOrientationChanged:",  v29,  v41,  v42,  v35,  v40,  x,  y,  width,  height);
      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
      return;
    default:
      CGRect v29 = 0LL;
      x = CGRectNull.origin.x;
      y = CGRectNull.origin.y;
      width = CGRectNull.size.width;
      height = CGRectNull.size.height;
      CGRect v41 = CGRectNull.origin.x;
      CGRect v42 = y;
      CGFloat v35 = width;
      goto LABEL_36;
  }

void _appTransitionOccurred(uint64_t a1, void *a2)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "zoomRootViewControllers", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) handleSubstantialAppTransition];
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

void sub_1C828( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

LABEL_205:
        goto LABEL_206;
      default:
        switch(a4)
        {
          case 0x898uLL:
            CGRect v47 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"displayID"]);
            CGRect v48 = [v47 unsignedIntValue];

            v347 = 0u;
            v348 = 0u;
            v345 = 0u;
            v346 = 0u;
            CGRect v49 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
            CGRect v50 = (void *)objc_claimAutoreleasedReturnValue([v49 allKeys]);

            obja = v50;
            CGRect v51 = [v50 countByEnumeratingWithState:&v345 objects:v429 count:16];
            if (!v51) {
              goto LABEL_242;
            }
            CGRect v52 = v51;
            v292 = v10;
            v298 = *(void *)v346;
            while (1)
            {
              for (n = 0LL; n != v52; n = (char *)n + 1)
              {
                if (*(void *)v346 != v298) {
                  objc_enumerationMutation(obja);
                }
                CGRect v54 = *(void **)(*((void *)&v345 + 1) + 8LL * (void)n);
                CGRect v55 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
                CGRect v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v54]);

                CGRect v57 = (void *)objc_claimAutoreleasedReturnValue([v56 view]);
                CGRect v58 = (void *)objc_claimAutoreleasedReturnValue([v57 window]);
                CGRect v59 = (void *)objc_claimAutoreleasedReturnValue([v58 screen]);
                CGRect v60 = (void *)objc_claimAutoreleasedReturnValue([v59 displayIdentity]);
                if ([v60 displayID] == v48)
                {

LABEL_253:
                  v427 = @"result";
                  [v56 zoomLevel];
                  v277 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
                  v428 = v277;
                  v278 = &v428;
                  v279 = &v427;
                  goto LABEL_256;
                }

                if (v48)
                {
                }

                else
                {
                  CGRect v61 = [v54 isEqualToString:@"MAIN-DISPLAY"];

                  if ((v61 & 1) != 0) {
                    goto LABEL_253;
                  }
                }
              }

              CGRect v52 = [obja countByEnumeratingWithState:&v345 objects:v429 count:16];
              if (!v52)
              {
LABEL_221:
                CGRect v40 = 0LL;
                goto LABEL_257;
              }
            }

          case 0x899uLL:
            v230 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"displayID"]);
            v231 = [v230 unsignedIntValue];

            v343 = 0u;
            v344 = 0u;
            v341 = 0u;
            v342 = 0u;
            v232 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
            v233 = (void *)objc_claimAutoreleasedReturnValue([v232 allKeys]);

            obja = v233;
            v234 = [v233 countByEnumeratingWithState:&v341 objects:v426 count:16];
            if (!v234)
            {
LABEL_242:
              CGRect v40 = 0LL;
              goto LABEL_258;
            }

            v235 = v234;
            v292 = v10;
            v302 = *(void *)v342;
            while (2)
            {
              v236 = 0LL;
LABEL_213:
              if (*(void *)v342 != v302) {
                objc_enumerationMutation(obja);
              }
              v237 = *(void **)(*((void *)&v341 + 1) + 8 * v236);
              v238 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
              CGRect v56 = (void *)objc_claimAutoreleasedReturnValue([v238 objectForKeyedSubscript:v237]);

              v239 = (void *)objc_claimAutoreleasedReturnValue([v56 view]);
              v240 = (void *)objc_claimAutoreleasedReturnValue([v239 window]);
              v241 = (void *)objc_claimAutoreleasedReturnValue([v240 screen]);
              v242 = (void *)objc_claimAutoreleasedReturnValue([v241 displayIdentity]);
              if ([v242 displayID] == v231)
              {
              }

              else
              {
                if (v231)
                {

                  goto LABEL_219;
                }

                v243 = [v237 isEqualToString:@"MAIN-DISPLAY"];

                if ((v243 & 1) == 0)
                {
LABEL_219:

                  if (v235 == (id)++v236)
                  {
                    v235 = [obja countByEnumeratingWithState:&v341 objects:v426 count:16];
                    if (!v235) {
                      goto LABEL_221;
                    }
                    continue;
                  }

                  goto LABEL_213;
                }
              }

              break;
            }

            v424 = @"result";
            [v56 zoomFrame];
            v280 = NSStringFromCGRect(v446);
            v277 = (void *)objc_claimAutoreleasedReturnValue(v280);
            v425 = v277;
            v278 = &v425;
            v279 = &v424;
LABEL_256:
            CGRect v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v278,  v279,  1LL));

LABEL_257:
            __int128 v10 = v292;
LABEL_258:

            goto LABEL_207;
          case 0x89AuLL:
            v244 = v9;
            v351 = 0u;
            v352 = 0u;
            v349 = 0u;
            v350 = 0u;
            v245 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
            v246 = (void *)objc_claimAutoreleasedReturnValue([v245 allKeys]);

            v247 = [v246 countByEnumeratingWithState:&v349 objects:v430 count:16];
            if (!v247) {
              goto LABEL_244;
            }
            v248 = v247;
            v249 = *(void *)v350;
            while (1)
            {
              for (ii = 0LL; ii != v248; ii = (char *)ii + 1)
              {
                if (*(void *)v350 != v249) {
                  objc_enumerationMutation(v246);
                }
                v251 = *(void **)(*((void *)&v349 + 1) + 8LL * (void)ii);
                v252 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
                v253 = (void *)objc_claimAutoreleasedReturnValue([v252 objectForKeyedSubscript:v251]);

                if ([v251 isEqualToString:@"MAIN-DISPLAY"])
                {
                  [v253 toggleZoomMenu];

LABEL_244:
                  CGRect v40 = 0LL;
                  __int128 v10 = v244;
                  goto LABEL_207;
                }
              }

              v248 = [v246 countByEnumeratingWithState:&v349 objects:v430 count:16];
              if (!v248) {
                goto LABEL_244;
              }
            }

          case 0x89BuLL:
            v254 = v9;
            v339 = 0u;
            v340 = 0u;
            v337 = 0u;
            v338 = 0u;
            v255 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
            v256 = (void *)objc_claimAutoreleasedReturnValue([v255 allKeys]);

            v257 = [v256 countByEnumeratingWithState:&v337 objects:v423 count:16];
            if (!v257) {
              goto LABEL_239;
            }
            v258 = v257;
            v259 = *(void *)v338;
            while (1)
            {
              for (jj = 0LL; jj != v258; jj = (char *)jj + 1)
              {
                if (*(void *)v338 != v259) {
                  objc_enumerationMutation(v256);
                }
                v261 = *(void **)(*((void *)&v337 + 1) + 8LL * (void)jj);
                v262 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
                v263 = (void *)objc_claimAutoreleasedReturnValue([v262 objectForKeyedSubscript:v261]);

                if ([v261 isEqualToString:@"MAIN-DISPLAY"])
                {
                  v264 = objc_claimAutoreleasedReturnValue([v263 getLastSpeakUnderFingerPhrase]);
                  v265 = (void *)v264;
                  if (v264)
                  {
                    v421 = @"result";
                    v422 = v264;
                    CGRect v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v422,  &v421,  1LL));
                  }

                  else
                  {
                    CGRect v40 = 0LL;
                  }

                  __int128 v10 = v254;

                  goto LABEL_271;
                }
              }

              v258 = [v256 countByEnumeratingWithState:&v337 objects:v423 count:16];
              if (!v258)
              {
LABEL_239:
                CGRect v40 = 0LL;
                __int128 v10 = v254;
LABEL_271:

                goto LABEL_207;
              }
            }

          default:
            goto LABEL_39;
        }
    }
  }

  switch(a4)
  {
    case 0x7D2uLL:
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"focusType"]);
      double v12 = (char *)[v11 unsignedIntegerValue];

      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      double v14 = [v13 zoomShouldFollowFocus];

      if ((v14 & 1) == 0 && v12 != (_BYTE *)&dword_0 + 1) {
        goto LABEL_206;
      }
      v289 = v12;
      double v15 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"focusFrame"]);
      v443 = NSRectFromString(v15);
      x = v443.origin.x;
      y = v443.origin.y;
      width = v443.size.width;
      height = v443.size.height;

      CGRect v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"contextId"]);
      v288 = [v20 unsignedIntValue];

      CGRect v21 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"keyboardFrame"]);
      v444 = NSRectFromString(v21);
      CGRect v22 = v444.origin.x;
      CGRect v23 = v444.origin.y;
      CGRect v24 = v444.size.width;
      CGRect v25 = v444.size.height;

      CGRect v26 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"appID"]);
      CGRect v27 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"displayID"]);
      v297 = [v27 unsignedIntValue];

      v400 = 0u;
      v399 = 0u;
      v398 = 0u;
      v397 = 0u;
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      CGRect v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allValues]);

      obj = v29;
      CGRect v30 = [v29 countByEnumeratingWithState:&v397 objects:v442 count:16];
      if (!v30) {
        goto LABEL_264;
      }
      CGRect v31 = v30;
      v304 = *(void *)v398;
      v291 = v26;
      while (2)
      {
        for (kk = 0LL; kk != v31; kk = (char *)kk + 1)
        {
          CGRect v33 = v10;
          if (*(void *)v398 != v304) {
            objc_enumerationMutation(obj);
          }
          double v34 = *(void **)(*((void *)&v397 + 1) + 8LL * (void)kk);
          CGFloat v35 = (void *)objc_claimAutoreleasedReturnValue([v34 view]);
          CGRect v36 = (void *)objc_claimAutoreleasedReturnValue([v35 window]);
          CGRect v37 = (void *)objc_claimAutoreleasedReturnValue([v36 screen]);
          CGRect v38 = (void *)objc_claimAutoreleasedReturnValue([v37 displayIdentity]);
          CGRect v39 = [v38 displayID];

          if (v39 == v297)
          {
            CGRect v26 = v291;
            objc_msgSend( v34,  "handleFocusChangedWithType:rect:keyboardFrame:contextId:appID:",  v289,  v288,  v291,  x,  y,  width,  height,  v22,  v23,  v24,  v25);
            __int128 v10 = v33;
            goto LABEL_264;
          }

          __int128 v10 = v33;
        }

        CGRect v31 = [obj countByEnumeratingWithState:&v397 objects:v442 count:16];
        CGRect v26 = v291;
        if (v31) {
          continue;
        }
        break;
      }

LABEL_264:
LABEL_265:
LABEL_206:
      CGRect v40 = 0LL;
      goto LABEL_207;
    case 0x7D3uLL:
      v396 = 0u;
      v395 = 0u;
      v394 = 0u;
      v393 = 0u;
      CGRect v81 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      CGRect v42 = (void *)objc_claimAutoreleasedReturnValue([v81 allValues]);

      CGRect v82 = [v42 countByEnumeratingWithState:&v393 objects:v441 count:16];
      if (v82)
      {
        CGRect v83 = v82;
        CGRect v84 = *(void *)v394;
        do
        {
          for (mm = 0LL; mm != v83; mm = (char *)mm + 1)
          {
            if (*(void *)v394 != v84) {
              objc_enumerationMutation(v42);
            }
            [*(id *)(*((void *)&v393 + 1) + 8 * (void)mm) handleLockButtonWasPressed];
          }

          CGRect v83 = [v42 countByEnumeratingWithState:&v393 objects:v441 count:16];
        }

        while (v83);
      }

      goto LABEL_205;
    case 0x7D4uLL:
      CGRect v86 = v9;
      v392 = 0u;
      v391 = 0u;
      v390 = 0u;
      v389 = 0u;
      CGRect v87 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      v88 = (void *)objc_claimAutoreleasedReturnValue([v87 allValues]);

      v89 = [v88 countByEnumeratingWithState:&v389 objects:v440 count:16];
      if (v89)
      {
        v90 = v89;
        v91 = *(void *)v390;
        do
        {
          for (nn = 0LL; nn != v90; nn = (char *)nn + 1)
          {
            if (*(void *)v390 != v91) {
              objc_enumerationMutation(v88);
            }
            v93 = *(void **)(*((void *)&v389 + 1) + 8LL * (void)nn);
            v94 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"lensMode"]);
            [v93 handleSettingsAppDidUpdatePreferredLensMode:v94];
          }

          v90 = [v88 countByEnumeratingWithState:&v389 objects:v440 count:16];
        }

        while (v90);
      }

      goto LABEL_144;
    case 0x7D5uLL:
      v95 = v9;
      v96 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"appID"]);
      v97 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"keyboardFrame"]);
      v445 = NSRectFromString(v97);
      v98 = v445.origin.x;
      v99 = v445.origin.y;
      v100 = v445.size.width;
      v101 = v445.size.height;

      v368 = 0u;
      v367 = 0u;
      v366 = 0u;
      v365 = 0u;
      v102 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      v103 = (void *)objc_claimAutoreleasedReturnValue([v102 allValues]);

      v104 = [v103 countByEnumeratingWithState:&v365 objects:v434 count:16];
      if (v104)
      {
        v105 = v104;
        v106 = *(void *)v366;
        do
        {
          for (i1 = 0LL; i1 != v105; i1 = (char *)i1 + 1)
          {
            if (*(void *)v366 != v106) {
              objc_enumerationMutation(v103);
            }
            objc_msgSend( *(id *)(*((void *)&v365 + 1) + 8 * (void)i1),  "handleAppDidBecomeActiveWithID:initialKeyboardFrame:",  v96,  v98,  v99,  v100,  v101);
          }

          v105 = [v103 countByEnumeratingWithState:&v365 objects:v434 count:16];
        }

        while (v105);
      }

      goto LABEL_95;
    case 0x7D6uLL:
      v95 = v9;
      v96 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"appID"]);
      v361 = 0u;
      v362 = 0u;
      v363 = 0u;
      v364 = 0u;
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      v103 = (void *)objc_claimAutoreleasedReturnValue([v108 allValues]);

      v109 = [v103 countByEnumeratingWithState:&v361 objects:v433 count:16];
      if (v109)
      {
        v110 = v109;
        v111 = *(void *)v362;
        do
        {
          for (i2 = 0LL; i2 != v110; i2 = (char *)i2 + 1)
          {
            if (*(void *)v362 != v111) {
              objc_enumerationMutation(v103);
            }
            [*(id *)(*((void *)&v361 + 1) + 8 * (void)i2) handleAppDidEnterBackgroundWithID:v96];
          }

          v110 = [v103 countByEnumeratingWithState:&v361 objects:v433 count:16];
        }

        while (v110);
      }

LABEL_95:
      CGRect v40 = 0LL;
      __int128 v10 = v95;
      goto LABEL_207;
    case 0x7D7uLL:
      v331 = 0u;
      v332 = 0u;
      v329 = 0u;
      v330 = 0u;
      v113 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      CGRect v42 = (void *)objc_claimAutoreleasedReturnValue([v113 allValues]);

      v114 = [v42 countByEnumeratingWithState:&v329 objects:v419 count:16];
      if (v114)
      {
        v115 = v114;
        v116 = *(void *)v330;
        do
        {
          for (i3 = 0LL; i3 != v115; i3 = (char *)i3 + 1)
          {
            if (*(void *)v330 != v116) {
              objc_enumerationMutation(v42);
            }
            [*(id *)(*((void *)&v329 + 1) + 8 * (void)i3) handleDeviceWasUnlocked];
          }

          v115 = [v42 countByEnumeratingWithState:&v329 objects:v419 count:16];
        }

        while (v115);
      }

      goto LABEL_205;
    case 0x7D8uLL:
      v323 = 0u;
      v324 = 0u;
      v321 = 0u;
      v322 = 0u;
      v118 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      CGRect v42 = (void *)objc_claimAutoreleasedReturnValue([v118 allValues]);

      v119 = [v42 countByEnumeratingWithState:&v321 objects:v417 count:16];
      if (v119)
      {
        v120 = v119;
        v121 = *(void *)v322;
        do
        {
          for (i4 = 0LL; i4 != v120; i4 = (char *)i4 + 1)
          {
            if (*(void *)v322 != v121) {
              objc_enumerationMutation(v42);
            }
            [*(id *)(*((void *)&v321 + 1) + 8 * (void)i4) handleHomeButtonWasPressed];
          }

          v120 = [v42 countByEnumeratingWithState:&v321 objects:v417 count:16];
        }

        while (v120);
      }

      goto LABEL_205;
    case 0x7D9uLL:
      CGRect v86 = v9;
      v384 = 0u;
      v383 = 0u;
      v382 = 0u;
      v381 = 0u;
      v123 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      v88 = (void *)objc_claimAutoreleasedReturnValue([v123 allValues]);

      v124 = [v88 countByEnumeratingWithState:&v381 objects:v438 count:16];
      if (v124)
      {
        v125 = v124;
        v126 = *(void *)v382;
        do
        {
          for (i5 = 0LL; i5 != v125; i5 = (char *)i5 + 1)
          {
            if (*(void *)v382 != v126) {
              objc_enumerationMutation(v88);
            }
            v128 = *(void **)(*((void *)&v381 + 1) + 8LL * (void)i5);
            v129 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"idleSlugOpacity"]);
            [v129 floatValue];
            [v128 handleSettingsAppDidUpdateIdleSlugOpacity:v130];
          }

          v125 = [v88 countByEnumeratingWithState:&v381 objects:v438 count:16];
        }

        while (v125);
      }

      goto LABEL_144;
    case 0x7DAuLL:
      v131 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"register"]);
      v132 = [v131 BOOLValue];

      zoomListenersUpdateQueue = (dispatch_queue_s *)self->_zoomListenersUpdateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_4;
      block[3] = &unk_6CDA8;
      v408 = v132;
      block[4] = self;
      v407 = v10;
      dispatch_async(zoomListenersUpdateQueue, block);

      goto LABEL_206;
    case 0x7DBuLL:
    case 0x7DCuLL:
    case 0x7E1uLL:
    case 0x7E2uLL:
      goto LABEL_39;
    case 0x7DDuLL:
      v319 = 0u;
      v320 = 0u;
      v317 = 0u;
      v318 = 0u;
      v134 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      CGRect v42 = (void *)objc_claimAutoreleasedReturnValue([v134 allValues]);

      v135 = [v42 countByEnumeratingWithState:&v317 objects:v416 count:16];
      if (v135)
      {
        v136 = v135;
        v137 = *(void *)v318;
        do
        {
          for (i6 = 0LL; i6 != v136; i6 = (char *)i6 + 1)
          {
            if (*(void *)v318 != v137) {
              objc_enumerationMutation(v42);
            }
            [*(id *)(*((void *)&v317 + 1) + 8 * (void)i6) setBrailleInputUIIsShowing:1];
          }

          v136 = [v42 countByEnumeratingWithState:&v317 objects:v416 count:16];
        }

        while (v136);
      }

      goto LABEL_205;
    case 0x7DEuLL:
      v315 = 0u;
      v316 = 0u;
      v313 = 0u;
      v314 = 0u;
      v139 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      CGRect v42 = (void *)objc_claimAutoreleasedReturnValue([v139 allValues]);

      v140 = [v42 countByEnumeratingWithState:&v313 objects:v415 count:16];
      if (v140)
      {
        v141 = v140;
        v142 = *(void *)v314;
        do
        {
          for (i7 = 0LL; i7 != v141; i7 = (char *)i7 + 1)
          {
            if (*(void *)v314 != v142) {
              objc_enumerationMutation(v42);
            }
            [*(id *)(*((void *)&v313 + 1) + 8 * (void)i7) setBrailleInputUIIsShowing:0];
          }

          v141 = [v42 countByEnumeratingWithState:&v313 objects:v415 count:16];
        }

        while (v141);
      }

      goto LABEL_205;
    case 0x7DFuLL:
      CGRect v86 = v9;
      v388 = 0u;
      v387 = 0u;
      v386 = 0u;
      v385 = 0u;
      v144 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      v88 = (void *)objc_claimAutoreleasedReturnValue([v144 allValues]);

      v145 = [v88 countByEnumeratingWithState:&v385 objects:v439 count:16];
      if (v145)
      {
        v146 = v145;
        v147 = *(void *)v386;
        do
        {
          for (i8 = 0LL; i8 != v146; i8 = (char *)i8 + 1)
          {
            if (*(void *)v386 != v147) {
              objc_enumerationMutation(v88);
            }
            v149 = *(void **)(*((void *)&v385 + 1) + 8LL * (void)i8);
            v150 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"dockPosition"]);
            [v149 handleSettingsAppDidUpdatePreferredDockPosition:v150];
          }

          v146 = [v88 countByEnumeratingWithState:&v385 objects:v439 count:16];
        }

        while (v146);
      }

LABEL_144:
      CGRect v40 = 0LL;
      __int128 v10 = v86;
      goto LABEL_207;
    case 0x7E0uLL:
      v151 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
      v152 = [v151 ignoreLogging];

      if ((v152 & 1) == 0)
      {
        v153 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
        v154 = AXLoggerForFacility();
        v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v154);

        v156 = AXOSLogLevelFromAXLogLevel(2LL);
        if (os_log_type_enabled(v155, v156))
        {
          v157 = AXColorizeFormatLog(2LL, @"Will reset zoom level due to medical ID being shown");
          v158 = (void *)objc_claimAutoreleasedReturnValue(v157);
          v159 = _AXStringForArgs(v158);
          v160 = (void *)objc_claimAutoreleasedReturnValue(v159);
          if (os_log_type_enabled(v155, v156))
          {
            *(_DWORD *)buf = 138543362;
            v414 = v160;
            _os_log_impl(&dword_0, v155, v156, "%{public}@", buf, 0xCu);
          }
        }
      }

      v161 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      v162 = [v161 zoomInStandby];

      if ((v162 & 1) != 0) {
        goto LABEL_206;
      }
      v163 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v163 setZoomInStandby:1];
      goto LABEL_209;
    case 0x7E3uLL:
      v293 = v9;
      v164 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"displayID"]);
      v165 = [v164 unsignedIntValue];

      v359 = 0u;
      v360 = 0u;
      v357 = 0u;
      v358 = 0u;
      v166 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      v167 = (void *)objc_claimAutoreleasedReturnValue([v166 allKeys]);

      objb = v167;
      v168 = [v167 countByEnumeratingWithState:&v357 objects:v432 count:16];
      if (!v168) {
        goto LABEL_268;
      }
      v169 = v168;
      v299 = *(void *)v358;
LABEL_155:
      v170 = 0LL;
      break;
    case 0x7E4uLL:
      v179 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"zoomLevel"]);
      [v179 doubleValue];
      v181 = v180;

      if (v181 < 1.0) {
        goto LABEL_206;
      }
      v293 = v10;
      v182 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"displayID"]);
      v183 = [v182 unsignedIntValue];

      v355 = 0u;
      v356 = 0u;
      v353 = 0u;
      v354 = 0u;
      v184 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      v185 = (void *)objc_claimAutoreleasedReturnValue([v184 allKeys]);

      objb = v185;
      v186 = [v185 countByEnumeratingWithState:&v353 objects:v431 count:16];
      if (!v186) {
        goto LABEL_268;
      }
      v187 = v186;
      v300 = *(void *)v354;
      while (1)
      {
        for (i9 = 0LL; i9 != v187; i9 = (char *)i9 + 1)
        {
          if (*(void *)v354 != v300) {
            objc_enumerationMutation(objb);
          }
          v189 = *(void **)(*((void *)&v353 + 1) + 8LL * (void)i9);
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
          v191 = (void *)objc_claimAutoreleasedReturnValue([v190 objectForKeyedSubscript:v189]);

          v192 = (void *)objc_claimAutoreleasedReturnValue([v191 view]);
          v193 = (void *)objc_claimAutoreleasedReturnValue([v192 window]);
          v194 = (void *)objc_claimAutoreleasedReturnValue([v193 screen]);
          v195 = (void *)objc_claimAutoreleasedReturnValue([v194 displayIdentity]);
          if ([v195 displayID] == v183)
          {

LABEL_267:
            v283 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"zoomLevel"]);
            [v283 doubleValue];
            objc_msgSend(v191, "externalClientSetZoomFactor:");

            goto LABEL_268;
          }

          if (v183)
          {
          }

          else
          {
            v196 = [v189 isEqualToString:@"MAIN-DISPLAY"];

            if ((v196 & 1) != 0) {
              goto LABEL_267;
            }
          }
        }

        v187 = [objb countByEnumeratingWithState:&v353 objects:v431 count:16];
        if (!v187) {
          goto LABEL_268;
        }
      }

    case 0x7E5uLL:
      v293 = v9;
      v197 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"autoPanLocation"]);
      v198 = CGPointFromString(v197);

      v199 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"panningStyle"]);
      v290 = [v199 unsignedIntegerValue];

      v200 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"displayID"]);
      v201 = [v200 unsignedIntValue];

      v335 = 0u;
      v336 = 0u;
      v333 = 0u;
      v334 = 0u;
      v202 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      v203 = (void *)objc_claimAutoreleasedReturnValue([v202 allKeys]);

      objb = v203;
      v204 = [v203 countByEnumeratingWithState:&v333 objects:v420 count:16];
      if (!v204) {
        goto LABEL_268;
      }
      v205 = v204;
      v301 = *(void *)v334;
      while (1)
      {
        for (i10 = 0LL; i10 != v205; i10 = (char *)i10 + 1)
        {
          if (*(void *)v334 != v301) {
            objc_enumerationMutation(objb);
          }
          v207 = *(void **)(*((void *)&v333 + 1) + 8LL * (void)i10);
          v208 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
          v209 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKeyedSubscript:v207]);

          v210 = (void *)objc_claimAutoreleasedReturnValue([v209 view]);
          v211 = (void *)objc_claimAutoreleasedReturnValue([v210 window]);
          v212 = (void *)objc_claimAutoreleasedReturnValue([v211 screen]);
          v213 = (void *)objc_claimAutoreleasedReturnValue([v212 displayIdentity]);
          if ([v213 displayID] == v201)
          {

LABEL_251:
            objc_msgSend(v209, "externalClientWantsToAutopan:withPanningStyle:", v290, v198.x, v198.y);

            goto LABEL_268;
          }

          if (v201)
          {
          }

          else
          {
            v214 = [v207 isEqualToString:@"MAIN-DISPLAY"];

            if ((v214 & 1) != 0) {
              goto LABEL_251;
            }
          }
        }

        v205 = [objb countByEnumeratingWithState:&v333 objects:v420 count:16];
        if (!v205) {
          goto LABEL_268;
        }
      }

    case 0x7E6uLL:
      v311 = 0u;
      v312 = 0u;
      v309 = 0u;
      v310 = 0u;
      v215 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      CGRect v42 = (void *)objc_claimAutoreleasedReturnValue([v215 allValues]);

      v216 = [v42 countByEnumeratingWithState:&v309 objects:v412 count:16];
      if (v216)
      {
        v217 = v216;
        v218 = *(void *)v310;
        do
        {
          for (i11 = 0LL; i11 != v217; i11 = (char *)i11 + 1)
          {
            if (*(void *)v310 != v218) {
              objc_enumerationMutation(v42);
            }
            [*(id *)(*((void *)&v309 + 1) + 8 * (void)i11) handleDragWillStart];
          }

          v217 = [v42 countByEnumeratingWithState:&v309 objects:v412 count:16];
        }

        while (v217);
      }

      goto LABEL_205;
    case 0x7E7uLL:
      v307 = 0u;
      v308 = 0u;
      v305 = 0u;
      v306 = 0u;
      v220 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
      CGRect v42 = (void *)objc_claimAutoreleasedReturnValue([v220 allValues]);

      v221 = [v42 countByEnumeratingWithState:&v305 objects:v411 count:16];
      if (v221)
      {
        v222 = v221;
        v223 = *(void *)v306;
        do
        {
          for (i12 = 0LL; i12 != v222; i12 = (char *)i12 + 1)
          {
            if (*(void *)v306 != v223) {
              objc_enumerationMutation(v42);
            }
            [*(id *)(*((void *)&v305 + 1) + 8 * (void)i12) handleDragWillEnd];
          }

          v222 = [v42 countByEnumeratingWithState:&v305 objects:v411 count:16];
        }

        while (v222);
      }

      goto LABEL_205;
    case 0x7E8uLL:
      v226 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"register"]);
      v227 = [v226 BOOLValue];

      v228 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"attributes"]);
      v229 = (dispatch_queue_s *)self->_zoomListenersUpdateQueue;
      v401[0] = _NSConcreteStackBlock;
      v401[1] = 3221225472LL;
      v401[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_6;
      v401[3] = &unk_6D030;
      v402 = v228;
      v403 = self;
      v405 = v227;
      v404 = v10;
      v163 = v228;
      dispatch_async(v229, v401);

LABEL_209:
      goto LABEL_206;
    default:
      if (a4 == 1000)
      {
        v410[0] = _NSConcreteStackBlock;
        v410[1] = 3221225472LL;
        v410[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke;
        v410[3] = &unk_6CBC0;
        CGRect v62 = self;
        v410[4] = self;
        CGRect v63 = v410;
      }

      else
      {
        if (a4 != 1001) {
          goto LABEL_39;
        }
        v409[0] = _NSConcreteStackBlock;
        v409[1] = 3221225472LL;
        v409[2] = __75__ZWUIServer_processMessage_withIdentifier_fromClientWithIdentifier_error___block_invoke_2;
        v409[3] = &unk_6CBC0;
        CGRect v62 = self;
        v409[4] = self;
        CGRect v63 = v409;
      }

      -[ZWUIServer _waitForControllerShowHideToComplete:](v62, "_waitForControllerShowHideToComplete:", v63);
      goto LABEL_206;
  }

  do
  {
    if (*(void *)v358 != v299) {
      objc_enumerationMutation(objb);
    }
    v171 = *(void **)(*((void *)&v357 + 1) + 8LL * (void)v170);
    v172 = (void *)objc_claimAutoreleasedReturnValue(-[ZWUIServer zoomRootViewControllers](self, "zoomRootViewControllers"));
    v173 = (void *)objc_claimAutoreleasedReturnValue([v172 objectForKeyedSubscript:v171]);

    v174 = (void *)objc_claimAutoreleasedReturnValue([v173 view]);
    v175 = (void *)objc_claimAutoreleasedReturnValue([v174 window]);
    v176 = (void *)objc_claimAutoreleasedReturnValue([v175 screen]);
    v177 = (void *)objc_claimAutoreleasedReturnValue([v176 displayIdentity]);
    if ([v177 displayID] == v165)
    {

LABEL_248:
      [v173 zoomPanOffset];
      v267 = v266;
      v269 = v268;
      [v173 zoomFrame];
      v271 = v270;
      v273 = v272;
      v274 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"direction"]);
      v275 = [v274 isEqualToString:@"left"];

      if (v275)
      {
        v276 = -0.5;
      }

      else
      {
        v281 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"direction"]);
        v282 = [v281 isEqualToString:@"right"];

        if (!v282)
        {
          v284 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"direction"]);
          v285 = [v284 isEqualToString:@"up"];

          if (v285)
          {
            v269 = v269 + v273 * -0.5;
          }

          else
          {
            v286 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"direction"]);
            v287 = [v286 isEqualToString:@"down"];

            if (v287) {
              v269 = v269 + v273 * 0.5;
            }
          }

          goto LABEL_262;
        }

        v276 = 0.5;
      }

      v267 = v267 + v271 * v276;
LABEL_262:
      objc_msgSend(v173, "externalClientSetZoomPanOffset:", v267, v269);

      goto LABEL_268;
    }

    if (v165)
    {
    }

    else
    {
      v178 = [v171 isEqualToString:@"MAIN-DISPLAY"];

      if ((v178 & 1) != 0) {
        goto LABEL_248;
      }
    }

    v170 = (char *)v170 + 1;
  }

  while (v169 != v170);
  v169 = [objb countByEnumeratingWithState:&v357 objects:v432 count:16];
  if (v169) {
    goto LABEL_155;
  }
LABEL_268:

  CGRect v40 = 0LL;
  __int128 v10 = v293;
LABEL_207:

  return v40;
}

LABEL_9:
}

  __int128 v9 = 0;
LABEL_14:

  return v9;
}

  CGRect v37 = x;
  CGRect v38 = y;
  result.y = v38;
  result.x = v37;
  return result;
}

  started = 0;
  if (([v17 inStandbyMode] & 1) == 0 && v71 > AXZoomMinimumZoomLevel)
  {
    usingRelativePushPanning = self->_usingRelativePushPanning;
    started = ZOTShouldStartAutopan( a5,  &usingRelativePushPanning,  v14,  v13,  v70,  x,  y,  v71,  v66,  v67,  v19,  v21,  width,  height);
    self->_usingRelativePushPanning = usingRelativePushPanning;
  }

  return started;
}

LABEL_8:
  if (v16)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_2;
    v36[3] = &unk_6CED8;
    v36[4] = self;
    CGRect v37 = v16;
    double v16 = objc_retainBlock(v36);
  }

  CGRect v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController view](self, "view"));
  CGRect v20 = (void *)objc_claimAutoreleasedReturnValue([v19 window]);

  if (v20)
  {
    CGRect v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController view](self, "view"));
    [v21 layoutIfNeeded];
  }

  if ((_DWORD)v13)
  {
    CGRect v22 = -[ZWZoomLensViewController _shouldDisableLensEffectsForStandbyMode]( self,  "_shouldDisableLensEffectsForStandbyMode");
    CGRect v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
    if (v22)
    {
      CGRect v24 = AXZoomLensEffectNone;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_3;
      v33[3] = &unk_6CE40;
      v33[4] = self;
      CGFloat v35 = v9;
      CGRect v25 = &v34;
      double v34 = v16;
      [v23 updateLensEffect:v24 animated:v9 completion:v33];
    }

    else
    {
      CGRect v26 = AXZoomMinimumZoomLevel;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_6;
      v30[3] = &unk_6CE40;
      v30[4] = self;
      CGRect v32 = v9;
      CGRect v25 = &v31;
      CGRect v31 = v16;
      objc_msgSend( v23,  "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:",  0,  v9,  v30,  CGPointZero.x,  CGPointZero.y,  v26,  -1.0);
    }
  }

  else
  {
    -[ZWZoomLensViewController _updateLensChromeVisibility:animated:completion:]( self,  "_updateLensChromeVisibility:animated:completion:",  1LL,  v9,  0LL);
    CGRect v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController delegate](self, "delegate"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_8;
    v27[3] = &unk_6CE40;
    v27[4] = self;
    CGRect v29 = v9;
    CGRect v25 = &v28;
    uint64_t v28 = v16;
    [v23 zoomLensViewControllerUpdateUIForStandby:self completion:v27];
  }
}

  CGRect v18 = v5;
  CGRect v19 = v6;
  result.height = v19;
  result.width = v18;
  return result;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return NSRequestConcreteImplementation(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  return objc_opt_class(a1);
}

LABEL_21:
LABEL_22:
  CGRect v30 = objc_msgSend(v21, "setNativeFocus", (void)v33);
  AXOverrideRequestingClientType(0LL, v31);

  return v30;
}

void _handleAccessibilitySystemServerDied(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [a1 _accessibilitySystemServerDied];
  objc_autoreleasePoolPop(v2);
}

id _handleAccessibilityRuntimeEvent(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  if (a3 == 1044) {
    return [a5 _handleUpdateElementVisualsNotification];
  }
  if (a3 == 1053) {
    return [a5 _handleNativeFocusItemChangedNotification:a4];
  }
  return result;
}

LABEL_5:
  objc_destroyWeak(&location);
  return 1;
}

  uint64_t v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) slugViewController]);
  if (v6 == v7)
  {
    __int128 v8 = *(unsigned __int8 *)(a1 + 48);

    if (v8)
    {
      [*(id *)(a1 + 40) _slugNormalizedPositionForCurrentPosition];
      __int128 v10 = v9;
      double v12 = v11;
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
      objc_msgSend(v13, "setZoomSlugNormalizedPosition:", v10, v12);
    }
  }

  else
  {
  }

  return [*(id *)(a1 + 40) _updateLensEdgeMaskForZoomController:*(void *)(a1 + 32)];
}

void sub_25A5C(_Unwind_Exception *a1)
{
}

void sub_25D8C(_Unwind_Exception *a1)
{
}

void sub_26788( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_29974( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location)
{
}

LABEL_14:
  CGRect v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  [v25 setDelegate:0];

  CGRect v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  [v26 setDelegate:0];

  CGRect v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));
  [v27 setDelegate:0];

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  [v28 setDelegate:0];

  CGRect v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController keyRepeatTimer](self, "keyRepeatTimer"));
  [v29 cancel];

  CGRect v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController hitTestCategoryAssertion](self, "hitTestCategoryAssertion"));
  [v30 invalidate];

  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ZWRootViewController;
  -[ZWRootViewController dealloc](&v31, "dealloc");
}

  if (v6 >= 0.0 && v6 <= 90.0)
  {
    if (v6 < 35.0)
    {
      id result = 4LL;
LABEL_26:
      double v13 = 1;
      goto LABEL_27;
    }

    __int128 v10 = v6 <= 55.0;
    __int128 v11 = 6;
    double v12 = 2;
LABEL_23:
    if (v10) {
      id result = v11;
    }
    else {
      id result = v12;
    }
    goto LABEL_26;
  }

  if (v6 <= 90.0 || v6 > 180.0)
  {
    if (v6 <= 180.0 || v6 > 270.0)
    {
      id result = 0LL;
      double v13 = 1;
      if (v6 > 270.0 && v6 <= 360.0)
      {
        if (v6 >= 305.0)
        {
          __int128 v10 = v6 <= 325.0;
          __int128 v11 = 5;
          double v12 = 4;
          goto LABEL_23;
        }

        double v13 = 1;
        id result = 1LL;
      }
    }

    else if (v6 >= 215.0)
    {
      double v13 = v6 > 235.0;
      if (v6 > 235.0) {
        id result = 1LL;
      }
      else {
        id result = 9LL;
      }
    }

    else
    {
      double v13 = 0;
      id result = 8LL;
    }
  }

  else
  {
    if (v6 < 125.0)
    {
      id result = 2LL;
      goto LABEL_26;
    }

    double v13 = 0;
    if (v6 <= 145.0) {
      id result = 10LL;
    }
    else {
      id result = 8LL;
    }
  }

void sub_2B48C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

LABEL_41:
}

LABEL_30:
    -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:]( self,  "_moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:",  v34,  v7,  1LL,  1LL,  1LL,  v62,  v63,  *(void *)&v89,  *(void *)&v90);
    goto LABEL_31;
  }

  CGRect v64 = v93;
  if ((v37 & 1) == 0)
  {
    v105.origin.x = v50;
    v105.origin.y = v52;
    v105.size.width = v54;
    v105.size.height = v56;
    v120.origin.x = v18;
    v120.origin.y = v93;
    v120.size.width = v91;
    v120.size.height = v92;
    if (!CGRectContainsRect(v105, v120))
    {
      if (v18 >= v50)
      {
        v112.origin.x = v18;
        v112.origin.y = v93;
        v112.size.width = v91;
        v112.size.height = v92;
        double MaxX = CGRectGetMaxX(v112);
        v113.origin.x = v50;
        v113.origin.y = v52;
        v113.size.width = v54;
        v113.size.height = v56;
        CGRect v82 = MaxX <= CGRectGetMaxX(v113);
        CGRect v64 = v93;
        if (!v82)
        {
          v114.origin.x = v18;
          v114.origin.y = v93;
          v114.size.width = v91;
          v114.size.height = v92;
          CGRect v83 = CGRectGetMaxX(v114);
          v115.origin.x = v50;
          v115.origin.y = v52;
          v115.size.width = v54;
          v115.size.height = v56;
          CGRect v62 = v83 - CGRectGetMaxX(v115);
          CGRect v64 = v93;
        }
      }

      else
      {
        CGRect v62 = v18 - v50;
      }

      if (v64 >= v52)
      {
        v116.origin.x = v18;
        v116.origin.y = v64;
        v116.size.width = v91;
        v116.size.height = v92;
        MaxY = CGRectGetMaxY(v116);
        v117.origin.x = v50;
        v117.origin.y = v52;
        v117.size.width = v54;
        v117.size.height = v56;
        CGRect v82 = MaxY <= CGRectGetMaxY(v117);
        CGRect v64 = v93;
        if (!v82)
        {
          v118.origin.x = v18;
          v118.origin.y = v93;
          v118.size.width = v91;
          v118.size.height = v92;
          CGRect v85 = CGRectGetMaxY(v118);
          v119.origin.x = v50;
          v119.origin.y = v52;
          v119.size.width = v54;
          v119.size.height = v56;
          CGRect v63 = v85 - CGRectGetMaxY(v119);
          CGRect v64 = v93;
        }
      }

      else
      {
        CGRect v63 = v64 - v52;
      }

      CGRect v86 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

      if (v34 != v86) {
        goto LABEL_30;
      }
      CGRect v72 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
      CGRect v73 = v72;
      CGRect v74 = v18;
      CGRect v75 = v64;
      CGRect v76 = v91;
      CGRect v77 = v92;
      goto LABEL_29;
    }
  }

LABEL_31:
  ((void (*)(void *))v36[2])(v36);
}

void sub_2FDDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_2:
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ZWRootViewController;
  -[ZWRootViewController observeValueForKeyPath:ofObject:change:context:]( &v22,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_3:
}

void sub_350E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_3859C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_386A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_387B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_388A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_3898C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_37:
    CGRect v39 = v76;
    goto LABEL_38;
  }

  CGRect v33 = v18;
  double v34 = v24 * 0.5;
  CGFloat v35 = v8 + v10;
  if (v8 <= 0.0 || v35 <= v16)
  {
    CGRect v37 = (uint64_t)v7;
    if (v8 > 0.0)
    {
      if (v37 < 1 || v35 <= v16)
      {
        __int128 v10 = v8 + v10;
        CGRect v31 = (double)(uint64_t)v7;
        CGRect v30 = a5;
        goto LABEL_37;
      }

      CGRect v38 = v12 - v33;
      CGRect v39 = v76;
      goto LABEL_42;
    }

    CGRect v44 = -v16;
    if (v35 >= -v16)
    {
      CGRect v39 = v76;
      if ((v37 & 0x8000000000000000LL) == 0 || v35 >= v44)
      {
LABEL_45:
        __int128 v10 = v35;
        CGRect v31 = (double)(uint64_t)v7;
        CGRect v30 = a5;
        goto LABEL_38;
      }

      CGRect v38 = v12 + v33;
LABEL_42:
      if (fabs(v38) <= 2.0)
      {
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        CGRect v56 = v55;
        if (v55 - self->_lastEdgePanHapticTime > 1.5)
        {
          AudioServicesPlaySystemSound(0x581u);
          self->_lastEdgePanHapticTime = v56;
        }
      }

      goto LABEL_45;
    }

    CGRect v45 = v44 - v35 + self->_accruedOvershoot;
    self->_accruedOvershoot = v45;
    CGRect v46 = fabs(v45) > 3.75 && v12 < -(v33 - v34 * 2.0);
    CGRect v39 = v76;
    if (!v46)
    {
      CGRect v31 = (double)(uint64_t)v7;
      CGRect v30 = a5;
      goto LABEL_34;
    }

    CGRect v31 = (double)(uint64_t)v7;
    CGRect v30 = a5;
    if (self->_haveTriedScrollingDuringZoomSweep) {
      goto LABEL_34;
    }
    CGRect v57 = v33;
    if (self->_inUnitTestingMode)
    {
      CGRect v58 = v34;
      if ((-[ZWRootViewController_UnitTestDelegate scrollContentWithAmount:]( self->_unitTestDelegate,  "scrollContentWithAmount:",  -v34) & 1) != 0)
      {
LABEL_49:
        double v12 = v12 + v58;
        goto LABEL_34;
      }
    }

    else
    {
      CGRect v58 = v34;
      CGRect v66 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
      CGRect v67 = (void *)objc_claimAutoreleasedReturnValue([v66 systemApplication]);
      CGRect v68 = (void *)objc_claimAutoreleasedReturnValue([v67 currentApplications]);
      CGRect v74 = (void *)objc_claimAutoreleasedReturnValue([v68 firstObject]);

      CGRect v69 = (void *)objc_claimAutoreleasedReturnValue([v74 uiElement]);
      CGRect v77 = @"scrollAmount";
      CGRect v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", -(v58 * v25)));
      CGRect v78 = v70;
      CGRect v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v78,  &v77,  1LL));
      CGRect v72 = [v69 performAXAction:2047 withValue:v71];

      if (v72) {
        goto LABEL_49;
      }
    }

    if (v12 <= -v57) {
      goto LABEL_38;
    }
LABEL_55:
    self->_haveTriedScrollingDuringZoomSweep = 1;
    goto LABEL_34;
  }

  CGRect v41 = v35 - v16 + self->_accruedOvershoot;
  self->_accruedOvershoot = v41;
  if (fabs(v41) <= 3.75)
  {
    CGRect v31 = (double)(uint64_t)v7;
    CGRect v30 = a5;
    CGRect v39 = v76;
    goto LABEL_34;
  }

  CGRect v31 = (double)(uint64_t)v7;
  CGRect v30 = a5;
  CGRect v39 = v76;
  if (!self->_haveTriedScrollingDuringZoomSweep && v12 > v33 + v34 * -2.0)
  {
    CGRect v42 = v33;
    if (self->_inUnitTestingMode)
    {
      CGRect v43 = v34;
      if ((-[ZWRootViewController_UnitTestDelegate scrollContentWithAmount:]( self->_unitTestDelegate,  "scrollContentWithAmount:",  v34) & 1) != 0)
      {
LABEL_26:
        double v12 = v12 - v43;
        goto LABEL_34;
      }
    }

    else
    {
      CGRect v43 = v34;
      CGRect v59 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
      CGRect v60 = (void *)objc_claimAutoreleasedReturnValue([v59 systemApplication]);
      CGRect v61 = (void *)objc_claimAutoreleasedReturnValue([v60 currentApplications]);
      CGRect v73 = (void *)objc_claimAutoreleasedReturnValue([v61 firstObject]);

      CGRect v62 = (void *)objc_claimAutoreleasedReturnValue([v73 uiElement]);
      CGRect v79 = @"scrollAmount";
      CGRect v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v25 * v43));
      CGRect v80 = v63;
      CGRect v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
      CGRect v65 = [v62 performAXAction:2047 withValue:v64];

      if (v65) {
        goto LABEL_26;
      }
    }

    if (v12 >= v42) {
      goto LABEL_38;
    }
    goto LABEL_55;
  }

LABEL_38:
  CGRect v47 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController mirrorPanOffsetForRTLIfNecessary:](self, "mirrorPanOffsetForRTLIfNecessary:", v10, v12);
  objc_msgSend(v47, "validPanOffsetForProposedOffset:proposedZoomFactor:");
  CGRect v48 = v12;
  CGRect v50 = v49;
  CGRect v52 = v51;

  CGRect v53 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController mirrorPanOffsetForRTLIfNecessary:](self, "mirrorPanOffsetForRTLIfNecessary:", v10, v48);
  objc_msgSend(v53, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 0);

  -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", v50, v52);
  CGRect v54 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  objc_msgSend(v54, "updateZoomFactor:panOffset:animated:animationDuration:completion:", v5, 0, v39, v50, v52, v30);

  self->_lastWheelDelta = v31;
}

void sub_3C988( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_19:
  if (v33 >= 2.22044605e-16 && self->_careBorderY || vabdd_f64(v22, v18) >= 2.22044605e-16 && self->_careBorderX) {
LABEL_23:
  }
    -[ZWRootViewController stopZoomMovementWithVelocityWithFullscreenEventHandler:]( self,  "stopZoomMovementWithVelocityWithFullscreenEventHandler:",  v41);
}

id LocString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.ZoomTouch.axbundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:v1 value:v1 table:@"ZoomStrings"]);

  return v3;
}

uint64_t ZOTInitializeUtilities()
{
  uint64_t result = AXDeviceIsPad();
  ZOTIsWildcat = result;
  return result;
}

uint64_t ZOTTimeSinceBoot()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v0 timeIntervalSince1970];
  uint64_t v2 = (uint64_t)v1 - ZOTSystemBootTime();

  return v2;
}

uint64_t ZOTSystemBootTime()
{
  uint64_t result = ZOTSystemBootTime___boottime;
  if (!ZOTSystemBootTime___boottime)
  {
    int v4 = 0;
    *(void *)v3 = 0x1500000001LL;
    size_t v1 = 16LL;
    if (sysctl(v3, 2u, &v2, &v1, 0LL, 0LL) == -1) {
      uint64_t result = 0LL;
    }
    else {
      uint64_t result = v2;
    }
    ZOTSystemBootTime___boottime = result;
  }

  return result;
}

void ZOTSetUnitTestScaleFactor(double a1)
{
  ZOTUnitTestScaleFactor = *(void *)&a1;
}

double ZOTMainScreenScaleFactor()
{
  double result = *(double *)&ZOTUnitTestScaleFactor;
  if (*(double *)&ZOTUnitTestScaleFactor <= 0.0)
  {
    uint64_t v1 = ZOTTimeSinceBoot();
    double result = 1.0;
    if (v1 >= 60)
    {
      if (ZOTMainScreenScaleFactor_onceToken != -1) {
        dispatch_once(&ZOTMainScreenScaleFactor_onceToken, &__block_literal_global_6);
      }
      return *(double *)&ZOTMainScreenScaleFactor_kZOTMainScreenScaleFactor;
    }
  }

  return result;
}

id ZOTEventMeetsOrbThreshold(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 handInfo]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 paths]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstPath]);
  id v5 = [v4 orbValue];
  if (AXForceTouchThresholdPeek(v5) < v6
    && ZOTEventRealFingerCount(v1) == 1
    && AXForceTouchAvailableAndEnabled())
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v8 = [v7 zoomPeekZoomEnabled];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

uint64_t ZOTEventRealFingerCount(void *a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "handInfo", 0));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 paths]);

  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

double ZOTFlipDenormalizedPoint(uint64_t a1, uint64_t a2, double a3)
{
  return a3;
}

void ZOTDispatchEventThreadWithDelay(void *a1, void *a2, float a3)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __ZOTDispatchEventThreadWithDelay_block_invoke;
  v9[3] = &unk_6D3B0;
  id v10 = a1;
  id v11 = a2;
  float v12 = a3;
  id v5 = v11;
  id v6 = v10;
  v7 = objc_retainBlock(v9);
  id v8 = [v7 copy];
  [v6 performSelector:"zotRunBlock:" onThread:v6 withObject:v8 waitUntilDone:0];
}

void __ZOTDispatchEventThreadWithDelay_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) copy];
  [v2 performSelector:"zotRunBlock:" withObject:v3 afterDelay:*(float *)(a1 + 48)];
}

void ZOTDispatchEventThread(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 copy];
  [v3 performSelector:"zotRunBlock:" onThread:v3 withObject:v4 waitUntilDone:0];
}

double ZOTNormalizeValue(uint64_t a1, uint64_t a2, double a3)
{
  return a3 / ZOTMainScreenSize(a1, a2);
}

double ZOTDenormalizeValue(uint64_t a1, uint64_t a2, double a3)
{
  return ZOTMainScreenSize(a1, a2) * a3;
}

double ZOTNormalizePoint(uint64_t a1, uint64_t a2, double a3)
{
  return a3 / ZOTMainScreenSize(a1, a2);
}

double ZOTDenormalizePoint(uint64_t a1, uint64_t a2, double a3)
{
  return a3 * ZOTMainScreenSize(a1, a2);
}

double ZOTConvertVectorToScreenStandard(uint64_t a1, double a2)
{
  double v2 = 180.0;
  float v3 = a2 * 3.14159265 / 180.0;
  double result = v3 / 0.0174532925;
  switch(a1)
  {
    case 4LL:
      double v2 = 270.0;
      goto LABEL_7;
    case 3LL:
      double v2 = 90.0;
      goto LABEL_7;
    case 2LL:
LABEL_7:
      double result = result + v2;
      break;
  }

  double v5 = 360.0;
  if (result <= 360.0)
  {
    if (result >= 0.0) {
      return result;
    }
  }

  else
  {
    double v5 = -360.0;
  }

  return result + v5;
}

double ZOTAlignDistanceAlongAngle(double result, double a2, double a3)
{
  if (a3 >= 45.0)
  {
    double v3 = 90.0;
    if (a3 < 90.0)
    {
LABEL_3:
      double v4 = (v3 - a3) / 45.0;
      return result * v4;
    }

    double v5 = 135.0;
    if (a3 < 135.0) {
      goto LABEL_5;
    }
    if (a3 >= 180.0 && a3 >= 225.0)
    {
      double v3 = 270.0;
      if (a3 < 270.0) {
        goto LABEL_3;
      }
      double v5 = 315.0;
      if (a3 < 315.0)
      {
LABEL_5:
        double v4 = (v5 - a3) / -45.0 + 1.0;
        return result * v4;
      }
    }
  }

  return result;
}

double ZOTCalculateDistanceForAngle(uint64_t a1, uint64_t a2, double a3)
{
  double v5 = v4 / ZOTMainScreenScaleFactor();
  if (a3 >= 90.0)
  {
    if (a3 >= 180.0)
    {
      if (a3 >= 270.0) {
        double v6 = -v5;
      }
      else {
        double v6 = v5;
      }
      double v5 = -v5;
    }

    else
    {
      double v6 = v5;
    }
  }

  else
  {
    double v6 = -v5;
  }

  return ZOTAlignDistanceAlongAngle(v6, v5, a3);
}

double ZOTNormalizeVelocity(double a1)
{
  double v1 = 2300.0;
  if (a1 <= 2300.0)
  {
    double v1 = a1;
    if (a1 < 125.0) {
      double v1 = 125.0;
    }
  }

  return v1 / 2175.0;
}

void ZOTDistanceForTimeAndVelocityWithMaxDistance(double a1)
{
}

void ZOTSetGutterDistanceForUnitTests(double a1)
{
  _UnitTestGutterDistance = *(void *)&a1;
}

float ZOTGutterDistance()
{
  uint64_t v0 = _UnitTestGutterDistance;
  if (*(double *)&_UnitTestGutterDistance <= 0.0)
  {
    if (ZOTGutterDistance_onceToken != -1) {
      dispatch_once(&ZOTGutterDistance_onceToken, &__block_literal_global_190);
    }
    uint64_t v0 = ZOTGutterDistance__GutterDistance;
  }

  return *(double *)&v0;
}

double ZOTNotGutterFrame()
{
  if (ZOTNotGutterFrame_onceToken != -1) {
    dispatch_once(&ZOTNotGutterFrame_onceToken, &__block_literal_global_191);
  }
  return *(double *)&ZOTNotGutterFrame_nonGutterFrame_0;
}

uint64_t ZOTShouldStartAutopan( double *a1, BOOL *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  BOOL v24 = a5 != 0.0 && a8 > 1.0;
  if (v24 && !*a2)
  {
    double v26 = 0.0;
  }

  else
  {
    double DistanceBetweenPoints = SCRCMathGetDistanceBetweenPoints(a6, a7, a3, a4);
    if (!ZOTIsWildcat)
    {
      uint64_t result = 0LL;
      *a2 = 0;
      return result;
    }

    double v26 = DistanceBetweenPoints;
    BOOL v27 = CGPointZero.x != a6;
    *a2 = v27;
    if (!v27) {
      return 0LL;
    }
  }

  int v29 = _AXSVoiceOverTouchEnabled(a1);
  float v30 = ZOTGutterDistance();
  if (v29) {
    float v30 = v30 / 3.0;
  }
  double v31 = v30 / ZOTMainScreenScaleFactor();
  if (a3 >= a11 + v31)
  {
    if (a3 <= a11 + a13 - v31)
    {
      uint64_t v36 = 0LL;
      double v35 = 0.0;
      goto LABEL_27;
    }

    double v32 = a11 + a13 - a3;
  }

  else
  {
    double v32 = a3 - a11;
  }

  double v33 = ZOTGutterDistance();
  if (ZOTIsWildcat) {
    double v34 = pow(v32 / v33, -1.2) * 1.5 / 10.0;
  }
  else {
    double v34 = (v33 - v32) / v33;
  }
  double v35 = (v34 + 0.0) * ZOTMainScreenScaleFactor() + 0.0;
  uint64_t v36 = 1LL;
LABEL_27:
  if (a4 >= a12 + v31)
  {
    if (a4 <= a12 + a14 - v31) {
      goto LABEL_35;
    }
    double v37 = a12 + a14 - a4;
  }

  else
  {
    double v37 = a4 - a12;
  }

  double v38 = ZOTGutterDistance();
  if (ZOTIsWildcat) {
    double v39 = pow(v37 / v38, -1.2) * 1.5 / 10.0;
  }
  else {
    double v39 = (v38 - v37) / v38;
  }
  double v35 = v35 + (v39 + 0.0) * ZOTMainScreenScaleFactor();
  ++v36;
LABEL_35:
  if (*a2)
  {
    double v40 = v26 + -0.0700000003;
    if (v26 > 0.899999976) {
      double v40 = 0.819999976;
    }
    double v41 = pow(v40, 3.0) * 1000.0;
    double v35 = v41 * ZOTMainScreenScaleFactor();
    ++v36;
  }

  else if (!v36)
  {
    uint64_t result = 0LL;
    double v42 = 0.0;
    goto LABEL_41;
  }

  double v42 = v35 / (double)v36;
  uint64_t result = 1LL;
LABEL_41:
  *a1 = v42;
  return result;
}

uint64_t ZOTScreenRegionForPoint(int a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v13 = 0.0;
  if (a1)
  {
    double v14 = ZOTGutterDistance();
    float v15 = v14 / ZOTMainScreenScaleFactor();
    double v13 = v15;
  }

  if (a2 >= a4 + a6 - v13) {
    unsigned int v16 = 2;
  }
  else {
    unsigned int v16 = 0;
  }
  if (a2 > a4 + v13) {
    uint64_t result = v16;
  }
  else {
    uint64_t result = 1LL;
  }
  if (a3 <= a5 + v13) {
    return result | 4;
  }
  if (a3 >= a5 + a7 - v13) {
    return result | 8;
  }
  return result;
}

uint64_t ZOTScreenRegionForRelativePushPan(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v18 = 0LL;
  double v19 = 0.0;
  SCRCMathGetVectorAndDistanceForPoints(&v19, &v18, a4, a5, a2, a3);
  switch(a1)
  {
    case 4LL:
      double v6 = v19;
      double v7 = 90.0;
LABEL_8:
      double v6 = v6 + v7;
      goto LABEL_10;
    case 3LL:
      double v6 = v19;
      double v7 = -90.0;
      goto LABEL_8;
    case 2LL:
      double v6 = v19 + -180.0;
      if (v19 + -180.0 >= 0.0) {
        goto LABEL_10;
      }
      double v7 = 360.0;
      goto LABEL_8;
  }

  double v6 = v19;
LABEL_10:
  double v8 = 360.0;
  if (v6 < 0.0)
  {
LABEL_13:
    double v6 = v6 + v8;
    goto LABEL_14;
  }

  if (v6 > 360.0)
  {
    double v8 = -360.0;
    goto LABEL_13;
  }

LABEL_27:
  if (ZOTIsWildcat)
  {
    if (a1 == 4)
    {
      if (v13) {
        int v17 = ((result >> 1) | (2 * result)) & 9;
      }
      else {
        int v17 = ((result >> 1) | (2 * result)) & 9 | 4;
      }
      return v17 & 0xFFFFFFFD | (2 * (result & 1));
    }

    else if (a1 != 3)
    {
      int v14 = ((2 * result) | (result >> 2)) & 5;
      if (!v13) {
        v14 |= 2u;
      }
      unsigned int v15 = v14 & 0xFFFFFFF7 | (8 * (result & 1));
      unsigned int v16 = (result >> 1) & 2 | !v13 & 0xFFFFFFF3 | (4 * (result & 3));
      if (a1 == 2) {
        return v16;
      }
      else {
        return v15;
      }
    }
  }

  return result;
}

void sub_3FDB8(_Unwind_Exception *a1)
{
}

id objc_msgSend__dispatchZoomRemapEvent_lensFrame_offset_zoomFactor_applyZoom_menuScreenRect_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dispatchZoomRemapEvent:lensFrame:offset:zoomFactor:applyZoom:menuScreenRect:");
}

id objc_msgSend__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:");
}

id objc_msgSend__updateVelocityAndVectorWithEventLocation_startPoint_endPoint_forTrackpad_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateVelocityAndVectorWithEventLocation:startPoint:endPoint:forTrackpad:");
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_context_userInterfaceStyle_forWindowScene_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addContentViewController:withUserInteractionEnabled:forService:context:userInterfaceStyle:forWindowScene:completion:");
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_context_userInterfaceStyle_forWindowScene_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterface Style:forWindowScene:completion:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_fullscreenEventHandler_autopanShouldStartWithPoint_speedFactor_initialSingleFingerLocation_fingerCount_pointHasBeenMapped_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "fullscreenEventHandler:autopanShouldStartWithPoint:speedFactor:initialSingleFingerLocation:fingerCount:pointHasBeenMapped:");
}

id objc_msgSend_fullscreenEventHandler_autopanWithLocation_initialSingleFingerLocation_distance_animationDuration_useGutterDistance_pointHasBeenMapped_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "fullscreenEventHandler:autopanWithLocation:initialSingleFingerLocation:distance:animationDuration:useGutterDi stance:pointHasBeenMapped:");
}

id objc_msgSend_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:");
}

id objc_msgSend_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completionRequiresWritingBlock_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completionRequiresWritingBlock:completion:");
}

id objc_msgSend_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertWithText:subtitleText:iconImage:type:priority:duration:forService:");
}

id objc_msgSend_updateZoomPanOffset_zoomFactor_roundedLensCorners_animated_animationDuration_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:");
}

id objc_msgSend_zoomListenerRegisteredForAttributeUpdatesImmediately_registered_clientIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoomListenerRegisteredForAttributeUpdatesImmediately:registered:clientIdentifier:");
}

id objc_msgSend_zw_convertRectToScreenCoordinates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zw_convertRectToScreenCoordinates:");
}