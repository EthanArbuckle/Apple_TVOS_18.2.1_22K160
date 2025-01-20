}

void sub_100005688(id a1)
{
  v18[0] = &off_10002E330;
  id v17 = +[UIColor tvsb_randomColor](&OBJC_CLASS___UIColor, "tvsb_randomColor");
  v19[0] = v17;
  v18[1] = &off_10002E348;
  v16 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
  v19[1] = v16;
  v18[2] = &off_10002E360;
  v15 = +[UIColor darkGrayColor](&OBJC_CLASS___UIColor, "darkGrayColor");
  v19[2] = v15;
  v18[3] = &off_10002E378;
  v14 = +[UIColor lightGrayColor](&OBJC_CLASS___UIColor, "lightGrayColor");
  v19[3] = v14;
  v18[4] = &off_10002E390;
  v13 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  v19[4] = v13;
  v18[5] = &off_10002E3A8;
  v12 = +[UIColor grayColor](&OBJC_CLASS___UIColor, "grayColor");
  v19[5] = v12;
  v18[6] = &off_10002E3C0;
  v11 = +[UIColor redColor](&OBJC_CLASS___UIColor, "redColor");
  v19[6] = v11;
  v18[7] = &off_10002E3D8;
  v10 = +[UIColor greenColor](&OBJC_CLASS___UIColor, "greenColor");
  v19[7] = v10;
  v18[8] = &off_10002E3F0;
  v9 = +[UIColor blueColor](&OBJC_CLASS___UIColor, "blueColor");
  v19[8] = v9;
  v18[9] = &off_10002E408;
  v8 = +[UIColor cyanColor](&OBJC_CLASS___UIColor, "cyanColor");
  v19[9] = v8;
  v18[10] = &off_10002E420;
  v7 = +[UIColor yellowColor](&OBJC_CLASS___UIColor, "yellowColor");
  v19[10] = v7;
  v18[11] = &off_10002E438;
  v6 = +[UIColor magentaColor](&OBJC_CLASS___UIColor, "magentaColor");
  v19[11] = v6;
  v18[12] = &off_10002E450;
  v5 = +[UIColor orangeColor](&OBJC_CLASS___UIColor, "orangeColor");
  v19[12] = v5;
  v18[13] = &off_10002E468;
  v4 = +[UIColor purpleColor](&OBJC_CLASS___UIColor, "purpleColor");
  v19[13] = v4;
  v18[14] = &off_10002E480;
  v3 = +[UIColor brownColor](&OBJC_CLASS___UIColor, "brownColor");
  v19[14] = v3;
  v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  15LL);
  v2 = (void *)qword_100036820;
  qword_100036820 = (uint64_t)v1;
}

double sub_100007448(double a1)
{
  return floor(a1);
}

  ;
}

id sub_100008200(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v6[1] = a1;
  v6[0] = 0LL;
  id v5 = [location[0] userInterfaceStyle];
  if ((unint64_t)v5 <= 1)
  {
    objc_storeStrong(v6, a1[4]);
  }

  else if (v5 == (id)2)
  {
    objc_storeStrong(v6, a1[5]);
  }

  id v3 = v6[0];
  objc_storeStrong(v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v3;
}

void sub_10000870C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, _Unwind_Exception *exception_object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

void sub_100008730(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  sub_1000087FC();
  objc_msgSend(location[0], "setFrame:", v2, v3, v4, v5);
  *(double *)(*(void *)(a1[4] + 8LL) + 24LL) = *(double *)(*(void *)(a1[4] + 8LL) + 24LL) + 13.0;
  objc_storeStrong(location, 0LL);
}

  ;
}

void sub_1000089F0(uint64_t a1, void *a2, char *a3)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    double v4 = (char *)((char *)[*(id *)(*(void *)(a1 + 32) + 8) count] - 1 - a3);
  }
  else {
    double v4 = a3;
  }
  id v3 = location[0];
  char v7 = 0;
  if ((unint64_t)v4 >= *(void *)(*(void *)(a1 + 32) + 24LL))
  {
    [location[0] setBackgroundColor:0];
  }

  else
  {
    v8 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    char v7 = 1;
    [v3 setBackgroundColor:v8];
  }

  if ((v7 & 1) != 0) {

  }
  objc_storeStrong(location, 0LL);
}

id sub_100008BC8(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v2 = [@"com.apple.appletv.systembulletin." stringByAppendingString:location];
  objc_storeStrong(&location, 0LL);
  return v2;
}

