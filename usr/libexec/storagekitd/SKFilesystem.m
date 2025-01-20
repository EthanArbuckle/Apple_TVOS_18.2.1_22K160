@interface SKFilesystem
+ (id)buildFilesystems;
- (BOOL)supportsJournaling;
@end

@implementation SKFilesystem

+ (id)buildFilesystems
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006FC4;
  block[3] = &unk_100044BB0;
  block[4] = a1;
  if (qword_100051B00 != -1) {
    dispatch_once(&qword_100051B00, block);
  }
  return (id)qword_100051B08;
}

- (BOOL)supportsJournaling
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystem dmPersonality](self, "dmPersonality"));
  if ([v3 isEqualToString:@"HFS+"])
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystem dmPersonality](self, "dmPersonality"));
    if ([v5 isEqualToString:@"Journaled HFS+"])
    {
      unsigned __int8 v4 = 1;
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystem dmPersonality](self, "dmPersonality"));
      if ([v6 isEqualToString:@"Case-sensitive HFS+"])
      {
        unsigned __int8 v4 = 1;
      }

      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystem dmPersonality](self, "dmPersonality"));
        unsigned __int8 v4 = [v7 isEqualToString:@"Case-sensitive Journaled HFS+"];
      }
    }
  }

  return v4;
}

@end