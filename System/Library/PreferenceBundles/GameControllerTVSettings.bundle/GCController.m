@interface GCController
- (int64_t)tvset_controllerType;
@end

@implementation GCController

- (int64_t)tvset_controllerType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCController extendedGamepad](self, "extendedGamepad"));

  if (!v3) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCController productCategory](self, "productCategory"));
  if (([v4 isEqualToString:@"Xbox One"] & 1) == 0)
  {

LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GCController productCategory](self, "productCategory"));
    if ([v11 isEqualToString:@"DualShock 4"])
    {
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GCController productCategory](self, "productCategory"));
      unsigned int v13 = [v12 isEqualToString:@"DualSense"];

      if (!v13) {
        return 4LL;
      }
    }

    return 3LL;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCController physicalInputProfile](self, "physicalInputProfile"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___GCXboxGamepad);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCController vendorName](self, "vendorName"));
  unsigned int v9 = [v8 containsString:@"Adaptive"];

  if (v9) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

@end