id sub_1000091FC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _videoBulletinView];
  [v2 setUserInteractionEnabled:1];

  id v3 = [*(id *)(a1 + 32) contentView];
  [v3 setStreamPreferences:0];

  id v4 = [*(id *)(a1 + 32) contentView];
  [v4 startStreamIfNecessary];

  return [*(id *)(a1 + 32) setOffsetEnabled:0];
}

void sub_1000094DC(uint64_t a1)
{
  v5[2] = (id)a1;
  v5[1] = (id)a1;
  id v1 = [*(id *)(a1 + 32) bulletinView];
  [v1 setUserInteractionEnabled:0];

  id v2 = [*(id *)(a1 + 32) contentView];
  [v2 setSize:1];

  [*(id *)(a1 + 32) setOffsetEnabled:1];
  id v3 = *(void **)(a1 + 32);
  v5[0] = v3;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_storeStrong(v5, 0LL);
}

void sub_100009624(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _videoBulletinView];
  [v1 setVideoView:0];

  id v3 = [*(id *)(a1 + 32) _videoBulletinView];
  id v2 = [*(id *)(a1 + 32) contentView];
  objc_msgSend(v3, "setVideoView:");

  id v5 = [*(id *)(a1 + 32) contentView];
  [v5 setWantsCameraViewControls:0 animated:0];
}

void sub_100009AD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id a26)
{
}

uint64_t sub_100009AFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained contentView];
  [v2 setCentered:0];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100009C90(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentedViewController];
  [v2 dismissViewControllerAnimated:0 completion:0];

  uint64_t result = a1;
  if (*(void *)(a1 + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  return result;
}

void sub_10000AF50(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v5 = 0LL;
  objc_storeStrong(&v5, a3);
  if ([location[0] count])
  {
    [a1[4] setCameraItem:v5];
    [a1[4] setAllCameraItems:location[0]];
    [a1[4] reloadControlProviders:1];
  }

  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

NSDictionary *sub_10000B014(uint64_t a1)
{
  v9[0] = @"hasSnapshot";
  v8 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(_BYTE *)(a1 + 48) & 1);
  v10[0] = v8;
  v9[1] = @"increaseSizeOnActivation";
  char v7 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(_BYTE *)(a1 + 49) & 1);
  v10[1] = v7;
  v9[2] = @"recognizedFamiliarFaces";
  v6 =  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 32) count] != 0);
  v10[2] = v6;
  v9[3] = @"isUpdating";
  id v5 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(_BYTE *)(a1 + 50) & 1);
  v10[3] = v5;
  v9[4] = @"bulletinID";
  id v3 = [*(id *)(a1 + 40) identifier];
  v10[4] = v3;
  id v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  5LL);

  return v4;
}

void sub_10000BE94()
{
}

id sub_10000BEA4(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  id result = a2[4];
  a1[4] = result;
  return result;
}

uint64_t sub_10000BF34(uint64_t result, uint64_t a2)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_10000BF74(id *a1)
{
}

void sub_10000CC28( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, id *location)
{
  *(void *)(v33 - 48) = a1;
  *(_DWORD *)(v33 - 52) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v33 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v33 - 48));
}

void sub_10000CC44( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id *a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, id *location)
{
  *(void *)(v33 - 48) = a1;
  *(_DWORD *)(v33 - 52) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v33 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v33 - 48));
}

void sub_10000CCE4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  if (v3[0])
  {
    objc_storeStrong((id *)((char *)v3[0] + 137), 0LL);
    [v3[0] snoozeCameraUntil:0];
  }

  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10000CDAC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  v5[0] = objc_loadWeakRetained(a1 + 4);
  if (v5[0])
  {
    objc_storeStrong((id *)((char *)v5[0] + 137), 0LL);
    id v3 = +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 900.0);
    [v5[0] snoozeCameraUntil:v3];
    objc_storeStrong((id *)&v3, 0LL);
    int v4 = 0;
  }

  else
  {
    int v4 = 1;
  }

  objc_storeStrong(v5, 0LL);
  if (!v4) {
    int v4 = 0;
  }
  objc_storeStrong(location, 0LL);
}

void sub_10000CEAC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  v5[0] = objc_loadWeakRetained(a1 + 4);
  if (v5[0])
  {
    objc_storeStrong((id *)((char *)v5[0] + 137), 0LL);
    id v3 = +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 3600.0);
    [v5[0] snoozeCameraUntil:v3];
    objc_storeStrong((id *)&v3, 0LL);
    int v4 = 0;
  }

  else
  {
    int v4 = 1;
  }

  objc_storeStrong(v5, 0LL);
  if (!v4) {
    int v4 = 0;
  }
  objc_storeStrong(location, 0LL);
}

