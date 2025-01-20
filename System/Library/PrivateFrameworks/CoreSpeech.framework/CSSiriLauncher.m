@interface CSSiriLauncher
+ (id)sharedLauncher;
- (void)_notifyBuiltInVoiceTriggerPrewarm:(id)a3 activationSource:(int64_t)a4 completion:(id)a5;
- (void)deactivateSiriActivationConnectionWithReason:(int64_t)a3 withOptions:(unint64_t)a4 withContext:(id)a5;
- (void)notifyBluetoothDeviceVoiceTrigger:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)notifyBluetoothDeviceVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)notifyBuiltInVoiceTrigger:(id)a3 myriadPHash:(id)a4 completion:(id)a5;
- (void)notifyBuiltInVoiceTriggerPrewarm:(id)a3 completion:(id)a4;
- (void)notifyBuiltInVoiceTriggerPrewarmExclave:(id)a3 completion:(id)a4;
- (void)notifyCarPlayVoiceTrigger:(id)a3 deviceId:(id)a4 myriadPHash:(id)a5 completion:(id)a6;
- (void)notifyCarPlayVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)notifyContinuousConversationActivation:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)notifyDarwinVoiceTrigger:(id)a3 deviceId:(id)a4 myriadPHash:(id)a5 myriadLateActivationExpirationTime:(id)a6 completion:(id)a7;
- (void)notifyDarwinVoiceTriggerPrewarmWithCompletion:(id)a3;
- (void)notifyRemoraVoiceTrigger:(id)a3 myriadPHash:(id)a4 deviceId:(id)a5 completion:(id)a6;
- (void)notifyRemoraVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)notifyWakeKeywordSpokenBluetoothDevice:(id)a3 deviceId:(id)a4;
- (void)notifyWakeKeywordSpokenCarPlay:(id)a3 deviceId:(id)a4;
- (void)notifyWakeKeywordSpokenInBuiltInMic:(id)a3;
- (void)notifyWakeKeywordSpokenRemora:(id)a3 deviceId:(id)a4;
@end

@implementation CSSiriLauncher

- (void)notifyBuiltInVoiceTriggerPrewarmExclave:(id)a3 completion:(id)a4
{
}

- (void)notifyBuiltInVoiceTriggerPrewarm:(id)a3 completion:(id)a4
{
}

- (void)_notifyBuiltInVoiceTriggerPrewarm:(id)a3 activationSource:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = mach_absolute_time();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000B9188;
  v11[3] = &unk_10022C470;
  id v12 = v7;
  int64_t v13 = a4;
  id v10 = v7;
  AFSiriActivationVoiceTriggerPrewarm(v9, a4, 0LL, v8, v11);
}

- (void)notifyBuiltInVoiceTrigger:(id)a3 myriadPHash:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v24 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v10 = v9;
  if (v7)
  {
    [v9 setObject:v7 forKey:AFSiriActivationUserInfoKey[1]];
    unsigned __int8 v11 = +[CSUtils isFirstPassSourceTypeRingtoneWithVTEI:]( &OBJC_CLASS___CSUtils,  "isFirstPassSourceTypeRingtoneWithVTEI:",  v7);
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  if (+[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework"))
  {
    id v12 = &OBJC_CLASS___SCDAContext;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000B8D78;
    v32[3] = &unk_10022C498;
    int64_t v13 = &v33;
    id v33 = v24;
    unsigned __int8 v34 = v11;
    v14 = v32;
  }

  else
  {
    id v12 = &OBJC_CLASS___AFMyriadContext;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000B8EA4;
    v29[3] = &unk_10022C4C0;
    int64_t v13 = &v30;
    id v30 = v24;
    unsigned __int8 v31 = v11;
    v14 = v29;
  }

  id v15 = [v12 newWithBuilder:v14];

  if (v15)
  {
    unsigned int v16 = +[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework");
    uint64_t v17 = 2LL;
    if (v16) {
      uint64_t v17 = 10LL;
    }
    [v10 setObject:v15 forKey:AFSiriActivationUserInfoKey[v17]];
  }

  unsigned int v18 = +[CSUtils isVoiceTriggerFromExclaveWithVTEI:]( &OBJC_CLASS___CSUtils,  "isVoiceTriggerFromExclaveWithVTEI:",  v7);
  if (v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger]( &OBJC_CLASS___CSFVoiceTriggerEventInfoSelfLogger,  "sharedLogger"));
    [v19 logSiriLaunchStartedWithVoiceTriggerEventInfo:v7];
  }

  if (v18) {
    uint64_t v20 = 16LL;
  }
  else {
    uint64_t v20 = 1LL;
  }
  uint64_t v21 = mach_absolute_time();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000B8FD0;
  v25[3] = &unk_10022C4E8;
  id v27 = v8;
  uint64_t v28 = v20;
  id v26 = v7;
  id v22 = v8;
  id v23 = v7;
  AFSiriActivationVoiceTriggerActivate(v21, v20, 0LL, v10, v25);
}

- (void)notifyWakeKeywordSpokenInBuiltInMic:(id)a3
{
  uint64_t v3 = mach_absolute_time();
  AFSiriActivationVoiceKeywordDetected(v3, 1LL, 0LL, 0LL, &stru_10022C528);
}

- (void)notifyCarPlayVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = mach_absolute_time();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B8AFC;
  v12[3] = &unk_10022C550;
  id v13 = v7;
  id v11 = v7;
  AFSiriActivationVoiceTriggerPrewarm(v10, 5LL, v8, v9, v12);
}

