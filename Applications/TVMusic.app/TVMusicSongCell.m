@interface TVMusicSongCell
+ (id)_fontFromStyle:(id)a3;
+ (id)songCellFromElement:(id)a3 existingView:(id)a4;
+ (void)registerElements;
- (BOOL)_hasThumbnail;
- (BOOL)_hasVideoBadge;
- (BOOL)_isFullWidthRTL;
- (BOOL)_isRightToLeft;
- (BOOL)_shouldShowPlayIcon;
- (BOOL)canBecomeFocused;
- (BOOL)enabled;
- (BOOL)favorite;
- (BOOL)focusable;
- (BOOL)fullWidthStyle;
- (BOOL)hasOrdinal;
- (BOOL)hasPlaylistOrdinal;
- (BOOL)hasThumbnailOverrideFrame;
- (BOOL)isExplicit;
- (BOOL)isWatched;
- (BOOL)musicBarsVisible;
- (BOOL)ordinalVisible;
- (BOOL)playIconVisible;
- (BOOL)showPlayIconWhenFocused;
- (CGPoint)socialBadgeOffset;
- (CGRect)thumbnailOverrideFrame;
- (CGSize)thumbnailSize;
- (MPIdentifierSet)songIdentifier;
- (MPModelObject)playbackContainer;
- (MPModelObject)playbackItem;
- (NSNumber)popularity;
- (NSNumber)popularityThreshold;
- (NSString)artist;
- (NSString)durationString;
- (NSString)heading;
- (NSString)title;
- (TVImageProxy)thumbnail;
- (TVImageView)thumbnailImageView;
- (TVMusicSocialBadge)socialBadge;
- (TVMusicSongCell)initWithFrame:(CGRect)a3;
- (UIColor)currentTitleColor;
- (UIColor)durationColor;
- (UIColor)durationHighlightColor;
- (UIColor)ordinalColor;
- (UIColor)ordinalHighlightColor;
- (UIColor)subtitleColor;
- (UIColor)subtitleHighlightColor;
- (UIColor)titleColor;
- (UIColor)titleHighlightColor;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UIImage)badgeImage;
- (UIImage)placeholderImage;
- (UIImage)thumbnailImage;
- (_UIFloatingContentView)floatingView;
- (double)_ordinalWidth;
- (double)artistWidth;
- (double)bottomMargin;
- (double)cellHeight;
- (double)cornerRadius;
- (double)duration;
- (double)durationLeftMargin;
- (double)durationWidth;
- (double)focusedSizeIncrease;
- (double)labelHorizontalGap;
- (double)leftPaddingForTitle;
- (double)thumbnailCornerRadius;
- (double)titleWidth;
- (id)_checkmarkImageWithGradient;
- (id)_createLabelAtPosition:(double)a3 width:(double)a4;
- (id)_decoratedTitleString;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (int64_t)_songCellTypeFromTrackTypeAttribute:(id)a3;
- (int64_t)ordinalTextAlignment;
- (int64_t)songType;
- (unint64_t)_floatingViewControlState;
- (unint64_t)ordinalValue;
- (void)_adjustThumbnailForFocusState;
- (void)_configureSpecialBadgeIndicator;
- (void)_layoutLabel:(id)a3;
- (void)_layoutMusicBarsView;
- (void)_layoutSpecialBadgeIndicator;
- (void)_lowMemoryWarning:(id)a3;
- (void)_setColorsForCurrentTraitCollection;
- (void)_setPlaybackIdentifiersWithAttributes:(id)a3;
- (void)_setPopularityUnconditionally:(id)a3;
- (void)_setSpecialBadgeIndicator:(BOOL)a3 image:(id)a4;
- (void)_updateColorsForTraitCollection:(id)a3;
- (void)_updateMusicBarsView;
- (void)_updateOrdinalLabel;
- (void)_updatePlayingState;
- (void)_updateTitleColor;
- (void)_updateVideoBadge;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)layoutSubviews;
- (void)layoutWithElement:(id)a3;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setArtist:(id)a3;
- (void)setBadgeImage:(id)a3;
- (void)setBottomMargin:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDuration:(double)a3;
- (void)setDurationColor:(id)a3;
- (void)setDurationHighlightColor:(id)a3;
- (void)setDurationString:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setFloatingView:(id)a3;
- (void)setFocusable:(BOOL)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setFullWidthStyle:(BOOL)a3;
- (void)setHasOrdinal:(BOOL)a3;
- (void)setHasThumbnailOverrideFrame:(BOOL)a3;
- (void)setHeading:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setIsWatched:(BOOL)a3;
- (void)setLeftPaddingForTitle:(double)a3;
- (void)setMusicBarsVisible:(BOOL)a3;
- (void)setOrdinalColor:(id)a3;
- (void)setOrdinalHighlightColor:(id)a3;
- (void)setOrdinalTextAlignment:(int64_t)a3;
- (void)setOrdinalValue:(unint64_t)a3;
- (void)setOrdinalVisible:(BOOL)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlayIconVisible:(BOOL)a3;
- (void)setPlayItem:(id)a3 inContainer:(id)a4;
- (void)setPlaybackContainer:(id)a3;
- (void)setPlaybackItem:(id)a3;
- (void)setPopularity:(id)a3;
- (void)setPopularityThreshold:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowPlayIconWhenFocused:(BOOL)a3;
- (void)setSocialBadge:(id)a3;
- (void)setSocialBadgeOffset:(CGPoint)a3;
- (void)setSongIdentifier:(id)a3;
- (void)setSongType:(int64_t)a3;
- (void)setSubtitleColor:(id)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setSubtitleHighlightColor:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setThumbnailCornerRadius:(double)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setThumbnailOverrideFrame:(CGRect)a3;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 isExplicit:(BOOL)a4;
- (void)setTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleHighlightColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVMusicSongCell

+ (void)registerElements
{
}

+ (id)songCellFromElement:(id)a3 existingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_opt_class(a1, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
    v10 = (TVMusicSongCell *)v7;
  }
  else {
    v10 = -[TVMusicSongCell initWithFrame:]( objc_alloc(&OBJC_CLASS___TVMusicSongCell),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  }
  v11 = v10;
  -[TVMusicSongCell layoutWithElement:](v10, "layoutWithElement:", v6);

  return v11;
}