void sub_10000CFAC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v9[1] = a1;
  v9[0] = objc_loadWeakRetained(a1 + 4);
  if (v9[0])
  {
    objc_storeStrong((id *)((char *)v9[0] + 137), 0LL);
    char v7 = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
    id v2 = v7;
    id v3 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
    v6 = -[NSCalendar startOfDayForDate:](v2, "startOfDayForDate:");

    id v5 =  -[NSCalendar dateByAddingUnit:value:toDate:options:]( v7,  "dateByAddingUnit:value:toDate:options:",  16LL,  1LL,  v6,  0LL);
    [v9[0] snoozeCameraUntil:v5];
    objc_storeStrong((id *)&v5, 0LL);
    objc_storeStrong((id *)&v6, 0LL);
    objc_storeStrong((id *)&v7, 0LL);
    int v8 = 0;
  }

  else
  {
    int v8 = 1;
  }

  objc_storeStrong(v9, 0LL);
  if (!v8) {
    int v8 = 0;
  }
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10000ECFC()
{
  predicate = (dispatch_once_t *)&unk_100036838;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_10002CB50);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return byte_100036830 & 1;
}

void sub_10000ED78(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  byte_100036830 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"DebugLayout");
}

void sub_1000116C8( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *location)
{
  *(void *)(v20 - 64) = a1;
  *(_DWORD *)(v20 - 68) = a2;
  objc_destroyWeak((id *)(v20 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v20 - 64));
}

void sub_10001175C(uint64_t a1)
{
  v11[2] = (id)a1;
  v11[1] = (id)a1;
  v11[0] = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [v11[0] titleLabel];
  [v6 setAlpha:(double)(*(_BYTE *)(a1 + 40) & 1)];

  id v7 = [v11[0] descriptionLabel];
  [v7 setAlpha:(double)(*(_BYTE *)(a1 + 40) & 1)];

  id v9 = [v11[0] symbolImageView];
  char v10 = 0;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    char v10 = *(_BYTE *)(a1 + 41) ^ 1;
  }
  [v9 setAlpha:(double)(v10 & 1)];

  id v4 = [v11[0] faceImageView];
  char v5 = 0;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    char v5 = *(_BYTE *)(a1 + 41);
  }
  [v4 setAlpha:(double)(v5 & 1)];

  id v3 = [v11[0] gradientImageView];
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    id v1 = @"FullScreenGradient";
  }
  else {
    id v1 = @"SmallGradient";
  }
  id v2 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v1);
  objc_msgSend(v3, "setImage:");

  objc_storeStrong(v11, 0LL);
}

void sub_100011958(uint64_t a1)
{
  v12[2] = (id)a1;
  v12[1] = (id)a1;
  v12[0] = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [v12[0] liveBadgeBottomConstraint];
  id v7 = v1;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    int v2 = -84;
  }
  else {
    int v2 = -16;
  }
  [v1 setConstant:(double)v2];

  id v3 = [v12[0] liveBadgeTrailingConstraint];
  id v8 = v3;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    int v4 = -90;
  }
  else {
    int v4 = -16;
  }
  [v3 setConstant:(double)v4];

  id v5 = [v12[0] liveBadgeHeightConstraint];
  id v9 = v5;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    int v6 = 42;
  }
  else {
    int v6 = 30;
  }
  [v5 setConstant:(double)v6];

  id v11 = [v12[0] liveBadgeView];
  [v11 setFullscreen:*(_BYTE *)(a1 + 40) & 1];

  [v12[0] layoutIfNeeded];
  objc_storeStrong(v12, 0LL);
}

void sub_100011FF4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cameraView];
  objc_msgSend(v1, "setAlpha:");

  id v2 = [*(id *)(a1 + 32) gradientImageView];
  [v2 setAlpha:1.0];

  id v4 = [*(id *)(a1 + 32) liveBadgeView];
  [v4 setAlpha:1.0];
}

uint64_t sub_1000120AC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2);
}

void sub_1000120E0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) placeholderSnapshotView];
  [v1 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) effectView];
  [v3 setHidden:1];
}

void sub_10001217C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) placeholderSnapshotView];
  [v1 setAlpha:0.0];
}

void sub_1000121CC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) effectView];
  [v1 setHidden:1];
}

