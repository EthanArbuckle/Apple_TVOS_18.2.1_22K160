@interface MTEpisodeLockup
+ (BOOL)showsArtworkForStyle:(unint64_t)a3;
+ (BOOL)useLayoutForSkinnyPhones;
+ (BOOL)useSelfSizingCells;
+ (CGRect)frameForContentViewSize:(CGSize)a3 style:(unint64_t)a4;
+ (CGSize)artworkSizeForStyle:(unint64_t)a3;
+ (double)artworkHeightForStyle:(unint64_t)a3 sizeType:(unint64_t)a4;
+ (double)descriptionMaxHeightForCurrentOrientation;
+ (double)estimatedHeightForWidth:(double)a3 showsArtwork:(BOOL)a4;
+ (double)estimatedHeightForWidth:(double)a3 style:(unint64_t)a4;
+ (double)leadingMarginForViewWidth:(double)a3;
+ (double)maximumContentWidthForStyle:(unint64_t)a3;
+ (double)maximumContentWidthForStyle:(unint64_t)a3 showsPlayState:(BOOL)a4;
+ (id)defaultArtworkForStyle:(unint64_t)a3;
+ (id)defaultArtworkWithSize:(CGSize)a3;
+ (id)dependentPropertyKeys;
+ (id)descriptionFont;
+ (id)descriptionTextStyle;
+ (id)footerTextStyle;
+ (id)metadataFooterFont;
+ (id)metadataHeaderFont;
+ (id)mockEpisode;
+ (id)titleFont;
+ (id)titleTextStyle;
+ (unint64_t)descriptionNumberOfLinesForStyle:(unint64_t)a3 isTitleMultipleLines:(BOOL)a4;
+ (unint64_t)styleForWidth:(double)a3 showsArtwork:(BOOL)a4;
+ (unint64_t)titleNumberOfLinesForStyle:(unint64_t)a3;
- (BOOL)_isRTL;
- (BOOL)isCurrentPlayerItem;
- (BOOL)isEditing;
- (BOOL)isExpanded;
- (BOOL)isLabelMultipleLinesWithFrame:(CGRect)a3 font:(id)a4;
- (BOOL)shouldShowNowPlaying;
- (BOOL)showsAirplaneModeIcon;
- (BOOL)showsArtwork;
- (BOOL)showsDescriptionButton;
- (BOOL)showsDocumentIcon;
- (BOOL)showsErrorIcon;
- (BOOL)showsExplicitIcon;
- (BOOL)showsFooterTextView;
- (BOOL)showsMoreButton;
- (BOOL)showsPlayState;
- (BOOL)showsPubDate;
- (BOOL)showsStreamingIcon;
- (BOOL)updateDisabledReason;
- (BOOL)updateIsCurrentPlayerItemState;
- (BOOL)updateTitleFontIfNeeded;
- (CGRect)actionButtonFrameForViewWidth:(double)a3 titleOriginY:(double)a4;
- (CGRect)artworkFrameForStyle:(unint64_t)a3 forViewWidth:(double)a4;
- (CGRect)buttonsFrameForActionButtonFrame:(CGRect)a3 downloadButtonFrame:(CGRect)a4;
- (CGRect)descriptionButtonFrameForDescriptionFrame:(CGRect)a3;
- (CGRect)downloadButtonFrameForActionButtonFrame:(CGRect)a3 titleOriginY:(double)a4;
- (CGRect)explicitIconFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4;
- (CGRect)footerFrameForDescriptionButtonFrame:(CGRect)a3 descriptionFrame:(CGRect)a4;
- (CGRect)iconsViewFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 metadataFrame:(CGRect *)a5 style:(unint64_t)a6;
- (CGRect)metadataFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 style:(unint64_t)a5;
- (CGRect)moreButtonFrameForDescriptionFrame:(CGRect)a3;
- (CGRect)playStatusViewFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 artworkFrame:(CGRect)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)titleSizeForViewWidth:(double)a3 titleOrigin:(CGPoint)a4 artworkFrame:(CGRect)a5 buttonViewFrame:(CGRect)a6 style:(unint64_t)a7;
- (IMActionSheetAction)moreAction;
- (MTColorTheme)colorTheme;
- (MTEpisode)episode;
- (MTEpisodeArtworkView)artworkView;
- (MTEpisodeLockup)initWithFrame:(CGRect)a3;
- (MTEpisodeLockupDelegate)delegate;
- (MTEpisodeStateView)buttonView;
- (MTEpisodeStateView)iconView;
- (MTNowPlayingIndicatorView)barsView;
- (MTTVEpisodeActionController)actionController;
- (MTTouchInsetsButton)descriptionButton;
- (MTTouchInsetsButton)moreButton;
- (NSOperation)imageLoadingOperation;
- (UIButton)actionButton;
- (UIEdgeInsets)_layoutMargins;
- (UIEdgeInsets)_layoutMarginsForViewWidth:(double)a3;
- (UIImage)titleImage;
- (UIImageView)explicitIconView;
- (UIImageView)playStatusView;
- (UILabel)metadataLabel;
- (UITextView)descriptionTextView;
- (UITextView)footerTextView;
- (UITextView)titleTextView;
- (double)descriptionOriginForViewWidth:(CGFloat)a3 artworkFrame:(CGFloat)a4 buttonViewFrame:(CGFloat)a5 titleFrame:(CGFloat)a6 metadataFrame:(uint64_t)a7 iconViewFrame:(unint64_t)a8 style:(double)a9;
- (double)descriptionWidthForViewWidth:(double)a3 titleFrame:(CGRect)a4 style:(unint64_t)a5;
- (double)exactDescriptionSizeForOrigin:(double)a3 viewWidth:(double)a4 titleFrame:(double)a5 actionButtonFrame:(double)a6 downloadButtonFrame:(double)a7 style:(double)a8;
- (double)heightForWidth:(double)a3 style:(unint64_t)a4;
- (double)titleOriginXForViewWidth:(double)result artworkFrame:(CGRect)a4 buttonFrame:(CGRect)a5 style:(unint64_t)a6;
- (double)titleOriginYForArtworkFrame:(CGRect)a3 style:(unint64_t)a4;
- (id)_currentDescriptionColor;
- (id)_currentDescriptionFont;
- (id)_currentTitleColor;
- (id)_currentTitleFont;
- (id)descriptionExclusionPathsForOrigin:(CGPoint)a3 descriptionWidth:(double)a4 buttonsFrame:(CGRect)a5 titleFrame:(CGRect)a6;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)titleExclusionPathsForButtonViewFrame:(CGRect)a3;
- (id)titleExclusionPathsForExplicitIconFrame:(CGRect)a3 viewWidth:(double)a4;
- (int64_t)disabledReason;
- (unint64_t)style;
- (void)_setNumberOfLinesForDescription:(unint64_t)a3;
- (void)airplaneModeChanged:(id)a3;
- (void)beginLoadingArtwork;
- (void)configureSubviews;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)descriptionButtonTapped:(id)a3;
- (void)dismissActionSheetsAndPopovers;
- (void)fixEmptyTextContainers;
- (void)invalidateLayoutMargins;
- (void)invalidateSizeMetrics;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)moreButtonTapped:(id)a3;
- (void)playbackStateDidChange;
- (void)prepareForReuse;
- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4;
- (void)setActionController:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setBarsView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setButtonView:(id)a3;
- (void)setColorTheme:(id)a3;
- (void)setCurrentPlayerItem:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionButton:(id)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setDisabledReason:(int64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEpisode:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExplicitIconView:(id)a3;
- (void)setFooterTextView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIconView:(id)a3;
- (void)setImageLoadingOperation:(id)a3;
- (void)setMetadataLabel:(id)a3;
- (void)setMoreAction:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setPlayStatusView:(id)a3;
- (void)setShouldShowNowPlaying:(BOOL)a3;
- (void)setShowsAirplaneModeIcon:(BOOL)a3;
- (void)setShowsArtwork:(BOOL)a3;
- (void)setShowsDescriptionButton:(BOOL)a3;
- (void)setShowsDocumentIcon:(BOOL)a3;
- (void)setShowsErrorIcon:(BOOL)a3;
- (void)setShowsExplicitIcon:(BOOL)a3;
- (void)setShowsFooterTextView:(BOOL)a3;
- (void)setShowsMoreButton:(BOOL)a3;
- (void)setShowsPlayState:(BOOL)a3;
- (void)setShowsPubDate:(BOOL)a3;
- (void)setShowsStreamingIcon:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitleImage:(id)a3;
- (void)setTitleTextView:(id)a3;
- (void)set_layoutMargins:(UIEdgeInsets)a3;
- (void)startObservingPlaybackState;
- (void)stopObservingPlaybackState;
- (void)update;
- (void)updateActionSheetsAndPopovers;
- (void)updateAssetStatusIcons;
- (void)updateColors;
- (void)updateColorsForBarsView:(id)a3;
- (void)updateDescriptionText;
- (void)updateFooterText;
- (void)updateFooterTextViewVisbility;
- (void)updateIconView;
- (void)updateIcons;
- (void)updateMetadataText;
- (void)updateMoreButtonVisibility;
- (void)updatePlayStatusIcons;
- (void)updateStateForBarsView:(id)a3;
- (void)updateTitleIncludingIcons;
@end

@implementation MTEpisodeLockup

+ (unint64_t)styleForWidth:(double)a3 showsArtwork:(BOOL)a4
{
  unint64_t v4 = 2LL;
  if (a3 > 472.0) {
    unint64_t v4 = 3LL;
  }
  if (a4) {
    return v4;
  }
  else {
    return a3 > 472.0;
  }
}

+ (double)estimatedHeightForWidth:(double)a3 showsArtwork:(BOOL)a4
{
  return result;
}

+ (double)estimatedHeightForWidth:(double)a3 style:(unint64_t)a4
{
  v7 = objc_opt_new(&OBJC_CLASS___MTEpisodeLockup);
  -[MTEpisodeLockup setStyle:](v7, "setStyle:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 mockEpisode]);
  -[MTEpisodeLockup setEpisode:](v7, "setEpisode:", v8);

  -[MTEpisodeLockup sizeThatFits:](v7, "sizeThatFits:", a3, 1.79769313e308);
  double v10 = v9;

  return v10;
}

+ (unint64_t)titleNumberOfLinesForStyle:(unint64_t)a3
{
  if (a3 == 2)
  {
    else {
      return 3LL;
    }
  }

  else if (a3)
  {
    return 2LL;
  }

  else if (+[MTEpisodeLockup useSelfSizingCells](&OBJC_CLASS___MTEpisodeLockup, "useSelfSizingCells"))
  {
    return 5LL;
  }

  else
  {
    return 2LL;
  }

+ (unint64_t)descriptionNumberOfLinesForStyle:(unint64_t)a3 isTitleMultipleLines:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 3)
  {
    BOOL v8 = !a4;
    unint64_t v9 = 1LL;
    goto LABEL_11;
  }

  if (a3 == 1)
  {
    BOOL v8 = !a4;
    unint64_t v9 = 2LL;
LABEL_11:
    if (v8) {
      return v9 + 1;
    }
    else {
      return v9;
    }
  }

  if (a3) {
    return 3LL;
  }
  unsigned int v5 = +[MTEpisodeLockup useSelfSizingCells](&OBJC_CLASS___MTEpisodeLockup, "useSelfSizingCells");
  unint64_t v6 = 2LL;
  if (!v4) {
    unint64_t v6 = 3LL;
  }
  if (v5) {
    return 4LL;
  }
  else {
    return v6;
  }
}

+ (double)maximumContentWidthForStyle:(unint64_t)a3 showsPlayState:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](&OBJC_CLASS___MTEpisodeLockup, "descriptionFont"));
  [v7 readableWidth];
  double v9 = IMRoundToPixel(v8);

  [a1 artworkSizeForStyle:a3];
  double v11 = v10 + 8.0;
  BOOL v12 = v10 <= 0.0;
  double v13 = 0.0;
  if (v12) {
    double v11 = 0.0;
  }
  if (v4) {
    double v13 = 24.0;
  }
  return v9 + v13 + v11;
}

+ (double)maximumContentWidthForStyle:(unint64_t)a3
{
  return result;
}

+ (CGRect)frameForContentViewSize:(CGSize)a3 style:(unint64_t)a4
{
  CGFloat height = a3.height;
  double width = a3.width;
  double x = CGPointZero.x;
  CGFloat y = CGPointZero.y;
  +[MTEpisodeLockup maximumContentWidthForStyle:](&OBJC_CLASS___MTEpisodeLockup, "maximumContentWidthForStyle:", a4);
  if (width > v8)
  {
    double v9 = width - v8;
    double x = CGPointZero.x + IMRoundToPixel((width - v8) * 0.5);
    double width = width - v9;
  }

  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.double width = v12;
  result.origin.CGFloat y = v11;
  result.origin.double x = v10;
  return result;
}

+ (double)artworkHeightForStyle:(unint64_t)a3 sizeType:(unint64_t)a4
{
  double v7 = 0.0;
  if (a4 == 1)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([a1 titleTextStyle]);
    double v9 = &UIContentSizeCategoryExtraExtraLarge;
  }

  else
  {
    if (a4 != 2)
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue([a1 titleFont]);
      double v13 = (void *)objc_claimAutoreleasedReturnValue([a1 descriptionFont]);
      goto LABEL_8;
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue([a1 titleTextStyle]);
    double v9 = &UIContentSizeCategorySmall;
  }

  UIContentSizeCategory v10 = *v9;
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_fontForTextStyle:contentSizeCategoryName:]( &OBJC_CLASS___UIFont,  "mt_fontForTextStyle:contentSizeCategoryName:",  v8,  *v9));

  double v12 = (void *)objc_claimAutoreleasedReturnValue([a1 descriptionTextStyle]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_fontForTextStyle:contentSizeCategoryName:]( &OBJC_CLASS___UIFont,  "mt_fontForTextStyle:contentSizeCategoryName:",  v12,  v10));

LABEL_8:
  id v14 = [a1 titleNumberOfLinesForStyle:a3];
  double v15 = 1.0;
  if (a3 == 3) {
    double v15 = (double)((unint64_t)[a1 descriptionNumberOfLinesForStyle:3 isTitleMultipleLines:1]
  }
                 + 2);
  [v11 lineHeight];
  double v17 = (double)(unint64_t)v14 * v16 + 2.0;
  [v13 lineHeight];
  double v19 = v17 + v15 * v18;
  if (a3 != 3)
  {
    objc_msgSend(v11, "mt_offsetFromCapHeightToAscent");
    double v19 = v19 + v20;
  }

  double v7 = v19 + 2.0 + -1.0;

  return v7;
}

