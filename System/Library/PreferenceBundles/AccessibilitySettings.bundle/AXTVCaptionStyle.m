@interface AXTVCaptionStyle
+ (double)defaultBackgroundOpacity;
+ (double)defaultHighlightOpacity;
+ (double)defaultTextOpacity;
+ (id)createDefaultCaptionStyle;
+ (id)defaultBackgroundColor;
+ (id)defaultFontName;
+ (id)defaultHighlightColor;
+ (id)defaultTextColor;
+ (int64_t)defaultTextEdgeStyle;
+ (int64_t)defaultTextSize;
- (AXTVCaptionStyle)initWithStyleID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)videoOverridesBackgroundColor;
- (BOOL)videoOverridesBackgroundOpacity;
- (BOOL)videoOverridesTextCasualFontName;
- (BOOL)videoOverridesTextColor;
- (BOOL)videoOverridesTextCursiveFontName;
- (BOOL)videoOverridesTextEdgeStyle;
- (BOOL)videoOverridesTextFontName;
- (BOOL)videoOverridesTextFontWithStyle:(int64_t)a3;
- (BOOL)videoOverridesTextHighlight;
- (BOOL)videoOverridesTextMonospaceSansSerifFontName;
- (BOOL)videoOverridesTextMonospaceSerifFontName;
- (BOOL)videoOverridesTextOpacity;
- (BOOL)videoOverridesTextProportionalSansSerifFontName;
- (BOOL)videoOverridesTextProportionalSerifFontName;
- (BOOL)videoOverridesTextSize;
- (BOOL)videoOverridesTextSmallCapitalFontName;
- (NSString)name;
- (NSString)styleID;
- (NSString)textCasualFontName;
- (NSString)textCursiveFontName;
- (NSString)textFontName;
- (NSString)textMonospaceSansSerifFontName;
- (NSString)textMonospaceSerifFontName;
- (NSString)textProportionalSansSerifFontName;
- (NSString)textProportionalSerifFontName;
- (NSString)textSmallCapitalFontName;
- (UIColor)backgroundColor;
- (UIColor)textColor;
- (UIColor)textHighlightColor;
- (double)backgroundOpacity;
- (double)textHighlightOpacity;
- (double)textOpacity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)textFontNameForStyle:(int64_t)a3;
- (int64_t)relativeTextSize;
- (int64_t)textEdgeStyle;
- (unint64_t)hash;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundOpacity:(double)a3;
- (void)setName:(id)a3;
- (void)setRelativeTextSize:(int64_t)a3;
- (void)setTextCasualFontName:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextCursiveFontName:(id)a3;
- (void)setTextEdgeStyle:(int64_t)a3;
- (void)setTextFontName:(id)a3;
- (void)setTextFontName:(id)a3 fontStyle:(int64_t)a4;
- (void)setTextHighlightColor:(id)a3;
- (void)setTextHighlightOpacity:(double)a3;
- (void)setTextMonospaceSansSerifFontName:(id)a3;
- (void)setTextMonospaceSerifFontName:(id)a3;
- (void)setTextOpacity:(double)a3;
- (void)setTextProportionalSansSerifFontName:(id)a3;
- (void)setTextProportionalSerifFontName:(id)a3;
- (void)setTextSmallCapitalFontName:(id)a3;
- (void)setVideoOverridesBackgroundColor:(BOOL)a3;
- (void)setVideoOverridesBackgroundOpacity:(BOOL)a3;
- (void)setVideoOverridesTextCasualFontName:(BOOL)a3;
- (void)setVideoOverridesTextColor:(BOOL)a3;
- (void)setVideoOverridesTextCursiveFontName:(BOOL)a3;
- (void)setVideoOverridesTextEdgeStyle:(BOOL)a3;
- (void)setVideoOverridesTextFont:(BOOL)a3 fontStyle:(int64_t)a4;
- (void)setVideoOverridesTextFontName:(BOOL)a3;
- (void)setVideoOverridesTextHighlight:(BOOL)a3;
- (void)setVideoOverridesTextMonospaceSansSerifFontName:(BOOL)a3;
- (void)setVideoOverridesTextMonospaceSerifFontName:(BOOL)a3;
- (void)setVideoOverridesTextOpacity:(BOOL)a3;
- (void)setVideoOverridesTextProportionalSansSerifFontName:(BOOL)a3;
- (void)setVideoOverridesTextProportionalSerifFontName:(BOOL)a3;
- (void)setVideoOverridesTextSize:(BOOL)a3;
- (void)setVideoOverridesTextSmallCapitalFontName:(BOOL)a3;
@end

