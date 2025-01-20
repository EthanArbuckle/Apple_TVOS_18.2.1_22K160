}

void sub_410C(id a1)
{
  id v12 = +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
  v11 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL);
  id v1 = objc_msgSend(v12, "resolvedColorWithTraitCollection:");
  v2 = (void *)qword_5F870;
  qword_5F870 = (uint64_t)v1;

  id v3 = [(id)qword_5F870 colorWithAlphaComponent:0.6];
  v4 = (void *)qword_5F878;
  qword_5F878 = (uint64_t)v3;

  v5 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
  v6 = (void *)qword_5F880;
  qword_5F880 = (uint64_t)v5;

  v7 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
  v8 = (void *)qword_5F888;
  qword_5F888 = (uint64_t)v7;

  v9 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  v10 = (void *)qword_5F890;
  qword_5F890 = (uint64_t)v9;
}

id sub_4270(uint64_t a1)
{
  v7 = *(void **)(*(void *)(a1 + 32) + 48LL);
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 9LL) & 1) == 0 && (*(_BYTE *)(*(void *)(a1 + 32) + 8LL) & 1) != 0) {
    [v7 setTextColor:qword_5F888];
  }
  else {
    [v7 setTextColor:qword_5F890];
  }
  v5 = *(void **)(*(void *)(a1 + 32) + 56LL);
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 9LL) & 1) == 0 && (*(_BYTE *)(*(void *)(a1 + 32) + 8LL) & 1) != 0) {
    [v5 setTextColor:qword_5F888];
  }
  else {
    [v5 setTextColor:qword_5F890];
  }
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 9LL) & 1) != 0)
  {
    v4 = *(void **)(*(void *)(a1 + 32) + 40LL);
    if ((*(_BYTE *)(*(void *)(a1 + 32) + 8LL) & 1) != 0) {
      [v4 setBackgroundColor:qword_5F870];
    }
    else {
      [v4 setBackgroundColor:qword_5F878];
    }
  }

  else
  {
    [*(id *)(*(void *)(a1 + 32) + 40) setBackgroundColor:qword_5F880];
  }

  [*(id *)(a1 + 32) _updatePackageViewVisibility];
  [*(id *)(a1 + 32) _updatePackageRasterizationScale];
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 10LL) & 1) != 0)
  {
    double v1 = 0.75;
    if ((*(_BYTE *)(*(void *)(a1 + 32) + 8LL) & 1) == 0) {
      double v1 = 0.5;
    }
    double v3 = v1;
  }

  else
  {
    double v3 = 1.0;
  }

  double v8 = v3;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setAlpha:", v3, *(void *)&v3);
  return [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:v8];
}

void sub_513C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  v5[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = v5[0];
  id v4 = [v5[0] routeConnection];
  objc_msgSend(v3, "_metadataDidChange:forKeys:");

  objc_storeStrong(v5, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_5C00(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_5D14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

void sub_6910(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemMenu.AirPods-Module.TVSMAirPodsModuleHeadsetsCollectionViewController", "");
  v2 = (void *)qword_5F8A8;
  qword_5F8A8 = (uint64_t)v1;
}

void sub_6E8C( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, id *location)
{
  *(void *)(v29 - 64) = a1;
  *(_DWORD *)(v29 - 68) = a2;
  objc_destroyWeak((id *)(v29 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v29 - 64));
}

id sub_6EE8(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v17 = 0LL;
  objc_storeStrong(&v17, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  v15[1] = a1;
  v15[0] = objc_loadWeakRetained(a1 + 4);
  id v9 = location[0];
  id v4 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRouteCollectionViewCell);
  v10 = NSStringFromClass(v4);
  id v14 = objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");

  id v11 = [v15[0] routesByUID];
  id v13 = [v11 objectForKey:v16];

  [v14 setRoute:v13];
  id v12 = v14;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

void sub_758C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, int a39, int a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, id a48)
{
}

void sub_75D4(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = objc_loadWeakRetained((id *)(a1 + 40));
  [v2[0] setRoutesByUID:*(void *)(a1 + 32)];
  objc_storeStrong(v2, 0LL);
}

void sub_79DC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 layoutIfNeeded];
}

uint64_t sub_7FE4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

_BYTE *sub_804C(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

id sub_A850(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_A964(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_AA7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

uint64_t sub_B044(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 0;
  *(_BYTE *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 34) = 0;
  *(_BYTE *)(result + 35) = 4;
  *(_DWORD *)(result + 36) = a6;
  *(_BYTE *)(result + 40) = 0;
  *(_BYTE *)(result + 41) = 4;
  *(_DWORD *)(result + 42) = a7;
  return result;
}

NSDictionary *sub_C054(uint64_t a1)
{
  id v4 = @"headsets";
  id v2 = [*(id *)(a1 + 32) _selectedHeadsetTypes];
  id v5 = v2;
  id v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL);

  return v3;
}

NSCollectionLayoutSection *__cdecl sub_C384(id a1, int64_t a2, NSCollectionLayoutEnvironment *a3)
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v19[1] = a1;
  v10 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:");
  id v9 =  +[NSCollectionLayoutDimension estimatedDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "estimatedDimension:",  103.0);
  v19[0] =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v10);

  v18 =  +[NSCollectionLayoutItem itemWithLayoutSize:]( &OBJC_CLASS___NSCollectionLayoutItem,  "itemWithLayoutSize:",  v19[0]);
  id v11 = v19[0];
  v21 = v18;
  id v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL);
  id v17 =  +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:]( &OBJC_CLASS___NSCollectionLayoutGroup,  "horizontalGroupWithLayoutSize:subitems:",  v11);

  id v16 =  +[NSCollectionLayoutSection sectionWithGroup:]( &OBJC_CLASS___NSCollectionLayoutSection,  "sectionWithGroup:",  v17);
  -[NSCollectionLayoutSection setInterGroupSpacing:](v16, "setInterGroupSpacing:", 132.0);
  id v13 = [location[0] container];
  [v13 effectiveContentSize];

  id v14 = v16;
  sub_C670();
  -[NSCollectionLayoutSection setContentInsets:](v14, "setContentInsets:", v3, v4, v5, v6);
  v15 = v16;
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v15;
}

  ;
}

