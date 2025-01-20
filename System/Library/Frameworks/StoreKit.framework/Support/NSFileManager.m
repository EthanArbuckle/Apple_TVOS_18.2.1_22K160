@interface NSFileManager
+ (id)lib_applicationsDirectory;
- (BOOL)isSignedByAppleFileAtPath:(id)a3 basicCheck:(BOOL)a4;
- (NSURL)sk_cachedDataURL;
- (NSURL)sk_downloadURL;
- (NSURL)sk_iTunesStoreLibraryDataURL;
- (NSURL)sk_octanePersistedDataURL;
- (NSURL)sk_persistedDataURL;
- (NSURL)sk_userDatabaseURL;
- (id)_lib_deleteLastValidComponentOfPath:(id)a3;
- (id)lib_ensureDirectoryExistsAtPath:(id)a3;
@end

@implementation NSFileManager

+ (id)lib_applicationsDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, 2uLL, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (id)lib_ensureDirectoryExistsAtPath:(id)a3
{
  id v4 = a3;
  char v13 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](self, "fileExistsAtPath:isDirectory:", v4, &v13) && v13)
  {
    v5 = 0LL;
LABEL_9:
    id v9 = 0LL;
    goto LABEL_10;
  }

  id v12 = 0LL;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( self,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v4,  1LL,  0LL,  &v12);
  id v6 = v12;
  v5 = v6;
  if (!v6 || [v6 code] != (id)516) {
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _lib_deleteLastValidComponentOfPath:](self, "_lib_deleteLastValidComponentOfPath:", v4));
  v8 = v7;
  if (!v7)
  {
    v11 = 0LL;
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( self,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v4,  1LL,  0LL,  &v11);
    v8 = v11;
  }

  id v9 = v8;

LABEL_10:
  return v9;
}

- (id)_lib_deleteLastValidComponentOfPath:(id)a3
{
  id v4 = a3;
  char v10 = 0;
  if (!-[NSFileManager fileExistsAtPath:isDirectory:](self, "fileExistsAtPath:isDirectory:", v4, &v10))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByDeletingLastPathComponent]);

    goto LABEL_7;
  }

  if (v10)
  {
LABEL_7:
    id v5 = 0LL;
    goto LABEL_8;
  }

  id v9 = 0LL;
  -[NSFileManager removeItemAtPath:error:](self, "removeItemAtPath:error:", v4, &v9);
  id v5 = v9;
LABEL_8:

  return v5;
}

- (NSURL)sk_downloadURL
{
  return (NSURL *)sub_1000B36E8();
}

- (NSURL)sk_persistedDataURL
{
  return (NSURL *)sub_1000B2670((uint64_t)self, (uint64_t)a2, sub_1000B26E4);
}

- (NSURL)sk_octanePersistedDataURL
{
  return (NSURL *)sub_1000B36E8();
}

- (NSURL)sk_cachedDataURL
{
  return (NSURL *)sub_1000B3964( self,  a2,  sub_1000B2A30,  0x2F7972617262694CLL,  0xEE00736568636143LL,  "Unable to determine path for StoreKit caches directory");
}

- (NSURL)sk_userDatabaseURL
{
  return (NSURL *)sub_1000B2670((uint64_t)self, (uint64_t)a2, sub_1000B3A30);
}

- (NSURL)sk_iTunesStoreLibraryDataURL
{
  return (NSURL *)sub_1000B3964( self,  a2,  sub_1000B3E28,  0xD00000000000001ELL,  0x800000010029F920LL,  "Unable to determine path for iTunesStore library directory");
}

- (BOOL)isSignedByAppleFileAtPath:(id)a3 basicCheck:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  id v9 = self;
  char v10 = sub_1000C673C(v6, v8, a4);

  swift_bridgeObjectRelease(v8);
  return v10 & 1;
}

@end