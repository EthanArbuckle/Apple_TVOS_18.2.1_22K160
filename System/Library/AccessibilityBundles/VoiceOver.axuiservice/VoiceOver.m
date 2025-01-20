LABEL_13:
  self->_lastMovementWasForward = a3;
  self->_needsLayout = 1;
  -[VOTUIRotorKnob setNeedsLayout](self, "setNeedsLayout");
}
}

id sub_5BC8(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40LL);
  __int128 v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

id sub_5C10(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 50LL) = 0;
  if (!*(_BYTE *)(a1 + 96)) {
    return [*(id *)(a1 + 32) _updateSelectedMarker];
  }
  double v1 = *(double *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  __int128 v2 = *(_OWORD *)(a1 + 64);
  __int128 v7 = *(_OWORD *)(a1 + 48);
  __int128 v8 = v2;
  v5[1] = 3221225472LL;
  v5[2] = sub_5CD0;
  v5[3] = &unk_246B8;
  uint64_t v6 = *(void *)(a1 + 32);
  __int128 v9 = *(_OWORD *)(a1 + 80);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_5D18;
  _OWORD v4[3] = &unk_246E0;
  v4[4] = v6;
  return +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v5,  v4,  v1);
}

id sub_5CD0(uint64_t a1)
{
  double v1 = *(void **)(*(void *)(a1 + 32) + 40LL);
  __int128 v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

id sub_5D18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSelectedMarker];
}

void sub_5E24(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24LL);
  id v3 = a2;
  [v3 setImage:v2];
  [v3 sizeToFit];
  [v3 removeFromSuperview];
}

void sub_7394( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
}

uint64_t sub_73B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_73C4(uint64_t a1)
{
}

id sub_73CC(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) updateStyling];
}

id sub_73DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_traitCollectionDidChange:");
}

void sub_842C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_8454(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleVoiceOverCaptionPanelViewController];
}

id sub_8480(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleVoiceOverCaptionPanelViewController];
}

LABEL_36:
      v23 = 0LL;
LABEL_37:

      return v23;
  }

id *sub_9194(id *result, int a2)
{
  if (a2) {
    return (id *)objc_msgSend( result[4],  "_updateCursorWithFrame:pathData:animate:displayID:",  result[5],  *((unsigned __int8 *)result + 88),  result[6],  *((double *)result + 7),  *((double *)result + 8),  *((double *)result + 9),  *((double *)result + 10));
  }
  return result;
}

id sub_977C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeVOTEnabledBannerViewController];
}

id sub_A0DC(void *a1)
{
  id v1 = a1;
  unint64_t v2 = (unint64_t)[v1 count];
  if ((v2 & 1) != 0)
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/VOTAXUIService/VOTUIServer.m",  757LL,  "NSArray *_DotPositionsAsValuesFromXYNumbers(NSArray *__strong)",  @"Need an event number of x y numbers");
    id v3 = 0LL;
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v2 >> 1));
    if (v2)
    {
      for (unint64_t i = 0LL; i < v2; i += 2LL)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue([v1 objectAtIndexedSubscript:i]);
        [v5 doubleValue];
        double v7 = v6;

        __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v1 objectAtIndexedSubscript:i + 1]);
        [v8 doubleValue];
        double v10 = v9;

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v7, v10));
        [v3 addObject:v11];
      }
    }
  }

  return v3;
}

id sub_B8B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleHideVoiceOverWarning:0];
}

LABEL_31:
  return v26;
}

id sub_C608(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:0.0];
}

void sub_C784(uint64_t a1)
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _circleViewForDotNumber:*(void *)(a1 + 40)]);
  [v2 setAlpha:0.5];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _highlightedCircleViewForDotNumber:*(void *)(a1 + 40)]);
  [v3 setAlpha:0.0];
}

void sub_C91C(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v1 scale];
  CGFloat v3 = v2;
  v13.width = 82.0;
  v13.height = 82.0;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v4 set];

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 1.0);
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:",  0LL,  41.0,  41.0,  40.0,  0.0,  6.28318531));
  [v12 stroke];
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v7 = objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  __int128 v8 = (void *)qword_2D368;
  qword_2D368 = v7;

  [v12 fill];
  double v9 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)qword_2D370;
  qword_2D370 = v10;

  UIGraphicsEndImageContext();
}

void sub_E2DC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
}

uint64_t sub_E2FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_E30C(uint64_t a1)
{
}

id sub_E314(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNeedsDisplay];
}

