@interface TVMusicLibraryUITracker
+ (TVMusicLibraryUITracker)sharedTracker;
- (NSString)currentPAFFeatureName;
- (unint64_t)currentContext;
- (unint64_t)currentSubcontext;
- (void)setCurrentContext:(unint64_t)a3;
- (void)setCurrentSubcontext:(unint64_t)a3;
@end

@implementation TVMusicLibraryUITracker

+ (TVMusicLibraryUITracker)sharedTracker
{
  if (qword_1002BE9A8 != -1) {
    dispatch_once(&qword_1002BE9A8, &stru_10026BD88);
  }
  return (TVMusicLibraryUITracker *)(id)qword_1002BE9B0;
}

- (NSString)currentPAFFeatureName
{
  unint64_t v2 = -[TVMusicLibraryUITracker currentContext](self, "currentContext");
  v3 = 0LL;
  v4 = @"recently_added";
  switch(v2)
  {
    case 0uLL:
      goto LABEL_14;
    case 2uLL:
      goto LABEL_13;
    case 3uLL:
      v4 = @"playlists";
      goto LABEL_13;
    case 4uLL:
      v4 = @"artists";
      goto LABEL_13;
    case 5uLL:
      v4 = @"albums";
      goto LABEL_13;
    case 6uLL:
      v4 = @"songs";
      goto LABEL_13;
    case 7uLL:
      v4 = @"genres";
      goto LABEL_13;
    case 8uLL:
      v4 = @"composers";
      goto LABEL_13;
    case 9uLL:
      v4 = @"compilations";
      goto LABEL_13;
    case 0xAuLL:
      v4 = @"videos";
      goto LABEL_13;
    case 0xBuLL:
      v4 = @"shows";
      goto LABEL_13;
    case 0xCuLL:
      v4 = @"made_for_you";
LABEL_13:
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ / %@",  @"library",  v4));
LABEL_14:
      result = v3;
      break;
    default:
      result = @"library";
      break;
  }

  return result;
}

- (unint64_t)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(unint64_t)a3
{
  self->_currentContext = a3;
}

- (unint64_t)currentSubcontext
{
  return self->_currentSubcontext;
}

- (void)setCurrentSubcontext:(unint64_t)a3
{
  self->_currentSubcontext = a3;
}

@end