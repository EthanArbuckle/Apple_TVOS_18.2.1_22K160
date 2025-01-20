@interface ProcessInfo
+ (id)processNameWithPid:(int)a3;
@end

@implementation ProcessInfo

+ (id)processNameWithPid:(int)a3
{
  if (proc_pidpath(a3, buffer, 0x1000u) < 1)
  {
    v5 = 0LL;
  }

  else
  {
    v3 = strrchr(buffer, 47);
    if (v3) {
      v4 = v3 + 1;
    }
    else {
      v4 = buffer;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  }

  return v5;
}

@end