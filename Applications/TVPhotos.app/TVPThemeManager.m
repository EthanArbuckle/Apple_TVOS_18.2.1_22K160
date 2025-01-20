@interface TVPThemeManager
+ (id)_darkModeListItemSelectedOuterStrokeColor;
+ (id)_darkModeListItemSelectedOverlayFillColor;
+ (id)_darkModeListItemTextColor;
+ (id)_darkModeListSubheadTextColor;
+ (id)_darkModeListTitleTextColor;
+ (id)_darkModeMetadataLongDescriptionColor;
+ (id)_darkModeReviewNameTextColor;
+ (id)_darkModeReviewScoreTextColor;
+ (id)_darkModeReviewTextColor;
+ (id)_lightModeListItemSelectedOuterStrokeColor;
+ (id)_lightModeListItemSelectedOverlayFillColor;
+ (id)_lightModeListItemTextColor;
+ (id)_lightModeListSubheadTextColor;
+ (id)_lightModeListTitleTextColor;
+ (id)_lightModeMetadataLongDescriptionColor;
+ (id)_lightModeReviewNameTextColor;
+ (id)_lightModeReviewScoreTextColor;
+ (id)_lightModeReviewTextColor;
+ (id)bodyFont;
+ (id)bodyFontEmphasized;
+ (id)calloutFont;
+ (id)caption1Font;
+ (id)caption2Font;
+ (id)errorMessageSubtitleColor;
+ (id)errorMessageTitleColor;
+ (id)feedListItemFocusedColor;
+ (id)feedNavigationColor;
+ (id)feedPageIndicatorColor;
+ (id)feedPageIndicatorCurrentPageColor;
+ (id)feedRatingsStarColor;
+ (id)feedSubtitleColor;
+ (id)feedTitleColor;
+ (id)folderTitleTextColor;
+ (id)fontWithWeight:(id)a3 fromFont:(id)a4;
+ (id)footnoteFont;
+ (id)gridItemTextColor;
+ (id)headline2Font;
+ (id)headline3Font;
+ (id)headlineFont;
+ (id)imageHeaderSubtitleColor;
+ (id)listItemSelectedOuterStrokeColor;
+ (id)listItemSelectedOverlayFillColor;
+ (id)listItemSelectedTextColor;
+ (id)listItemTextColor;
+ (id)listSubheadTextColor;
+ (id)listTitleTextColor;
+ (id)menuBarButtonHighlightedTextColor;
+ (id)menuBarButtonTextColor;
+ (id)metadataLongDescriptionTextColor;
+ (id)productionTitlesTextColor;
+ (id)reviewNameTextColor;
+ (id)reviewRowTitleTextColor;
+ (id)reviewScoreTextColor;
+ (id)reviewTextColor;
+ (id)rowTitleSelectedTextColor;
+ (id)rowTitleTextColor;
+ (id)subheadFont;
+ (id)subtitle1Font;
+ (id)subtitle2Font;
+ (id)subtitle3Font;
+ (id)title1Font;
+ (id)title1FontEmphasized;
+ (id)title2Font;
+ (id)title3Font;
+ (id)title4Font;
+ (int64_t)_userInterfaceStyle;
@end

@implementation TVPThemeManager

+ (id)title1Font
{
  if (qword_100102F20 != -1) {
    dispatch_once(&qword_100102F20, &stru_1000CA970);
  }
  return (id)qword_100102F18;
}

+ (id)title1FontEmphasized
{
  if (qword_100102F30 != -1) {
    dispatch_once(&qword_100102F30, &stru_1000CA990);
  }
  return (id)qword_100102F28;
}

+ (id)title2Font
{
  if (qword_100102F40 != -1) {
    dispatch_once(&qword_100102F40, &stru_1000CA9B0);
  }
  return (id)qword_100102F38;
}

+ (id)title3Font
{
  if (qword_100102F50 != -1) {
    dispatch_once(&qword_100102F50, &stru_1000CA9D0);
  }
  return (id)qword_100102F48;
}

+ (id)title4Font
{
  if (qword_100102F60 != -1) {
    dispatch_once(&qword_100102F60, &stru_1000CA9F0);
  }
  return (id)qword_100102F58;
}

+ (id)headlineFont
{
  if (qword_100102F70 != -1) {
    dispatch_once(&qword_100102F70, &stru_1000CAA10);
  }
  return (id)qword_100102F68;
}

