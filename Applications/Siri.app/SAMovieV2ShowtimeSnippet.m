@interface SAMovieV2ShowtimeSnippet
- (id)_afui_mapsRelatedChild;
@end

@implementation SAMovieV2ShowtimeSnippet

- (id)_afui_mapsRelatedChild
{
  return -[SAMovieV2ShowtimeSnippet theater](self, "theater");
}

@end