void sub_CFC0(id *a1)
{
  v38[2] = a1;
  v38[1] = a1;
  v38[0] = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1[4]));
  v37 = @"@@PLUS@@";
  id v9 = v38[0];
  id v10 = [a1[4] traitCollection];
  v36 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"nowplaying_volumebtn-up",  v9);

  v35 = -[NSTextAttachment initWithData:ofType:]( objc_alloc(&OBJC_CLASS___NSTextAttachment),  "initWithData:ofType:",  0LL);
  -[NSTextAttachment setImage:](v35, "setImage:", v36);
  v34 = @"@@MINUS@@";
  id v11 = v38[0];
  id v12 = [a1[4] traitCollection];
  v33 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"nowplaying_volumebtn-dwn",  v11);

  v32 = -[NSTextAttachment initWithData:ofType:]( objc_alloc(&OBJC_CLASS___NSTextAttachment),  "initWithData:ofType:",  0LL);
  -[NSTextAttachment setImage:](v32, "setImage:", v33);
  __int16 v30 = -4;
  v31 = +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", &v30);
  id v14 = objc_alloc((Class)&OBJC_CLASS___NSAttributedString);
  id v13 = v31;
  NSAttributedStringKey v43 = NSAttachmentAttributeName;
  v44 = v35;
  v15 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL);
  id v29 = objc_msgSend(v14, "initWithString:attributes:", v13);

  id v17 = objc_alloc((Class)&OBJC_CLASS___NSAttributedString);
  id v16 = v31;
  NSAttributedStringKey v41 = NSAttachmentAttributeName;
  v42 = v32;
  v18 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL);
  id v28 = objc_msgSend(v17, "initWithString:attributes:", v16);

  v20 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1[4]));
  v27 =  -[NSBundle localizedStringForKey:value:table:]( v20,  "localizedStringForKey:value:table:",  @"MasterVolumeText",  &stru_51218,  0LL);

  v22 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  v21 = v27;
  NSAttributedStringKey v39 = NSBaselineOffsetAttributeName;
  v40 = &off_53150;
  v23 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL);
  v26 = -[NSMutableAttributedString initWithString:attributes:](v22, "initWithString:attributes:", v21);

  id v25 = -[NSString rangeOfString:](v27, "rangeOfString:", @"@@PLUS@@");
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v26,  "replaceCharactersInRange:withAttributedString:",  v25,  v1,  v29);
  id v2 = (NSString *)-[NSMutableAttributedString string](v26, "string");
  double v3 = v27;
  v27 = v2;

  id v24 = -[NSString rangeOfString:](v27, "rangeOfString:", @"@@MINUS@@");
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v26,  "replaceCharactersInRange:withAttributedString:",  v24,  v4,  v28);
  double v5 = (NSString *)-[NSMutableAttributedString string](v26, "string");
  double v6 = v27;
  v27 = v5;

  id v7 = -[NSMutableAttributedString copy](v26, "copy");
  double v8 = (void *)qword_5F8B0;
  qword_5F8B0 = (uint64_t)v7;

  objc_storeStrong((id *)&v26, 0LL);
  objc_storeStrong((id *)&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong((id *)&v31, 0LL);
  objc_storeStrong((id *)&v32, 0LL);
  objc_storeStrong((id *)&v33, 0LL);
  objc_storeStrong((id *)&v34, 0LL);
  objc_storeStrong((id *)&v35, 0LL);
  objc_storeStrong((id *)&v36, 0LL);
  objc_storeStrong((id *)&v37, 0LL);
  objc_storeStrong(v38, 0LL);
}