+ (id)headline2Font
{
  if (qword_100102F80 != -1) {
    dispatch_once(&qword_100102F80, &stru_1000CAA30);
  }
  return (id)qword_100102F78;
}

+ (id)headline3Font
{
  if (qword_100102F90 != -1) {
    dispatch_once(&qword_100102F90, &stru_1000CAA50);
  }
  return (id)qword_100102F88;
}

+ (id)subtitle1Font
{
  if (qword_100102FA0 != -1) {
    dispatch_once(&qword_100102FA0, &stru_1000CAA70);
  }
  return (id)qword_100102F98;
}

+ (id)subtitle2Font
{
  if (qword_100102FB0 != -1) {
    dispatch_once(&qword_100102FB0, &stru_1000CAA90);
  }
  return (id)qword_100102FA8;
}

+ (id)subtitle3Font
{
  if (qword_100102FC0 != -1) {
    dispatch_once(&qword_100102FC0, &stru_1000CAAB0);
  }
  return (id)qword_100102FB8;
}

+ (id)calloutFont
{
  if (qword_100102FD0 != -1) {
    dispatch_once(&qword_100102FD0, &stru_1000CAAD0);
  }
  return (id)qword_100102FC8;
}

+ (id)bodyFont
{
  if (qword_100102FE0 != -1) {
    dispatch_once(&qword_100102FE0, &stru_1000CAAF0);
  }
  return (id)qword_100102FD8;
}

+ (id)bodyFontEmphasized
{
  if (qword_100102FF0 != -1) {
    dispatch_once(&qword_100102FF0, &stru_1000CAB10);
  }
  return (id)qword_100102FE8;
}

+ (id)subheadFont
{
  if (qword_100103000 != -1) {
    dispatch_once(&qword_100103000, &stru_1000CAB30);
  }
  return (id)qword_100102FF8;
}

+ (id)footnoteFont
{
  if (qword_100103010 != -1) {
    dispatch_once(&qword_100103010, &stru_1000CAB50);
  }
  return (id)qword_100103008;
}

+ (id)caption1Font
{
  if (qword_100103020 != -1) {
    dispatch_once(&qword_100103020, &stru_1000CAB70);
  }
  return (id)qword_100103018;
}

+ (id)caption2Font
{
  if (qword_100103030 != -1) {
    dispatch_once(&qword_100103030, &stru_1000CAB90);
  }
  return (id)qword_100103028;
}

+ (id)fontWithWeight:(id)a3 fromFont:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100103040 != -1) {
    dispatch_once(&qword_100103040, &stru_1000CABB0);
  }
  id v7 = v6;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 fontDescriptor]);
  v9 = v7;
  if (v8)
  {
    v10 = (void *)v8;
    if ([v5 length]) {
      v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100103038 objectForKeyedSubscript:v5]);
    }
    else {
      v11 = 0LL;
    }
    if ([v11 length])
    {
      UIFontDescriptorAttributeName v15 = UIFontDescriptorTextStyleAttribute;
      v16 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 fontDescriptorByAddingAttributes:v12]);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v13, 0.0));
      v10 = (void *)v13;
    }

    else
    {
      v9 = v7;
    }
  }

  return v9;
}

+ (id)listTitleTextColor
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "_userInterfaceStyle");
  if (v3 == (id)2 || v3 == (id)1000)
  {
    id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_darkModeListTitleTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1, v4), "_lightModeListTitleTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

+ (id)_lightModeListTitleTextColor
{
  if (qword_100103050 != -1) {
    dispatch_once(&qword_100103050, &stru_1000CABD0);
  }
  return (id)qword_100103048;
}

+ (id)_darkModeListTitleTextColor
{
  if (qword_100103060 != -1) {
    dispatch_once(&qword_100103060, &stru_1000CABF0);
  }
  return (id)qword_100103058;
}

+ (id)listSubheadTextColor
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "_userInterfaceStyle");
  if (v3 == (id)2 || v3 == (id)1000)
  {
    id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_darkModeListSubheadTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1, v4), "_lightModeListSubheadTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

+ (id)imageHeaderSubtitleColor
{
  if (qword_100103070 != -1) {
    dispatch_once(&qword_100103070, &stru_1000CAC10);
  }
  return (id)qword_100103068;
}

+ (id)_lightModeListSubheadTextColor
{
  if (qword_100103080 != -1) {
    dispatch_once(&qword_100103080, &stru_1000CAC30);
  }
  return (id)qword_100103078;
}

