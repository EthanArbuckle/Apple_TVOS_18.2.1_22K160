@interface NSString
+ (NSString)stringWithFileSystemRepresentation:(const char *)a3;
+ (NSString)stringWithFileSystemRepresentation:(const char *)a3 length:(unint64_t)a4;
- (BOOL)containsDotDotPathComponents;
@end

@implementation NSString

+ (NSString)stringWithFileSystemRepresentation:(const char *)a3 length:(unint64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringWithFileSystemRepresentation:a3 length:a4]);

  return (NSString *)v7;
}

+ (NSString)stringWithFileSystemRepresentation:(const char *)a3
{
  return +[NSString stringWithFileSystemRepresentation:length:]( &OBJC_CLASS___NSString,  "stringWithFileSystemRepresentation:length:",  a3,  strlen(a3));
}

- (BOOL)containsDotDotPathComponents
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](self, "pathComponents"));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend( *(id *)(*((void *)&v9 + 1) + 8 * (void)i),  "isEqualToString:",  @"..",  (void)v9))
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  BOOL v7 = 0;
LABEL_11:

  return v7;
}

@end