@interface TVHSortOption
+ (TVHSortOption)new;
+ (TVHSortOption)sortOptionWithSortMode:(int64_t)a3;
+ (id)artistTitle;
+ (id)newestReleaseYearFirst;
+ (id)oldestReleaseYearFirst;
+ (id)playlistTitle;
+ (id)playlistType;
+ (id)recentlyAdded;
+ (id)title;
- (NSArray)sortDescriptors;
- (NSString)title;
- (TVHSortOption)init;
- (id)_initWithSortMode:(int64_t)a3 title:(id)a4 sortDescriptors:(id)a5;
- (id)description;
- (int64_t)sortMode;
@end

@implementation TVHSortOption

+ (TVHSortOption)new
{
  return 0LL;
}

- (TVHSortOption)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (id)_initWithSortMode:(int64_t)a3 title:(id)a4 sortDescriptors:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHSortOption;
  v10 = -[TVHSortOption init](&v17, "init");
  v11 = v10;
  if (v10)
  {
    v10->_sortMode = a3;
    v12 = (NSString *)[v8 copy];
    title = v11->_title;
    v11->_title = v12;

    v14 = (NSArray *)[v9 copy];
    sortDescriptors = v11->_sortDescriptors;
    v11->_sortDescriptors = v14;
  }

  return v11;
}

+ (id)artistTitle
{
  if (qword_100157330 != -1) {
    dispatch_once(&qword_100157330, &stru_1000FE5B8);
  }
  return (id)qword_100157328;
}

+ (id)newestReleaseYearFirst
{
  if (qword_100157340 != -1) {
    dispatch_once(&qword_100157340, &stru_1000FE5D8);
  }
  return (id)qword_100157338;
}

+ (id)oldestReleaseYearFirst
{
  if (qword_100157350 != -1) {
    dispatch_once(&qword_100157350, &stru_1000FE5F8);
  }
  return (id)qword_100157348;
}

+ (id)playlistTitle
{
  if (qword_100157360 != -1) {
    dispatch_once(&qword_100157360, &stru_1000FE618);
  }
  return (id)qword_100157358;
}

+ (id)playlistType
{
  if (qword_100157370 != -1) {
    dispatch_once(&qword_100157370, &stru_1000FE638);
  }
  return (id)qword_100157368;
}

+ (id)recentlyAdded
{
  if (qword_100157380 != -1) {
    dispatch_once(&qword_100157380, &stru_1000FE658);
  }
  return (id)qword_100157378;
}

+ (id)title
{
  if (qword_100157390 != -1) {
    dispatch_once(&qword_100157390, &stru_1000FE678);
  }
  return (id)qword_100157388;
}

+ (TVHSortOption)sortOptionWithSortMode:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[TVHSortOption artistTitle](&OBJC_CLASS___TVHSortOption, "artistTitle", v3, v4));
      break;
    case 1LL:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[TVHSortOption newestReleaseYearFirst](&OBJC_CLASS___TVHSortOption, "newestReleaseYearFirst", v3, v4));
      break;
    case 2LL:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[TVHSortOption oldestReleaseYearFirst](&OBJC_CLASS___TVHSortOption, "oldestReleaseYearFirst", v3, v4));
      break;
    case 3LL:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[TVHSortOption playlistType](&OBJC_CLASS___TVHSortOption, "playlistType", v3, v4));
      break;
    case 4LL:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[TVHSortOption recentlyAdded](&OBJC_CLASS___TVHSortOption, "recentlyAdded", v3, v4));
      break;
    case 5LL:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[TVHSortOption title](&OBJC_CLASS___TVHSortOption, "title", v3, v4));
      break;
    case 6LL:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[TVHSortOption playlistTitle](&OBJC_CLASS___TVHSortOption, "playlistTitle", v3, v4));
      break;
    default:
      return (TVHSortOption *)a1;
  }

  return (TVHSortOption *)a1;
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  uint64_t v4 = sub_100021A2C(-[TVHSortOption sortMode](self, "sortMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendString:v5 withName:@"sortMode"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSortOption title](self, "title"));
  [v3 appendString:v6 withName:@"title"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSortOption sortDescriptors](self, "sortDescriptors"));
  id v8 = [v3 appendObject:v7 withName:@"sortDescriptors"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return v9;
}

- (int64_t)sortMode
{
  return self->_sortMode;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void).cxx_destruct
{
}

@end