+ (id)_darkModeListSubheadTextColor
{
  if (qword_100103090 != -1) {
    dispatch_once(&qword_100103090, &stru_1000CAC50);
  }
  return (id)qword_100103088;
}

+ (id)listItemTextColor
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "_userInterfaceStyle");
  if (v3 == (id)2 || v3 == (id)1000)
  {
    id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_darkModeListItemTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1, v4), "_lightModeListItemTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

+ (id)_lightModeListItemTextColor
{
  if (qword_1001030A0 != -1) {
    dispatch_once(&qword_1001030A0, &stru_1000CAC70);
  }
  return (id)qword_100103098;
}

+ (id)_darkModeListItemTextColor
{
  if (qword_1001030B0 != -1) {
    dispatch_once(&qword_1001030B0, &stru_1000CAC90);
  }
  return (id)qword_1001030A8;
}

+ (id)listItemSelectedTextColor
{
  if (qword_1001030C0 != -1) {
    dispatch_once(&qword_1001030C0, &stru_1000CACB0);
  }
  return (id)qword_1001030B8;
}

+ (id)folderTitleTextColor
{
  if (qword_1001030D0 != -1) {
    dispatch_once(&qword_1001030D0, &stru_1000CACD0);
  }
  return (id)qword_1001030C8;
}

+ (id)gridItemTextColor
{
  if (qword_1001030E0 != -1) {
    dispatch_once(&qword_1001030E0, &stru_1000CACF0);
  }
  return (id)qword_1001030D8;
}

+ (id)rowTitleTextColor
{
  if (qword_1001030F0 != -1) {
    dispatch_once(&qword_1001030F0, &stru_1000CAD10);
  }
  return (id)qword_1001030E8;
}

+ (id)rowTitleSelectedTextColor
{
  if (qword_100103100 != -1) {
    dispatch_once(&qword_100103100, &stru_1000CAD30);
  }
  return (id)qword_1001030F8;
}

+ (id)productionTitlesTextColor
{
  if (qword_100103110 != -1) {
    dispatch_once(&qword_100103110, &stru_1000CAD50);
  }
  return (id)qword_100103108;
}

+ (id)reviewScoreTextColor
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "_userInterfaceStyle");
  if (v3 == (id)2 || v3 == (id)1000)
  {
    id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_darkModeReviewScoreTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1, v4), "_lightModeReviewScoreTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

+ (id)_lightModeReviewScoreTextColor
{
  if (qword_100103120 != -1) {
    dispatch_once(&qword_100103120, &stru_1000CAD70);
  }
  return (id)qword_100103118;
}

+ (id)_darkModeReviewScoreTextColor
{
  if (qword_100103130 != -1) {
    dispatch_once(&qword_100103130, &stru_1000CAD90);
  }
  return (id)qword_100103128;
}

+ (id)reviewTextColor
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "_userInterfaceStyle");
  if (v3 == (id)2 || v3 == (id)1000)
  {
    id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_darkModeReviewTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1, v4), "_lightModeReviewTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

+ (id)_lightModeReviewTextColor
{
  if (qword_100103140 != -1) {
    dispatch_once(&qword_100103140, &stru_1000CADB0);
  }
  return (id)qword_100103138;
}

+ (id)_darkModeReviewTextColor
{
  if (qword_100103150 != -1) {
    dispatch_once(&qword_100103150, &stru_1000CADD0);
  }
  return (id)qword_100103148;
}

+ (id)reviewNameTextColor
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "_userInterfaceStyle");
  if (v3 == (id)2 || v3 == (id)1000)
  {
    id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_darkModeReviewNameTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1, v4), "_lightModeReviewNameTextColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

+ (id)_lightModeReviewNameTextColor
{
  if (qword_100103160 != -1) {
    dispatch_once(&qword_100103160, &stru_1000CADF0);
  }
  return (id)qword_100103158;
}

+ (id)_darkModeReviewNameTextColor
{
  if (qword_100103170 != -1) {
    dispatch_once(&qword_100103170, &stru_1000CAE10);
  }
  return (id)qword_100103168;
}

+ (id)reviewRowTitleTextColor
{
  if (qword_100103180 != -1) {
    dispatch_once(&qword_100103180, &stru_1000CAE30);
  }
  return (id)qword_100103178;
}

