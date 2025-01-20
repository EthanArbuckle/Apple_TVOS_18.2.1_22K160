@interface OSALog(OSASubmitterExtension)
- (id)getFilenames;
@end

@implementation OSALog(OSASubmitterExtension)

- (id)getFilenames
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 lastPathComponent];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end