@implementation AXTVCaptionStyle

+ (double)defaultTextOpacity
{
  return 1.0;
}

+ (int64_t)defaultTextSize
{
  return 40LL;
}

+ (double)defaultBackgroundOpacity
{
  return 0.5;
}

+ (double)defaultHighlightOpacity
{
  return 0.0;
}

+ (id)defaultTextColor
{
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  1.0,  1.0,  1.0);
}

+ (id)defaultBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0);
}

+ (id)defaultHighlightColor
{
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0);
}

+ (id)defaultFontName
{
  return MACaptionAppearanceMediumSystemFontIdentifier;
}

+ (int64_t)defaultTextEdgeStyle
{
  return 1LL;
}

+ (id)createDefaultCaptionStyle
{
  active = (void *)MACaptionAppearancePrefCopyActiveProfileID(a1, a2);
  NewProfileFromProfile = (void *)MACaptionAppearancePrefCreateNewProfileFromProfile();
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  int v48 = 1;
  id v11 = AXTVLocString(@"AXCaptionStyleDefaultCustomNamePrefix", v4, v5, v6, v7, v8, v9, v10, v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 availableCustomCaptionStyles]);

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_2C678;
  v42[3] = &unk_66720;
  id v15 = v12;
  id v43 = v15;
  v44 = &v45;
  [v14 enumerateObjectsUsingBlock:v42];
  id v23 = AXTVLocString(@"AXCaptionStyleDefaultCustomNamePrefix", v16, v17, v18, v19, v20, v21, v22, v39);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *((unsigned int *)v46 + 6)));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v25 descriptionWithLocale:v26]);
  id v34 = AXTVLocString(@"AXCaptionStyleDefaultProfileName", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v24);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

  MACaptionAppearancePrefSetProfileName(NewProfileFromProfile, v35);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  MACaptionAppearancePrefSetProfileOrder( NewProfileFromProfile,  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v36 = [objc_alloc((Class)a1) initWithStyleID:NewProfileFromProfile];

  _Block_object_dispose(&v45, 8);
  return v36;
}

- (AXTVCaptionStyle)initWithStyleID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AXTVCaptionStyle;
  uint64_t v5 = -[AXTVCaptionStyle init](&v9, "init");
  if (v5)
  {
    uint64_t v6 = (NSString *)[v4 copy];
    styleID = v5->_styleID;
    v5->_styleID = v6;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___AXTVCaptionStyle);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    styleID = self->_styleID;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 styleID]);
    unsigned __int8 v8 = -[NSString isEqualToString:](styleID, "isEqualToString:", v7);
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionStyle styleID](self, "styleID"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [objc_alloc((Class)objc_opt_class(self)) initWithStyleID:self->_styleID];
}