uint64_t sub_100012504(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_100012D58(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cameraView];
  [v2 setAlpha:(double)(*(_BYTE *)(a1 + 40) & 1)];

  id v3 = [*(id *)(a1 + 32) liveBadgeView];
  [v3 setAlpha:(double)(*(_BYTE *)(a1 + 40) & 1)];

  id v4 = [*(id *)(a1 + 32) gradientImageView];
  [v4 setAlpha:(double)(*(_BYTE *)(a1 + 40) & 1)];

  id v5 = [*(id *)(a1 + 32) placeholderSnapshotView];
  [v5 setAlpha:(double)(*(_BYTE *)(a1 + 41) & 1)];

  id v8 = [*(id *)(a1 + 32) symbolImageView];
  else {
    id v1 = @"video.fill";
  }
  id v7 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v1);
  objc_msgSend(v8, "setImage:");
}

void sub_100013304(uint64_t *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  if (location[0])
  {
    oslog[0] = (os_log_t)sub_10001E6C8();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      sub_10001349C((uint64_t)v8, a1[4], (uint64_t)location[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog[0],  type,  "Failed to update audio stream setting to %lu with error %@",  v8,  0x16u);
    }

    objc_storeStrong((id *)oslog, 0LL);
  }

  else
  {
    os_log_t v3 = (os_log_t)sub_10001E6C8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000134EC((uint64_t)v7, a1[4]);
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Successfully updated audio stream setting to %lu",  v7,  0xCu);
    }

    objc_storeStrong((id *)&v3, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_10001349C(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_1000134EC(uint64_t result, uint64_t a2)
{
  *(_BYTE *)id result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_100017F18(id a1)
{
  v47[2] = a1;
  v47[1] = a1;
  v47[0] =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle3);
  v46 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v47[0],  2LL);
  v45 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v47[0]);
  id v5 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
  v44 =  +[UIImageSymbolConfiguration configurationWithHierarchicalColor:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithHierarchicalColor:");

  id v43 =  -[UIImageSymbolConfiguration configurationByApplyingConfiguration:]( v45,  "configurationByApplyingConfiguration:",  v44);
  v42 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"appletvremote.gen4.fill",  v45);
  v50[0] = PBSSystemBulletinImageIDAirPods;
  v41 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"airpods",  v43);
  v51[0] = v41;
  v50[1] = PBSSystemBulletinImageIDAirPodsMax;
  v40 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"airpodsmax",  v43);
  v51[1] = v40;
  v50[2] = PBSSystemBulletinImageIDAirPodsPro;
  v39 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"airpodspro",  v43);
  v51[2] = v39;
  v50[3] = PBSSystemBulletinImageIDAlert;
  v38 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"exclamationmark.triangle.fill",  v45);
  v51[3] = v38;
  v50[4] = PBSSystemBulletinImageIDAppStore;
  v37 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"appstore",  v46);
  v51[4] = v37;
  v50[5] = PBSSystemBulletinImageIDArcade;
  v36 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"joystickcontroller.fill",  v46);
  v51[5] = v36;
  v50[6] = PBSSystemBulletinImageIDAudio;
  v35 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:");
  v51[6] = v35;
  v50[7] = PBSSystemBulletinImageIDBeatsHeadphones;
  v34 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"beats.headphones",  v43);
  v51[7] = v34;
  v50[8] = PBSSystemBulletinImageIDBeatsStudioBuds;
  uint64_t v33 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"beats.studiobuds",  v43);
  v51[8] = v33;
  v50[9] = PBSSystemBulletinImageIDBeatsX;
  v32 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"beats.earphones",  v43);
  v51[9] = v32;
  v50[10] = PBSSystemBulletinImageIDBluetooth;
  v31 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"bluetooth.circle.fill",  v45);
  v51[10] = v31;
  v50[11] = PBSSystemBulletinImageIDB494;
  v30 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"beats.fit.pro",  v43);
  v51[11] = v30;
  v50[12] = PBSSystemBulletinImageIDB688;
  v29 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"airpods.gen3",  v43);
  v51[12] = v29;
  v50[13] = PBSSystemBulletinImageIDController;
  v28 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"gamecontroller.fill",  v46);
  v51[13] = v28;
  v50[14] = PBSSystemBulletinImageIDDoorbell;
  v27 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"bell.fill",  v45);
  v51[14] = v27;
  v50[15] = PBSSystemBulletinImageIDHeartFavorite;
  uint64_t v26 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"heart.fill",  v45);
  v51[15] = v26;
  v50[16] = PBSSystemBulletinImageIDHeartUnfavorite;
  v25 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"heart.slash.fill",  v45);
  v51[16] = v25;
  v50[17] = PBSSystemBulletinImageIDHomeKit;
  v24 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"homekit",  v45);
  v51[17] = v24;
  v50[18] = PBSSystemBulletinImageIDKeyboard;
  v23 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"keyboard",  v46);
  v51[18] = v23;
  v50[19] = PBSSystemBulletinImageIDMusic;
  v22 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"music",  v46);
  v51[19] = v22;
  v50[20] = PBSSystemBulletinImageIDPairing;
  v21 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"personalhotspot",  v46);
  v51[20] = v21;
  v50[21] = PBSSystemBulletinImageIDPodcast;
  uint64_t v20 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"podcasts",  v46);
  v51[21] = v20;
  v50[22] = PBSSystemBulletinImageIDPower;
  v19 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"power.circle",  v45);
  v51[22] = v19;
  v50[23] = PBSSystemBulletinImageIDPowerBeatsPro;
  v18 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"beats.powerbeatspro",  v43);
  v51[23] = v18;
  v50[24] = PBSSystemBulletinImageIDPowerBeats3;
  id v17 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"beats.powerbeats3",  v43);
  v51[24] = v17;
  v50[25] = PBSSystemBulletinImageIDPowerBeats4;
  v16 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:");
  v51[25] = v16;
  v50[26] = PBSSystemBulletinImageIDPowerBeats;
  v15 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"beats.powerbeats",  v43);
  v51[26] = v15;
  v50[27] = PBSSystemBulletinImageIDRemoteExt1;
  v14 =  +[_TVSBBulletinImageInfo infoWithImageName:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithImageName:",  @"icon_remoteExt");
  v51[27] = v14;
  v50[28] = PBSSystemBulletinImageIDRemote;
  v51[28] = v42;
  v50[29] = PBSSystemBulletinImageIDRemoteBatteryWarning;
  v51[29] = v42;
  v50[30] = PBSSystemBulletinImageIDRemoteCharging;
  v51[30] = v42;
  v50[31] = PBSSystemBulletinImageIDRemoteGen2;
  v13 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"appletvremote.gen2.fill",  v45);
  v51[31] = v13;
  v50[32] = PBSSystemBulletinImageIDRemoteGen3;
  v12 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"appletvremote.gen3.fill",  v45);
  v51[32] = v12;
  v50[33] = PBSSystemBulletinImageIDRemoteGen4;
  v51[33] = v42;
  v50[34] = PBSSystemBulletinImageIDScreenSharing;
  id v11 =  +[_TVSBBulletinImageInfo infoWithImageName:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithImageName:",  @"icon_screen_sharing");
  v51[34] = v11;
  v50[35] = PBSSystemBulletinImageIDScreenshot;
  char v10 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"camera.viewfinder",  v45);
  v51[35] = v10;
  v50[36] = PBSSystemBulletinImageIDTapToRadar;
  id v9 =  +[_TVSBBulletinImageInfo infoWithImageName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithImageName:configuration:",  @"ttr.circle.fill",  v45);
  v51[36] = v9;
  v50[37] = PBSSystemBulletinImageIDTV;
  id v8 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"tv",  v46);
  v51[37] = v8;
  v50[38] = PBSSystemBulletinImageIDVideoCamera;
  id v7 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"video.fill",  v46);
  v51[38] = v7;
  v50[39] = PBSSystemBulletinImageIDVolume;
  int v6 =  +[_TVSBBulletinImageInfo infoWithSymbolName:configuration:]( &OBJC_CLASS____TVSBBulletinImageInfo,  "infoWithSymbolName:configuration:",  @"speaker.wave.3.fill",  v46);
  v51[39] = v6;
  id v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  40LL);
  id v2 = (void *)qword_100036840;
  qword_100036840 = (uint64_t)v1;

  v48[0] = PBSSystemBulletinSymbolConfigurationDefault;
  v49[0] = v46;
  v48[1] = PBSSystemBulletinSymbolConfigurationLarge;
  v49[1] = v45;
  v48[2] = PBSSystemBulletinSymbolConfigurationHeadphones;
  v49[2] = v43;
  os_log_t v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  3LL);
  id v4 = (void *)qword_100036848;
  qword_100036848 = (uint64_t)v3;

  objc_storeStrong((id *)&v42, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong((id *)&v44, 0LL);
  objc_storeStrong((id *)&v45, 0LL);
  objc_storeStrong((id *)&v46, 0LL);
  objc_storeStrong(v47, 0LL);
}

