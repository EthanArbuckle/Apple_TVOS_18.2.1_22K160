@interface AudioAccessoryDeviceInfo
- (NSString)identifier;
- (char)hearingAidConfig;
- (char)hearingAidEnrolled;
- (char)hearingAidGainSwipeEnabled;
- (char)hearingAssistEnabled;
- (char)heartRateMonitorEnabled;
- (id)xpcObjectRepresentation;
- (unint64_t)changeFlags;
- (unint64_t)discoveryFlags;
- (unint64_t)updateWithClassicDevice:(void *)a3;
- (unsigned)autoANCCapability;
- (unsigned)autoANCStrength;
- (unsigned)bobbleCapability;
- (unsigned)caseSoundCapability;
- (unsigned)earTipFitTestCapability;
- (unsigned)frequencyBand;
- (unsigned)hearingAidCapability;
- (unsigned)hearingProtectionCapability;
- (unsigned)hearingTestCapability;
- (unsigned)hideEarDetectionCapability;
- (unsigned)hideOffListeningModeCapability;
- (unsigned)siriMultitoneCapability;
- (unsigned)streamStateAoS;
- (void)setAutoANCCapability:(unsigned int)a3;
- (void)setAutoANCStrength:(unsigned int)a3;
- (void)setBobbleCapability:(unsigned __int8)a3;
- (void)setCaseSoundCapability:(unsigned __int8)a3;
- (void)setChangeFlags:(unint64_t)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setEarTipFitTestCapability:(unsigned __int8)a3;
- (void)setFrequencyBand:(unsigned __int8)a3;
- (void)setHearingAidCapability:(unsigned __int8)a3;
- (void)setHearingAidConfig:(char)a3;
- (void)setHearingAidEnrolled:(char)a3;
- (void)setHearingAidGainSwipeEnabled:(char)a3;
- (void)setHearingAssistEnabled:(char)a3;
- (void)setHearingProtectionCapability:(unsigned __int8)a3;
- (void)setHearingTestCapability:(unsigned __int8)a3;
- (void)setHeartRateMonitorEnabled:(char)a3;
- (void)setHideEarDetectionCapability:(unsigned __int8)a3;
- (void)setHideOffListeningModeCapability:(unsigned __int8)a3;
- (void)setIdentifier:(id)a3;
- (void)setSiriMultitoneCapability:(unsigned __int8)a3;
- (void)setStreamStateAoS:(unsigned __int8)a3;
@end

@implementation AudioAccessoryDeviceInfo