+ (id)listItemSelectedOverlayFillColor
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "_userInterfaceStyle");
  if (v3 == (id)2 || v3 == (id)1000)
  {
    id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_darkModeListItemSelectedOverlayFillColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1, v4), "_lightModeListItemSelectedOverlayFillColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

+ (id)_lightModeListItemSelectedOverlayFillColor
{
  if (qword_100103190 != -1) {
    dispatch_once(&qword_100103190, &stru_1000CAE50);
  }
  return (id)qword_100103188;
}

+ (id)_darkModeListItemSelectedOverlayFillColor
{
  if (qword_1001031A0 != -1) {
    dispatch_once(&qword_1001031A0, &stru_1000CAE70);
  }
  return (id)qword_100103198;
}

+ (id)listItemSelectedOuterStrokeColor
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "_userInterfaceStyle");
  if (v3 == (id)2 || v3 == (id)1000)
  {
    id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_darkModeListItemSelectedOuterStrokeColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1, v4), "_lightModeListItemSelectedOuterStrokeColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

+ (id)_lightModeListItemSelectedOuterStrokeColor
{
  if (qword_1001031B0 != -1) {
    dispatch_once(&qword_1001031B0, &stru_1000CAE90);
  }
  return (id)qword_1001031A8;
}

+ (id)_darkModeListItemSelectedOuterStrokeColor
{
  if (qword_1001031C0 != -1) {
    dispatch_once(&qword_1001031C0, &stru_1000CAEB0);
  }
  return (id)qword_1001031B8;
}

+ (id)metadataLongDescriptionTextColor
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "_userInterfaceStyle");
  if (v3 == (id)2 || v3 == (id)1000)
  {
    id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_darkModeMetadataLongDescriptionColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1, v4), "_lightModeMetadataLongDescriptionColor");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

+ (id)_lightModeMetadataLongDescriptionColor
{
  if (qword_1001031D0 != -1) {
    dispatch_once(&qword_1001031D0, &stru_1000CAED0);
  }
  return (id)qword_1001031C8;
}

+ (id)_darkModeMetadataLongDescriptionColor
{
  if (qword_1001031E0 != -1) {
    dispatch_once(&qword_1001031E0, &stru_1000CAEF0);
  }
  return (id)qword_1001031D8;
}

+ (id)menuBarButtonTextColor
{
  if (qword_1001031F0 != -1) {
    dispatch_once(&qword_1001031F0, &stru_1000CAF10);
  }
  return (id)qword_1001031E8;
}

+ (id)menuBarButtonHighlightedTextColor
{
  if (qword_100103200 != -1) {
    dispatch_once(&qword_100103200, &stru_1000CAF30);
  }
  return (id)qword_1001031F8;
}

+ (id)feedTitleColor
{
  if (qword_100103210 != -1) {
    dispatch_once(&qword_100103210, &stru_1000CAF50);
  }
  return (id)qword_100103208;
}

+ (id)feedSubtitleColor
{
  if (qword_100103220 != -1) {
    dispatch_once(&qword_100103220, &stru_1000CAF70);
  }
  return (id)qword_100103218;
}

+ (id)feedPageIndicatorColor
{
  if (qword_100103230 != -1) {
    dispatch_once(&qword_100103230, &stru_1000CAF90);
  }
  return (id)qword_100103228;
}

+ (id)feedPageIndicatorCurrentPageColor
{
  if (qword_100103240 != -1) {
    dispatch_once(&qword_100103240, &stru_1000CAFB0);
  }
  return (id)qword_100103238;
}

+ (id)feedRatingsStarColor
{
  if (qword_100103250 != -1) {
    dispatch_once(&qword_100103250, &stru_1000CAFD0);
  }
  return (id)qword_100103248;
}

+ (id)feedListItemFocusedColor
{
  if (qword_100103260 != -1) {
    dispatch_once(&qword_100103260, &stru_1000CAFF0);
  }
  return (id)qword_100103258;
}

+ (id)feedNavigationColor
{
  if (qword_100103270 != -1) {
    dispatch_once(&qword_100103270, &stru_1000CB010);
  }
  return (id)qword_100103268;
}

+ (int64_t)_userInterfaceStyle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 traitCollection]);
  id v4 = [v3 userInterfaceStyle];

  return (int64_t)v4;
}

+ (id)errorMessageTitleColor
{
  return +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
}

+ (id)errorMessageSubtitleColor
{
  return +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
}

@end