+ (CGSize)artworkSizeForStyle:(unint64_t)a3
{
  double v6 = v5;
  if (a3 == 3)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000BD5C0;
    v15[3] = &unk_100243C48;
    v15[4] = a1;
    v15[5] = 3LL;
    if (qword_1002B6B08 != -1) {
      dispatch_once(&qword_1002B6B08, v15);
    }
    double v9 = &qword_1002B6B00;
    UIContentSizeCategory v10 = &qword_1002B3ED0;
  }

  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
    if (a3 != 2) {
      goto LABEL_10;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000BD578;
    block[3] = &unk_100243C48;
    block[4] = a1;
    block[5] = 2LL;
    if (qword_1002B6AF8 != -1) {
      dispatch_once(&qword_1002B6AF8, block);
    }
    double v9 = &qword_1002B6AF0;
    UIContentSizeCategory v10 = &qword_1002B3EC8;
  }

  double v8 = *(double *)v10;
  double v7 = *(double *)v9;
LABEL_10:
  if (v6 >= v7) {
    double v7 = v6;
  }
  if (v7 >= v8) {
    double v11 = v8;
  }
  else {
    double v11 = v7;
  }
  if (qword_1002B6B10 != -1) {
    dispatch_once(&qword_1002B6B10, &stru_100243C90);
  }
  double v12 = ceil(v11 * *(double *)&qword_1002B3ED8) / *(double *)&qword_1002B3ED8;
  double v13 = ceil(v11);
  double v14 = v12;
  result.CGFloat height = v14;
  result.double width = v12;
  return result;
}

+ (id)defaultArtworkForStyle:(unint64_t)a3
{
  return _objc_msgSend(a1, "defaultArtworkWithSize:");
}

+ (id)defaultArtworkWithSize:(CGSize)a3
{
  double width = a3.width;
  if (a3.width < 1.0 || a3.height < 1.0)
  {
    double v7 = 0LL;
  }

  else
  {
    double height = a3.height;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageForKey:size:", kMTLibraryDefaultImageKey, width, height));
  }

  return v7;
}

+ (BOOL)showsArtworkForStyle:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)mockEpisode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 managedObjectModel]);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 entitiesByName]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMTEpisodeEntityName]);

  double v6 = -[MTEpisode initWithEntity:insertIntoManagedObjectContext:]( objc_alloc(&OBJC_CLASS___MTEpisode),  "initWithEntity:insertIntoManagedObjectContext:",  v5,  0LL);
  -[MTEpisode setTitle:]( v6,  "setTitle:",  @"This is a really long title that will always reach the maximum number of lines even when the maximum number of lines is really large and when the text size is really small. Really... we promise it will be long enough to always reach the maximum. We promise... ");
  double v7 = (void *)objc_claimAutoreleasedReturnValue( [@"This is a really long description that will always reach the maximum number of lines even when the maximum number of lines is really large and when the text size is really small. Really... we promise it will be long enough to always reach the maximum. We promise... " stringByAppendingString:@"This is a really long description that will always reach the maximum number of lines even when the maximum number of lines is really large and when the text size is really small. Really... we promise it will be long enough to always reach the maximum. We promise... "]);
  uint64_t v8 = kEpisodeDescription;
  -[MTEpisode willChangeValueForKey:](v6, "willChangeValueForKey:", kEpisodeDescription);
  -[MTEpisode setPrimitiveValue:forKey:](v6, "setPrimitiveValue:forKey:", v7, v8);
  -[MTEpisode didChangeValueForKey:](v6, "didChangeValueForKey:", v8);
  -[MTEpisode setUuid:](v6, "setUuid:", @"mockEpisodeUuid");
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](v6, "title"));
  UIContentSizeCategory v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](v6, "title"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:v10]);
  -[MTEpisode setTitle:](v6, "setTitle:", v11);

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](v6, "title"));
  -[MTEpisode setCleanedTitle:](v6, "setCleanedTitle:", v12);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v13 timeIntervalSinceReferenceDate];
  -[MTEpisode setPubDate:](v6, "setPubDate:");

  -[MTEpisode setDuration:](v6, "setDuration:", 3600.0);
  -[MTEpisode setByteSize:](v6, "setByteSize:", 52428800LL);
  -[MTEpisode setExternalType:](v6, "setExternalType:", 0LL);
  -[MTEpisode setVideo:](v6, "setVideo:", 0LL);
  -[MTEpisode setAudio:](v6, "setAudio:", 1LL);
  -[MTEpisode setExplicit:](v6, "setExplicit:", 1LL);
  uint64_t v14 = kEpisodePlayState;
  -[MTEpisode willChangeValueForKey:](v6, "willChangeValueForKey:", kEpisodePlayState);
  -[MTEpisode setPrimitiveValue:forKey:](v6, "setPrimitiveValue:forKey:", &off_100254DB8, v14);
  -[MTEpisode didChangeValueForKey:](v6, "didChangeValueForKey:", v14);

  return v6;
}

+ (id)dependentPropertyKeys
{
  v3[0] = kEpisodeUuid;
  v3[1] = kEpisodeGuid;
  v3[2] = kEpisodeTitle;
  v3[3] = kEpisodeCleanedTitle;
  v3[4] = kEpisodeDescription;
  v3[5] = kEpisodeEnclosureUrl;
  v3[6] = kEpisodeFeedDeleted;
  v3[7] = kEpisodeAssetURL;
  v3[8] = kEpisodeSuppressAutoDownload;
  v3[9] = kEpisodePubDate;
  v3[10] = kEpisodeDuration;
  v3[11] = kEpisodeAudio;
  v3[12] = kEpisodeVideo;
  v3[13] = kEpisodeExternalType;
  v3[14] = kEpisodeUti;
  v3[15] = kEpisodeExplicit;
  v3[16] = kEpisodeIsFromiTunesSync;
  v3[17] = kEpisodePlayState;
  v3[18] = kEpisodePlayStateManuallySet;
  v3[19] = kEpisodeBackCatalog;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  20LL));
}

+ (BOOL)useLayoutForSkinnyPhones
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 _referenceBounds];
  double v4 = v3;

  return v4 < 375.0;
}

+ (BOOL)useSelfSizingCells
{
  return 0;
}

+ (double)leadingMarginForViewWidth:(double)a3
{
  unsigned int v3 = +[UIView mt_areMarginsGenerousForWidth:](&OBJC_CLASS___UIView, "mt_areMarginsGenerousForWidth:", a3);
  double result = 32.0;
  if (!v3) {
    return 28.0;
  }
  return result;
}

+ (double)descriptionMaxHeightForCurrentOrientation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 bounds];
  double v4 = v3;

  double v5 = 0.4;
  if (v4 < 737.0) {
    double v5 = 0.5;
  }
  return v4 * v5;
}

+ (id)titleTextStyle
{
  return UIFontTextStyleHeadline1;
}

+ (id)descriptionTextStyle
{
  return UIFontTextStyleSubheadline2;
}

+ (id)footerTextStyle
{
  return UIFontTextStyleFootnote;
}

+ (id)titleFont
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 titleTextStyle]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v2));

  return v3;
}

+ (id)metadataHeaderFont
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 descriptionTextStyle]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:addingSymbolicTraits:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:addingSymbolicTraits:",  v2,  2LL));

  return v3;
}

+ (id)descriptionFont
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 descriptionTextStyle]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v2));

  return v3;
}

+ (id)metadataFooterFont
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 footerTextStyle]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v2));

  return v3;
}

- (MTEpisodeLockup)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTEpisodeLockup;
  double v3 = -[MTEpisodeLockup initWithFrame:]( &v12,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    sizeCache = v3->_sizeCache;
    v3->_sizeCache = (NSMutableDictionary *)v4;

    double v6 = objc_opt_new(&OBJC_CLASS___MTTVEpisodeActionController);
    actionController = v3->_actionController;
    v3->_actionController = v6;

    v3->_showsPubDate = 1;
    v3->_showsPlayState = 1;
    -[MTEpisodeLockup configureSubviews](v3, "configureSubviews");
    v3->_initialized = 1;
    v3->_shouldShowNowPlaying = 1;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
    [v8 addObserver:v3];

    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v3 selector:"airplaneModeChanged:" name:@"MTAirplaneModeChangedNotification" object:0];

    UIContentSizeCategory v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v3 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }

  return v3;
}

- (void)dealloc
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
  [v3 removeObserver:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTEpisodeLockup;
  -[MTEpisodeLockup dealloc](&v5, "dealloc");
}

- (void)configureSubviews
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup layer](self, "layer"));
  [v3 setAllowsGroupOpacity:0];

  if (-[MTEpisodeLockup showsPlayState](self, "showsPlayState"))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
    -[MTEpisodeLockup addSubview:](self, "addSubview:", v4);
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  -[MTEpisodeLockup addSubview:](self, "addSubview:", v5);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  -[MTEpisodeLockup addSubview:](self, "addSubview:", v6);

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  -[MTEpisodeLockup addSubview:](self, "addSubview:", v7);

  if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    -[MTEpisodeLockup addSubview:](self, "addSubview:", v8);
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
  -[MTEpisodeLockup addSubview:](self, "addSubview:", v9);

  if (!-[MTEpisodeLockup isExpanded](self, "isExpanded"))
  {
    UIContentSizeCategory v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreButton](self, "moreButton"));
    -[MTEpisodeLockup addSubview:](self, "addSubview:", v10);
  }

  -[MTEpisodeLockup updateColors](self, "updateColors");
  -[MTEpisodeLockup setStyle:](self, "setStyle:", 0LL);
  -[MTEpisodeLockup setShowsMoreButton:](self, "setShowsMoreButton:", 1LL);
}

- (MTEpisodeArtworkView)artworkView
{
  artworkView = self->_artworkView;
  if (!artworkView)
  {
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___MTEpisodeArtworkView);
    objc_super v5 = self->_artworkView;
    self->_artworkView = v4;

    -[MTEpisodeArtworkView setCurrentPlayerItem:]( self->_artworkView,  "setCurrentPlayerItem:",  -[MTEpisodeLockup isCurrentPlayerItem](self, "isCurrentPlayerItem"));
    artworkView = self->_artworkView;
  }

  return artworkView;
}

- (UIImageView)playStatusView
{
  playStatusView = self->_playStatusView;
  if (!playStatusView)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    objc_super v5 = self->_playStatusView;
    self->_playStatusView = v4;

    playStatusView = self->_playStatusView;
  }

  return playStatusView;
}

- (UIImageView)explicitIconView
{
  explicitIconView = self->_explicitIconView;
  if (!explicitIconView)
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___UIImageView);
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeStateView explicitIcon](&OBJC_CLASS___MTEpisodeStateView, "explicitIcon"));
    double v6 = -[UIImageView initWithImage:](v4, "initWithImage:", v5);
    double v7 = self->_explicitIconView;
    self->_explicitIconView = v6;

    -[UIImageView sizeToFit](self->_explicitIconView, "sizeToFit");
    explicitIconView = self->_explicitIconView;
  }

  return explicitIconView;
}

- (MTEpisodeStateView)iconView
{
  iconView = self->_iconView;
  if (!iconView)
  {
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___MTEpisodeStateView);
    objc_super v5 = self->_iconView;
    self->_iconView = v4;

    -[MTEpisodeStateView setVerticalLayout:](self->_iconView, "setVerticalLayout:", 0LL);
    iconView = self->_iconView;
  }

  return iconView;
}

- (MTTouchInsetsButton)moreButton
{
  moreButton = self->_moreButton;
  if (!moreButton)
  {
    uint64_t v4 = (MTTouchInsetsButton *)objc_claimAutoreleasedReturnValue( +[MTTouchInsetsButton buttonWithType:]( &OBJC_CLASS___MTTouchInsetsButton,  "buttonWithType:",  1LL));
    objc_super v5 = self->_moreButton;
    self->_moreButton = v4;

    double v6 = self->_moreButton;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"more..." value:&stru_100248948 table:0]);
    -[MTTouchInsetsButton setTitle:forState:](v6, "setTitle:forState:", v8, 0LL);

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](self->_moreButton, "titleLabel"));
    UIContentSizeCategory v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](&OBJC_CLASS___MTEpisodeLockup, "descriptionFont"));
    [v9 setFont:v10];

    -[MTTouchInsetsButton addTarget:action:forControlEvents:]( self->_moreButton,  "addTarget:action:forControlEvents:",  self,  "moreButtonTapped:",  64LL);
    -[MTTouchInsetsButton setTouchInsets:](self->_moreButton, "setTouchInsets:", -16.0, -8.0, -8.0, -12.0);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](self->_moreButton, "titleLabel"));
    [v11 sizeToFit];

    objc_super v12 = self->_moreButton;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](v12, "titleLabel"));
    [v13 bounds];
    -[MTTouchInsetsButton setFrame:](v12, "setFrame:");

    moreButton = self->_moreButton;
  }

  return moreButton;
}

- (MTTouchInsetsButton)descriptionButton
{
  descriptionButton = self->_descriptionButton;
  if (!descriptionButton)
  {
    uint64_t v4 = (MTTouchInsetsButton *)objc_claimAutoreleasedReturnValue( +[MTTouchInsetsButton buttonWithType:]( &OBJC_CLASS___MTTouchInsetsButton,  "buttonWithType:",  1LL));
    objc_super v5 = self->_descriptionButton;
    self->_descriptionButton = v4;

    double v6 = self->_descriptionButton;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"show full description" value:&stru_100248948 table:0]);
    -[MTTouchInsetsButton setTitle:forState:](v6, "setTitle:forState:", v8, 0LL);

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](self->_descriptionButton, "titleLabel"));
    UIContentSizeCategory v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](&OBJC_CLASS___MTEpisodeLockup, "descriptionFont"));
    [v9 setFont:v10];

    -[MTTouchInsetsButton addTarget:action:forControlEvents:]( self->_descriptionButton,  "addTarget:action:forControlEvents:",  self,  "descriptionButtonTapped:",  64LL);
    -[MTTouchInsetsButton setTouchInsets:](self->_descriptionButton, "setTouchInsets:", -16.0, -8.0, -8.0, -12.0);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](self->_descriptionButton, "titleLabel"));
    [v11 sizeToFit];

    objc_super v12 = self->_descriptionButton;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTouchInsetsButton titleLabel](v12, "titleLabel"));
    [v13 bounds];
    -[MTTouchInsetsButton setFrame:](v12, "setFrame:");

    descriptionButton = self->_descriptionButton;
  }

  return descriptionButton;
}

- (UIButton)actionButton
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreAction](self, "moreAction"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 button]);

  return (UIButton *)v3;
}

- (IMActionSheetAction)moreAction
{
  moreAction = self->_moreAction;
  if (!moreAction)
  {
    uint64_t v4 = (IMActionSheetAction *)objc_claimAutoreleasedReturnValue(+[MTMoreActionSheetAction action](&OBJC_CLASS___MTMoreActionSheetAction, "action"));
    objc_super v5 = self->_moreAction;
    self->_moreAction = v4;

    objc_initWeak(&location, self);
    double v6 = self->_moreAction;
    double v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    double v11 = sub_1000BE52C;
    objc_super v12 = &unk_100242570;
    objc_copyWeak(&v13, &location);
    -[IMAction setActionBlock:](v6, "setActionBlock:", &v9);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController", v9, v10, v11, v12));
    -[IMAction setController:](self->_moreAction, "setController:", v7);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    moreAction = self->_moreAction;
  }

  return moreAction;
}

