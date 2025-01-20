@interface PBVolumeControlService
- (PBSExternalControlFeature)muteFeature;
- (PBSExternalControlFeature)volumeFeature;
- (PBSExternalControlSystem)controlSystem;
- (PBVolumeControlService)init;
- (float)_absoluteVolumeLevelWithStep:(id)a3;
- (id)absoluteVolumeLevel;
- (id)volumeControlCapabilities;
- (void)adjustRelativeVolumeLevel:(id)a3 error:(id *)a4;
- (void)setAbsoluteVolumeLevel:(id)a3 error:(id *)a4;
- (void)setControlSystem:(id)a3;
- (void)setIsMuted:(id)a3 error:(id *)a4;
- (void)setMuteFeature:(id)a3;
- (void)setVolumeFeature:(id)a3;
@end

@implementation PBVolumeControlService

- (PBVolumeControlService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBVolumeControlService;
  v2 = -[PBVolumeControlService init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
    controlSystem = v2->_controlSystem;
    v2->_controlSystem = (PBSExternalControlSystem *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[PBSExternalControlFeature featureForType:](&OBJC_CLASS___PBSExternalControlFeature, "featureForType:", 1LL));
    volumeFeature = v2->_volumeFeature;
    v2->_volumeFeature = (PBSExternalControlFeature *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[PBSExternalControlFeature featureForType:](&OBJC_CLASS___PBSExternalControlFeature, "featureForType:", 2LL));
    muteFeature = v2->_muteFeature;
    v2->_muteFeature = (PBSExternalControlFeature *)v7;
  }

  return v2;
}

- (id)volumeControlCapabilities
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService volumeFeature](self, "volumeFeature"));
  if (![v3 isReadyForUse])
  {
    BOOL v8 = 0;
    int v9 = 0;
    BOOL v7 = 0;
    goto LABEL_5;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService volumeFeature](self, "volumeFeature"));
  unsigned int v5 = [v4 isConfiguredForUse];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService volumeFeature](self, "volumeFeature"));
    BOOL v7 = [v6 transport] == (id)1;

    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService volumeFeature](self, "volumeFeature"));
    BOOL v8 = [v3 transport] == (id)2;
    int v9 = 1;
LABEL_5:

    goto LABEL_7;
  }

  BOOL v8 = 0;
  int v9 = 0;
  BOOL v7 = 0;
LABEL_7:
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService muteFeature](self, "muteFeature"));
  if (![v10 isReadyForUse])
  {
    unsigned int v12 = 0;
    int v15 = 0;
    BOOL v14 = 0;
    goto LABEL_11;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService muteFeature](self, "muteFeature"));
  unsigned int v12 = [v11 isConfiguredForUse];

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService muteFeature](self, "muteFeature"));
    BOOL v14 = [v13 transport] == (id)1;

    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService muteFeature](self, "muteFeature"));
    unsigned int v12 = [v10 transport] == (id)2;
    int v15 = 1;
LABEL_11:

    goto LABEL_13;
  }

  int v15 = 0;
  BOOL v14 = 0;
LABEL_13:
  id v16 = sub_1000848D8();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 67110400;
    v22[1] = v9;
    __int16 v23 = 1024;
    BOOL v24 = v7;
    __int16 v25 = 1024;
    BOOL v26 = v8;
    __int16 v27 = 1024;
    int v28 = v15;
    __int16 v29 = 1024;
    BOOL v30 = v14;
    __int16 v31 = 1024;
    unsigned int v32 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Capabilities: VOL:%{BOOL}d isCEC:%{BOOL}d isIR:%{BOOL}d  MUTE:%{BOOL}d isCEC:%{BOOL}d isIR:%{BOOL}d",  (uint8_t *)v22,  0x26u);
  }

  id v18 = sub_1000848D8();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "TODO: Need CoreControl absolute volume support [84956626] for capabilities.",  (uint8_t *)v22,  2u);
  }

  if (v14) {
    uint64_t v20 = 5LL;
  }
  else {
    uint64_t v20 = 1LL;
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  v20));
}

