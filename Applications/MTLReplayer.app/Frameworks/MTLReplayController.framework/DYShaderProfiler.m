@interface DYShaderProfiler
+ (id)extractShaderBinaryTextSegment:(id)a3;
- (DYShaderProfiler)init;
@end

@implementation DYShaderProfiler

- (DYShaderProfiler)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DYShaderProfiler;
  v2 = -[DYShaderProfiler init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)extractShaderBinaryTextSegment:(id)a3
{
  id v3 = a3;
  id v4 = objc_claimAutoreleasedReturnValue([v3 binary]);
  v5 = [v4 bytes];

  if (v5)
  {
    objc_super v6 = v5 + 8;
    for (int i = v5[4]; i; --i)
    {
      if (*v6 == 25) {
        break;
      }
      objc_super v6 = (_DWORD *)((char *)v6 + v6[1]);
    }

    int v8 = v6[16];
    if (v8)
    {
      v9 = v6 + 18;
      while (v9[4] != 1163157343 || *(_DWORD *)((char *)v9 + 19) != 5527621)
      {
        v9 += 20;
        if (!--v8) {
          goto LABEL_12;
        }
      }

      v5 = (_DWORD *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  (char *)v5 + v9[12],  v9[10]));
    }

    else
    {
LABEL_12:
      v5 = 0LL;
    }
  }

  return v5;
}

@end