- (UITextView)titleTextView
{
  titleTextView = self->_titleTextView;
  if (!titleTextView)
  {
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___UITextView);
    objc_super v5 = self->_titleTextView;
    self->_titleTextView = v4;

    -[UITextView setEditable:](self->_titleTextView, "setEditable:", 0LL);
    -[UITextView setScrollEnabled:](self->_titleTextView, "setScrollEnabled:", 0LL);
    -[UITextView setUserInteractionEnabled:](self->_titleTextView, "setUserInteractionEnabled:", 0LL);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_titleTextView, "setBackgroundColor:", v6);

    -[UITextView setDataDetectorTypes:](self->_titleTextView, "setDataDetectorTypes:", 0LL);
    id v7 = [(id)objc_opt_class(self) titleFont];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UITextView setFont:](self->_titleTextView, "setFont:", v8);

    -[UITextView setTextContainerInset:]( self->_titleTextView,  "setTextContainerInset:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_titleTextView, "textContainer"));
    [v9 setLineFragmentPadding:0.0];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_titleTextView, "textContainer"));
    [v10 setWidthTracksTextView:1];

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_titleTextView, "textContainer"));
    [v11 setHeightTracksTextView:1];

    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_titleTextView, "textContainer"));
    [v12 setLineBreakMode:4];

    titleTextView = self->_titleTextView;
  }

  return titleTextView;
}

- (UITextView)descriptionTextView
{
  descriptionTextView = self->_descriptionTextView;
  if (!descriptionTextView)
  {
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___UITextView);
    objc_super v5 = self->_descriptionTextView;
    self->_descriptionTextView = v4;

    -[UITextView setEditable:](self->_descriptionTextView, "setEditable:", 0LL);
    -[UITextView setScrollEnabled:](self->_descriptionTextView, "setScrollEnabled:", 0LL);
    -[UITextView setClipsToBounds:](self->_descriptionTextView, "setClipsToBounds:", 0LL);
    -[UITextView setUserInteractionEnabled:](self->_descriptionTextView, "setUserInteractionEnabled:", 0LL);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_descriptionTextView, "setBackgroundColor:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
    [v7 setLineBreakMode:4];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
    [v8 setLineFragmentPadding:0.0];

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
    [v9 setHeightTracksTextView:1];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
    [v10 setWidthTracksTextView:1];

    -[UITextView setTextContainerInset:]( self->_descriptionTextView,  "setTextContainerInset:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
    -[UITextView setDataDetectorTypes:](self->_descriptionTextView, "setDataDetectorTypes:", 0LL);
    double v11 = self->_descriptionTextView;
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](&OBJC_CLASS___MTEpisodeLockup, "descriptionFont"));
    -[UITextView setFont:](v11, "setFont:", v12);

    descriptionTextView = self->_descriptionTextView;
  }

  return descriptionTextView;
}

- (UILabel)metadataLabel
{
  metadataLabel = self->_metadataLabel;
  if (!metadataLabel)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    objc_super v5 = self->_metadataLabel;
    self->_metadataLabel = v4;

    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_metadataLabel, "setBackgroundColor:", v6);

    id v7 = self->_metadataLabel;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](&OBJC_CLASS___MTEpisodeLockup, "metadataHeaderFont"));
    -[UILabel setFont:](v7, "setFont:", v8);

    metadataLabel = self->_metadataLabel;
  }

  return metadataLabel;
}

- (UITextView)footerTextView
{
  footerTextView = self->_footerTextView;
  if (!footerTextView)
  {
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___UITextView);
    objc_super v5 = self->_footerTextView;
    self->_footerTextView = v4;

    -[UITextView setEditable:](self->_footerTextView, "setEditable:", 0LL);
    -[UITextView setScrollEnabled:](self->_footerTextView, "setScrollEnabled:", 0LL);
    -[UITextView setClipsToBounds:](self->_footerTextView, "setClipsToBounds:", 0LL);
    -[UITextView setUserInteractionEnabled:](self->_footerTextView, "setUserInteractionEnabled:", 0LL);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_footerTextView, "setBackgroundColor:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_footerTextView, "textContainer"));
    [v7 setLineBreakMode:4];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_footerTextView, "textContainer"));
    [v8 setLineFragmentPadding:0.0];

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_footerTextView, "textContainer"));
    [v9 setHeightTracksTextView:1];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_footerTextView, "textContainer"));
    [v10 setWidthTracksTextView:1];

    -[UITextView setTextContainerInset:]( self->_footerTextView,  "setTextContainerInset:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
    -[UITextView setDataDetectorTypes:](self->_footerTextView, "setDataDetectorTypes:", 0LL);
    double v11 = self->_footerTextView;
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataFooterFont](&OBJC_CLASS___MTEpisodeLockup, "metadataFooterFont"));
    -[UITextView setFont:](v11, "setFont:", v12);

    footerTextView = self->_footerTextView;
  }

  return footerTextView;
}

- (MTNowPlayingIndicatorView)barsView
{
  barsView = self->_barsView;
  if (!barsView)
  {
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___MTNowPlayingIndicatorView);
    objc_super v5 = self->_barsView;
    self->_barsView = v4;

    -[MTNowPlayingIndicatorView setBounceStyle:](self->_barsView, "setBounceStyle:", 1LL);
    -[MTNowPlayingIndicatorView setNumberOfLevels:](self->_barsView, "setNumberOfLevels:", 4LL);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v6 scale];
    double v8 = v7;

    -[MTNowPlayingIndicatorView setLevelCornerRadius:](self->_barsView, "setLevelCornerRadius:", 1.0 / v8);
    -[MTEpisodeLockup updateColorsForBarsView:](self, "updateColorsForBarsView:", self->_barsView);
    barsView = self->_barsView;
  }

  return barsView;
}

- (void)setColorTheme:(id)a3
{
  objc_super v5 = (MTColorTheme *)a3;
  colorTheme = self->_colorTheme;
  if (colorTheme != v5)
  {
    double v8 = v5;
    unsigned __int8 v7 = -[MTColorTheme isEqual:](colorTheme, "isEqual:", v5);
    objc_super v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_colorTheme, a3);
      -[MTEpisodeLockup updateColors](self, "updateColors");
      objc_super v5 = v8;
    }
  }
}

- (void)updateColors
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
  id v20 = (id)objc_claimAutoreleasedReturnValue(+[UIColor tintColorForTheme:](&OBJC_CLASS___UIColor, "tintColorForTheme:", v3));

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor primaryTextColorForTheme:](&OBJC_CLASS___UIColor, "primaryTextColorForTheme:", v4));

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryTextColorForTheme:](&OBJC_CLASS___UIColor, "secondaryTextColorForTheme:", v6));

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  [v8 setTextColor:v5];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  [v9 setTextColor:v7];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
  [v10 setTextColor:v7];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  [v11 setTextColor:v7];

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
  [v12 setColorTheme:v13];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
  [v14 setColorTheme:v15];

  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
  [v16 setTintColor:v20];

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  [v17 setTintColor:v20];

  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreButton](self, "moreButton"));
  [v18 setTintColor:v20];

  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionButton](self, "descriptionButton"));
  [v19 setTintColor:v20];

  -[MTEpisodeLockup updateColorsForBarsView:](self, "updateColorsForBarsView:", self->_barsView);
  -[MTEpisodeLockup updatePlayStatusIcons](self, "updatePlayStatusIcons");
}

- (void)updateColorsForBarsView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor barsTintColorForTheme:](&OBJC_CLASS___UIColor, "barsTintColorForTheme:", v6));
    [v4 setTintColor:v5];
  }

- (void)moreButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup delegate](self, "delegate"));
  [v5 lockup:self moreButtonTapped:v4];
}

- (void)descriptionButtonTapped:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory viewDescriptionAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "viewDescriptionAction"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController"));
  [v6 setController:v5];

  [v6 buttonTapped:v4];
}

- (void)airplaneModeChanged:(id)a3
{
  if (!-[MTEpisodeLockup updateDisabledReason](self, "updateDisabledReason", a3))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));

    if (v4) {
      -[MTEpisodeLockup updateIcons](self, "updateIcons");
    }
  }

- (void)contentSizeCategoryDidChange:(id)a3
{
  moreButton = self->_moreButton;
  self->_moreButton = 0LL;

  if (-[MTEpisodeLockup showsMoreButton](self, "showsMoreButton"))
  {
    self->_showsMoreButton = 0;
    -[MTEpisodeLockup setShowsMoreButton:](self, "setShowsMoreButton:", 1LL);
  }

- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000BF074;
  v4[3] = &unk_100240290;
  objc_copyWeak(&v5, &location);
  dispatch_async(&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setEpisode:(id)a3
{
  if (a3) {
    -[MTEpisodeLockup update](self, "update");
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[MTEpisodeLockup updateMoreButtonVisibility](self, "updateMoreButtonVisibility");
  }

- (void)setCurrentPlayerItem:(BOOL)a3
{
  if (self->_currentPlayerItem != a3)
  {
    BOOL v3 = a3;
    self->_currentPlayerItem = a3;
    -[MTEpisodeArtworkView setCurrentPlayerItem:](self->_artworkView, "setCurrentPlayerItem:");
    -[MTEpisodeLockup updatePlayStatusIcons](self, "updatePlayStatusIcons");
    -[MTEpisodeLockup updateIconView](self, "updateIconView");
    if (v3) {
      -[MTEpisodeLockup startObservingPlaybackState](self, "startObservingPlaybackState");
    }
    else {
      -[MTEpisodeLockup stopObservingPlaybackState](self, "stopObservingPlaybackState");
    }
  }

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[MTEpisodeLockup updateMoreButtonVisibility](self, "updateMoreButtonVisibility");
    if (a3) {
      id v5 = 0LL;
    }
    else {
      id v5 = objc_msgSend( (id)objc_opt_class(self),  "descriptionNumberOfLinesForStyle:isTitleMultipleLines:",  -[MTEpisodeLockup style](self, "style"),  1);
    }
    -[MTEpisodeLockup _setNumberOfLinesForDescription:](self, "_setNumberOfLinesForDescription:", v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));

    if (v6) {
      -[MTEpisodeLockup updateDescriptionText](self, "updateDescriptionText");
    }
    -[MTEpisodeLockup updateFooterTextViewVisbility](self, "updateFooterTextViewVisbility");
    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3 || !self->_initialized)
  {
    self->_style = a3;
    -[MTEpisodeLockup setShowsArtwork:]( self,  "setShowsArtwork:",  +[MTEpisodeLockup showsArtworkForStyle:](&OBJC_CLASS___MTEpisodeLockup, "showsArtworkForStyle:", a3));
    id v5 = [(id)objc_opt_class(self) titleNumberOfLinesForStyle:a3];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 textContainer]);
    [v7 setMaximumNumberOfLines:v5];

    -[MTEpisodeLockup updateTitleFontIfNeeded](self, "updateTitleFontIfNeeded");
    -[MTEpisodeLockup invalidateSizeMetrics](self, "invalidateSizeMetrics");
    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setShowsPubDate:(BOOL)a3
{
  if (self->_showsPubDate != a3)
  {
    self->_showsPubDate = a3;
    -[MTEpisodeLockup updateDescriptionText](self, "updateDescriptionText");
  }

- (void)setShowsPlayState:(BOOL)a3
{
  if (self->_showsPlayState != a3)
  {
    BOOL v3 = a3;
    self->_showsPlayState = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
    id v6 = (MTEpisodeLockup *)objc_claimAutoreleasedReturnValue([v5 superview]);

    if (v3)
    {
      if (v6 != self)
      {
        unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
        -[MTEpisodeLockup addSubview:](self, "addSubview:", v7);
LABEL_7:
      }
    }

    else if (v6)
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
      [v7 removeFromSuperview];
      goto LABEL_7;
    }

    -[MTEpisodeLockup updateIcons](self, "updateIcons");
  }

- (void)prepareForReuse
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController"));
  [v3 prepareForReuse];

  -[MTEpisodeLockup setDisabledReason:](self, "setDisabledReason:", 0LL);
  -[MTEpisodeLockup invalidateSizeMetrics](self, "invalidateSizeMetrics");
  -[MTEpisodeLockup invalidateLayoutMargins](self, "invalidateLayoutMargins");
  self->_shouldShowNowPlaying = 1;
  -[MTEpisodeLockup setCurrentPlayerItem:](self, "setCurrentPlayerItem:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 artwork]);

  if (v5)
  {
    id v6 = objc_msgSend((id)objc_opt_class(self), "defaultArtworkForStyle:", -[MTEpisodeLockup style](self, "style"));
    id v8 = (id)objc_claimAutoreleasedReturnValue(v6);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
    [v7 setArtwork:v8];
  }

- (void)invalidateSizeMetrics
{
  self->_descriptionSize = CGSizeZero;
}

- (void)invalidateLayoutMargins
{
  __int128 v2 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->__layoutMargins.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->__layoutMargins.bottom = v2;
}

- (void)updateActionSheetsAndPopovers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreAction](self, "moreAction"));
  sub_1000BF5F0((uint64_t)v3, v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController"));
  [v4 updateActionSheetsAndPopovers];
}

- (void)dismissActionSheetsAndPopovers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreAction](self, "moreAction"));
  sub_1000BF6A0((uint64_t)v3, v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionController](self, "actionController"));
  [v4 dismissActionSheetsAndPopovers];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MTEpisodeLockup;
  id v8 = -[MTEpisodeLockup hitTest:withEvent:](&v16, "hitTest:withEvent:", v7, x, y);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreButton](self, "moreButton"));

  if (v9 == v10)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
    -[MTEpisodeLockup convertPoint:toView:](self, "convertPoint:toView:", v12, x, y);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hitTest:withEvent:", v7));

    if (v13)
    {
      id v14 = v13;

      double v9 = v14;
    }
  }

  return v9;
}

