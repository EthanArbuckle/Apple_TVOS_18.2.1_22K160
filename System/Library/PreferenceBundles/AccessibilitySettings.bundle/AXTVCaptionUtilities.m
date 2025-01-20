@interface AXTVCaptionUtilities
+ (id)captionBackgroundOpacityFormatter;
+ (id)captionFontNameFormatter;
+ (id)captionTextEdgeFormatter;
+ (id)captionTextHighlightOpacityFormatter;
+ (id)captionTextOpacityFormatter;
+ (id)captionTextSizeFormatter;
+ (id)defaultValueFormatterWithFormatter:(id)a3 defaultValue:(id)a4;
@end

@implementation AXTVCaptionUtilities

+ (id)captionFontNameFormatter
{
  if (qword_80510 != -1) {
    dispatch_once(&qword_80510, &stru_65888);
  }
  return (id)qword_80508;
}

+ (id)captionTextEdgeFormatter
{
  if (qword_80520 != -1) {
    dispatch_once(&qword_80520, &stru_658A8);
  }
  return (id)qword_80518;
}

+ (id)captionTextSizeFormatter
{
  if (qword_80530 != -1) {
    dispatch_once(&qword_80530, &stru_658C8);
  }
  return (id)qword_80528;
}

+ (id)captionTextOpacityFormatter
{
  if (qword_80540 != -1) {
    dispatch_once(&qword_80540, &stru_658E8);
  }
  return (id)qword_80538;
}

+ (id)captionBackgroundOpacityFormatter
{
  if (qword_80550 != -1) {
    dispatch_once(&qword_80550, &stru_65908);
  }
  return (id)qword_80548;
}

+ (id)captionTextHighlightOpacityFormatter
{
  id v8 = AXTVLocString(@"AXCaptionTextHighlightOpacity0", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v49[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v17 = AXTVLocString(@"AXCaptionTextHighlightOpacity25", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v49[1] = (uint64_t)v18;
  id v26 = AXTVLocString(@"AXCaptionTextHighlightOpacity50", v19, v20, v21, v22, v23, v24, v25, v49[0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v49[2] = (uint64_t)v27;
  id v35 = AXTVLocString(@"AXCaptionTextHighlightOpacity75", v28, v29, v30, v31, v32, v33, v34, v49[0]);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v49[3] = (uint64_t)v36;
  id v44 = AXTVLocString(@"AXCaptionTextHighlightOpacity100", v37, v38, v39, v40, v41, v42, v43, v49[0]);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v49[4] = (uint64_t)v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 5LL));

  v47 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_6FF70,  v46);
  return v47;
}

+ (id)defaultValueFormatterWithFormatter:(id)a3 defaultValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___TVSBlockFormatter);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_FD5C;
  v12[3] = &unk_65930;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = [v7 initWithFormattingBlock:v12];

  return v10;
}

@end