- (id)description
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___AXTVCaptionStyle;
  id v3 = -[AXTVCaptionStyle description](&v31, "description");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionStyle styleID](self, "styleID"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionStyle name](self, "name"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionStyle textColor](self, "textColor"));
  if (-[AXTVCaptionStyle videoOverridesTextColor](self, "videoOverridesTextColor")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v26 = v4;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  -[AXTVCaptionStyle relativeTextSize](self, "relativeTextSize")));
  if (-[AXTVCaptionStyle videoOverridesTextSize](self, "videoOverridesTextSize")) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  v24 = v5;
  -[AXTVCaptionStyle textOpacity](self, "textOpacity");
  uint64_t v7 = v6;
  if (-[AXTVCaptionStyle videoOverridesTextOpacity](self, "videoOverridesTextOpacity")) {
    unsigned __int8 v8 = @"YES";
  }
  else {
    unsigned __int8 v8 = @"NO";
  }
  id v23 = v8;
  int64_t v9 = -[AXTVCaptionStyle textEdgeStyle](self, "textEdgeStyle");
  if (-[AXTVCaptionStyle videoOverridesTextEdgeStyle](self, "videoOverridesTextEdgeStyle")) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionStyle textHighlightColor](self, "textHighlightColor"));
  -[AXTVCaptionStyle textHighlightOpacity](self, "textHighlightOpacity");
  uint64_t v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionStyle backgroundColor](self, "backgroundColor"));
  if (-[AXTVCaptionStyle videoOverridesBackgroundColor](self, "videoOverridesBackgroundColor")) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  -[AXTVCaptionStyle backgroundOpacity](self, "backgroundOpacity");
  uint64_t v17 = v16;
  if (-[AXTVCaptionStyle videoOverridesBackgroundOpacity](self, "videoOverridesBackgroundOpacity")) {
    uint64_t v18 = @"YES";
  }
  else {
    uint64_t v18 = @"NO";
  }
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionStyle textFontName](self, "textFontName"));
  if (-[AXTVCaptionStyle videoOverridesTextFontName](self, "videoOverridesTextFontName")) {
    uint64_t v20 = @"YES";
  }
  else {
    uint64_t v20 = @"NO";
  }
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ StyleID %@ \nName %@ \n[Text Color %@ Override %@] \n[Relative Text Size %@ Override %@] \n[Text Opacity %f Override %@] \n[TextEdge Style %lu Override %@] \n[Text Highlight Color %@] \n[Text Highlight Opacity %f] \n[Background Color %@ Override %@] \n[Background Opacity %f Override %@] \n[Font Name %@ Override %@]",  v30,  v29,  v28,  v27,  v26,  v25,  v24,  v7,  v23,  v9,  v10,  v11,  v13,  v14,  v15,  v17,  v18,  v19,  v20));

  return v21;
}

- (NSString)name
{
  return (NSString *)(id)MACaptionAppearancePrefCopyProfileName(self->_styleID, a2);
}

- (void)setName:(id)a3
{
}

- (NSString)textFontName
{
  return (NSString *)-[AXTVCaptionStyle textFontNameForStyle:](self, "textFontNameForStyle:", 0LL);
}

- (void)setTextFontName:(id)a3
{
}

- (void)setVideoOverridesTextFontName:(BOOL)a3
{
}

- (BOOL)videoOverridesTextFontName
{
  return -[AXTVCaptionStyle videoOverridesTextFontWithStyle:](self, "videoOverridesTextFontWithStyle:", 0LL);
}

- (NSString)textMonospaceSerifFontName
{
  return (NSString *)-[AXTVCaptionStyle textFontNameForStyle:](self, "textFontNameForStyle:", 1LL);
}

- (void)setTextMonospaceSerifFontName:(id)a3
{
}

- (void)setVideoOverridesTextMonospaceSerifFontName:(BOOL)a3
{
}

- (BOOL)videoOverridesTextMonospaceSerifFontName
{
  return -[AXTVCaptionStyle videoOverridesTextFontWithStyle:](self, "videoOverridesTextFontWithStyle:", 1LL);
}

- (NSString)textMonospaceSansSerifFontName
{
  return (NSString *)-[AXTVCaptionStyle textFontNameForStyle:](self, "textFontNameForStyle:", 3LL);
}

- (void)setTextMonospaceSansSerifFontName:(id)a3
{
}

- (void)setVideoOverridesTextMonospaceSansSerifFontName:(BOOL)a3
{
}

- (BOOL)videoOverridesTextMonospaceSansSerifFontName
{
  return -[AXTVCaptionStyle videoOverridesTextFontWithStyle:](self, "videoOverridesTextFontWithStyle:", 3LL);
}

