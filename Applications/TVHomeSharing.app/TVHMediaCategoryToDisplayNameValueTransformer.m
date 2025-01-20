@interface TVHMediaCategoryToDisplayNameValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)transformedValue:(id)a3;
@end

@implementation TVHMediaCategoryToDisplayNameValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString);
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  v3 = 0LL;
  switch((unint64_t)[a3 unsignedIntegerValue])
  {
    case 1uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = v4;
      v6 = @"MUSIC_TITLE";
      goto LABEL_10;
    case 3uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = v4;
      v6 = @"MOVIES_TITLE";
      goto LABEL_10;
    case 4uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = v4;
      v6 = @"SHOWS_TITLE";
      goto LABEL_10;
    case 5uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = v4;
      v6 = @"HOME_VIDEOS_TITLE";
      goto LABEL_10;
    case 6uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = v4;
      v6 = @"PODCASTS_TITLE";
      goto LABEL_10;
    case 7uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = v4;
      v6 = @"ITUNES_U_TITLE";
      goto LABEL_10;
    case 8uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = v4;
      v6 = @"AUDIOBOOKS_TITLE";
      goto LABEL_10;
    case 9uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = v4;
      v6 = @"PHOTOS_TITLE";
LABEL_10:
      v3 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:0 table:0]);

      break;
    default:
      return v3;
  }

  return v3;
}

@end