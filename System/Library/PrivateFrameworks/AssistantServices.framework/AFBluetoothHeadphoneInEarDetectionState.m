@interface AFBluetoothHeadphoneInEarDetectionState
+ (unint64_t)encodeForBTAddress:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5;
+ (void)decodeFromNotifyState:(unint64_t)a3 withCompletion:(id)a4;
@end

@implementation AFBluetoothHeadphoneInEarDetectionState

+ (unint64_t)encodeForBTAddress:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v23 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@":" withString:&stru_1004FECA0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v10));

  unint64_t v12 = 0LL;
  if ([v11 scanHexLongLong:&v23])
  {
    v23 *= 2LL;
    unsigned int v13 = [v8 isEnabled];
    uint64_t v23 = 4 * (v23 | v13);
    unint64_t v14 = (unint64_t)[v8 primaryEarbudSide];
    uint64_t v23 = 4 * (v23 | v14);
    unint64_t v15 = (unint64_t)[v8 primaryInEarStatus];
    uint64_t v23 = 4 * (v23 | v15);
    unint64_t v16 = (unint64_t)[v8 secondaryInEarStatus];
    uint64_t v23 = 2 * (v23 | v16);
    unsigned int v17 = [v9 isEnabled];
    uint64_t v23 = 4 * (v23 | v17);
    unint64_t v18 = (unint64_t)[v9 primaryEarbudSide];
    uint64_t v23 = 4 * (v23 | v18);
    unint64_t v19 = (unint64_t)[v9 primaryInEarStatus];
    uint64_t v23 = 4 * (v23 | v19);
    unint64_t v20 = (unint64_t)[v9 secondaryInEarStatus];
    unint64_t v12 = v23 | v20;
    v23 |= v20;
    v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v25 = "+[AFBluetoothHeadphoneInEarDetectionState(ADBluetoothObserver) encodeForBTAddress:headphoneInEarDetectionSta"
            "teDidChangeFrom:to:]";
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2112;
      id v31 = v9;
      __int16 v32 = 2048;
      unint64_t v33 = v12;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s Encoding (%@) %@ -> %@: %lld",  buf,  0x34u);
      unint64_t v12 = v23;
    }
  }

  return v12;
}

+ (void)decodeFromNotifyState:(unint64_t)a3 withCompletion:(id)a4
{
  unint64_t v12 = (void (**)(id, void *, id, id))a4;
  uint64x2_t v11 = (uint64x2_t)vdupq_n_s64(a3);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006AB08;
  v17[3] = &unk_1004EEEC0;
  BOOL v20 = (a3 & 0x40) != 0;
  int8x16_t v10 = (int8x16_t)vdupq_n_s64(3uLL);
  int8x16_t v18 = vandq_s8((int8x16_t)vshlq_u64(v11, (uint64x2_t)xmmword_1003CA2C0), v10);
  unint64_t v19 = a3 & 3;
  id v5 = +[AFBluetoothHeadphoneInEarDetectionState newWithBuilder:]( &OBJC_CLASS___AFBluetoothHeadphoneInEarDetectionState,  "newWithBuilder:",  v17);
  unint64_t v6 = a3 >> 14;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006AB68;
  v13[3] = &unk_1004EEEC0;
  BOOL v16 = (a3 & 0x2000) != 0;
  int8x16_t v14 = vandq_s8((int8x16_t)vshlq_u64(v11, (uint64x2_t)xmmword_1003CA2D0), v10);
  unint64_t v15 = (a3 >> 7) & 3;
  id v7 = +[AFBluetoothHeadphoneInEarDetectionState newWithBuilder:]( &OBJC_CLASS___AFBluetoothHeadphoneInEarDetectionState,  "newWithBuilder:",  v13);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%2llX",  v6));
  if ((unint64_t)[v8 length] >= 3)
  {
    unint64_t v9 = 2LL;
    do
    {
      [v8 insertString:@":" atIndex:v9];
      v9 += 3LL;
    }

    while (v9 < (unint64_t)[v8 length]);
  }

  v12[2](v12, v8, v7, v5);
}

@end