- (NSString)textProportionalSerifFontName
{
  return (NSString *)-[AXTVCaptionStyle textFontNameForStyle:](self, "textFontNameForStyle:", 2LL);
}

- (void)setTextProportionalSerifFontName:(id)a3
{
}

- (void)setVideoOverridesTextProportionalSerifFontName:(BOOL)a3
{
}

- (BOOL)videoOverridesTextProportionalSerifFontName
{
  return -[AXTVCaptionStyle videoOverridesTextFontWithStyle:](self, "videoOverridesTextFontWithStyle:", 2LL);
}

- (NSString)textProportionalSansSerifFontName
{
  return (NSString *)-[AXTVCaptionStyle textFontNameForStyle:](self, "textFontNameForStyle:", 4LL);
}

- (void)setTextProportionalSansSerifFontName:(id)a3
{
}

- (void)setVideoOverridesTextProportionalSansSerifFontName:(BOOL)a3
{
}

- (BOOL)videoOverridesTextProportionalSansSerifFontName
{
  return -[AXTVCaptionStyle videoOverridesTextFontWithStyle:](self, "videoOverridesTextFontWithStyle:", 4LL);
}

- (NSString)textCasualFontName
{
  return (NSString *)-[AXTVCaptionStyle textFontNameForStyle:](self, "textFontNameForStyle:", 5LL);
}

- (void)setTextCasualFontName:(id)a3
{
}

- (void)setVideoOverridesTextCasualFontName:(BOOL)a3
{
}

- (BOOL)videoOverridesTextCasualFontName
{
  return -[AXTVCaptionStyle videoOverridesTextFontWithStyle:](self, "videoOverridesTextFontWithStyle:", 5LL);
}

- (NSString)textCursiveFontName
{
  return (NSString *)-[AXTVCaptionStyle textFontNameForStyle:](self, "textFontNameForStyle:", 6LL);
}

- (void)setTextCursiveFontName:(id)a3
{
}

- (void)setVideoOverridesTextCursiveFontName:(BOOL)a3
{
}

- (BOOL)videoOverridesTextCursiveFontName
{
  return -[AXTVCaptionStyle videoOverridesTextFontWithStyle:](self, "videoOverridesTextFontWithStyle:", 6LL);
}

- (NSString)textSmallCapitalFontName
{
  return (NSString *)-[AXTVCaptionStyle textFontNameForStyle:](self, "textFontNameForStyle:", 7LL);
}

- (void)setTextSmallCapitalFontName:(id)a3
{
}

- (void)setVideoOverridesTextSmallCapitalFontName:(BOOL)a3
{
}

- (BOOL)videoOverridesTextSmallCapitalFontName
{
  return -[AXTVCaptionStyle videoOverridesTextFontWithStyle:](self, "videoOverridesTextFontWithStyle:", 7LL);
}

