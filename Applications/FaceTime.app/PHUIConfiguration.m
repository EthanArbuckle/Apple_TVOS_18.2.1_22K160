@interface PHUIConfiguration
+ (BOOL)canAutoRotateInCallUIForFaceTime;
+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio;
+ (BOOL)canRotateInCallUIOverlayForFaceTime;
+ (BOOL)preferShorterStrings;
+ (BOOL)shouldUseExplicitLayoutDimensions;
+ (BOOL)shouldUseFullScreenPeoplePicker;
+ (BOOL)shouldUseSOSTightSpacing;
+ (double)ambientAudioRoutesButtonSize;
+ (double)ambientAudioRoutesInset;
+ (double)ambientAudioRoutesSymbolInset;
+ (double)ambientHorizontalPadding;
+ (double)ambientInCallControlSize;
+ (double)ambientInCallControlSpacing;
+ (double)ambientVerticalPadding;
+ (double)distanceBetweenEndButtonAndKeyPadLastRow;
+ (double)inCallControlButtonSizeRatio;
+ (double)inCallControlButtonVerticalSpacingRatio;
+ (double)inComingCallAndInCallControlsBottomPaddingRatio;
+ (double)inComingCallSupplementalButtonAndMainButtonSpacingRatio;
+ (double)pipPartialHomeOffset;
+ (double)pipRadius;
+ (double)pipWallInset;
+ (double)pipWidth;
+ (double)yOffsetForDialerLCDView;
+ (double)yOffsetForDialerLCDViewForDxDevices;
+ (double)yOffsetForParticipantsView;
+ (double)yParticipantsViewAdjustmentForKeypad;
+ (unint64_t)ambientHorizontalSizeClass;
+ (unint64_t)ambientVerticalSizeClass;
+ (unint64_t)contentViewSizeForFaceTime;
+ (unint64_t)handsetDialerSize;
+ (unint64_t)handsetDialerSpacing;
+ (unint64_t)inCallBottomBarAssetSize;
+ (unint64_t)inCallBottomBarLowerOffset;
+ (unint64_t)inCallBottomBarMaxTitleSize;
+ (unint64_t)inCallBottomBarSpacing;
+ (unint64_t)inCallControlAlignment;
+ (unint64_t)inCallControlSize;
+ (unint64_t)inCallControlSpacing;
+ (unint64_t)inCallFaceTimeOverlayUISize;
+ (unint64_t)inCallSlideToAnswerSize;
+ (unint64_t)pipStatusBarPadding;
+ (unint64_t)screenSize;
+ (unint64_t)tableViewCellVerticalSpacing;
+ (unint64_t)voicemailLayoutSpacing;
@end

@implementation PHUIConfiguration

+ (unint64_t)screenSize
{
  if (qword_1001169A0 != -1) {
    dispatch_once(&qword_1001169A0, &stru_1000F6D68);
  }
  return qword_100116998;
}

+ (unint64_t)inCallControlAlignment
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FE6C;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_1001169A8 != -1) {
    dispatch_once(&qword_1001169A8, block);
  }
  return qword_100112138;
}

+ (unint64_t)inCallControlSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FF20;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_1001169B8 != -1) {
    dispatch_once(&qword_1001169B8, block);
  }
  return qword_1001169B0;
}

+ (unint64_t)inCallBottomBarSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FFD0;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_1001169C8 != -1) {
    dispatch_once(&qword_1001169C8, block);
  }
  return qword_1001169C0;
}

+ (unint64_t)inCallBottomBarLowerOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010080;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_1001169D8 != -1) {
    dispatch_once(&qword_1001169D8, block);
  }
  return qword_1001169D0;
}

+ (unint64_t)inCallBottomBarMaxTitleSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010140;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_1001169E8 != -1) {
    dispatch_once(&qword_1001169E8, block);
  }
  if (byte_1001169E0) {
    return 1LL;
  }
  else {
    return 2LL;
  }
}