id sub_E324(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_traitCollectionDidChange:");
}

id sub_E598(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_E614(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(*(void *)(a1 + 32) + 56)];
}

id sub_E814(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "setFrame:",  *(double *)(a1 + 40),  *(double *)(a1 + 48),  *(double *)(a1 + 56),  *(double *)(a1 + 64));
}

uint64_t sub_E828(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_EC88(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) layer]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sublayers]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:a3]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) layer]);
  [v11 bounds];
  objc_msgSend(v10, "setBounds:");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) layer]);
  UIRectGetCenter([v12 bounds]);
  objc_msgSend(v10, "setPosition:");

  id v30 = v7;
  objc_msgSend(v10, "setPath:", objc_msgSend(v30, "CGPath"));
  [*(id *)(a1 + 32) lineWidth];
  double v14 = 2.0;
  if (!*(_BYTE *)(a1 + 48)) {
    double v14 = 0.0;
  }
  [v10 setLineWidth:v13 + v14];
  objc_msgSend(v10, "setFillColor:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "CGColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) traitCollection]);
  else {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  }
  id v17 = v16;
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v17, "CGColor"));

  v18 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:a3]);
    uint64_t v20 = a3 + 1;
  }

  else
  {
    uint64_t v20 = a3 + 1;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:v20]);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) layer]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 sublayers]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v20]);

  v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) layer]);
  [v24 bounds];
  objc_msgSend(v23, "setBounds:");

  v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) layer]);
  UIRectGetCenter([v25 bounds]);
  objc_msgSend(v23, "setPosition:");

  id v26 = v19;
  objc_msgSend(v23, "setPath:", objc_msgSend(v26, "CGPath"));
  [*(id *)(a1 + 32) lineWidth];
  objc_msgSend(v23, "setLineWidth:");
  objc_msgSend(v23, "setFillColor:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "CGColor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) traitCollection]);
  else {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  }
  id v29 = v28;
  objc_msgSend(v23, "setStrokeColor:", objc_msgSend(v29, "CGColor"));

  *a4 = 1;
}

LABEL_22:
}

id sub_FAB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_FAB8(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  LOBYTE(a2) = *(_BYTE *)(v3 + 33);
  uint64_t v4 = 48LL;
  [*(id *)(v3 + 48) setAlpha:(double)*(unint64_t *)&a2];
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = 0.0;
  if (!*(_BYTE *)(v5 + 33)) {
    double v6 = 1.0;
  }
  [*(id *)(v5 + 40) setAlpha:v6];
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v7 + 33)) {
    uint64_t v4 = 40LL;
  }
  [*(id *)(v7 + v4) setText:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + v4) sizeToFit];
  *(_BYTE *)(*(void *)(a1 + 32) + 33LL) ^= 1u;
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_FBFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_10768( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10794(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _traitCollectionDidChange:v4];
}

LABEL_34:
  }
}

void sub_11240(uint64_t a1)
{
  double v2 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  if (*(void *)(a1 + 32)) {
    uint64_t v3 = *(const __CFString **)(a1 + 32);
  }
  else {
    uint64_t v3 = &stru_253B8;
  }
  __int128 v8 = -[NSMutableAttributedString initWithString:](v2, "initWithString:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[NSMutableAttributedString addAttribute:value:range:]( v8,  "addAttribute:value:range:",  NSForegroundColorAttributeName,  v4,  0,  [*(id *)(a1 + 40) length]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) captionPanelText]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 font]);
  -[NSMutableAttributedString addAttribute:value:range:]( v8,  "addAttribute:value:range:",  NSFontAttributeName,  v6,  0,  [*(id *)(a1 + 40) length]);

  -[NSMutableAttributedString addAttribute:value:range:]( v8,  "addAttribute:value:range:",  NSParagraphStyleAttributeName,  *(void *)(a1 + 56),  0,  [*(id *)(a1 + 40) length]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) captionPanelText]);
  [v7 setAttributedText:v8];
}

id sub_11378(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateTextBack:1];
}

void sub_11384(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) scrollView]);
  objc_msgSend(v2, "setContentOffset:", v1, 0.0);
}

void sub_115C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_11600(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) scrollView]);
  objc_msgSend(v1, "setContentOffset:", 0.0, 0.0);
}

void sub_11638(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (!a2 && WeakRetained)
  {
    double v6 = (void *)*((void *)WeakRetained + 3);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_116F8;
    v7[3] = &unk_247A8;
    objc_copyWeak(&v8, v3);
    [v6 afterDelay:v7 processBlock:1.0];
    objc_destroyWeak(&v8);
  }
}