void sub_DBB0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void sub_F20C(_DWORD *a1, void *a2, unint64_t a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unint64_t v33 = a3;
  v32[2] = a4;
  v32[1] = a1;
  v32[0] = objc_alloc_init(&OBJC_CLASS___CAKeyframeAnimation);
  [location[0] frame];
  v29[1] = v4;
  v29[2] = v5;
  *(void *)&__int128 v30 = v6;
  *((void *)&v30 + 1) = v7;
  __int128 v31 = v30;
  sub_E858();
  v26 = +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v8, v9, v10, v11);
  v35[0] = v26;
  sub_E858();
  id v25 = +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v12, v13, v14, v15);
  v35[1] = v25;
  sub_E858();
  id v24 = +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v16, v17, v18, v19);
  v35[2] = v24;
  v29[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 3LL);

  [v32[0] setKeyPath:@"bounds"];
  [v32[0] setValues:v29[0]];
  [v32[0] setKeyTimes:&off_53390];
  [v32[0] setDuration:1.0];
  HIDWORD(v20) = HIDWORD(v33);
  *(float *)&double v20 = (float)v33 + 1.0;
  [v32[0] setSpeed:v20];
  LODWORD(v21) = a1[8];
  [v32[0] setRepeatCount:v21];
  id v28 = [location[0] layer];
  [v28 addAnimation:v32[0] forKey:@"BarAnimation"];

  objc_storeStrong(v29, 0LL);
  objc_storeStrong(v32, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_10720(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded", a1, a1);
}

void sub_1115C(id a1)
{
  id v1 = -[UIColor initWithWhite:alpha:](objc_alloc(&OBJC_CLASS___UIColor), "initWithWhite:alpha:", 1.0, 0.3);
  id v2 = (void *)qword_5F8C0;
  qword_5F8C0 = (uint64_t)v1;
}

void sub_11234(id a1)
{
  id v1 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor", a1, a1);
  id v2 = (void *)qword_5F8D0;
  qword_5F8D0 = (uint64_t)v1;
}

void sub_12200()
{
}

void sub_12210(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVNowPlayingService.TVNPGroupableRoutingController", "");
  id v2 = (void *)qword_5F8E8;
  qword_5F8E8 = (uint64_t)v1;
}

uint64_t sub_1225C(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_1229C(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v4[1] = (id)a1;
  if (*(void *)(a1 + 32))
  {
    v4[0] = objc_loadWeakRetained((id *)(a1 + 40));
    id v3 = [v4[0] _endpointRoutesWithForcedLocalRoute:location[0]];
    objc_msgSend(v4[0], "_updateWithAvailableEndpoints:outputDevices:", v3);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    objc_storeStrong(&v3, 0LL);
    objc_storeStrong(v4, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_126C0(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_137A0(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v4 = (void *)a1[4];
  id v6 = [location[0] mediaProfile];
  id v5 = [v6 routeUID];
  unsigned __int8 v7 = objc_msgSend(v4, "containsObject:");

  objc_storeStrong(location, 0LL);
  return v7 & 1;
}

uint64_t sub_1386C(uint64_t result, int a2, int a3, int a4, int a5)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 0;
  *(_BYTE *)(result + 15) = 4;
  *(_DWORD *)(result + 16) = a4;
  *(_BYTE *)(result + 20) = 0;
  *(_BYTE *)(result + 21) = 4;
  *(_DWORD *)(result + 22) = a5;
  return result;
}

uint64_t sub_138DC(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_1392C(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_5F8E8;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1225C((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Add Picked Route result: %{public}@", v5, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_13A20(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_5F8E8;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_126C0((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Set Picked Route result: %@", v5, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_13E78(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_5F8E8;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1225C((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Remove Picked Route result: %{public}@", v5, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_14230(uint64_t a1, char a2, id obj)
{
  uint64_t v13 = a1;
  char v12 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  v10[1] = (id)a1;
  v10[0] = *(id *)(a1 + 32);
  if (location)
  {
    os_log_t oslog = (os_log_t)(id)qword_5F8E8;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_126C0((uint64_t)v14, (uint64_t)location);
      _os_log_error_impl(&dword_0, oslog, OS_LOG_TYPE_ERROR, "Error updating media destination %@", v14, 0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    id v9 = (id)qword_5F8E8;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      sub_126C0((uint64_t)v15, *(void *)(a1 + 40));
      _os_log_impl(&dword_0, (os_log_t)v9, v8, "Successfully updated media destination to %@", v15, 0xCu);
    }

    objc_storeStrong(&v9, 0LL);
    id v3 = v10[0];
    id v5 = [v10[0] homeDestinationController];
    id v4 = [v5 availableDestinations];
    objc_msgSend(v3, "_updateWithAvailableMediaDestinations:");
  }

  objc_storeStrong(v10, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_14960(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0] && (*((_BYTE *)location[0] + 11) & 1) != 0)
  {
    *((_BYTE *)location[0] + 11) = 0;
    [location[0] _updateAvailableRoutes];
  }

  objc_storeStrong(location, 0LL);
}

void sub_14CF4(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_14D48(uint64_t a1)
{
}

void sub_14D74(uint64_t a1)
{
  v16[2] = (id)a1;
  v16[1] = (id)a1;
  id v3 = *(void **)(a1 + 32);
  double v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  uint64_t v13 = sub_14F10;
  double v14 = &unk_50C08;
  v15[1] = *(id *)(a1 + 56);
  objc_copyWeak(v16, (id *)(a1 + 72));
  v15[0] = *(id *)(a1 + 40);
  [v3 fetchAvailableRoutesWithCompletionHandler:&v10];
  os_log_t v1 = *(void **)(a1 + 48);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_14FB0;
  os_log_type_t v8 = &unk_50C30;
  v9[1] = *(id *)(a1 + 64);
  v9[0] = *(id *)(a1 + 40);
  [v1 fetchAvailableRoutesWithCompletionHandler:&v4];
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(v15, 0LL);
  objc_destroyWeak(v16);
}

void sub_14ED0(uint64_t a1, int a2)
{
  *(void *)(v2 - 80) = a1;
  *(_DWORD *)(v2 - 84) = a2;
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 80));
}

void sub_14F10(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained _endpointRoutesWithForcedLocalRoute:location[0]];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_storeStrong(location, 0LL);
}

void sub_14FB0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v2 = [location[0] copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_storeStrong(location, 0LL);
}

void sub_15030(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (location[0])
  {
    [location[0] _updateWithAvailableEndpoints:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) outputDevices:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    id v2 = [location[0] homeDestinationController];
    id v1 = [v2 availableDestinations];
    objc_msgSend(location[0], "_updateWithAvailableMediaDestinations:");
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_18574(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_185C4(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v9[3] = a3;
  v9[2] = a4;
  v9[1] = a1;
  id v11 = (id)MRAVOutputDeviceCopyUniqueIdentifier(location[0]);
  v9[0] = v11;
  unsigned __int8 v8 = [v9[0] isEqual:a1[4]];
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v8 & 1;
}

uint64_t sub_18680(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_186E8(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v3 = [a1[4] objectForKey:location[0]];
  BOOL v12 = v3 != 0LL;

  if (!v12)
  {
    id v7 = a1[4];
    id v8 = [v13 firstObject];
    objc_msgSend(v7, "setObject:forKey:");

    id v9 = v13;
    id v4 = (char *)[v13 count];
    id location[3] = &dword_0 + 1;
    id location[2] = v4 - 1;
    location[4] = &dword_0 + 1;
    location[5] = v4 - 1;
    id v5 = objc_msgSend(v9, "subarrayWithRange:", 1, v4 - 1);
    id v6 = v13;
    id v13 = v5;

    [a1[5] setObject:v13 forKey:location[0]];
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

int64_t sub_18860(id a1, TVNPRoute *a2, TVNPRoute *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v24 = 0LL;
  objc_storeStrong(&v24, a3);
  v23[1] = a1;
  v23[0] = 0LL;
  id v22 = 0LL;
  id v17 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRoute);
  if ((objc_opt_isKindOfClass(v17, v3) & 1) != 0)
  {
    objc_storeStrong(v23, location[0]);
  }

  else
  {
    id v4 = [location[0] leader];
    id v5 = v23[0];
    v23[0] = v4;
  }

  id v14 = v24;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRoute);
  if ((objc_opt_isKindOfClass(v14, v6) & 1) != 0)
  {
    objc_storeStrong(&v22, v24);
  }

  else
  {
    id v7 = [v24 leader];
    id v8 = v22;
    id v22 = v7;
  }

  id v12 = [v23[0] outputDeviceRoute];
  char v20 = 0;
  LOBYTE(v13) = 0;
  if ([v12 isHomePodRoute])
  {
    id v21 = [v22 outputDeviceRoute];
    char v20 = 1;
    unsigned int v13 = [v21 isHomePodRoute] ^ 1;
  }

  if ((v20 & 1) != 0) {

  }
  if ((v13 & 1) != 0)
  {
    int64_t v26 = -1LL;
  }

  else
  {
    id v10 = [v22 outputDeviceRoute];
    char v18 = 0;
    LOBYTE(v11) = 0;
    if ([v10 isHomePodRoute])
    {
      id v19 = [v23[0] outputDeviceRoute];
      char v18 = 1;
      unsigned int v11 = [v19 isHomePodRoute] ^ 1;
    }

    if ((v18 & 1) != 0) {

    }
    int64_t v26 = (v11 & 1) != 0;
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  return v26;
}

uint64_t sub_18B5C(uint64_t result, int a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 7;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 0;
  *(_BYTE *)(result + 15) = 4;
  *(_DWORD *)(result + 16) = a4;
  *(_BYTE *)(result + 20) = 0;
  *(_BYTE *)(result + 21) = 4;
  *(_DWORD *)(result + 22) = a5;
  *(_BYTE *)(result + 26) = 0;
  *(_BYTE *)(result + 27) = 4;
  *(_DWORD *)(result + 28) = a6;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a7;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(void *)(result + 44) = a8;
  return result;
}

uint64_t sub_18C18( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 8;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 48) = 0;
  *(_BYTE *)(result + 49) = 4;
  *(_DWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 54) = 0;
  *(_BYTE *)(result + 55) = 8;
  *(void *)(result + 56) = a8;
  *(_BYTE *)(result + 64) = 66;
  *(_BYTE *)(result + 65) = 8;
  *(void *)(result + 66) = a9;
  return result;
}

uint64_t sub_1A3E0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_1AC24(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] macAddress];
  unsigned __int8 v5 = [v4 isEqualToString:a1[4]];

  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

BOOL sub_1C354(id a1, UIPress *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = [location[0] type] == &dword_4;
  objc_storeStrong(location, 0LL);
  return v3;
}

void sub_1C7D4(id a1)
{
  os_log_t v1 = os_log_create( "com.apple.TVSystemMenu.AirPods-Module.TVSMAirPodsModuleHeadsetSettingsCollectionViewController",  "");
  id v2 = (void *)qword_5F8F8;
  qword_5F8F8 = (uint64_t)v1;
}

void sub_1C820(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v6 = (dispatch_once_t *)&unk_5F908;
  id v5 = 0LL;
  objc_storeStrong(&v5, &stru_50DC8);
  if (*v6 != -1) {
    dispatch_once(v6, v5);
  }
  objc_storeStrong(&v5, 0LL);
  if ([location[0] intersectsSet:qword_5F900])
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 4);
    [WeakRetained _updateAudioFormat];
  }

  objc_storeStrong(location, 0LL);
}

void sub_1C8F8(id a1)
{
  id v4 = a1;
  id v3 = a1;
  os_log_t v1 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"playbackState",  @"isVideo",  0LL);
  id v2 = (void *)qword_5F900;
  qword_5F900 = (uint64_t)v1;
}

void sub_1CE38( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, id *location)
{
  *(void *)(v13 - 48) = a1;
  *(_DWORD *)(v13 - 52) = a2;
  objc_destroyWeak((id *)(v13 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v13 - 48));
}

id sub_1CEBC(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v45 = 0LL;
  objc_storeStrong(&v45, a3);
  id v44 = 0LL;
  objc_storeStrong(&v44, a4);
  v43[1] = a1;
  v43[0] = objc_loadWeakRetained(a1 + 4);
  id v42 = [v44 integerValue];
  id v35 = [v43[0] settingsDataSource];
  id v41 = objc_msgSend(v35, "sectionIdentifierForIndex:", objc_msgSend(v45, "section"));

  if ([v41 isEqualToString:@"Spatial"])
  {
    id v24 = location[0];
    id v4 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleSegmentedControlCollectionViewCell);
    id v25 = NSStringFromClass(v4);
    id v40 = objc_msgSend(v24, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");

    id v26 = [v43[0] _stringForAirPodsSettingType:v42];
    objc_msgSend(v40, "setTitle:");

    id v29 = +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
    id v28 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL);
    id v27 = objc_msgSend(v29, "resolvedColorWithTraitCollection:");
    objc_msgSend(v40, "setOverrideTintColor:");

    id v30 = [v43[0] _packageNameForSetting:v42];
    objc_msgSend(v40, "setPackageName:");

    objc_msgSend( v40,  "setDisplayAsSelected:",  (unint64_t)objc_msgSend(v43[0], "_shouldShowSettingAsSelected:", v42) & 1);
    unsigned __int8 v31 = 1;
    [v40 setDisabled:v31 & 1];
    id v47 = v40;
    int v39 = 1;
    objc_storeStrong(&v40, 0LL);
  }

  else if ([v41 isEqualToString:@"SpatializeStereo"])
  {
    id v19 = location[0];
    id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleCollectionViewCell);
    char v20 = NSStringFromClass(v5);
    id v38 = objc_msgSend(v19, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");

    id v21 = objc_msgSend(v43[0], "_stringForAirPodsSettingType:", objc_msgSend(v44, "integerValue"));
    objc_msgSend(v38, "setTitle:");

    id v22 = [v43[0] _packageNameForSetting:v42];
    objc_msgSend(v38, "setPackageName:");

    objc_msgSend(v38, "setDisplayAsSelected:", (unint64_t)objc_msgSend(v43[0], "_spatializeStereoEnabled") & 1);
    unsigned __int8 v23 = 1;
    [v38 setDisabled:v23 & 1];
    id v47 = v38;
    int v39 = 1;
    objc_storeStrong(&v38, 0LL);
  }

  else if ([v41 isEqualToString:@"Noise Control"])
  {
    id v8 = location[0];
    uint64_t v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleSegmentedControlCollectionViewCell);
    id v9 = NSStringFromClass(v6);
    id v37 = objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");

    id v10 = v37;
    id v11 = [v43[0] _stringForAirPodsSettingType:v42];
    objc_msgSend(v10, "setTitle:");

    id v12 = v37;
    id v15 = +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
    id v14 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL);
    id v13 = objc_msgSend(v15, "resolvedColorWithTraitCollection:");
    objc_msgSend(v12, "setOverrideTintColor:");

    id v16 = v37;
    id v17 = [v43[0] _packageNameForSetting:v42];
    objc_msgSend(v16, "setPackageName:");

    id v18 = [v43[0] _listeningModeForSetting:v42];
    BOOL v36 = v18 == [v43[0] currentListeningMode];
    [v37 setDisplayAsSelected:v36];
    id v47 = v37;
    int v39 = 1;
    objc_storeStrong(&v37, 0LL);
  }

  else
  {
    id v47 = 0LL;
    int v39 = 1;
  }

  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(v43, 0LL);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(location, 0LL);
  return v47;
}

id sub_1D5A0(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v19 = 0LL;
  objc_storeStrong(&v19, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  v17[1] = a1;
  v17[0] = objc_loadWeakRetained(a1 + 4);
  id v16 =  [location[0] dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:v18];
  id v14 = [v17[0] settingsDataSource];
  id v15 = objc_msgSend(v14, "sectionIdentifierForIndex:", objc_msgSend(v18, "section"));

  if ([v15 isEqualToString:@"Noise Control"])
  {
    id v10 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
    id v9 =  -[NSBundle localizedStringForKey:value:table:]( v10,  "localizedStringForKey:value:table:",  @"NoiseControlHeaderTitle",  &stru_51218,  0LL);
    objc_msgSend(v16, "setTitle:");
  }

  else
  {
    id v7 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TVSMAirPodsModuleHeadsetSettingsCollectionViewController));
    uint64_t v6 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"SpatialAudioHeaderTitle",  &stru_51218,  0LL);
    objc_msgSend(v16, "setTitle:");

    id v8 = [v17[0] _resolvedDetailText];
    objc_msgSend(v16, "setDetailText:");

    objc_msgSend(v16, "setConfigureForAtmos:", (unint64_t)objc_msgSend(v17[0], "_dolbyAtmosActive") & 1);
  }

  id v5 = v16;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

uint64_t sub_1DAE0(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] macAddress];
  unsigned __int8 v5 = [v4 isEqualToString:a1[4]];

  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

uint64_t sub_1EB24(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

void sub_1F518( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

void sub_1F564(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  [v3[0] _updateCurrentListeningMode];
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1F7D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, _Unwind_Exception *exception_object, char a20, uint64_t a21, uint64_t a22, uint64_t a23, id a24)
{
}

void sub_1F820(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  [v3[0] _updateCurrentSpatialMode];
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_22894( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, int a12, _Unwind_Exception *exception_object)
{
}

void sub_228B8(void *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v5 = [location[0] bluetoothDevice];
  *(_BYTE *)(*(void *)(a1[4] + 8) + 24) = [v5 spatialAudioSupportedWhileSharing] & 1;

  *a4 = (*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) ^ 1) & 1;
  objc_storeStrong(location, 0LL);
}

id sub_22E44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_analyticsDictionaryWithMode:", *(void *)(a1 + 40), a1, a1);
}

NSDictionary *sub_22F4C(uint64_t a1)
{
  v9[0] = @"mode";
  id v4 = [*(id *)(a1 + 32) _descriptionForSpatialMode:*(void *)(a1 + 40)];
  v10[0] = v4;
  v9[1] = @"headtracking";
  id v5 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(_BYTE *)(a1 + 48) & 1);
  v10[1] = v5;
  v9[2] = @"headset";
  id v7 = [*(id *)(*(void *)(a1 + 32) + 136) headsetTypeDescription];
  id v10[2] = v7;
  v9[3] = @"app";
  id v8 = (__CFString *)[*(id *)(a1 + 32) _currentAppBundleID];
  if (v8) {
    id v3 = v8;
  }
  else {
    id v3 = @"unavailable";
  }
  v10[3] = v3;
  id v2 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL);

  return v2;
}

NSDictionary *sub_231B4(uint64_t a1)
{
  v8[0] = @"mode";
  id v4 = [*(id *)(a1 + 32) _descriptionForListeningMode:*(void *)(a1 + 40)];
  v9[0] = v4;
  v8[1] = @"headset";
  id v6 = [*(id *)(*(void *)(a1 + 32) + 136) headsetTypeDescription];
  v9[1] = v6;
  v8[2] = @"app";
  id v7 = (__CFString *)[*(id *)(a1 + 32) _currentAppBundleID];
  if (v7) {
    id v3 = v7;
  }
  else {
    id v3 = @"unavailable";
  }
  v9[2] = v3;
  id v2 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL);

  return v2;
}

void sub_23708( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  *(void *)(v11 - 40) = a1;
  *(_DWORD *)(v11 - 44) = a2;
  objc_destroyWeak((id *)(v11 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 40));
}

NSCollectionLayoutSection *sub_23748(id *a1, uint64_t a2, id obj)
{
  v53 = a1;
  uint64_t v52 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  v50[1] = a1;
  v50[0] = objc_loadWeakRetained(a1 + 4);
  id v36 = [v50[0] settingsDataSource];
  id v35 = [v36 snapshot];
  id v34 = [v35 sectionIdentifiers];
  id v49 = [v34 objectAtIndex:v52];

  if (([v49 isEqualToString:@"Spatial"] & 1) != 0
    || ([v49 isEqualToString:@"Noise Control"] & 1) != 0)
  {
    sub_23EC4();
    double v47 = v3;
    double v48 = v4;
    id v21 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v3);
    char v20 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v48);
    v46 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v21);

    id v45 =  +[NSCollectionLayoutItem itemWithLayoutSize:]( &OBJC_CLASS___NSCollectionLayoutItem,  "itemWithLayoutSize:",  v46);
    uint64_t v23 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v47);
    id v22 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v48);
    id v44 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v23);

    uint64_t v24 = v44;
    v56 = v45;
    id v25 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56);
    NSAttributedStringKey v43 =  +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:]( &OBJC_CLASS___NSCollectionLayoutGroup,  "horizontalGroupWithLayoutSize:subitems:",  v24);

    id v42 =  +[NSCollectionLayoutSection sectionWithGroup:]( &OBJC_CLASS___NSCollectionLayoutSection,  "sectionWithGroup:",  v43);
    -[NSCollectionLayoutSection setInterGroupSpacing:](v42, "setInterGroupSpacing:", 14.0);
    -[NSCollectionLayoutSection setOrthogonalScrollingBehavior:](v42, "setOrthogonalScrollingBehavior:", 1LL);
    id v26 = [location container];
    [v26 effectiveContentSize];
    v41[5] = v5;
    v41[6] = v6;
    double v27 = (*(double *)&v5 - 760.0) / 2.0;

    v41[7] = *(id *)&v27;
    id v28 = v42;
    sub_23EF0();
    v41[1] = v7;
    v41[2] = v8;
    v41[3] = v9;
    v41[4] = v10;
    -[NSCollectionLayoutSection setContentInsets:]( v28,  "setContentInsets:",  *(double *)&v7,  *(double *)&v8,  *(double *)&v9,  *(double *)&v10);
    id v30 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  760.0);
    id v29 =  +[NSCollectionLayoutDimension estimatedDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "estimatedDimension:",  88.0);
    v41[0] =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v30);

    id v40 =  +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:]( &OBJC_CLASS___NSCollectionLayoutBoundarySupplementaryItem,  "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:",  v41[0],  UICollectionElementKindSectionHeader,  1LL);
    -[NSCollectionLayoutBoundarySupplementaryItem setContentInsets:]( v40,  "setContentInsets:",  NSDirectionalEdgeInsetsZero.top,  NSDirectionalEdgeInsetsZero.leading,  NSDirectionalEdgeInsetsZero.bottom,  NSDirectionalEdgeInsetsZero.trailing);
    unsigned __int8 v31 = v42;
    v55 = v40;
    v32 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL);
    -[NSCollectionLayoutSection setBoundarySupplementaryItems:](v31, "setBoundarySupplementaryItems:");

    -[NSCollectionLayoutSection setSupplementaryContentInsetsReference:]( v42,  "setSupplementaryContentInsetsReference:",  1LL);
    v54 = v42;
    int v39 = 1;
    objc_storeStrong((id *)&v40, 0LL);
    objc_storeStrong(v41, 0LL);
    objc_storeStrong((id *)&v42, 0LL);
    objc_storeStrong((id *)&v43, 0LL);
    objc_storeStrong((id *)&v44, 0LL);
    objc_storeStrong((id *)&v45, 0LL);
    objc_storeStrong((id *)&v46, 0LL);
  }

  else if ([v49 isEqualToString:@"SpatializeStereo"])
  {
    id v11 = objc_alloc(&OBJC_CLASS____UICollectionViewListLayoutSectionConfiguration);
    id v38 = [v11 initWithAppearanceStyle:0 layoutEnvironment:location];
    [v38 setRowHeight:103.0];
    id v12 = objc_alloc(&OBJC_CLASS____UICollectionViewListLayoutSection);
    id v37 = [v12 initWithConfiguration:v38 layoutEnvironment:location];
    id v18 = [location container];
    [v18 effectiveContentSize];

    id v19 = v37;
    sub_23EF0();
    objc_msgSend(v19, "setContentInsets:", v13, v14, v15, v16);
    [v37 setInterGroupSpacing:14.0];
    v54 = (NSCollectionLayoutSection *)v37;
    int v39 = 1;
    objc_storeStrong(&v37, 0LL);
    objc_storeStrong(&v38, 0LL);
  }

  else
  {
    v54 = 0LL;
    int v39 = 1;
  }

  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(v50, 0LL);
  objc_storeStrong(&location, 0LL);
  return v54;
}

  ;
}

  ;
}