void sub_100019158(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  v14[1] = a1;
  v14[0] = objc_loadWeakRetained(a1 + 4);
  if (v14[0])
  {
    id v3 = v15;
    int v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_1000192CC;
    char v10 = &unk_10002CF00;
    id v11 = v14[0];
    id v12 = location[0];
    +[PBSOverlayLayoutTransitionContext tryAnimatingWithContext:actions:completion:]( &OBJC_CLASS___PBSOverlayLayoutTransitionContext,  "tryAnimatingWithContext:actions:completion:",  v3,  &v6);
    objc_storeStrong(&v12, 0LL);
    objc_storeStrong(&v11, 0LL);
    int v13 = 0;
  }

  else
  {
    int v13 = 1;
  }

  objc_storeStrong(v14, 0LL);
  if (!v13) {
    int v13 = 0;
  }
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_1000192CC(uint64_t a1)
{
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) offset];
  return objc_msgSend(v4, "setOffset:", v1, v2);
}

void sub_1000198A0(id a1)
{
  v3[0] = PBSSystemBulletinTextImageIDXboxButton;
  v4[0] = @"logo.xbox";
  v3[1] = PBSSystemBulletinTextImageIDPlayStationButton;
  v4[1] = @"logo.playstation";
  id v3[2] = PBSSystemBulletinTextImageIDHomeButton;
  v4[2] = @"house.circle";
  v3[3] = PBSSystemBulletinTextImageIDTVButton;
  v4[3] = @"tv.circle";
  double v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL);
  double v2 = (void *)qword_100036858;
  qword_100036858 = (uint64_t)v1;
}