- (id)xpcObjectRepresentation
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t autoANCCapability = self->_autoANCCapability;
  id v5 = v3;
  v6 = v5;
  if ((_DWORD)autoANCCapability) {
    xpc_dictionary_set_uint64(v5, "aaCp", autoANCCapability);
  }

  uint64_t autoANCStrength = self->_autoANCStrength;
  id v8 = v6;
  v9 = v8;
  if ((_DWORD)autoANCStrength) {
    xpc_dictionary_set_uint64(v8, "aaSt", autoANCStrength);
  }

  uint64_t bobbleCapability = self->_bobbleCapability;
  id v11 = v9;
  v12 = v11;
  if (bobbleCapability) {
    xpc_dictionary_set_uint64(v11, "bbCp", bobbleCapability);
  }

  uint64_t caseSoundCapability = self->_caseSoundCapability;
  id v14 = v12;
  v15 = v14;
  if (caseSoundCapability) {
    xpc_dictionary_set_uint64(v14, "caCp", caseSoundCapability);
  }

  uint64_t earTipFitTestCapability = self->_earTipFitTestCapability;
  id v17 = v15;
  v18 = v17;
  if (earTipFitTestCapability) {
    xpc_dictionary_set_uint64(v17, "erFt", earTipFitTestCapability);
  }

  uint64_t frequencyBand = self->_frequencyBand;
  id v20 = v18;
  v21 = v20;
  if (frequencyBand) {
    xpc_dictionary_set_uint64(v20, "fqBd", frequencyBand);
  }

  uint64_t hearingAidCapability = self->_hearingAidCapability;
  id v23 = v21;
  v24 = v23;
  if (hearingAidCapability) {
    xpc_dictionary_set_uint64(v23, "haCp", hearingAidCapability);
  }

  int64_t hearingAidConfig = self->_hearingAidConfig;
  id v26 = v24;
  v27 = v26;
  if (hearingAidConfig) {
    xpc_dictionary_set_int64(v26, "haCg", hearingAidConfig);
  }

  int64_t hearingAidEnrolled = self->_hearingAidEnrolled;
  id v29 = v27;
  v30 = v29;
  if (hearingAidEnrolled) {
    xpc_dictionary_set_int64(v29, "haEn", hearingAidEnrolled);
  }

  int64_t hearingAidGainSwipeEnabled = self->_hearingAidGainSwipeEnabled;
  id v32 = v30;
  v33 = v32;
  if (hearingAidGainSwipeEnabled) {
    xpc_dictionary_set_int64(v32, "haGS", hearingAidGainSwipeEnabled);
  }

  int64_t hearingAssistEnabled = self->_hearingAssistEnabled;
  id v35 = v33;
  v36 = v35;
  if (hearingAssistEnabled) {
    xpc_dictionary_set_int64(v35, "hrEn", hearingAssistEnabled);
  }

  uint64_t hearingProtectionCapability = self->_hearingProtectionCapability;
  id v38 = v36;
  v39 = v38;
  if (hearingProtectionCapability) {
    xpc_dictionary_set_uint64(v38, "hpCp", hearingProtectionCapability);
  }

  uint64_t hearingTestCapability = self->_hearingTestCapability;
  id v41 = v39;
  v42 = v41;
  if (hearingTestCapability) {
    xpc_dictionary_set_uint64(v41, "htcp", hearingTestCapability);
  }

  int64_t heartRateMonitorEnabled = self->_heartRateMonitorEnabled;
  id v44 = v42;
  v45 = v44;
  if (heartRateMonitorEnabled) {
    xpc_dictionary_set_int64(v44, "hrmt", heartRateMonitorEnabled);
  }

  uint64_t hideEarDetectionCapability = self->_hideEarDetectionCapability;
  id v47 = v45;
  v48 = v47;
  if (hideEarDetectionCapability) {
    xpc_dictionary_set_uint64(v47, "hiED", hideEarDetectionCapability);
  }

  uint64_t hideOffListeningModeCapability = self->_hideOffListeningModeCapability;
  id v50 = v48;
  v51 = v50;
  if (hideOffListeningModeCapability) {
    xpc_dictionary_set_uint64(v50, "hoCp", hideOffListeningModeCapability);
  }

  identifier = self->_identifier;
  id v53 = v51;
  v54 = identifier;
  v55 = -[NSString UTF8String](v54, "UTF8String");
  if (v55) {
    xpc_dictionary_set_string(v53, "aaID", v55);
  }

  uint64_t siriMultitoneCapability = self->_siriMultitoneCapability;
  id v57 = v53;
  v58 = v57;
  if (siriMultitoneCapability) {
    xpc_dictionary_set_uint64(v57, "smcp", siriMultitoneCapability);
  }

  uint64_t streamStateAoS = self->_streamStateAoS;
  id v60 = v58;
  v61 = v60;
  if (streamStateAoS) {
    xpc_dictionary_set_uint64(v60, "aoST", streamStateAoS);
  }

  return v61;
}

