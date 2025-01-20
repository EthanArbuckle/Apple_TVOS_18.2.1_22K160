@interface LSGetMainBundleURL
@end

@implementation LSGetMainBundleURL

void ___LSGetMainBundleURL_block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFURLRef v1 = CFBundleCopyBundleURL(MainBundle);
    if (v1)
    {
      CFURLRef v8 = v1;
      v2 = -[__CFURL pathExtension](v1, "pathExtension");
      uint64_t v3 = [v2 length];

      if (v3)
      {
        v4 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v8,  34LL,  0LL);
        v5 = v4;
        if (v4)
        {
          -[FSNode URL](v4, "URL");
          v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v6 = v8;
        }

        v7 = (void *)_LSGetMainBundleURL::result;
        _LSGetMainBundleURL::result = (uint64_t)v6;
      }

      else
      {
        v5 = (FSNode *)_LSGetMainBundleURL::result;
        _LSGetMainBundleURL::result = 0LL;
      }

      CFURLRef v1 = v8;
    }
  }

@end