- (void)layoutWithElement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributes]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"play-icon-when-focused"]);
  id v7 = [v6 BOOLValue];

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"music-track-type"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"greyed-out"]);
  v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"grayed-out"]);
  }
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"badge-image"]);
  v125 = v12;
  else {
    unsigned int v131 = [v4 isDisabled];
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 style]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 cssValueForStyleProperty:TVViewElementStyleFocusSizeIncrease]);
  [v15 floatValue];
  float v17 = v16;

  if ([v13 length])
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v13));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 imageWithRenderingMode:2]);
    -[TVMusicSongCell setBadgeImage:](self, "setBadgeImage:", v19);
  }

  if (v17 != 0.0) {
    -[TVMusicSongCell setFocusedSizeIncrease:](self, "setFocusedSizeIncrease:", v17);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 style]);
  [v20 width];
  double v22 = v21;

  if (v22 > 0.0)
  {
    -[TVMusicSongCell frame](self, "frame");
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v4 style]);
    [v29 width];
    double v31 = v30;

    -[TVMusicSongCell setFrame:](self, "setFrame:", v24, v26, v31, v28);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v4 style]);
  [v32 padding];
  double v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v4 style]);
  [v35 padding];
  double v37 = v34 + v36;

  if (v37 != 0.0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue([v4 style]);
    [v38 padding];
    double v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue([v4 style]);
    [v41 padding];
    -[TVMusicSongCell setBottomMargin:](self, "setBottomMargin:", v40 + v42);
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "style", v13));
  [v43 padding];
  double v45 = v44;

  if (v45 != 0.0)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue([v4 style]);
    [v46 padding];
    -[TVMusicSongCell setLeftPaddingForTitle:](self, "setLeftPaddingForTitle:", v47);
  }

  memset(v139, 0, sizeof(v139));
  +[TVMLUtilities cornerRadiiFromElement:cornerRadii:circle:]( &OBJC_CLASS___TVMLUtilities,  "cornerRadiiFromElement:cornerRadii:circle:",  v4,  v139,  0LL);
  double v48 = *(double *)v139;
  v127 = v5;
  -[TVMusicSongCell _setPlaybackIdentifiersWithAttributes:](self, "_setPlaybackIdentifiersWithAttributes:", v5, v48);
  -[TVMusicSongCell setEnabled:](self, "setEnabled:", v131 ^ 1);
  -[TVMusicSongCell setFocusable:](self, "setFocusable:", [v4 isDisabled] ^ 1);
  -[TVMusicSongCell setShowPlayIconWhenFocused:](self, "setShowPlayIconWhenFocused:", v7);
  v126 = (void *)v8;
  -[TVMusicSongCell setSongType:]( self,  "setSongType:",  -[TVMusicSongCell _songCellTypeFromTrackTypeAttribute:](self, "_songCellTypeFromTrackTypeAttribute:", v8));
  __int128 v137 = 0u;
  __int128 v138 = 0u;
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  v128 = v4;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 childViewElements]);
  id v49 = [obj countByEnumeratingWithState:&v135 objects:v140 count:16];
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v136;
    v52 = &MPModelPropertyTVShowEpisodeCount_ptr;
    uint64_t v132 = TVElementKeyTitle;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    uint64_t v129 = TVElementKeyOrdinal;
    uint64_t v130 = TVElementKeySubtitle;
    do
    {
      for (i = 0LL; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v136 != v51) {
          objc_enumerationMutation(obj);
        }
        v57 = *(void **)(*((void *)&v135 + 1) + 8LL * (void)i);
        v58 = (void *)objc_claimAutoreleasedReturnValue([v57 elementName]);
        uint64_t v60 = objc_opt_class(v52[321], v59);
        if ((objc_opt_isKindOfClass(v57, v60) & 1) != 0)
        {
          id v62 = v57;
          memset(v134, 0, sizeof(v134));
          +[TVMLUtilities cornerRadiiFromElement:cornerRadii:circle:]( &OBJC_CLASS___TVMLUtilities,  "cornerRadiiFromElement:cornerRadii:circle:",  v62,  v134,  0LL);
          double v63 = *(double *)v134;
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "attributes", v63));
          v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:@"mediaLibraryClientData"]);

          if (v65)
          {
            v66 = (TVImageProxy *)objc_claimAutoreleasedReturnValue( +[TVMusicJSObject imageProxyForClientDataString:]( &OBJC_CLASS___TVMusicJSObject,  "imageProxyForClientDataString:",  v65));
          }

          else
          {
            v66 = (TVImageProxy *)objc_claimAutoreleasedReturnValue([v62 URL]);

            if (v66)
            {
              v75 = objc_alloc(&OBJC_CLASS___TVImageProxy);
              v76 = (void *)objc_claimAutoreleasedReturnValue([v62 URL]);
              v77 = (void *)objc_claimAutoreleasedReturnValue(+[TVURLImageLoader sharedInstance](&OBJC_CLASS___TVURLImageLoader, "sharedInstance"));
              v66 = -[TVImageProxy initWithObject:imageLoader:groupType:]( v75,  "initWithObject:imageLoader:groupType:",  v76,  v77,  0LL);

              v52 = &MPModelPropertyTVShowEpisodeCount_ptr;
            }
          }

          if (v62)
          {
            -[TVMusicSongCell setThumbnail:](self, "setThumbnail:", v66);
            v78 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
            [v78 width];
            if (v79 != 0.0
              || ([v78 height], double x = CGRectZero.origin.x, v81 = y, v82 = width, v83 = height, v84 != 0.0))
            {
              [v78 width];
              if (v85 == 0.0) {
                [v78 height];
              }
              else {
                [v78 width];
              }
              double v82 = v86;
              [v78 height];
              if (v87 == 0.0) {
                [v78 width];
              }
              else {
                [v78 height];
              }
              double v83 = v88;
              [v78 padding];
              double x = v89;
              [v78 padding];
              double v81 = v90;
            }

            -[TVMusicSongCell setThumbnailOverrideFrame:](self, "setThumbnailOverrideFrame:", x, v81, v82, v83);
          }
        }

        else
        {
          uint64_t v67 = objc_opt_class(&OBJC_CLASS___TVTextElement, v61);
          if ((objc_opt_isKindOfClass(v57, v67) & 1) != 0)
          {
            id v62 = v57;
            v68 = (void *)objc_claimAutoreleasedReturnValue([v62 attributedText]);
            v69 = (void *)objc_claimAutoreleasedReturnValue([v68 string]);

            if ([v58 isEqualToString:v132])
            {
              -[TVMusicSongCell setTitle:](self, "setTitle:", v69);
              if (v131)
              {
                -[TVMusicSongCell setTitleColor:](self, "setTitleColor:", 0LL);
              }

              else
              {
                v91 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
                v92 = (void *)objc_claimAutoreleasedReturnValue([v91 color]);
                v93 = (void *)objc_claimAutoreleasedReturnValue([v92 color]);
                -[TVMusicSongCell setTitleColor:](self, "setTitleColor:", v93);
              }

              v94 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
              v95 = (void *)objc_claimAutoreleasedReturnValue([v94 highlightColor]);
              v96 = (void *)objc_claimAutoreleasedReturnValue([v95 color]);
              -[TVMusicSongCell setTitleHighlightColor:](self, "setTitleHighlightColor:", v96);

              v98 = (void *)objc_opt_class(self, v97);
              v99 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
              v100 = (void *)objc_claimAutoreleasedReturnValue([v98 _fontFromStyle:v99]);

              if (v100) {
                -[TVMusicSongCell setTitleFont:](self, "setTitleFont:", v100);
              }
              goto LABEL_61;
            }

            if ([v58 isEqualToString:v130])
            {
              -[TVMusicSongCell setArtist:](self, "setArtist:", v69);
              if (v131)
              {
                -[TVMusicSongCell setSubtitleColor:](self, "setSubtitleColor:", 0LL);
              }

              else
              {
                v107 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
                v108 = (void *)objc_claimAutoreleasedReturnValue([v107 color]);
                v109 = (void *)objc_claimAutoreleasedReturnValue([v108 color]);
                -[TVMusicSongCell setSubtitleColor:](self, "setSubtitleColor:", v109);
              }

              v110 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
              v111 = (void *)objc_claimAutoreleasedReturnValue([v110 highlightColor]);
              v112 = (void *)objc_claimAutoreleasedReturnValue([v111 color]);
              -[TVMusicSongCell setSubtitleHighlightColor:](self, "setSubtitleHighlightColor:", v112);

              v114 = (void *)objc_opt_class(self, v113);
              v115 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
              v100 = (void *)objc_claimAutoreleasedReturnValue([v114 _fontFromStyle:v115]);

              if (v100) {
                -[TVMusicSongCell setSubtitleFont:](self, "setSubtitleFont:", v100);
              }
LABEL_61:

              v52 = &MPModelPropertyTVShowEpisodeCount_ptr;
LABEL_75:

              goto LABEL_76;
            }

            if ([v58 isEqualToString:@"duration"])
            {
              -[TVMusicSongCell setDurationString:](self, "setDurationString:", v69);
              v101 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
              v102 = (void *)objc_claimAutoreleasedReturnValue([v101 color]);
              v103 = (void *)objc_claimAutoreleasedReturnValue([v102 color]);
              -[TVMusicSongCell setDurationColor:](self, "setDurationColor:", v103);

              v104 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
              v105 = (void *)objc_claimAutoreleasedReturnValue([v104 highlightColor]);
              v106 = (void *)objc_claimAutoreleasedReturnValue([v105 color]);
              -[TVMusicSongCell setDurationHighlightColor:](self, "setDurationHighlightColor:", v106);

              v52 = &MPModelPropertyTVShowEpisodeCount_ptr;
            }

            else if ([v58 isEqualToString:v129])
            {
              -[TVMusicSongCell setOrdinalValue:](self, "setOrdinalValue:", [v69 integerValue]);
              v116 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
              v117 = (void *)objc_claimAutoreleasedReturnValue([v116 color]);
              v118 = (void *)objc_claimAutoreleasedReturnValue([v117 color]);
              -[TVMusicSongCell setOrdinalColor:](self, "setOrdinalColor:", v118);

              v119 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
              v120 = (void *)objc_claimAutoreleasedReturnValue([v119 highlightColor]);
              v121 = (void *)objc_claimAutoreleasedReturnValue([v120 color]);
              -[TVMusicSongCell setOrdinalHighlightColor:](self, "setOrdinalHighlightColor:", v121);

              v52 = &MPModelPropertyTVShowEpisodeCount_ptr;
              v122 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
              id v123 = [v122 textAlignment];

              if (v123 == (id)4) {
                goto LABEL_75;
              }
              v104 = (void *)objc_claimAutoreleasedReturnValue([v62 style]);
              -[TVMusicSongCell setOrdinalTextAlignment:]( self,  "setOrdinalTextAlignment:",  [v104 textAlignment]);
            }

            else
            {
              if (![v58 isEqualToString:@"popularity"])
              {
                if ([v58 isEqualToString:@"isFavorite"])
                {
                  -[TVMusicSongCell setFavorite:](self, "setFavorite:", [v69 BOOLValue]);
                }

                else if ([v58 isEqualToString:@"explicit"])
                {
                  -[TVMusicSongCell setIsExplicit:](self, "setIsExplicit:", [v69 BOOLValue]);
                }

                goto LABEL_75;
              }

              if ([v69 length]) {
                v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v69 integerValue]));
              }
              else {
                v104 = 0LL;
              }
              -[TVMusicSongCell setPopularity:](self, "setPopularity:", v104);
            }

            goto LABEL_75;
          }

          v70 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell socialBadge](self, "socialBadge"));
          v71 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicSocialBadge socialBadgeFromElement:existingView:]( &OBJC_CLASS___TVMusicSocialBadge,  "socialBadgeFromElement:existingView:",  v57,  v70));
          -[TVMusicSongCell setSocialBadge:](self, "setSocialBadge:", v71);

          id v62 = (id)objc_claimAutoreleasedReturnValue([v57 style]);
          [v62 padding];
          double v73 = v72;
          v66 = (TVImageProxy *)objc_claimAutoreleasedReturnValue([v57 style]);
          -[TVImageProxy padding](v66, "padding");
          -[TVMusicSongCell setSocialBadgeOffset:](self, "setSocialBadgeOffset:", v73, v74);
        }

LABEL_76:
LABEL_77:
      }

      id v50 = [obj countByEnumeratingWithState:&v135 objects:v140 count:16];
    }

    while (v50);
  }
}

+ (id)_fontFromStyle:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 textStyle]);
  if ([v4 length]) {
    goto LABEL_4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 fontWeight]);
  if ([v5 length])
  {

LABEL_4:
    goto LABEL_5;
  }

  [v3 fontSize];
  double v14 = v13;

  if (v14 == 0.0)
  {
    id v11 = 0LL;
    goto LABEL_8;
  }

- (void)_setPlaybackIdentifiersWithAttributes:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"data-content-id"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"music-library-id"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"container-type"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"container-id"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"container-library-id"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"data-content-index"]);

  unsigned int v21 = [v7 isEqualToString:@"playlist"];
  double v22 = self;
  if ([v5 longLongValue] || objc_msgSend(v6, "longLongValue")) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForSongWithPersistentID:cloudID:storeID:subscriptionID:]( MPIdentifierSet,  "tvm_identifierSetForSongWithPersistentID:cloudID:storeID:subscriptionID:",  [v6 longLongValue],  0,  objc_msgSend(v5, "longLongValue"),  objc_msgSend(v5, "longLongValue")));
  }
  else {
    id v11 = 0LL;
  }
  if (![v7 length] || !objc_msgSend(v8, "length") && !objc_msgSend(v9, "length")) {
    goto LABEL_24;
  }
  if ([v7 isEqualToString:@"album"])
  {
    if ([v8 length])
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForAlbumWithStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identiferSetForAlbumWithStoreID:subscriptionID:",  [v8 longLongValue],  objc_msgSend(v8, "longLongValue")));
    }

    else
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbumKind identityKind](&OBJC_CLASS___MPModelAlbumKind, "identityKind"));
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withPersistentID:]( MPIdentifierSet,  "tvm_identifierSetForModelKind:withPersistentID:",  v14,  [v9 longLongValue]));
    }

    v15 = objc_alloc(&OBJC_CLASS___MPModelAlbum);
    float v16 = &stru_1002694B8;
  }

  else
  {
    if (!v21)
    {
LABEL_24:
      -[TVMusicSongCell setSongIdentifier:](v22, "setSongIdentifier:", v11);
      float v17 = 0LL;
      goto LABEL_25;
    }

    if ([v8 length]) {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithGlobalID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithGlobalID:",  v8));
    }
    else {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithPersistentID:]( MPIdentifierSet,  "tvm_identifierSetForPlaylistWithPersistentID:",  [v9 longLongValue]));
    }
    v12 = (void *)v13;
    v15 = objc_alloc(&OBJC_CLASS___MPModelPlaylist);
    float v16 = &stru_1002694D8;
  }

  float v17 = -[MPModelAlbum initWithIdentifiers:block:](v15, "initWithIdentifiers:block:", v12, v16);

  if (!v17) {
    goto LABEL_24;
  }
  unsigned int v18 = v21;
  if (!v9) {
    unsigned int v18 = 0;
  }
  if (v18 == 1 && v10)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicCachedLibraryRequest sharedInstance]( &OBJC_CLASS___TVMusicCachedLibraryRequest,  "sharedInstance"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000158E0;
    v23[3] = &unk_100269520;
    id v24 = v10;
    id v25 = v11;
    double v26 = v22;
    float v17 = v17;
    double v27 = v17;
    [v19 getResponseForIdentifier:v9 completion:v23];
  }

  else if (v11)
  {
    v20 = -[MPModelSong initWithIdentifiers:block:]( objc_alloc(&OBJC_CLASS___MPModelSong),  "initWithIdentifiers:block:",  v11,  &stru_100269540);
    -[TVMusicSongCell setPlayItem:inContainer:](v22, "setPlayItem:inContainer:", v20, v17);
  }

- (int64_t)_songCellTypeFromTrackTypeAttribute:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"song"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"music-video"])
    {
      int64_t v4 = 1LL;
      goto LABEL_9;
    }

    if ([v3 isEqualToString:@"classical-work"])
    {
      int64_t v4 = 2LL;
      goto LABEL_9;
    }

    if ([v3 isEqualToString:@"classical-movement"])
    {
      int64_t v4 = 3LL;
      goto LABEL_9;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVMusicSongCell: Invalid song cell type: %{public}@",  (uint8_t *)&v6,  0xCu);
    }
  }

  int64_t v4 = 0LL;
