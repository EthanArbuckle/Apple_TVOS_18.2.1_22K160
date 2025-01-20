@interface HMKTCoreDataCommand
+ (void)initialize;
@end

@implementation HMKTCoreDataCommand

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___HMKTCoreDataCommand, a2) == a1)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___HMDOPACKTransformer);
    +[NSValueTransformer setValueTransformer:forName:]( &OBJC_CLASS___NSValueTransformer,  "setValueTransformer:forName:",  v2,  @"HMDCoreDataTransformerHMFPairingIdentity");
    +[NSValueTransformer setValueTransformer:forName:]( &OBJC_CLASS___NSValueTransformer,  "setValueTransformer:forName:",  v2,  @"HMDCoreDataTransformerHAPPairingIdentity");
    +[NSValueTransformer setValueTransformer:forName:]( &OBJC_CLASS___NSValueTransformer,  "setValueTransformer:forName:",  v2,  @"HMDCoreDataTransformerHAPPairingIdentitySet");
    +[NSValueTransformer setValueTransformer:forName:]( &OBJC_CLASS___NSValueTransformer,  "setValueTransformer:forName:",  v2,  @"HMDCoreDataTransformerHMCameraActivityZone");
    +[NSValueTransformer setValueTransformer:forName:]( &OBJC_CLASS___NSValueTransformer,  "setValueTransformer:forName:",  v2,  @"HMDCoreDataTransformerHMCameraActivityZoneSet");
    +[NSValueTransformer setValueTransformer:forName:]( &OBJC_CLASS___NSValueTransformer,  "setValueTransformer:forName:",  v2,  @"HMDHomeNFCReaderKeyTransformer");
    +[NSValueTransformer setValueTransformer:forName:]( &OBJC_CLASS___NSValueTransformer,  "setValueTransformer:forName:",  v2,  @"HMDCoreDataTransformerProfilePhotoCropRect");
  }

@end