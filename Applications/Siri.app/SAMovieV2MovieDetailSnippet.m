@interface SAMovieV2MovieDetailSnippet
- (id)_afui_mapsRelatedChildren;
@end

@implementation SAMovieV2MovieDetailSnippet

- (id)_afui_mapsRelatedChildren
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAMovieV2MovieDetailSnippet showtimeSnippet](self, "showtimeSnippet"));
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAMovieV2MovieDetailSnippet theaterShowtimeListSnippet](self, "theaterShowtimeListSnippet"));
  if (v5) {
    [v3 addObject:v5];
  }

  return v3;
}

@end