void sub_26284(id a1)
{
  id v10 = +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
  id v9 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL);
  id v1 = objc_msgSend(v10, "resolvedColorWithTraitCollection:");
  id v2 = (void *)qword_5F910;
  qword_5F910 = (uint64_t)v1;

  id v3 = [(id)qword_5F910 colorWithAlphaComponent:0.6];
  double v4 = (void *)qword_5F918;
  qword_5F918 = (uint64_t)v3;

  id v5 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
  id v6 = (void *)qword_5F920;
  qword_5F920 = (uint64_t)v5;

  id v7 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  id v8 = (void *)qword_5F928;
  qword_5F928 = (uint64_t)v7;
}

id sub_263BC(uint64_t a1)
{
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 9LL) & 1) != 0)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 48LL);
    if ((*(_BYTE *)(*(void *)(a1 + 32) + 8LL) & 1) != 0) {
      [v2 setBackgroundColor:qword_5F910];
    }
    else {
      [v2 setBackgroundColor:qword_5F918];
    }
  }

  else
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setBackgroundColor:qword_5F920];
  }

  [*(id *)(a1 + 32) _updatePackageViewVisibility];
  return [*(id *)(a1 + 32) _updatePackageRasterizationScale];
}

void sub_2B6FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVNowPlayingService.TVNPEndpointRouteConnection", "");
  id v2 = (void *)qword_5F940;
  qword_5F940 = (uint64_t)v1;
}

  ;
}

