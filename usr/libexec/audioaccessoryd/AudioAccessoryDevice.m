@interface AudioAccessoryDevice
- (BOOL)updateWithAADeviceRecord:(id)a3;
@end

@implementation AudioAccessoryDevice

- (BOOL)updateWithAADeviceRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allowNoiseManagementOff];
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AllowListeningModeOff")
    && (_DWORD)v5 != -[AudioAccessoryDevice listeningModeOffAllowed](self, "listeningModeOffAllowed"))
  {
    -[AudioAccessoryDevice setListeningModeOffAllowed:](self, "setListeningModeOffAllowed:", v5);
    int v6 = 1;
  }

  else
  {
    int v6 = 0;
  }

  if (_os_feature_enabled_impl("ConnectedAudio", "HearingAid"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 audiogramCreationTimestamp]);
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAccessoryDevice audiogramEnrolledTimestamp](self, "audiogramEnrolledTimestamp"));
      unsigned __int8 v9 = [v7 isEqualToDate:v8];

      if ((v9 & 1) == 0)
      {
        -[AudioAccessoryDevice setAudiogramEnrolledTimestamp:](self, "setAudiogramEnrolledTimestamp:", v7);
        int v6 = 1;
      }
    }
  }

  id v10 = [v4 headGestureMode];
  if ((_DWORD)v10 != -[AudioAccessoryDevice headGestureToggle](self, "headGestureToggle"))
  {
    -[AudioAccessoryDevice setHeadGestureToggle:](self, "setHeadGestureToggle:", v10);
    int v6 = 1;
  }

  id v11 = [v4 acceptReplyPlayPauseConfig];
  if ((_DWORD)v11 != -[AudioAccessoryDevice acceptReplyPlayPauseConfig]( self,  "acceptReplyPlayPauseConfig"))
  {
    -[AudioAccessoryDevice setAcceptReplyPlayPauseConfig:](self, "setAcceptReplyPlayPauseConfig:", v11);
    int v6 = 1;
  }

  id v12 = [v4 declineDismissSkipConfig];
  if ((_DWORD)v12 == -[AudioAccessoryDevice declineDismissSkipConfig](self, "declineDismissSkipConfig"))
  {
    if (!v6)
    {
      BOOL v13 = 0;
      goto LABEL_27;
    }
  }

  else
  {
    -[AudioAccessoryDevice setDeclineDismissSkipConfig:](self, "setDeclineDismissSkipConfig:", v12);
  }

  if (dword_100234260 <= 30)
  {
    if (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)) {
      LogPrintF( &dword_100234260,  "-[AudioAccessoryDevice(AARecord) updateWithAADeviceRecord:]",  30LL,  "AADeviceRecord changed: %@",  v4);
    }
    if (dword_100234260 <= 30
      && (dword_100234260 != -1 || _LogCategory_Initialize(&dword_100234260, 30LL)))
    {
      LogPrintF( &dword_100234260,  "-[AudioAccessoryDevice(AARecord) updateWithAADeviceRecord:]",  30LL,  "updated device with AADeviceRecord, device: %@",  self);
    }
  }

  BOOL v13 = 1;
LABEL_27:

  return v13;
}

@end