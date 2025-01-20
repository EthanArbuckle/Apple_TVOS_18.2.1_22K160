@interface MPModelLibraryResponse
- (id)tvm_itemAtIndex:(int64_t)a3;
- (id)tvm_playlistEntryAtIndex:(int64_t)a3;
- (id)tvm_songAtIndex:(int64_t)a3;
@end

@implementation MPModelLibraryResponse

- (id)tvm_songAtIndex:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelLibraryResponse tvm_itemAtIndex:](self, "tvm_itemAtIndex:", a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MPModelSong, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {

    v3 = 0LL;
  }

  return v3;
}

- (id)tvm_playlistEntryAtIndex:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelLibraryResponse tvm_itemAtIndex:](self, "tvm_itemAtIndex:", a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MPModelPlaylistEntry, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {

    v3 = 0LL;
  }

  return v3;
}

- (id)tvm_itemAtIndex:(int64_t)a3
{
  if (a3 < 0
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelLibraryResponse results](self, "results")),
        id v6 = [v5 totalItemCount],
        v5,
        (uint64_t)v6 <= a3))
  {
    v10 = 0LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelLibraryResponse results](self, "results"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 indexPathForGlobalIndex:a3]);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelLibraryResponse results](self, "results"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 itemAtIndexPath:v8]);
  }

  return v10;
}

@end