+ (unint64_t)inCallControlSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000101DC;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_1001169F0 != -1) {
    dispatch_once(&qword_1001169F0, block);
  }
  return qword_100112140;
}

+ (unint64_t)inCallSlideToAnswerSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001029C;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A00 != -1) {
    dispatch_once(&qword_100116A00, block);
  }
  if (byte_1001169F8) {
    return 3LL;
  }
  else {
    return 2LL;
  }
}

+ (unint64_t)inCallBottomBarAssetSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010350;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A10 != -1) {
    dispatch_once(&qword_100116A10, block);
  }
  if (byte_100116A08) {
    return 3LL;
  }
  else {
    return 2LL;
  }
}

+ (double)ambientInCallControlSize
{
  unint64_t v2 = +[PHUIConfiguration screenSize](&OBJC_CLASS___PHUIConfiguration, "screenSize") - 10;
  if (v2 < 6) {
    return dbl_1000C3CC0[v2];
  }
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing](&OBJC_CLASS___PHUIConfiguration, "inCallBottomBarSpacing") == (id)6) {
    return 104.0;
  }
  unint64_t v4 = +[PHUIConfiguration inCallBottomBarSpacing](&OBJC_CLASS___PHUIConfiguration, "inCallBottomBarSpacing");
  double result = 90.0;
  if (v4 == 3) {
    return 104.0;
  }
  return result;
}

+ (unint64_t)ambientVerticalSizeClass
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v6;
  }
  else {
    double v7 = v4;
  }
  return (int)v7 > 375;
}

+ (unint64_t)ambientHorizontalSizeClass
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v4;
  }
  else {
    double v7 = v6;
  }
  return (int)v7 > 667;
}

+ (double)ambientVerticalPadding
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass](&OBJC_CLASS___PHUIConfiguration, "ambientVerticalSizeClass");
  double result = 37.0;
  if (v2 == 1) {
    return 44.0;
  }
  return result;
}

+ (double)ambientHorizontalPadding
{
  unint64_t v2 = +[PHUIConfiguration ambientHorizontalSizeClass](&OBJC_CLASS___PHUIConfiguration, "ambientHorizontalSizeClass");
  double result = 40.0;
  if (v2 == 1) {
    return 6.0;
  }
  return result;
}

+ (double)ambientInCallControlSpacing
{
  return 24.0;
}

+ (double)ambientAudioRoutesInset
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass](&OBJC_CLASS___PHUIConfiguration, "ambientVerticalSizeClass");
  double result = 16.0;
  if (v2 == 1) {
    return 26.0;
  }
  return result;
}

+ (double)ambientAudioRoutesButtonSize
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass](&OBJC_CLASS___PHUIConfiguration, "ambientVerticalSizeClass");
  double result = 40.0;
  if (v2 == 1) {
    return 54.0;
  }
  return result;
}

+ (double)ambientAudioRoutesSymbolInset
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass](&OBJC_CLASS___PHUIConfiguration, "ambientVerticalSizeClass");
  double result = 6.0;
  if (v2 == 1) {
    return 3.0;
  }
  return result;
}

+ (unint64_t)handsetDialerSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001061C;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A20 != -1) {
    dispatch_once(&qword_100116A20, block);
  }
  return qword_100116A18;
}

+ (unint64_t)handsetDialerSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000106CC;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A28 != -1) {
    dispatch_once(&qword_100116A28, block);
  }
  return qword_100112148;
}

+ (double)yOffsetForDialerLCDView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010780;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A38 != -1) {
    dispatch_once(&qword_100116A38, block);
  }
  return *(double *)&qword_100116A30;
}

+ (double)yOffsetForDialerLCDViewForDxDevices
{
  unint64_t v2 = +[PHUIConfiguration screenSize](&OBJC_CLASS___PHUIConfiguration, "screenSize");
  double result = 0.0;
  if (v2 - 10 <= 5) {
    return dbl_1000C3E20[v2 - 10];
  }
  return result;
}

+ (double)yOffsetForParticipantsView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010894;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A48 != -1) {
    dispatch_once(&qword_100116A48, block);
  }
  return *(double *)&qword_100116A40;
}

