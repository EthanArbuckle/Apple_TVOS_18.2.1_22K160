@interface MPFileValidationManager
+ (BOOL)validateFiles:(id)a3 allowAudio:(BOOL)a4 allowImages:(BOOL)a5 allowMovies:(BOOL)a6 extensionsOnly:(BOOL)a7;
+ (BOOL)validateFilesForAudio:(id)a3 extensionsOnly:(BOOL)a4;
+ (BOOL)validateFilesForImages:(id)a3 extensionsOnly:(BOOL)a4;
+ (BOOL)validateFilesForMovies:(id)a3 extensionsOnly:(BOOL)a4;
+ (id)resolveAliasPath:(id)a3;
+ (void)checkFileExtension:(id)a3 isAudio:(BOOL *)a4 isImage:(BOOL *)a5 isVideo:(BOOL *)a6;
@end

@implementation MPFileValidationManager

+ (BOOL)validateFilesForAudio:(id)a3 extensionsOnly:(BOOL)a4
{
  return [a1 validateFiles:a3 allowAudio:1 allowImages:0 allowMovies:0 extensionsOnly:a4];
}

+ (BOOL)validateFilesForImages:(id)a3 extensionsOnly:(BOOL)a4
{
  return [a1 validateFiles:a3 allowAudio:0 allowImages:1 allowMovies:0 extensionsOnly:a4];
}

+ (BOOL)validateFilesForMovies:(id)a3 extensionsOnly:(BOOL)a4
{
  return [a1 validateFiles:a3 allowAudio:0 allowImages:0 allowMovies:1 extensionsOnly:a4];
}

+ (BOOL)validateFiles:(id)a3 allowAudio:(BOOL)a4 allowImages:(BOOL)a5 allowMovies:(BOOL)a6 extensionsOnly:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = [a3 count];
  if (v12)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v13 = [a3 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v29;
      while (2)
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(a3);
          }
          uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
          __int16 v27 = 0;
          char v26 = 0;
          [a1 checkFileExtension:v17 isAudio:&v26 isImage:&v27 isVideo:(char *)&v27 + 1];
          if (HIBYTE(v27) || v26 || (_BYTE)v27)
          {
            BOOL v18 = !v26 || v9;
            BOOL v19 = !(_BYTE)v27 || v8;
            BOOL v20 = HIBYTE(v27) && v7;
            int v21 = v20 || v18;
            BOOL v22 = !HIBYTE(v27) || v7;
            BOOL v23 = !v22 && !v9 || v21 == 0;
            if (!v23 && v19) {
              continue;
            }
          }

          LOBYTE(v12) = 0;
          return (char)v12;
        }

        id v14 = [a3 countByEnumeratingWithState:&v28 objects:v32 count:16];
        LOBYTE(v12) = 1;
        if (v14) {
          continue;
        }
        break;
      }
    }

    else
    {
      LOBYTE(v12) = 1;
    }
  }

  return (char)v12;
}

+ (void)checkFileExtension:(id)a3 isAudio:(BOOL *)a4 isImage:(BOOL *)a5 isVideo:(BOOL *)a6
{
  char v13 = 0;
  if (a3)
  {
    if (-[NSFileManager fileExistsAtPath:isDirectory:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:isDirectory:",  a3,  &v13)
      && v13 == 0)
    {
      if (a4) {
        *a4 = 0;
      }
      if (a6) {
        *a6 = 0;
      }
      if (a5) {
        *a5 = 0;
      }
      id v11 = [a3 pathExtension];
      if ([v11 length])
      {
        if (![v11 caseInsensitiveCompare:@"jpg"]
          || ![v11 caseInsensitiveCompare:@"jpeg"]
          || ![v11 caseInsensitiveCompare:@"gif"]
          || ![v11 caseInsensitiveCompare:@"tif"]
          || ![v11 caseInsensitiveCompare:@"tiff"]
          || ![v11 caseInsensitiveCompare:@"pdf"]
          || ![v11 caseInsensitiveCompare:@"tga"]
          || ![v11 caseInsensitiveCompare:@"png"]
          || ![v11 caseInsensitiveCompare:@"bmp"]
          || ![v11 caseInsensitiveCompare:@"sgi"]
          || ![v11 caseInsensitiveCompare:@"pct"]
          || ![v11 caseInsensitiveCompare:@"psd"])
        {
          if (!a5) {
            return;
          }
          goto LABEL_48;
        }

        if ([v11 caseInsensitiveCompare:@"mov"]
          && [v11 caseInsensitiveCompare:@"qt"]
          && [v11 caseInsensitiveCompare:@"mp4"]
          && [v11 caseInsensitiveCompare:@"mpg"]
          && [v11 caseInsensitiveCompare:@"mpeg"]
          && [v11 caseInsensitiveCompare:@"m4v"]
          && [v11 caseInsensitiveCompare:@"dv"]
          && [v11 caseInsensitiveCompare:@"avi"]
          && [v11 caseInsensitiveCompare:@"3g2"]
          && [v11 caseInsensitiveCompare:@"3gp"])
        {
          if ([v11 caseInsensitiveCompare:@"mp3"]
            && [v11 caseInsensitiveCompare:@"m4a"]
            && [v11 caseInsensitiveCompare:@"m4p"]
            && [v11 caseInsensitiveCompare:@"aac"]
            && [v11 caseInsensitiveCompare:@"aif"]
            && [v11 caseInsensitiveCompare:@"aifc"]
            && [v11 caseInsensitiveCompare:@"aiff"]
            && [v11 caseInsensitiveCompare:@"wav"])
          {
            id v12 = [v11 caseInsensitiveCompare:@"qtz"];
            if (!a6) {
              return;
            }
            a5 = a6;
            if (v12) {
              return;
            }
          }

          else
          {
            a5 = a4;
            if (!a4) {
              return;
            }
          }

+ (id)resolveAliasPath:(id)a3
{
  v3 = -[NSURL URLByResolvingSymlinksInPath]( +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a3),  "URLByResolvingSymlinksInPath");
  id v8 = 0LL;
  uint64_t v9 = 0LL;
  if (-[NSURL getResourceValue:forKey:error:](v3, "getResourceValue:forKey:error:", &v8, NSURLIsAliasFileKey, &v9))
  {
    if ([v8 BOOLValue])
    {
      v4 = +[NSURL bookmarkDataWithContentsOfURL:error:]( &OBJC_CLASS___NSURL,  "bookmarkDataWithContentsOfURL:error:",  v3,  &v9);
      if (v4)
      {
        char v7 = 0;
        v5 = +[NSURL URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:]( &OBJC_CLASS___NSURL,  "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:",  v4,  768LL,  0LL,  &v7,  &v9);
        if (v5) {
          v3 = v5;
        }
      }
    }
  }

  return -[NSURL path](v3, "path");
}

@end