- (unint64_t)updateWithClassicDevice:(void *)a3
{
  uint64_t v5 = *((unsigned __int8 *)a3 + 1371);
  if ((_DWORD)v5 == -[AudioAccessoryDeviceInfo streamStateAoS](self, "streamStateAoS"))
  {
    unint64_t v6 = 0LL;
  }

  else
  {
    -[AudioAccessoryDeviceInfo setStreamStateAoS:](self, "setStreamStateAoS:", v5);
    unint64_t v6 = 0x80000000000LL;
  }

  unsigned int v7 = sub_1003E0350((uint64_t)a3, 0xB0u);
  if (v7 < 3)
  {
    LODWORD(v8) = v7 + 1;
  }

  else
  {
    if (dword_1008D67F0 <= 90
      && (dword_1008D67F0 != -1 || _LogCategory_Initialize(&dword_1008D67F0, 90LL)))
    {
      LogPrintF_safe( &dword_1008D67F0,  "-[AudioAccessoryDeviceInfo updateWithClassicDevice:]",  90LL,  "Invalid value received. Setting autoANCCapability to Unknown");
    }

    LODWORD(v8) = 0;
  }

  int v9 = sub_1003E0350((uint64_t)a3, 0x18u);
  if (v9) {
    uint64_t v8 = (v9 + 1);
  }
  else {
    uint64_t v8 = v8;
  }
  if ((_DWORD)v8 != -[AudioAccessoryDeviceInfo autoANCCapability](self, "autoANCCapability"))
  {
    -[AudioAccessoryDeviceInfo setAutoANCCapability:](self, "setAutoANCCapability:", v8);
    unint64_t v6 = 0x80000000000LL;
  }

  int v10 = sub_1003DFF88((uint64_t)a3);
  if (v10)
  {
    if (v10 == 50 || v10 == 100)
    {
      uint64_t v11 = (v10 + 1000);
    }

    else
    {
      if (dword_1008D67F0 <= 90
        && (dword_1008D67F0 != -1 || _LogCategory_Initialize(&dword_1008D67F0, 90LL)))
      {
        LogPrintF_safe( &dword_1008D67F0,  "-[AudioAccessoryDeviceInfo updateWithClassicDevice:]",  90LL,  "Invalid value received. Setting autoANCStrength to Unknown");
      }

      uint64_t v11 = 0LL;
    }
  }

  else
  {
    uint64_t v11 = 1000LL;
  }

  if ((_DWORD)v11 != -[AudioAccessoryDeviceInfo autoANCStrength](self, "autoANCStrength"))
  {
    -[AudioAccessoryDeviceInfo setAutoANCStrength:](self, "setAutoANCStrength:", v11);
    unint64_t v6 = 0x80000000000LL;
  }

  else {
    int v12 = 1;
  }
  if (v12 != -[AudioAccessoryDeviceInfo bobbleCapability](self, "bobbleCapability"))
  {
    -[AudioAccessoryDeviceInfo setBobbleCapability:](self, "setBobbleCapability:", v12);
    unint64_t v6 = 0x80000000000LL;
  }

  else {
    int v13 = 1;
  }
  if (v13 != -[AudioAccessoryDeviceInfo caseSoundCapability](self, "caseSoundCapability"))
  {
    -[AudioAccessoryDeviceInfo setCaseSoundCapability:](self, "setCaseSoundCapability:", v13);
    v6 |= 0x80000000000uLL;
  }

  else {
    int v14 = 1;
  }
  if (v14 != -[AudioAccessoryDeviceInfo earTipFitTestCapability](self, "earTipFitTestCapability"))
  {
    -[AudioAccessoryDeviceInfo setEarTipFitTestCapability:](self, "setEarTipFitTestCapability:", v14);
    v6 |= 0x80000000000uLL;
  }

  if (*((_BYTE *)a3 + 1373)) {
    int v15 = 2;
  }
  else {
    int v15 = 1;
  }
  if (v15 != -[AudioAccessoryDeviceInfo frequencyBand](self, "frequencyBand"))
  {
    -[AudioAccessoryDeviceInfo setFrequencyBand:](self, "setFrequencyBand:", v15);
    v6 |= 0x80000000000uLL;
  }

  else {
    int v16 = 1;
  }
  if (v16 != -[AudioAccessoryDeviceInfo hearingAidCapability](self, "hearingAidCapability"))
  {
    -[AudioAccessoryDeviceInfo setHearingAidCapability:](self, "setHearingAidCapability:", v16);
    v6 |= 0x80000000000uLL;
  }

  int v17 = sub_1003E5E08((uint64_t)a3);
  if (v17 == 1) {
    uint64_t v18 = 1LL;
  }
  else {
    uint64_t v18 = 2 * (v17 == 2);
  }
  if ((_DWORD)v18 != -[AudioAccessoryDeviceInfo hearingAidConfig](self, "hearingAidConfig"))
  {
    -[AudioAccessoryDeviceInfo setHearingAidConfig:](self, "setHearingAidConfig:", v18);
    v6 |= 0x80000000000uLL;
  }

  int v19 = sub_1003E5D28((uint64_t)a3);
  if (v19 == 1) {
    uint64_t v20 = 1LL;
  }
  else {
    uint64_t v20 = 2 * (v19 == 2);
  }
  if ((_DWORD)v20 != -[AudioAccessoryDeviceInfo hearingAidEnrolled](self, "hearingAidEnrolled"))
  {
    -[AudioAccessoryDeviceInfo setHearingAidEnrolled:](self, "setHearingAidEnrolled:", v20);
    v6 |= 0x80000000000uLL;
  }

  int v21 = sub_1003DFFCC((uint64_t)a3);
  if (v21 == 1) {
    uint64_t v22 = 1LL;
  }
  else {
    uint64_t v22 = 2 * (v21 == 2);
  }
  if ((_DWORD)v22 != -[AudioAccessoryDeviceInfo hearingAidGainSwipeEnabled](self, "hearingAidGainSwipeEnabled"))
  {
    -[AudioAccessoryDeviceInfo setHearingAidGainSwipeEnabled:](self, "setHearingAidGainSwipeEnabled:", v22);
    v6 |= 0x80000000000uLL;
  }

  int v23 = sub_1003E0010((uint64_t)a3);
  if (v23 == 1) {
    uint64_t v24 = 1LL;
  }
  else {
    uint64_t v24 = 2 * (v23 == 2);
  }
  if ((_DWORD)v24 != -[AudioAccessoryDeviceInfo hearingAssistEnabled](self, "hearingAssistEnabled"))
  {
    -[AudioAccessoryDeviceInfo setHearingAssistEnabled:](self, "setHearingAssistEnabled:", v24);
    v6 |= 0x80000000000uLL;
  }

  else {
    int v25 = 1;
  }
  if (v25 != -[AudioAccessoryDeviceInfo hearingProtectionCapability](self, "hearingProtectionCapability"))
  {
    -[AudioAccessoryDeviceInfo setHearingProtectionCapability:]( self,  "setHearingProtectionCapability:",  v25);
    v6 |= 0x80000000000uLL;
  }

  else {
    int v26 = 1;
  }
  if (v26 != -[AudioAccessoryDeviceInfo hearingTestCapability](self, "hearingTestCapability"))
  {
    -[AudioAccessoryDeviceInfo setHearingTestCapability:](self, "setHearingTestCapability:", v26);
    v6 |= 0x80000000000uLL;
  }

  int v27 = sub_1003E0098((uint64_t)a3);
  if (v27 == 1) {
    uint64_t v28 = 1LL;
  }
  else {
    uint64_t v28 = 2 * (v27 == 2);
  }
  if ((_DWORD)v28 != -[AudioAccessoryDeviceInfo heartRateMonitorEnabled](self, "heartRateMonitorEnabled"))
  {
    -[AudioAccessoryDeviceInfo setHeartRateMonitorEnabled:](self, "setHeartRateMonitorEnabled:", v28);
    v6 |= 0x80000000000uLL;
  }

  else {
    int v29 = 1;
  }
  if (v29 != -[AudioAccessoryDeviceInfo hideEarDetectionCapability](self, "hideEarDetectionCapability"))
  {
    -[AudioAccessoryDeviceInfo setHideEarDetectionCapability:]( self,  "setHideEarDetectionCapability:",  v29);
    v6 |= 0x80000000000uLL;
  }

  else {
    int v30 = 1;
  }
  if (v30 != -[AudioAccessoryDeviceInfo hideOffListeningModeCapability](self, "hideOffListeningModeCapability"))
  {
    -[AudioAccessoryDeviceInfo setHideOffListeningModeCapability:]( self,  "setHideOffListeningModeCapability:",  v30);
    v6 |= 0x80000000000uLL;
  }

  else {
    int v31 = 1;
  }
  if (v31 != -[AudioAccessoryDeviceInfo siriMultitoneCapability](self, "siriMultitoneCapability"))
  {
    -[AudioAccessoryDeviceInfo setSiriMultitoneCapability:](self, "setSiriMultitoneCapability:", v31);
    v6 |= 0x80000000000uLL;
  }

  return v6;
}