+ (double)yParticipantsViewAdjustmentForKeypad
{
  if (qword_100116A58 != -1) {
    dispatch_once(&qword_100116A58, &stru_1000F6D88);
  }
  return *(double *)&qword_100116A50;
}

+ (BOOL)canAutoRotateInCallUIForFaceTime
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

+ (BOOL)canRotateInCallUIOverlayForFaceTime
{
  return 0;
}

+ (unint64_t)contentViewSizeForFaceTime
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010A44;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A68 != -1) {
    dispatch_once(&qword_100116A68, block);
  }
  return qword_100116A60;
}

+ (double)pipWidth
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010AEC;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A70 != -1) {
    dispatch_once(&qword_100116A70, block);
  }
  return *(double *)&qword_100112150;
}

+ (double)pipWallInset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010BA0;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A78 != -1) {
    dispatch_once(&qword_100116A78, block);
  }
  return *(double *)&qword_100112158;
}

+ (double)pipPartialHomeOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010C50;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A88 != -1) {
    dispatch_once(&qword_100116A88, block);
  }
  return *(double *)&qword_100116A80;
}

+ (double)pipRadius
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010CF8;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116A98 != -1) {
    dispatch_once(&qword_100116A98, block);
  }
  return *(double *)&qword_100116A90;
}

+ (unint64_t)pipStatusBarPadding
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010DA0;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116AA0 != -1) {
    dispatch_once(&qword_100116AA0, block);
  }
  return (unint64_t)*(double *)&qword_100112160;
}

+ (BOOL)shouldUseFullScreenPeoplePicker
{
  unint64_t v2 = (unint64_t)[a1 screenSize];
  return (v2 > 8) | (0x73u >> v2) & 1;
}

+ (unint64_t)inCallFaceTimeOverlayUISize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010E88;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116AB0 != -1) {
    dispatch_once(&qword_100116AB0, block);
  }
  if (byte_100116AA8) {
    return 3LL;
  }
  else {
    return 2LL;
  }
}

+ (unint64_t)tableViewCellVerticalSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010F3C;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116AC0 != -1) {
    dispatch_once(&qword_100116AC0, block);
  }
  if (byte_100116AB8) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

+ (unint64_t)voicemailLayoutSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010FE4;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116AD0 != -1) {
    dispatch_once(&qword_100116AD0, block);
  }
  if (byte_100116AC8) {
    return 3LL;
  }
  else {
    return 2LL;
  }
}

+ (BOOL)preferShorterStrings
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011080;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116AE0 != -1) {
    dispatch_once(&qword_100116AE0, block);
  }
  return byte_100116AD8;
}

+ (BOOL)shouldUseExplicitLayoutDimensions
{
  return (char *)+[PHUIConfiguration screenSize](&OBJC_CLASS___PHUIConfiguration, "screenSize") - 10 < (char *)6;
}

+ (BOOL)shouldUseSOSTightSpacing
{
  if (qword_100116AF0 != -1) {
    dispatch_once(&qword_100116AF0, &stru_1000F6DA8);
  }
  return byte_100116AE8;
}

+ (double)inComingCallSupplementalButtonAndMainButtonSpacingRatio
{
  return dbl_1000C3A90[[a1 screenSize] == (id)1];
}

+ (double)inComingCallAndInCallControlsBottomPaddingRatio
{
  return dbl_1000C3AA0[[a1 screenSize] == (id)1];
}

+ (double)inCallControlButtonVerticalSpacingRatio
{
  return dbl_1000C3AB0[[a1 screenSize] == (id)1];
}

+ (double)distanceBetweenEndButtonAndKeyPadLastRow
{
  if ([a1 screenSize] == (id)1) {
    return 0.02998;
  }
  double v4 = (void *)objc_opt_class(a1);
  _[v4 inCallControlButtonVerticalSpacingRatio];
  return result;
}

+ (double)inCallControlButtonSizeRatio
{
  return 0.1976;
}

@end