- (void)layoutSubviews
{
  v129.receiver = self;
  v129.super_class = (Class)&OBJC_CLASS___MTEpisodeLockup;
  -[MTEpisodeLockup layoutSubviews](&v129, "layoutSubviews");
  -[MTEpisodeLockup bounds](self, "bounds");
  double v4 = v3;
  if (-[MTEpisodeLockup showsArtwork](self, "showsArtwork"))
  {
    -[MTEpisodeLockup artworkFrameForStyle:forViewWidth:]( self,  "artworkFrameForStyle:forViewWidth:",  -[MTEpisodeLockup style](self, "style"),  v4);
    double x = v5;
    double y = v7;
    double width = v9;
    double height = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
    objc_msgSend(v13, "setFrame:", x, y, width, height);
  }

  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  double v121 = height;
  double v122 = width;
  -[MTEpisodeLockup titleOriginYForArtworkFrame:style:]( self,  "titleOriginYForArtworkFrame:style:",  -[MTEpisodeLockup style](self, "style"),  x,  y,  width,  height);
  double v15 = v14;
  double v120 = v14;
  -[MTEpisodeLockup actionButtonFrameForViewWidth:titleOriginY:]( self,  "actionButtonFrameForViewWidth:titleOriginY:",  v4,  v14);
  double v17 = v16;
  double v19 = v18;
  double v123 = v4;
  double v20 = x;
  double v21 = y;
  double v23 = v22;
  double v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
  objc_msgSend(v26, "setFrame:", v17, v19, v23, v25);

  -[MTEpisodeLockup downloadButtonFrameForActionButtonFrame:titleOriginY:]( self,  "downloadButtonFrameForActionButtonFrame:titleOriginY:",  v17,  v19,  v23,  v25,  v15);
  double v118 = v19;
  double v116 = v25;
  double v117 = v23;
  uint64_t v114 = v28;
  uint64_t v115 = v27;
  uint64_t v112 = v30;
  uint64_t v113 = v29;
  -[MTEpisodeLockup buttonsFrameForActionButtonFrame:downloadButtonFrame:]( self,  "buttonsFrameForActionButtonFrame:downloadButtonFrame:",  v17,  v19,  v23,  v25);
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  -[MTEpisodeLockup titleOriginXForViewWidth:artworkFrame:buttonFrame:style:]( self,  "titleOriginXForViewWidth:artworkFrame:buttonFrame:style:",  -[MTEpisodeLockup style](self, "style"),  v123,  v20,  v21,  v122,  v121,  v31,  v33,  v35,  v37);
  double v107 = v39;
  uint64_t v108 = v38;
  uint64_t v109 = v36;
  uint64_t v110 = v34;
  uint64_t v111 = v32;
  -[MTEpisodeLockup titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:]( self,  "titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:",  -[MTEpisodeLockup style](self, "style"),  v123,  v39,  v120,  v20,  v21,  v122,  v121,  v32,  v34,  v36,  v38);
  double v41 = v40;
  double v43 = v42;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  objc_msgSend(v44, "setFrame:", v107, v120, v41, v43);

  double v119 = v21;
  -[MTEpisodeLockup playStatusViewFrameForViewWidth:titleFrame:artworkFrame:]( self,  "playStatusViewFrameForViewWidth:titleFrame:artworkFrame:",  v123,  v107,  v120,  v41,  v43,  *(void *)&v20,  *(void *)&v21,  *(void *)&v122,  *(void *)&v121);
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
  objc_msgSend(v53, "setFrame:", v46, v48, v50, v52);

  -[MTEpisodeLockup metadataFrameForViewWidth:titleFrame:style:]( self,  "metadataFrameForViewWidth:titleFrame:style:",  -[MTEpisodeLockup style](self, "style"),  v123,  v107,  v120,  v41,  v43);
  double v126 = v54;
  *(void *)&__int128 v127 = v55;
  *((void *)&v127 + 1) = v56;
  double v128 = v57;
  -[MTEpisodeLockup iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:]( self,  "iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:",  &v126,  -[MTEpisodeLockup style](self, "style"),  v123,  v107,  v120,  v41,  v43);
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  v67 = (void *)objc_claimAutoreleasedReturnValue([v66 superview]);

  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
    objc_msgSend(v68, "setFrame:", v59, v61, v63, v65);
  }

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  objc_msgSend(v69, "setFrame:", v126, v127, v128);

  unint64_t v70 = -[MTEpisodeLockup style](self, "style");
  -[MTEpisodeLockup descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:]( self,  "descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:",  v70,  v123,  v20,  v119,  v122,  v121,  v111,  v110,  v109,  v108,  *(void *)&v107,  *(void *)&v120,  *(void *)&v41,  *(void *)&v43,  *(void *)&v126,  v127,  *(void *)&v128,  *(void *)&v59,  *(void *)&v61,  *(void *)&v63,  *(void *)&v65);
  double v72 = v71;
  double v74 = v73;
  -[MTEpisodeLockup exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:]( self,  "exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:",  -[MTEpisodeLockup style](self, "style"),  v71,  v73,  v123,  v107,  v120,  v41,  v43,  *(void *)&v17,  *(void *)&v118,  *(void *)&v117,  *(void *)&v116,  v115,  v114,  v113,  v112);
  double v76 = v75;
  double v78 = v77;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  [v79 frame];
  v131.origin.double x = v80;
  v131.origin.double y = v81;
  v131.size.double width = v82;
  v131.size.double height = v83;
  v130.origin.double x = v72;
  v130.origin.double y = v74;
  v130.size.double width = v76;
  v130.size.double height = v78;
  BOOL v84 = CGRectEqualToRect(v130, v131);

  if (!v84)
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    objc_msgSend(v85, "setFrame:", v72, v74, v76, v78);
  }

  -[MTEpisodeLockup fixEmptyTextContainers](self, "fixEmptyTextContainers");
  if (-[MTEpisodeLockup showsMoreButton](self, "showsMoreButton"))
  {
    -[MTEpisodeLockup moreButtonFrameForDescriptionFrame:]( self,  "moreButtonFrameForDescriptionFrame:",  v72,  v74,  v76,  v78);
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472LL;
    v125[2] = sub_1000BFE74;
    v125[3] = &unk_1002418B0;
    v125[4] = self;
    v125[5] = v86;
    v125[6] = v87;
    v125[7] = v88;
    v125[8] = v89;
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v125);
  }

  -[MTEpisodeLockup descriptionButtonFrameForDescriptionFrame:]( self,  "descriptionButtonFrameForDescriptionFrame:",  v72,  v74,  v76,  v78);
  double v91 = v90;
  double v93 = v92;
  double v95 = v94;
  double v97 = v96;
  if (-[MTEpisodeLockup showsDescriptionButton](self, "showsDescriptionButton"))
  {
    v124[0] = _NSConcreteStackBlock;
    v124[1] = 3221225472LL;
    v124[2] = sub_1000BFECC;
    v124[3] = &unk_1002418B0;
    v124[4] = self;
    *(double *)&v124[5] = v91;
    *(double *)&v124[6] = v93;
    *(double *)&v124[7] = v95;
    *(double *)&v124[8] = v97;
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v124);
  }

  if (-[MTEpisodeLockup showsFooterTextView](self, "showsFooterTextView"))
  {
    -[MTEpisodeLockup footerFrameForDescriptionButtonFrame:descriptionFrame:]( self,  "footerFrameForDescriptionButtonFrame:descriptionFrame:",  v91,  v93,  v95,  v97,  v72,  v74,  v76,  v78);
    double v99 = v98;
    double v101 = v100;
    double v103 = v102;
    double v105 = v104;
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    objc_msgSend(v106, "setFrame:", v99, v101, v103, v105);
  }

- (CGRect)explicitIconFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup titleFont](&OBJC_CLASS___MTEpisodeLockup, "titleFont"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup explicitIconView](self, "explicitIconView"));
  [v11 frame];
  double v13 = v12;
  double v15 = v14;

  unsigned int v16 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
  double v62 = a3;
  CGFloat v17 = x;
  CGFloat v18 = y;
  CGFloat v19 = width;
  CGFloat v20 = height;
  if (v16)
  {
    double v21 = CGRectGetMinX(*(CGRect *)&v17) - v13;
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    if (v21 >= v22) {
      double v23 = v21;
    }
    else {
      double v23 = v22;
    }
  }

  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v17);
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    if (MaxX >= a3 - v25 - v13) {
      double v23 = a3 - v25 - v13;
    }
    else {
      double v23 = MaxX;
    }
  }

  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v63);
  objc_msgSend(v10, "im_distanceFromLastBaselineToBottom");
  double v28 = v27;
  [v10 lineHeight];
  double v30 = (v29 - v15) * 0.5;
  if (qword_1002B6B10 != -1) {
    dispatch_once(&qword_1002B6B10, &stru_100243C90);
  }
  double v31 = ceil(v30 * *(double *)&qword_1002B3ED8) / *(double *)&qword_1002B3ED8;
  double v32 = ceil(v30);
  else {
    double v33 = v31;
  }
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 layoutManager]);
  uint64_t v36 = (char *)[v35 numberOfGlyphs] - 1;

  if (v36)
  {
    double v61 = v28;
    double v37 = MaxY;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    double v39 = (void *)objc_claimAutoreleasedReturnValue([v38 layoutManager]);
    [v39 lineFragmentRectForGlyphAtIndex:v36 effectiveRange:0];
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    uint64_t v47 = v46;

    unsigned int v48 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
    uint64_t v49 = v41;
    uint64_t v50 = v43;
    uint64_t v51 = v45;
    uint64_t v52 = v47;
    if (v48)
    {
      double v53 = CGRectGetMinX(*(CGRect *)&v49) + -5.0 - v13;
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
      if (v53 >= v54) {
        double v23 = v53;
      }
      else {
        double v23 = v54;
      }
    }

    else
    {
      double v55 = CGRectGetMaxX(*(CGRect *)&v49) + 5.0;
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
      if (v55 >= v62 - v56 - v13) {
        double v23 = v62 - v56 - v13;
      }
      else {
        double v23 = v55;
      }
    }

    double MaxY = v37;
    double v28 = v61;
  }

  double v57 = v23;
  double v58 = MaxY - v28 - v33;
  double v59 = v13;
  double v60 = v15;
  result.size.CGFloat height = v60;
  result.size.CGFloat width = v59;
  result.origin.CGFloat y = v58;
  result.origin.CGFloat x = v57;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  unint64_t v6 = -[MTEpisodeLockup style](self, "style");
  if (-[MTEpisodeLockup isExpanded](self, "isExpanded")) {
    double v7 = @"e";
  }
  else {
    double v7 = @"c";
  }
  v20.double width = width;
  v20.CGFloat height = height;
  id v8 = NSStringFromCGSize(v20);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu-%@-%@",  v6,  v7,  v9));

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sizeCache, "objectForKeyedSubscript:", v10));
  double v12 = v11;
  if (v11)
  {
    [v11 CGSizeValue];
    double width = v13;
    double v15 = v14;
  }

  else
  {
    -[MTEpisodeLockup _layoutMarginsForViewWidth:](self, "_layoutMarginsForViewWidth:", width);
    -[MTEpisodeLockup set_layoutMargins:](self, "set_layoutMargins:");
    -[MTEpisodeLockup heightForWidth:style:]( self,  "heightForWidth:style:",  -[MTEpisodeLockup style](self, "style"),  width);
    double v15 = v16;
    CGFloat v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", width, v16));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sizeCache, "setObject:forKeyedSubscript:", v17, v10);
  }

  double v18 = width;
  double v19 = v15;
  result.CGFloat height = v19;
  result.double width = v18;
  return result;
}