LABEL_9:

  return v4;
}

- (TVMusicSongCell)initWithFrame:(CGRect)a3
{
  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___TVMusicSongCell;
  id v3 = -[TVMusicSongCell initWithFrame:]( &v66,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  int64_t v4 = v3;
  if (v3)
  {
    v3->_hasOrdinal = 1;
    v3->_ordinalVisible = 1;
    v3->_enabled = 1;
    v3->_focusable = 1;
    v3->_songType = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v4 selector:"_lowMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];

    int v6 = objc_alloc_init(&OBJC_CLASS____UIFloatingContentView);
    -[_UIFloatingContentView setAutoresizingMask:](v6, "setAutoresizingMask:", 18LL);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v6, "setFocusedSizeIncrease:", 30.0);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell contentView](v4, "contentView"));
    [v7 frame];
    double v9 = v8;
    -[TVMusicSongCell cellHeight](v4, "cellHeight");
    -[_UIFloatingContentView setFrame:](v6, "setFrame:", 0.0, 0.0, v9, v10);

    -[_UIFloatingContentView setCornerRadius:](v6, "setCornerRadius:", 12.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v6,  "setContentMotionRotation:translation:",  0.0,  0.0523598776,  0.0,  4.0);
    -[_UIFloatingContentView setRoundContentWhenDeselected:](v6, "setRoundContentWhenDeselected:", 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  2LL));
    -[_UIFloatingContentView setFocusAnimationConfiguration:](v6, "setFocusAnimationConfiguration:", v11);

    -[_UIFloatingContentView setFloatingContentDelegate:](v6, "setFloatingContentDelegate:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[_UIFloatingContentView setBackgroundColor:forState:](v6, "setBackgroundColor:forState:", v12, 8LL);

    -[TVMusicSongCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", @"TVMusic.SongCell");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell contentView](v4, "contentView"));
    [v13 addSubview:v6];

    objc_storeStrong((id *)&v4->_floatingView, v6);
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell contentView](v4, "contentView"));
    [v14 bounds];
    double v16 = v15;

    -[TVMusicSongCell durationWidth](v4, "durationWidth");
    double v18 = v16 - v17;
    -[TVMusicSongCell durationLeftMargin](v4, "durationLeftMargin");
    double v20 = v18 - v19;
    -[TVMusicSongCell _ordinalWidth](v4, "_ordinalWidth");
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[TVMusicSongCell _createLabelAtPosition:width:](v4, "_createLabelAtPosition:width:", 20.0, v21));
    ordinalLabel = v4->_ordinalLabel;
    v4->_ordinalLabel = (UILabel *)v22;

    -[UILabel setText:](v4->_ordinalLabel, "setText:", @" ");
    -[UILabel setTextAlignment:](v4->_ordinalLabel, "setTextAlignment:", 1LL);
    -[TVMusicSongCell _ordinalWidth](v4, "_ordinalWidth");
    double v25 = v24;
    -[TVMusicSongCell labelHorizontalGap](v4, "labelHorizontalGap");
    double v27 = v25 + v26 + 20.0;
    uint64_t v28 = objc_claimAutoreleasedReturnValue(-[TVMusicSongCell _createLabelAtPosition:width:](v4, "_createLabelAtPosition:width:", v27, v20));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v28;

    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 2LL);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(-[TVMusicSongCell _createLabelAtPosition:width:](v4, "_createLabelAtPosition:width:", v27, v20));
    artistLabel = v4->_artistLabel;
    v4->_artistLabel = (UILabel *)v30;

    -[UILabel setLineBreakMode:](v4->_artistLabel, "setLineBreakMode:", 4LL);
    -[TVMusicSongCell durationWidth](v4, "durationWidth");
    uint64_t v33 = objc_claimAutoreleasedReturnValue(-[TVMusicSongCell _createLabelAtPosition:width:](v4, "_createLabelAtPosition:width:", 0.0, v32));
    durationLabel = v4->_durationLabel;
    v4->_durationLabel = (UILabel *)v33;

    -[UILabel setHidden:](v4->_durationLabel, "setHidden:", 1LL);
    -[UILabel setTextAlignment:](v4->_durationLabel, "setTextAlignment:", 2LL);
    v35 = objc_alloc(&OBJC_CLASS___TVImageView);
    -[TVMusicSongCell cellHeight](v4, "cellHeight");
    double v37 = v36;
    -[TVMusicSongCell cellHeight](v4, "cellHeight");
    double v39 = -[TVImageView initWithFrame:](v35, "initWithFrame:", 0.0, 0.0, v37, v38);
    thumbnailView = v4->_thumbnailView;
    v4->_thumbnailView = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageView layer](v4->_thumbnailView, "layer"));
    [v41 setMasksToBounds:1];

    double v42 = v4->_thumbnailView;
    -[TVMusicSongCell thumbnailCornerRadius](v4, "thumbnailCornerRadius");
    -[TVImageView _setContinuousCornerRadius:](v42, "_setContinuousCornerRadius:");
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v4->_floatingView, "contentView"));
    [v43 addSubview:v4->_thumbnailView];

    -[TVImageView setContentMode:](v4->_thumbnailView, "setContentMode:", 2LL);
    double v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"play.fill"));
    double v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "tvm_imageWithSize:aspectFit:", 1, 25.0, 25.0));

    v46 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v45);
    playIconView = v4->_playIconView;
    v4->_playIconView = v46;

    double v48 = v4->_playIconView;
    [v45 size];
    double v50 = v49;
    [v45 size];
    -[UIImageView setFrame:](v48, "setFrame:", 0.0, 0.0, v50, v51);
    v68[0] = v4->_ordinalLabel;
    v68[1] = v4->_titleLabel;
    v68[2] = v4->_durationLabel;
    uint64_t v52 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 3LL));
    labels = v4->_labels;
    v4->_labels = (NSArray *)v52;

    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    v54 = v4->_labels;
    id v55 = -[NSArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v63;
      do
      {
        for (i = 0LL; i != v56; i = (char *)i + 1)
        {
          if (*(void *)v63 != v57) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)i);
          uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v4->_floatingView, "contentView", (void)v62));
          [v60 addSubview:v59];
        }

        id v56 = -[NSArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
      }

      while (v56);
    }

    -[TVMusicSongCell _setColorsForCurrentTraitCollection](v4, "_setColorsForCurrentTraitCollection");
    -[TVMusicSongCell setClipsSubviews:](v4, "setClipsSubviews:", 0LL);
  }

  return v4;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicSongCell;
  -[TVMusicSongCell dealloc](&v4, "dealloc");
}

- (void)setCornerRadius:(double)a3
{
}

- (double)cornerRadius
{
  return result;
}

- (double)thumbnailCornerRadius
{
  double result = self->_thumbnailCornerRadius;
  if (result == 0.0) {
    return 6.0;
  }
  return result;
}

- (void)setOrdinalTextAlignment:(int64_t)a3
{
}

- (int64_t)ordinalTextAlignment
{
  return -[UILabel textAlignment](self->_ordinalLabel, "textAlignment");
}

- (void)setFocusedSizeIncrease:(double)a3
{
}

- (double)focusedSizeIncrease
{
  return result;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)titleFont
{
  return -[UILabel font](self->_titleLabel, "font");
}

- (void)setSubtitleFont:(id)a3
{
}

- (UIFont)subtitleFont
{
  return -[UILabel font](self->_artistLabel, "font");
}

- (void)setFullWidthStyle:(BOOL)a3
{
  if (self->_fullWidthStyle != a3)
  {
    BOOL v3 = a3;
    self->_fullWidthStyle = a3;
    -[NSArray makeObjectsPerformSelector:](self->_labels, "makeObjectsPerformSelector:", "removeFromSuperview");
    if (v3)
    {
      self->_hasOrdinal = 0;
      p_artistLabel = &self->_artistLabel;
      artistLabel = self->_artistLabel;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager calloutFont](&OBJC_CLASS___TVThemeManager, "calloutFont"));
      -[UILabel setFont:](artistLabel, "setFont:", v7);

      titleLabel = self->_titleLabel;
      p_titleLabel = &titleLabel;
    }

    else
    {
      ordinalLabel = self->_ordinalLabel;
      p_artistLabel = &self->_titleLabel;
      p_titleLabel = &ordinalLabel;
    }

    durationLabel = self->_durationLabel;
    p_titleLabel[1] = *p_artistLabel;
    p_titleLabel[2] = durationLabel;
    double v10 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:"));
    labels = self->_labels;
    self->_labels = v10;

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    v12 = self->_labels;
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        double v16 = 0LL;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v16);
          double v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell floatingView](self, "floatingView", (void)v20));
          double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 contentView]);
          [v19 addSubview:v17];

          double v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      }

      while (v14);
    }
  }

- (double)labelHorizontalGap
{
  double result = 40.0;
  if (!self->_fullWidthStyle) {
    return 8.0;
  }
  return result;
}

- (double)durationWidth
{
  return 92.0;
}

- (double)durationLeftMargin
{
  return 22.0;
}

- (double)titleWidth
{
  return 617.0 - v2;
}

- (double)artistWidth
{
  return 400.0 - v2;
}

- (BOOL)canBecomeFocused
{
  return -[TVMusicSongCell focusable](self, "focusable");
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicSongCell;
  -[TVMusicSongCell prepareForReuse](&v6, "prepareForReuse");
  self->_showPlayIconWhenFocused = 0;
  -[TVMusicSongCell setSongType:](self, "setSongType:", 0LL);
  -[TVMusicSongCell setHasOrdinal:](self, "setHasOrdinal:", 1LL);
  -[TVMusicSongCell setTitle:isExplicit:](self, "setTitle:isExplicit:", 0LL, 0LL);
  -[TVMusicSongCell setArtist:](self, "setArtist:", 0LL);
  -[TVMusicSongCell setHeading:](self, "setHeading:", 0LL);
  -[TVMusicSongCell setDuration:](self, "setDuration:", 0.0);
  -[TVMusicSongCell setThumbnail:](self, "setThumbnail:", 0LL);
  -[TVMusicSongCell setPopularity:](self, "setPopularity:", 0LL);
  -[TVMusicSongCell setPlaceholderImage:](self, "setPlaceholderImage:", 0LL);
  -[TVMusicSongCell setOrdinalValue:](self, "setOrdinalValue:", 0LL);
  -[TVMusicSongCell setMusicBarsVisible:](self, "setMusicBarsVisible:", 0LL);
  -[TVMusicSongCell setPlayIconVisible:](self, "setPlayIconVisible:", 0LL);
  -[TVMusicSongCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1LL);
  -[TVMusicSongCell clearArtworkCatalogs](self, "clearArtworkCatalogs");
  -[TVMusicSongCell setThumbnailImage:](self, "setThumbnailImage:", 0LL);
  -[TVMusicSongCell setSocialBadge:](self, "setSocialBadge:", 0LL);
  -[TVMusicSongCell setBadgeImage:](self, "setBadgeImage:", 0LL);
  -[TVMusicSongCell setFavorite:](self, "setFavorite:", 0LL);
  -[UILabel setEnablesMarqueeWhenAncestorFocused:](self->_titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 0LL);
  songIdentifier = self->_songIdentifier;
  self->_songIdentifier = 0LL;

  playbackItem = self->_playbackItem;
  self->_playbackItem = 0LL;

  playbackContainer = self->_playbackContainer;
  self->_playbackContainer = 0LL;

  self->_enabled = 1;
  self->_focusable = 1;
  self->_didConfigureOrdinal = 0;
  -[TVMusicSongCell _setColorsForCurrentTraitCollection](self, "_setColorsForCurrentTraitCollection");
}

