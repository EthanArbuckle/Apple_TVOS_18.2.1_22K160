@interface SAMovieV2TheaterListSnippet
- (id)_afui_mapsRelatedChildren;
@end

@implementation SAMovieV2TheaterListSnippet

- (id)_afui_mapsRelatedChildren
{
  return -[SAMovieV2TheaterListSnippet theaterListCells](self, "theaterListCells");
}

@end