- (id)absoluteVolumeLevel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService volumeControlCapabilities](self, "volumeControlCapabilities"));
  unsigned __int8 v3 = [v2 unsignedIntValue];

  id v4 = sub_1000848D8();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if ((v3 & 2) != 0)
  {
    float v7 = 0.5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "TODO: Use controlSystem to get absolute volume [84956626]",  v10,  2u);
    }
  }

  else
  {
    float v7 = -1.0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100278A24();
    }
  }

  *(float *)&double v8 = v7;
  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
}

- (void)setAbsoluteVolumeLevel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  float v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService volumeControlCapabilities](self, "volumeControlCapabilities"));
  unsigned __int8 v8 = [v7 unsignedIntValue];

  id v9 = sub_1000848D8();
  objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if ((v8 & 2) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "TODO: Use controlSystem to set absolute volume to %@ [84956626]",  (uint8_t *)&v12,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100278A24();
    }

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSVolumeControlServiceErrorDomain,  1LL,  0LL));
    }
  }
}

- (void)adjustRelativeVolumeLevel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  float v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService volumeControlCapabilities](self, "volumeControlCapabilities"));
  unsigned __int8 v8 = [v7 unsignedIntValue];

  if ((v8 & 2) != 0)
  {
    -[PBVolumeControlService _absoluteVolumeLevelWithStep:](self, "_absoluteVolumeLevelWithStep:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    -[PBVolumeControlService setAbsoluteVolumeLevel:error:](self, "setAbsoluteVolumeLevel:error:", v11, a4);
  }

  else if ((v8 & 1) != 0)
  {
    signed int v12 = [v6 unsignedIntValue] - 1;
    if (v12 > 5)
    {
      uint64_t v14 = 0LL;
      id v13 = "DOWN";
      uint64_t v15 = 1LL;
    }

    else
    {
      id v13 = off_1003D4238[v12];
      uint64_t v14 = qword_1002EC340[v12];
      uint64_t v15 = qword_1002EC370[v12];
    }

    id v16 = sub_1000848D8();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      __int16 v23 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Relative volume level change: %ldx %s",  buf,  0x16u);
    }

    do
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService controlSystem](self, "controlSystem"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10008DEA0;
      v19[3] = &unk_1003D41F8;
      v19[4] = v14;
      v19[5] = a4;
      [v18 sendAction:v14 withCompletion:v19];

      --v15;
    }

    while (v15);
  }

  else
  {
    id v9 = sub_1000848D8();
    objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100278A50();
    }

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSVolumeControlServiceErrorDomain,  1LL,  0LL));
    }
  }
}

- (void)setIsMuted:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService volumeControlCapabilities](self, "volumeControlCapabilities", a3));
  unsigned __int8 v7 = [v6 unsignedIntValue];

  if ((v7 & 4) != 0)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService controlSystem](self, "controlSystem"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10008E01C;
    v11[3] = &unk_1003D41F8;
    v11[4] = 16LL;
    v11[5] = a4;
    [v10 sendAction:16 withCompletion:v11];
  }

  else
  {
    id v8 = sub_1000848D8();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100278AE4();
    }

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSVolumeControlServiceErrorDomain,  1LL,  0LL));
    }
  }

- (float)_absoluteVolumeLevelWithStep:(id)a3
{
  id v4 = a3;
  if (qword_1004707F8 != -1) {
    dispatch_once(&qword_1004707F8, &stru_1003D4218);
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeControlService absoluteVolumeLevel](self, "absoluteVolumeLevel"));
  [v5 floatValue];
  float v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue([off_10046A968 objectForKeyedSubscript:v4]);
  [v8 floatValue];
  float v10 = v7 + v9;

  float v11 = 0.0;
  if (v10 >= 0.0)
  {
    float v11 = v10;
    if (v10 > 1.0) {
      float v11 = 1.0;
    }
  }

  return v11;
}

- (PBSExternalControlSystem)controlSystem
{
  return self->_controlSystem;
}

- (void)setControlSystem:(id)a3
{
}

- (PBSExternalControlFeature)volumeFeature
{
  return self->_volumeFeature;
}

- (void)setVolumeFeature:(id)a3
{
}

- (PBSExternalControlFeature)muteFeature
{
  return self->_muteFeature;
}

- (void)setMuteFeature:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end