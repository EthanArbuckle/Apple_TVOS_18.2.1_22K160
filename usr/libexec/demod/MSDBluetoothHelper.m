@interface MSDBluetoothHelper
+ (id)sharedInstance;
- (BOOL)preserveBTPairingRecord;
@end

@implementation MSDBluetoothHelper

+ (id)sharedInstance
{
  if (qword_100125238 != -1) {
    dispatch_once(&qword_100125238, &stru_1000F9348);
  }
  return (id)qword_100125230;
}

- (BOOL)preserveBTPairingRecord
{
  return 0;
}

@end