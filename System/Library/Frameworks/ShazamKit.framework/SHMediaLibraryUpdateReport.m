@interface SHMediaLibraryUpdateReport
- (NSMutableArray)locallyFoundGroups;
- (NSMutableArray)locallyFoundTracks;
- (NSMutableArray)missingFromLocalStoreGroups;
- (NSMutableArray)missingFromLocalStoreTracks;
- (SHMediaLibraryUpdateReport)init;
@end

@implementation SHMediaLibraryUpdateReport

- (SHMediaLibraryUpdateReport)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHMediaLibraryUpdateReport;
  v2 = -[SHMediaLibraryUpdateReport init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    locallyFoundTracks = v2->_locallyFoundTracks;
    v2->_locallyFoundTracks = (NSMutableArray *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    missingFromLocalStoreTracks = v2->_missingFromLocalStoreTracks;
    v2->_missingFromLocalStoreTracks = (NSMutableArray *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    locallyFoundGroups = v2->_locallyFoundGroups;
    v2->_locallyFoundGroups = (NSMutableArray *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    missingFromLocalStoreGroups = v2->_missingFromLocalStoreGroups;
    v2->_missingFromLocalStoreGroups = (NSMutableArray *)v9;
  }

  return v2;
}

- (NSMutableArray)locallyFoundTracks
{
  return self->_locallyFoundTracks;
}

- (NSMutableArray)missingFromLocalStoreTracks
{
  return self->_missingFromLocalStoreTracks;
}

- (NSMutableArray)locallyFoundGroups
{
  return self->_locallyFoundGroups;
}

- (NSMutableArray)missingFromLocalStoreGroups
{
  return self->_missingFromLocalStoreGroups;
}

- (void).cxx_destruct
{
}

@end