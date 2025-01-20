@interface NSString
- (id)stringByResolvingRealPathWithError:(id *)a3;
@end

@implementation NSString

- (id)stringByResolvingRealPathWithError:(id *)a3
{
  if (-[NSString isEqualToString:](self, "isEqualToString:", &stru_100066238))
  {
    if (a3)
    {
      v12[0] = NSLocalizedDescriptionKey;
      v12[1] = NSFilePathErrorKey;
      v13[0] = @"Receiver must not be the empty string.";
      v13[1] = self;
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  v5));
    }

    return 0LL;
  }

  else
  {
    uint64_t v9 = 0LL;
    __int128 v8 = xmmword_100047330;
    while (1)
    {
      v6 = self;
      if (getattrlist( -[NSString fileSystemRepresentation](v6, "fileSystemRepresentation", v8, v9),  &v8,  v10,  0x40CuLL,  0) != -1) {
        break;
      }
      if (*__error() != 35) {
        return 0LL;
      }
    }

    return  -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  (char *)v11 + v11[0]);
  }

@end