- (double)cellHeight
{
  double v4 = v3;
  -[TVMusicSongCell bottomMargin](self, "bottomMargin");
  return v4 - v5;
}

- (void)setThumbnail:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    -[TVMusicSongCell cellHeight](self, "cellHeight");
    double v5 = v4;
    -[TVMusicSongCell cellHeight](self, "cellHeight");
    id v7 = -[TVImageScaleDecorator initWithScaleToSize:scaleMode:]( objc_alloc(&OBJC_CLASS___TVImageScaleDecorator),  "initWithScaleToSize:scaleMode:",  1LL,  v5,  v6);
    [v11 setDecorator:v7];
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVImageView imageProxy](self->_thumbnailView, "imageProxy"));
  if (v8 == v11)
  {
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageView imageProxy](self->_thumbnailView, "imageProxy"));
    unsigned __int8 v10 = [v9 isEqual:v11];

    if ((v10 & 1) == 0) {
      -[TVImageView setImageProxy:](self->_thumbnailView, "setImageProxy:", v11);
    }
  }

  -[TVMusicSongCell _updateVideoBadge](self, "_updateVideoBadge");
  -[TVMusicSongCell _updateOrdinalLabel](self, "_updateOrdinalLabel");
  -[TVMusicSongCell _updateMusicBarsView](self, "_updateMusicBarsView");
  -[TVMusicSongCell _configureSpecialBadgeIndicator](self, "_configureSpecialBadgeIndicator");
}

- (TVImageProxy)thumbnail
{
  return -[TVImageView imageProxy](self->_thumbnailView, "imageProxy");
}

- (void)setPlaceholderImage:(id)a3
{
  id v5 = a3;
  -[TVImageView setPlaceholderImage:](self->_thumbnailView, "setPlaceholderImage:", v5);

  -[TVMusicSongCell _updateOrdinalLabel](self, "_updateOrdinalLabel");
}

- (void)setHasOrdinal:(BOOL)a3
{
  if (self->_hasOrdinal != a3)
  {
    self->_hasOrdinal = a3;
    -[TVMusicSongCell setOrdinalVisible:](self, "setOrdinalVisible:");
    -[TVMusicSongCell _updateOrdinalLabel](self, "_updateOrdinalLabel");
    -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setSocialBadge:(id)a3
{
  id v5 = (TVMusicSocialBadge *)a3;
  socialBadge = self->_socialBadge;
  if (socialBadge != v5)
  {
    id v7 = v5;
    -[TVMusicSocialBadge removeFromSuperview](socialBadge, "removeFromSuperview");
    objc_storeStrong((id *)&self->_socialBadge, a3);
    -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
    id v5 = v7;
  }
}

- (void)setBadgeImage:(id)a3
{
  double v4 = (UIImage *)a3;
  id v5 = v4;
  if (self->_badgeImage != v4)
  {
    self->_badgeImage = v4;
    badgeImageView = self->_badgeImageView;
    uint64_t v15 = v5;
    if (v5)
    {
      if (!badgeImageView)
      {
        id v7 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v5);
        id v8 = self->_badgeImageView;
        self->_badgeImageView = v7;

        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_titleLabel, "superview"));
        [v9 addSubview:self->_badgeImageView];

        id v5 = v15;
        badgeImageView = self->_badgeImageView;
      }

      -[UIImageView setImage:](badgeImageView, "setImage:", v5);
      -[UIImage size](v15, "size");
      if (v10 > 0.0)
      {
        -[UIImage size](v15, "size");
        double v12 = v11 * 24.0;
        -[UIImage size](v15, "size");
        -[UIImageView setFrame:](self->_badgeImageView, "setFrame:", 0.0, 0.0, 24.0, v12 / v13);
      }
    }

    else
    {
      -[UIImageView removeFromSuperview](badgeImageView, "removeFromSuperview");
      id v14 = self->_badgeImageView;
      self->_badgeImageView = 0LL;
    }

    -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
    id v5 = v15;
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVMusicSongCell;
  id v6 = a4;
  id v7 = a3;
  -[TVMusicSongCell didUpdateFocusInContext:withAnimationCoordinator:]( &v16,  "didUpdateFocusInContext:withAnimationCoordinator:",  v7,  v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell floatingView](self, "floatingView"));
  else {
    uint64_t v9 = 0LL;
  }
  [v8 setControlState:v9 withAnimationCoordinator:v6];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000606A0;
  v15[3] = &unk_100268CF0;
  v15[4] = self;
  [v6 addCoordinatedAnimations:v15 completion:0];

  -[TVMusicSongCell setPlayIconVisible:]( self,  "setPlayIconVisible:",  -[TVMusicSongCell _shouldShowPlayIcon](self, "_shouldShowPlayIcon"));
  double v10 = (TVMusicSongCell *)objc_claimAutoreleasedReturnValue([v7 nextFocusedView]);

  titleLabel = self->_titleLabel;
  if (v10 == self)
  {
    -[UILabel setEnablesMarqueeWhenAncestorFocused:](titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    unsigned int v13 = [v12 isRunningTest];

    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v14 postNotificationName:@"TVMusicPerformanceTestCellFocused" object:self];
    }
  }

  else
  {
    -[UILabel setEnablesMarqueeWhenAncestorFocused:](titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 0LL);
  }

- (void)setThumbnailOverrideFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_thumbnailOverrideFrame = &self->_thumbnailOverrideFrame;
  if (!CGRectEqualToRect(self->_thumbnailOverrideFrame, a3))
  {
    p_thumbnailOverrideFrame->origin.CGFloat x = x;
    p_thumbnailOverrideFrame->origin.CGFloat y = y;
    p_thumbnailOverrideFrame->size.CGFloat width = width;
    p_thumbnailOverrideFrame->size.CGFloat height = height;
    v9.origin.CGFloat x = x;
    v9.origin.CGFloat y = y;
    v9.size.CGFloat width = width;
    v9.size.CGFloat height = height;
    self->_hasThumbnailOverrideFrame = !CGRectIsEmpty(v9);
    -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)layoutSubviews
{
  v220.receiver = self;
  v220.super_class = (Class)&OBJC_CLASS___TVMusicSongCell;
  -[TVMusicSongCell layoutSubviews](&v220, "layoutSubviews");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell contentView](self, "contentView"));
  [v3 bounds];
  double v5 = v4;

  unsigned int v6 = -[TVMusicSongCell _isRightToLeft](self, "_isRightToLeft");
  BOOL v7 = -[TVMusicSongCell hasOrdinal](self, "hasOrdinal") || self->_songType == 2;
  -[UIImageView frame](self->_playIconView, "frame");
  double v12 = v9;
  double v13 = v10;
  double v14 = v11;
  if (v6) {
    double v15 = v5 - CGRectGetWidth(*(CGRect *)&v8) + -34.0;
  }
  else {
    double v15 = 34.0;
  }
  double v201 = v15;
  double v214 = v12;
  -[UIImageView setFrame:](self->_playIconView, "setFrame:");
  -[TVMusicSongCell thumbnailSize](self, "thumbnailSize");
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  unsigned int v20 = -[TVMusicSongCell _hasThumbnail](self, "_hasThumbnail");
  double v21 = 0.0;
  if (v20)
  {
    -[_UIFloatingContentView focusedSizeIncrease](self->_floatingView, "focusedSizeIncrease", 0.0);
    double v23 = v22 + 4.0;
    BOOL v24 = v22 <= 42.0;
    double v21 = 46.0;
    if (!v24) {
      double v21 = v23;
    }
  }

  double v212 = v21;
  if (-[TVMusicSongCell hasThumbnailOverrideFrame](self, "hasThumbnailOverrideFrame"))
  {
    -[TVMusicSongCell thumbnailOverrideFrame](self, "thumbnailOverrideFrame");
    double v210 = v25;
    CGFloat v211 = v26;
    CGFloat v17 = v27;
    CGFloat v19 = v28;
  }

  else
  {
    double v210 = 0.0;
    CGFloat v211 = 0.0;
  }

  -[UILabel intrinsicContentSize](self->_durationLabel, "intrinsicContentSize");
  double v30 = v29;
  -[TVMusicSongCell durationWidth](self, "durationWidth");
  if (v30 >= v31) {
    double v31 = v30;
  }
  double v208 = v31;
  double v32 = 8.0;
  if (!-[TVMusicSongCell hasPlaylistOrdinal](self, "hasPlaylistOrdinal"))
  {
    if (self->_songType == 4) {
      double v32 = 34.0;
    }
    else {
      double v32 = 24.0;
    }
  }

  v222.origin.CGFloat x = v210;
  v222.origin.CGFloat y = v211;
  CGFloat v207 = v17;
  v222.size.CGFloat width = v17;
  CGFloat v213 = v19;
  v222.size.CGFloat height = v19;
  double v33 = v32 + CGRectGetMaxX(v222);
  if (-[TVMusicSongCell fullWidthStyle](self, "fullWidthStyle"))
  {
    -[TVMusicSongCell titleWidth](self, "titleWidth");
    double v35 = v34;
    -[TVMusicSongCell artistWidth](self, "artistWidth");
    double v37 = v36;
    double v38 = v212;
    if (v6) {
      double v38 = 0.0;
    }
    double v212 = v38;
    double v39 = v38 * 0.5;
    double v40 = v35 - v38 * 0.5;
    double v41 = fmax(v33, 90.0);
    double v42 = v5 - v40 - v41;
    if (!v6) {
      double v42 = v41;
    }
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v42, 0.0, v40, 40.0);
    -[TVMusicSongCell labelHorizontalGap](self, "labelHorizontalGap");
    double v43 = v37 - v39;
    double v204 = v40;
    double v45 = v41 + v40 + v44;
    double v46 = v5 - v43 - v45;
    if (!v6) {
      double v46 = v45;
    }
    -[UILabel setFrame:](self->_artistLabel, "setFrame:", v46, 0.0, v43, 40.0);
    -[TVMusicSongCell labelHorizontalGap](self, "labelHorizontalGap");
    double v48 = v45 + v43 + v47;
    if (v6)
    {
      -[TVMusicSongCell durationWidth](self, "durationWidth");
      double v48 = v5 - v49 - v48;
    }

    durationLabel = self->_durationLabel;
    -[TVMusicSongCell durationWidth](self, "durationWidth");
    -[UILabel setFrame:](durationLabel, "setFrame:", v48, 0.0, v51, 40.0);
    goto LABEL_50;
  }

  double v52 = v5;
  if ((-[UILabel isHidden](self->_durationLabel, "isHidden") & 1) == 0)
  {
    -[TVMusicSongCell durationLeftMargin](self, "durationLeftMargin");
    double v52 = v5 - v208 - v53;
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_badgeImageView, "image"));

  double v55 = v52 + -36.0;
  if (!v54) {
    double v55 = v52;
  }
  double v204 = v55;
  id v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell placeholderImage](self, "placeholderImage"));
  if (v56)
  {
  }

  else if (!-[TVMusicSongCell _hasThumbnail](self, "_hasThumbnail"))
  {
    if (v7)
    {
      if (v6)
      {
        -[TVMusicSongCell _ordinalWidth](self, "_ordinalWidth");
        double v194 = v5 - v193 + -40.0;
      }

      else
      {
        double v194 = 40.0;
      }

      ordinalLabel = self->_ordinalLabel;
      -[TVMusicSongCell _ordinalWidth](self, "_ordinalWidth");
      -[UILabel setFrame:](ordinalLabel, "setFrame:", v194, 0.0, v197, 40.0);
      -[TVMusicSongCell _ordinalWidth](self, "_ordinalWidth");
      double v199 = v198;
      -[TVMusicSongCell labelHorizontalGap](self, "labelHorizontalGap");
      double v59 = v199 + v200 + 40.0;
    }

    else
    {
      -[TVMusicSongCell _ordinalWidth](self, "_ordinalWidth");
      double v59 = v195;
    }

    goto LABEL_39;
  }

  -[TVMusicSongCell cellHeight](self, "cellHeight");
  double v58 = v32 + v57;
  if (v58 >= v33) {
    double v59 = v58;
  }
  else {
    double v59 = v33;
  }