- (id)textFontNameForStyle:(int64_t)a3
{
  uint64_t v12 = -1LL;
  if (MACaptionAppearancePrefIsSystemFont(self->_styleID, a3, &v12))
  {
    switch(v12)
    {
      case 2LL:
        uint64_t v5 = (id *)&MACaptionAppearanceMonoSystemFontIdentifier;
        return *v5;
      case 1LL:
        uint64_t v5 = (id *)&MACaptionAppearanceMediumSystemFontIdentifier;
        return *v5;
      case 0LL:
        uint64_t v5 = (id *)&MACaptionAppearanceSystemFontIdentifier;
        return *v5;
    }

    return &stru_69430;
  }

  else
  {
    uint64_t v6 = (CGFont *)MACaptionAppearancePrefCopyFontForStyle(self->_styleID, a3);
    uint64_t v7 = v6;
    if (v6)
    {
      CFStringRef v8 = CGFontCopyPostScriptName(v6);
    }

    else
    {
      id v10 = [(id)objc_opt_class(self) defaultFontName];
      CFStringRef v8 = (CFStringRef)objc_claimAutoreleasedReturnValue(v10);
    }

    id v11 = (__CFString *)v8;
    CGFontRelease(v7);
    return v11;
  }

- (void)setTextFontName:(id)a3 fontStyle:(int64_t)a4
{
  name = (__CFString *)a3;
  if (-[__CFString isEqual:](name, "isEqual:", MACaptionAppearanceSystemFontIdentifier))
  {
    styleID = self->_styleID;
    int64_t v7 = a4;
    uint64_t v8 = 0LL;
  }

  else if (-[__CFString isEqual:](name, "isEqual:", MACaptionAppearanceMonoSystemFontIdentifier))
  {
    styleID = self->_styleID;
    int64_t v7 = a4;
    uint64_t v8 = 2LL;
  }

  else
  {
    if (!-[__CFString isEqual:](name, "isEqual:", MACaptionAppearanceMediumSystemFontIdentifier))
    {
      int64_t v9 = CGFontCreateWithFontName(name);
      MACaptionAppearancePrefSetFontForStyle(self->_styleID, v9, a4);
      CGFontRelease(v9);
      goto LABEL_8;
    }

    styleID = self->_styleID;
    int64_t v7 = a4;
    uint64_t v8 = 1LL;
  }

  MACaptionAppearancePrefSetIsSystemFont(styleID, 1LL, v7, v8);
LABEL_8:
}

- (BOOL)videoOverridesTextFontWithStyle:(int64_t)a3
{
  id v3 = (void *)MACaptionAppearancePrefCopyVideoOverrideFontForStyle(self->_styleID, a3);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setVideoOverridesTextFont:(BOOL)a3 fontStyle:(int64_t)a4
{
}

- (UIColor)textColor
{
  id v3 = (CGColor *)MACaptionAppearancePrefCopyForegroundColor(self->_styleID, a2);
  if (v3)
  {
    unsigned __int8 v4 = -[UIColor initWithCGColor:](objc_alloc(&OBJC_CLASS___UIColor), "initWithCGColor:", v3);
  }

  else
  {
    id v5 = [(id)objc_opt_class(self) defaultTextColor];
    unsigned __int8 v4 = (UIColor *)objc_claimAutoreleasedReturnValue(v5);
  }

  uint64_t v6 = v4;
  CGColorRelease(v3);
  return v6;
}

- (void)setTextColor:(id)a3
{
}

- (BOOL)videoOverridesTextColor
{
  v2 = (void *)MACaptionAppearancePrefCopyVideoOverrideForegroundColor(self->_styleID, a2);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setVideoOverridesTextColor:(BOOL)a3
{
}

- (int64_t)relativeTextSize
{
  return MACaptionAppearancePrefGetRelativeCharSize(self->_styleID, a2);
}

- (void)setRelativeTextSize:(int64_t)a3
{
}

- (BOOL)videoOverridesTextSize
{
  v2 = (void *)MACaptionAppearancePrefCopyVideoOverrideRelativeCharSize(self->_styleID, a2);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setVideoOverridesTextSize:(BOOL)a3
{
}

- (double)textOpacity
{
  unsigned __int8 v3 = (void *)MACaptionAppearancePrefCopyForegroundOpacity(self->_styleID, a2);
  unsigned __int8 v4 = v3;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    [(id)objc_opt_class(self) defaultTextOpacity];
  }
  double v6 = v5;

  return v6;
}

- (void)setTextOpacity:(double)a3
{
}

- (BOOL)videoOverridesTextOpacity
{
  v2 = (void *)MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity(self->_styleID, a2);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setVideoOverridesTextOpacity:(BOOL)a3
{
}

- (int64_t)textEdgeStyle
{
  id v3 = [(id)objc_opt_class(self) defaultTextEdgeStyle];
  unsigned __int8 v4 = (void *)MACaptionAppearancePrefCopyTextEdgeStyle(self->_styleID);
  double v5 = v4;
  if (v4)
  {
    double v6 = (char *)[v4 integerValue];
    else {
      id v3 = v6;
    }
  }

  return (int64_t)v3;
}

- (void)setTextEdgeStyle:(int64_t)a3
{
}

- (BOOL)videoOverridesTextEdgeStyle
{
  v2 = (void *)MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle(self->_styleID, a2);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setVideoOverridesTextEdgeStyle:(BOOL)a3
{
}

- (UIColor)textHighlightColor
{
  unsigned __int8 v3 = (CGColor *)MACaptionAppearancePrefCopyBackgroundColor(self->_styleID, a2);
  if (v3)
  {
    unsigned __int8 v4 = -[UIColor initWithCGColor:](objc_alloc(&OBJC_CLASS___UIColor), "initWithCGColor:", v3);
  }

  else
  {
    id v5 = [(id)objc_opt_class(self) defaultHighlightColor];
    unsigned __int8 v4 = (UIColor *)objc_claimAutoreleasedReturnValue(v5);
  }

  double v6 = v4;
  CGColorRelease(v3);
  return v6;
}

- (void)setTextHighlightColor:(id)a3
{
}

- (double)textHighlightOpacity
{
  unsigned __int8 v3 = (void *)MACaptionAppearancePrefCopyBackgroundOpacity(self->_styleID, a2);
  unsigned __int8 v4 = v3;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    [(id)objc_opt_class(self) defaultHighlightOpacity];
  }
  double v6 = v5;

  return v6;
}

- (void)setTextHighlightOpacity:(double)a3
{
}

- (BOOL)videoOverridesTextHighlight
{
  uint64_t v3 = MACaptionAppearancePrefCopyVideoOverrideBackgroundColor(self->_styleID, a2);
  unsigned __int8 v4 = [(id)v3 BOOLValue];

  double v5 = (void *)MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity(self->_styleID);
  LOBYTE(v3) = [v5 BOOLValue];

  return v4 & v3;
}

- (void)setVideoOverridesTextHighlight:(BOOL)a3
{
  BOOL v3 = a3;
  MACaptionAppearancePrefSetVideoOverrideBackgroundColor( self->_styleID,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  MACaptionAppearancePrefSetVideoOverrideBackgroundOpacity( self->_styleID,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
}

- (UIColor)backgroundColor
{
  BOOL v3 = (CGColor *)MACaptionAppearancePrefCopyWindowColor(self->_styleID, a2);
  if (v3)
  {
    unsigned __int8 v4 = -[UIColor initWithCGColor:](objc_alloc(&OBJC_CLASS___UIColor), "initWithCGColor:", v3);
  }

  else
  {
    id v5 = [(id)objc_opt_class(self) defaultBackgroundColor];
    unsigned __int8 v4 = (UIColor *)objc_claimAutoreleasedReturnValue(v5);
  }

  double v6 = v4;
  CGColorRelease(v3);
  return v6;
}

- (void)setBackgroundColor:(id)a3
{
}

- (BOOL)videoOverridesBackgroundColor
{
  v2 = (void *)MACaptionAppearancePrefCopyVideoOverrideWindowColor(self->_styleID, a2);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setVideoOverridesBackgroundColor:(BOOL)a3
{
}

- (double)backgroundOpacity
{
  unsigned __int8 v3 = (void *)MACaptionAppearancePrefCopyWindowOpacity(self->_styleID, a2);
  unsigned __int8 v4 = v3;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    [(id)objc_opt_class(self) defaultBackgroundOpacity];
  }
  double v6 = v5;

  return v6;
}

- (void)setBackgroundOpacity:(double)a3
{
}

- (BOOL)videoOverridesBackgroundOpacity
{
  v2 = (void *)MACaptionAppearancePrefCopyVideoOverrideWindowOpacity(self->_styleID, a2);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setVideoOverridesBackgroundOpacity:(BOOL)a3
{
}

- (NSString)styleID
{
  return self->_styleID;
}

- (void).cxx_destruct
{
}

@end