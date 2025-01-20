@interface MTPlaylistIncludeAllProcessor
- (id)entityName;
- (id)predicate;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
@end

@implementation MTPlaylistIncludeAllProcessor

- (id)entityName
{
  return kMTPodcastEntityName;
}

- (id)predicate
{
  return +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts]( &OBJC_CLASS___MTPodcast,  "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  if (objc_msgSend(a4, "count", a3)) {
    -[MTBaseProcessor results:](self, "results:", &stru_100242078);
  }
}

@end