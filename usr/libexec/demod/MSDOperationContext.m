@interface MSDOperationContext
+ (BOOL)downloadOnly;
+ (void)setDownloadOnly:(BOOL)a3;
- (BOOL)restored;
- (BOOL)skipped;
- (NSNumber)diskSpacedRequired;
- (NSString)identifier;
- (NSString)secondaryStagingRootPath;
- (NSString)stagingRootPath;
- (NSString)stashedStagingRootPath;
- (NSString)uniqueName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDiskSpacedRequired:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRestored:(BOOL)a3;
- (void)setSkipped:(BOOL)a3;
@end

@implementation MSDOperationContext

+ (BOOL)downloadOnly
{
  return byte_100125438;
}

+ (void)setDownloadOnly:(BOOL)a3
{
  byte_100125438 = a3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext uniqueName](self, "uniqueName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@[%p]: %@>",  v5,  self,  v6));

  return v7;
}

- (NSString)uniqueName
{
  uniqueName = self->_uniqueName;
  if (!uniqueName)
  {
    v4 = (objc_class *)objc_opt_class(self, a2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext identifier](self, "identifier"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v6,  v7));
    v9 = self->_uniqueName;
    self->_uniqueName = v8;

    uniqueName = self->_uniqueName;
  }

  return uniqueName;
}

- (NSString)stagingRootPath
{
  if (!self->_stagingRootPath)
  {
    unsigned int v3 = +[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext uniqueName](self, "uniqueName"));
    if (v3) {
      v5 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/MSD_staging";
    }
    else {
      v5 = @"/var/MSDWorkContainer/MSD_staging";
    }
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", v4));
    stagingRootPath = self->_stagingRootPath;
    self->_stagingRootPath = v6;
  }

  return self->_stagingRootPath;
}

- (NSString)secondaryStagingRootPath
{
  return 0LL;
}

- (NSString)stashedStagingRootPath
{
  return 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 setIdentifier:self->_identifier];
  [v4 setDiskSpacedRequired:self->_diskSpacedRequired];
  [v4 setSkipped:self->_skipped];
  [v4 setRestored:self->_restored];
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)diskSpacedRequired
{
  return self->_diskSpacedRequired;
}

- (void)setDiskSpacedRequired:(id)a3
{
}

- (BOOL)skipped
{
  return self->_skipped;
}

- (void)setSkipped:(BOOL)a3
{
  self->_skipped = a3;
}

- (BOOL)restored
{
  return self->_restored;
}

- (void)setRestored:(BOOL)a3
{
  self->_restored = a3;
}

- (void).cxx_destruct
{
}

@end