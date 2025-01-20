@interface ASCMobileGestalt
+ (BOOL)hasCapabilities:(id)a3;
+ (BOOL)hasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4;
+ (BOOL)hasHEVCDecoding;
+ (BOOL)hasSystemTelephonyOfAnyKind;
+ (BOOL)hasVenice;
+ (BOOL)isAppleSiliconMac;
+ (BOOL)isPad;
+ (BOOL)isStandaloneWatch;
+ (BOOL)wapiCapability;
+ (CGSize)mainScreenPointSize;
+ (CGSize)mainScreenSize;
+ (NSString)activePairedSystemVersion;
+ (NSString)deviceClass;
+ (NSString)productType;
+ (double)mainScreenCornerRadius;
+ (double)mainScreenScale;
@end

@implementation ASCMobileGestalt

+ (BOOL)hasSystemTelephonyOfAnyKind
{
  return MGGetBoolAnswer(@"any-telephony", a2);
}

+ (BOOL)hasVenice
{
  return MGGetBoolAnswer(@"venice", a2);
}

+ (BOOL)wapiCapability
{
  return MGGetBoolAnswer(@"wapi", a2);
}

+ (NSString)deviceClass
{
  return (NSString *)(id)MGGetStringAnswer(@"DeviceClass", a2);
}

+ (NSString)productType
{
  return (NSString *)(id)MGGetStringAnswer(@"ProductType", a2);
}

+ (BOOL)hasHEVCDecoding
{
  return MGGetBoolAnswer(@"N8lZxRgC7lfdRS3dRLn+Ag", a2);
}

+ (CGSize)mainScreenSize
{
  v2 = (void *)MGCopyAnswer(@"MainScreenCanvasSizes", 0LL);
  v3 = v2;
  if (v2
    && (id v4 = v2,
        v5 = (char *)[v4 bytes],
        unint64_t v6 = (unint64_t)[v4 length],
        v6 >= 0x10))
  {
    v9 = (double *)&v5[v6 & 0xFFFFFFFFFFFFFFF0LL];
    double v7 = *(v9 - 2);
    double v8 = *(v9 - 1);
  }

  else
  {
    double v7 = (double)(int)MGGetSInt32Answer(@"main-screen-width", 0LL);
    double v8 = (double)(int)MGGetSInt32Answer(@"main-screen-height", 0LL);
  }

  double v10 = v7;
  double v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (double)mainScreenScale
{
  return MGGetFloat32Answer(@"main-screen-scale", a2, 2.0);
}

+ (double)mainScreenCornerRadius
{
  return MGGetFloat32Answer(@"DeviceCornerRadius", a2, 2.0);
}

+ (CGSize)mainScreenPointSize
{
  CGFloat v3 = 1.0 / v2;
  +[ASCMobileGestalt mainScreenSize](&OBJC_CLASS___ASCMobileGestalt, "mainScreenSize");
  double v5 = v4;
  double v7 = v6;
  CGAffineTransformMakeScale(&v10, v3, v3);
  double v8 = v7 * v10.c + v10.a * v5;
  double v9 = v7 * v10.d + v10.b * v5;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (BOOL)isPad
{
  return MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 3;
}

+ (BOOL)isStandaloneWatch
{
  return 0;
}

+ (NSString)activePairedSystemVersion
{
  return 0LL;
}

+ (BOOL)isAppleSiliconMac
{
  return 0;
}

+ (BOOL)hasCapabilities:(id)a3
{
  return +[ASCMobileGestalt hasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:]( &OBJC_CLASS___ASCMobileGestalt,  "hasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:",  a3,  0LL);
}

+ (BOOL)hasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4
{
  BOOL v4 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        CGAffineTransform v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v10, "isEqualToString:", &stru_1001276D8, (void)v15) & 1) == 0)
        {
          double v11 = (const __CFBoolean *)(v4 ? _MGCopyAnswerWithMode(v10, 1LL) : MGCopyAnswer(v10, 0LL));
          v12 = v11;
          if (v11) {
            CFRelease(v11);
          }
          if (v12 != kCFBooleanTrue)
          {
            BOOL v13 = 0;
            goto LABEL_17;
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 1;
LABEL_17:

  return v13;
}

@end