- (unsigned)autoANCCapability
{
  return self->_autoANCCapability;
}

- (void)setAutoANCCapability:(unsigned int)a3
{
  self->_uint64_t autoANCCapability = a3;
}

- (unsigned)autoANCStrength
{
  return self->_autoANCStrength;
}

- (void)setAutoANCStrength:(unsigned int)a3
{
  self->_uint64_t autoANCStrength = a3;
}

- (unsigned)bobbleCapability
{
  return self->_bobbleCapability;
}

- (void)setBobbleCapability:(unsigned __int8)a3
{
  self->_uint64_t bobbleCapability = a3;
}

- (unsigned)caseSoundCapability
{
  return self->_caseSoundCapability;
}

- (void)setCaseSoundCapability:(unsigned __int8)a3
{
  self->_uint64_t caseSoundCapability = a3;
}

- (unsigned)earTipFitTestCapability
{
  return self->_earTipFitTestCapability;
}

- (void)setEarTipFitTestCapability:(unsigned __int8)a3
{
  self->_uint64_t earTipFitTestCapability = a3;
}

- (unsigned)frequencyBand
{
  return self->_frequencyBand;
}

- (void)setFrequencyBand:(unsigned __int8)a3
{
  self->_uint64_t frequencyBand = a3;
}

- (unsigned)hearingAidCapability
{
  return self->_hearingAidCapability;
}