void sub_116E4(_Unwind_Exception *a1)
{
}

void sub_116F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _animateTextBack:0];
}

void sub_11728(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained scrollView]);
  objc_msgSend(v2, "setContentOffset:", *(double *)(a1 + 40), 0.0);
}

void sub_11D84(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentRotaryView]);
  [v1 setAlpha:0.0];
}

void sub_11DB8(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentLocationView]);
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

id sub_11E10(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentLocationView]);
  [v2 alpha];
  double v4 = v3;

  if (v4 == 0.0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_11EEC;
    v7[3] = &unk_247D0;
    void v7[4] = *(void *)(a1 + 32);
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v7, 0.2);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_11F20;
  v6[3] = &unk_247D0;
  v6[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v6, 0.2);
}

void sub_11EEC(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentLocationView]);
  [v1 setAlpha:1.0];
}

void sub_11F20(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentRotaryView]);
  [v1 setAlpha:1.0];
}

id sub_12BA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.300000012];
}

id sub_12BB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.800000012];
}

LABEL_14:
  self->_enabled = a3;
  -[VOTUIScreenCurtainViewController _updateScreenCurtainForInvertColors:]( self,  "_updateScreenCurtainForInvertColors:",  0LL);
}

void sub_12D14(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) curtainView]);
  [v1 setAlpha:0.0];
}

void sub_12D48(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) curtainView]);
  [v1 setAlpha:1.0];
}

void sub_131E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

id sub_131FC(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) curtainView]);
  [v2 setAlpha:1.0];

  return [*(id *)(a1 + 32) _updateScreenCurtainForInvertColors:0];
}

uint64_t sub_1323C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1324C(uint64_t a1)
{
}

id sub_13254(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _updateScreenCurtainForInvertColors:0];
}

id sub_13B10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t sub_13B1C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_13C2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t sub_13C38(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_14808(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/AccessibilityBundles/GAXClient.bundle"));
  double v2 = v1;
  if (v1)
  {
    id v22 = 0LL;
    unsigned __int8 v3 = [v1 loadAndReturnError:&v22];
    id v4 = v22;
    if ((v3 & 1) != 0) {
      goto LABEL_14;
    }
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
    unsigned __int8 v6 = [v5 ignoreLogging];

    if ((v6 & 1) != 0) {
      goto LABEL_14;
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
    uint64_t v8 = AXLoggerForFacility();
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel(1LL);
    if (!os_log_type_enabled(v9, v10)) {
      goto LABEL_13;
    }
    uint64_t v11 = AXColorizeFormatLog( 1LL,  @"**** AX Error: Could not load GAX Client bundle. loadAndReturnError failed: %@");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = _AXStringForArgs(v12);
    double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_impl(&dword_0, v9, v10, "%{public}@", buf, 0xCu);
    }

LABEL_12:
LABEL_13:

    goto LABEL_14;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
  unsigned __int8 v16 = [v15 ignoreLogging];

  if ((v16 & 1) == 0)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
    uint64_t v18 = AXLoggerForFacility();
    id v4 = (id)objc_claimAutoreleasedReturnValue(v18);

    os_log_type_t v19 = AXOSLogLevelFromAXLogLevel(1LL);
    if (!os_log_type_enabled((os_log_t)v4, v19))
    {
LABEL_14:

      goto LABEL_15;
    }

    uint64_t v20 = AXColorizeFormatLog( 1LL,  @"**** AX Error: Could not load GAX Client bundle. bundleWithPath came back nil");
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v21 = ((uint64_t (*)(void))_AXStringForArgs)();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v4, v19))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl(&dword_0, (os_log_t)v4, v19, "%{public}@", buf, 0xCu);
    }

    goto LABEL_12;
  }

LABEL_15:
}

LABEL_19:
    if (self->_category == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_20;
    }
    uint64_t v11 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___Legacy_VOTUIItemChooserController));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"VoiceOverItemChooser" value:&stru_253B8 table:@"VoiceOverUIService"]);
    -[UILabel setText:](self->_headingLabel, "setText:", v13);

    self->_category = 0x7FFFFFFFFFFFFFFFLL;
    double v14 = self->_originalList;
    v15 = self->_filteredList;
    self->_filteredList = 0LL;
    goto LABEL_27;
  }

  return v6;
}

