@interface SAMovieV2TheaterShowtimeListSnippet
- (id)_afui_mapsRelatedChildren;
@end

@implementation SAMovieV2TheaterShowtimeListSnippet

- (id)_afui_mapsRelatedChildren
{
  return -[SAMovieV2TheaterShowtimeListSnippet theaterShowtimeListCells](self, "theaterShowtimeListCells");
}

@end