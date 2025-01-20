@interface NSMutableString(OSAStackshotKCDataExtension)
- (void)appendPortLabelInfo:()OSAStackshotKCDataExtension portlabels:;
@end

@implementation NSMutableString(OSAStackshotKCDataExtension)

- (void)appendPortLabelInfo:()OSAStackshotKCDataExtension portlabels:
{
  id v10 = a4;
  objc_msgSend(NSString, "stringWithFormat:", @"%d", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = @"<port label truncated>";
  if ((_DWORD)a3 && v10)
  {
    if ((_DWORD)a3 != -1)
    {
      [v10 objectForKeyedSubscript:v6];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8) {
        v7 = v8;
      }
    }

    [a1 appendFormat:@" (%@)", v7];
  }
}

@end