LABEL_39:
  if (-[TVMusicSongCell hasPlaylistOrdinal](self, "hasPlaylistOrdinal"))
  {
    double v60 = v59;
    if (v6)
    {
      -[TVMusicSongCell _ordinalWidth](self, "_ordinalWidth");
      double v60 = v5 - v61 - v59;
    }

    __int128 v62 = self->_ordinalLabel;
    -[TVMusicSongCell _ordinalWidth](self, "_ordinalWidth");
    -[UILabel setFrame:](v62, "setFrame:", v60, 0.0, v63, 40.0);
    -[TVMusicSongCell _ordinalWidth](self, "_ordinalWidth");
    double v59 = v59 + v32 + v64;
  }

  if (-[TVMusicSongCell _hasVideoBadge](self, "_hasVideoBadge"))
  {
    -[TVMusicSongCell cellHeight](self, "cellHeight");
    -[UIImageView setFrame:](self->_videoBadgeView, "setFrame:", v59, 0.0, 32.0, v65);
    -[TVMusicSongCell labelHorizontalGap](self, "labelHorizontalGap");
    double v59 = v59 + v66 + 32.0;
  }

  -[TVMusicSongCell leftPaddingForTitle](self, "leftPaddingForTitle");
  if (v67 != 0.0)
  {
    -[TVMusicSongCell leftPaddingForTitle](self, "leftPaddingForTitle");
    double v59 = v68;
  }

  if (v6) {
    double v59 = v5 - v204 - v59;
  }
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v59, 0.0, v204, 40.0);
  -[UILabel setFrame:](self->_artistLabel, "setFrame:", v59, 0.0, v204, 40.0);
LABEL_50:
  __int128 v218 = 0u;
  __int128 v219 = 0u;
  __int128 v216 = 0u;
  __int128 v217 = 0u;
  v69 = self->_labels;
  id v70 = -[NSArray countByEnumeratingWithState:objects:count:]( v69,  "countByEnumeratingWithState:objects:count:",  &v216,  v221,  16LL);
  if (v70)
  {
    id v71 = v70;
    uint64_t v72 = *(void *)v217;
    do
    {
      for (i = 0LL; i != v71; i = (char *)i + 1)
      {
        if (*(void *)v217 != v72) {
          objc_enumerationMutation(v69);
        }
        -[TVMusicSongCell _layoutLabel:](self, "_layoutLabel:", *(void *)(*((void *)&v216 + 1) + 8LL * (void)i));
      }

      id v71 = -[NSArray countByEnumeratingWithState:objects:count:]( v69,  "countByEnumeratingWithState:objects:count:",  &v216,  v221,  16LL);
    }

    while (v71);
  }

  -[UILabel frame](self->_durationLabel, "frame");
  double v75 = v74;
  double rect = v76;
  double v78 = v77;
  double v80 = v79;
  if (v7)
  {
    double v81 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_ordinalLabel, "text"));

    if (v81)
    {
      id v82 = -[UILabel frame](self->_ordinalLabel, "frame");
      -[UIImageView setFrame:]( self->_playIconView,  "setFrame:",  UIRectCenteredIntegralRect(v82, v201, v214, v13, v14, v83, v84, v85, v86));
    }
  }

  double v215 = v5;
  if (self->_fullWidthStyle)
  {
    double v208 = v78;
    goto LABEL_71;
  }

  if (-[NSString length](self->_artist, "length"))
  {
    -[UILabel frame](self->_titleLabel, "frame");
    CGFloat v88 = v87;
    CGFloat v90 = v89;
    CGFloat v92 = v91;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
    v223.origin.CGFloat y = 8.0;
    v223.origin.CGFloat x = v88;
    v223.size.CGFloat width = v90;
    v223.size.CGFloat height = v92;
    CGRect v224 = CGRectOffset(v223, 0.0, 38.0);
    p_artistLabel = &self->_artistLabel;
    double v94 = v208;
LABEL_66:
    -[UILabel setFrame:](*p_artistLabel, "setFrame:", v224.origin.x, v224.origin.y, v224.size.width, v224.size.height);
    goto LABEL_67;
  }

  double v94 = v208;
  if (-[NSString length](self->_heading, "length"))
  {
    p_artistLabel = &self->_titleLabel;
    -[UILabel frame](self->_titleLabel, "frame");
    CGFloat v96 = v95;
    CGFloat v98 = v97;
    CGFloat v100 = v99;
    -[UILabel setFrame:](self->_headingLabel, "setFrame:");
    v225.origin.CGFloat y = 8.0;
    v225.origin.CGFloat x = v96;
    v225.size.CGFloat width = v98;
    v225.size.CGFloat height = v100;
    CGRect v224 = CGRectOffset(v225, 0.0, 38.0);
    goto LABEL_66;
  }

- (BOOL)_isRightToLeft
{
  return -[TVMusicSongCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1;
}

- (void)_adjustThumbnailForFocusState
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell socialBadge](self, "socialBadge"));

  if (v3)
  {
    if ((-[TVImageView frame](self->_thumbnailView, "frame"),
          double v6 = v5,
          double v8 = v7,
          double v10 = v9,
          double v12 = v11,
          -[TVMusicSongCell isFocused](self, "isFocused"))
      && (double v4 = 10.0, v6 == 0.0)
      || (-[TVMusicSongCell isFocused](self, "isFocused") & 1) == 0 && (double v4 = 0.0, v6 == 10.0))
    {
      -[TVImageView setFrame:](self->_thumbnailView, "setFrame:", v4, v8, v10, v12);
    }
  }

  if (-[TVMusicSongCell isFocused](self, "isFocused", v4))
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell socialBadge](self, "socialBadge"));
    if (v13)
    {
      -[TVMusicSongCell thumbnailCornerRadius](self, "thumbnailCornerRadius");
      double v15 = v14;
    }

    else
    {
      double v15 = 0.0;
    }
  }

  else
  {
    -[TVMusicSongCell thumbnailCornerRadius](self, "thumbnailCornerRadius");
    double v15 = v16;
  }

  -[TVImageView _continuousCornerRadius](self->_thumbnailView, "_continuousCornerRadius");
  if (v17 != v15) {
    -[TVImageView _setContinuousCornerRadius:](self->_thumbnailView, "_setContinuousCornerRadius:", v15);
  }
}

- (id)_checkmarkImageWithGradient
{
  if (qword_1002BE958)
  {
    id v2 = (id)qword_1002BE958;
  }

  else
  {
    -[TVImageView frame](self->_thumbnailView, "frame");
    double v5 = v4;
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:weight:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:weight:",  7LL,  28.0));
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"checkmark.circle.fill",  v6));

    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 imageWithTintColor:v8 renderingMode:2]);

    [v9 size];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    id v14 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v31[0] = [v14 CGColor];
    id v15 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.8));
    v31[1] = [v15 CGColor];
    double v16 = (const __CFArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v31,  2LL));

    CGGradientRef v17 = CGGradientCreateWithColors(0LL, v16, 0LL);
    double v18 = -[UIGraphicsImageRenderer initWithSize:]( objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer),  "initWithSize:",  v5,  v5);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10006194C;
    v21[3] = &unk_10026B5E0;
    double v23 = self;
    CGGradientRef v24 = v17;
    double v25 = v5 * 0.5;
    double v26 = v5 * 0.5;
    double v27 = v5;
    double v28 = v5;
    id v22 = v9;
    uint64_t v29 = v11;
    uint64_t v30 = v13;
    id v19 = v9;
    id v2 = (id)objc_claimAutoreleasedReturnValue(-[UIGraphicsImageRenderer imageWithActions:](v18, "imageWithActions:", v21));
    objc_storeStrong((id *)&qword_1002BE958, v2);
  }

  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicSongCell;
  id v4 = a3;
  -[TVMusicSongCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell traitCollection](self, "traitCollection"));
    -[TVMusicSongCell _updateColorsForTraitCollection:](self, "_updateColorsForTraitCollection:", v8);
  }

- (void)setTitle:(id)a3
{
  id v4 = a3;
  -[TVMusicSongCell setTitle:isExplicit:]( self,  "setTitle:isExplicit:",  v4,  -[TVMusicSongCell isExplicit](self, "isExplicit"));
}

- (void)setTitle:(id)a3 isExplicit:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (NSString *)a3;
  title = self->_title;
  uint64_t v11 = v7;
  if (title != v7 && !-[NSString isEqualToString:](title, "isEqualToString:", v7) || self->_isExplicit != v4)
  {
    objc_super v9 = self->_title;
    objc_storeStrong((id *)&self->_title, a3);
    self->_isExplicit = v4;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell _decoratedTitleString](self, "_decoratedTitleString"));
    -[UILabel setText:](self->_titleLabel, "setText:", v10);

    -[TVMusicSongCell _updateTitleColor](self, "_updateTitleColor");
    if (v11 && !v9) {
      -[TVMusicSongCell _updatePlayingState](self, "_updatePlayingState");
    }
    -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setArtist:(id)a3
{
  double v5 = (NSString *)a3;
  artist = self->_artist;
  if (artist != v5)
  {
    uint64_t v11 = v5;
    unsigned __int8 v7 = -[NSString isEqualToString:](artist, "isEqualToString:");
    double v5 = v11;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_artist, a3);
      if (-[NSString length](v11, "length"))
      {
        double v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_artistLabel, "superview"));

        if (!v8)
        {
          objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell floatingView](self, "floatingView"));
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 contentView]);
          [v10 addSubview:self->_artistLabel];
        }
      }

      -[UILabel setText:](self->_artistLabel, "setText:", v11);
      -[UILabel setHidden:](self->_artistLabel, "setHidden:", -[NSString length](v11, "length") == 0);
      double v5 = v11;
    }
  }
}

