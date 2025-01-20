@interface NSMutableString
- (void)appendWithTabDepth:(unint64_t)a3 format:(id)a4;
@end

@implementation NSMutableString

- (void)appendWithTabDepth:(unint64_t)a3 format:(id)a4
{
  for (CFStringRef i = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, (CFStringRef)a4, &v7); a3; --a3)
    -[NSMutableString appendString:](self, "appendString:", @"\t");
  -[NSMutableString appendString:](self, "appendString:", i);
  CFRelease(i);
}

@end