- (void)setHearingAidCapability:(unsigned __int8)a3
{
  self->_uint64_t hearingAidCapability = a3;
}

- (char)hearingAidEnrolled
{
  return self->_hearingAidEnrolled;
}

- (void)setHearingAidEnrolled:(char)a3
{
  self->_int64_t hearingAidEnrolled = a3;
}

- (char)hearingAidConfig
{
  return self->_hearingAidConfig;
}

- (void)setHearingAidConfig:(char)a3
{
  self->_int64_t hearingAidConfig = a3;
}

- (char)hearingAidGainSwipeEnabled
{
  return self->_hearingAidGainSwipeEnabled;
}

- (void)setHearingAidGainSwipeEnabled:(char)a3
{
  self->_int64_t hearingAidGainSwipeEnabled = a3;
}

- (char)hearingAssistEnabled
{
  return self->_hearingAssistEnabled;
}

- (void)setHearingAssistEnabled:(char)a3
{
  self->_int64_t hearingAssistEnabled = a3;
}

- (unsigned)hearingProtectionCapability
{
  return self->_hearingProtectionCapability;
}

- (void)setHearingProtectionCapability:(unsigned __int8)a3
{
  self->_uint64_t hearingProtectionCapability = a3;
}

- (unsigned)hearingTestCapability
{
  return self->_hearingTestCapability;
}

- (void)setHearingTestCapability:(unsigned __int8)a3
{
  self->_uint64_t hearingTestCapability = a3;
}

- (char)heartRateMonitorEnabled
{
  return self->_heartRateMonitorEnabled;
}

- (void)setHeartRateMonitorEnabled:(char)a3
{
  self->_int64_t heartRateMonitorEnabled = a3;
}

- (unsigned)hideEarDetectionCapability
{
  return self->_hideEarDetectionCapability;
}

- (void)setHideEarDetectionCapability:(unsigned __int8)a3
{
  self->_uint64_t hideEarDetectionCapability = a3;
}

- (unsigned)hideOffListeningModeCapability
{
  return self->_hideOffListeningModeCapability;
}

- (void)setHideOffListeningModeCapability:(unsigned __int8)a3
{
  self->_uint64_t hideOffListeningModeCapability = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)siriMultitoneCapability
{
  return self->_siriMultitoneCapability;
}

- (void)setSiriMultitoneCapability:(unsigned __int8)a3
{
  self->_uint64_t siriMultitoneCapability = a3;
}

- (unsigned)streamStateAoS
{
  return self->_streamStateAoS;
}

- (void)setStreamStateAoS:(unsigned __int8)a3
{
  self->_uint64_t streamStateAoS = a3;
}

- (unint64_t)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unint64_t)a3
{
  self->_changeFlags = a3;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (void).cxx_destruct
{
}

@end