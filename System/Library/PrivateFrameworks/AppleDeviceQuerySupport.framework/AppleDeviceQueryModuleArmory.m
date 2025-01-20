@interface AppleDeviceQueryModuleArmory
- (AppleDeviceQueryModuleArmory)initWithError:(id *)a3;
@end

@implementation AppleDeviceQueryModuleArmory

- (AppleDeviceQueryModuleArmory)initWithError:(id *)a3
{
  v6 = self;
  if (a3)
  {
    *a3 = 0LL;
    v6 = -[AppleDeviceQueryModuleArmory init](self, "init");
    v11 = v6;
    if (!v6)
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeModule/ZhuGeModule.m",  "-[AppleDeviceQueryModuleArmory initWithError:]",  29LL,  @"Failed to initialize a module instance!",  v8,  v9,  v10,  v13);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:18 underlyingError:0];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeModule/ZhuGeModule.m",  "-[AppleDeviceQueryModuleArmory initWithError:]",  21LL,  @"error p-pointer is nil!",  v3,  v4,  v5,  v13);
    v11 = 0LL;
  }

  return v11;
}

@end