void sub_10001999C(id *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  *(void *)&__int128 v21 = a3;
  *((void *)&v21 + 1) = a4;
  id location[2] = a5;
  location[3] = a6;
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v19 = a7;
  v18 = a1;
  id v9 = (void *)qword_100036858;
  char v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  int v13 = sub_100019AB4;
  v14 = &unk_10002CF70;
  id v15 = location[0];
  id v16 = a1[4];
  __int128 v17 = v21;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:");
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100019AB4(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  if ([*(id *)(a1 + 32) isEqualToString:location[0]])
  {
    id v4 = *(void **)(a1 + 40);
    id v3 = v8;
    id v5 =  +[NSValue valueWithRange:]( &OBJC_CLASS___NSValue,  "valueWithRange:",  *(void *)(a1 + 48),  *(void *)(a1 + 56));
    objc_msgSend(v4, "setObject:forKey:", v3);
  }

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100019B98(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  id v14[2] = a4;
  v14[1] = a1;
  v14[0] =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  v15,  a1[4]);
  int v13 = objc_alloc_init(&OBJC_CLASS___NSTextAttachment);
  int v7 = v13;
  id v8 = [v14[0] imageWithRenderingMode:2];
  -[NSTextAttachment setImage:](v7, "setImage:");

  int v12 =  +[NSAttributedString attributedStringWithAttachment:]( &OBJC_CLASS___NSAttributedString,  "attributedStringWithAttachment:",  v13);
  char v10 = (void *)a1[5];
  id v11 = [location[0] rangeValue];
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", v11, v4, v12);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10001A1DC(uint64_t a1)
{
  v7[2] = (id)a1;
  v7[1] = (id)a1;
  v7[0] = [*(id *)(a1 + 32) view];
  id location = [*(id *)(a1 + 32) bulletinViewForBulletin:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setBulletinView:location];
  if (location)
  {
    [v7[0] bounds];
    objc_msgSend(location, "setFrame:", v1, v2, v3, v4);
    [v7[0] addSubview:location];
    [*(id *)(a1 + 32) _showBulletinView:1];
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v7, 0LL);
}

void sub_10001A708(id a1, PBSOverlayLayoutElementHandleSettings *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [location[0] setHidden:1];
  objc_storeStrong(location, 0LL);
}

void sub_10001AF70(double *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setFrame:", a1[4], a1[5], a1[6], a1[7]);
  [location[0] setHidden:0];
  objc_storeStrong(location, 0LL);
}

  ;
}

id sub_10001B01C(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v6 = a1;
  double v2 = *(void **)(a1 + 32);
  double v3 = *(void **)(a1 + 40);
  if (v3)
  {
    memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
    [v3 adjustedTransformForContentView:__dst];
  }

  else
  {
    memset(__b, 0, sizeof(__b));
  }

  return [v2 setTransform:__b];
}

void sub_10001B0B8(uint64_t a1)
{
}

  ;
}

id sub_10001B118(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, a1, a1);
}

