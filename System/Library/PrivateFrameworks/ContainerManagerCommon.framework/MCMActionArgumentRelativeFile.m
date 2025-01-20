@interface MCMActionArgumentRelativeFile
- (id)fileURL;
@end

@implementation MCMActionArgumentRelativeFile

- (id)fileURL
{
  v2 = (void *)MEMORY[0x189604030];
  v3 = -[MCMActionArgumentBase string](self, "string");
  [v2 fileURLWithPath:v3 isDirectory:0 relativeToURL:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end