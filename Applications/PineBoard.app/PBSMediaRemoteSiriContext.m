@interface PBSMediaRemoteSiriContext
+ (id)_bluetoothRemoteContext;
+ (id)contextWithGestureRecognizer:(id)a3;
+ (id)contextWithGestureRecognizer:(id)a3 options:(unint64_t)a4;
+ (id)contextWithHIDEvent:(__IOHIDEvent *)a3;
+ (id)contextWithHIDEvent:(__IOHIDEvent *)a3 options:(unint64_t)a4;
+ (id)contextWithSystemGestureActivationContext:(id)a3;
+ (id)contextWithSystemGestureActivationContext:(id)a3 options:(unint64_t)a4;
@end

@implementation PBSMediaRemoteSiriContext

+ (id)contextWithSystemGestureActivationContext:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 contextWithSystemGestureActivationContext:a3 options:0]);
}

+ (id)contextWithSystemGestureActivationContext:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _bluetoothRemoteContext]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 senderID]));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringValue]);

  [v7 setDeviceID:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);

  if ((v4 & 1) != 0 && v10) {
    objc_msgSend(v7, "setButtonDownMachTime:", objc_msgSend(v10, "unsignedLongValue"));
  }

  return v7;
}

+ (id)contextWithGestureRecognizer:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue([a1 contextWithGestureRecognizer:a3 options:0]);
}

+ (id)contextWithGestureRecognizer:(id)a3 options:(unint64_t)a4
{
  return (id)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "contextWithHIDEvent:options:",  objc_msgSend(a3, "pb_eventRef"),  a4));
}

+ (id)contextWithHIDEvent:(__IOHIDEvent *)a3
{
  return (id)objc_claimAutoreleasedReturnValue([a1 contextWithHIDEvent:a3 options:0]);
}

+ (id)contextWithHIDEvent:(__IOHIDEvent *)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _bluetoothRemoteContext]);
  if (a3)
  {
    v7 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  IOHIDEventGetSenderID(a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringValue]);

    [v6 setDeviceID:v9];
    if ((v4 & 1) != 0) {
      [v6 setButtonDownMachTime:IOHIDEventGetTimeStamp(a3)];
    }
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);

    [v6 setDeviceID:v9];
  }

  return v6;
}

+ (id)_bluetoothRemoteContext
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote"));
  id v4 = [v3 remoteType];

  [v2 setBluetoothRemoteType:v4];
  [v2 setSourceName:PBSMediaRemoteSiriContextSourceNameAppleRemote];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote"));
  id v6 = [v5 supportsPushToTalk];

  [v2 setIsSourcePTTEligible:v6];
  return v2;
}

@end