- (void)fixEmptyTextContainers
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 textContainer]);
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  if (v6 != v11 || v8 != v13)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 textContainer]);
    objc_msgSend(v16, "setSize:", v11, v13);
  }

  CGFloat v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 textContainer]);
  [v18 size];
  double v20 = v19;
  double v22 = v21;

  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  [v23 frame];
  double v25 = v24;
  double v27 = v26;

  if (v20 != v25 || v22 != v27)
  {
    id v29 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    double v28 = (void *)objc_claimAutoreleasedReturnValue([v29 textContainer]);
    objc_msgSend(v28, "setSize:", v25, v27);
  }

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[MTEpisodeLockup frame](self, "frame");
  if (v8 != width)
  {
    self->_descriptionSize = CGSizeZero;
    -[MTEpisodeLockup invalidateLayoutMargins](self, "invalidateLayoutMargins");
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTEpisodeLockup;
  -[MTEpisodeLockup setFrame:](&v9, "setFrame:", x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[MTEpisodeLockup bounds](self, "bounds");
  if (v8 != width)
  {
    self->_descriptionSize = CGSizeZero;
    -[MTEpisodeLockup invalidateLayoutMargins](self, "invalidateLayoutMargins");
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTEpisodeLockup;
  -[MTEpisodeLockup setBounds:](&v9, "setBounds:", x, y, width, height);
}

- (void)layoutMarginsDidChange
{
}

- (UIEdgeInsets)_layoutMargins
{
  p_layoutMargins = &self->__layoutMargins;
  float64x2_t v3 = *(float64x2_t *)&self->__layoutMargins.top;
  float64x2_t v4 = *(float64x2_t *)&self->__layoutMargins.bottom;
  if ((vminv_u16((uint16x4_t)vcltz_s16( vshl_n_s16( vmovn_s32( vuzp1q_s32( (int32x4_t)vceqq_f64(v3, *(float64x2_t *)&UIEdgeInsetsZero.top),  (int32x4_t)vceqq_f64(v4, *(float64x2_t *)&UIEdgeInsetsZero.bottom))),  0xFuLL))) & 1) != 0)
  {
    -[MTEpisodeLockup bounds](self, "bounds");
    -[MTEpisodeLockup _layoutMarginsForViewWidth:](self, "_layoutMarginsForViewWidth:", v8);
    p_layoutMargins->top = v3.f64[0];
    p_layoutMargins->double left = left;
    p_layoutMargins->bottom = v4.f64[0];
    p_layoutMargins->double right = right;
  }

  else
  {
    double left = self->__layoutMargins.left;
    double right = self->__layoutMargins.right;
  }

  result.bottom = v4.f64[0];
  result.top = v3.f64[0];
  result.double right = right;
  result.double left = left;
  return result;
}

- (UIEdgeInsets)_layoutMarginsForViewWidth:(double)a3
{
  double v6 = v5;
  float64x2_t v7 = *(float64x2_t *)&self->__layoutMargins.top;
  float64x2_t v8 = *(float64x2_t *)&self->__layoutMargins.bottom;
  if ((vminv_u16((uint16x4_t)vcltz_s16( vshl_n_s16( vmovn_s32( vuzp1q_s32( (int32x4_t)vceqq_f64(v7, *(float64x2_t *)&UIEdgeInsetsZero.top),  (int32x4_t)vceqq_f64(v8, *(float64x2_t *)&UIEdgeInsetsZero.bottom))),  0xFuLL))) & 1) != 0)
  {
    +[MTEpisodeLockup maximumContentWidthForStyle:]( &OBJC_CLASS___MTEpisodeLockup,  "maximumContentWidthForStyle:",  -[MTEpisodeLockup style](self, "style"));
    double v12 = v11;
    -[MTEpisodeLockup mt_layoutMarginsForWidth:](self, "mt_layoutMarginsForWidth:", a3);
    CGFloat v19 = v14;
    CGFloat v20 = v13;
    double v16 = v15;
    double right = v17;
    if (-[MTEpisodeLockup showsPlayState](self, "showsPlayState") && v15 < v6) {
      double left = v6;
    }
    else {
      double left = v16;
    }
    if (a3 - left - right > v12)
    {
      double left = IMRoundToPixel((a3 - v12) * 0.5);
      double right = left;
    }

    v8.f64[0] = v19;
    v7.f64[0] = v20;
    self->__layoutMargins.top = v20;
    self->__layoutMargins.double left = left;
    self->__layoutMargins.bottom = v19;
    self->__layoutMargins.double right = right;
  }

  else
  {
    double left = self->__layoutMargins.left;
    double right = self->__layoutMargins.right;
  }

  double v18 = right;
  result.bottom = v8.f64[0];
  result.top = v7.f64[0];
  result.double right = v18;
  result.double left = left;
  return result;
}

- (double)heightForWidth:(double)a3 style:(unint64_t)a4
{
  double v124 = v7;
  double v103 = v8;
  double v118 = v9;
  double v11 = v10;
  -[MTEpisodeLockup titleOriginYForArtworkFrame:style:](self, "titleOriginYForArtworkFrame:style:", a4);
  double v102 = v12;
  -[MTEpisodeLockup actionButtonFrameForViewWidth:titleOriginY:]( self,  "actionButtonFrameForViewWidth:titleOriginY:",  a3,  v12);
  double v14 = v13;
  double v114 = v15;
  double v116 = v13;
  double v16 = v15;
  double v18 = v17;
  double v110 = v19;
  double v112 = v17;
  double v20 = v19;
  -[MTEpisodeLockup downloadButtonFrameForActionButtonFrame:titleOriginY:]( self,  "downloadButtonFrameForActionButtonFrame:titleOriginY:");
  double v108 = v22;
  double v109 = v21;
  double v106 = v24;
  double v107 = v23;
  -[MTEpisodeLockup buttonsFrameForActionButtonFrame:downloadButtonFrame:]( self,  "buttonsFrameForActionButtonFrame:downloadButtonFrame:",  v14,  v16,  v18,  v20,  v21,  v22,  v23,  v24);
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v120 = v31;
  uint64_t v104 = v29;
  uint64_t v105 = v27;
  double v122 = v11;
  -[MTEpisodeLockup titleOriginXForViewWidth:artworkFrame:buttonFrame:style:]( self,  "titleOriginXForViewWidth:artworkFrame:buttonFrame:style:",  a4,  a3,  v124,  v11,  v103,  v118,  v25,  v27,  v29,  v31);
  uint64_t v101 = v30;
  double v33 = v32;
  -[MTEpisodeLockup titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:]( self,  "titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:",  a4,  a3,  v26,  v28,  v101,  v120);
  double v35 = v34;
  double v37 = v36;
  -[MTEpisodeLockup metadataFrameForViewWidth:titleFrame:style:]( self,  "metadataFrameForViewWidth:titleFrame:style:",  a4,  a3,  v33,  v102,  v34,  v36);
  uint64_t v126 = v38;
  *(void *)&__int128 v127 = v39;
  *((void *)&v127 + 1) = v40;
  uint64_t v128 = v41;
  -[MTEpisodeLockup iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:]( self,  "iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:",  &v126,  a4,  a3,  v33,  v102,  v35,  v37);
  -[MTEpisodeLockup descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:]( self,  "descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:",  a4,  a3,  v124,  v122,  v103,  v118,  v26,  v105,  v104,  v120,  *(void *)&v33,  *(void *)&v102,  *(void *)&v35,  *(void *)&v37,  v126,  v127,  v128,  v42,  v43,  v44,  v45);
  double v47 = v46;
  double v49 = v48;
  -[MTEpisodeLockup exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:]( self,  "exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:",  a4,  *(void *)&v116,  *(void *)&v114,  *(void *)&v112,  *(void *)&v110,  *(void *)&v109,  *(void *)&v108,  *(void *)&v107,  *(void *)&v106);
  double v51 = v50;
  double v121 = v52;
  -[MTEpisodeLockup moreButtonFrameForDescriptionFrame:](self, "moreButtonFrameForDescriptionFrame:", v49, v47);
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  CGFloat v60 = v59;
  v129.origin.double y = v122;
  v129.origin.CGFloat x = v124;
  v129.size.double width = v103;
  v129.size.double height = v118;
  double MaxY = CGRectGetMaxY(v129);
  v130.origin.CGFloat x = v54;
  v130.origin.double y = v56;
  v130.size.double width = v58;
  v130.size.double height = v60;
  if (CGRectIsEmpty(v130))
  {
    double v62 = v47 + v51;
  }

  else
  {
    v131.origin.CGFloat x = v54;
    v131.origin.double y = v56;
    v131.size.double width = v58;
    v131.size.double height = v60;
    double v62 = CGRectGetMaxY(v131);
  }

  double v63 = v47;
  double v64 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](&OBJC_CLASS___MTEpisodeLockup, "descriptionFont"));
  objc_msgSend(v64, "mt_offsetFromLastBaselineToBottom");
  double v66 = v62 - v65;

  if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
  {
    double v123 = v66;
    double v125 = MaxY;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    [v67 frame];
    v136.origin.CGFloat x = v68;
    v136.origin.double y = v69;
    v136.size.double width = v70;
    v136.size.double height = v71;
    v132.origin.CGFloat x = v49;
    v132.origin.double y = v47;
    v132.size.double width = v121;
    v132.size.double height = v51;
    BOOL v72 = CGRectEqualToRect(v132, v136);

    if (!v72)
    {
      double v73 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
      objc_msgSend(v73, "setFrame:", v49, v47, v121, v51);
    }

    -[MTEpisodeLockup descriptionButtonFrameForDescriptionFrame:]( self,  "descriptionButtonFrameForDescriptionFrame:",  v49,  v47,  v121,  v51);
    double v75 = v74;
    double v77 = v76;
    double v79 = v78;
    double v81 = v80;
    CGFloat v115 = v76;
    CGFloat v117 = v74;
    CGFloat v111 = v80;
    CGFloat v113 = v78;
    if (-[MTEpisodeLockup showsFooterTextView](self, "showsFooterTextView"))
    {
      -[MTEpisodeLockup footerFrameForDescriptionButtonFrame:descriptionFrame:]( self,  "footerFrameForDescriptionButtonFrame:descriptionFrame:",  v75,  v77,  v79,  v81,  v49,  v63,  v121,  v51);
      double v83 = v82;
      double y = v84;
      CGFloat v86 = v63;
      double width = v87;
      double height = v89;
      double v91 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
      CGFloat x = v83;
      objc_msgSend(v91, "setFrame:", v83, y, width, height);
    }

    else
    {
      double y = CGRectZero.origin.y;
      CGFloat x = CGRectZero.origin.x;
      CGFloat v86 = v63;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
    }

    v133.origin.CGFloat x = v49;
    v133.origin.double y = v86;
    v133.size.double width = v121;
    v133.size.double height = v51;
    double v66 = v123;
    if (CGRectGetHeight(v133) > 0.0)
    {
      v134.origin.double y = v115;
      v134.origin.CGFloat x = v117;
      v134.size.double height = v111;
      v134.size.double width = v113;
      double v92 = CGRectGetMaxY(v134);
      if (v123 < v92) {
        double v66 = v92;
      }
    }

    double MaxY = v125;
    v135.origin.CGFloat x = x;
    v135.origin.double y = y;
    v135.size.double width = width;
    v135.size.double height = height;
    double v93 = CGRectGetMaxY(v135);
    if (v66 < v93) {
      double v66 = v93;
    }
  }

  id v94 = [(id)objc_opt_class(self) titleFont];
  double v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
  [v95 _scaledValueForValue:8.0];
  if (v96 < 8.0) {
    double v96 = 8.0;
  }
  switch(a4)
  {
    case 0uLL:
    case 2uLL:
      double v97 = v66 + v96 * 2.0;
      goto LABEL_25;
    case 1uLL:
      double v99 = v66 + 5.0;
      goto LABEL_24;
    case 3uLL:
      if (MaxY >= v66) {
        double v99 = MaxY;
      }
      else {
        double v99 = v66;
      }
LABEL_24:
      double v97 = v99 + v96;
LABEL_25:
      double v98 = IMRoundToPixel(v97);
      break;
    default:
      double v98 = 100.0;
      break;
  }

  return v98;
}

- (CGRect)artworkFrameForStyle:(unint64_t)a3 forViewWidth:(double)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(id)objc_opt_class(self) artworkSizeForStyle:a3];
    double width = v7;
    CGFloat height = v9;
    unsigned int v11 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    double x = a4 - v12 - width;
    if (!v11) {
      double x = v12;
    }
    double y = 8.0;
    if (a3 == 2) {
      double y = 16.0;
    }
  }

  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.double width = v15;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)titleOriginXForViewWidth:(double)result artworkFrame:(CGRect)a4 buttonFrame:(CGRect)a5 style:(unint64_t)a6
{
  if (a6 - 2 < 2)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    CGFloat y = a4.origin.y;
    CGFloat x = a4.origin.x;
    if (!-[MTEpisodeLockup _isRTL](self, "_isRTL", result))
    {
      CGFloat v13 = x;
      CGFloat v14 = y;
      CGFloat v15 = width;
      CGFloat v16 = height;
      return CGRectGetMaxX(*(CGRect *)&v13) + 8.0;
    }

- (CGSize)titleSizeForViewWidth:(double)a3 titleOrigin:(CGPoint)a4 artworkFrame:(CGRect)a5 buttonViewFrame:(CGRect)a6 style:(unint64_t)a7
{
  double y = a4.y;
  double x = a4.x;
  unsigned int v10 = [(id)objc_opt_class(self) showsArtworkForStyle:a7];
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  [v11 frame];
  double v13 = v12;
  double v15 = v14;

  if (x != v13 || y != v15)
  {
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    [v17 frame];
    double v19 = v18;
    double v21 = v20;
    double v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    objc_msgSend(v22, "setFrame:", x, y, v19, v21);
  }

  double v23 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeLockup titleExclusionPathsForButtonViewFrame:]( self,  "titleExclusionPathsForButtonViewFrame:",  a6.origin.x,  a6.origin.y,  a6.size.width,  a6.size.height));
  double v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 textContainer]);
  [v25 setExclusionPaths:v23];

  LODWORD(v24) = CGRectIsEmpty(a6);
  unsigned int v26 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
  if ((_DWORD)v24)
  {
    if (!v26)
    {
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
      double v32 = a3 - v33;
      goto LABEL_16;
    }

    if (v10) {
      goto LABEL_9;
    }
  }

  else
  {
    if (!v26)
    {
      CGFloat v27 = a6.origin.x;
      CGFloat v28 = a6.origin.y;
      CGFloat width = a6.size.width;
      CGFloat height = a6.size.height;
      goto LABEL_15;
    }

    if (v10)
    {
LABEL_9:
      CGFloat v27 = a5.origin.x;
      CGFloat v28 = a5.origin.y;
      CGFloat width = a5.size.width;
      CGFloat height = a5.size.height;
LABEL_15:
      double v32 = CGRectGetMinX(*(CGRect *)&v27) + -8.0;
      goto LABEL_16;
    }
  }

  -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
  double v32 = a3 - v31;
LABEL_16:
  double v34 = v32 - x;
  double v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  objc_msgSend(v35, "sizeThatFits:", v34, 1.79769313e308);
  double v37 = v36;

  double v38 = v34;
  double v39 = v37;
  result.CGFloat height = v39;
  result.CGFloat width = v38;
  return result;
}

- (double)titleOriginYForArtworkFrame:(CGRect)a3 style:(unint64_t)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentTitleFont](self, "_currentTitleFont"));
  unsigned int v10 = v9;
  switch(a4)
  {
    case 0uLL:
      objc_msgSend(v9, "mt_offsetFromCapHeightToAscent");
      double v12 = 16.0;
      goto LABEL_4;
    case 1uLL:
      objc_msgSend(v9, "mt_offsetFromCapHeightToAscent");
      double v12 = 13.0;
LABEL_4:
      double v13 = v12 - v11;
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v9, "mt_offsetFromCapHeightToAscent");
      double v15 = v14;
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.double height = height;
      double v13 = CGRectGetMinY(v19) + 3.5 - v15;
      goto LABEL_7;
    case 3uLL:
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.double height = height;
      double MinY = CGRectGetMinY(v20);
      objc_msgSend(v10, "mt_offsetFromCapHeightToAscent");
      double v13 = MinY - v17;
LABEL_7:
      double height = IMRoundToPixel(v13);
      break;
    default:
      break;
  }

  return height;
}

- (double)descriptionOriginForViewWidth:(CGFloat)a3 artworkFrame:(CGFloat)a4 buttonViewFrame:(CGFloat)a5 titleFrame:(CGFloat)a6 metadataFrame:(uint64_t)a7 iconViewFrame:(unint64_t)a8 style:(double)a9
{
  double v31 = (void *)objc_claimAutoreleasedReturnValue([a1 _currentTitleFont]);
  double v32 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](&OBJC_CLASS___MTEpisodeLockup, "metadataHeaderFont"));
  v76.origin.CGFloat x = a20;
  v76.origin.CGFloat y = a21;
  v76.size.CGFloat width = a22;
  v76.size.double height = a23;
  double Height = CGRectGetHeight(v76);
  v77.origin.CGFloat x = a24;
  v77.origin.CGFloat y = a25;
  v77.size.CGFloat width = a26;
  v77.size.double height = a27;
  double v34 = CGRectGetHeight(v77);
  if (Height >= v34) {
    double v34 = Height;
  }
  if (v34 <= 0.0) {
    double v35 = v31;
  }
  else {
    double v35 = v32;
  }
  id v36 = v35;
  if (a8 < 2)
  {
LABEL_9:
    [v31 lineHeight];
    double v38 = v37;
    objc_msgSend(v36, "mt_offsetFromLastBaselineToBottom");
    double v40 = v38 - v39;
    objc_msgSend(v32, "mt_offsetFromFirstBaselineToTop");
    double v42 = v41;
    v78.origin.CGFloat x = a16;
    v78.origin.CGFloat y = a17;
    v78.size.CGFloat width = a18;
    v78.size.double height = a19;
    double MaxY = CGRectGetMaxY(v78);
    v79.origin.CGFloat x = a20;
    v79.origin.CGFloat y = a21;
    v79.size.CGFloat width = a22;
    v79.size.double height = a23;
    if (CGRectGetHeight(v79) > 0.0)
    {
      v80.origin.CGFloat x = a20;
      v80.origin.CGFloat y = a21;
      v80.size.CGFloat width = a22;
      v80.size.double height = a23;
      double MaxY = CGRectGetMaxY(v80);
    }

    v81.origin.CGFloat x = a24;
    v81.origin.CGFloat y = a25;
    v81.size.CGFloat width = a26;
    v81.size.double height = a27;
    if (CGRectGetMaxY(v81) > MaxY)
    {
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([a1 iconView]);
      unsigned int v45 = [v44 isNotEmpty];

      if (v45)
      {
        double v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
        [v46 scale];
        double v48 = v47;

        v82.origin.CGFloat x = a24;
        v82.origin.CGFloat y = a25;
        v82.size.CGFloat width = a26;
        v82.size.double height = a27;
        double MaxY = CGRectGetMaxY(v82) + 1.0 / v48 * 4.0;
      }
    }

    IMRoundToPixel(v40 - v42 + MaxY);
    if ([a1 _isRTL])
    {
      objc_msgSend(a1, "descriptionWidthForViewWidth:titleFrame:style:", a8, a2, a16, a17, a18, a19);
      double v50 = v49;
      v83.origin.CGFloat x = a16;
      v83.origin.CGFloat y = a17;
      v83.size.CGFloat width = a18;
      v83.size.double height = a19;
      double MinX = CGRectGetMaxX(v83) - v50;
    }

    else
    {
      v84.origin.CGFloat x = a16;
      v84.origin.CGFloat y = a17;
      v84.size.CGFloat width = a18;
      v84.size.double height = a19;
      double MinX = CGRectGetMinX(v84);
    }

    goto LABEL_34;
  }

  if (a8 != 2)
  {
    if (a8 != 3)
    {
      double MinX = CGPointZero.x;
      goto LABEL_34;
    }

    goto LABEL_9;
  }

  unsigned int v52 = [a1 _isRTL];
  CGFloat v53 = a3;
  double v54 = a4;
  if (v52)
  {
    CGFloat v53 = a12;
    double v54 = a13;
  }

  else
  {
    a14 = a5;
  }

  if (!v52) {
    a15 = a6;
  }
  CGFloat v73 = CGRectGetMinX(*(CGRect *)&v53);
  double v57 = (void *)objc_claimAutoreleasedReturnValue([a1 iconView]);
  double v58 = 0.0;
  if ([v57 isNotEmpty])
  {
    v85.origin.CGFloat x = a24;
    v85.origin.CGFloat y = a25;
    v85.size.CGFloat width = a26;
    v85.size.double height = a27;
    double v58 = CGRectGetMaxY(v85);
  }

  v86.origin.CGFloat x = a20;
  v86.origin.CGFloat y = a21;
  v86.size.CGFloat width = a22;
  v86.size.double height = a23;
  if (CGRectGetHeight(v86) > 0.0)
  {
    v87.origin.CGFloat x = a20;
    v87.origin.CGFloat y = a21;
    v87.size.CGFloat width = a22;
    v87.size.double height = a23;
    double v59 = CGRectGetMaxY(v87);
    objc_msgSend(v32, "mt_offsetFromLastBaselineToBottom");
    double v58 = v59 - v60;
  }

  v88.origin.CGFloat x = a16;
  v88.origin.CGFloat y = a17;
  v88.size.CGFloat width = a18;
  v88.size.double height = a19;
  double v61 = CGRectGetMaxY(v88);
  objc_msgSend(v31, "mt_offsetFromLastBaselineToBottom");
  double v63 = v61 - v62;
  if (v63 >= v58) {
    double v64 = v63;
  }
  else {
    double v64 = v58;
  }
  v89.origin.CGFloat x = a3;
  v89.origin.CGFloat y = a4;
  v89.size.CGFloat width = a5;
  v89.size.double height = a6;
  double v65 = CGRectGetMaxY(v89);
  if (v65 < v64) {
    double v65 = v64;
  }
  double v66 = v65 + 8.0;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataFooterFont](&OBJC_CLASS___MTEpisodeLockup, "metadataFooterFont"));
  objc_msgSend(v67, "mt_offsetFromCapHeightToAscent");
  IMRoundToPixel(v66 - v68);

  double MinX = v73;
