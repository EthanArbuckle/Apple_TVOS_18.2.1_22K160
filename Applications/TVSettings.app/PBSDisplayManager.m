@interface PBSDisplayManager
+ (id)HDR10ChromaFormatter;
+ (id)SDRChromaFormatter;
+ (id)SDRColorMappingFormatter;
+ (id)_chromaFormatterForDynamicRange:(int64_t)a3;
+ (id)displayResolutionFormatter;
+ (id)dynamicRangeColorFormatter;
+ (id)localizedStringWithKey:(id)a3 refreshRate:(id)a4 frameRate:(id)a5 referenceRefreshRate:(id)a6;
+ (id)localizedStringWithUnits:(int64_t)a3 value:(id)a4;
+ (id)marketNameDisplayResolutionFormatterWithRefreshRate:(BOOL)a3;
+ (id)qmsExtraInfoFormatter;
+ (id)refreshRateFormatter;
@end

@implementation PBSDisplayManager

+ (id)SDRColorMappingFormatter
{
  uint64_t v2 = TSKLocString(@"AVSDRColorMappingYCbCr");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v16[0] = v3;
  uint64_t v4 = TSKLocString(@"AVSDRColorMappingRGBFull");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v16[1] = v5;
  uint64_t v6 = TSKLocString(@"AVSDRColorMappingRGBLimited");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v16[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v8,  &off_1001AEE18));
  id v10 = objc_alloc(&OBJC_CLASS___TVSBlockFormatter);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007F0B4;
  v14[3] = &unk_100191D38;
  id v15 = v9;
  id v11 = v9;
  id v12 = [v10 initWithFormattingBlock:v14];

  return v12;
}

+ (id)_chromaFormatterForDynamicRange:(int64_t)a3
{
  uint64_t v4 = TSKLocString(@"AVChromaSubsampling444");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v19[0] = v5;
  uint64_t v6 = TSKLocString(@"AVChromaSubsampling422");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v19[1] = v7;
  uint64_t v8 = TSKLocString(@"AVChromaSubsampling420");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v19[2] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 3LL));

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v10,  &off_1001AEE30));
  id v12 = objc_alloc(&OBJC_CLASS___TVSBlockFormatter);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007F26C;
  void v16[3] = &unk_100191D60;
  id v17 = v11;
  int64_t v18 = a3;
  id v13 = v11;
  id v14 = [v12 initWithFormattingBlock:v16];

  return v14;
}

+ (id)HDR10ChromaFormatter
{
  return _[a1 _chromaFormatterForDynamicRange:538423556];
}

+ (id)SDRChromaFormatter
{
  return _[a1 _chromaFormatterForDynamicRange:538423557];
}

+ (id)dynamicRangeColorFormatter
{
  uint64_t v2 = TSKLocString(@"AVDynamicRangeDolbyVision");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v18[0] = v3;
  uint64_t v4 = TSKLocString(@"AVDynamicRangeDolbyVision");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v18[1] = v5;
  uint64_t v6 = TSKLocString(@"AVDynamicRangeOtherHDR");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v18[2] = v7;
  uint64_t v8 = TSKLocString(@"AVDynamicRangeSDR");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v18[3] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 4LL));

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v10,  &off_1001AEE48));
  id v12 = objc_alloc(&OBJC_CLASS___TVSBlockFormatter);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007F46C;
  void v16[3] = &unk_100191D38;
  id v17 = v11;
  id v13 = v11;
  id v14 = [v12 initWithFormattingBlock:v16];

  return v14;
}

+ (id)displayResolutionFormatter
{
  return (id)objc_opt_new(&OBJC_CLASS___TVSettingsDisplayResolutionFormatter, a2);
}

+ (id)marketNameDisplayResolutionFormatterWithRefreshRate:(BOOL)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007F634;
  v4[3] = &unk_100191D80;
  v4[4] = a1;
  BOOL v5 = a3;
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:v4];
}

+ (id)refreshRateFormatter
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10007F894;
  v3[3] = &unk_100191DC0;
  v3[4] = a1;
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:v3];
}

+ (id)qmsExtraInfoFormatter
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10007FCA8;
  v3[3] = &unk_100191DC0;
  v3[4] = a1;
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:v3];
}

+ (id)localizedStringWithUnits:(int64_t)a3 value:(id)a4
{
  id v5 = a4;
  if (qword_1001E18E0 != -1) {
    dispatch_once(&qword_1001E18E0, &stru_100191DE0);
  }
  if (a3 == 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v8 = v7;
    v9 = @"AVDisplayModeFrameRateFormat";
LABEL_10:
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v9 value:&stru_100195DD8 table:0]);

    goto LABEL_11;
  }

  if (a3 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v8 = v7;
    v9 = @"AVDisplayModeRefreshRateFormat";
    goto LABEL_10;
  }

  if (a3) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = @"%@";
  }
LABEL_11:
  id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001E18D8 stringFromNumber:v5]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v10));

  return v11;
}

+ (id)localizedStringWithKey:(id)a3 refreshRate:(id)a4 frameRate:(id)a5 referenceRefreshRate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v10;
  id v14 = a4;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:v13 value:&stru_100195DD8 table:0]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedStringWithUnits:1 value:v14]);
  if (v11)
  {
    int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedStringWithUnits:2 value:v11]);
    if (v12)
    {
LABEL_3:
      v19 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedStringWithUnits:1 value:v12]);
      goto LABEL_6;
    }
  }

  else
  {
    int64_t v18 = 0LL;
    if (v12) {
      goto LABEL_3;
    }
  }

  v19 = 0LL;
LABEL_6:
  if (v17) {
    BOOL v20 = v18 == 0LL;
  }
  else {
    BOOL v20 = 0;
  }
  char v21 = !v20;
  if (v20 && !v19) {
    goto LABEL_32;
  }
  if (v17) {
    BOOL v22 = v18 == 0LL;
  }
  else {
    BOOL v22 = 1;
  }
  int v23 = !v22;
  if (!v22 && !v19)
  {
LABEL_31:
    v28 = v18;
LABEL_32:
    v24 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v16, v17, v28, v29);
    goto LABEL_33;
  }

  if ((v21 & 1) == 0 && v19)
  {
    v24 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v16, v17, v19, v29);
LABEL_33:
    v26 = (void *)objc_claimAutoreleasedReturnValue(v24);

    goto LABEL_34;
  }

  if (v19) {
    int v25 = v23;
  }
  else {
    int v25 = 0;
  }
  v26 = v13;
  if (v25 == 1)
  {
    v29 = v19;
    goto LABEL_31;
  }

@end