void sub_2C148(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1;
  uint64_t v11 = a2;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_5F940;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    os_log_type_t v5 = type;
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = MRMediaRemoteCopyCommandDescription(*(unsigned int *)(a1 + 48));
    id v6 = [*(id *)(a1 + 32) route];
    id v8 = v6;
    sub_2C2A8((uint64_t)v13, v2, v3, (uint64_t)v8, v11);
    _os_log_impl(&dword_0, log, v5, "(%{public}@) Send %{public}@ to route %@, status: %{public}@", v13, 0x2Au);

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong((id *)oslog, 0LL);
  if ((*(_BYTE *)(a1 + 52) & 1) == 0) {
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

uint64_t sub_2C2A8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

id sub_2C448(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMetadata];
}

void sub_2E528()
{
}

void sub_2E538(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  v14[1] = a1;
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_2E6A4;
  id v10 = &unk_510D8;
  objc_copyWeak(v14, a1 + 6);
  id v11 = a1[4];
  id v12 = location[0];
  id v13 = a1[5];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(v14);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_2E6A4(uint64_t a1)
{
  id v14[2] = (id)a1;
  v14[1] = (id)a1;
  v14[0] = objc_loadWeakRetained((id *)(a1 + 56));
  if (v14[0])
  {
    id location = (id)qword_5F940;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_138DC((uint64_t)v16, *(void *)(a1 + 32), *(void *)(a1 + 40));
      _os_log_debug_impl( &dword_0,  (os_log_t)location,  v12,  "METADATA: (%{public}@) apply update artwork with image: %{public}@",  v16,  0x16u);
    }

    objc_storeStrong(&location, 0LL);
    id v11 = *(id *)(a1 + 40);
    if (!v11)
    {
      id v11 = [v14[0] _preloadArtwork];
    }

    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:");
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:");
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48LL), v11);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), *(id *)(a1 + 48));
    [*(id *)(a1 + 32) didChangeValueForKey:@"artworkImage"];
    [*(id *)(a1 + 32) didChangeValueForKey:@"artworkCatalog"];
    id v10 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"artworkImage",  @"artworkCatalog",  0LL);
    memset(__b, 0, sizeof(__b));
    id obj = [*(id *)(*(void *)(a1 + 32) + 136) allValues];
    id v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
    if (v6)
    {
      uint64_t v2 = *(void *)__b[2];
      uint64_t v3 = 0LL;
      id v4 = v6;
      while (1)
      {
        uint64_t v1 = v3;
        if (*(void *)__b[2] != v2) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(__b[1] + 8 * v3);
        (*(void (**)(void))(v9 + 16))();
        ++v3;
        if (v1 + 1 >= (unint64_t)v4)
        {
          uint64_t v3 = 0LL;
          id v4 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
          if (!v4) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v14, 0LL);
}

id sub_2EB00(uint64_t *a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_5F940;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1225C((uint64_t)v4, a1[4]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Connection did invalidate: %{public}@", v4, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  return [(id)a1[4] _updateState];
}

void sub_2EF94()
{
}

uint64_t sub_2EFA4(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void sub_2F010(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_2F104;
  int v8 = &unk_50730;
  objc_copyWeak(v10, a1 + 4);
  id v9 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0LL);
  objc_destroyWeak(v10);
  objc_storeStrong(location, 0LL);
}

void sub_2F104(uint64_t a1)
{
  v8[2] = (id)a1;
  v8[1] = (id)a1;
  v8[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8[0])
  {
    id v7 = (id)qword_5F940;
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v7;
      os_log_type_t type = v6;
      id v3 = [v8[0] route];
      id v5 = v3;
      sub_138DC((uint64_t)v9, (uint64_t)v5, *(void *)(a1 + 32));
      _os_log_impl( &dword_0,  log,  type,  "connectWithOptions->MPAVRouteConnectionConnectOptionsNone (completion): %{public}@ error: %{public}@",  v9,  0x16u);

      objc_storeStrong(&v5, 0LL);
    }

    objc_storeStrong(&v7, 0LL);
    [v8[0] setAttemptingConnection:0];
    [v8[0] _updateState];
    [v8[0] _updateAutomaticResponseLoading];
  }

  objc_storeStrong(v8, 0LL);
}

LABEL_9:
  v15[0] = -[TVNPRoute destination](v18->_route, "destination");
  double v14 = [v15[0] isCurrentDestination] & 1;
  id v13 = -[TVNPRoute canBeGrouped](v18->_route, "canBeGrouped");
  int v8 = 0;
  if ((v14 & 1) == 0) {
    int v8 = v13;
  }
  os_log_type_t v12 = v8 & 1;
  if ((v8 & 1) != 0) {
    id v7 = v16;
  }
  else {
    id v7 = 0LL;
  }
  double v16 = v7;
  -[TVNPBaseRouteCollectionViewCell setMusicBarState:](v18, "setMusicBarState:", v7);
  id v11 = 0LL;
  if (v7 == 1 || v16 == 2)
  {
    os_log_type_t v6 = -[TVNPRoute destination](v18->_route, "destination");
    id v5 = -[TVNPRoutingDestination singleLineTitle](v6, "singleLineTitle");
    uint64_t v2 = -[NSString copy](v5, "copy");
    id v3 = v11;
    id v11 = v2;
  }

  -[TVNPRouteCollectionViewCell setNowPlayingInfoText:](v18, "setNowPlayingInfoText:", v11, &v11);
  -[TVNPRouteCollectionViewCell _resolveSubtitleText](v18, "_resolveSubtitleText");
  objc_storeStrong(location, 0LL);
  objc_storeStrong(v15, 0LL);
}