- (void)setHeading:(id)a3
{
  double v5 = (NSString *)a3;
  heading = self->_heading;
  if (heading != v5)
  {
    id v19 = v5;
    unsigned __int8 v7 = -[NSString isEqualToString:](heading, "isEqualToString:", v5);
    double v5 = v19;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_heading, a3);
      if (v19 && !self->_headingLabel)
      {
        -[UILabel frame](self->_titleLabel, "frame");
        double v9 = v8;
        -[UILabel frame](self->_titleLabel, "frame");
        uint64_t v11 = (UILabel *)objc_claimAutoreleasedReturnValue( -[TVMusicSongCell _createLabelAtPosition:width:]( self,  "_createLabelAtPosition:width:",  v9,  v10));
        headingLabel = self->_headingLabel;
        self->_headingLabel = v11;

        -[UILabel setLineBreakMode:](self->_headingLabel, "setLineBreakMode:", 2LL);
        uint64_t v13 = self->_headingLabel;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager caption1Font](&OBJC_CLASS___TVThemeManager, "caption1Font"));
        -[UILabel setFont:](v13, "setFont:", v14);

        -[UILabel setLineBreakMode:](self->_headingLabel, "setLineBreakMode:", 4LL);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](self->_floatingView, "contentView"));
        [v15 addSubview:self->_headingLabel];

        double v16 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self->_labels, "arrayByAddingObject:", self->_headingLabel));
        labels = self->_labels;
        self->_labels = v16;
      }

      double v18 = self->_headingLabel;
      if (v18) {
        -[UILabel setText:](v18, "setText:", v19);
      }
      -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
      double v5 = v19;
    }
  }
}

- (void)setPopularity:(id)a3
{
  double v8 = (NSNumber *)a3;
  unsigned __int8 v4 = -[TVMusicSongCell favorite](self, "favorite");
  double v5 = v8;
  if ((v4 & 1) == 0)
  {
    popularitCGFloat y = self->_popularity;
    if (popularity != v8)
    {
      if (!v8 || (unsigned __int8 v7 = -[NSNumber isEqualToNumber:](popularity, "isEqualToNumber:", v8), v5 = v8, (v7 & 1) == 0))
      {
        -[TVMusicSongCell _setPopularityUnconditionally:](self, "_setPopularityUnconditionally:", v8);
        double v5 = v8;
      }
    }
  }
}

- (void)_setPopularityUnconditionally:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_popularity, a3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TVMusicSongCell popularityThreshold](self, "popularityThreshold"));
  id v6 = (void *)v5;
  unsigned __int8 v7 = &off_1002824A0;
  if (v5) {
    unsigned __int8 v7 = (_UNKNOWN **)v5;
  }
  double v8 = v7;

  id v9 = [v13 compare:v8];
  if (!v13 || v9 == (id)-1LL)
  {
    -[TVMusicSongCell _setSpecialBadgeIndicator:image:](self, "_setSpecialBadgeIndicator:image:", 0LL, 0LL);
  }

  else
  {
    else {
      double v10 = @"star.fill";
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  14.0));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  v10,  v11));

    -[TVMusicSongCell _setSpecialBadgeIndicator:image:](self, "_setSpecialBadgeIndicator:image:", 1LL, v12);
  }
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
  -[TVMusicSongCell _configureSpecialBadgeIndicator](self, "_configureSpecialBadgeIndicator");
}

- (void)_configureSpecialBadgeIndicator
{
  if (self->_favorite)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  14.0));
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"star.fill",  v3));

    -[TVMusicSongCell _setSpecialBadgeIndicator:image:](self, "_setSpecialBadgeIndicator:image:", 1LL, v4);
  }

  else if (self->_popularity)
  {
    -[TVMusicSongCell _setPopularityUnconditionally:](self, "_setPopularityUnconditionally:");
  }

  else
  {
    -[UIImageView removeFromSuperview](self->_specialBadgeView, "removeFromSuperview");
  }

- (void)_layoutSpecialBadgeIndicator
{
  specialBadgeView = self->_specialBadgeView;
  if (specialBadgeView)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](specialBadgeView, "superview"));

    if (v4)
    {
      -[UIImageView frame](self->_specialBadgeView, "frame");
      double v6 = v5;
      double v8 = v7;
      unsigned int v9 = -[TVMusicSongCell _hasThumbnail](self, "_hasThumbnail");
      unsigned int v10 = -[TVMusicSongCell isFocused](self, "isFocused");
      if (v9)
      {
        double v11 = 0.0;
        if ((v10 & 1) == 0)
        {
          -[_UIFloatingContentView focusedSizeIncrease](self->_floatingView, "focusedSizeIncrease");
          double v11 = v12 * 0.5;
        }

        thumbnailView = self->_thumbnailView;
      }

      else
      {
        id v14 = &OBJC_IVAR___TVMusicSongCell__ordinalLabel;
        if (v10)
        {
          id v14 = &OBJC_IVAR___TVMusicSongCell__playIconView;
          double v15 = -10.0;
        }

        else
        {
          double v15 = -14.0;
        }

        [*(id *)((char *)&self->super.super.super.super.super.isa + *v14) frame];
        double v17 = v16;
        -[UIImageView frame](self->_specialBadgeView, "frame");
        double v11 = v17 - v18 + v15;
        thumbnailView = self;
      }

      [thumbnailView frame];
      double v20 = v19;
      -[UIImageView frame](self->_specialBadgeView, "frame");
      -[UIImageView setFrame:](self->_specialBadgeView, "setFrame:", v11, (v20 - v21) * 0.5, v6, v8);
    }
  }

- (void)_setSpecialBadgeIndicator:(BOOL)a3 image:(id)a4
{
  id v6 = a4;
  specialBadgeView = self->_specialBadgeView;
  id v16 = v6;
  if (v6 && a3)
  {
    if (!specialBadgeView)
    {
      double v8 = objc_alloc_init(&OBJC_CLASS___UIImageView);
      unsigned int v9 = self->_specialBadgeView;
      self->_specialBadgeView = v8;
    }

    if (-[TVMusicSongCell _hasThumbnail](self, "_hasThumbnail"))
    {
      unsigned int v10 = (TVMusicSongCell *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](self->_specialBadgeView, "superview"));

      if (v10 != self) {
        -[TVMusicSongCell addSubview:](self, "addSubview:", self->_specialBadgeView);
      }
    }

    else
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell floatingView](self, "floatingView"));
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contentView]);

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](self->_specialBadgeView, "superview"));
      if (v13 != v12) {
        [v12 addSubview:self->_specialBadgeView];
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v16 imageWithRenderingMode:2]);
    -[UIImageView setImage:](self->_specialBadgeView, "setImage:", v14);

    -[UIImageView sizeToFit](self->_specialBadgeView, "sizeToFit");
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell traitCollection](self, "traitCollection"));
    -[TVMusicSongCell _updateColorsForTraitCollection:](self, "_updateColorsForTraitCollection:", v15);

    goto LABEL_14;
  }

  if (specialBadgeView)
  {
    -[UIImageView removeFromSuperview](specialBadgeView, "removeFromSuperview");
LABEL_14:
    -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateOrdinalLabel
{
  if (-[TVMusicSongCell hasPlaylistOrdinal](self, "hasPlaylistOrdinal"))
  {
    if (!self->_didConfigureOrdinal)
    {
      double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_ordinalLabel, "font"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 familyName]);

      double v5 = objc_alloc(&OBJC_CLASS___UIFontDescriptor);
      v14[0] = UIFontDescriptorTraitsAttribute;
      UIFontDescriptorTraitKey v12 = UIFontWeightTrait;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightHeavy));
      id v13 = v6;
      double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
      v14[1] = UIFontDescriptorFamilyAttribute;
      v15[0] = v7;
      v15[1] = v4;
      double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
      unsigned int v9 = -[UIFontDescriptor initWithFontAttributes:](v5, "initWithFontAttributes:", v8);

      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_ordinalLabel, "font"));
      [v10 pointSize];
      double v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v9));

      -[UILabel setFont:](self->_ordinalLabel, "setFont:", v11);
      -[TVMusicSongCell _setColorsForCurrentTraitCollection](self, "_setColorsForCurrentTraitCollection");
      self->_didConfigureOrdinal = 1;
    }
  }

- (double)_ordinalWidth
{
  unint64_t ordinalValue = self->_ordinalValue;
  unsigned int v3 = -[TVMusicSongCell hasPlaylistOrdinal](self, "hasPlaylistOrdinal");
  double result = 43.0;
  if (v3) {
    double result = 51.0;
  }
  double v5 = 63.0;
  if (v3) {
    double v5 = 75.0;
  }
  if (ordinalValue >= 0x64) {
    return v5;
  }
  return result;
}

- (void)setOrdinalValue:(unint64_t)a3
{
  if (self->_ordinalValue != a3)
  {
    self->_unint64_t ordinalValue = a3;
    -[TVMusicSongCell _updateOrdinalLabel](self, "_updateOrdinalLabel");
    if (a3)
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
      id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSNumberFormatter localizedStringFromNumber:numberStyle:]( &OBJC_CLASS___NSNumberFormatter,  "localizedStringFromNumber:numberStyle:",  v5,  1LL));

      -[UILabel setText:](self->_ordinalLabel, "setText:", v9);
      -[UILabel frame](self->_ordinalLabel, "frame");
      double v7 = v6;
      -[TVMusicSongCell _ordinalWidth](self, "_ordinalWidth");
      if (v7 != v8) {
        -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
      }
    }

    else
    {
      -[UILabel setText:](self->_ordinalLabel, "setText:", @" ");
    }
  }

- (BOOL)hasPlaylistOrdinal
{
  if (!-[TVMusicSongCell hasOrdinal](self, "hasOrdinal") || !-[TVMusicSongCell ordinalValue](self, "ordinalValue")) {
    return 0;
  }
  if (-[TVMusicSongCell _hasThumbnail](self, "_hasThumbnail")) {
    return 1;
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell placeholderImage](self, "placeholderImage"));
  BOOL v3 = v5 != 0LL;

  return v3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  if (a3 <= 0.0)
  {
    id v7 = 0LL;
  }

  else
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVDurationValueTransformer"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    id v7 = (id)objc_claimAutoreleasedReturnValue([v5 transformedValue:v6]);
  }

  -[TVMusicSongCell setDurationString:](self, "setDurationString:", v7);
}

- (void)setDurationString:(id)a3
{
  id v5 = a3;
  -[UILabel setText:](self->_durationLabel, "setText:", v5);
  -[UILabel setHidden:](self->_durationLabel, "setHidden:", v5 == 0LL);
}

- (void)setIsExplicit:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell title](self, "title"));
  -[TVMusicSongCell setTitle:isExplicit:](self, "setTitle:isExplicit:", v5, v3);
}

- (void)setSongIdentifier:(id)a3
{
  id v5 = (MPIdentifierSet *)a3;
  if (self->_songIdentifier != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_songIdentifier, a3);
    playbackItem = self->_playbackItem;
    self->_playbackItem = 0LL;

    playbackContainer = self->_playbackContainer;
    self->_playbackContainer = 0LL;

    -[TVMusicSongCell _updatePlayingState](self, "_updatePlayingState");
    id v5 = v8;
  }
}

- (void)setPlayItem:(id)a3 inContainer:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (*(_OWORD *)&self->_playbackItem != __PAIR128__((unint64_t)v7, (unint64_t)v9))
  {
    objc_storeStrong((id *)&self->_playbackItem, a3);
    objc_storeStrong((id *)&self->_playbackContainer, a4);
    songIdentifier = self->_songIdentifier;
    self->_songIdentifier = 0LL;

    -[TVMusicSongCell _updatePlayingState](self, "_updatePlayingState");
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[TVMusicSongCell _setColorsForCurrentTraitCollection](self, "_setColorsForCurrentTraitCollection");
    -[TVMusicSongCell setPlayIconVisible:]( self,  "setPlayIconVisible:",  -[TVMusicSongCell _shouldShowPlayIcon](self, "_shouldShowPlayIcon"));
  }

