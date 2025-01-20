@interface TVMusicLibraryButtonFactory
+ (id)allSeasonsButton;
+ (id)artistStartStationButton;
+ (id)goToShowButton;
+ (id)normalMoreButton;
+ (id)wideGoToArtistButton;
+ (id)wideGoToArtistButtonWithArtistName:(id)a3;
@end

@implementation TVMusicLibraryButtonFactory

+ (id)normalMoreButton
{
  v2 = -[TVMusicLibraryActionButton initWithStyle:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryActionButton),  "initWithStyle:",  0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithWeight:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithWeight:",  6LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"ellipsis",  v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvm_imageWithSize:aspectFit:", 1, 50.0, 50.0));
  -[TVMusicLibraryActionButton setImage:](v2, "setImage:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"MusicLibraryMore" value:&stru_100279068 table:0]);
  -[TVMusicLibraryActionButton setTitle:](v2, "setTitle:", v7);

  return v2;
}

+ (id)wideGoToArtistButton
{
  return [a1 wideGoToArtistButtonWithArtistName:0];
}

+ (id)wideGoToArtistButtonWithArtistName:(id)a3
{
  id v3 = a3;
  v4 = -[TVMusicLibraryActionButton initWithStyle:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryActionButton),  "initWithStyle:",  3LL);
  if (v3 && [v3 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"MusicLibraryGoToArtistNamed" value:&stru_100279068 table:0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"%@" withString:@"⁨%@⁩"]);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v3));
    -[TVMusicLibraryActionButton setText:](v4, "setText:", v8);

    -[TVMusicLibraryActionButton textLabelSize](v4, "textLabelSize");
    double v10 = v9;
    -[TVMusicLibraryActionButton frame](v4, "frame");
    if (v10 > v11 + -20.0) {
      -[TVMusicLibraryActionButton setText:](v4, "setText:", 0LL);
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryActionButton text](v4, "text"));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"MusicLibraryGoToArtist" value:&stru_100279068 table:0]);
    -[TVMusicLibraryActionButton setText:](v4, "setText:", v14);
  }

  -[TVMusicLibraryActionButton setAccessibilityIdentifier:]( v4,  "setAccessibilityIdentifier:",  @"TVMusic.Library.GoToArtist");

  return v4;
}

+ (id)artistStartStationButton
{
  v2 = -[TVMusicLibraryActionButton initWithStyle:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryActionButton),  "initWithStyle:",  3LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryActionButton textFont](v2, "textFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"badge.plus.radiowaves.forward",  v4));
  -[TVMusicLibraryActionButton setImage:](v2, "setImage:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"LibraryArtistStartStation" value:&stru_100279068 table:0]);
  -[TVMusicLibraryActionButton setText:](v2, "setText:", v7);

  -[TVMusicLibraryActionButton setAccessibilityIdentifier:]( v2,  "setAccessibilityIdentifier:",  @"TVMusic.Library.Artist.StartStation");
  return v2;
}

+ (id)goToShowButton
{
  v2 = -[TVMusicLibraryActionButton initWithStyle:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryActionButton),  "initWithStyle:",  0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithWeight:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithWeight:",  5LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"tv",  v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvm_imageWithSize:aspectFit:", 1, 60.0, 60.0));
  -[TVMusicLibraryActionButton setImage:](v2, "setImage:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"MusicLibraryGoToShow" value:&stru_100279068 table:0]);
  -[TVMusicLibraryActionButton setTitle:](v2, "setTitle:", v7);

  -[TVMusicLibraryActionButton setAccessibilityIdentifier:]( v2,  "setAccessibilityIdentifier:",  @"TVMusic.Library.GoToShow");
  return v2;
}

+ (id)allSeasonsButton
{
  v2 = -[TVMusicLibraryActionButton initWithStyle:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryActionButton),  "initWithStyle:",  1LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"MusicLibraryAllSeasons" value:&stru_100279068 table:0]);
  -[TVMusicLibraryActionButton setText:](v2, "setText:", v4);

  -[TVMusicLibraryActionButton setAccessibilityIdentifier:]( v2,  "setAccessibilityIdentifier:",  @"TVMusic.Library.AllSeasons");
  return v2;
}

@end