LABEL_34:

  return MinX;
}

- (double)exactDescriptionSizeForOrigin:(double)a3 viewWidth:(double)a4 titleFrame:(double)a5 actionButtonFrame:(double)a6 downloadButtonFrame:(double)a7 style:(double)a8
{
  double v32 = (void *)objc_claimAutoreleasedReturnValue([a1 _currentTitleFont]);
  id v33 = objc_msgSend(a1, "isLabelMultipleLinesWithFrame:font:", v32, a5, a6, a7, a8);

  double v62 = a4;
  else {
    id v34 = [(id)objc_opt_class(a1) descriptionNumberOfLinesForStyle:a10 isTitleMultipleLines:v33];
  }
  [a1 _setNumberOfLinesForDescription:v34];
  double v35 = a1 + 3;
  double v36 = a1[3];
  if (v36 == CGSizeZero.width && a1[4] == CGSizeZero.height)
  {
    objc_msgSend(a1, "buttonsFrameForActionButtonFrame:downloadButtonFrame:", a12, a13, a14, a15, a16, a17, a18, a19);
    double v39 = v38;
    double v60 = v41;
    double v61 = v40;
    double v59 = v42;
    objc_msgSend(a1, "descriptionWidthForViewWidth:titleFrame:style:", a10, v62, a5, a6, a7, a8);
    double v36 = v43;
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "descriptionExclusionPathsForOrigin:descriptionWidth:buttonsFrame:titleFrame:",  a2,  a3,  v43,  v39,  v61,  v60,  v59,  *(void *)&a5,  *(void *)&a6,  *(void *)&a7,  *(void *)&a8));
    unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue([a1 descriptionTextView]);
    double v46 = (void *)objc_claimAutoreleasedReturnValue([v45 textContainer]);
    [v46 setExclusionPaths:v44];

    [(id)objc_opt_class(a1) descriptionMaxHeightForCurrentOrientation];
    double v48 = v47;
    double v49 = (void *)objc_claimAutoreleasedReturnValue([a1 descriptionTextView]);
    objc_msgSend(v49, "sizeThatFits:", v36, v48);
    double v51 = v50;

    BOOL v52 = v51 > v48;
    if (v51 <= v48) {
      double v48 = v51;
    }
    [a1 setShowsDescriptionButton:v52];
    if (v48 > 0.0)
    {
      CGFloat v53 = (void *)objc_claimAutoreleasedReturnValue([a1 descriptionTextView]);
      double v54 = (void *)objc_claimAutoreleasedReturnValue([v53 text]);
      if ([v54 length])
      {
      }

      else
      {
        double v55 = (void *)objc_claimAutoreleasedReturnValue([a1 descriptionTextView]);
        CGFloat v56 = (void *)objc_claimAutoreleasedReturnValue([v55 attributedText]);
        id v57 = [v56 length];

        if (!v57) {
          double v48 = 0.0;
        }
      }
    }

    *double v35 = v36;
    v35[1] = v48;
  }

  return v36;
}

- (double)descriptionWidthForViewWidth:(double)a3 titleFrame:(CGRect)a4 style:(unint64_t)a5
{
  uint64_t v30 = v13;
  uint64_t v31 = v12;
  uint64_t v32 = v11;
  uint64_t v33 = v10;
  uint64_t v34 = v9;
  uint64_t v35 = v5;
  switch(a5)
  {
    case 0uLL:
    case 2uLL:
      -[MTEpisodeLockup _layoutMargins]( self,  "_layoutMargins",  a3,  a4.origin.x,  a4.origin.y,  a4.size.width,  a4.size.height);
      double MaxX = a3 - v17;
      goto LABEL_7;
    case 1uLL:
    case 3uLL:
      CGFloat height = a4.size.height;
      CGFloat width = a4.size.width;
      CGFloat y = a4.origin.y;
      CGFloat x = a4.origin.x;
      unsigned int v23 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
      CGFloat v24 = x;
      CGFloat v25 = y;
      CGFloat v26 = width;
      CGFloat v27 = height;
      if (v23) {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v24);
      }
      else {
        double MaxX = a3 - CGRectGetMinX(*(CGRect *)&v24);
      }
LABEL_7:
      -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins", v14, v30, v31, v32, v33, v34, v6, v35, v7, v8);
      double result = MaxX - v29;
      break;
    default:
      double result = 0.0;
      break;
  }

  return result;
}

- (id)titleExclusionPathsForButtonViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    uint64_t v8 = &__NSArray0__struct;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    objc_msgSend(v9, "convertRect:fromView:", self, x, y, width, height);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRect:",  v11 + -5.0,  v13,  v15 + 5.0,  v17));
    CGRect v19 = (void *)v18;
    if (v18)
    {
      uint64_t v21 = v18;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    }

    else
    {
      uint64_t v8 = &__NSArray0__struct;
    }
  }

  return v8;
}

- (id)titleExclusionPathsForExplicitIconFrame:(CGRect)a3 viewWidth:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    double v10 = &__NSArray0__struct;
  }

  else
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    objc_msgSend(v11, "convertRect:fromView:", self, x, y, width, height);
    double v13 = v12;
    double v15 = v14;
    CGFloat v17 = v16;
    double v19 = v18;

    if (-[MTEpisodeLockup _isRTL](self, "_isRTL"))
    {
      v26.origin.double x = v13;
      v26.origin.double y = v15;
      v26.size.double width = v17;
      v26.size.double height = v19;
      double v20 = CGRectGetMaxX(v26) + 5.0;
      double v21 = 0.0;
    }

    else
    {
      double v21 = v13 + -5.0;
      v27.origin.double x = v21;
      v27.origin.double y = v15;
      v27.size.double width = v17;
      v27.size.double height = v19;
      double v20 = a4 - CGRectGetMinX(v27);
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](&OBJC_CLASS___UIBezierPath, "bezierPathWithRect:", v21, v15, v20, v19));
    unsigned int v23 = (void *)v22;
    if (v22)
    {
      uint64_t v25 = v22;
      double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    }

    else
    {
      double v10 = &__NSArray0__struct;
    }
  }

  return v10;
}

- (id)descriptionExclusionPathsForOrigin:(CGPoint)a3 descriptionWidth:(double)a4 buttonsFrame:(CGRect)a5 titleFrame:(CGRect)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v11 = a3.y;
  double v12 = a3.x;
  if (CGRectIsEmpty(a5)) {
    goto LABEL_4;
  }
  v18.size.CGFloat height = 1.79769313e308;
  v18.origin.CGFloat x = v12;
  v18.origin.CGFloat y = v11;
  v18.size.CGFloat width = a4;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  if (!CGRectIntersectsRect(v18, v21))
  {
LABEL_4:
    double v13 = 0LL;
  }

  else
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGRect v20 = CGRectOffset(v19, -v12, -v11);
    double v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRect:",  v20.origin.x,  v20.origin.y,  v20.size.width,  v20.size.height));
  }

  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v15 = v14;
  if (v13) {
    [v14 addObject:v13];
  }
  id v16 = [v15 copy];

  return v16;
}

- (BOOL)isLabelMultipleLinesWithFrame:(CGRect)a3 font:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = a4;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v16);
  [v8 lineHeight];
  double v11 = v10;

  double v12 = v11 * 1.5;
  if (qword_1002B6B10 != -1) {
    dispatch_once(&qword_1002B6B10, &stru_100243C90);
  }
  double v13 = floor(v12 * *(double *)&qword_1002B3ED8) / *(double *)&qword_1002B3ED8;
  double v14 = floor(v12);
  return v9 >= v13;
}

- (CGRect)metadataFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 style:(unint64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MinX = CGRectGetMinX(a4);
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v49);
  double v44 = MaxX;
  if (!-[MTEpisodeLockup _isRTL](self, "_isRTL")) {
    double MaxX = a3 - MinX;
  }
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel", *(void *)&v44));
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 attributedText]);
  CGFloat v47 = width;
  CGFloat v48 = height;
  double v46 = MinX;
  if ([v14 length])
  {

LABEL_6:
    CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
    objc_msgSend(v18, "sizeThatFits:", MaxX, 1.79769313e308);
    double v20 = v19;
    double v22 = v21;

    goto LABEL_7;
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  CGRect v16 = (void *)objc_claimAutoreleasedReturnValue([v15 text]);
  id v17 = [v16 length];

  if (v17) {
    goto LABEL_6;
  }
  double v20 = CGSizeZero.width;
  double v22 = CGSizeZero.height;
LABEL_7:
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup titleFont](&OBJC_CLASS___MTEpisodeLockup, "titleFont"));
  CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](&OBJC_CLASS___MTEpisodeLockup, "metadataHeaderFont"));
  [v23 lineHeight];
  double v26 = v25;
  objc_msgSend(v23, "mt_offsetFromLastBaselineToBottom");
  double v28 = v27;
  objc_msgSend(v24, "mt_offsetFromFirstBaselineToTop");
  double v30 = v29;
  if (qword_1002B6B10 != -1) {
    dispatch_once(&qword_1002B6B10, &stru_100243C90);
  }
  double v31 = ceil(v20 * *(double *)&qword_1002B3ED8) / *(double *)&qword_1002B3ED8;
  double v32 = ceil(v20);
  else {
    double v33 = v31;
  }
  double v34 = ceil(v22 * *(double *)&qword_1002B3ED8) / *(double *)&qword_1002B3ED8;
  double v35 = ceil(v22);
  else {
    double v36 = v34;
  }
  if (-[MTEpisodeLockup _isRTL](self, "_isRTL")) {
    double v37 = v45 - v33;
  }
  else {
    double v37 = v46;
  }
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = v47;
  v50.size.CGFloat height = v48;
  CGFloat MaxY = CGRectGetMaxY(v50);
  double v39 = IMRoundToPixel(v26 - v28 - v30 + MaxY);

  double v40 = v37;
  double v41 = v39;
  double v42 = v33;
  double v43 = v36;
  result.size.CGFloat height = v43;
  result.size.CGFloat width = v42;
  result.origin.CGFloat y = v41;
  result.origin.CGFloat x = v40;
  return result;
}

- (CGRect)moreButtonFrameForDescriptionFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!-[MTEpisodeLockup showsMoreButton](self, "showsMoreButton"))
  {
    double MinX = CGRectZero.origin.x;
    CGFloat v18 = CGRectZero.origin.y;
    double v19 = CGRectZero.size.width;
    CGFloat v20 = CGRectZero.size.height;
    goto LABEL_11;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](&OBJC_CLASS___MTEpisodeLockup, "metadataHeaderFont"));
  [v8 lineHeight];
  double v10 = v9;
  objc_msgSend(v8, "mt_offsetFromLastBaselineToBottom");
  double v12 = v10 - v11;
  objc_msgSend(v8, "mt_offsetFromFirstBaselineToTop");
  double v14 = v13;
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  CGRect v16 = (void *)objc_claimAutoreleasedReturnValue([v15 attributedText]);
  if ([v16 length])
  {
  }

  else
  {
    double v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 text]);
    id v23 = [v22 length];

    if (!v23)
    {
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = width;
      v40.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v40);
      goto LABEL_7;
    }
  }

  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double MinY = CGRectGetMaxY(v39);
LABEL_7:
  double v25 = MinY;
  double v26 = v12 - v14;
  double v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreButton](self, "moreButton"));
  [v27 frame];
  double v19 = v28;
  CGFloat v20 = v29;

  unsigned int v30 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
  CGFloat v31 = x;
  CGFloat v32 = y;
  CGFloat v33 = width;
  CGFloat v34 = height;
  if (v30) {
    double MinX = CGRectGetMaxX(*(CGRect *)&v31) - v19;
  }
  else {
    double MinX = CGRectGetMinX(*(CGRect *)&v31);
  }
  CGFloat v18 = IMRoundToPixel(v26 + v25);

LABEL_11:
  double v35 = MinX;
  double v36 = v18;
  double v37 = v19;
  double v38 = v20;
  result.size.CGFloat height = v38;
  result.size.CGFloat width = v37;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