- (void)setSongType:(int64_t)a3
{
  self->_songType = a3;
  -[TVMusicSongCell _updateVideoBadge](self, "_updateVideoBadge");
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  if (self->_floatingView)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_UIFloatingContentView _preferredConfigurationForFocusAnimation:inContext:]( self->_floatingView,  "_preferredConfigurationForFocusAnimation:inContext:",  a3,  a4));
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVMusicSongCell;
    id v5 = -[TVMusicSongCell _preferredConfigurationForFocusAnimation:inContext:]( &v7,  "_preferredConfigurationForFocusAnimation:inContext:",  a3,  a4);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](self->_floatingView, "contentView", 0LL));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 subviews]);

  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      double v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) setSelected:v5 animated:v4];
        double v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 anyObject]);
  unint64_t v9 = (unint64_t)[v8 type];

  if ([v6 count] == (id)1
    && (v9 & 0xFFFFFFFFFFFFFFFDLL) == 4
    && -[TVMusicSongCell isFocused](self, "isFocused"))
  {
    -[_UIFloatingContentView setControlState:animated:]( self->_floatingView,  "setControlState:animated:",  -[TVMusicSongCell _floatingViewControlState](self, "_floatingViewControlState") | 1,  1LL);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicSongCell;
  -[TVMusicSongCell pressesBegan:withEvent:](&v10, "pressesBegan:withEvent:", v6, v7);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicSongCell;
  id v6 = a3;
  -[TVMusicSongCell pressesCancelled:withEvent:](&v10, "pressesCancelled:withEvent:", v6, a4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject", v10.receiver, v10.super_class));
  unint64_t v8 = (unint64_t)[v7 type];

  id v9 = [v6 count];
  if (v9 == (id)1 && (v8 & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    -[_UIFloatingContentView setControlState:animated:]( self->_floatingView,  "setControlState:animated:",  -[TVMusicSongCell _floatingViewControlState](self, "_floatingViewControlState"),  1LL);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicSongCell;
  id v6 = a3;
  -[TVMusicSongCell pressesEnded:withEvent:](&v10, "pressesEnded:withEvent:", v6, a4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject", v10.receiver, v10.super_class));
  unint64_t v8 = (unint64_t)[v7 type];

  id v9 = [v6 count];
  if (v9 == (id)1 && (v8 & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    -[_UIFloatingContentView setControlState:animated:]( self->_floatingView,  "setControlState:animated:",  -[TVMusicSongCell _floatingViewControlState](self, "_floatingViewControlState"),  1LL);
  }
}

- (void)setThumbnailImage:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (v4)
  {
    int64_t v5 = -[TVImageView contentMode](self->_thumbnailView, "contentMode");
    id v4 = v15;
    if (v5 == 1)
    {
      -[TVImageView frame](self->_thumbnailView, "frame");
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      [v15 size];
      double v13 = v11 * v12;
      [v15 size];
      -[TVImageView setFrame:](self->_thumbnailView, "setFrame:", v7, v9, v13 / v14, v11);
      -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
      id v4 = v15;
    }
  }

  -[TVImageView setImage:](self->_thumbnailView, "setImage:", v4);
  -[TVMusicSongCell _updateVideoBadge](self, "_updateVideoBadge");
  -[TVMusicSongCell _updateOrdinalLabel](self, "_updateOrdinalLabel");
  -[TVMusicSongCell _configureSpecialBadgeIndicator](self, "_configureSpecialBadgeIndicator");
}

- (UIImage)thumbnailImage
{
  return -[TVImageView image](self->_thumbnailView, "image");
}

- (TVImageView)thumbnailImageView
{
  return self->_thumbnailView;
}

- (id)_createLabelAtPosition:(double)a3 width:(double)a4
{
  id v4 = -[UILabel initWithFrame:](objc_alloc(&OBJC_CLASS___UILabel), "initWithFrame:", a3, 0.0, a4, 40.0);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager calloutFont](&OBJC_CLASS___TVThemeManager, "calloutFont"));
  -[UILabel setFont:](v4, "setFont:", v5);

  return v4;
}

- (void)_layoutLabel:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v12 text]);

  if (v4)
  {
    [v12 frame];
    double v6 = v5;
    double v8 = v7;
    [v12 intrinsicContentSize];
    double v10 = v9;
    -[TVMusicSongCell cellHeight](self, "cellHeight");
    objc_msgSend(v12, "setFrame:", v6, floor((v11 - v10) * 0.5), v8, v10);
  }
}

- (UIColor)currentTitleColor
{
  if (!self->_titleColor || (-[TVMusicSongCell isFocused](self, "isFocused") & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell traitCollection](self, "traitCollection"));
    id v5 = [v4 userInterfaceStyle];

    if (!self->_enabled)
    {
      if (v5 == (id)2) {
        double v10 = 1.0;
      }
      else {
        double v10 = 0.0;
      }
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v10, 0.2));
      return (UIColor *)v6;
    }

    if (self->_fullWidthStyle || v5 == (id)2) {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityBColor](&OBJC_CLASS___TVThemeManager, "textOpacityBColor"));
    }
    else {
LABEL_7:
    }
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    return (UIColor *)v6;
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell traitCollection](self, "traitCollection"));
  if ([v7 accessibilityContrast] == (id)1) {
    double v8 = (UIColor *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityAColor](&OBJC_CLASS___TVThemeManager, "textOpacityAColor"));
  }
  else {
    double v8 = self->_titleColor;
  }
  double v9 = v8;

  return v9;
}

- (void)_updateColorsForTraitCollection:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell currentTitleColor](self, "currentTitleColor"));
  if (-[TVMusicSongCell isFocused](self, "isFocused"))
  {
    if ([v4 accessibilityContrast] == (id)1)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
LABEL_7:
      id v8 = (id)v7;
LABEL_40:
      if (self->_enabled || !-[TVMusicSongCell isFocused](self, "isFocused"))
      {
        uint64_t v27 = objc_claimAutoreleasedReturnValue(-[TVMusicSongCell ordinalColor](self, "ordinalColor"));
        double v28 = (void *)v27;
        if (v27) {
          uint64_t v29 = (void *)v27;
        }
        else {
          uint64_t v29 = v6;
        }
        id v12 = v29;
      }

      else
      {
        id v6 = v6;
        id v12 = v6;
      }

      goto LABEL_47;
    }

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell subtitleHighlightColor](self, "subtitleHighlightColor"));
    double v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6));
    }
    id v6 = v11;

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell durationHighlightColor](self, "durationHighlightColor"));
    if (!v16)
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6));
LABEL_24:
      id v8 = v17;

      goto LABEL_40;
    }

- (BOOL)_isFullWidthRTL
{
  if (self->_fullWidthStyle) {
    return -[TVMusicSongCell _isRightToLeft](self, "_isRightToLeft");
  }
  else {
    return 0;
  }
}

- (void)_setColorsForCurrentTraitCollection
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v4 traitCollection]);
  -[TVMusicSongCell _updateColorsForTraitCollection:](self, "_updateColorsForTraitCollection:", v3);
}

- (void)setOrdinalVisible:(BOOL)a3
{
  self->_ordinalVisible = a3;
  -[UILabel setHidden:](self->_ordinalLabel, "setHidden:", !a3);
}

- (void)setMusicBarsVisible:(BOOL)a3
{
  self->_musicBarsVisible = a3;
  -[TVMusicSongCell _updateMusicBarsView](self, "_updateMusicBarsView");
}

- (void)setPlayIconVisible:(BOOL)a3
{
  if (a3)
  {
    if (!self->_playIconVisible)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](self->_playIconView, "superview"));

      if (!v5)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell floatingView](self, "floatingView"));
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contentView]);
        [v7 addSubview:self->_playIconView];

        -[UIImageView frame](self->_playIconView, "frame");
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        -[TVMusicSongCell cellHeight](self, "cellHeight");
        -[UIImageView setFrame:](self->_playIconView, "setFrame:", v9, floor((v14 - v13) * 0.5), v11, v13);
      }

      uint64_t v15 = 0LL;
      goto LABEL_8;
    }
  }

  else if (self->_playIconVisible)
  {
    -[UIImageView removeFromSuperview](self->_playIconView, "removeFromSuperview");
    uint64_t v15 = -[TVMusicSongCell musicBarsVisible](self, "musicBarsVisible") ^ 1;
LABEL_8:
    -[TVMusicSongCell setOrdinalVisible:](self, "setOrdinalVisible:", v15);
  }

  self->_playIconVisible = a3;
}

- (CGSize)thumbnailSize
{
  if (-[TVMusicSongCell hasThumbnailOverrideFrame](self, "hasThumbnailOverrideFrame"))
  {
    -[TVMusicSongCell thumbnailOverrideFrame](self, "thumbnailOverrideFrame");
    double v4 = v3;
    double v6 = v5;
  }

  else
  {
    -[TVMusicSongCell cellHeight](self, "cellHeight");
    double v6 = v4;
    int64_t songType = self->_songType;
    if (songType == 4 || songType == 1) {
      double v4 = ceil(v4 * 16.0 / 9.0);
    }
  }

  result.CGFloat height = v6;
  result.CGFloat width = v4;
  return result;
}

- (void)_updatePlayingState
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell title](self, "title"));

  if (!v3) {
    goto LABEL_8;
  }
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell songIdentifier](self, "songIdentifier"));

  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell songIdentifier](self, "songIdentifier"));
    id v7 = [v5 isItemPlayingWithIdentifiers:v6];
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell playbackItem](self, "playbackItem"));

    if (!v8)
    {
      id v7 = 0LL;
      goto LABEL_7;
    }

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell playbackContainer](self, "playbackContainer"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v9));

    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell playbackItem](self, "playbackItem"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiers]);
    id v7 = [v6 isItemPlayingWithIdentifiers:v11 inContainer:v5];
  }

LABEL_7:
  -[TVMusicSongCell setMusicBarsVisible:](self, "setMusicBarsVisible:", v7);
LABEL_8:
  if (!self->_isObservingPlayer)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:self selector:"_playbackStatusChanged:" name:off_1002B6870 object:0];

    self->_isObservingPlayer = 1;
  }

- (BOOL)_shouldShowPlayIcon
{
  if (!self->_showPlayIconWhenFocused) {
    goto LABEL_4;
  }
  unsigned int v3 = -[TVMusicSongCell isFocused](self, "isFocused");
  if (v3)
  {
    if (self->_musicBarsView)
    {
LABEL_4:
      LOBYTE(v3) = 0;
      return v3;
    }

    LOBYTE(v3) = self->_enabled;
  }

  return v3;
}

- (unint64_t)_floatingViewControlState
{
  else {
    return 0LL;
  }
}

- (BOOL)_hasThumbnail
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell thumbnail](self, "thumbnail"));
  if (v3)
  {
    BOOL v4 = 1;
  }

  else
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell thumbnailImage](self, "thumbnailImage"));
    BOOL v4 = v5 != 0LL;
  }

  return v4;
}