uint64_t sub_14E38(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "objectAtIndex:"));
  uint64_t v3 = [v2 containsObject:*(void *)(a1 + 40)] ^ 1;

  return v3;
}

BOOL sub_14E84(id a1, id a2)
{
  return [a2 isAccessibilityElement];
}

void sub_14F2C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:0.0];
}

id sub_14F60(uint64_t a1)
{
  v11[0] = @"row";
  double v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  *(void *)(*(void *)(a1 + 32) + 112LL)));
  v11[1] = @"activate";
  v12[0] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *(unsigned __int8 *)(*(void *)(a1 + 32) + 120LL)));
  v12[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
  UIAccessibilityPostNotification(0x7EAu, v4);

  [*(id *)(*(void *)(a1 + 32) + 16) resignFirstResponder];
  [*(id *)(*(void *)(a1 + 32) + 16) setText:&stru_253B8];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  uint64_t v5 = *(void *)(a1 + 32);
  unsigned __int8 v6 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = 0LL;

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v7 closeItemChooser:*(void *)(a1 + 32)];

  [*(id *)(*(void *)(a1 + 32) + 168) invalidate];
  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(void **)(v8 + 168);
  *(void *)(v8 + 16_Block_object_dispose(va, 8) = 0LL;

  return [*(id *)(a1 + 32) _updateGuidedAccessWindowId:0];
}

BOOL sub_15250(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 lowercaseString]);
  BOOL v4 = [v3 rangeOfString:*(void *)(*(void *)(a1 + 32) + 104)] == (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

void sub_15600(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  if ([v12 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v12 substringToIndex:1]);
    unsigned __int8 v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 uppercaseString]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet letterCharacterSet](&OBJC_CLASS___NSCharacterSet, "letterCharacterSet"));
    unsigned __int8 v8 = objc_msgSend( v7,  "characterIsMember:",  -[__CFString characterAtIndex:](v6, "characterAtIndex:", 0));

    if ((v8 & 1) == 0)
    {

      unsigned __int8 v6 = @"#";
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v6]);
    if (!v9)
    {
      id v9 = [objc_allocWithZone(NSMutableArray) init];
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v9 forKey:v6];
    }

    os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v12, v10, 0LL));
    [v9 addObject:v11];
  }
}

int64_t sub_15754(id a1, id a2, id a3)
{
  return (int64_t)[a2 localizedCaseInsensitiveCompare:a3];
}

void sub_1575C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:1.0];
}

void sub_15790(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    double v2 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___Legacy_VOTUIItemChooserController));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v10 = (id)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"VoiceOverItemChooser" value:&stru_253B8 table:@"VoiceOverUIService"]);

    BOOL v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___Legacy_VOTUIItemChooserController));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"item.count" value:&stru_253B8 table:@"VoiceOverUIService"]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v6,  *(void *)(a1 + 40)));

    uint64_t v8 = __UIAXStringForVariables(v10);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, *(id *)(*(void *)(a1 + 32) + 8LL));
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v9);
  }

void sub_15900(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v1 setIndexBackgroundColor:v2];
}

id sub_15AAC(uint64_t a1)
{
  CGRect v8 = CGRectIntegral(*(CGRect *)(a1 + 40));
  double x = v8.origin.x;
  double y = v8.origin.y;
  double width = v8.size.width;
  double height = v8.size.height;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  objc_msgSend(v6, "setFrame:", x, y, width, height);

  CGRect v9 = CGRectIntegral(*(CGRect *)(a1 + 40));
  return objc_msgSend( *(id *)(*(void *)(a1 + 32) + 128),  "setFrame:",  v9.origin.x,  v9.origin.y,  v9.size.width,  v9.size.height);
}

uint64_t sub_164EC()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC9VoiceOverP33_2F7A5CC523061C6BB72F61071B2438CD19ResourceBundleClass);
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:");
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_context_userInterfaceStyle_forWindowScene_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterface Style:forWindowScene:completion:");
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_forSceneClientIdentifier_context_userInterfaceStyle_forWindowScene_spatialConfiguration_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addContentViewController:withUserInteractionEnabled:forService:forSceneClientIdentifier:context:userInterface Style:forWindowScene:spatialConfiguration:completion:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_removeContentViewController_withUserInteractionEnabled_forService_context_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeContentViewController:withUserInteractionEnabled:forService:context:completion:");
}

id objc_msgSend_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertWithText:subtitleText:iconImage:type:priority:duration:forService:");
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return [a1 yellowColor];
}