id sub_10001B14C(uint64_t a1)
{
  return [*(id *)(a1 + 40) didEndAnimatingInBulletinView:*(void *)(a1 + 48)];
}

id sub_10001B198(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndAnimatingInBulletinView:", *(void *)(a1 + 40), a1, a1);
}

id sub_10001B70C(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  double v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 transform];
  }
  else {
    memset(__b, 0, sizeof(__b));
  }
  double v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v6, 0.75, 0.75);
  memcpy(&__dst, __b, sizeof(__dst));
  CGAffineTransformConcat(&v7, &v6, &__dst);
  return [v2 setTransform:&v7];
}

void sub_10001B7D8(uint64_t a1)
{
}

id sub_10001B80C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0, a1, a1);
}

void sub_10001B840(uint64_t a1)
{
}

uint64_t sub_10001B874(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t sub_10001BE40(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), 1LL);
}

uint64_t sub_10001BE7C(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), 1LL);
}

void sub_10001C7E4(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v64 = 0LL;
  objc_storeStrong(&v64, a3);
  v63[1] = a1;
  if (!v64)
  {
    v63[0] = [a1[4] displayedItemsInSection:0];
    id v62 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
    id v61 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    memset(__b, 0, sizeof(__b));
    id v42 = v63[0];
    id v43 = [v42 countByEnumeratingWithState:__b objects:v69 count:16];
    if (v43)
    {
      uint64_t v39 = *(void *)__b[2];
      uint64_t v40 = 0LL;
      id v41 = v43;
      while (1)
      {
        uint64_t v38 = v40;
        if (*(void *)__b[2] != v39) {
          objc_enumerationMutation(v42);
        }
        id v60 = *(id *)(__b[1] + 8 * v40);
        id v34 = v60;
        id v35 = v61;
        id v37 = [v60 homeKitObject];
        id v36 = [v37 uniqueIdentifier];
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v34);

        ++v40;
        if (v38 + 1 >= (unint64_t)v41)
        {
          uint64_t v40 = 0LL;
          id v41 = [v42 countByEnumeratingWithState:__b objects:v69 count:16];
          if (!v41) {
            break;
          }
        }
      }
    }

    memset(v57, 0, sizeof(v57));
    id v32 = a1[5];
    id v33 = [v32 countByEnumeratingWithState:v57 objects:v68 count:16];
    if (v33)
    {
      uint64_t v29 = *(void *)v57[2];
      uint64_t v30 = 0LL;
      id v31 = v33;
      while (1)
      {
        uint64_t v28 = v30;
        if (*(void *)v57[2] != v29) {
          objc_enumerationMutation(v32);
        }
        id v58 = *(id *)(v57[1] + 8 * v30);
        id v27 = v58;
        uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v27, v3) & 1) != 0)
        {
          id v56 = objc_msgSend(v58, "bs_safeStringForKey:", PBSSystemBulletinCameraNameKey);
          id v55 = objc_msgSend(v58, "bs_safeStringForKey:", PBSSystemBulletinRoomNameKey);
          id v54 = 0LL;
          memset(v52, 0, sizeof(v52));
          id v25 = [a1[6] rooms];
          id v26 = [v25 countByEnumeratingWithState:v52 objects:v67 count:16];
          if (v26)
          {
            uint64_t v22 = *(void *)v52[2];
            uint64_t v23 = 0LL;
            id v24 = v26;
            while (1)
            {
              uint64_t v21 = v23;
              if (*(void *)v52[2] != v22) {
                objc_enumerationMutation(v25);
              }
              id v53 = *(id *)(v52[1] + 8 * v23);
              id v19 = [v53 name];
              unsigned __int8 v20 = [v19 isEqualToString:v55];

              if ((v20 & 1) != 0) {
                break;
              }
              ++v23;
              if (v21 + 1 >= (unint64_t)v24)
              {
                uint64_t v23 = 0LL;
                id v24 = [v25 countByEnumeratingWithState:v52 objects:v67 count:16];
                if (!v24) {
                  goto LABEL_21;
                }
              }
            }

            objc_storeStrong(&v54, v53);
            int v51 = 6;
          }

          else
          {
LABEL_21:
            int v51 = 0;
          }

          id v50 =  +[HMCameraProfile tvhm_cameraProfileWithName:home:room:]( &OBJC_CLASS___HMCameraProfile,  "tvhm_cameraProfileWithName:home:room:",  v56,  a1[6],  v54);
          id v17 = v61;
          id v18 = [v50 uniqueIdentifier];
          id v49 = objc_msgSend(v17, "objectForKeyedSubscript:");

          if (v49)
          {
            id v14 = v62;
            id v16 = [v49 accessory];
            id v15 = [v16 uniqueIdentifier];
            objc_msgSend(v14, "addObject:");
          }

          objc_storeStrong(&v49, 0LL);
          objc_storeStrong(&v50, 0LL);
          objc_storeStrong(&v54, 0LL);
          objc_storeStrong(&v55, 0LL);
          objc_storeStrong(&v56, 0LL);
        }

        ++v30;
        if (v28 + 1 >= (unint64_t)v31)
        {
          uint64_t v30 = 0LL;
          id v31 = [v32 countByEnumeratingWithState:v57 objects:v68 count:16];
          if (!v31) {
            break;
          }
        }
      }
    }

    id v48 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    memset(v46, 0, sizeof(v46));
    id v12 = v63[0];
    id v13 = [v12 countByEnumeratingWithState:v46 objects:v66 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)v46[2];
      uint64_t v10 = 0LL;
      id v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)v46[2] != v9) {
          objc_enumerationMutation(v12);
        }
        id v47 = *(id *)(v46[1] + 8 * v10);
        id v4 = v62;
        id v6 = [v47 accessory];
        id v5 = [v6 uniqueIdentifier];
        unsigned __int8 v7 = objc_msgSend(v4, "containsObject:");

        if ((v7 & 1) != 0) {
          [v48 addObject:v47];
        }
        ++v10;
        if (v8 + 1 >= (unint64_t)v11)
        {
          uint64_t v10 = 0LL;
          id v11 = [v12 countByEnumeratingWithState:v46 objects:v66 count:16];
          if (!v11) {
            break;
          }
        }
      }
    }

    [a1[7] setCameraItems:v48];
    [a1[7] setAllCameraItems:v63[0]];
    objc_storeStrong(&v48, 0LL);
    objc_storeStrong(&v61, 0LL);
    objc_storeStrong(&v62, 0LL);
    objc_storeStrong(v63, 0LL);
  }

  objc_storeStrong(&v64, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_10001D6F4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "titleText", a1, a1);
}