- (BOOL)_hasVideoBadge
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](self->_videoBadgeView, "superview"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)_updateVideoBadge
{
  if ((id)-[TVMusicSongCell songType](self, "songType") == (id)1)
  {
    unsigned int v3 = -[TVMusicSongCell _hasThumbnail](self, "_hasThumbnail");
    if (v3 != -[TVMusicSongCell _hasVideoBadge](self, "_hasVideoBadge")) {
      return;
    }
    if ((v3 & 1) == 0)
    {
      videoBadgeView = self->_videoBadgeView;
      if (!videoBadgeView)
      {
        double v5 = objc_opt_new(&OBJC_CLASS___UIImageView);
        double v6 = self->_videoBadgeView;
        self->_videoBadgeView = v5;

        -[UIImageView setContentMode:](self->_videoBadgeView, "setContentMode:", 1LL);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell titleFont](self, "titleFont"));
        double v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v7));
        double v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"tv",  v8));
        -[UIImageView setImage:](self->_videoBadgeView, "setImage:", v9);

        videoBadgeView = self->_videoBadgeView;
      }

      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](videoBadgeView, "superview"));

      if (!v10)
      {
        double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell floatingView](self, "floatingView"));
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contentView]);
        [v12 addSubview:self->_videoBadgeView];
      }

      goto LABEL_10;
    }
  }

  else if (!-[TVMusicSongCell _hasVideoBadge](self, "_hasVideoBadge"))
  {
    return;
  }

  -[UIImageView removeFromSuperview](self->_videoBadgeView, "removeFromSuperview");
LABEL_10:
  -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateMusicBarsView
{
  BOOL musicBarsVisible = self->_musicBarsVisible;
  musicBarsView = self->_musicBarsView;
  if (musicBarsVisible)
  {
    if (!musicBarsView)
    {
      double v10 = -[TVMusicBarsView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVMusicBarsView),  "initWithFrame:",  0.0,  0.0,  25.0,  18.0);
      double v11 = self->_musicBarsView;
      self->_musicBarsView = v10;

      if (-[TVMusicSongCell _hasThumbnail](self, "_hasThumbnail"))
      {
        double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell contentView](self, "contentView"));
        [v12 addSubview:self->_musicBarsView];
      }

      else
      {
        double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell floatingView](self, "floatingView"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 contentView]);
        [v16 addSubview:self->_musicBarsView];
      }

      -[TVMusicSongCell setPlayIconVisible:](self, "setPlayIconVisible:", 0LL);
      if (self->_hasOrdinal && !-[TVMusicSongCell hasPlaylistOrdinal](self, "hasPlaylistOrdinal")) {
        -[TVMusicSongCell setOrdinalVisible:](self, "setOrdinalVisible:", 0LL);
      }
      -[TVMusicSongCell setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_19;
    }

    unsigned int v5 = -[TVMusicSongCell _hasThumbnail](self, "_hasThumbnail");
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView superview](self->_musicBarsView, "superview"));
    if (v5)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell contentView](self, "contentView"));

      if (v6 != v7)
      {
        double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell contentView](self, "contentView"));
        [v8 addSubview:self->_musicBarsView];
LABEL_12:
      }
    }

    else
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell floatingView](self, "floatingView"));
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 contentView]);

      if (v6 != v14)
      {
        double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell floatingView](self, "floatingView"));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 contentView]);
        [v15 addSubview:self->_musicBarsView];

        goto LABEL_12;
      }
    }

- (void)_layoutMusicBarsView
{
  if (self->_musicBarsView)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell contentView](self, "contentView"));
    [v3 bounds];
    double v5 = v4;

    unsigned int v6 = -[TVMusicSongCell _isRightToLeft](self, "_isRightToLeft");
    if (-[TVMusicSongCell _hasThumbnail](self, "_hasThumbnail"))
    {
      if (v6)
      {
        if (self->_fullWidthStyle) {
          double v7 = v5 + 6.0;
        }
        else {
          double v7 = v5 + -25.0 + 46.0;
        }
        double v8 = 20.0;
      }

      else
      {
        double v8 = -20.0;
        double v7 = -46.0;
      }

      unsigned int v22 = -[TVMusicSongCell isFocused](self, "isFocused");
      double v23 = -0.0;
      if (v22) {
        double v23 = v8;
      }
      double v24 = v7 + v23;
      double v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView superview](self->_musicBarsView, "superview"));
      id v26 = [v25 bounds];
      double v15 = UIRectCenteredYInRect(v26, v24, 0.0, 25.0, 18.0, v27, v28, v29, v30);
      double v17 = v31;
      double v19 = v32;
      double v21 = v33;
    }

    else
    {
      if (v6) {
        double v9 = v5 + -25.0 + -10.0;
      }
      else {
        double v9 = 10.0;
      }
      id v10 = -[UILabel frame](self->_ordinalLabel, "frame");
      double v15 = UIRectCenteredIntegralRect(v10, v9, 0.0, 25.0, 18.0, v11, v12, v13, v14);
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
    }

    -[TVMusicBarsView setFrame:](self->_musicBarsView, "setFrame:", v15, v17, v19, v21);
  }

- (id)_decoratedTitleString
{
  if (-[TVMusicSongCell isExplicit](self, "isExplicit")) {
    unsigned int v3 = (NSString *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryUtilities stringWithAppendedExplicitIndicator:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "stringWithAppendedExplicitIndicator:",  self->_title));
  }
  else {
    unsigned int v3 = self->_title;
  }
  return v3;
}

- (void)_updateTitleColor
{
  if (-[TVMusicSongCell isExplicit](self, "isExplicit")
    && (unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell traitCollection](self, "traitCollection")),
        id v4 = [v3 accessibilityContrast],
        v3,
        v4 != (id)1))
  {
    double v5 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell _decoratedTitleString](self, "_decoratedTitleString"));
    double v7 = -[NSMutableAttributedString initWithString:](v5, "initWithString:", v6);

    NSAttributedStringKey v15 = NSForegroundColorAttributeName;
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell currentTitleColor](self, "currentTitleColor"));
    double v16 = v8;
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));

    NSAttributedStringKey v13 = NSForegroundColorAttributeName;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](&OBJC_CLASS___UIColor, "grayColor"));
    double v14 = v10;
    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));

    -[NSMutableAttributedString setAttributes:range:]( v7,  "setAttributes:range:",  v9,  0LL,  -[NSString length](self->_title, "length"));
    -[NSMutableAttributedString setAttributes:range:]( v7,  "setAttributes:range:",  v11,  -[NSString length](self->_title, "length"),  (_BYTE *)-[NSMutableAttributedString length](v7, "length") - (_BYTE *)-[NSString length](self->_title, "length"));
    -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v7);
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicSongCell currentTitleColor](self, "currentTitleColor"));
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
  }

- (void)_lowMemoryWarning:(id)a3
{
  unsigned int v3 = (void *)qword_1002BE958;
  qword_1002BE958 = 0LL;
}

- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  int v5 = a5;
  int v6 = a4;
  id v8 = a3;
  if (self->_musicBarsView)
  {
    id v10 = v8;
    unsigned int v9 = -[TVMusicSongCell _hasThumbnail](self, "_hasThumbnail");
    id v8 = v10;
    if (v9)
    {
      if (((v5 ^ v6) & 8) != 0)
      {
        -[TVMusicSongCell _layoutMusicBarsView](self, "_layoutMusicBarsView");
        id v8 = v10;
      }
    }
  }
}

- (int64_t)songType
{
  return self->_songType;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)heading
{
  return self->_heading;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)durationString
{
  return self->_durationString;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (unint64_t)ordinalValue
{
  return self->_ordinalValue;
}

- (BOOL)hasOrdinal
{
  return self->_hasOrdinal;
}

- (BOOL)fullWidthStyle
{
  return self->_fullWidthStyle;
}

- (NSNumber)popularity
{
  return self->_popularity;
}

- (NSNumber)popularityThreshold
{
  return self->_popularityThreshold;
}

- (void)setPopularityThreshold:(id)a3
{
}

- (BOOL)showPlayIconWhenFocused
{
  return self->_showPlayIconWhenFocused;
}

- (void)setShowPlayIconWhenFocused:(BOOL)a3
{
  self->_showPlayIconWhenFocused = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)focusable
{
  return self->_focusable;
}

- (void)setFocusable:(BOOL)a3
{
  self->_focusable = a3;
}

- (BOOL)isWatched
{
  return self->_isWatched;
}

- (void)setIsWatched:(BOOL)a3
{
  self->_isWatched = a3;
}

- (TVMusicSocialBadge)socialBadge
{
  return self->_socialBadge;
}

- (CGRect)thumbnailOverrideFrame
{
  double x = self->_thumbnailOverrideFrame.origin.x;
  double y = self->_thumbnailOverrideFrame.origin.y;
  double width = self->_thumbnailOverrideFrame.size.width;
  double height = self->_thumbnailOverrideFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)socialBadgeOffset
{
  double x = self->_socialBadgeOffset.x;
  double y = self->_socialBadgeOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSocialBadgeOffset:(CGPoint)a3
{
  self->_socialBadgeOffset = a3;
}

- (void)setThumbnailCornerRadius:(double)a3
{
  self->_thumbnailCornerRadius = a3;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (UIColor)titleHighlightColor
{
  return self->_titleHighlightColor;
}

- (void)setTitleHighlightColor:(id)a3
{
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (void)setSubtitleColor:(id)a3
{
}

- (UIColor)subtitleHighlightColor
{
  return self->_subtitleHighlightColor;
}

- (void)setSubtitleHighlightColor:(id)a3
{
}

- (UIColor)durationColor
{
  return self->_durationColor;
}

- (void)setDurationColor:(id)a3
{
}

- (UIColor)durationHighlightColor
{
  return self->_durationHighlightColor;
}

- (void)setDurationHighlightColor:(id)a3
{
}

- (UIColor)ordinalColor
{
  return self->_ordinalColor;
}

- (void)setOrdinalColor:(id)a3
{
}

- (UIColor)ordinalHighlightColor
{
  return self->_ordinalHighlightColor;
}

- (void)setOrdinalHighlightColor:(id)a3
{
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)leftPaddingForTitle
{
  return self->_leftPaddingForTitle;
}

- (void)setLeftPaddingForTitle:(double)a3
{
  self->_leftPaddingForTitle = a3;
}

- (UIImage)badgeImage
{
  return self->_badgeImage;
}

- (BOOL)favorite
{
  return self->_favorite;
}

- (MPIdentifierSet)songIdentifier
{
  return self->_songIdentifier;
}

- (_UIFloatingContentView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
}

- (BOOL)ordinalVisible
{
  return self->_ordinalVisible;
}

- (BOOL)playIconVisible
{
  return self->_playIconVisible;
}

- (BOOL)musicBarsVisible
{
  return self->_musicBarsVisible;
}

- (MPModelObject)playbackItem
{
  return self->_playbackItem;
}

- (void)setPlaybackItem:(id)a3
{
}

- (MPModelObject)playbackContainer
{
  return self->_playbackContainer;
}

- (void)setPlaybackContainer:(id)a3
{
}

- (BOOL)hasThumbnailOverrideFrame
{
  return self->_hasThumbnailOverrideFrame;
}

- (void)setHasThumbnailOverrideFrame:(BOOL)a3
{
  self->_hasThumbnailOverrideFrame = a3;
}

- (void).cxx_destruct
{
}

@end