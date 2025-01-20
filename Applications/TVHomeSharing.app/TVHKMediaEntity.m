@interface TVHKMediaEntity
- (BOOL)tvh_isVideoItem;
- (NSString)tvh_displayGenreTitle;
- (NSString)tvh_displayTitle;
- (TVHKMediaLibrary)tvh_mediaLibrary;
- (id)tvh_contentDescriptionAttributedString;
- (id)tvh_contentDescriptionAttributedStringWithFont:(id)a3 textColor:(id)a4;
@end

@implementation TVHKMediaEntity

- (TVHKMediaLibrary)tvh_mediaLibrary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVHApplicationDelegate sharedApplicationDelegate]( &OBJC_CLASS___TVHApplicationDelegate,  "sharedApplicationDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaLibrariesManager]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntity mediaServerIdentifier](self, "mediaServerIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaLibraryForMediaServerIdentifier:v5]);

  return (TVHKMediaLibrary *)v6;
}

- (BOOL)tvh_isVideoItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntity type](self, "type"));
  BOOL v3 = ![v2 subtype] && objc_msgSend(v2, "mediaItemType") == (id)2;

  return v3;
}

- (NSString)tvh_displayTitle
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntity title](self, "title"));
  if ([v3 length])
  {
    id v4 = v3;
    goto LABEL_42;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntity type](self, "type"));
  switch((unint64_t)[v5 mediaCategoryType])
  {
    case 0uLL:
      id v9 = [v5 subtype];
      if (v9 == (id)1)
      {
        [v5 mediaEntityCollectionType];
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v7 = v6;
        v8 = @"UNKNOWN_PLAYLIST_TITLE";
      }

      else
      {
        if (v9) {
          goto LABEL_36;
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v7 = v6;
        v8 = @"UNKNOWN_ITEM_TITLE";
      }

      goto LABEL_40;
    case 1uLL:
      id v10 = [v5 subtype];
      if (v10 == (id)1)
      {
        switch((unint64_t)[v5 mediaEntityCollectionType])
        {
          case 0uLL:
          case 1uLL:
          case 5uLL:
          case 6uLL:
            goto LABEL_33;
          case 2uLL:
            v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            v7 = v6;
            v8 = @"UNKNOWN_ARTIST_TITLE";
            goto LABEL_40;
          case 3uLL:
            v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            v7 = v6;
            v8 = @"UNKNOWN_COMPOSER_TITLE";
            goto LABEL_40;
          case 4uLL:
            v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            v7 = v6;
            v8 = @"UNKNOWN_GENRE_TITLE";
            goto LABEL_40;
          default:
            goto LABEL_36;
        }
      }

      if (!v10)
      {
        switch((unint64_t)[v5 mediaItemType])
        {
          case 0uLL:
          case 1uLL:
          case 3uLL:
            v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            v7 = v6;
            v8 = @"UNKNOWN_MUSIC_SONG_TITLE";
            goto LABEL_40;
          case 2uLL:
            v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            v7 = v6;
            v8 = @"UNKNOWN_MUSIC_VIDEO_TITLE";
            goto LABEL_40;
          default:
            goto LABEL_36;
        }
      }

      goto LABEL_36;
    case 2uLL:
    case 3uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v7 = v6;
      v8 = @"UNKNOWN_MOVIE_TITLE";
      goto LABEL_40;
    case 4uLL:
      id v11 = [v5 subtype];
      if (v11 == (id)1)
      {
        switch((unint64_t)[v5 mediaEntityCollectionType])
        {
          case 0uLL:
          case 2uLL:
          case 3uLL:
          case 4uLL:
          case 5uLL:
          case 6uLL:
            v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            v7 = v6;
            v8 = @"UNKNOWN_SHOW_TITLE";
            goto LABEL_40;
          case 1uLL:
            v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            v7 = v6;
            v8 = @"UNKNOWN_SEASON_TITLE";
            goto LABEL_40;
          default:
            goto LABEL_36;
        }
      }

      if (v11) {
        goto LABEL_36;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v7 = v6;
      v8 = @"UNKNOWN_SHOW_EPISODE_TITLE";
      goto LABEL_40;
    case 5uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v7 = v6;
      v8 = @"UNKNOWN_HOME_VIDEO_TITLE";
      goto LABEL_40;
    case 6uLL:
      id v15 = [v5 subtype];
      if (v15 == (id)1)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v7 = v6;
        v8 = @"UNKNOWN_PODCAST_TITLE";
      }

      else
      {
        if (v15) {
          goto LABEL_36;
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v7 = v6;
        v8 = @"UNKNOWN_PODCAST_EPISODE_TITLE";
      }

      goto LABEL_40;
    case 7uLL:
      id v12 = [v5 subtype];
      if (v12 == (id)1)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v7 = v6;
        v8 = @"UNKNOWN_ITUNES_U_COURSE_TITLE";
      }

      else
      {
        if (v12) {
          goto LABEL_36;
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v7 = v6;
        v8 = @"UNKNOWN_ITUNES_U_EPISODE_TITLE";
      }

      goto LABEL_40;
    case 8uLL:
      id v16 = [v5 subtype];
      if (v16 == (id)1)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v7 = v6;
        v8 = @"UNKNOWN_AUDIOBOOK_TITLE";
      }

      else
      {
        if (v16) {
          goto LABEL_36;
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v7 = v6;
        v8 = @"UNKNOWN_AUDIOBOOK_CHAPTER_TITLE";
      }

      goto LABEL_40;
    case 9uLL:
      id v13 = [v5 subtype];
      if (v13 == (id)1)
      {
LABEL_33:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v7 = v6;
        v8 = @"UNKNOWN_ALBUM_TITLE";
      }

      else
      {
        if (v13) {
          goto LABEL_36;
        }
        id v14 = [v5 mediaItemType];
        if ((unint64_t)v14 < 2)
        {
LABEL_23:
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v7 = v6;
          v8 = @"UNKNOWN_PHOTO_IMAGE_TITLE";
          goto LABEL_40;
        }

        if (v14 != (id)2)
        {
          if (v14 == (id)3) {
            goto LABEL_23;
          }
LABEL_36:
          id v4 = 0LL;
          goto LABEL_41;
        }

        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v7 = v6;
        v8 = @"UNKNOWN_PHOTO_VIDEO_TITLE";
      }

- (NSString)tvh_displayGenreTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntity genreTitle](self, "genreTitle"));
  if ([v2 length])
  {
    id v3 = v2;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v3 = (id)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"UNKNOWN_GENRE_TITLE" value:0 table:0]);
  }

  return (NSString *)v3;
}

- (id)tvh_contentDescriptionAttributedString
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 13LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v4,  v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHKMediaEntity tvh_contentDescriptionAttributedStringWithFont:textColor:]( self,  "tvh_contentDescriptionAttributedStringWithFont:textColor:",  v3,  v6));
  return v7;
}

- (id)tvh_contentDescriptionAttributedStringWithFont:(id)a3 textColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntity contentDescription](self, "contentDescription"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByTrimmingCharactersInSet:v9]);

  id v11 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tvh_attributedStringForHTMLStringWithFont:textColor:", v6, v7));
  if (!v11)
  {
    v15[0] = NSFontAttributeName;
    v15[1] = NSForegroundColorAttributeName;
    v16[0] = v6;
    v16[1] = v7;
    v15[2] = NSParagraphStyleAttributeName;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](&OBJC_CLASS___NSParagraphStyle, "defaultParagraphStyle"));
    v16[2] = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));

    id v11 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v10,  v13);
  }

  return v11;
}

@end