- (CGRect)iconsViewFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 metadataFrame:(CGRect *)a5 style:(unint64_t)a6
{
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisodeLockup titleFont]( &OBJC_CLASS___MTEpisodeLockup,  "titleFont",  a5,  a6,  a3,  a4.origin.x,  a4.origin.y,  a4.size.width,  a4.size.height));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](&OBJC_CLASS___MTEpisodeLockup, "metadataHeaderFont"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 attributedText]);
  if ([v12 length])
  {

LABEL_4:
    NSAttributedStringKey v48 = NSFontAttributeName;
    CGRect v49 = v10;
    CGRect v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    [@" " sizeWithAttributes:v16];
    double v18 = v17;

    double MaxY = CGRectGetMaxY(*a5);
    objc_msgSend(v10, "mt_offsetFromLastBaselineToBottom");
    double v21 = MaxY - v20;
    double v22 = 0.0;
    goto LABEL_5;
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 text]);
  id v15 = [v14 length];

  if (v15) {
    goto LABEL_4;
  }
  double MinY = CGRectGetMinY(*a5);
  objc_msgSend(v10, "mt_offsetFromFirstBaselineToTop");
  double v21 = MinY + v46;
  objc_msgSend(v9, "mt_leftMargin");
  double v22 = v47;
  double v18 = 0.0;
LABEL_5:
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  [v23 frame];
  double v25 = v24;
  double v27 = v26;

  unsigned int v28 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
  CGFloat x = a5->origin.x;
  CGFloat y = a5->origin.y;
  CGFloat width = a5->size.width;
  CGFloat height = a5->size.height;
  if (v28) {
    double v33 = CGRectGetMinX(*(CGRect *)&x) - v25 - v18 - v22;
  }
  else {
    double v33 = v22 + v18 + CGRectGetMaxX(*(CGRect *)&x);
  }
  if (-[MTEpisodeLockup _isRTL](self, "_isRTL"))
  {
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    double v35 = v34 - v33;
    if (v34 - v33 > 0.0)
    {
      double v33 = v33 + v35;
      a5->origin.CGFloat x = v35 + a5->origin.x;
LABEL_13:
      a5->size.CGFloat width = a5->size.width - v35;
    }
  }

  else
  {
    v50.origin.CGFloat x = v33;
    v50.origin.CGFloat y = v21 - v27;
    v50.size.CGFloat width = v25;
    v50.size.CGFloat height = v27;
    CGFloat v36 = CGRectGetMaxX(v50) - a3;
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    double v35 = v36 + v37;
    if (v36 + v37 > 0.0)
    {
      double v33 = v33 - v35;
      goto LABEL_13;
    }
  }

  double v38 = UIPointRoundToViewScale(0LL, v33, v21 - v27);
  double v40 = v39;

  double v41 = v38;
  double v42 = v40;
  double v43 = v25;
  double v44 = v27;
  result.size.CGFloat height = v44;
  result.size.CGFloat width = v43;
  result.origin.CGFloat y = v42;
  result.origin.CGFloat x = v41;
  return result;
}

- (CGRect)playStatusViewFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 artworkFrame:(CGRect)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v11 scale];
  double v13 = v12;

  if (-[MTEpisodeLockup showsPlayState](self, "showsPlayState"))
  {
    [(id)objc_opt_class(self) leadingMarginForViewWidth:a3];
    double v15 = IMRoundToPixel((v14 + -14.0) * 0.5);
    unsigned int v16 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
    unsigned int v17 = -[MTEpisodeLockup showsArtwork](self, "showsArtwork");
    if (v17) {
      double v18 = a5.size.height;
    }
    else {
      double v18 = height;
    }
    if (v17) {
      double v19 = a5.size.width;
    }
    else {
      double v19 = width;
    }
    if (v17) {
      double v20 = a5.origin.y;
    }
    else {
      double v20 = y;
    }
    double v21 = a5.origin.x;
    if (!v17) {
      double v21 = x;
    }
    if (v16) {
      double v22 = v15 + CGRectGetMaxX(*(CGRect *)(&v18 - 3));
    }
    else {
      double v22 = CGRectGetMinX(*(CGRect *)(&v18 - 3)) + -14.0 - v15;
    }
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    double MinY = CGRectGetMinY(v31);
    double v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentTitleFont](self, "_currentTitleFont"));
    objc_msgSend(v27, "mt_offsetFromCapHeightToAscent");
    double v23 = IMRoundToPixel(MinY + v28) - (1.0 / v13 + 1.0 / v13);

    double v24 = 14.0;
    double v25 = 14.0;
  }

  else
  {
    double v22 = CGRectZero.origin.x;
    double v23 = CGRectZero.origin.y;
    double v24 = CGRectZero.size.width;
    double v25 = CGRectZero.size.height;
  }

  double v29 = v22;
  double v30 = v23;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (CGRect)downloadButtonFrameForActionButtonFrame:(CGRect)a3 titleOriginY:(double)a4
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)actionButtonFrameForViewWidth:(double)a3 titleOriginY:(double)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup actionButton](self, "actionButton"));
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup titleFont](&OBJC_CLASS___MTEpisodeLockup, "titleFont"));
  if (-[MTEpisodeLockup _isRTL](self, "_isRTL"))
  {
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    double v14 = v13;
  }

  else
  {
    -[MTEpisodeLockup _layoutMargins](self, "_layoutMargins");
    double v14 = a3 - v9 - v15;
  }

  objc_msgSend(v12, "mt_offsetFromCapHeightToAscent");
  double v17 = v16 + a4;
  [v12 capHeight];
  double v19 = IMRoundToPixel(v17 + (v18 - v11) * 0.5);

  double v20 = v14;
  double v21 = v19;
  double v22 = v9;
  double v23 = v11;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)buttonsFrameForActionButtonFrame:(CGRect)a3 downloadButtonFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  if (!CGRectIsEmpty(a4))
  {
    v16.origin.CGFloat x = v11;
    v16.origin.CGFloat y = v10;
    v16.size.CGFloat width = v9;
    v16.size.CGFloat height = v8;
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGRect v17 = CGRectUnion(v16, v19);
    CGFloat v11 = v17.origin.x;
    CGFloat v10 = v17.origin.y;
    CGFloat v9 = v17.size.width;
    CGFloat v8 = v17.size.height;
  }

  double v12 = v11;
  double v13 = v10;
  double v14 = v9;
  double v15 = v8;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)descriptionButtonFrameForDescriptionFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinY = CGRectGetMinY(a3);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  if (CGRectGetHeight(v50) > 0.0)
  {
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue([v10 layoutManager]);
    [v9 _lastGlyphBaselineRightPointWithLayoutManager:v11];
    double v13 = v12;
    double v15 = v14;

    CGRect v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    -[MTEpisodeLockup convertPoint:fromView:](self, "convertPoint:fromView:", v16, v13, v15);
    double v18 = v17;

    double MinY = v18 + 2.0;
  }

  CGRect v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](&OBJC_CLASS___MTEpisodeLockup, "metadataHeaderFont"));
  [v19 lineHeight];
  double v21 = v20;
  objc_msgSend(v19, "mt_offsetFromLastBaselineToBottom");
  double v48 = v22;
  objc_msgSend(v19, "mt_offsetFromFirstBaselineToTop");
  double v47 = v23;
  if (-[MTEpisodeLockup showsDescriptionButton](self, "showsDescriptionButton"))
  {
    double v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionButton](self, "descriptionButton"));
    [v24 frame];
    double v26 = v25;
    CGFloat v49 = v27;
  }

  else
  {
    double v26 = CGSizeZero.width;
    CGFloat v49 = CGSizeZero.height;
  }

  unsigned int v28 = -[MTEpisodeLockup _isRTL](self, "_isRTL");
  CGFloat v29 = x;
  CGFloat v30 = y;
  CGFloat v31 = width;
  CGFloat v32 = height;
  if (v28)
  {
    CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v29);
    CGFloat v34 = height;
    double v35 = v26;
    double MinX = MaxX - v26;
  }

  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v29);
    CGFloat v34 = height;
    double v35 = v26;
  }

  CGFloat v37 = x;
  CGFloat v38 = y;
  CGFloat v39 = width;
  CGFloat MaxY = CGRectGetMaxY(*(CGRect *)(&v34 - 3));
  objc_msgSend(v19, "mt_offsetFromFirstBaselineToTop", IMRoundToPixel(v21 - v48 - v47 + MaxY));
  double v42 = MinY + v21 - v41;

  double v43 = MinX;
  double v44 = v42;
  double v45 = v35;
  double v46 = v49;
  result.size.CGFloat height = v46;
  result.size.CGFloat width = v45;
  result.origin.CGFloat y = v44;
  result.origin.CGFloat x = v43;
  return result;
}

- (CGRect)footerFrameForDescriptionButtonFrame:(CGRect)a3 descriptionFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  double v9 = a3.origin.y;
  double v10 = a3.origin.x;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](&OBJC_CLASS___MTEpisodeLockup, "descriptionFont"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataFooterFont](&OBJC_CLASS___MTEpisodeLockup, "metadataFooterFont"));
  v39.origin.double x = v10;
  v39.origin.double y = v9;
  v39.size.double width = v8;
  v39.size.double height = v7;
  if (CGRectGetHeight(v39) <= 0.0) {
    double v14 = 2.0;
  }
  else {
    double v14 = 0.0;
  }
  v40.origin.double x = v10;
  v40.origin.double y = v9;
  v40.size.double width = v8;
  v40.size.double height = v7;
  CGFloat v15 = CGRectGetHeight(v40);
  BOOL v16 = v15 <= 0.0;
  if (v15 <= 0.0) {
    double v17 = x;
  }
  else {
    double v17 = v10;
  }
  if (v16) {
    double v18 = y;
  }
  else {
    double v18 = v9;
  }
  if (v16) {
    double v19 = width;
  }
  else {
    double v19 = v8;
  }
  if (v16) {
    double v20 = height;
  }
  else {
    double v20 = v7;
  }
  double MaxY = CGRectGetMaxY(*(CGRect *)&v17);
  [v13 _scaledValueForValue:26.0];
  double v23 = v22;
  objc_msgSend(v12, "mt_offsetFromLastBaselineToBottom");
  double v25 = v23 - v24;
  objc_msgSend(v13, "mt_offsetFromFirstBaselineToTop");
  double v27 = v25 - v26 - v14;
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v41);
  double v29 = IMRoundToPixel(MaxY + v27);
  if (-[MTEpisodeLockup showsFooterTextView](self, "showsFooterTextView"))
  {
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.double width = width;
    v42.size.double height = height;
    double v30 = CGRectGetWidth(v42);
    CGFloat v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    objc_msgSend(v31, "sizeThatFits:", v30, 1.79769313e308);
    CGFloat v33 = v32;
  }

  else
  {
    double v30 = CGRectZero.size.width;
    CGFloat v33 = CGRectZero.size.height;
  }

  double v34 = MinX;
  double v35 = v29;
  double v36 = v30;
  double v37 = v33;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (void)update
{
  if (!-[MTEpisodeLockup updateTitleFontIfNeeded](self, "updateTitleFontIfNeeded")
    || (float64x2_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleImage](self, "titleImage")),
        v3,
        !v3))
  {
    -[MTEpisodeLockup updateTitleIncludingIcons](self, "updateTitleIncludingIcons");
  }

  if (!-[MTEpisodeLockup updateDisabledReason](self, "updateDisabledReason")) {
    -[MTEpisodeLockup updateDescriptionText](self, "updateDescriptionText");
  }
  float64x2_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));

  if (v4) {
    -[MTEpisodeLockup beginLoadingArtwork](self, "beginLoadingArtwork");
  }
  -[MTEpisodeLockup updateIcons](self, "updateIcons");
  -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateMetadataText
{
  if (-[MTEpisodeLockup showsPubDate](self, "showsPubDate")) {
    uint64_t v3 = 7LL;
  }
  else {
    uint64_t v3 = 5LL;
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[MTEpisodeDescriptionCache sharedInstance](&OBJC_CLASS___MTEpisodeDescriptionCache, "sharedInstance"));
  float64x2_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v7 descriptionForEpisode:v4 options:v3]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup metadataLabel](self, "metadataLabel"));
  [v6 setAttributedText:v5];
}

- (void)updateFooterText
{
  if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    if ([v3 isPartiallyPlayed])
    {
      float64x2_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
      [v4 timeRemaining];
      BOOL v6 = v5 > 0.0;
    }

    else
    {
      BOOL v6 = 0LL;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisodeDescriptionCache sharedInstance]( &OBJC_CLASS___MTEpisodeDescriptionCache,  "sharedInstance"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    id v13 = (id)objc_claimAutoreleasedReturnValue([v7 metadataFooterForEpisode:v8 includingDuration:v6]);

    if ([v13 length]) {
      double v9 = -[NSMutableAttributedString initWithAttributedString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithAttributedString:",  v13);
    }
    else {
      double v9 = 0LL;
    }
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentDescriptionColor](self, "_currentDescriptionColor"));
    -[NSMutableAttributedString im_addAttribute:value:]( v9,  "im_addAttribute:value:",  NSForegroundColorAttributeName,  v10);

    id v11 = -[NSMutableAttributedString copy](v9, "copy");
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    [v12 setAttributedText:v11];
  }

- (void)updateDescriptionText
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));

  if (v3)
  {
    -[MTEpisodeLockup updateMetadataText](self, "updateMetadataText");
    float64x2_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisodeDescriptionCache sharedInstance]( &OBJC_CLASS___MTEpisodeDescriptionCache,  "sharedInstance"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    id v10 = (id)objc_claimAutoreleasedReturnValue([v4 descriptionForEpisode:v5 options:16]);

    if ([v10 length]) {
      BOOL v6 = -[NSMutableAttributedString initWithAttributedString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithAttributedString:",  v10);
    }
    else {
      BOOL v6 = 0LL;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentDescriptionColor](self, "_currentDescriptionColor"));
    -[NSMutableAttributedString addAttribute:value:range:]( v6,  "addAttribute:value:range:",  NSForegroundColorAttributeName,  v7,  0,  [v10 length]);

    id v8 = -[NSMutableAttributedString copy](v6, "copy");
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    [v9 setAttributedText:v8];

    -[MTEpisodeLockup updateFooterText](self, "updateFooterText");
    -[MTEpisodeLockup invalidateSizeMetrics](self, "invalidateSizeMetrics");
    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }

- (BOOL)updateDisabledReason
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  id v4 = [v3 reasonForNotPlayable];

  int64_t v5 = -[MTEpisodeLockup disabledReason](self, "disabledReason");
  if ((id)v5 != v4) {
    -[MTEpisodeLockup setDisabledReason:](self, "setDisabledReason:", v4);
  }
  return v5 != (void)v4;
}

- (void)setDisabledReason:(int64_t)a3
{
  if (self->_disabledReason != a3)
  {
    self->_disabledReason = a3;
    if (a3) {
      UIInterfaceGetContentDisabledAlpha();
    }
    else {
      double v4 = 1.0;
    }
    -[MTEpisodeLockup setAlpha:](self, "setAlpha:", v4);
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));

    if (v5)
    {
      -[MTEpisodeLockup updateDescriptionText](self, "updateDescriptionText");
      -[MTEpisodeLockup updateIcons](self, "updateIcons");
    }

    if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup delegate](self, "delegate"));
      [v6 lockupDidChangeSize:self];
    }
  }

