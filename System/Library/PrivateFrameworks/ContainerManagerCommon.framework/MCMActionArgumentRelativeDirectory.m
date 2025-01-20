@interface MCMActionArgumentRelativeDirectory
- (id)fileURL;
@end

@implementation MCMActionArgumentRelativeDirectory

- (id)fileURL
{
  v2 = (void *)MEMORY[0x189604030];
  v3 = -[MCMActionArgumentBase string](self, "string");
  [v2 fileURLWithPath:v3 isDirectory:1 relativeToURL:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end