void sub_33364()
{
}

  ;
}

  ;
}

void sub_333EC(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v6 = 0LL;
  objc_storeStrong(&v6, a3);
  v5[1] = a1;
  v5[0] = objc_loadWeakRetained(a1 + 4);
  if (v5[0]) {
    objc_msgSend( v5[0],  "_configureAppearanceForControlState:withAnimationCoordinator:",  objc_msgSend(v5[0], "_controlStateForCell"),  0);
  }
  objc_storeStrong(v5, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_3394C(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_configureAppearanceForControlState:withAnimationCoordinator:",  objc_msgSend(*(id *)(a1 + 32), "_controlStateForCell"),  0);
}

void sub_35BF8(id a1)
{
  id v4[2] = a1;
  v4[1] = a1;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVNPBaseRouteCollectionViewCell);
  uint64_t v1 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL);
  v4[0] =  +[_UIFloatingContentView appearanceWhenContainedInInstancesOfClasses:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedInInstancesOfClasses:");

  id v2 = v4[0];
  id v3 =  +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  2LL);
  objc_msgSend(v2, "setFocusAnimationConfiguration:");

  [v4[0] setCornerRadius:12.0];
  [v4[0] setContinuousCornerEnabled:1];
  objc_storeStrong(v4, 0LL);
}

