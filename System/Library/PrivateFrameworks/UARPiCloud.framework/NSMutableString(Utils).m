@interface NSMutableString(Utils)
- (void)appendWithTabDepth:()Utils format:;
@end

@implementation NSMutableString(Utils)

- (void)appendWithTabDepth:()Utils format:
{
  for (CFStringRef i = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, format, va); a3; --a3)
    [a1 appendString:@"\t"];
  [a1 appendString:i];
  CFRelease(i);
}

@end