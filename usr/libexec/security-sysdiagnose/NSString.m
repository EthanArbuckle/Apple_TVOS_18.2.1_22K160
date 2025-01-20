@interface NSString
- (void)writeToStdErr;
- (void)writeToStdOut;
@end

@implementation NSString

- (void)writeToStdOut
{
  v2 = -[NSString UTF8String](self, "UTF8String");
  fputs(v2, __stdoutp);
}

- (void)writeToStdErr
{
  v2 = -[NSString UTF8String](self, "UTF8String");
  fputs(v2, __stderrp);
}

@end