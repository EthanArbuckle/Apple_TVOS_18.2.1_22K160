@interface SATVBluetoothRemotePairingManager
+ (id)sharedInstance;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
@end

@implementation SATVBluetoothRemotePairingManager

+ (id)sharedInstance
{
  if (qword_1001097A0 != -1) {
    dispatch_once(&qword_1001097A0, &stru_1000C9730);
  }
  return (id)qword_100109798;
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v8 = a4;
  id v9 = a3;
  id v10 = sub_10002AF94();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Pairing requested in OOB", v12, 2u);
  }

  [v9 respondToPairingRequest:v8 type:a5 accept:1 data:0];
}

@end