id sub_10001D724(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subtitleText", a1, a1);
}

id sub_10001D754(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "footerText", a1, a1);
}

id sub_10001D784(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attributedFooterText", a1, a1);
}

id sub_10001D7B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "image", a1, a1);
}

id sub_10001D7E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageURL", a1, a1);
}

id sub_10001D814(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "customView", a1, a1);
}

uint64_t start(int a1, char **a2)
{
  dword_100036868 = CARenderServerGetServerPort(0LL);
  if (!dword_100036868)
  {
    __break(1u);
    JUMPOUT(0x10001E4E4LL);
  }

  NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)sub_10001E564);
  context = objc_autoreleasePoolPush();
  double v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSystemBulletinServiceAppDelegate);
  id v4 = NSStringFromClass(v2);
  unsigned int v8 = UIApplicationMain(a1, a2, 0LL, v4);

  objc_autoreleasePoolPop(context);
  return v8;
}

void sub_10001E564(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  pos_log_type_t type = 0;
  BOOL v4 = 1;
  if (!mach_port_type(mach_task_self_, dword_100036868, &ptype)) {
    BOOL v4 = (ptype & 0x70000) == 0;
  }
  if (v4)
  {
    unsigned __int8 v3 = byte_10003686C;
    do
    {
      unsigned __int8 v1 = v3;
      do
        int v2 = __ldaxr((unsigned __int8 *)&byte_10003686C);
      while (v2 == v3 && __stlxr(1u, (unsigned __int8 *)&byte_10003686C));
      unsigned __int8 v3 = v2;
    }

    while (v2 != v1);
    if ((v2 & 1) != 0) {
      _Exit(1);
    }
    exit(1);
  }

  objc_storeStrong(&location, 0LL);
}

id sub_10001E6C8()
{
  predicate = (dispatch_once_t *)&unk_100036878;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_10002D2B8);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100036870;
}

void sub_10001E740(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemBulletinService", "HomeBulletin");
  int v2 = (void *)qword_100036870;
  qword_100036870 = (uint64_t)v1;
}

id sub_10001E78C()
{
  predicate = (dispatch_once_t *)&unk_100036888;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_10002D2D8);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100036880;
}

void sub_10001E804(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemBulletinService", "InfoBulletin");
  int v2 = (void *)qword_100036880;
  qword_100036880 = (uint64_t)v1;
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return [a1 yellowColor];
}