- (void)notifyCarPlayVoiceTrigger:(id)a3 deviceId:(id)a4 myriadPHash:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  if (+[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework"))
  {
    id v13 = &OBJC_CLASS___SCDAContext;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000B8884;
    v30[3] = &unk_10022C578;
    v14 = &v31;
    id v31 = v10;
    id v15 = v30;
  }

  else
  {
    id v13 = &OBJC_CLASS___AFMyriadContext;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000B88EC;
    v28[3] = &unk_10022C5A0;
    v14 = &v29;
    id v29 = v10;
    id v15 = v28;
  }

  id v16 = [v13 newWithBuilder:v15];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned int v18 = v17;
  if (v9) {
    [v17 setObject:v9 forKey:AFSiriActivationUserInfoKey[1]];
  }
  if (v16)
  {
    unsigned int v19 = +[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework");
    uint64_t v20 = 2LL;
    if (v19) {
      uint64_t v20 = 10LL;
    }
    [v18 setObject:v16 forKey:AFSiriActivationUserInfoKey[v20]];
  }

  if (v9)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger]( &OBJC_CLASS___CSFVoiceTriggerEventInfoSelfLogger,  "sharedLogger"));
    [v21 logSiriLaunchStartedWithVoiceTriggerEventInfo:v9];
  }

  uint64_t v22 = mach_absolute_time();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000B8954;
  v25[3] = &unk_10022C5C8;
  id v26 = v9;
  id v27 = v11;
  id v23 = v11;
  id v24 = v9;
  AFSiriActivationVoiceTriggerActivate(v22, 5LL, v12, v18, v25);
}

- (void)notifyWakeKeywordSpokenCarPlay:(id)a3 deviceId:(id)a4
{
  id v5 = a4;
  uint64_t v4 = mach_absolute_time();
  AFSiriActivationVoiceKeywordDetected(v4, 5LL, v5, 0LL, &stru_10022C5E8);
}

- (void)notifyBluetoothDeviceVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = mach_absolute_time();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B86E8;
  v12[3] = &unk_10022C550;
  id v13 = v7;
  id v11 = v7;
  AFSiriActivationVoiceTriggerPrewarm(v10, 4LL, v8, v9, v12);
}

- (void)notifyBluetoothDeviceVoiceTrigger:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = v10;
  if (v7)
  {
    [v10 setObject:v7 forKey:AFSiriActivationUserInfoKey[1]];
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger]( &OBJC_CLASS___CSFVoiceTriggerEventInfoSelfLogger,  "sharedLogger"));
    [v12 logSiriLaunchStartedWithVoiceTriggerEventInfo:v7];
  }

  uint64_t v13 = mach_absolute_time();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B8540;
  v16[3] = &unk_10022C5C8;
  id v17 = v7;
  id v18 = v8;
  id v14 = v8;
  id v15 = v7;
  AFSiriActivationVoiceTriggerActivate(v13, 4LL, v9, v11, v16);
}

- (void)notifyWakeKeywordSpokenBluetoothDevice:(id)a3 deviceId:(id)a4
{
  id v5 = a4;
  uint64_t v4 = mach_absolute_time();
  AFSiriActivationVoiceKeywordDetected(v4, 4LL, v5, 0LL, &stru_10022C608);
}

- (void)notifyRemoraVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = mach_absolute_time();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B83A0;
  v12[3] = &unk_10022C550;
  id v13 = v7;
  id v11 = v7;
  AFSiriActivationVoiceTriggerPrewarm(v10, 12LL, v8, v9, v12);
}

