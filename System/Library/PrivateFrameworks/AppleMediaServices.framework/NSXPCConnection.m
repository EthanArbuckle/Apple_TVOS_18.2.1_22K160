@interface NSXPCConnection
- (id)amsd_processName;
@end

@implementation NSXPCConnection

- (id)amsd_processName
{
  if (proc_name(-[NSXPCConnection processIdentifier](self, "processIdentifier"), buffer, 0x100u) < 1) {
    v2 = 0LL;
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
  }
  return v2;
}

@end