- (void)setShowsArtwork:(BOOL)a3
{
  if (self->_showsArtwork != a3)
  {
    self->_showsArtwork = a3;
    if (a3)
    {
      id v4 = objc_msgSend((id)objc_opt_class(self), "defaultArtworkForStyle:", -[MTEpisodeLockup style](self, "style"));
      int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
      [v6 setArtwork:v5];

      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
      [v7 sizeToFit];

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
      -[MTEpisodeLockup addSubview:](self, "addSubview:", v8);

      -[MTEpisodeLockup beginLoadingArtwork](self, "beginLoadingArtwork");
    }

    else
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
      [v9 removeFromSuperview];

      -[MTEpisodeLockup setArtworkView:](self, "setArtworkView:", 0LL);
    }

    -[MTEpisodeLockup updatePlayStatusIcons](self, "updatePlayStatusIcons");
    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }

- (void)beginLoadingArtwork
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView superview](self->_artworkView, "superview"));
  if (v3)
  {
    id v4 = (void *)v3;
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 podcastUuid]);
    id v7 = [v6 length];

    if (v7)
    {
      objc_msgSend((id)objc_opt_class(self), "artworkSizeForStyle:", -[MTEpisodeLockup style](self, "style"));
      double v10 = v9;
      if (v9 >= 0.100000001)
      {
        double v11 = v8;
        if (v8 >= 0.100000001)
        {
          double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 podcastUuid]);

          double v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
          CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageInMemoryForKey:size:", v13, v10, v11));

          if (v15)
          {
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup artworkView](self, "artworkView"));
            [v16 setArtwork:v15];
          }

          else
          {
            objc_initWeak(&location, self);
            double v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472LL;
            v18[2] = sub_1000C3240;
            v18[3] = &unk_100243C70;
            objc_copyWeak(&v19, &location);
            objc_msgSend(v17, "asyncImageForKey:size:completionHandler:", v13, v18, v10, v11);

            objc_destroyWeak(&v19);
            objc_destroyWeak(&location);
          }
        }
      }
    }
  }

- (void)setShowsMoreButton:(BOOL)a3
{
  if (self->_showsMoreButton != a3)
  {
    BOOL v3 = a3;
    self->_showsMoreButton = a3;
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup moreButton](self, "moreButton"));
    id v6 = v5;
    if (v3) {
      -[MTEpisodeLockup addSubview:](self, "addSubview:", v5);
    }
    else {
      [v5 removeFromSuperview];
    }

    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }

- (void)updateMoreButtonVisibility
{
  if (-[MTEpisodeLockup isExpanded](self, "isExpanded")) {
    uint64_t v3 = 0LL;
  }
  else {
    uint64_t v3 = -[MTEpisodeLockup isEditing](self, "isEditing") ^ 1;
  }
  -[MTEpisodeLockup setShowsMoreButton:](self, "setShowsMoreButton:", v3);
}

- (void)setShowsDescriptionButton:(BOOL)a3
{
  if (self->_showsDescriptionButton != a3)
  {
    BOOL v3 = a3;
    self->_showsDescriptionButton = a3;
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionButton](self, "descriptionButton"));
    id v6 = v5;
    if (v3) {
      -[MTEpisodeLockup addSubview:](self, "addSubview:", v5);
    }
    else {
      [v5 removeFromSuperview];
    }

    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setShowsFooterTextView:(BOOL)a3
{
  if (self->_showsFooterTextView != a3)
  {
    BOOL v3 = a3;
    self->_showsFooterTextView = a3;
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    id v6 = v5;
    if (v3) {
      -[MTEpisodeLockup addSubview:](self, "addSubview:", v5);
    }
    else {
      [v5 removeFromSuperview];
    }

    -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
  }

- (void)updateFooterTextViewVisbility
{
  if (-[MTEpisodeLockup isExpanded](self, "isExpanded"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup footerTextView](self, "footerTextView"));
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v4 attributedText]);
    -[MTEpisodeLockup setShowsFooterTextView:](self, "setShowsFooterTextView:", [v3 length] != 0);
  }

  else
  {
    -[MTEpisodeLockup setShowsFooterTextView:](self, "setShowsFooterTextView:", 0LL);
  }

- (BOOL)updateTitleFontIfNeeded
{
  id v3 = [(id)objc_opt_class(self) titleFont];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentTitleFont](self, "_currentTitleFont"));
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    [v7 setFont:v4];

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleImage](self, "titleImage"));
    if (v8) {
      -[MTEpisodeLockup updateTitleIncludingIcons](self, "updateTitleIncludingIcons");
    }
  }

  return v6 ^ 1;
}

- (void)setTitleImage:(id)a3
{
  int64_t v5 = (UIImage *)a3;
  if (self->_titleImage != v5)
  {
    unsigned __int8 v6 = v5;
    objc_storeStrong((id *)&self->_titleImage, a3);
    -[MTEpisodeLockup updateTitleIncludingIcons](self, "updateTitleIncludingIcons");
    int64_t v5 = v6;
  }
}

- (void)updateTitleIncludingIcons
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleImage](self, "titleImage"));

  if (v3)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___NSTextAttachment);
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleImage](self, "titleImage"));
    -[NSTextAttachment setImage:](v4, "setImage:", v5);

    unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bestTitle]);

    if (v8)
    {
      double v9 = objc_alloc(&OBJC_CLASS___NSAttributedString);
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bestTitle]);
      double v12 = -[NSAttributedString initWithString:](v9, "initWithString:", v11);
      -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v12);
    }

    id v13 = -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  @" ");
    -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v13);

    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSAttributedString attributedStringWithAttachment:]( &OBJC_CLASS___NSAttributedString,  "attributedStringWithAttachment:",  v4));
    -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v14);

    v20[0] = NSFontAttributeName;
    CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentTitleFont](self, "_currentTitleFont"));
    v21[0] = v15;
    v20[1] = NSForegroundColorAttributeName;
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup _currentTitleColor](self, "_currentTitleColor"));
    v21[1] = v16;
    double v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));

    -[NSMutableAttributedString addAttributes:range:]( v6,  "addAttributes:range:",  v17,  0LL,  -[NSMutableAttributedString length](v6, "length"));
    double v18 = -[NSAttributedString initWithAttributedString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithAttributedString:",  v6);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    [v19 setAttributedText:v18];
  }

  else
  {
    id v4 = (NSTextAttachment *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    unsigned __int8 v6 = (NSMutableAttributedString *)objc_claimAutoreleasedReturnValue(-[NSTextAttachment bestTitle](v4, "bestTitle"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
    [v17 setText:v6];
  }

  -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
}

- (void)startObservingPlaybackState
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"updatePlayStatusIcons" name:IMAVPlayerNotification_StateDidChange object:0];
}

- (void)stopObservingPlaybackState
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:IMAVPlayerNotification_StateDidChange object:0];
}

- (void)playbackStateDidChange
{
  if (-[MTEpisodeLockup isCurrentPlayerItem](self, "isCurrentPlayerItem")) {
    -[MTEpisodeLockup updatePlayStatusIcons](self, "updatePlayStatusIcons");
  }
}

- (void)updateIcons
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  -[MTEpisodeLockup setShowsExplicitIcon:](self, "setShowsExplicitIcon:", [v3 isExplicit]);

  if (!-[MTEpisodeLockup updateIsCurrentPlayerItemState](self, "updateIsCurrentPlayerItemState")) {
    -[MTEpisodeLockup updatePlayStatusIcons](self, "updatePlayStatusIcons");
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  objc_msgSend(v4, "setVideo:", objc_msgSend(v5, "isVideo"));

  -[MTEpisodeLockup updateIconView](self, "updateIconView");
}

- (BOOL)updateIsCurrentPlayerItemState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  id v6 = [v3 isPlayingEpisodeUuid:v5];

  unsigned int v7 = v6 ^ -[MTEpisodeLockup isCurrentPlayerItem](self, "isCurrentPlayerItem");
  if (v7 == 1) {
    -[MTEpisodeLockup setCurrentPlayerItem:](self, "setCurrentPlayerItem:", v6);
  }
  return v7;
}

- (void)updatePlayStatusIcons
{
  if (-[MTEpisodeLockup showsPlayState](self, "showsPlayState")
    && !-[MTEpisodeLockup showsArtwork](self, "showsArtwork"))
  {
    -[MTEpisodeLockup shouldShowNowPlaying](self, "shouldShowNowPlaying");
  }

  if (-[MTEpisodeLockup showsPlayState](self, "showsPlayState"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
    id v7 = (id)objc_claimAutoreleasedReturnValue([v3 playStatusImageForTheme:v4]);
  }

  else
  {
    id v7 = 0LL;
  }

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
  [v5 setImage:v7];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup playStatusView](self, "playStatusView"));
  [v6 sizeToFit];

  -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateStateForBarsView:(id)a3
{
  id v7 = a3;
  if (-[MTEpisodeLockup isCurrentPlayerItem](self, "isCurrentPlayerItem"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    unsigned int v5 = [v4 isTargetPlaying];

    if (v5) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  [v7 setPlaybackState:v6];
}

- (void)updateAssetStatusIcons
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
  unsigned __int8 v4 = [v3 isExternalType];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
    if ([v6 isReachable])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup episode](self, "episode"));
      unsigned int v8 = [v7 feedDeleted];

      if (!v8)
      {
        uint64_t v5 = 2LL;
        goto LABEL_8;
      }
    }

    else
    {
    }

    uint64_t v5 = 3LL;
    goto LABEL_8;
  }

  uint64_t v5 = 1LL;
LABEL_8:
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  [v9 setAssetStatus:v5];
}

- (void)updateIconView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  unsigned int v4 = [v3 isNotEmpty];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  uint64_t v6 = v5;
  if (!v4)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);

    if (!v10) {
      return;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
    [v9 removeFromSuperview];
    goto LABEL_6;
  }

  [v5 updateSizeIfNeeded];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
  unsigned int v8 = (MTEpisodeLockup *)objc_claimAutoreleasedReturnValue([v7 superview]);

  if (v8 != self)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
    -[MTEpisodeLockup addSubview:](self, "addSubview:", v9);
LABEL_6:
  }

  -[MTEpisodeLockup setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowsExplicitIcon:(BOOL)a3
{
  if (self->_showsExplicitIcon != a3)
  {
    BOOL v3 = a3;
    self->_showsExplicitIcon = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup iconView](self, "iconView"));
    [v4 setExplicit:v3];
  }

- (BOOL)_isRTL
{
  return (id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[MTEpisodeLockup semanticContentAttribute](self, "semanticContentAttribute")) == (id)1;
}

- (id)_currentTitleFont
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 font]);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    id v7 = [(id)objc_opt_class(self) titleFont];
    id v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  unsigned int v8 = v6;

  return v8;
}

- (id)_currentDescriptionFont
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 font]);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    id v7 = [(id)objc_opt_class(self) descriptionFont];
    id v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  unsigned int v8 = v6;

  return v8;
}

- (id)_currentTitleColor
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup titleTextView](self, "titleTextView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 textColor]);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor primaryTextColorForTheme:](&OBJC_CLASS___UIColor, "primaryTextColorForTheme:", v7));
  }

  return v6;
}

- (id)_currentDescriptionColor
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 textColor]);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup colorTheme](self, "colorTheme"));
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryTextColorForTheme:](&OBJC_CLASS___UIColor, "secondaryTextColorForTheme:", v7));
  }

  return v6;
}

- (void)_setNumberOfLinesForDescription:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 textContainer]);
  id v7 = [v6 maximumNumberOfLines];

  if (v7 != (id)a3)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 textContainer]);
    [v9 setMaximumNumberOfLines:a3];

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 layoutManager]);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeLockup descriptionTextView](self, "descriptionTextView"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 textContainer]);
    [v11 textContainerChangedGeometry:v13];

    self->_descriptionSize = CGSizeZero;
  }

- (MTEpisode)episode
{
  return self->_episode;
}

- (MTEpisodeLockupDelegate)delegate
{
  return (MTEpisodeLockupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MTTVEpisodeActionController)actionController
{
  return self->_actionController;
}

- (void)setActionController:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isCurrentPlayerItem
{
  return self->_currentPlayerItem;
}

- (BOOL)shouldShowNowPlaying
{
  return self->_shouldShowNowPlaying;
}

- (void)setShouldShowNowPlaying:(BOOL)a3
{
  self->_shouldShowNowPlaying = a3;
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)showsPubDate
{
  return self->_showsPubDate;
}

- (BOOL)showsPlayState
{
  return self->_showsPlayState;
}

- (void)set_layoutMargins:(UIEdgeInsets)a3
{
  self->__layoutMargins = a3;
}

- (void)setMoreButton:(id)a3
{
}

- (void)setDescriptionButton:(id)a3
{
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (NSOperation)imageLoadingOperation
{
  return self->_imageLoadingOperation;
}

- (void)setImageLoadingOperation:(id)a3
{
}

- (BOOL)showsDescriptionButton
{
  return self->_showsDescriptionButton;
}

- (BOOL)showsFooterTextView
{
  return self->_showsFooterTextView;
}

- (BOOL)showsExplicitIcon
{
  return self->_showsExplicitIcon;
}

- (BOOL)showsStreamingIcon
{
  return self->_showsStreamingIcon;
}

- (void)setShowsStreamingIcon:(BOOL)a3
{
  self->_showsStreamingIcon = a3;
}

- (BOOL)showsDocumentIcon
{
  return self->_showsDocumentIcon;
}

- (void)setShowsDocumentIcon:(BOOL)a3
{
  self->_showsDocumentIcon = a3;
}

- (BOOL)showsErrorIcon
{
  return self->_showsErrorIcon;
}

- (void)setShowsErrorIcon:(BOOL)a3
{
  self->_showsErrorIcon = a3;
}

- (BOOL)showsAirplaneModeIcon
{
  return self->_showsAirplaneModeIcon;
}

- (void)setShowsAirplaneModeIcon:(BOOL)a3
{
  self->_showsAirplaneModeIcon = a3;
}

- (void)setMoreAction:(id)a3
{
}

- (void)setBarsView:(id)a3
{
}

- (void)setTitleTextView:(id)a3
{
}

- (void)setMetadataLabel:(id)a3
{
}

- (void)setDescriptionTextView:(id)a3
{
}

- (void)setFooterTextView:(id)a3
{
}

- (void)setArtworkView:(id)a3
{
}

- (void)setPlayStatusView:(id)a3
{
}

- (void)setExplicitIconView:(id)a3
{
}

- (void)setIconView:(id)a3
{
}

- (MTEpisodeStateView)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
}

- (int64_t)disabledReason
{
  return self->_disabledReason;
}

- (BOOL)showsArtwork
{
  return self->_showsArtwork;
}

- (BOOL)showsMoreButton
{
  return self->_showsMoreButton;
}

- (void).cxx_destruct
{
}

@end