- (void)notifyRemoraVoiceTrigger:(id)a3 myriadPHash:(id)a4 deviceId:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  if (+[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework"))
  {
    id v13 = &OBJC_CLASS___SCDAContext;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000B8128;
    v30[3] = &unk_10022C578;
    id v14 = &v31;
    id v31 = v10;
    id v15 = v30;
  }

  else
  {
    id v13 = &OBJC_CLASS___AFMyriadContext;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000B8190;
    v28[3] = &unk_10022C5A0;
    id v14 = &v29;
    id v29 = v10;
    id v15 = v28;
  }

  id v16 = [v13 newWithBuilder:v15];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v18 = v17;
  if (v9) {
    [v17 setObject:v9 forKey:AFSiriActivationUserInfoKey[1]];
  }
  if (v16)
  {
    unsigned int v19 = +[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework");
    uint64_t v20 = 2LL;
    if (v19) {
      uint64_t v20 = 10LL;
    }
    [v18 setObject:v16 forKey:AFSiriActivationUserInfoKey[v20]];
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger]( &OBJC_CLASS___CSFVoiceTriggerEventInfoSelfLogger,  "sharedLogger"));
  [v21 logSiriLaunchStartedWithVoiceTriggerEventInfo:v9];

  uint64_t v22 = mach_absolute_time();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000B81F8;
  v25[3] = &unk_10022C5C8;
  id v26 = v9;
  id v27 = v11;
  id v23 = v11;
  id v24 = v9;
  AFSiriActivationVoiceTriggerActivate(v22, 12LL, v12, v18, v25);
}

- (void)notifyWakeKeywordSpokenRemora:(id)a3 deviceId:(id)a4
{
  id v5 = a4;
  uint64_t v4 = mach_absolute_time();
  AFSiriActivationVoiceKeywordDetected(v4, 12LL, v5, 0LL, &stru_10022C628);
}

- (void)notifyContinuousConversationActivation:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[CSSiriLauncher notifyContinuousConversationActivation:deviceId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  uint64_t v11 = mach_absolute_time();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000B7F88;
  v13[3] = &unk_10022C550;
  id v14 = v9;
  id v12 = v9;
  AFSiriActivationContinuousConversation(v11, v8, v7, v13);
}

- (void)deactivateSiriActivationConnectionWithReason:(int64_t)a3 withOptions:(unint64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = [[AFSiriActivationConnection alloc] initWithServicePort:AFSiriActivationServiceGetPort()];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000B7ED0;
  v9[3] = &unk_10022C648;
  v9[4] = a3;
  [v8 deactivateForReason:a3 options:a4 context:v7 completion:v9];
}

- (void)notifyDarwinVoiceTriggerPrewarmWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = mach_absolute_time();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B7E50;
  v6[3] = &unk_10022C550;
  id v7 = v3;
  id v5 = v3;
  AFSiriActivationVoiceTriggerPrewarm(v4, 14LL, 0LL, 0LL, v6);
}

- (void)notifyDarwinVoiceTrigger:(id)a3 deviceId:(id)a4 myriadPHash:(id)a5 myriadLateActivationExpirationTime:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  if (+[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework"))
  {
    id v16 = &OBJC_CLASS___SCDAContext;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000B7B98;
    v36[3] = &unk_10022C670;
    id v17 = &v37;
    id v37 = v12;
    id v18 = &v38;
    id v38 = v13;
    unsigned int v19 = v36;
  }

  else
  {
    id v16 = &OBJC_CLASS___AFMyriadContext;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000B7C20;
    v33[3] = &unk_10022C698;
    id v17 = &v34;
    id v34 = v12;
    id v18 = &v35;
    id v35 = v13;
    unsigned int v19 = v33;
  }

  id v20 = objc_msgSend(v16, "newWithBuilder:", v19, v12);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v22 = v21;
  if (v11) {
    [v21 setObject:v11 forKey:AFSiriActivationUserInfoKey[1]];
  }
  if (v20)
  {
    unsigned int v23 = +[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework");
    uint64_t v24 = 2LL;
    if (v23) {
      uint64_t v24 = 10LL;
    }
    [v22 setObject:v20 forKey:AFSiriActivationUserInfoKey[v24]];
  }

  if (v11)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger]( &OBJC_CLASS___CSFVoiceTriggerEventInfoSelfLogger,  "sharedLogger"));
    [v25 logSiriLaunchStartedWithVoiceTriggerEventInfo:v11];
  }

  uint64_t v26 = mach_absolute_time();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000B7CA8;
  v30[3] = &unk_10022C5C8;
  id v31 = v11;
  id v32 = v14;
  id v27 = v14;
  id v28 = v11;
  AFSiriActivationHoneycombDeviceVoiceTrigger(v26, v15, v22, v30);
}

+ (id)sharedLauncher
{
  if (qword_10027FF60 != -1) {
    dispatch_once(&qword_10027FF60, &stru_10022C448);
  }
  return (id)qword_10027FF58;
}

@end