void sub_37104(id a1)
{
  uint64_t v1 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
  id v2 = (void *)qword_5F950;
  qword_5F950 = (uint64_t)v1;

  id v3 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  id v4 = (void *)qword_5F958;
  qword_5F958 = (uint64_t)v3;

  uint64_t v5 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
  id v6 = (void *)qword_5F960;
  qword_5F960 = (uint64_t)v5;

  id v7 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
  int v8 = (void *)qword_5F968;
  qword_5F968 = (uint64_t)v7;

  id v9 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
  id v10 = (void *)qword_5F970;
  qword_5F970 = (uint64_t)v9;

  id v11 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5);
  os_log_type_t v12 = (void *)qword_5F978;
  qword_5F978 = (uint64_t)v11;
}

id sub_37260(uint64_t a1)
{
  id v26 = *(void **)(*(void *)(a1 + 32) + 144LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v26 setTextColor:qword_5F950];
  }
  else {
    [v26 setTextColor:qword_5F958];
  }
  uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 152LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v24 setTextColor:qword_5F960];
  }
  else {
    [v24 setTextColor:qword_5F968];
  }
  uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 136LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v23 setTintColor:qword_5F960];
  }
  else {
    [v23 setTintColor:qword_5F968];
  }
  id v22 = *(void **)(*(void *)(a1 + 32) + 104LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v22 setTintColor:qword_5F950];
  }
  else {
    [v22 setTintColor:qword_5F958];
  }
  id v21 = *(void **)(*(void *)(a1 + 32) + 112LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v21 setTintColor:qword_5F950];
  }
  else {
    [v21 setTintColor:qword_5F958];
  }
  char v20 = *(void **)(*(void *)(a1 + 32) + 160LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v20 setTintColor:qword_5F970];
  }
  else {
    [v20 setTintColor:qword_5F978];
  }
  id v19 = *(void **)(*(void *)(a1 + 32) + 120LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v19 setTintColor:qword_5F950];
  }
  else {
    [v19 setTintColor:qword_5F958];
  }
  double v16 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v17 = [*(id *)(a1 + 32) _checkmarkImage:*(_BYTE *)(a1 + 41) & 1];
  objc_msgSend(v16, "setImage:");

  double v1 = 0.3;
  if ((*(_BYTE *)(a1 + 42) & 1) == 0) {
    double v1 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 144) setAlpha:v1];
  id v18 = *(void **)(*(void *)(a1 + 32) + 104LL);
  if ((*(_BYTE *)(a1 + 43) & 1) != 0 || (*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    [v18 setAlpha:0.0];
  }

  else
  {
    double v2 = 0.3;
    if ((*(_BYTE *)(a1 + 42) & 1) == 0) {
      double v2 = 1.0;
    }
    [v18 setAlpha:v2];
  }

  id v15 = *(void **)(*(void *)(a1 + 32) + 112LL);
  if ((*(_BYTE *)(a1 + 43) & 1) != 0 || (*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    [v15 setAlpha:0.0];
  }

  else
  {
    double v3 = 0.3;
    if ((*(_BYTE *)(a1 + 42) & 1) == 0) {
      double v3 = 1.0;
    }
    [v15 setAlpha:v3];
  }

  double v14 = *(void **)(*(void *)(a1 + 32) + 160LL);
  if ((*(_BYTE *)(a1 + 43) & 1) != 0)
  {
    [v14 setAlpha:0.0];
  }

  else
  {
    double v4 = 0.5;
    if ((*(_BYTE *)(a1 + 42) & 1) == 0) {
      double v4 = 1.0;
    }
    [v14 setAlpha:v4];
  }

  char v13 = 1;
  if ((*(_BYTE *)(a1 + 43) & 1) == 0) {
    char v13 = *(_BYTE *)(a1 + 45);
  }
  double v5 = 0.0;
  if ((v13 & 1) == 0) {
    double v5 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 120) setAlpha:v5];
  double v6 = 1.0;
  if ((*(_BYTE *)(a1 + 43) & 1) == 0) {
    double v6 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 168) setAlpha:v6];
  os_log_type_t v12 = *(void **)(*(void *)(a1 + 32) + 168LL);
  if ((*(_BYTE *)(a1 + 43) & 1) != 0)
  {
    [v12 setMaxBarWidth:1.79769313e308];
  }

  else
  {
    sub_333C0();
    [v12 setMaxBarWidth:v7];
  }

  id v11 = *(void **)(*(void *)(a1 + 32) + 152LL);
  if ((*(_BYTE *)(a1 + 43) & 1) != 0)
  {
    [v11 setAlpha:0.0];
  }

  else
  {
    double v8 = 0.3;
    if ((*(_BYTE *)(a1 + 42) & 1) == 0) {
      double v8 = 1.0;
    }
    [v11 setAlpha:v8];
  }

  id v10 = *(void **)(*(void *)(a1 + 32) + 80LL);
  if ((*(_BYTE *)(a1 + 46) & 1) != 0) {
    return [v10 setTintColor:qword_5F950];
  }
  else {
    return [v10 setTintColor:qword_5F958];
  }
}

id objc_msgSend_updateLocalAccessoryAudioDestination_forceUpdateWithUnavailableDestination_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateLocalAccessoryAudioDestination:forceUpdateWithUnavailableDestination:completionHandler:");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}