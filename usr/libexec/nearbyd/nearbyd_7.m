void sub_100389E20()
{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  sub_1000210A0();
  sub_10000B000( (void *)&_mh_execute_header,  v0,  v1,  "#wifi-service,error %d when attempting to stop AWDL network",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_100389E80()
{
}

void sub_100389EA8()
{
}

void sub_100389ED0()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#wifi-service,WiFiManagerClientCopyInterfaces returned null",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_100389EFC()
{
}

void sub_100389F28()
{
}

void sub_100389F54()
{
}

void sub_100389F80()
{
}

void sub_100389FAC()
{
}

void sub_100389FD8()
{
}

void sub_10038A004()
{
}

void sub_10038A064()
{
}

void sub_10038A090()
{
}

void sub_10038A0BC()
{
}

void sub_10038A11C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = 0x3FF0000000000000LL;
  sub_100021038( (void *)&_mh_execute_header,  a1,  a3,  "#wifi-service,Ranging start failed: kA11OpNotPermitted; retrying in %f seconds",
    (uint8_t *)&v3);
  sub_10000668C();
}

void sub_10038A18C()
{
}

void sub_10038A1B8()
{
}

void sub_10038A1E0()
{
}

__n128 sub_10038A240(uint8_t *a1, unint64_t a2, int8x8_t *a3, os_log_s *a4)
{
  uint64x2_t v4 = (uint64x2_t)vdupq_n_s64(a2);
  v5.i64[0] = 255LL;
  v5.i64[1] = 255LL;
  int8x16_t v6 = vorrq_s8( (int8x16_t)vshlq_u64( (uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v4, (uint64x2_t)xmmword_10040C780), v5),  (uint64x2_t)xmmword_10040C790),  vorrq_s8( (int8x16_t)vshlq_u64( (uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v4, (uint64x2_t)xmmword_10040C760), v5),  (uint64x2_t)xmmword_10040C770),  (int8x16_t)vshlq_u64( (uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v4, (uint64x2_t)xmmword_10040C740), v5),  (uint64x2_t)xmmword_10040C750)));
  *(_DWORD *)a1 = 134217984;
  *a3 = vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL));
  sub_100021028( (void *)&_mh_execute_header,  "#wifi-service,found empty peer list when creating array of peers for key 0x%llx",  a1,  a4);
  return result;
}

void sub_10038A2E8(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#wifi-service,maximum number of peers already being serviced: %i",  buf,  8u);
}

void sub_10038A330(_BYTE *a1, _BYTE *a2)
{
}

void sub_10038A35C()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#wifi-service,WiFiManagerClientCopyInterfaces returned null",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_10038A388()
{
}

void sub_10038A3B4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038A424(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100021038( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#wifi-service,error callback is nullptr for peer ID: %@",  (uint8_t *)a2);

  sub_10002107C();
}

void sub_10038A46C()
{
  sub_10002107C();
}

void sub_10038A4A8()
{
}

void sub_10038A4D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038A544()
{
}

void sub_10038A570()
{
}

void sub_10038A5A8(_BYTE *a1, _BYTE *a2)
{
}

void sub_10038A5D4()
{
  sub_10002107C();
}

void sub_10038A610(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "onWiFiDeviceClientRangingCallback2p4GHz";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#wifi-service,%s: fPeer2p4GHz should not be null when we are processing ranging results",  buf,  0xCu);
}

void sub_10038A65C()
{
}

void sub_10038A688()
{
}

void sub_10038A6B4()
{
}

void sub_10038A6E0()
{
}

void sub_10038A74C()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#wifi-service,Device attachment callback returned but interfaces are still null",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_10038A778()
{
}

void sub_10038A7A4()
{
}

void sub_10038A7D0()
{
}

void sub_10038A7FC()
{
}

void sub_10038A828()
{
}

void sub_10038A854()
{
}

void sub_10038A880()
{
}

void sub_10038A8AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "[NIPrivacyAuthorizationManager] asked to present prompt, but no display name.",  v1,  2u);
}

void sub_10038A8EC(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#bundle Error while getting bundle proxy for app: %@. Error: %@",  buf,  0x16u);
}

void sub_10038A950(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[PRRangingService] shouldAcceptNewConnection",  v1,  2u);
  sub_100003DB4();
}

void sub_10038A98C()
{
  __assert_rtn("PRCommonConvertTicksToSeconds", "PRCommon.mm", 43, "timebaseResult == KERN_SUCCESS");
}

void sub_10038A9B4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#wifi,Default value set for WiFiServiceNumMeas must be 1, 2, 4, or 8. invalid value: %d",  (uint8_t *)v2,  8u);
}

void sub_10038AA28(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#wifi,ranging role unspecified", v1, 2u);
}

void sub_10038AA68()
{
}

void sub_10038AA90()
{
}

void sub_10038AAB8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[PRBeaconRangingService] shouldAcceptNewConnection",  v1,  2u);
  sub_100003DB4();
}

void sub_10038AAF4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "WRTT: Unexpected hardware %u in getUnlockThreshold",  (uint8_t *)v2,  8u);
  sub_100003DB4();
}

void sub_10038AB64()
{
}

void sub_10038AB8C()
{
}

void sub_10038ABB4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#ni-ca,Unexpected location type received",  v1,  2u);
}

void sub_10038ABF4()
{
}

void sub_10038AC1C()
{
}

void sub_10038AC7C()
{
}

void sub_10038ACA8()
{
}

void sub_10038AD08()
{
}

void sub_10038AD34()
{
}

void sub_10038AD60()
{
}

void sub_10038AD8C()
{
}

void sub_10038ADB8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038AE20()
{
}

void sub_10038AE80()
{
}

void sub_10038AEE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038AF14( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038AF48(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 serviceName]);
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 2112;
  v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "[PRXPCServicesManager] no service listening for %@, connection: %@",  (uint8_t *)&v5,  0x16u);
}

void sub_10038B000()
{
}

void sub_10038B02C()
{
}

void sub_10038B058()
{
}

void sub_10038B084()
{
}

void sub_10038B0E8()
{
}

void sub_10038B150()
{
  int v3 = 138412546;
  uint64_t v4 = v0;
  __int16 v5 = 2112;
  uint64_t v6 = 0LL;
  sub_10000AFC4( (void *)&_mh_execute_header,  v1,  v2,  "#ses-container,Failed to configure specialized session %@. Error: %@",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_10038B1C4()
{
}

void sub_10038B22C()
{
}

void sub_10038B294()
{
}

void sub_10038B2FC(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#ses-container,Unable to run session due to activation failure. Activation error code: %ld",  buf,  0xCu);
}

void sub_10038B340()
{
}

void sub_10038B3A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038B410( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038B480( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038B4EC()
{
  uint64_t v3 = -5888LL;
  sub_10000AFC4((void *)&_mh_execute_header, v0, v1, "#ses-container,%@: Required parameter missing. Error: %ld", v2);
  sub_10000668C();
}

void sub_10038B558()
{
  uint64_t v3 = -10014LL;
  sub_10000AFC4( (void *)&_mh_execute_header,  v0,  v1,  "#ses-container,%@ failed due to session interruptions (Error: %ld). See next log line for interruptions.",  v2);
  sub_10000668C();
}

void sub_10038B5C4()
{
  sub_10002107C();
}

void sub_10038B600( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038B664(uint64_t a1, os_log_s *a2)
{
  int v2 = *(_DWORD *)(a1 + 236);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#ses-container,Failed to get bundle identifier for pid: %d. Non-fatal - bundle identifier will be nil",  (uint8_t *)v3,  8u);
  sub_100003DB4();
}

void sub_10038B6D8()
{
}

void sub_10038B704()
{
}

void sub_10038B730(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#ses-container,Entitlement with integer value %d is out of bounds",  (uint8_t *)v2,  8u);
  sub_100003DB4();
}

void sub_10038B7A0()
{
}

void sub_10038B7CC()
{
}

void sub_10038B7F8()
{
}

void sub_10038B824()
{
}

void sub_10038B850()
{
}

void sub_10038B87C()
{
}

void sub_10038B8A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038B90C()
{
}

void sub_10038B938()
{
}

void sub_10038B964( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038B9C8()
{
}

void sub_10038B9F4()
{
}

void sub_10038BA20()
{
}

void sub_10038BA48()
{
}

void sub_10038BA74()
{
}

void sub_10038BA9C()
{
}

void sub_10038BAC8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038BAFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038BB30(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[PRCompanionRangingService] shouldAcceptNewConnection",  v1,  2u);
  sub_100003DB4();
}

void sub_10038BB6C()
{
}

void sub_10038BB94()
{
}

void sub_10038BBBC()
{
}

void sub_10038BBE4()
{
}

void sub_10038BC0C()
{
}

void sub_10038BC34()
{
}

void sub_10038BC5C()
{
}

void sub_10038BC84()
{
}

void sub_10038BCAC()
{
}

void sub_10038BCD4()
{
}

void sub_10038BCFC()
{
}

void sub_10038BD24()
{
}

void sub_10038BD4C()
{
}

void sub_10038BD74()
{
}

void sub_10038BD9C()
{
}

void sub_10038BDC4()
{
}

void sub_10038BDEC()
{
}

void sub_10038BE14()
{
}

void sub_10038BE3C()
{
}

void sub_10038BE64()
{
}

void sub_10038BE8C()
{
}

void sub_10038BEB4()
{
}

void sub_10038BEDC()
{
}

void sub_10038BF04()
{
}

void sub_10038BF2C()
{
}

void sub_10038BF54()
{
}

void sub_10038BF7C()
{
}

void sub_10038BFA4()
{
}

void sub_10038BFCC()
{
}

void sub_10038BFF4()
{
}

void sub_10038C01C()
{
}

void sub_10038C044()
{
}

void sub_10038C06C()
{
}

void sub_10038C094()
{
}

void sub_10038C0BC()
{
}

void sub_10038C0E4()
{
}

void sub_10038C10C()
{
}

void sub_10038C134()
{
}

void sub_10038C15C()
{
}

void sub_10038C184()
{
}

void sub_10038C1AC()
{
}

void sub_10038C1D4()
{
}

void sub_10038C1FC()
{
}

void sub_10038C224()
{
}

void sub_10038C24C()
{
}

void sub_10038C274()
{
}

void sub_10038C29C()
{
}

void sub_10038C2C4()
{
}

void sub_10038C2EC()
{
}

void sub_10038C314()
{
}

void sub_10038C33C()
{
}

void sub_10038C364()
{
}

void sub_10038C38C()
{
}

void sub_10038C3B4()
{
}

void sub_10038C3DC()
{
}

void sub_10038C404()
{
}

void sub_10038C42C()
{
}

void sub_10038C454()
{
}

void sub_10038C47C()
{
}

void sub_10038C4A4()
{
}

void sub_10038C4CC()
{
}

void sub_10038C4F4()
{
}

void sub_10038C51C()
{
}

void sub_10038C544()
{
}

void sub_10038C56C()
{
}

void sub_10038C594()
{
}

void sub_10038C5BC()
{
}

void sub_10038C5E4()
{
}

void sub_10038C60C()
{
}

void sub_10038C634()
{
}

void sub_10038C65C()
{
}

void sub_10038C684()
{
}

void sub_10038C6AC()
{
}

void sub_10038C6D4()
{
}

void sub_10038C6FC()
{
}

void sub_10038C724()
{
}

void sub_10038C74C()
{
}

void sub_10038C774()
{
}

void sub_10038C79C()
{
}

void sub_10038C7C4(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#me,MeasEngMetricsCalculator::checkTOACIRDataEvent: firstPathAmplitude <= 0: %3f\n",  (uint8_t *)&v2,  0xCu);
}

void sub_10038C83C()
{
  __assert_rtn( "addRangeMeasurement",  "MeasurementEngineTypes.cpp",  36,  "timestampOfOldestMeasurement <= rangeMeasurement.machAbsoluteTimeSec");
}

void sub_10038C864()
{
  __assert_rtn( "getRangeOffsetFromMedian",  "MeasurementEngineTypes.cpp",  62,  "history.size() <= kNumMeasurementsForOutlierCheck");
}

void sub_10038C88C()
{
  __assert_rtn("getAoaHypotheses", "AoACalculator.cpp", 81, "fRevLUTs_ptr != nullptr");
}

void sub_10038C8B4()
{
  __assert_rtn("nn_preprocess", "NeuralNetworkClassifier.cpp", 169, "fNNParamsPtr != nullptr");
}

void sub_10038C8DC()
{
  __assert_rtn( "nn_preprocess",  "NeuralNetworkClassifier.cpp",  184,  "cir_samples.size() == kNumOfChains && cir_samples[0].size() == kNumOfCirSamplesPerChain");
}

void sub_10038C904()
{
  __assert_rtn("nn_core", "NeuralNetworkClassifier.cpp", 244, "fNNParamsPtr != nullptr");
}

void sub_10038C92C()
{
  __assert_rtn("nn_core", "NeuralNetworkClassifier.cpp", 246, "input.size() == kNNLayer0InputDimension");
}

void sub_10038C954()
{
}

void sub_10038C97C(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#aggr,addRangeResult: no mach continuous time (mach abs = %.9f), ignoring",  (uint8_t *)&v3,  0xCu);
  sub_10000668C();
}

BOOL sub_10038C9F0(os_log_t log, _BYTE *a2)
{
  *(_WORD *)uint64_t v4 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#aggr,addRangeResult: got both AOA and TOA CIR events, purging both!",  v4,  2u);
  return *a2 == 0;
}

void sub_10038CA48(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#aggr,RoseMeasurementBuffer::clear", v1, 2u);
}

void sub_10038CA88()
{
}

void sub_10038CAE8()
{
}

void sub_10038CB48()
{
}

void sub_10038CBA8(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#aggr,sendReceivedRoseMeasurements: no measurements for ticketId %hu targetMac 0x%016llx",  (uint8_t *)v3,  0x12u);
  sub_10000668C();
}

void sub_10038CC2C()
{
}

void sub_10038CC54(unsigned __int16 a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#aggr,failed to obtain device mac address for ticket_id %hu",  (uint8_t *)v2,  8u);
}

void sub_10038CCCC()
{
  __assert_rtn( "sendIfHaveReceivedRoseMeasurementsFromTimestamps",  "MeasurementAggregator.cpp",  490,  "matchingLocalRangeTimestampEvent.value().ticketId() == matchingRemoteRangeTimestampEvent.value().ticketId()");
}

void sub_10038CCF4()
{
}

void sub_10038CD20()
{
}

void sub_10038CD4C()
{
}

void sub_10038CD78()
{
}

void sub_10038CDA4()
{
}

void sub_10038CDD0(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#me,RoseMeasurementEngine::getRangeResult: error: local and remote timestamp values are inconsistent with measured f requency. Computed range: %lf",  (uint8_t *)&v2,  0xCu);
}

void sub_10038CE48()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100003DB4();
}

void sub_10038CE74()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#me,RoseMeasurementEngine::checkTimestampAndFrequencyConsistency: denominator is zero, returning false",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_10038CEA0()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#me,RoseMeasurementEngine::computeRange: denominator is zero, returning NaN",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_10038CECC()
{
}

void sub_10038CEF4()
{
}

void sub_10038CF1C()
{
  __assert_rtn("relayMessage", "CoexProxyObject.cpp", 29, "fDataProvider != nullptr");
}

void sub_10038CF44(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "CoexProxy: skip event because EventConsumer is not ready yet",  v1,  2u);
}

void sub_10038CF8C()
{
}

void sub_10038CFB8(unsigned __int8 a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = a1;
  sub_1001322F4((void *)&_mh_execute_header, a3, (uint64_t)a3, "#sp,mms_rx_status = %d", (uint8_t *)a2);
}

void sub_10038CFF8()
{
}

void sub_10038D024()
{
  __assert_rtn( "registerForComputationType",  "RoseSolutionProvider.cpp",  88,  "type != RoseComputationPreference::Unspecified");
}

void sub_10038D04C()
{
}

void sub_10038D0B0()
{
}

void sub_10038D0DC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038D140(void *a1, os_log_s *a2)
{
  uint64_t v2 = (a1[1] - *a1) / 144LL;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#sp,computeAndEmitSensorFusionSolution(imu_data): got %zu solutions",  (uint8_t *)&v3,  0xCu);
  sub_10000668C();
}

void sub_10038D1C0()
{
}

void sub_10038D1EC()
{
}

void sub_10038D218()
{
}

void sub_10038D244()
{
}

void sub_10038D270()
{
}

void sub_10038D29C()
{
}

void sub_10038D2C8()
{
}

void sub_10038D2F4()
{
}

void sub_10038D320()
{
}

void sub_10038D34C()
{
}

void sub_10038D378()
{
}

void sub_10038D3A4()
{
}

void sub_10038D3D0()
{
}

void sub_10038D408()
{
}

void sub_10038D434()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100003DB4();
}

void sub_10038D498()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100003DB4();
}

void sub_10038D4FC()
{
}

void sub_10038D564()
{
  __assert_rtn( "ingestRangeResult",  "RoseSolutionProvider.cpp",  270,  "range_rslt.source() == RangeResultSource::Firmware");
}

void sub_10038D58C()
{
}

void sub_10038D5B8()
{
}

void sub_10038D5E4()
{
}

void sub_10038D610()
{
}

void sub_10038D63C()
{
}

void sub_10038D668()
{
}

void sub_10038D694()
{
}

void sub_10038D6C0()
{
}

void sub_10038D6EC()
{
}

void sub_10038D718()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100003DB4();
}

void sub_10038D77C()
{
}

void sub_10038D7A8()
{
}

void sub_10038D7D4()
{
}

void sub_10038D7FC()
{
}

void sub_10038D864()
{
}

void sub_10038D8CC()
{
}

void sub_10038D8F8(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 64);
  int v4 = 134218240;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#sp,computeAndEmitSensorFusionSolution(rose_data): failed to convert mach abs time %.9f to mach continuous; ignoring. Peer: 0x%llx",
    (uint8_t *)&v4,
    0x16u);
  sub_10000668C();
}

void sub_10038D97C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038D9E4()
{
}

void sub_10038DA4C(uint64_t a1)
{
}

void sub_10038DA5C(uint64_t a1)
{
  int v2 = *(void **)(a1 + 832);
  if (v2)
  {
    *(void *)(a1 + 840) = v2;
    operator delete(v2);
  }

void sub_10038DA74()
{
}

void sub_10038DAA0()
{
}

void sub_10038DACC()
{
}

void sub_10038DAF8()
{
}

void sub_10038DB58()
{
}

void sub_10038DBB8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038DC1C()
{
}

void sub_10038DC7C()
{
}

void sub_10038DCA8()
{
}

void sub_10038DCD4()
{
}

void sub_10038DD34()
{
}

void sub_10038DD60()
{
}

void sub_10038DD8C()
{
}

void sub_10038DDB8(uint64_t a1)
{
}

void sub_10038DDD8(uint64_t a1)
{
}

void sub_10038DDF8(uint64_t a1)
{
}

void sub_10038DE08()
{
}

void sub_10038DE30()
{
}

void sub_10038DE58()
{
}

void sub_10038DE80()
{
}

void sub_10038DEA8()
{
}

void sub_10038DED0()
{
  __assert_rtn("emitServiceResponse", "RoseServiceProvider.mm", 414, "fServiceClient != nullptr");
}

void sub_10038DEF8()
{
}

void sub_10038DF20()
{
}

void sub_10038DF48()
{
}

void sub_10038DF70()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100137EF8((void *)&_mh_execute_header, v2, v3, "[RoseServiceProvider] %s", v4);
}

void sub_10038DFC4()
{
}

void sub_10038DFF0()
{
}

void sub_10038E018()
{
}

void sub_10038E044(uint64_t a1)
{
}

void sub_10038E054(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 72);
  if (v2)
  {
    *(void *)(a1 + 80) = v2;
    operator delete(v2);
  }

void sub_10038E06C()
{
}

void sub_10038E094()
{
}

void sub_10038E0BC()
{
}

void sub_10038E0E4()
{
}

void sub_10038E10C()
{
}

void sub_10038E134()
{
}

void sub_10038E15C(uint64_t a1, os_log_s *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#sp,[Solution Provider]   r1 access_slot_index: %d",  (uint8_t *)v3,  8u);
}

void sub_10038E1D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#sp,[Solution Provider] mach cont time: UNKNOWN",  v1,  2u);
}

void sub_10038E214( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038E280( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038E2EC()
{
  __assert_rtn("RoseServiceRequest", "RoseServiceRequest.cpp", 58, "role != serviceattributes::Role::Unspecified");
}

void sub_10038E314()
{
  __assert_rtn( "RoseServiceRequest",  "RoseServiceRequest.cpp",  59,  "mac_mode != serviceattributes::MacMode::Unspecified");
}

void sub_10038E33C()
{
}

void sub_10038E364()
{
}

void sub_10038E38C()
{
}

void sub_10038E3B4()
{
}

void sub_10038E3DC()
{
}

void sub_10038E404()
{
  __assert_rtn( "grJobRequestAssignInitiatorParameters",  "RoseRequestsFactory.cpp",  331,  "params.updateRate != UpdateRate::Unspecified");
}

void sub_10038E42C()
{
}

void sub_10038E454()
{
}

void sub_10038E47C()
{
  __assert_rtn( "grJobRequestAssignInitiatorParameters",  "RoseRequestsFactory.cpp",  338,  "txSlotSize250Usec >= GR_DEFAULT_TX_MINI_SLOT_SIZE_250us");
}

void sub_10038E4A4()
{
  __assert_rtn( "grJobRequestAssignInitiatorParameters",  "RoseRequestsFactory.cpp",  339,  "rxSlotSize250Usec >= GR_DEFAULT_TX_MINI_SLOT_SIZE_250us");
}

void sub_10038E4CC()
{
}

void sub_10038E4F4()
{
}

void sub_10038E51C()
{
}

void sub_10038E544()
{
  __assert_rtn( "grJobRequestAssignInitiatorParameters",  "RoseRequestsFactory.cpp",  370,  "params.expectedNumberOfPeers == 1");
}

void sub_10038E56C()
{
  __assert_rtn("getGrJobType", "RoseRequestsFactory.cpp", 656, "grType != HSI_GR_TYPE_MAX");
}

void sub_10038E594()
{
  __assert_rtn( "ServiceRequest",  "RoseRequestsFactory.cpp",  851,  "aopJobType == aop::AOPRoseJobType::Alisha_CCC || aopJobType == aop::AOPRoseJobType::Alisha_ACWG");
}

void sub_10038E5BC()
{
}

void sub_10038E5E4()
{
}

void sub_10038E60C()
{
}

void sub_10038E634()
{
}

void sub_10038E65C()
{
}

void sub_10038E684()
{
}

void sub_10038E6AC()
{
}

void sub_10038E6D4()
{
}

void sub_10038E6FC()
{
}

void sub_10038E724()
{
}

void sub_10038E74C()
{
}

void sub_10038E774()
{
}

void sub_10038E79C()
{
}

void sub_10038E7C4()
{
}

void sub_10038E7EC()
{
}

void sub_10038E814(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Client has not provided values for antenna masks, using default values.",  v1,  2u);
}

void sub_10038E854()
{
}

void sub_10038E880()
{
}

void sub_10038E8AC()
{
}

void sub_10038E8D8()
{
}

void sub_10038E904()
{
}

void sub_10038E930()
{
}

void sub_10038E95C()
{
}

void sub_10038E988()
{
}

void sub_10038E9EC()
{
}

void sub_10038EA50()
{
}

void sub_10038EA7C()
{
}

void sub_10038EAA8()
{
}

void sub_10038EB0C()
{
}

void sub_10038EB38()
{
}

void sub_10038EB9C()
{
}

void sub_10038EC00()
{
}

void sub_10038EC64()
{
}

void sub_10038EC90()
{
}

void sub_10038ECBC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 688);
  if (v2) {
    sub_1001477D0(v2, a1);
  }
}

void sub_10038ECD0()
{
}

void *sub_10038ECFC(void *result, void *a2)
{
  if ((void *)*result == a2)
  {
    uint64_t v2 = 4LL;
  }

  else
  {
    if (!*result) {
      return result;
    }
    uint64_t v2 = 5LL;
    a2 = (void *)*result;
  }

  return (void *)(*(uint64_t (**)(void *))(*a2 + 8 * v2))(a2);
}

void sub_10038ED3C()
{
}

void sub_10038ED64()
{
}

void sub_10038ED8C()
{
}

void sub_10038EDB4()
{
}

void sub_10038EDDC()
{
}

void sub_10038EE08()
{
}

void sub_10038EE34()
{
}

void sub_10038EE60( unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  HIDWORD(v17) = v8;
  sub_1001477E4( (void *)&_mh_execute_header,  v9,  v10,  "RoseScheduler - %s",  v11,  v12,  v13,  v14,  v15,  (uint64_t)__p.__r_.__value_.__l.__data_,  __p.__r_.__value_.__l.__size_,  __p.__r_.__value_.__l.__cap_,  2u);
  sub_100147814();
}

void sub_10038EEF0()
{
}

void sub_10038EF1C()
{
}

void sub_10038EF7C()
{
}

void sub_10038EFDC()
{
}

void sub_10038F03C()
{
}

void sub_10038F09C()
{
}

void sub_10038F0FC()
{
}

void sub_10038F15C()
{
}

void sub_10038F194(int a1)
{
  HIDWORD(v11) = v1;
  sub_1001477E4( (void *)&_mh_execute_header,  v2,  v3,  "RoseScheduler::handleServiceRequestStatusUpdate got unexpected status update %s",  v4,  v5,  v6,  v7,  v8,  (uint64_t)__p[0],  (uint64_t)__p[1],  v10,  2u);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }
  sub_100147814();
}

void sub_10038F224()
{
}

void sub_10038F24C()
{
}

void sub_10038F274()
{
}

void sub_10038F29C()
{
}

void sub_10038F2C8()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "Failed to handle BT adv roll. setNewRoseMacAddress returned false.",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_10038F2F4()
{
}

void sub_10038F31C()
{
}

void sub_10038F348()
{
}

void sub_10038F374()
{
}

void sub_10038F39C()
{
}

void sub_10038F3C4()
{
}

void sub_10038F3EC()
{
}

void sub_10038F414()
{
}

void sub_10038F440(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 648);
  if (v2)
  {
    *(void *)(a1 + 656) = v2;
    operator delete(v2);
  }

void sub_10038F458(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2) {
    sub_1001477C8(v2, a1);
  }
}

void sub_10038F46C(_BYTE *a1, uint64_t a2)
{
  if (*a1)
  {
    uint64_t v2 = *(void **)(a2 + 648);
    if (v2)
    {
      *(void *)(a2 + 656) = v2;
      operator delete(v2);
    }
  }

void sub_10038F488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001477F8("SetupProxyObjects", "ProxyObjectConsumerBase.h", a3, "proxyObj != nullptr");
}

void sub_10038F4AC()
{
}

void sub_10038F4D4()
{
}

void sub_10038F4FC()
{
  __assert_rtn("relayMessage", "AOPRoseProxyObject.cpp", 26, "fDataProvider != nullptr");
}

void sub_10038F524()
{
  __assert_rtn("relayMessage", "AOPRoseProxyObject.cpp", 33, "fDataProvider != nullptr");
}

void sub_10038F54C()
{
  __assert_rtn("ingestEvent", "AOPRoseProxyObject.cpp", 40, "fEventConsumer != nullptr");
}

void sub_10038F574()
{
  __assert_rtn("ingestEvent", "AOPRoseProxyObject.cpp", 48, "fMeasurementConsumer != nullptr");
}

void sub_10038F59C()
{
}

void sub_10038F5C4()
{
}

void sub_10038F5EC()
{
}

void sub_10038F614()
{
}

void sub_10038F63C()
{
}

void sub_10038F664()
{
}

void sub_10038F68C()
{
}

void sub_10038F6B4()
{
}

void sub_10038F6DC()
{
}

void sub_10038F704()
{
}

void sub_10038F72C()
{
}

void sub_10038F754()
{
}

void sub_10038F780()
{
}

void sub_10038F7AC()
{
}

void sub_10038F7D8()
{
}

void sub_10038F804()
{
}

void sub_10038F830( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038F898( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10038F908()
{
}

void sub_10038F934()
{
}

void sub_10038F960()
{
}

void sub_10038F98C()
{
}

void sub_10038F9B8()
{
}

void sub_10038F9E4()
{
}

void sub_10038FA10()
{
}

void sub_10038FA3C()
{
}

void sub_10038FA68()
{
}

void sub_10038FA94()
{
}

void sub_10038FAC0()
{
}

void sub_10038FAEC()
{
}

void sub_10038FB18()
{
}

void sub_10038FB44()
{
}

void sub_10038FB70()
{
}

void sub_10038FB98()
{
}

void sub_10038FBC0()
{
}

void sub_10038FBE8()
{
}

void sub_10038FC10()
{
}

void sub_10038FC3C()
{
}

void sub_10038FC68(unsigned __int8 *a1, uint64_t a2, os_log_s *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_100155128( (void *)&_mh_execute_header,  a2,  a3,  "PRSupervisorPacketBuilder::PTSCmd: invalid session role %d",  (uint8_t *)a2);
}

void sub_10038FCA4()
{
}

void sub_10038FCD0()
{
}

void sub_10038FCF8()
{
}

void sub_10038FD20()
{
}

void sub_10038FD48()
{
}

void sub_10038FD70()
{
}

void sub_10038FD9C()
{
}

void sub_10038FDC8()
{
}

void sub_10038FDF0()
{
}

void sub_10038FE18()
{
}

void sub_10038FE40()
{
}

void sub_10038FE68()
{
}

void sub_10038FE94()
{
}

void sub_10038FEC0()
{
}

void sub_10038FEEC()
{
}

void sub_10038FF18()
{
}

void sub_10038FF40()
{
}

void sub_10038FF6C()
{
}

void sub_10038FF98()
{
}

void sub_10038FFC0()
{
}

void sub_10038FFEC()
{
}

void sub_100390018()
{
}

void sub_100390040()
{
}

void sub_100390068()
{
}

void sub_100390090()
{
}

void sub_1003900BC()
{
}

void sub_1003900E4()
{
}

void sub_10039010C()
{
}

void sub_100390134()
{
}

void sub_100390160()
{
}

void sub_100390188()
{
}

void sub_1003901B0()
{
}

void sub_1003901D8()
{
}

void sub_100390200()
{
}

void sub_10039022C()
{
}

void sub_100390254()
{
}

void sub_10039027C()
{
}

void sub_1003902A4()
{
}

void sub_1003902CC()
{
}

void sub_1003902F8()
{
}

void sub_100390320()
{
}

void sub_10039034C()
{
}

void sub_100390374()
{
}

void sub_1003903A0()
{
}

void sub_1003903C8()
{
}

void sub_1003903F4()
{
}

void sub_100390420()
{
}

void sub_100390448()
{
}

void sub_100390474()
{
}

void sub_1003904A0()
{
}

void sub_1003904CC()
{
}

void sub_1003904F8()
{
}

void sub_100390524()
{
}

void sub_100390550()
{
}

void sub_100390578()
{
}

void sub_1003905A4()
{
}

void sub_1003905D0()
{
}

void sub_1003905FC()
{
}

void sub_100390628()
{
}

void sub_100390654()
{
}

void sub_100390680()
{
  sub_1000472F4((void *)&_mh_execute_header, v0, v1, "clientStartService duty cycle should be <= 1", v2, v3, v4, v5, v6);
  sub_100003DB4();
}

void sub_1003906AC()
{
}

void sub_1003906D8()
{
}

void sub_100390704()
{
}

void sub_100390730()
{
}

void sub_10039075C()
{
}

void sub_100390788()
{
}

void sub_1003907B4()
{
}

void sub_1003907E0()
{
}

void sub_10039080C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100390874()
{
}

void sub_1003908A0()
{
}

void sub_100390908()
{
  sub_1001322C4((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,knownLonLat,returnedTrue", v2, v3, v4, v5, v6);
  sub_100003DB4();
}

void sub_100390934()
{
}

void sub_100390960(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "regulatory,geo,loc,knownLonLat", buf, 2u);
}

void sub_10039099C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100390A04(unsigned __int8 *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *((_DWORD *)a1 + 1);
  v5[0] = 67109632;
  v5[1] = a2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "regulatory,geo,loc,latlon,%u,lastValid,%d,lastLonLat,%u",  (uint8_t *)v5,  0x14u);
  sub_10000668C();
}

void sub_100390A94()
{
}

void sub_100390AFC(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136446210;
  int v4 = a2;
  sub_100156C30( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "regulatory,gm,loc,grid,#Warning,could not open,%{public}s",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_100390B74()
{
}

void sub_100390BA0()
{
}

void sub_100390BCC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100390C30(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136446210;
  uint64_t v4 = a2;
  sub_100156C30((void *)&_mh_execute_header, a3, (uint64_t)a3, "regulatory,gm,loc,grid,%{public}s", (uint8_t *)&v3);
  sub_10000668C();
}

void sub_100390CA8(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = off_1007F4178;
  sub_100156C30((void *)&_mh_execute_header, a1, a3, "regulatory,gm,loc,grid,fileDoesNotExist,%s", (uint8_t *)&v3);
  sub_10000668C();
}

void sub_100390D20()
{
}

void sub_100390D58()
{
}

void sub_100390DBC()
{
}

void sub_100390DE8()
{
}

void sub_100390E48()
{
}

void sub_100390E74(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_100021038( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#btsampledistributor #nibtfinding macAddressHexString less than 1: %lu",  (uint8_t *)a1);
}

void sub_100390EB0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_100021038( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#btsampledistributor #nibtfinding invalid btaddress length: %s",  (uint8_t *)a2);
}

void sub_100390EEC()
{
}

void sub_100390F4C()
{
}

void sub_100390F78()
{
}

void sub_100390FA4()
{
}

void sub_100391008(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10002101C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "enumerateFiles: null filename from reverseEnumerateFiles",  a1);
}

void sub_10039103C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10002101C((void *)&_mh_execute_header, a1, a3, "pruneLogFiles: empty dir name", v3);
}

void sub_100391074(int *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "pruneLogFiles: clock_gettime failed with errno %d",  buf,  8u);
}

void sub_1003910BC(char *a1, void *a2, os_log_t log)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "pruneLogFiles: directory %s does not exist",  (uint8_t *)&v3,  0xCu);
}

void sub_100391140()
{
}

void sub_100391168(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = @"Missing entitlement";
  sub_100021038((void *)&_mh_execute_header, a1, a3, "#ses-secure-ranging,%@", (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003911DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100391210( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100391244(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = @"Failed to start WiFi service. session is nil";
  sub_100021038((void *)&_mh_execute_header, a1, a3, "#ses-secure-ranging,%@", (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003912B8(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 >= 0) {
    int v3 = a2;
  }
  else {
    int v3 = (void *)*a2;
  }
  int v4 = 136380675;
  uint64_t v5 = v3;
  sub_100021038( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#ses-secure-ranging,WiFi ranging error:%{private}s",  (uint8_t *)&v4);
  sub_10000668C();
}

void sub_100391334( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003913A0()
{
}

void sub_1003913C8()
{
}

void sub_1003913F0()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 94, "handlerFn != std::end(state_handlers)");
}

void sub_100391418()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 112, "retState == newState");
}

void sub_100391440()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 109, "retState == oldState");
}

void sub_100391468()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 99, "newState == oldState");
}

void sub_100391490()
{
}

void sub_1003914B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003914EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100391520()
{
}

void sub_100391580()
{
}

void sub_1003915E0()
{
}

void sub_100391640()
{
}

void sub_1003916A0()
{
}

void sub_100391700()
{
}

void sub_100391760()
{
}

void sub_100391788( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003917F0(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_100021038((void *)&_mh_execute_header, a2, a3, "#ses-ecosystem,Error adding service client: %@", (uint8_t *)&v3);
}

void sub_10039185C()
{
}

void sub_100391884()
{
}

void sub_1003918B0()
{
}

void sub_1003918DC()
{
}

void sub_100391908()
{
}

void sub_100391934()
{
}

void sub_100391960(uint64_t a1)
{
}

void sub_100391980()
{
}

void sub_1003919AC()
{
}

void sub_1003919D8(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#ses-ecosystem,Unexpected RoseSolutionType: %d",  (uint8_t *)v3,  8u);
  sub_100003DB4();
}

void sub_100391A4C(uint64_t a1)
{
}

void sub_100391A5C()
{
}

void sub_100391A88()
{
}

void sub_100391AB4(char *a1, uint64_t a2, os_log_s *a3)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = v4;
  sub_100021038( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#ses-ecosystem,Rose session invalidated unexpectedly. Reason: %s",  (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100391B1C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100391B84( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100391BEC(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_10016C348( (void *)&_mh_execute_header,  a2,  a3,  "#bt-accessory,BackgroundAuthorization: tracking listener [%@] but not peer [%@]",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_10000668C();
}

void sub_100391C60()
{
}

void sub_100391CC0()
{
}

void sub_100391D20()
{
}

void sub_100391D80()
{
}

void sub_100391DE0()
{
}

void sub_100391E40()
{
}

void sub_100391EA0()
{
}

void sub_100391F00()
{
}

void sub_100391F60()
{
}

void sub_100391FC0()
{
}

void sub_100392020()
{
}

void sub_100392080()
{
}

void sub_1003920E0()
{
}

void sub_100392140()
{
}

void sub_1003921A0()
{
}

void sub_100392200()
{
}

void sub_100392260()
{
}

void sub_1003922C0()
{
}

void sub_100392320()
{
}

void sub_100392380()
{
}

void sub_1003923E0()
{
}

void sub_100392440()
{
}

void sub_1003924B0()
{
}

void sub_1003924D8()
{
}

void sub_100392500()
{
}

void sub_100392528()
{
}

void sub_100392554(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "PRRosePowerManager: Invalid roseDefaultPowerVoteCount, using system default %d",  (uint8_t *)v1,  8u);
  sub_100003DB4();
}

void sub_1003925CC()
{
  __assert_rtn("releasePower_block_invoke", "PRRosePowerManager.mm", 92, "fPowerVoteCount >= 0");
}

void sub_1003925F4()
{
}

void sub_100392620()
{
}

void sub_10039264C()
{
}

void sub_100392678( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003926DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#nisessmgr,Observation session was not permitted.",  v1,  2u);
  sub_100003DB4();
}

void sub_100392718(os_log_t log)
{
  int v1 = 138477827;
  uint64_t v2 = @"nil session is not allowed to activate.";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#nisessmgr,%{private}@",  (uint8_t *)&v1,  0xCu);
}

void sub_100392798(int a1, os_log_s *a2)
{
  v2[0] = 67174915;
  v2[1] = a1;
  __int16 v3 = 2113;
  uint64_t v4 = @"exceeded kMaxActivatedSessionsPerProcess";
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#nisessmgr,pid %{private}d %{private}@.",  (uint8_t *)v2,  0x12u);
}

void sub_100392820()
{
}

void sub_100392848()
{
}

void sub_100392874()
{
}

void sub_1003928D8()
{
}

void sub_100392904()
{
}

void sub_100392930()
{
  sub_1001322C4( (void *)&_mh_execute_header,  v0,  v1,  "#roseprovider,======================================================================",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_10039295C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003929C4()
{
}

void sub_100392A28()
{
}

void sub_100392A8C()
{
}

void sub_100392AF0()
{
}

void sub_100392B54()
{
}

void sub_100392BB8()
{
}

void sub_100392C1C()
{
}

void sub_100392C80()
{
}

void sub_100392CAC()
{
}

void sub_100392D0C()
{
}

void sub_100392D6C()
{
}

void sub_100392DCC()
{
}

void sub_100392E2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100392E94()
{
}

void sub_100392EC0()
{
}

void sub_100392EEC()
{
}

void sub_100392F18()
{
}

void sub_100392F7C()
{
}

void sub_100392FA8()
{
}

void sub_10039300C()
{
}

void sub_100393038()
{
}

void sub_10039309C()
{
}

void sub_1003930C8()
{
}

void sub_1003930F4()
{
}

void sub_100393120(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#roseprovider,Rose event of unknown opcode : %d",  (uint8_t *)v2,  8u);
  sub_100003DB4();
}

void sub_100393190()
{
}

void sub_1003931BC()
{
}

void sub_1003931E8()
{
}

void sub_100393214()
{
}

void sub_100393240()
{
}

void sub_10039326C()
{
}

void sub_100393298(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#roseprovider,LPEM enable response status %d is not RoseFWErrorCode::Success",  (uint8_t *)v2,  8u);
  sub_100003DB4();
}

void sub_100393308()
{
}

void sub_100393330()
{
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "#roseprovider,#aop-bt-rssi: timestamp = %llu, connHandle = %d, rssi = %d",  v3,  0x18u);
  sub_10000668C();
}

void sub_1003933B0()
{
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "#roseprovider,#aop-disp-error: ioReportTimeDeltaUs = %llu, state = %d",  v1,  0x12u);
  sub_10000668C();
}

void sub_100393428()
{
}

void sub_1003934DC()
{
  __int16 v3 = 1024;
  int v4 = v0;
  __int16 v5 = 1024;
  int v6 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "#roseprovider,#aop-sf-update: updateType = %u, btConnHandle = 0x%04x (%u)",  v2,  0x14u);
  sub_10000668C();
}

void sub_100393564()
{
  __int16 v6 = v0;
  uint64_t v7 = v1;
  __int16 v8 = 1024;
  int v9 = v2;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "#roseprovider,#aop-bt-rssi: connHandle = %d, bubbleEnterdBm = %2.1f, bubbleExitThresholddBm = %2.1f, displacingProce ssStd = %2.1f, staticProcessStd = %2.1f, measStd = %2.1f, negativeMeasurementRejectionThreshold = %d, txPowerdBm = %d",  v5,  0x46u);
}

void sub_100393610()
{
}

void sub_1003936A8()
{
}

void sub_100393730()
{
}

void sub_10039375C()
{
}

void sub_100393788()
{
}

void sub_1003937B4()
{
}

void sub_1003937E0()
{
}

void sub_10039380C()
{
  HIWORD(sub_100156C3C((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,in isUnrestrictedGrid,%.6f,%.6f", v2, v3) = 36;
  sub_10016C348( (void *)&_mh_execute_header,  v0,  v1,  "#roseprovider,Unexpected outputBuffer size (%zu) for AOPRoseError (%zu)",  v2,  v3);
  sub_10000668C();
}

void sub_100393874()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100137EF8((void *)&_mh_execute_header, v7, v8, "#roseprovider,%s", v9);
  sub_10002107C();
}

void sub_1003938BC()
{
}

void sub_1003938E8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100137EF8((void *)&_mh_execute_header, v7, v8, "#roseprovider,Rose returned error. Command type: %s", v9);
  sub_10002107C();
}

void sub_100393930()
{
}

void sub_10039395C()
{
}

void sub_100393988()
{
}

void sub_1003939B4()
{
}

void sub_1003939E0()
{
}

void sub_100393A0C()
{
}

void sub_100393A38()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100137EF8((void *)&_mh_execute_header, v7, v8, "#roseprovider,#alisha Rose returned error. Command type: %s", v9);
  sub_10002107C();
}

void sub_100393A80()
{
}

void sub_100393AAC()
{
}

void sub_100393AD8()
{
}

void sub_100393B04()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100137EF8((void *)&_mh_execute_header, v7, v8, "#roseprovider,#aop-sf Rose returned error. Command type: %s", v9);
  sub_10002107C();
}

void sub_100393B4C()
{
  HIWORD(sub_100156C3C((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,in isUnrestrictedGrid,%.6f,%.6f", v2, v3) = 1;
  sub_10016C348( (void *)&_mh_execute_header,  v0,  v1,  "#roseprovider,#deep-slp Unexpected outputBuffer size (%zu) for DeepSleepState (%zu)",  v2,  v3);
  sub_10000668C();
}

void sub_100393BB4()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100137EF8( (void *)&_mh_execute_header,  v7,  v8,  "#roseprovider,#deep-slp Rose returned error while sending command. Command type:%s",  v9);
  sub_10002107C();
}

void sub_100393BFC()
{
}

void sub_100393C28(char a1, os_log_s *a2)
{
  else {
    uint64_t v2 = off_1007B28C8[(char)(a1 - 1)];
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#roseprovider,#alisha delete keys - got %s report type.",  (uint8_t *)&v3,  0xCu);
  sub_10000668C();
}

void sub_100393CC4()
{
  __assert_rtn( "_sendAlishaDeleteKeysCommandSync",  "PRRoseProvider.mm",  853,  "inBuffer.size() == sizeof(aop::SupervisorCommandPackets::AlishaDeleteKeysPacket)");
}

void sub_100393CEC()
{
}

void sub_100393D18()
{
}

void sub_100393D44()
{
}

void sub_100393D70()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100137EF8( (void *)&_mh_execute_header,  v7,  v8,  "#roseprovider,Rose returned error while sending command. Command type:%s",  v9);
  sub_10002107C();
}

void sub_100393DB8()
{
}

void sub_100393DE4()
{
}

void sub_100393E10()
{
}

void sub_100393E3C()
{
}

void sub_100393E68()
{
}

void sub_100393E94()
{
}

void sub_100393EC0()
{
}

void sub_100393EEC()
{
}

void sub_100393F18()
{
}

void sub_100393F44()
{
}

void sub_100393F70()
{
}

void sub_100393F9C()
{
}

void sub_100393FC4()
{
}

void sub_100393FF0()
{
}

void sub_100394054( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003940C8(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = @"pushBeaconAllowlist: may only push BLE or UUID identified beacons.";
  sub_100021038((void *)&_mh_execute_header, a1, a3, "#roseprovider,%@", (uint8_t *)&v3);
  sub_10000668C();
}

void sub_10039413C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = @"Given vector of different types beacons. All beacons must be of the same identifer type.";
  sub_100021038((void *)&_mh_execute_header, a1, a3, "#roseprovider,%@", (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003941B0()
{
}

void sub_100394214(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "ignoring identifier-less sample", v1, 2u);
}

void sub_100394254()
{
}

void sub_100394280()
{
}

void sub_1003942AC()
{
}

void sub_1003942D8()
{
}

void sub_100394304()
{
}

void sub_100394330()
{
}

void sub_10039435C()
{
}

void sub_100394388()
{
}

void sub_1003943B4()
{
}

void sub_1003943E0()
{
}

void sub_10039440C()
{
}

void sub_100394438()
{
}

void sub_100394464()
{
  __assert_rtn( "sessionStatsUpdated",  "NIServerCarKeyAnalyticsManager.mm",  361,  "sessionStats.numBlocksWithAnchors.size() >= kMaxAnchorsToCount");
}

void sub_10039448C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#ni-assertion,Failed to acquire %@. Error: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_100394510(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#obsrvr, Unpermitted client attempting to start an observation session.",  v1,  2u);
}

void sub_100394550( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003945C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394630( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003946A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394710( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394780( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003947F0()
{
}

void sub_10039481C()
{
}

void sub_100394848( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003948B8()
{
}

void sub_1003948E0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394950( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003949C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394A30()
{
}

void sub_100394A5C()
{
}

void sub_100394ABC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394B2C()
{
}

void sub_100394B58()
{
}

void sub_100394B84( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394BF4()
{
}

void sub_100394C20()
{
}

void sub_100394C4C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394CBC()
{
}

void sub_100394CE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394D58()
{
}

void sub_100394D84()
{
}

void sub_100394DB0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394E20()
{
}

void sub_100394E4C()
{
}

void sub_100394E78( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394EE8()
{
}

void sub_100394F14( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100394F84()
{
}

void sub_100394FB0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395020()
{
}

void sub_10039504C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003950BC()
{
}

void sub_1003950E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395158( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003951C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395238( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003952A8(uint64_t a1)
{
  if (v7 != v8) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v2;
  }
  *(_DWORD *)uint64_t v3 = 136315138;
  *(void *)(v3 + 4) = v9;
  sub_100021038((void *)&_mh_execute_header, v4, (uint64_t)v4, "#ses-acwg,Failed to allocate Acwg session (%s)", v5);
  sub_10002107C();
}

void sub_100395304(std::__shared_weak_count *a1)
{
  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    sub_10018C530(p_shared_owners);
  while (v4);
  if (!v3)
  {
    sub_10018C540();
    std::__shared_weak_count::__release_weak(a1);
  }

  sub_10002107C();
}

void sub_100395338( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003953A8(uint64_t a1)
{
  if (v7 != v8) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v2;
  }
  *(_DWORD *)uint64_t v3 = 136315138;
  *(void *)(v3 + 4) = v9;
  sub_100021038( (void *)&_mh_execute_header,  v4,  (uint64_t)v4,  "#ses-acwg,Alisha session invalidated unexpectedly. Reason: %s",  v5);
  sub_10002107C();
}

void sub_100395404( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395474( std::__shared_weak_count **a1, std::__shared_weak_count **a2, std::__shared_weak_count *this)
{
  uint64_t v5 = *a1;
  if (*a1)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      sub_10018C530(p_shared_owners);
    while (v8);
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  uint64_t v9 = *a2;
  if (v9)
  {
    __int16 v10 = (unint64_t *)&v9->__shared_owners_;
    do
      sub_10018C530(v10);
    while (v12);
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  std::__shared_weak_count::~__shared_weak_count(this);
  operator delete(v13);
}

void sub_100395508( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395578( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003955E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395658()
{
}

void sub_100395684()
{
}

void sub_1003956B0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395720( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395790( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395800( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395870()
{
  if (v3 != v4) {
    uint64_t v5 = v2;
  }
  else {
    uint64_t v5 = v0;
  }
  int v6 = 136315138;
  uint64_t v7 = v5;
  _os_log_fault_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_FAULT,  "#ses-acwg,timeout event %s unsupported",  (uint8_t *)&v6,  0xCu);
  sub_10000668C();
}

void sub_1003958E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395958( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003959C8()
{
}

void sub_1003959F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100395A64()
{
}

void sub_100395A8C()
{
  __assert_rtn( "AcwgConfigProvider",  "NIServerAcwgSession.mm",  135,  "minRanMultiplier <= std::numeric_limits<decltype(_minRanMultiplier)>::max()");
}

void sub_100395AB4()
{
}

void sub_100395ADC()
{
}

void sub_100395B08()
{
}

void sub_100395B34()
{
}

void sub_100395B60(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = @"Not authorized.";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-system,%@", (uint8_t *)&v1, 0xCu);
}

void sub_100395BE0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "[PRAppStateMonitor] error creating handle for identifier. Error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100395C54(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "[PRAppStateMonitor] pid (%d) != _monitoredPID (%d)",  (uint8_t *)v4,  0xEu);
}

void sub_100395CDC()
{
}

void sub_100395D08()
{
}

void sub_100395D40(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#peer-gr,Unexpected RoseSolutionType: %d",  (uint8_t *)v3,  8u);
  sub_100003DB4();
}

void sub_100395DB4()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100137EF8((void *)&_mh_execute_header, v2, v3, "#peer-gr,Rose session invalidated unexpectedly. Reason: %s", v4);
  sub_10002107C();
}

void sub_100395E00()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100137EF8((void *)&_mh_execute_header, v2, v3, "#peer-gr,Failed to allocate a UWB session. Error: %s", v4);
  sub_10002107C();
}

void sub_100395E4C(std::__shared_weak_count *a1)
{
  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    unint64_t v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }

  sub_10002107C();
}

void sub_100395E94()
{
}

void sub_100395EC0()
{
}

void sub_100395EEC()
{
}

void sub_100395F18()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100137EF8((void *)&_mh_execute_header, v2, v3, "#peer-gr,Failed to start ranging. Return code: %s", v4);
  sub_10002107C();
}

void sub_100395F64()
{
}

void sub_100395FC4()
{
}

void sub_100396024()
{
}

void sub_100396050()
{
}

void sub_10039607C()
{
}

void sub_1003960E4()
{
}

void sub_100396110()
{
}

void sub_100396170()
{
}

void sub_1003961D0()
{
}

void sub_100396230()
{
}

void sub_100396290()
{
}

void sub_1003962BC()
{
}

void sub_1003962E8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039634C()
{
}

void sub_100396378( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003963DC()
{
}

void sub_10039643C()
{
}

void sub_10039649C()
{
}

void sub_1003964C4()
{
}

void sub_100396524()
{
}

void sub_100396584()
{
}

void sub_1003965E4()
{
  sub_1000472F4( (void *)&_mh_execute_header,  v0,  v1,  "#find-proxy,shouldInteract returned NO, not going to enable interaction",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_100396610()
{
  sub_1000472F4( (void *)&_mh_execute_header,  v0,  v1,  "#find-proxy,shouldInteract returned YES, not going to disable interaction",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_10039663C()
{
}

void sub_1003966A4()
{
}

void sub_100396704()
{
}

void sub_100396764()
{
}

void sub_100396790()
{
}

void sub_1003967BC(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100156C30((void *)&_mh_execute_header, a3, (uint64_t)a3, "#find-proxy,%@", (uint8_t *)a2);
}

void sub_100396808()
{
}

void sub_10039686C()
{
}

void sub_100396898()
{
}

void sub_1003968C4()
{
}

void sub_1003968F0()
{
}

void sub_10039691C()
{
}

void sub_10039697C()
{
}

void sub_1003969A8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Device %@ does not have token data and it is not a known device",  (uint8_t *)&v2,  0xCu);
}

void sub_100396A1C()
{
}

void sub_100396A44()
{
}

void sub_100396A6C()
{
}

void sub_100396ADC()
{
}

void sub_100396B4C()
{
}

void sub_100396BB0()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "regulatory,geo,sm,retryLocation,total:%d,left:%d",  v2,  0xEu);
  sub_10000668C();
}

void sub_100396C34(os_log_t log)
{
  v1[0] = 67109632;
  v1[1] = HIDWORD(qword_1007F4088);
  __int16 v2 = 1024;
  int v3 = qword_1007F4088;
  __int16 v4 = 1024;
  int v5 = dword_1007F4090;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "defaults,locationTimeout:%d,queryInterval:%d,maxRetries:%d",  (uint8_t *)v1,  0x14u);
  sub_10000668C();
}

void sub_100396CCC()
{
}

void sub_100396D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100396D68(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100396DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100396DD8()
{
}

void sub_100396E04()
{
}

void sub_100396E30()
{
}

void sub_100396E5C()
{
}

void sub_100396E88()
{
}

void sub_100396EB4()
{
}

void sub_100396EE0()
{
}

void sub_100396F44()
{
}

void sub_100396F70()
{
}

void sub_100396FD4(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  sub_100156C30( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "regulatory,geo,monitor,clearStoredRegulatoryArea:%s",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_10039704C()
{
}

void sub_1003970B0()
{
}

void sub_100397114()
{
}

void sub_10039714C()
{
}

void sub_1003971B0()
{
}

void sub_1003971DC()
{
}

void sub_100397208()
{
}

void sub_10039727C()
{
}

void sub_1003972F0()
{
}

void sub_10039731C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100156C30((void *)&_mh_execute_header, v7, (uint64_t)v7, "regulatory,geo,monitor,forwardTestMcc,mccSource:%s.", v8);
  sub_10002107C();
}

void sub_100397368()
{
}

void sub_1003973CC()
{
  sub_1001322C4( (void *)&_mh_execute_header,  v0,  v1,  "regulatory,geo,monitor,processIsoCountryFromPhone - Early return. This method is only supported for non-phone platforms.",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003973F8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100156C30( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "regulatory,geo,monitor,processIsoCountryFromPhone,isoCountrySource:%s.",  v8);
  sub_10002107C();
}

void sub_100397444()
{
}

void sub_1003974A8()
{
}

void sub_1003974D4()
{
}

void sub_100397500()
{
}

void sub_100397564()
{
  __assert_rtn("processAirplaneMode", "PRGeoMonitor.mm", 1030, "airplaneMode != Rose::AirplaneMode::UNKNOWN");
}

void sub_10039758C()
{
}

void sub_1003975B8()
{
}

void sub_1003975E4()
{
}

void sub_100397610(uint64_t a1, void *a2, os_log_s *a3)
{
  int v3 = 136315138;
  uint64_t v4 = a2;
  sub_100156C30( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "regulatory,geo,monitor,setStoredRegulatoryArea:%s",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_100397688()
{
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "geo,mon fCurrentWifiIso current:%s new:%s",  v2,  0x16u);
  sub_10000668C();
}

void sub_10039774C(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#alisha-tom,invalidate() must be called before destructing CarKeyTimeoutManager for session identifier %@",  (uint8_t *)&v3,  0xCu);
}

void sub_1003977C4()
{
}

void sub_1003977EC()
{
}

void sub_100397818()
{
}

void sub_100397884()
{
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  sub_1001BC2F8((void *)&_mh_execute_header, v1, v2, "#ses-home,Failed to add peers %@. Session identifier: %@", v3);
  sub_10000668C();
}

void sub_100397900()
{
}

void sub_100397960()
{
}

void sub_10039798C()
{
}

void sub_1003979EC()
{
  sub_1000472F4( (void *)&_mh_execute_header,  v0,  v1,  "#ses-home,NINearbyObject objectFromBluetoothDevice returned nil.",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_100397A18()
{
}

void sub_100397A44()
{
}

void sub_100397AA4()
{
}

void sub_100397B04()
{
}

void sub_100397B30()
{
}

void sub_100397B90(uint64_t a1, uint64_t a2)
{
}

void sub_100397BC8(uint64_t a1, uint64_t a2)
{
}

void sub_100397C00(uint64_t a1, uint64_t a2)
{
}

void sub_100397C38()
{
}

void sub_100397C64()
{
}

void sub_100397CC4()
{
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "#ses-home,Device rediscovered decision: not restarting Wifi session since address is the same and role != responder and wifi ranging bit is unchanged and wifi ranging not enabled.",  v1,  2u);
  sub_100003DB4();
}

void sub_100397CFC()
{
}

void sub_100397D28()
{
}

void sub_100397D88()
{
}

void sub_100397DE8()
{
}

void sub_100397E48(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#ses-home,Unexpected RoseSolutionType: %d",  (uint8_t *)v3,  8u);
  sub_100003DB4();
}

void sub_100397EBC(_DWORD *a1, _DWORD *a2, os_log_t log)
{
  int v3 = *a1 - *a2;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = 16;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#ses-home,Received unexpected remote data: too small (%d < %d)",  (uint8_t *)v4,  0xEu);
  sub_10000668C();
}

void sub_100397F4C()
{
}

void sub_100397F78()
{
}

void sub_100397FA4()
{
}

void sub_100397FD0()
{
}

void sub_100398030()
{
}

void sub_100398090()
{
}

void sub_1003980B8()
{
}

void sub_1003980E4()
{
}

void sub_100398144()
{
}

void sub_1003981A4()
{
}

void sub_100398204()
{
}

void sub_10039822C()
{
}

void sub_100398258(void *a1, uint64_t a2)
{
  sub_10002107C();
}

void sub_10039829C()
{
}

void sub_1003982C8()
{
}

void sub_1003982F4(std::__shared_weak_count *a1)
{
  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    unint64_t v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    sub_10018C540();
    std::__shared_weak_count::__release_weak(a1);
  }

  sub_10002107C();
}

void sub_100398330()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100021038( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "#ses-home,Failed to allocate a UWB session. Error: %s",  v4);
  sub_10002107C();
}

void sub_100398380()
{
}

void sub_1003983E0(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#ses-home,Active session limit exceeded (%d)",  (uint8_t *)v1,  8u);
  sub_100003DB4();
}

void sub_100398458()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100021038( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "#ses-home,Rose session invalidated unexpectedly. Reason: %s",  v4);
  sub_10002107C();
}

void sub_1003984A8()
{
}

void sub_1003984D0()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100021038((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-home,Failed to start ranging. Return code: %s", v4);
  sub_10002107C();
}

void sub_100398520()
{
}

void sub_100398580()
{
}

void sub_1003985AC()
{
}

void sub_1003985D8()
{
}

void sub_100398604()
{
}

void sub_100398630()
{
}

void sub_10039865C()
{
}

void sub_1003986BC()
{
}

void sub_10039871C()
{
}

void sub_10039877C()
{
}

void sub_1003987DC(uint64_t *a1, uint64_t a2, os_log_s *a3, float a4)
{
  double v5 = a4;
  else {
    uint8_t v6 = (uint64_t *)*a1;
  }
  *(_DWORD *)a2 = 134218242;
  *(double *)(a2 + 4) = v5;
  *(_WORD *)(a2 + 12) = 2080;
  *(void *)(a2 + 14) = v6;
  sub_1001BC2F8( (void *)&_mh_execute_header,  a2,  a3,  "#ses-home,#throttle failed to schedule throttling request for rate %0.2f. Error: %s",  (uint8_t *)a2);
  sub_10002107C();
}

void sub_100398848()
{
}

void sub_1003988B4()
{
}

void sub_1003988E0()
{
}

void sub_100398940()
{
}

void sub_1003989B8()
{
}

void sub_100398A18(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10002107C();
}

void sub_100398A5C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10002107C();
}

void sub_100398AA0(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v4 = *a2;
  int v5 = 138478083;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#find-ses,Providers could not be initialized for token: %{private}@ with configuration: %@",  (uint8_t *)&v5,  0x16u);
  sub_10000668C();
}

void sub_100398B28()
{
}

void sub_100398B88( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100398BF0(int *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109379;
  v4[1] = v3;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#find-ses,didRangeWithPeer:newSolution: unexpected RoseSolutionType: %d. Token: %{private}@",  (uint8_t *)v4,  0x12u);
  sub_10000668C();
}

void sub_100398C74()
{
}

void sub_100398CA0()
{
}

void sub_100398CCC()
{
}

void sub_100398D2C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#find-ses,%{public}@", buf, 0xCu);

  sub_10002107C();
}

void sub_100398D7C()
{
}

void sub_100398DDC()
{
}

void sub_100398E3C()
{
}

void sub_100398E9C()
{
}

void sub_100398EC8()
{
}

void sub_100398F28()
{
}

void sub_100398F60()
{
}

void sub_100398FC0()
{
}

void sub_100398FEC()
{
}

void sub_10039904C()
{
}

void sub_1003990AC()
{
}

void sub_1003990D8()
{
}

void sub_100399104()
{
}

void sub_10039912C()
{
}

void sub_100399158( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100399188( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003991B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003991E8()
{
}

void sub_100399248()
{
}

void sub_1003992A8()
{
}

void sub_100399308()
{
}

void sub_100399368()
{
}

void sub_1003993C8()
{
}

void sub_100399428()
{
}

void sub_100399488()
{
}

void sub_1003994E8(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(v3 + 20) = 1;
  sub_1001C9D20((void *)&_mh_execute_header, "#crypto,[%{private}@][Decryptor] ciphertext too small (%d < %d)", v4, v5);
}

void sub_100399528(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(v3 + 20) = 5;
  sub_1001C9D20((void *)&_mh_execute_header, "#crypto,[%{private}@][Decryptor] ciphertext too small (%d < %d)", v4, v5);
}

void sub_100399568(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(v3 + 20) = 11;
  sub_1001C9D20((void *)&_mh_execute_header, "#crypto,[%{private}@][Decryptor] ciphertext too small (%d < %d)", v4, v5);
}

void sub_1003995A8()
{
}

void sub_100399608()
{
}

void sub_100399668()
{
}

void sub_1003996C8()
{
}

void sub_100399728()
{
}

void sub_100399788()
{
}

void sub_1003997E8()
{
}

void sub_100399848()
{
}

void sub_1003998A8()
{
}

void sub_100399908()
{
}

void sub_100399968()
{
}

void sub_1003999C8()
{
}

void sub_1003999F4()
{
}

void sub_100399A20( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100399A84()
{
}

void sub_100399AB0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000667C( (void *)&_mh_execute_header,  a2,  a3,  "#regulatory,isoquerymgr,sendIsoRequest, activation error = %@",  a5,  a6,  a7,  a8,  2u);
  sub_10000668C();
}

void sub_100399B14()
{
}

void sub_100399B40( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000667C( (void *)&_mh_execute_header,  a2,  a3,  "#regulatory,isoquerymgr,sendIsoRequest,response, error = %@ ",  a5,  a6,  a7,  a8,  2u);
  sub_10000668C();
}

void sub_100399BA4(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "regulatory,download,Unexpected activity state %ld",  (uint8_t *)&v2,  0xCu);
}

void sub_100399C18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100399C84( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100399CF0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100399D20( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100399D50()
{
  __assert_rtn("PRGetDeviceModelName_block_invoke", "PRUtilities.m", 40, "CFGetTypeID(answer) == CFStringGetTypeID()");
}

void sub_100399D78()
{
}

void sub_100399DA4()
{
  __int16 v4 = 1024;
  int v5 = v0;
  __int16 v6 = 1024;
  int v7 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Crash Reason: %s for core: %d and isFatal: %d",  v3,  0x18u);
  sub_10000668C();
}

void sub_100399E3C()
{
}

void sub_100399E68()
{
}

void sub_100399E94()
{
  __int16 v2 = 2048;
  uint64_t v3 = 155LL;
  sub_10000AFC4((void *)&_mh_execute_header, v0, (uint64_t)v0, "HID event size [%lu] != expected size [%lu]", v1);
  sub_10000668C();
}

void sub_100399F0C(unsigned int *a1)
{
}

void sub_100399F8C()
{
}

void sub_100399FB8()
{
  uint64_t v0 = abort_report_np("Invalid context");
  sub_100399FCC(v0);
}

void sub_100399FCC()
{
}

void sub_100399FF4()
{
}

void sub_10039A01C()
{
  sub_100021038((void *)&_mh_execute_header, v0, v1, "Called PRRose::activate while in state == %s", v2);
  sub_10000668C();
}

void sub_10039A0A4(unsigned int *a1)
{
}

void sub_10039A124()
{
}

void sub_10039A150()
{
}

void sub_10039A17C()
{
}

void sub_10039A1A8()
{
}

void sub_10039A1D4()
{
}

uint64_t sub_10039A200()
{
  uint64_t v0 = abort_report_np("Unable to create the notification port");
  return sub_10039A214(v0);
}

void sub_10039A214()
{
}

void sub_10039A240()
{
}

void sub_10039A26C()
{
}

void sub_10039A298()
{
}

void sub_10039A2C4()
{
}

void sub_10039A2F0()
{
}

void sub_10039A31C(_BYTE *a1, _BYTE *a2)
{
}

void sub_10039A348(_BYTE *a1, _BYTE *a2)
{
}

void sub_10039A374(_BYTE *a1, _BYTE *a2)
{
}

void sub_10039A3A0()
{
}

void sub_10039A3CC()
{
}

void sub_10039A3F8()
{
}

void sub_10039A424()
{
}

void sub_10039A450()
{
}

void sub_10039A47C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#halt-exec-PRRose halt PRRose execution due to HaltPRRoseOnFatalErrorReason override: %@",  (uint8_t *)&v2,  0xCu);
  sub_10000668C();
}

void sub_10039A4EC()
{
}

void sub_10039A518()
{
}

void sub_10039A544( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039A5A8()
{
}

void sub_10039A5D4()
{
}

void sub_10039A600()
{
}

void sub_10039A62C()
{
}

void sub_10039A658()
{
}

void sub_10039A684()
{
}

void sub_10039A6B0()
{
  __assert_rtn("setRoseReportHandler", "PRRose.mm", 577, "nullptr != handler");
}

void sub_10039A6D8()
{
  __assert_rtn("setRoseStateEventsHandler", "PRRose.mm", 583, "nullptr != handler");
}

void sub_10039A700()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100021038((void *)&_mh_execute_header, v3, (uint64_t)v3, "Command %s not allowed in deep sleep", v4);
  sub_10002107C();
}

void sub_10039A750()
{
}

void sub_10039A77C()
{
}

void sub_10039A7A8()
{
}

void sub_10039A7D4(char a1)
{
  if ((a1 & 1) != 0)
  {
    sub_1001322E8();
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "PRRose::_handleRoseControlReport unknown type %hhu",  v2,  8u);
  }

  __assert_rtn("_handleRoseControlReport", "PRRose.mm", 734, "false");
}

void sub_10039A858()
{
}

void sub_10039A884()
{
}

void sub_10039A8B0()
{
}

void sub_10039A8E8()
{
}

void sub_10039A914()
{
}

void sub_10039A97C()
{
}

void sub_10039A9A8()
{
}

void sub_10039A9D4()
{
}

uint64_t sub_10039AA00()
{
  uint64_t v0 = abort_report_np("failed to find rose service");
  return sub_10039AA14(v0);
}

void sub_10039AA14()
{
}

void sub_10039AA40(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_100021038( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "property data type %lu or property length is invalid",  (uint8_t *)a1);
}

void sub_10039AA7C()
{
}

void sub_10039AAA8()
{
}

void sub_10039AAD4()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "fRoseCommMgr.sendSetConfigCommand returned false.",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_10039AB00()
{
}

void sub_10039AB2C()
{
}

void sub_10039AB58()
{
}

void sub_10039AB84()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100021038( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "getRoseAlishaTestMode failed: response not successful (%s)",  v4);
  sub_10002107C();
}

void sub_10039ABD4()
{
}

void sub_10039AC00()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100021038( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "getNBUWBePAeLNAModes failed: response not successful (%s)",  v4);
  sub_10002107C();
}

void sub_10039AC50()
{
}

void sub_10039AC7C()
{
}

void sub_10039ACA8()
{
}

void sub_10039ACD4()
{
}

void sub_10039AD00()
{
}

void sub_10039AD2C()
{
}

void sub_10039AD90()
{
}

void sub_10039ADF4()
{
}

void sub_10039AE58()
{
}

void sub_10039AEBC()
{
}

void sub_10039AF20()
{
}

void sub_10039AF84()
{
}

void sub_10039AFE8()
{
}

void sub_10039B04C()
{
}

void sub_10039B0B0()
{
}

void sub_10039B114()
{
}

void sub_10039B178()
{
}

void sub_10039B1DC()
{
}

void sub_10039B208( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039B274()
{
}

void sub_10039B2A0()
{
}

void sub_10039B2CC()
{
}

void sub_10039B2F8()
{
}

void sub_10039B324(unsigned int *a1)
{
}

void sub_10039B3A4()
{
}

void sub_10039B3D0(unsigned int *a1)
{
}

void sub_10039B450(unsigned int *a1)
{
}

void sub_10039B4D0()
{
}

void sub_10039B4FC()
{
  sub_100021038( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "PRRose: RoseSupervisor returned unexpected size %zu for deep sleep state. Aborting nearbyd.",  v1);
  sub_10000668C();
}

void sub_10039B564()
{
}

void sub_10039B590()
{
}

void sub_10039B5BC()
{
}

void sub_10039B5E8()
{
}

void sub_10039B614(unsigned int *a1)
{
}

void sub_10039B694()
{
}

void sub_10039B6C0(unsigned int *a1)
{
}

void sub_10039B740()
{
}

void sub_10039B76C()
{
}

void sub_10039B798()
{
}

void sub_10039B7C4()
{
}

void sub_10039B7F0()
{
}

void sub_10039B81C()
{
}

void sub_10039B848()
{
}

void sub_10039B8D0()
{
}

void sub_10039B8FC()
{
}

void sub_10039B928()
{
}

void sub_10039B954()
{
}

void sub_10039B980()
{
}

void sub_10039B9AC()
{
}

void sub_10039B9D8()
{
}

void sub_10039BA04(uint64_t a1)
{
}

void sub_10039BAA8(uint64_t a1)
{
}

void sub_10039BB4C()
{
}

void sub_10039BB78()
{
}

void sub_10039BBA4()
{
}

void sub_10039BBD0()
{
}

void sub_10039BBFC()
{
}

void sub_10039BC28()
{
}

void sub_10039BC54()
{
}

void sub_10039BC80()
{
}

void sub_10039BCAC()
{
}

void sub_10039BCD8()
{
}

void sub_10039BD04()
{
}

void sub_10039BD30()
{
}

void sub_10039BD5C()
{
}

void sub_10039BD88()
{
}

void sub_10039BDB4()
{
}

void sub_10039BDE0()
{
}

void sub_10039BE0C()
{
}

void sub_10039BE38()
{
}

void sub_10039BE64()
{
}

void sub_10039BE90(uint64_t a1)
{
}

void sub_10039BF34(uint64_t a1)
{
}

void sub_10039BFD8(uint64_t a1)
{
  uint64_t v4 = "FatalChipError";
  sub_10000AFC4( (void *)&_mh_execute_header,  v1,  v2,  "PRRose failed to take assertion. state %s, event: %s, aborting nearbyd",  v3);
  sub_10000668C();
}

void sub_10039C064(uint64_t a1)
{
  uint64_t v4 = "ChipReset";
  sub_10000AFC4( (void *)&_mh_execute_header,  v1,  v2,  "PRRose failed to take assertion. state %s, event: %s, aborting nearbyd",  v3);
  sub_10000668C();
}

void sub_10039C0F0(uint64_t a1)
{
}

void sub_10039C198()
{
}

void sub_10039C1C4()
{
}

void sub_10039C1F0()
{
}

void sub_10039C21C()
{
}

void sub_10039C248()
{
}

void sub_10039C274()
{
}

void sub_10039C2A0(uint64_t a1)
{
}

void sub_10039C344(uint64_t a1)
{
}

void sub_10039C3E0(uint64_t a1)
{
  uint64_t v4 = "PowerOn";
  sub_10000AFC4( (void *)&_mh_execute_header,  v1,  v2,  "PRRose Power On Failed  while in state: %s, event: %s, aborting nearbyd",  v3);
  sub_10000668C();
}

void sub_10039C46C(uint64_t a1)
{
  uint64_t v4 = "Configure";
  sub_10000AFC4((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3);
  sub_10000668C();
}

void sub_10039C4F8(uint64_t a1)
{
}

void sub_10039C594()
{
}

void sub_10039C5C0()
{
}

void sub_10039C63C()
{
}

void sub_10039C668()
{
}

void sub_10039C694()
{
}

void sub_10039C6C0()
{
}

void sub_10039C6EC()
{
}

void sub_10039C718()
{
}

void sub_10039C744()
{
}

void sub_10039C770()
{
}

void sub_10039C79C()
{
}

void sub_10039C7C8(unsigned int *a1)
{
}

void sub_10039C848()
{
}

void sub_10039C874()
{
}

void sub_10039C8A0()
{
}

void sub_10039C8CC()
{
}

void sub_10039C8F8()
{
}

void sub_10039C924()
{
}

void sub_10039C950()
{
}

void sub_10039C97C()
{
}

void sub_10039C9A8()
{
}

void sub_10039C9D4()
{
  sub_10000B000( (void *)&_mh_execute_header,  v0,  v1,  "PRRose:applyConfigOptions,regulatory,sendingConfig, rangingGroupMessageID != SET_CONFIG (%hx)",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_10039CA38()
{
  sub_10000B000( (void *)&_mh_execute_header,  v0,  v1,  "PRRose:applyConfigOptions,regulatory,sendingConfig, groupID != Ranging (%hhx)",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_10039CA9C()
{
}

void sub_10039CAC8()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "#handoffca rangingRateChanged() monotonicTimeSeconds: %f s, rangingIntervalMilliseconds %d s",  v2,  0x12u);
  sub_10000668C();
}

void sub_10039CB40()
{
}

void sub_10039CB6C()
{
}

void sub_10039CBD0()
{
}

void sub_10039CC34()
{
}

void sub_10039CC60()
{
}

void sub_10039CCC4()
{
}

void sub_10039CD28()
{
}

void sub_10039CD54()
{
}

void sub_10039CDB8()
{
}

void sub_10039CE1C()
{
}

void sub_10039CE80()
{
}

void sub_10039CEAC()
{
}

void sub_10039CF10()
{
}

void sub_10039CF48(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Registered for vision input but does not support camera assistance.",  v1,  2u);
}

void sub_10039CF88( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039CFBC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

float sub_10039CFF0(unsigned __int8 *a1, os_log_s *a2)
{
  int v2 = a1[8];
  int v3 = a1[9];
  int v4 = a1[10];
  int v5 = a1[11];
  v7[0] = 67109888;
  v7[1] = v2;
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#type19,Parsed. Flag FE: %d. FS: %d. FC: %d. FC2: %d.",  (uint8_t *)v7,  0x1Au);
  return result;
}

void sub_10039D08C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#type19,UWB Data to parse: %@, Presence Data to parse: %@ ",  (uint8_t *)&v3,  0x16u);
}

void sub_10039D110( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039D140( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039D170( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039D1A0()
{
}

void sub_10039D1CC()
{
}

void sub_10039D1F8()
{
}

void sub_10039D224()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100021038( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "#find-range,Failed to start ranging. Return code: %s",  v4);
  sub_10002107C();
}

void sub_10039D274()
{
}

void sub_10039D2A0(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#find-range,Shared protocol not matching - new protocol: %d, existing protocol: %d",  (uint8_t *)v4,  0xEu);
  sub_10000668C();
}

void sub_10039D324()
{
}

void sub_10039D350()
{
}

void sub_10039D3B4()
{
  sub_10002107C();
}

void sub_10039D3F0()
{
}

void sub_10039D41C()
{
}

void sub_10039D448()
{
}

void sub_10039D474()
{
}

void sub_10039D4A0()
{
}

void sub_10039D4CC()
{
}

void sub_10039D530()
{
}

void sub_10039D594(uint64_t a1)
{
}

void sub_10039D5B0(uint64_t a1)
{
}

void sub_10039D5C4(uint64_t a1)
{
}

void sub_10039D5D0()
{
}

void sub_10039D634()
{
}

void sub_10039D698()
{
}

void sub_10039D6F8()
{
  sub_10002107C();
}

void sub_10039D734()
{
}

void sub_10039D794()
{
}

void sub_10039D7F8()
{
  int v4 = *(unsigned __int8 *)(v3 + 1672);
  if (*(_BYTE *)(v3 + 936)) {
    uint64_t v5 = "yes";
  }
  else {
    uint64_t v5 = "no";
  }
  int v7 = 138412802;
  if (v4) {
    uint8_t v6 = "yes";
  }
  else {
    uint8_t v6 = "no";
  }
  uint64_t v8 = v2;
  __int16 v9 = 2080;
  __int16 v10 = v5;
  __int16 v11 = 2080;
  __int16 v12 = v6;
  sub_1001FD710( (void *)&_mh_execute_header,  v0,  v1,  "#find-range,Rose service request of %@, finder: %s, findee: %s",  (uint8_t *)&v7);
}

void sub_10039D8A0()
{
  uint64_t v3 = "yes";
  int v5 = *(unsigned __int8 *)(v4 + 1672);
  if (*v2) {
    uint8_t v6 = "yes";
  }
  else {
    uint8_t v6 = "no";
  }
  int v7 = 138412802;
  if (!v5) {
    uint64_t v3 = "no";
  }
  uint64_t v8 = v1;
  __int16 v9 = 2080;
  __int16 v10 = v6;
  __int16 v11 = 2080;
  __int16 v12 = v3;
  sub_1001FD710( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "#find-range,Start ranging options of %@, finder: %s, findee: %s",  (uint8_t *)&v7);
}

void sub_10039D94C()
{
}

void sub_10039D990()
{
}

void sub_10039D9BC()
{
}

void sub_10039D9E8()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 697, "finderOutboundAuthStateRawValue <= 0x0F");
}

void sub_10039DA10()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 698, "finderInboundAuthStateRawValue <= 0x0F");
}

void sub_10039DA38()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 712, "findeeOutboundAuthStateRawValue <= 0x0F");
}

void sub_10039DA60()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 713, "findeeInboundAuthStateRawValue <= 0x0F");
}

void sub_10039DA88()
{
}

void sub_10039DAEC()
{
}

void sub_10039DB18()
{
}

void sub_10039DB78(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#find-range,#auth Message could not be parsed for peer %s state",  buf,  0xCu);
}

void sub_10039DBBC()
{
}

void sub_10039DBE8(uint64_t a1, void *a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 136315394;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  sub_1001FD660( (void *)&_mh_execute_header,  "#find-range,#auth IGNORED peer [%s] mutual auth:      %@",  (uint8_t *)a3,  a4);

  sub_10002107C();
}

void sub_10039DC3C()
{
}

void sub_10039DC68()
{
}

void sub_10039DC94()
{
}

void sub_10039DD04()
{
}

void sub_10039DD30()
{
}

void sub_10039DD68()
{
}

void sub_10039DD94()
{
}

void sub_10039DDC0()
{
}

void sub_10039DDEC()
{
}

void sub_10039DE18()
{
}

void sub_10039DE44()
{
}

void sub_10039DE70()
{
}

void sub_10039DE9C()
{
}

void sub_10039DEC8()
{
}

void sub_10039DEF4()
{
}

void sub_10039DF20()
{
}

void sub_10039DF4C()
{
}

void sub_10039DF78()
{
}

void sub_10039DFA4()
{
}

void sub_10039DFD0()
{
}

void sub_10039E014()
{
}

void sub_10039E040(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_100021038( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#find-range,[%s] #crypto Failed (reached maximum)",  (uint8_t *)a2);
}

void sub_10039E07C()
{
}

void sub_10039E0A8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_100021038( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#find-range,[%s] #auth Failed mutual auth",  (uint8_t *)a2);
}

void sub_10039E0E4()
{
}

void sub_10039E110()
{
}

void sub_10039E138()
{
}

void sub_10039E164()
{
}

void sub_10039E190(uint64_t a1)
{
}

void sub_10039E1AC(uint64_t a1)
{
}

void sub_10039E1C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 - 24;
  do
  {
    sub_100034A98(v3, *(void **)(v3 + 8));
    v3 -= 48LL;
  }

  while (v3 + 24 != a2);
}

void sub_10039E20C()
{
}

void sub_10039E234()
{
}

void sub_10039E25C()
{
  __assert_rtn("-[NIServerNearbyPeerSession configure]", "NIServerNearbyPeerSession.mm", 228, "_peerTokenDict != nil");
}

void sub_10039E284()
{
}

void sub_10039E2B0()
{
}

void sub_10039E2DC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039E340()
{
}

void sub_10039E36C()
{
}

void sub_10039E398()
{
}

void sub_10039E3C4()
{
}

void sub_10039E3F0(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#ses-nrby-peer,Solution mac_addr = %llu",  (uint8_t *)&v3,  0xCu);
  sub_10000668C();
}

void sub_10039E464( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039E4CC()
{
}

void sub_10039E4F8()
{
}

void sub_10039E524(_DWORD *a1, _DWORD *a2, os_log_t log)
{
  int v3 = *a1 - *a2;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = 16;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#ses-nrby-peer,Received unexpected remote data: too small (%d < %d)",  (uint8_t *)v4,  0xEu);
  sub_10000668C();
}

void sub_10039E5B4()
{
}

void sub_10039E5E0()
{
}

void sub_10039E60C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039E670()
{
}

void sub_10039E69C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039E700()
{
}

void sub_10039E72C()
{
}

void sub_10039E758()
{
}

void sub_10039E784(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#alisha-cert,Error serializing to JSON",  v1,  2u);
}

void sub_10039E7C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to create nw monitor path", v1, 2u);
}

void sub_10039E804()
{
}

void sub_10039E830()
{
}

void sub_10039E858( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039E8C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039E938( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039E9A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039EA18()
{
}

void sub_10039EA78( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039EAE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039EB58( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039EBC8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039EC38()
{
}

void sub_10039EC64()
{
}

void sub_10039EC90(int a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#ses-carkey,_processCarKeyEvent: unknown event type %d for vehicle identifier: %@",  buf,  0x12u);

  sub_10002107C();
}

void sub_10039ECF0()
{
}

void sub_10039ED1C(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100229088( (void *)&_mh_execute_header,  a2,  a3,  "#ses-carkey,_processCarKeyEvent: vehicle sent ranging terminated sub-event. Vehicle identifier: %@. No Alisha manage r, nothing to do here.",  (uint8_t *)a2);

  sub_10002107C();
}

void sub_10039ED60(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100229088( (void *)&_mh_execute_header,  a2,  a3,  "#ses-carkey,_processCarKeyEvent: vehicle sent ranging suspension sub-event. Vehicle identifier: %@. No Alisha manage r, nothing to do here.",  (uint8_t *)a2);

  sub_10002107C();
}

void sub_10039EDA4()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100021038( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "#ses-carkey,Failed to allocate Alisha session. Error: %s",  v4);
  sub_10002107C();
}

void sub_10039EDF8()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100021038( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "#ses-carkey,Alisha session invalidated unexpectedly. Reason: %s",  v4);
  sub_10002107C();
}

void sub_10039EE4C()
{
  __assert_rtn( "-[NIServerCarKeySession _configureForOwnerDevice]",  "NIServerCarKeySession.mm",  880,  "_passthroughParams.anchorSimulation == false");
}

void sub_10039EE74()
{
  __assert_rtn( "-[NIServerCarKeySession _configureForOwnerDevice]",  "NIServerCarKeySession.mm",  879,  "_passthroughParams.isPassthroughSession == false");
}

void sub_10039EE9C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039EF0C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039EF7C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039EFEC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F05C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F0CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F13C()
{
}

void sub_10039F19C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F20C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F27C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F2EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F35C()
{
}

void sub_10039F384()
{
}

void sub_10039F3E4()
{
}

void sub_10039F40C()
{
}

void sub_10039F434()
{
}

void sub_10039F45C()
{
}

void sub_10039F484()
{
}

void sub_10039F4AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F51C()
{
}

void sub_10039F57C()
{
}

void sub_10039F5A4()
{
}

void sub_10039F5CC()
{
}

void sub_10039F5F4()
{
}

void sub_10039F61C()
{
  __assert_rtn( "AlishaConfigProvider",  "NIServerCarKeySession.mm",  143,  "minRanMultiplier <= std::numeric_limits<decltype(_minRanMultiplier)>::max()");
}

void sub_10039F644()
{
}

void sub_10039F66C()
{
}

void sub_10039F698()
{
}

void sub_10039F6C4()
{
}

void sub_10039F6F0()
{
}

void sub_10039F750()
{
}

void sub_10039F7B0()
{
}

void sub_10039F810()
{
}

void sub_10039F870(unsigned __int8 a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#configurator,Client notified resource usage limit exceeded (%d) for unsupported configuration type %@",  buf,  0x12u);
}

void sub_10039F8D8()
{
}

void sub_10039F938( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F968( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F998( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039F9C8()
{
}

void sub_10039F9F4()
{
}

void sub_10039FA20()
{
}

void sub_10039FA4C(os_log_s *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4 = 134217984;
  double v5 = a2;
  sub_100156C30( (void *)&_mh_execute_header,  a1,  a4,  "#convertAlgorithmFindeeDataToRoseFindeeData BoundedDisplacementEnterTimestamp=%lf",  (uint8_t *)&v4);
}

void sub_10039FABC()
{
}

void sub_10039FAE8()
{
}

void sub_10039FB14()
{
}

void sub_10039FB40()
{
}

void sub_10039FB6C(os_log_s *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4 = 134217984;
  double v5 = a2;
  sub_100156C30( (void *)&_mh_execute_header,  a1,  a4,  "#convertToAlgorithmFindeeData BoundedDisplacementEnterTimestamp=%lf",  (uint8_t *)&v4);
}

void sub_10039FBDC(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *a1;
  *(_DWORD *)a2 = 134217984;
  *(void *)(a2 + 4) = v3;
  sub_100156C30( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#convertToAlgorithmFindeeData mach_absolute_receipt_timestamp=%lf",  (uint8_t *)a2);
}

void sub_10039FC1C()
{
}

void sub_10039FC48( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039FCE8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "regulatory,geof,default,cleared geof sites",  v1,  2u);
  sub_100003DB4();
}

void sub_10039FD24( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039FD8C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039FDF4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039FE5C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039FEC4()
{
  v3[0] = 67109378;
  v3[1] = v0;
  __int16 v4 = 2080;
  uint64_t v5 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "regulatory,geof,processIsoChange,slot:%d,iso:%s",  (uint8_t *)v3,  0x12u);
  sub_10000668C();
}

void sub_10039FF44( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10039FFAC()
{
}

void sub_10039FFD4()
{
}

void sub_10039FFFC(char *a1, uint64_t a2, os_log_s *a3)
{
  if (a1[23] >= 0) {
    __int16 v4 = a1;
  }
  else {
    __int16 v4 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = v4;
  sub_100137EF8( (void *)&_mh_execute_header,  a2,  a3,  "pblogger, protobuf Trying to log before opening log file. %s",  (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1003A0060()
{
}

void sub_1003A0088()
{
}

void sub_1003A00B4()
{
}

void sub_1003A00E0()
{
}

void sub_1003A010C()
{
}

void sub_1003A0138()
{
}

void sub_1003A0164()
{
}

void sub_1003A0190()
{
}

void sub_1003A01BC()
{
}

void sub_1003A021C()
{
}

void sub_1003A0248()
{
}

void sub_1003A0274()
{
}

void sub_1003A02D4()
{
}

void sub_1003A0334()
{
}

void sub_1003A0360()
{
}

void sub_1003A038C()
{
}

void sub_1003A03B8()
{
}

void sub_1003A03E4()
{
}

void sub_1003A0410()
{
}

void sub_1003A0470()
{
}

void sub_1003A049C()
{
}

void sub_1003A04C8()
{
}

void sub_1003A04F4(char *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  if (a1[23] >= 0) {
    uint8_t v6 = a1;
  }
  else {
    uint8_t v6 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = v6;
  sub_100137EF8( (void *)&_mh_execute_header,  a2,  a3,  "pblogger, getPbCIRPacketType: unrecognized CIR packet type: %s",  (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
  *a4 = qword_1008000A0;
}

void sub_1003A056C(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "pblogger, logRangeCIREvent failure 3",  buf,  2u);
}

void sub_1003A05A8()
{
}

void sub_1003A05D4()
{
}

void sub_1003A0600()
{
}

void sub_1003A062C()
{
}

void sub_1003A0658()
{
}

void sub_1003A0684()
{
}

void sub_1003A06B0()
{
}

void sub_1003A06DC()
{
}

void sub_1003A0708()
{
}

void sub_1003A0734()
{
}

void sub_1003A0760()
{
}

void sub_1003A078C()
{
}

void sub_1003A07B4()
{
}

void sub_1003A07E0()
{
}

void sub_1003A080C()
{
  __assert_rtn( "logLocalP2PTimestampEvent",  "PRProtobufLogger.cpp",  1197,  "localP2PTimestampEvent.eventSource() == RangeTimestampEvent::Source::Local");
}

void sub_1003A0834()
{
}

void sub_1003A0860()
{
}

void sub_1003A088C()
{
  __assert_rtn( "logRemoteP2PTimestampEvent",  "PRProtobufLogger.cpp",  1275,  "remoteP2PTimestampEvent.eventSource() == RangeTimestampEvent::Source::Remote");
}

void sub_1003A08B4()
{
}

void sub_1003A08E0()
{
}

void sub_1003A090C()
{
}

void sub_1003A0934(uint64_t *a1, os_log_s *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  int v7 = 134219008;
  uint64_t v8 = v2;
  __int16 v9 = 2048;
  uint64_t v10 = v3;
  __int16 v11 = 2048;
  uint64_t v12 = v4;
  __int16 v13 = 2048;
  uint64_t v14 = v5;
  __int16 v15 = 2048;
  uint64_t v16 = v6;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "pblogger, RoseSensorFusion: logSensorFusionInputAndOutputWithMotion. Solution = ID: 0x%llx Timestamp: %f Range: %f El: %f Az: %f",  (uint8_t *)&v7,  0x34u);
}

void sub_1003A09D8()
{
}

void sub_1003A0A04()
{
}

void sub_1003A0A30(uint64_t a1, os_log_s *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = 11;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "pblogger, outputProbabilities size (%lu) does not match expected size (%d). Some fields in RangeBiasEstimatorUpdate will not be logged",  (uint8_t *)&v2,  0x12u);
}

void sub_1003A0AB4()
{
}

void sub_1003A0AEC()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 945, "data_ != __null");
}

void sub_1003A0B14()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 946, "idx >= 0");
}

void sub_1003A0B3C()
{
}

void sub_1003A0B64()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 815, "data_ != __null");
}

void sub_1003A0B8C()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 816, "idx >= 0");
}

void sub_1003A0BB4()
{
}

void sub_1003A0BDC()
{
}

void sub_1003A0BF8()
{
}

void sub_1003A0C14()
{
}

void sub_1003A0C40()
{
}

void sub_1003A0C6C()
{
}

void sub_1003A0C98()
{
}

void sub_1003A0CC4()
{
}

void sub_1003A0CF0()
{
}

void sub_1003A0D1C()
{
}

void sub_1003A0D48(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#peer-nba,Unexpected RoseSolutionType: %d",  (uint8_t *)v3,  8u);
  sub_100003DB4();
}

void sub_1003A0DBC()
{
}

void sub_1003A0DE8()
{
}

void sub_1003A0E14()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100137EF8((void *)&_mh_execute_header, v2, v3, "#peer-nba,Failed to start ranging. Return code: %s", v4);
  sub_10002107C();
}

void sub_1003A0E60()
{
}

void sub_1003A0E8C()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100137EF8((void *)&_mh_execute_header, v2, v3, "#peer-nba,Rose session invalidated unexpectedly. Reason: %s", v4);
  sub_10002107C();
}

void sub_1003A0ED8()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100137EF8((void *)&_mh_execute_header, v2, v3, "#peer-nba,Failed to allocate a UWB session. Error: %s", v4);
  sub_10002107C();
}

void sub_1003A0F24()
{
}

void sub_1003A0F50()
{
}

void sub_1003A0F7C()
{
}

void sub_1003A0FA8()
{
  __assert_rtn( "-[NIServerNearbyPeerNbammsSession _getRangingTriggerType]",  "NIServerNearbyPeerNbammsSession.mm",  805,  "_useTestNbammsMode == false");
}

void sub_1003A0FD0()
{
  __assert_rtn( "-[NIServerNearbyPeerNbammsSession _getRangingAcquisitionType]",  "NIServerNearbyPeerNbammsSession.mm",  841,  "_useTestNbammsMode == false");
}

void sub_1003A0FF8()
{
}

void sub_1003A1024(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#peer-nba,NIDiscoveryTokenToDictionary errored out, using default nap channel index: %d",  (uint8_t *)v1,  8u);
  sub_100003DB4();
}

void sub_1003A109C(uint64_t a1)
{
}

void sub_1003A10B0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = @"Add client fail - UWB session ID could not be generated";
  sub_100021038((void *)&_mh_execute_header, a1, a3, "#accessory-service,%@", (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003A1124(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = @"Add client fail - ranging service request could not be generated";
  sub_100021038((void *)&_mh_execute_header, a1, a3, "#accessory-service,%@", (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003A1198(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = @"Add client fail - ranging start options could not be generated";
  sub_100021038((void *)&_mh_execute_header, a1, a3, "#accessory-service,%@", (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003A120C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = @"Add client fail - raw data could not be parsed";
  sub_100021038((void *)&_mh_execute_header, a1, a3, "#accessory-service,%@", (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003A1280(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_100021038( (void *)&_mh_execute_header,  a2,  a3,  "#accessory-service,Generate UWB session ID - failed to generate for process %@, accessory data invalid",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003A12E8()
{
}

void sub_1003A1314()
{
}

void sub_1003A1340()
{
}

void sub_1003A136C()
{
}

void sub_1003A1398()
{
}

void sub_1003A13C4()
{
}

void sub_1003A13F0()
{
  __assert_rtn("ComputeRangingIntervalMs", "NIFiRaDefinitions.h", 628, "fractional == 0");
}

void sub_1003A1418()
{
  __assert_rtn( "ComputeRangingIntervalMs",  "NIFiRaDefinitions.h",  631,  "integral <= std::numeric_limits<uint16_t>::max()");
}

void sub_1003A1440()
{
}

void sub_1003A1468()
{
}

void sub_1003A1490()
{
  __assert_rtn( "CreateAppleShareableConfigurationData",  "NIFiRaDefinitions.h",  716,  "isoCountryCode.length() == sizeof(AppleShareableConfigurationData::V10_Fields::regulatoryCountryCode)");
}

void sub_1003A14B8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  _os_log_fault_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "#accessory-service,Not able to convert preamble %s to FiRa preamble index",  v8,  0xCu);
  sub_10002107C();
}

void sub_1003A150C()
{
}

void sub_1003A1534()
{
}

void sub_1003A1560()
{
}

void sub_1003A158C()
{
}

void sub_1003A15B8()
{
}

void sub_1003A15E4()
{
}

void sub_1003A1610(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_100021038( (void *)&_mh_execute_header,  a2,  a3,  "#accessory-service,Required debug parameter %@ is missing",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003A1678()
{
}

void sub_1003A16A4()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100021038( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "#accessory-service,Build and run session: Failed to start. Error: %s",  v8);
  sub_10002107C();
}

void sub_1003A16F0()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100021038( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "#accessory-service,Build and run session: Failed to initalize. Error: %s",  v8);
  sub_10002107C();
}

void sub_1003A173C()
{
}

void sub_1003A1768()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100021038( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "#accessory-service,Failed to restart ranging. Error: %s",  v8);
  sub_10002107C();
}

void sub_1003A17B4(uint64_t a1)
{
}

void sub_1003A17D0(uint64_t a1)
{
}

void sub_1003A17EC(uint64_t a1)
{
}

void sub_1003A17F8()
{
}

void sub_1003A1824()
{
  sub_1001322C4( (void *)&_mh_execute_header,  v0,  v1,  "updateTimes: offsets missing or inconsistent; setting fStartTimes = newTimes and fEndTimes = invalid",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100003DB4();
}

void sub_1003A1850()
{
  sub_1001322C4( (void *)&_mh_execute_header,  v0,  v1,  "updateTimes: offsetsConsistent(fEndTimes, newTimes); setting fStartTimes = fEndTimes and fEndTimes = newTimes",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100003DB4();
}

void sub_1003A187C()
{
  sub_1001322C4( (void *)&_mh_execute_header,  v0,  v1,  "updateTimes: offsetsConsistent(fStartTimes, newTimes); setting fEndTimes = newTimes",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100003DB4();
}

void sub_1003A18A8()
{
}

void sub_1003A18D4()
{
}

void sub_1003A1938( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A19A0()
{
}

void sub_1003A1A04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A1A6C()
{
}

void sub_1003A1AD0()
{
}

void sub_1003A1B08( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A1B70()
{
}

void sub_1003A1B9C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A1C04()
{
}

void sub_1003A1C30( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A1C98(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#ses-base,Error while invalidating session. Session identifier: %@. Error: %@",  buf,  0x16u);
}

void sub_1003A1CFC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A1D64( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A1D98( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A1DCC()
{
}

void sub_1003A1DF8()
{
}

void sub_1003A1E24(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = a1;
  sub_100021038( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#coex,onIncomingUCMEvent-XPC connection error: %{public}s",  (uint8_t *)a2);
}

void sub_1003A1E60(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = a1;
  sub_100021038( (void *)&_mh_execute_header,  a2,  a3,  "#coex,onIncomingUCMEvent-Unexpected XPC connection event: %{public}s",  (uint8_t *)&v3);
}

void sub_1003A1ECC()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#coex,recieved incorrect channel to trigger blanking on, returning",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003A1EF8()
{
}

void sub_1003A1F24()
{
}

void sub_1003A1F50()
{
}

void sub_1003A1F7C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#GestureFileUtils Resource bundle does not exist in system volume for Primary and Secondary predictor.",  v1,  2u);
}

void sub_1003A1FBC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_100137EF8( (void *)&_mh_execute_header,  a2,  a3,  "#GestureFileUtils Secondary Resource bundle '%s' does not exist in system volume.",  (uint8_t *)a2);
}

void sub_1003A1FF4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_100137EF8( (void *)&_mh_execute_header,  a2,  a3,  "#GestureFileUtils Resource bundle '%s' does not exist in system volume.",  (uint8_t *)a2);
}

void sub_1003A202C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_100137EF8( (void *)&_mh_execute_header,  a2,  a3,  "#GestureFileUtils System volume folder '%s' does not exist.",  (uint8_t *)a2);
}

void sub_1003A2064(uint64_t a1, uint64_t a2)
{
  do
  {
    if (*(_BYTE *)(a1 - 8))
    {
    }

    a1 -= 32LL;
  }

  while (a1 != a2);
}

void sub_1003A20A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A20D8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A2140( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A21A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A2210(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = 178;
  sub_1002550CC( (void *)&_mh_execute_header,  a2,  a3,  "#fu,getHeader,failed,fileToSmall,size,%lu,expected,%d",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003A2288()
{
}

void sub_1003A22F0()
{
}

void sub_1003A2358()
{
}

void sub_1003A23C0()
{
  WORD2(sub_1001DFFC8((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3, v4) = 2080;
  HIWORD(sub_1001DFFC8((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3, v4) = v0;
  sub_10016C348((void *)&_mh_execute_header, v1, v2, "#fu,calcCrc called from %s,file,%s,cantOpen", v3, v4);
  sub_10000668C();
}

void sub_1003A243C()
{
}

void sub_1003A24A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#ni-km,Delete all failed", v1, 2u);
}

void sub_1003A24E0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A2544( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A25A8(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "FATAL CLIENT ERROR: Client hasn't dequeued %zu xpc messages. Invalidating connection.",  (uint8_t *)&v2,  0xCu);
}

void sub_1003A261C()
{
  int v2 = 136315138;
  uint64_t v3 = v0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_FAULT,  "#ota,file %s did not contain a dictionary as expected",  (uint8_t *)&v2,  0xCu);
}

void sub_1003A2690()
{
  int v3 = 136315394;
  uint64_t v4 = v0;
  __int16 v5 = 2112;
  uint64_t v6 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "#ota,error reading file %s (%@)",  (uint8_t *)&v3,  0x16u);
}

void sub_1003A2714(uint64_t a1, void **a2)
{
  int v3 = (void **)(a1 - 24);
  do
  {
    uint64_t v4 = v3;
    sub_10025EFB0(&v4);
    v3 -= 6;
  }

  while (v3 + 3 != a2);
}

void sub_1003A2768(uint64_t a1, void **a2)
{
  int v3 = (void **)(a1 - 24);
  do
  {
    uint64_t v4 = v3;
    sub_10025EFB0(&v4);
    v3 -= 6;
  }

  while (v3 + 3 != a2);
}

void sub_1003A27BC(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v2 = a1 + 8;
  uint64_t v3 = v4;
  int v5 = 136315138;
  uint64_t v6 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Did fail with error: %s",  (uint8_t *)&v5,  0xCu);
}

void sub_1003A2840()
{
}

void sub_1003A286C()
{
}

void sub_1003A2898()
{
}

void sub_1003A28C4()
{
}

void sub_1003A28F0()
{
}

void sub_1003A2968()
{
}

void sub_1003A29CC()
{
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "fileutil,decompress,src,%s,dst,%s,done",  v2,  0x16u);
  sub_10000668C();
}

void sub_1003A2A58()
{
}

void sub_1003A2ABC()
{
}

void sub_1003A2B20()
{
}

void sub_1003A2B84(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  int v5 = 136315138;
  uint64_t v6 = v3;
  sub_100021038((void *)&_mh_execute_header, a2, v4, "Caught Exception: %s", (uint8_t *)&v5);
}

void sub_1003A2C0C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A2C3C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "[PRConfigurationManager] %d is invalid value for preferred channel in default write.",  (uint8_t *)v2,  8u);
  sub_100003DB4();
}

void sub_1003A2CAC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "[PRConfigurationManager] At least one of Ch5 or Ch9 must be allowed.",  v1,  2u);
  sub_100003DB4();
}

void sub_1003A2CE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A2D18()
{
}

void sub_1003A2D44()
{
}

void sub_1003A2D70( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A2DD8()
{
}

void sub_1003A2E04()
{
}

void sub_1003A2E30()
{
}

void sub_1003A2E5C()
{
}

void sub_1003A2E88()
{
}

void sub_1003A2EB4()
{
}

void sub_1003A2EE0()
{
}

void sub_1003A2F0C()
{
}

void sub_1003A2F38( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A2F9C()
{
}

void sub_1003A2FC8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A302C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A3094()
{
}

void sub_1003A30C0()
{
}

void sub_1003A30EC()
{
}

void sub_1003A3118()
{
}

void sub_1003A3140()
{
}

void sub_1003A316C()
{
}

void sub_1003A3198( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A31FC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "regulatory,geo,loc,checkRegulatoryIso,geoServices,error,%{private}@",  (uint8_t *)&v2,  0xCu);
  sub_10000668C();
}

void sub_1003A326C()
{
}

void sub_1003A3298()
{
}

void sub_1003A32C4()
{
}

void sub_1003A3308()
{
}

void sub_1003A334C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_10026C908((void *)&_mh_execute_header, v7, v8, "#rlm,RangingDurationTracker(%s): ranging started, first one", v9);
  sub_10002107C();
}

void sub_1003A3394()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_10026C908( (void *)&_mh_execute_header,  v7,  v8,  "#rlm,RangingDurationTracker(%s): ranging started, subsequent one",  v9);
  sub_10002107C();
}

void sub_1003A33DC()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100229088( (void *)&_mh_execute_header,  v7,  v8,  "#rlm,Attempt to stop ranging for '%s' when there is none ongoing",  v9);
  sub_10002107C();
}

void sub_1003A3424(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#rlm,useCases empty", v1, 2u);
}

void sub_1003A3464()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100229088((void *)&_mh_execute_header, v7, v8, "#rlm,RangingBudgetTracker not setup for use case '%s'", v9);
  sub_10002107C();
}

void sub_1003A34AC()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100179458(v2, v6, 4.8149e-34);
  sub_100229088((void *)&_mh_execute_header, v7, v8, "#rlm,Unsupported use case '%s'", v9);
  sub_10002107C();
}

void sub_1003A34F4()
{
}

void sub_1003A351C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Message type RoseMotionMessageType::Unspecified",  v1,  2u);
}

void sub_1003A355C()
{
}

void sub_1003A3588()
{
}

void sub_1003A35B4()
{
}

void sub_1003A35E0()
{
}

void sub_1003A360C()
{
}

void sub_1003A3638()
{
  __assert_rtn( "isInitiator",  "NIServerRoseSession.mm",  117,  "fServiceRequest.role != serviceattributes::Role::Unspecified");
}

void sub_1003A3660()
{
  sub_1000472F4( (void *)&_mh_execute_header,  v0,  v1,  "#rose-ses,#throttle got didReceiveRangingRateUpdateEvent but fServiceTicketId == std::nullopt",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003A368C(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = atomic_load(a2);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#rose-ses,state inconsistency: mismatching subrates %d != %d.",  (uint8_t *)v5,  0xEu);
  sub_10000668C();
}

void sub_1003A3714()
{
}

void sub_1003A3740()
{
}

void sub_1003A376C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A37DC()
{
}

void sub_1003A3808()
{
}

void sub_1003A3834(uint64_t *a1, char a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = *((char *)a1 + 31);
  int v7 = (uint64_t *)a1[1];
  uint64_t v5 = a1 + 1;
  uint8_t v6 = v7;
  if (v4 >= 0) {
    os_log_t v8 = v5;
  }
  else {
    os_log_t v8 = v6;
  }
  int v10 = 134218498;
  uint64_t v11 = v3;
  if ((a2 & 1) != 0) {
    __int16 v9 = "Notify";
  }
  else {
    __int16 v9 = "Invalidate";
  }
  __int16 v12 = 2080;
  __int16 v13 = v8;
  __int16 v14 = 2080;
  __int16 v15 = v9;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#rose-ses,Failed with error. Code: %ld, Description: %s. Action: %s",  (uint8_t *)&v10,  0x20u);
}

void sub_1003A38EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A395C()
{
}

void sub_1003A3988()
{
}

void sub_1003A39B4()
{
}

void sub_1003A39E0()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136380675;
  *(void *)(v2 + 4) = v8;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "#rose-ses,updatePeerData: %{private}s",  v4,  0xCu);
}

void sub_1003A3A40( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A3AD4()
{
}

void sub_1003A3B00()
{
}

void sub_1003A3B2C()
{
}

void sub_1003A3B58()
{
}

void sub_1003A3B84()
{
}

void sub_1003A3BB0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A3C40()
{
}

void sub_1003A3C68()
{
}

void sub_1003A3C94()
{
}

void sub_1003A3CBC()
{
}

void sub_1003A3CE4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }

void sub_1003A3D08()
{
}

void sub_1003A3D34()
{
}

void sub_1003A3D60()
{
}

void sub_1003A3D8C()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "#rose-ses,triggerAlishaSessionStats failed with status code %s",  v4,  0xCu);
}

void sub_1003A3DEC()
{
}

void sub_1003A3E14()
{
}

void sub_1003A3E3C()
{
}

void sub_1003A3E64(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }

void sub_1003A3E7C(uint64_t a1)
{
}

void sub_1003A3E9C()
{
}

void sub_1003A3EC4()
{
}

void sub_1003A3EEC()
{
}

void sub_1003A3F14()
{
}

void sub_1003A3F3C()
{
}

void sub_1003A3F64(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#ses-sptbrows,Could not get recently observed objects cache session.",  v1,  2u);
}

void sub_1003A3FA4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000AFA4((void *)&_mh_execute_header, a1, a3, "DiscoveryToken getter returning nil", a5, a6, a7, a8, 0);
  sub_100003DB4();
}

void sub_1003A3FD4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138477827;
  uint64_t v4 = a1;
  sub_100021038( (void *)&_mh_execute_header,  a2,  a3,  "DelegateProxy: session failed with error: %{private}@",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003A403C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138477827;
  uint64_t v4 = a1;
  sub_100021038( (void *)&_mh_execute_header,  a2,  a3,  "DelegateProxy: session invalidated with error: %{private}@",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003A40A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A40D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A4104(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138477827;
  *(void *)(a2 + 4) = a1;
  sub_100021038((void *)&_mh_execute_header, a3, (uint64_t)a3, "%{private}@", (uint8_t *)a2);
}

void sub_1003A4150(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Delegate: notify invalidation: %@. Sanitized: %@",  (uint8_t *)&v3,  0x16u);
  sub_10000668C();
}

void sub_1003A41D0()
{
}

void sub_1003A41FC()
{
}

void sub_1003A4228()
{
}

void sub_1003A4254()
{
}

void sub_1003A4280(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 6;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "advertisingAddress.length (%lu) != rose::kBtAdvAddressByteLength (%d)",  buf,  0x12u);
}

void sub_1003A42D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A4304( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A436C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A439C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A43CC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A4434( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A449C()
{
}

void sub_1003A44C8()
{
}

void sub_1003A44F4()
{
}

void sub_1003A4520()
{
}

void sub_1003A4548()
{
}

void sub_1003A4574()
{
}

void sub_1003A45A0()
{
}

void sub_1003A45CC()
{
}

void sub_1003A45F8()
{
}

void sub_1003A4624(uint64_t *a1, uint8_t *buf, os_log_t log)
{
  else {
    uint64_t v4 = (uint64_t *)*a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to place service request: %s",  buf,  0xCu);
  sub_10002107C();
}

void sub_1003A468C()
{
  sub_10000B000( (void *)&_mh_execute_header,  v0,  v1,  "fRequestToClientMap.find(ticketId (%d)) != fRequestToClientMap.end()",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003A46EC()
{
}

void sub_1003A4718()
{
}

void sub_1003A4744()
{
}

void sub_1003A4770()
{
}

void sub_1003A47B4()
{
}

void sub_1003A47E0()
{
}

void sub_1003A480C()
{
}

void sub_1003A4870()
{
}

void sub_1003A48B4()
{
}

void sub_1003A48E0()
{
}

void sub_1003A490C()
{
}

void sub_1003A496C()
{
}

void sub_1003A4998()
{
}

void sub_1003A49C4()
{
}

void sub_1003A4A08()
{
}

void sub_1003A4A30()
{
}

void sub_1003A4A5C()
{
}

void sub_1003A4A88()
{
}

void sub_1003A4AEC()
{
}

void sub_1003A4B50()
{
}

void sub_1003A4BB0()
{
}

void sub_1003A4C10()
{
}

void sub_1003A4C70()
{
}

void sub_1003A4CD0()
{
}

void sub_1003A4CF8()
{
}

void sub_1003A4D20()
{
}

void sub_1003A4D84()
{
}

void sub_1003A4DE4(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Speculative Cleanup: no requests for client %p.",  (uint8_t *)&v3,  0xCu);
}

void sub_1003A4E5C()
{
}

void sub_1003A4E88()
{
}

void sub_1003A4EB4()
{
}

void sub_1003A4EE0()
{
}

void sub_1003A4F0C()
{
}

void sub_1003A4F38()
{
  do
    sub_10018C530(v1);
  while (v3);
  if (v2)
  {
    sub_10002107C();
  }

  else
  {
    sub_10018C540();
    sub_10028F088(v0);
  }

void sub_1003A4F6C()
{
}

void sub_1003A4F94()
{
}

void sub_1003A4FF4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#ses-wifi-test,NINearbyObject objectFromBluetoothDevice returned nil.",  v1,  2u);
  sub_100003DB4();
}

void sub_1003A5030( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A5060( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A50D0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A5138()
{
}

void sub_1003A5198( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A51C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A5238(char *a1, void *a2, os_log_t log)
{
  if (*a1 >= 0) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = (void *)*a2;
  }
  int v4 = 136380675;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#ses-wifi-test,WiFi ranging error:%{private}s",  (uint8_t *)&v4,  0xCu);
  sub_10000668C();
}

void sub_1003A52BC()
{
}

void sub_1003A531C()
{
}

void sub_1003A537C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A53AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A53DC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#regulatory,wifiIso,startMonitoring registering CWFEventTypeCountryCodeChanged event error %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1003A5450(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#regulatory,wifiIso,invalidationHandler ",  v1,  2u);
  sub_100003DB4();
}

void sub_1003A548C()
{
}

void sub_1003A54C4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#reg-prov,user provided regulatory group: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1003A5538()
{
}

void sub_1003A5564()
{
}

void sub_1003A5590()
{
}

void sub_1003A55BC(uint64_t *a1, char a2, os_log_t log)
{
  else {
    uint64_t v3 = (uint64_t *)*a1;
  }
  int v4 = 136315394;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#reg-prov,injectIsoCode,isoCountryCode:%s,success:%d",  (uint8_t *)&v4,  0x12u);
}

void sub_1003A5654()
{
}

void sub_1003A5680()
{
}

void sub_1003A56A8()
{
  __assert_rtn( "-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]",  "NIServerFindingDiscovery.mm",  345,  "(*outPeers).count == 0 || _spatialInteractionCurrentPeerIndex < (*outPeers).count");
}

void sub_1003A56D0()
{
  __assert_rtn( "-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]",  "NIServerFindingDiscovery.mm",  344,  "(*outPeers).count == (*outAdvertisements).count");
}

void sub_1003A56F8()
{
  __assert_rtn( "-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]",  "NIServerFindingDiscovery.mm",  352,  "(*outPeers).count == 0 || _nearbyActionNoWakeCurrentPeerIndex < (*outPeers).count");
}

void sub_1003A5720()
{
  __assert_rtn( "-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]",  "NIServerFindingDiscovery.mm",  351,  "(*outPeers).count == (*outAdvertisements).count");
}

void sub_1003A5748()
{
}

void sub_1003A5774()
{
}

void sub_1003A57D4()
{
}

void sub_1003A5800()
{
}

void sub_1003A582C()
{
}

void sub_1003A588C()
{
}

void sub_1003A58EC()
{
}

void sub_1003A594C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A59B0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A5A14()
{
}

void sub_1003A5A40()
{
}

void sub_1003A5A6C(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 136315395;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2113;
  *(void *)(a3 + 14) = a2;
  sub_1001FD660( (void *)&_mh_execute_header,  "#find-disc,[%s] Found device (BT) but does not contain advertisement. Device: %{private}@",  (uint8_t *)a3,  a4);
}

void sub_1003A5AB4()
{
}

void sub_1003A5AE0()
{
}

void sub_1003A5B0C(unint64_t a1, os_log_s *a2)
{
  int v3 = 136315138;
  uint64_t v4 = sub_10029D974(a1);
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#find-disc,Unexpected BT state: %s",  (uint8_t *)&v3,  0xCu);
}

void sub_1003A5B94()
{
}

void sub_1003A5BC0(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 136315394;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  sub_1001FD660((void *)&_mh_execute_header, "#find-disc,[%s] BT error: %@", (uint8_t *)a3, a4);
}

void sub_1003A5C08()
{
}

void sub_1003A5C68()
{
}

void sub_1003A5CC8()
{
}

void sub_1003A5D28()
{
}

void sub_1003A5D54()
{
}

void sub_1003A5D80()
{
}

void sub_1003A5DAC()
{
}

void sub_1003A5DD8()
{
}

void sub_1003A5E04()
{
}

void sub_1003A5E30(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#find-disc,Couldn't generate advertisement from byte representation: decode error: %d",  (uint8_t *)v3,  8u);
  sub_100003DB4();
}

void sub_1003A5EA4()
{
}

void sub_1003A5ED0()
{
}

void sub_1003A5EFC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_100156C30( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#nrby-eng,#region-class elements in regionDict: %lu",  (uint8_t *)a1);
}

void sub_1003A5F38( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A5F9C()
{
}

void sub_1003A5FD4()
{
}

void sub_1003A6000()
{
}

void sub_1003A602C()
{
}

void sub_1003A6058()
{
}

void sub_1003A6084()
{
}

void sub_1003A60AC()
{
}

void sub_1003A60D8()
{
}

void sub_1003A6104()
{
}

void sub_1003A6130()
{
}

void sub_1003A615C()
{
}

void sub_1003A6188( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A61F0()
{
}

void sub_1003A6218()
{
}

void sub_1003A6240()
{
}

void sub_1003A626C()
{
}

void sub_1003A6294()
{
}

void sub_1003A62BC()
{
}

void sub_1003A62E8()
{
}

void sub_1003A6314()
{
}

void sub_1003A6340()
{
}

void sub_1003A63A0()
{
}

void sub_1003A6400()
{
}

void sub_1003A6428(char a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = "activated";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "deactivated";
  }
  int v4 = 134218242;
  uint64_t v5 = a2;
  __int16 v6 = 2080;
  int v7 = v3;
  sub_1002B08B0( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#nrby-eng,#region-class device monitor for device 0x%llx was %s",  (uint8_t *)&v4);
  sub_10000668C();
}

void sub_1003A64B8(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *a1;
  *(_DWORD *)a2 = 134217984;
  *(void *)(a2 + 4) = v3;
  sub_100021038( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#nrby-eng,no object for identifier 0x%llx",  (uint8_t *)a2);
}

void sub_1003A64F8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A656C(uint64_t *a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (void *)(a2 + 136);
  *(_DWORD *)a3 = 134218242;
  *(void *)(a3 + 4) = v4;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + 14) = v5;
  sub_1002B08B0( (void *)&_mh_execute_header,  a4,  a3,  "#nrby-eng,#sa_algo,New measurement for SA with timestamp %f - unaccepted type for SA. Unique identifier: %s",  (uint8_t *)a3);
}

void sub_1003A65CC()
{
}

void sub_1003A65F8()
{
}

void sub_1003A6624()
{
}

void sub_1003A6650()
{
}

void sub_1003A667C()
{
}

void sub_1003A66A8(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#nrby-eng,Mismatching finding peer token: %@ != %@",  (uint8_t *)&v4,  0x16u);
  sub_10000668C();
}

void sub_1003A672C()
{
}

void sub_1003A6758()
{
}

void sub_1003A6784()
{
}

void sub_1003A67E4()
{
}

void sub_1003A6844()
{
}

void sub_1003A68A4(char *a1, uint64_t a2, os_log_s *a3)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = v4;
  sub_100156C30((void *)&_mh_execute_header, a3, (uint64_t)a3, "#nrby-eng,%s", (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1003A690C()
{
}

void sub_1003A6970(void **a1)
{
}

void sub_1003A6980()
{
}

void sub_1003A699C()
{
}

void sub_1003A69B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to format protobuf file name", v1, 2u);
}

void sub_1003A69F8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to observe default. defaultName or callback is nil",  v1,  2u);
}

void sub_1003A6A38(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "No subscription for user default change: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1003A6AAC()
{
  __assert_rtn("append", "AlishaDCKCoder.cpp", 232, "msg.size() + sizeof(data) <= kMaxMessageSize");
}

void sub_1003A6AD4()
{
  __assert_rtn("append", "AlishaDCKCoder.cpp", 240, "msg.size() + sizeof(data) <= kMaxMessageSize");
}

void sub_1003A6AFC()
{
  __assert_rtn("append", "AlishaDCKCoder.cpp", 250, "msg.size() + sizeof(data) <= kMaxMessageSize");
}

void sub_1003A6B24()
{
  __assert_rtn("readAndAdvance", "AlishaDCKCoder.cpp", 182, "msg.size() <= kMaxMessageSize");
}

void sub_1003A6B4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1002BB074("readAndAdvance", "AlishaDCKCoder.cpp", a3, "offset + sizeof(val) <= msg.size()");
}

void sub_1003A6B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1002BB084("readAndAdvance", "AlishaDCKCoder.cpp", a3, "offset + sizeof(val) <= msg.size()");
}

void sub_1003A6B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1002BB07C("readAndAdvance", "AlishaDCKCoder.cpp", a3, "offset + sizeof(val) <= msg.size()");
}

void sub_1003A6BB8()
{
  __assert_rtn("decodeRangingSessionRQ", "AlishaDCKCoder.cpp", 744, "offset == msg.size()");
}

void sub_1003A6BE0()
{
  __assert_rtn("decodeRangingSessionSetupRQ", "AlishaDCKCoder.cpp", 813, "offset == msg.size()");
}

void sub_1003A6C08()
{
  __assert_rtn("decodeRangingSuspendRQ", "AlishaDCKCoder.cpp", 865, "offset == msg.size()");
}

void sub_1003A6C30()
{
  __assert_rtn("decodeRangingSuspendRS", "AlishaDCKCoder.cpp", 884, "offset == msg.size()");
}

void sub_1003A6C58()
{
  __assert_rtn("decodeRangingRecoveryRQ", "AlishaDCKCoder.cpp", 903, "offset == msg.size()");
}

void sub_1003A6C80()
{
  __assert_rtn("decodeConfigurableRangingRecoveryRQ", "AlishaDCKCoder.cpp", 945, "offset == msg.size()");
}

void sub_1003A6CA8(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }

void sub_1003A6CC0(int a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_1002C1CB4(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_100147814();
}

void sub_1003A6D40(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 24) = v2;
    operator delete(v2);
  }

void sub_1003A6D64(uint64_t a1, void *a2, uint64_t a3)
{
  if (v24 < 0) {
    sub_1002C1CB4(v10, v11, v12, v13, v14, v15, v16, v17, v19, v21);
  }
  *a2 = qword_1008000A0;
  sub_1002C1CE8();
}

void sub_1003A6E04(int a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_1002C1CB4(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_100147814();
}

void sub_1003A6E84()
{
}

void sub_1003A6EAC(int a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_1002C1CB4(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_100147814();
}

void sub_1003A6F2C(char a1, os_log_s *a2)
{
  if (v13 < 0) {
    sub_1002C1CB4(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  sub_100147814();
}

void sub_1003A6FC8(uint64_t a1, void *a2, uint64_t a3)
{
  if (v24 < 0) {
    sub_1002C1CB4(v10, v11, v12, v13, v14, v15, v16, v17, v19, v21);
  }
  *a2 = qword_1008000A0;
  sub_1002C1CE8();
}

void sub_1003A7068( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A70D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A7148( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A71B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A7228( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A7298()
{
}

void sub_1003A72C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A7330( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A73A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A7410( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A7480( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A74F0()
{
}

void sub_1003A7518( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A7588( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A75F8()
{
}

void sub_1003A7620()
{
}

void sub_1003A7648()
{
}

void sub_1003A7670()
{
}

void sub_1003A7698()
{
  __assert_rtn( "processErrorCodeFromDCKMessageProcessing",  "AlishaDCKEventNotificationGenerator.cpp",  23,  "errorCode != StatusCode::SUCCESS");
}

void sub_1003A76C0()
{
}

void sub_1003A7730()
{
}

void sub_1003A775C()
{
}

void sub_1003A77C0()
{
}

void sub_1003A7824()
{
}

void sub_1003A7888()
{
}

void sub_1003A78EC()
{
}

void sub_1003A7950()
{
}

double sub_1003A79B4(uint64_t a1, float *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v4 = *(void *)(a1 + 24);
  double v5 = *a2;
  *(_DWORD *)buf = 134218240;
  *(double *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#sa_algo,Populating range output with SA, range: %0.2f m, timestamp: %f s",  buf,  0x16u);
  return result;
}

void sub_1003A7A14()
{
}

void sub_1003A7A78()
{
}

void sub_1003A7ADC()
{
}

void sub_1003A7B40()
{
}

void sub_1003A7BA4()
{
}

void sub_1003A7C08()
{
}

void sub_1003A7C34()
{
}

void sub_1003A7C60()
{
}

void sub_1003A7C8C()
{
}

void sub_1003A7CB8()
{
}

void sub_1003A7CE4(void *a1, os_log_s *a2)
{
  uint64_t v3 = a1[49];
  uint64_t v2 = a1[50];
  uint64_t v5 = a1[47];
  uint64_t v4 = a1[48];
  int v6 = 134218752;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  __int16 v12 = 2048;
  uint64_t v13 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#sa_algo,AoA cache: time %f s, distance: %0.2f m, az: %3.2f rad, el: %3.2f rad",  (uint8_t *)&v6,  0x2Au);
}

void sub_1003A7D7C()
{
}

void sub_1003A7DE0()
{
}

void sub_1003A7E44()
{
}

void sub_1003A7EA8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 24) = v2;
    operator delete(v2);
  }

void sub_1003A7EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1002CC360("TransposeDataFootprint", "cnmatrix.h", a3, "scratch != nullptr");
}

void sub_1003A7EE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1003A7F08()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2337, "in_nr >= 0");
}

void sub_1003A7F30()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2339, "in_nr <= max_nr");
}

void sub_1003A7F58()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2340, "in_nc >= 0");
}

void sub_1003A7F80()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2342, "in_nc <= max_nc");
}

void sub_1003A7FA8()
{
  __assert_rtn("WriteValue", "cnmatrixbase.h", 1104, "data_ != __null");
}

void sub_1003A7FD0()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 913, "data_ != __null");
}

void sub_1003A7FF8()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 914, "idx >= 0");
}

void sub_1003A8020()
{
}

void sub_1003A8048()
{
  __assert_rtn("Transpose", "cnmatrixbase.h", 5010, "&(A) != &(B)");
}

void sub_1003A8070()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 782, "data_ != __null");
}

void sub_1003A8098()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 783, "idx >= 0");
}

void sub_1003A80C0()
{
}

void sub_1003A80E8()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3677, "&(A) != &(C)");
}

void sub_1003A8110()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3678, "&(B) != &(C)");
}

void sub_1003A8138()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3675, "A.num_cols_ == B.num_cols_");
}

void sub_1003A8160()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3674, "A.num_rows_ == B.num_rows_");
}

void sub_1003A8188()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3887, "&(A) != &(C)");
}

void sub_1003A81B0()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3888, "&(B) != &(C)");
}

void sub_1003A81D8()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3885, "A.num_cols_ == B.num_rows_");
}

void sub_1003A8200()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4504, "&A != &Acopy");
}

void sub_1003A8228()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4505, "&A != &Work");
}

void sub_1003A8250()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4506, "&A != &S");
}

void sub_1003A8278()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4507, "&Acopy != &Work");
}

void sub_1003A82A0()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4508, "&Acopy != &S");
}

void sub_1003A82C8()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4509, "&Work != &S");
}

void sub_1003A82F0()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4512, "Acopy.num_elements_ >= A.num_elements_");
}

void sub_1003A8318()
{
}

void sub_1003A8364()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4716, "ret == 1");
}

void sub_1003A83B0()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7028, "&A != &Acopy");
}

void sub_1003A83D8()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7029, "&A != &Work");
}

void sub_1003A8400()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7030, "&A != &S");
}

void sub_1003A8428()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7031, "&Acopy != &Work");
}

void sub_1003A8450()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7032, "&Acopy != &S");
}

void sub_1003A8478()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7033, "&Work != &S");
}

void sub_1003A84A0()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7036, "ne >= 1");
}

void sub_1003A84C8()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7037, "ne >= 3*minnrnc + maxnrnc");
}

void sub_1003A84F0()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7038, "ne >= 5*minnrnc");
}

void sub_1003A8518()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7040, "Acopy.max_num_rows_ >= nrA");
}

void sub_1003A8540()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7041, "Acopy.max_num_cols_ >= ncA");
}

void sub_1003A8568()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7042, "S.max_num_rows_ >= minnrnc");
}

void sub_1003A8590()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7043, "S.max_num_cols_ >= 1");
}

void sub_1003A85B8()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7111, "info == 0");
}

void sub_1003A85E0()
{
  __assert_rtn("operator=", "cnmatrixbase.h", 619, "this->max_num_rows_ >= A.num_rows_");
}

void sub_1003A8608()
{
  __assert_rtn("operator=", "cnmatrixbase.h", 620, "this->max_num_cols_ >= A.num_cols_");
}

void sub_1003A8630()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3536, "&(A) != &(C)");
}

void sub_1003A8658()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3537, "&(B) != &(C)");
}

void sub_1003A8680()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3534, "A.num_cols_ == B.num_cols_");
}

void sub_1003A86A8()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3533, "A.num_rows_ == B.num_rows_");
}

void sub_1003A86D0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A8704( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003A8738(os_log_t log, __n128 a2)
{
  int v2 = 134218752;
  double v3 = a2.n128_f32[3];
  __int16 v4 = 2048;
  double v5 = a2.n128_f32[0];
  __int16 v6 = 2048;
  double v7 = a2.n128_f32[1];
  __int16 v8 = 2048;
  double v9 = a2.n128_f32[2];
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#sa_algo_finder_io,io propagated pose, quatw: %f, quatx: %f, quaty: %f, quatz: %f",  (uint8_t *)&v2,  0x2Au);
}

void sub_1003A87E8()
{
}

void sub_1003A8814()
{
}

void sub_1003A8840()
{
}

void sub_1003A886C()
{
}

void sub_1003A8898()
{
}

void sub_1003A88FC()
{
  uint64_t v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  __int16 v9 = v1;
  uint64_t v10 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "#findalgs-findee, Providing measured delta v, H1: %f, H2: %f , applicable time: %f, transmission time: %f",  v5,  0x2Au);
}

void sub_1003A898C()
{
}

void sub_1003A89F0()
{
}

void sub_1003A8A54()
{
}

void sub_1003A8A80()
{
}

void sub_1003A8AE4()
{
}

void sub_1003A8B48()
{
}

void sub_1003A8BAC()
{
}

void sub_1003A8C10()
{
  sub_10013EB60( (void *)&_mh_execute_header,  v0,  v1,  "#findalgs-findee, FindeeAlgorithms::buildLocationData() Location recency = %f",  v2,  v3,  v4,  v5,  v6);
  sub_10000668C();
}

void sub_1003A8C74()
{
}

void sub_1003A8CA0()
{
}

void sub_1003A8CD8()
{
}

void sub_1003A8D50()
{
}

void sub_1003A8DB8()
{
}

void sub_1003A8E1C()
{
}

void sub_1003A8E48()
{
}

void sub_1003A8E74(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#findalgs-findee, Walking set to true, steps since last deleted step count: %d",  (uint8_t *)v2,  8u);
  sub_100003DB4();
}

void sub_1003A8EE4()
{
}

void sub_1003A8F10()
{
}

void sub_1003A8F3C()
{
}

void sub_1003A8F68()
{
}

void sub_1003A8F94()
{
}

void sub_1003A8FC0()
{
}

void sub_1003A8FEC()
{
}

void sub_1003A9018()
{
  uint64_t v3 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "#findalgs-findee, pdr mach time: %f, pdr cont time: %f",  v2,  0x16u);
  sub_10000668C();
}

void sub_1003A908C()
{
}

void sub_1003A90B8()
{
}

void sub_1003A90E4()
{
}

void sub_1003A9110()
{
}

void sub_1003A9144(uint64_t a1, os_log_s *a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#sa_algo_batchfilter_with,Invalid measurement rejected by the batch filter filter, range passed: %f m, range uncerta inty passed: %f m",  (uint8_t *)&v4,  0x16u);
}

void sub_1003A91C8()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 749, "data_ != __null");
}

void sub_1003A91F0()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 750, "idx >= 0");
}

void sub_1003A9218()
{
}

void *sub_1003A9240(void *result, void *a2)
{
  do
  {
    result[61] = off_1007AED90;
    result[47] = off_1007AED90;
    result[26] = off_1007AED90;
    result[18] = off_1007AED90;
    result[10] = off_1007AED90;
    result[1] = off_1007AED90;
    result += 77;
  }

  while (result != a2);
  return result;
}

void *sub_1003A9270(void *result, void *a2)
{
  do
  {
    result[62] = off_1007AED90;
    result[54] = off_1007AED90;
    result[38] = off_1007AED90;
    result[17] = off_1007AED90;
    result[9] = off_1007AED90;
    *double result = off_1007AED90;
    result += 70;
  }

  while (result != a2);
  return result;
}

void sub_1003A92A0()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6077, "&A != &Work");
}

void sub_1003A92C8()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6078, "&A != &B");
}

void sub_1003A92F0()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6081, "&Work != &B");
}

void sub_1003A9318()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6086, "Ipiv.max_num_rows_ * Ipiv.max_num_cols_ >= A.num_rows_");
}

void sub_1003A9340()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6088, "Work.max_num_rows_ * Work.max_num_cols_ >= 4 * A.num_rows_");
}

void sub_1003A9368()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6090, "B.max_num_rows_ >= A.num_rows_");
}

void sub_1003A9390()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6091, "B.max_num_cols_ >= A.num_cols_");
}

void sub_1003A93B8()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6127, "info >= 0");
}

void sub_1003A9408()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6159, "info >= 0");
}

void sub_1003A9430()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6084, "A.num_rows_ == A.num_cols_");
}

void sub_1003A9458()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3818, "&(B) != &(C)");
}

void sub_1003A9480()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5690, "&A != &Acopy");
}

void sub_1003A94A8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5691, "&A != &Dr");
}

void sub_1003A94D0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5692, "&A != &Di");
}

void sub_1003A94F8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5693, "&A != &Vr");
}

void sub_1003A9520()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5694, "&A != &Vi");
}

void sub_1003A9548()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5695, "&A != &Swork");
}

void sub_1003A9570()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5696, "&A != &Rwork");
}

void sub_1003A9598()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5697, "&A != &Work");
}

void sub_1003A95C0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5698, "&Acopy != &Dr");
}

void sub_1003A95E8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5699, "&Acopy != &Di");
}

void sub_1003A9610()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5700, "&Acopy != &Vr");
}

void sub_1003A9638()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5701, "&Acopy != &Vi");
}

void sub_1003A9660()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5702, "&Acopy != &Swork");
}

void sub_1003A9688()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5703, "&Acopy != &Rwork");
}

void sub_1003A96B0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5704, "&Acopy != &Work");
}

void sub_1003A96D8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5705, "&Dr != &Di");
}

void sub_1003A9700()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5706, "&Dr != &Vr");
}

void sub_1003A9728()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5707, "&Dr != &Vi");
}

void sub_1003A9750()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5708, "&Dr != &Swork");
}

void sub_1003A9778()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5709, "&Dr != &Rwork");
}

void sub_1003A97A0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5710, "&Dr != &Work");
}

void sub_1003A97C8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5711, "&Di != &Vr");
}

void sub_1003A97F0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5712, "&Di != &Vi");
}

void sub_1003A9818()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5713, "&Di != &Swork");
}

void sub_1003A9840()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5714, "&Di != &Rwork");
}

void sub_1003A9868()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5715, "&Di != &Work");
}

void sub_1003A9890()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5716, "&Vr != &Vi");
}

void sub_1003A98B8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5717, "&Vr != &Swork");
}

void sub_1003A98E0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5718, "&Vr != &Rwork");
}

void sub_1003A9908()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5719, "&Vr != &Work");
}

void sub_1003A9930()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5720, "&Vi != &Swork");
}

void sub_1003A9958()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5721, "&Vi != &Rwork");
}

void sub_1003A9980()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5722, "&Vi != &Work");
}

void sub_1003A99A8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5723, "&Swork != &Rwork");
}

void sub_1003A99D0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5724, "&Swork != &Work");
}

void sub_1003A99F8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5725, "&Rwork != &Work");
}

void sub_1003A9A20()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5730, "Swork.max_num_rows_ * Swork.max_num_cols_ >= nrA");
}

void sub_1003A9A48()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5731, "Rwork.max_num_rows_ * Rwork.max_num_cols_ >= nrA");
}

void sub_1003A9A70()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5732, "ne >= 3*nrA");
}

void sub_1003A9A98()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5734, "Acopy.max_num_rows_ >= nrA");
}

void sub_1003A9AC0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5735, "Acopy.max_num_cols_ >= ncA");
}

void sub_1003A9AE8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5736, "Dr.max_num_rows_ >= nrA");
}

void sub_1003A9B10()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5737, "Dr.max_num_cols_ >= ncA");
}

void sub_1003A9B38()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5738, "Di.max_num_rows_ >= nrA");
}

void sub_1003A9B60()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5739, "Di.max_num_cols_ >= ncA");
}

void sub_1003A9B88()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5740, "Vr.max_num_rows_ >= nrA");
}

void sub_1003A9BB0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5741, "Vr.max_num_cols_ >= ncA");
}

void sub_1003A9BD8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5742, "Vi.max_num_rows_ >= nrA");
}

void sub_1003A9C00()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5743, "Vi.max_num_cols_ >= ncA");
}

void sub_1003A9C28()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5744, "Swork.max_num_rows_ >= nrA");
}

void sub_1003A9C50()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5745, "Rwork.max_num_rows_ >= nrA");
}

void sub_1003A9C78()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5834, "info == 0");
}

void sub_1003A9CA0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5728, "nrA == ncA");
}

void sub_1003A9CC8()
{
}

void sub_1003A9CF0()
{
}

void sub_1003A9D18()
{
}

void sub_1003A9D44()
{
}

void sub_1003A9D70()
{
}

double sub_1003A9D9C(uint64_t a1, os_log_s *a2)
{
  double v2 = **(float **)a1;
  double v3 = *(float *)(*(void *)a1 + 4LL);
  double v4 = *(float *)(*(void *)a1 + 8LL);
  int v6 = 134218496;
  double v7 = v2;
  __int16 v8 = 2048;
  double v9 = v3;
  __int16 v10 = 2048;
  double v11 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#spatialGesturesPredictor #probabilities Other = %f, HighConfidenceHandoff = %f, LowConfidenceHandoff = %f",  (uint8_t *)&v6,  0x20u);
  return result;
}

void sub_1003A9E3C(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    double v4 = a1;
  }
  else {
    double v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#spatialGesturesPredictor Predicting intent using %s",  buf,  0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1003A9EAC()
{
}

void sub_1003A9ED4()
{
}

void sub_1003A9EFC()
{
}

void sub_1003A9F24()
{
}

void sub_1003A9F4C()
{
}

void sub_1003A9F74()
{
}

void sub_1003A9F9C()
{
}

void sub_1003A9FC4()
{
}

void sub_1003A9FF0()
{
}

void sub_1003AA018()
{
}

void sub_1003AA044()
{
}

void sub_1003AA070()
{
}

void sub_1003AA098()
{
}

void sub_1003AA0C0()
{
}

void sub_1003AA0E8()
{
}

void sub_1003AA114()
{
}

void sub_1003AA140()
{
}

void sub_1003AA16C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10002101C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#spatialGesturesPredictor Something wrong with filtering, using unfiltered signal",  a1);
}

void sub_1003AA1A0()
{
}

void sub_1003AA1C8()
{
}

void sub_1003AA1F4()
{
}

void sub_1003AA21C(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 0x3FF0000000000000LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#spatialGesturesPredictor Gesture classifier was not configured, returning intent score = %f, no AoA and no Spatial Gestures predictor involved",  (uint8_t *)&v1,  0xCu);
}

void sub_1003AA298()
{
}

void sub_1003AA2C0()
{
}

void sub_1003AA2E8()
{
}

void sub_1003AA314()
{
}

void sub_1003AA340()
{
}

void sub_1003AA36C()
{
}

void sub_1003AA3AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#boundedregiongrange-estimator, Filter is initialized",  v1,  2u);
}

void sub_1003AA3EC(uint64_t a1, uint64_t **a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 - 24);
  uint64_t v4 = **a2;
  uint64_t v5 = a1 - (void)*a2;
  int v6 = 134218496;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v5 / 24;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#boundedregiongrange-estimator, Buffer start and end after pruning: %3.2f - %3.2f s, size: %zu",  (uint8_t *)&v6,  0x20u);
}

void sub_1003AA490(uint64_t a1, os_log_s *a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#sa_algo_batchfilter,Invalid measurement rejected by the batch filter filter, range passed: %f m, range uncertainty passed: %f m",  (uint8_t *)&v4,  0x16u);
}

void *sub_1003AA514(void *result, void *a2)
{
  do
  {
    result[46] = off_1007AED90;
    result[30] = off_1007AED90;
    result[16] = off_1007AED90;
    result[8] = off_1007AED90;
    *double result = off_1007AED90;
    result += 54;
  }

  while (result != a2);
  return result;
}

void sub_1003AA540( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003AA5AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003AA618()
{
}

void sub_1003AA644( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013A18( (void *)&_mh_execute_header,  a2,  a3,  "#bias-est, Errored when loading range bias estimator data transformer model, error = %@",  a5,  a6,  a7,  a8,  2u);
  sub_10000668C();
}

void sub_1003AA6A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003AA70C()
{
}

void sub_1003AA738()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#bias-est, inputFeatures to consume input features is nil, returning nil",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003AA764()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#bias-est, Error in creating estimator input, returning nil",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003AA790()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#bias-est, inputFeatures to preprocessing are nil, returning nil",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003AA7BC()
{
}

void sub_1003AA7E8()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#bias-est, Model errored when applying NN standardization on input data, returning nil",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003AA814()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#bias-est, input features to prediction are nil, returning nil",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003AA840(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#bias-est, totalProbability = %f",  (uint8_t *)&v2,  0xCu);
  sub_10000668C();
}

void sub_1003AA8B4()
{
  sub_10000AFA4( (void *)&_mh_execute_header,  v0,  v1,  "#bias-est, Model errored when predicting, returning nil",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003AA8E0()
{
}

void sub_1003AA90C(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#bias-est, Bundle path '%s' does not exist.",  buf,  0xCu);
}

void sub_1003AA950(_BYTE *a1, _BYTE *a2)
{
}

void sub_1003AA97C(_BYTE *a1, _BYTE *a2)
{
}

void sub_1003AA9A8(_BYTE *a1, _BYTE *a2)
{
}

void sub_1003AA9D4()
{
}

void sub_1003AAA00()
{
}

void sub_1003AAA2C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013A18( (void *)&_mh_execute_header,  a2,  a3,  "#bias-est, unable to create biasEstimatorInputMLArray, error = %@",  a5,  a6,  a7,  a8,  2u);
  sub_10000668C();
}

void sub_1003AAA90()
{
}

void sub_1003AAABC()
{
}

void sub_1003AAAE8()
{
}

void sub_1003AAB14()
{
}

void sub_1003AAB40()
{
}

void sub_1003AAB6C()
{
}

void sub_1003AAB88()
{
}

void sub_1003AABA4()
{
}

void sub_1003AABD0()
{
}

void sub_1003AABFC()
{
}

void sub_1003AAC28(void *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = a1[15];
  uint64_t v4 = a1[16];
  uint64_t v5 = a1[17];
  uint64_t v6 = a1[18];
  int v7 = 134218752;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  __int16 v11 = 2048;
  uint64_t v12 = v5;
  __int16 v13 = 2048;
  uint64_t v14 = v6;
  sub_100301708( (void *)&_mh_execute_header,  a2,  a3,  "#sa_algo_particlefilter,ingesting current finder deltav IO data: quatw: %f, quatx: %f, quaty: %f, quatz: %f",  (uint8_t *)&v7);
}

void sub_1003AACB8(os_log_t log, double a2, double a3)
{
  int v3 = 134218496;
  uint64_t v4 = 0x3FB999999999999ALL;
  __int16 v5 = 2048;
  double v6 = a2;
  __int16 v7 = 2048;
  double v8 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#sa_algo_particlefilter,ingesting finder kinematic data: deltaT: %f, delta Vx: %f, delta Vz: %f",  (uint8_t *)&v3,  0x20u);
}

void sub_1003AAD50(uint64_t a1, os_log_s *a2, double a3, double a4, double a5, double a6, double a7)
{
  v8.n128_f64[0] = sub_1003016D8(a1, __stack_chk_guard, a7);
  sub_1003016A8(v8);
  sub_100301708( (void *)&_mh_execute_header,  a2,  v9,  "#sa_algo_particlefilter,particle filter current pose, source: deltav , quatw: %f, quatx: %f, quaty: %f, quatz: %f",  v10);
  sub_100147814();
}

void sub_1003AADC0(uint64_t a1, _BYTE *a2)
{
  if (!*a2) {
    sub_100006080();
  }
}

void sub_1003AAE08(uint64_t a1, os_log_s *a2, double a3, double a4, double a5, double a6, double a7)
{
  v8.n128_f64[0] = sub_1003016D8(a1, __stack_chk_guard, a7);
  sub_1003016A8(v8);
  sub_100301708( (void *)&_mh_execute_header,  a2,  v9,  "#sa_algo_particlefilter,particle filter current pose, source: pose , quatw: %f, quatx: %f, quaty: %f, quatz: %f",  v10);
  sub_100147814();
}

void sub_1003AAE78()
{
}

void sub_1003AAEA4()
{
}

void sub_1003AAED0(os_log_t log, _BYTE *a2, double a3)
{
  int v4 = 134217984;
  double v5 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#sa_algo_particlefilter,ingesting measurement: %f m",  (uint8_t *)&v4,  0xCu);
  if (!*a2) {
    __assert_rtn("ingestMeasurement", "ParticleFilter.cpp", 907, "_currentPose.has_value()");
  }
}

void sub_1003AAF84()
{
}

void sub_1003AAFAC()
{
}

void sub_1003AAFDC()
{
}

void sub_1003AB008()
{
}

void sub_1003AB034()
{
}

void sub_1003AB05C()
{
}

void sub_1003AB084()
{
}

void sub_1003AB0B0()
{
}

void sub_1003AB0D8()
{
}

void sub_1003AB100()
{
}

void sub_1003AB128()
{
}

void sub_1003AB150(int a1, char *a2)
{
}

void sub_1003AB174()
{
  __assert_rtn( "_measurementUpdate",  "NRBYEstimator.cpp",  573,  "remoteTxAntMask == kAnt1Mask || remoteTxAntMask == kAnt2Mask");
}

void sub_1003AB19C()
{
}

void sub_1003AB1C8()
{
}

void sub_1003AB1F0()
{
}

void sub_1003AB218()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 711, "data_ != __null");
}

void sub_1003AB240()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 712, "idx >= 0");
}

void sub_1003AB268()
{
}

void sub_1003AB290()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3641, "&(B) != &(C)");
}

void sub_1003AB2B8()
{
}

void sub_1003AB2E4()
{
}

void sub_1003AB310()
{
}

void sub_1003AB33C()
{
}

void sub_1003AB368()
{
}

void sub_1003AB394()
{
}

void sub_1003AB3C0()
{
}

void sub_1003AB3EC()
{
}

void sub_1003AB418()
{
}

void sub_1003AB444()
{
}

void sub_1003AB470()
{
}

void sub_1003AB49C()
{
}

void sub_1003AB4C8()
{
}

void sub_1003AB4F4()
{
}

void sub_1003AB520()
{
}

void sub_1003AB54C()
{
}

void sub_1003AB578()
{
}

void sub_1003AB5A4( os_log_s *a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*a2) {
    sub_100006080();
  }
  sub_10030BBDC();
}

void sub_1003AB62C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "#findalgs-peoplefinder,Unhandled value for _lastSignalEnvironment,%d",  (uint8_t *)v2,  8u);
  sub_100003DB4();
}

void sub_1003AB69C(char a1, os_log_s *a2)
{
  uint64_t v2 = "Self";
  if ((a1 & 1) != 0) {
    uint64_t v2 = "Peer";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "#findalgs-peoplefinder,Conversion of %s location time to mach continuous time failed",  (uint8_t *)&v3,  0xCu);
  sub_10000668C();
}

void sub_1003AB724()
{
}

void sub_1003AB750()
{
}

void sub_1003AB77C()
{
}

void sub_1003AB7A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003AB810(unsigned __int8 *a1, os_log_s *a2, uint64_t a3)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = 1;
  __int16 v5 = 1024;
  int v6 = v3;
  sub_10030BBD0( (void *)&_mh_execute_header,  a2,  a3,  "#findalgs-peoplefinder,#clcc,unable to perform arrow range cross check,not failing,_isLastSolFromCL,%d,DO_NOT_FAIL_C ROSS_CHECK_IF_UNAVAILABLE,%d",  (uint8_t *)v4);
  sub_10000668C();
}

void sub_1003AB88C(unsigned __int8 *a1, os_log_s *a2, uint64_t a3)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = 0;
  __int16 v5 = 1024;
  int v6 = v3;
  sub_10030BBD0( (void *)&_mh_execute_header,  a2,  a3,  "#findalgs-peoplefinder,#clcc,Failed arrow range cross check,_isLastSolFromCL,%d,DO_NOT_FAIL_CROSS_CHECK_IF_UNAVAILABLE,%d",  (uint8_t *)v4);
  sub_10000668C();
}

void sub_1003AB904()
{
}

void sub_1003AB930()
{
}

void sub_1003AB95C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003AB9C4()
{
}

void sub_1003AB9F0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003ABA68()
{
}

void sub_1003ABACC()
{
}

void sub_1003ABAF8(uint64_t a1, os_log_s *a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  int v5 = 134218496;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  double v10 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#findalgs-peoplefinder,integrated H1: %f, integrated H2: %f, deltaT: %f",  (uint8_t *)&v5,  0x20u);
  sub_10030BBDC();
}

void sub_1003ABB80()
{
}

void sub_1003ABBE4()
{
}

void sub_1003ABC10( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003ABC78( uint64_t a1, os_log_s *a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*a3) {
    sub_100006080();
  }
  sub_10030BBDC();
}

void sub_1003ABD00()
{
}

void sub_1003ABD2C()
{
}

void sub_1003ABD58()
{
}

void sub_1003ABD84(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = *(unsigned __int8 *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a2 + 8208);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  sub_10030BBD0( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#findalgs-peoplefinder,processPeerLocation,peerLoc.has_value(),%d,_lastSelfLocation.has_value(),%d",  (uint8_t *)v5);
  sub_10000668C();
}

void sub_1003ABE08()
{
  __assert_rtn("getAverage", "NRBYUserIntentPredictor.cpp", 48, "_buffer.size() <= _maxBufLength");
}

void sub_1003ABE30(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#handoffPredictor delta time between range results is non positive",  v1,  2u);
}

void sub_1003ABE70()
{
}

void sub_1003ABE9C()
{
}

void sub_1003ABEC8()
{
}

void sub_1003ABEF4()
{
}

void sub_1003ABF20()
{
}

void sub_1003ABF4C()
{
}

void sub_1003ABF78()
{
}

void sub_1003ABFA4()
{
}

void sub_1003ABFD0()
{
}

void sub_1003ABFFC()
{
}

void sub_1003AC028()
{
}

void sub_1003AC054()
{
}

void sub_1003AC080()
{
}

void sub_1003AC0AC()
{
}

void sub_1003AC0D8()
{
}

void sub_1003AC104()
{
}

void sub_1003AC130()
{
}

void sub_1003AC158()
{
}

void sub_1003AC180(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#regionmon technology mapping not found for ranging technology",  v1,  2u);
}

void sub_1003AC1C0()
{
}

void sub_1003AC1E8()
{
}

void sub_1003AC248()
{
}

void sub_1003AC270(uint8_t *buf, uint64_t a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#regionmon Error unexpected BT threshold detector early return with out of bubble estimate, RSSI: %f, numSamples: %d",  buf,  0x12u);
}

void sub_1003AC2C4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  double v3 = *(float *)(a1 + 24);
  int v4 = 134217984;
  double v5 = v3;
  sub_1003173CC( (void *)&_mh_execute_header,  a2,  a3,  "#regionmon more than one region with radius: %f\n",  (uint8_t *)&v4);
  sub_10000668C();
}

void sub_1003AC334(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  int v4 = a2;
  sub_1003173CC( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "#regionmon more than one region with name: %s\n",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003AC3AC()
{
}

void sub_1003AC3D4(os_log_t log, float a2)
{
  int v2 = 134218240;
  uint64_t v3 = 0x3FB99999A0000000LL;
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "#regionmon Region spaced by less than %fm (%fm)\n",  (uint8_t *)&v2,  0x16u);
  sub_10000668C();
}

void sub_1003AC464()
{
}

void sub_1003AC49C()
{
}

void sub_1003AC514()
{
}

void sub_1003AC58C()
{
}

void sub_1003AC5B8()
{
}

void sub_1003AC5E4()
{
}

void sub_1003AC610(_BYTE *a1, uint64_t a2)
{
  if (*a1)
  {
  }

void sub_1003AC638()
{
}

void sub_1003AC664()
{
}

void sub_1003AC690(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "#findalgs-devicefinder,Unknown motion state: %d",  buf,  8u);
}

void sub_1003AC6D4()
{
}

void sub_1003AC70C()
{
}

void sub_1003AC744()
{
}

void sub_1003AC7A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003AC7D8()
{
}

void sub_1003AC83C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003AC86C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003AC89C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003AC920()
{
}

double sub_1003AC988(uint64_t a1, float *a2, uint64_t a3, os_log_s *a4)
{
  uint64_t v4 = *(void *)(a1 + 16);
  double v5 = *a2;
  *(_DWORD *)a3 = 134218240;
  *(double *)(a3 + 4) = v5;
  *(_WORD *)(a3 + 12) = 2048;
  *(void *)(a3 + 14) = v4;
  sub_1002B08B0( (void *)&_mh_execute_header,  a4,  a3,  "#sa_algo_moving_findee,Populating range output with SA, range: %0.2f m, timestamp: %f s",  (uint8_t *)a3);
  return result;
}

void sub_1003AC9E0()
{
}

void sub_1003ACA48()
{
  __int16 v3 = v0;
  uint64_t v4 = 0x4036800000000000LL;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "#sa_algo_moving_findee,#stalePeerVIO Peer VIO is too stale %f compared to threshold %f s AND arrow uncertainty is %4 .1f deg is larger than threshold %4.1f deg - not yielding the solution",  v2,  0x2Au);
}

void sub_1003ACACC()
{
}

void sub_1003ACB38()
{
}

void sub_1003ACB9C()
{
}

void sub_1003ACC00()
{
}

void sub_1003ACC64()
{
}

void sub_1003ACCC8()
{
}

void sub_1003ACD2C()
{
}

void sub_1003ACD64(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "[RoseSupervisorInterface] IOServiceOpen failed. Error: %s",  buf,  0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1003ACDD4()
{
}

void sub_1003ACE00()
{
}

void sub_1003ACE28()
{
}

void sub_1003ACE54()
{
  __assert_rtn("sendCommandToRose", "RoseSupervisorInterface.mm", 103, "buffLen <= kRoseSupervisorOutPayloadLengthMax");
}

void sub_1003ACE7C()
{
}

void sub_1003ACEA8()
{
}

void sub_1003ACED4()
{
  __assert_rtn( "getRoseProperty",  "RoseSupervisorInterface.mm",  161,  "outPayloadLength <= kRoseSupervisorOutPayloadLengthMax");
}

void sub_1003ACEFC()
{
}

void sub_1003ACF28()
{
}

void sub_1003ACF54()
{
  __assert_rtn("decodeCoexCriticalEvent", "roseEventHandler.cpp", 1025, "packet.size() == EXPECTED_PACKET_SIZE");
}

void sub_1003ACF7C()
{
}

void sub_1003ACFA4()
{
  __assert_rtn("decodeCIRSampleSet", "roseCIRDataDecoderV2.cpp", 422, "len == numCIRs * cirSizeBytes");
}

void sub_1003ACFCC()
{
  __assert_rtn("getNBMaskOOB", "roseSharedTypes.cpp", 1012, "unii5_subbands == 0 || unii5_subbands == 4");
}

void sub_1003ACFF4()
{
  __assert_rtn("nbMaskAllowsUNII3", "roseSharedTypes.cpp", 1019, "nb_mask <= 3");
}

void sub_1003AD01C()
{
  __assert_rtn("nbMaskAllowsUNII5", "roseSharedTypes.cpp", 1025, "nb_mask <= 3");
}

void sub_1003AD044()
{
}

uint64_t sub_1003AD06C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = sub_10032E670();
  return sub_1003AD088(v8);
}

uint64_t sub_1003AD088( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = sub_10032E670();
  return sub_1003AD0A4(v8);
}

uint64_t sub_1003AD0A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = sub_10032E670();
  return sub_1003AD0C0(v8);
}

uint64_t sub_1003AD0C0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = sub_10032E670();
  return sub_1003AD0EC(v8);
}

uint64_t sub_1003AD0EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = sub_10032E670();
  return sub_1003AD108(v8);
}

uint64_t sub_1003AD108( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = sub_10032E670();
  return sub_1003AD134(v8);
}

uint64_t sub_1003AD134( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = sub_10032E670();
  return sub_1003AD150(v8);
}

void sub_1003AD150()
{
}

void sub_1003AD1BC()
{
}

void sub_1003AD22C()
{
}

void sub_1003AD29C()
{
}

void sub_1003AD2C8()
{
}

void sub_1003AD328()
{
}

void sub_1003AD388()
{
}

void sub_1003AD3E8()
{
}

void sub_1003AD454()
{
  sub_1001322C4( (void *)&_mh_execute_header,  v0,  v1,  "regulatory,persistent,getRegulatoryArea,noCache,locked,returnNothing",  v2,  v3,  v4,  v5,  v6);
  sub_100003DB4();
}

void sub_1003AD480()
{
}

void sub_1003AD4E0()
{
}

void sub_1003AD540()
{
}

void sub_1003AD56C()
{
}

void sub_1003AD5DC()
{
}

void sub_1003AD608()
{
}

void sub_1003AD674()
{
}

void sub_1003AD6D4()
{
}

void sub_1003AD734()
{
}

void sub_1003AD798( char a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a1 & 1) != 0) {
    sub_1003535E8( (void *)&_mh_execute_header,  a2,  a3,  "regulatory,comp,getRegulatoryCountryParams,cantFind,kUnknownCountry",  a5,  a6,  a7,  a8,  0);
  }
  __assert_rtn("getRegulatoryCountryParams", "roseRegulatoryCompliance.mm", 559, "false");
}

void sub_1003AD7E0()
{
}

void sub_1003AD80C(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  sub_100156C30( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "regulatory,comp,getRegulatoryCountryParams,found,country,%s",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003AD884( char a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a1 & 1) != 0) {
    sub_1003535E8( (void *)&_mh_execute_header,  a2,  a3,  "regulatory,comp,getRegulatoryNBCountryParams,cantFind,kUnknownCountry",  a5,  a6,  a7,  a8,  0);
  }
  __assert_rtn("getRegulatoryNBCountryParams", "roseRegulatoryCompliance.mm", 613, "false");
}

void sub_1003AD8CC(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  sub_100156C30( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "regulatory,comp,getRegulatoryNBCountryParams,found,country,%s",  (uint8_t *)&v3);
  sub_10000668C();
}

void sub_1003AD944(char *a1, void *a2, os_log_t log)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315906;
  uint64_t v4 = a2;
  __int16 v5 = 1024;
  int v6 = 0;
  __int16 v7 = 1024;
  int v8 = 0;
  __int16 v9 = 2080;
  uint64_t v10 = "unknownCountry for UWB query";
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "regulatory,comp,getDesignatedRfChannels,country,%s,ch5,%d,ch9,%d,note,%s",  (uint8_t *)&v3,  0x22u);
}

void sub_1003AD9F0()
{
}

void sub_1003ADA1C()
{
}

void sub_1003ADA84(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "regulatory,defaults,backoffDuration,%d",  (uint8_t *)v3,  8u);
  sub_100003DB4();
}

void sub_1003ADAF8()
{
  WORD2(sub_1001DFFC8((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3, v4) = 2080;
  HIWORD(sub_1001DFFC8((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3, v4) = v0;
  sub_100156C3C((void *)&_mh_execute_header, v1, v2, "regulatory,defaults,%s,%s", v3, v4);
  sub_10000668C();
}

void sub_1003ADB74( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003ADBB0()
{
  __assert_rtn("x_write", "json.hpp", 8295, "x == 0");
}

void sub_1003ADBD8()
{
}

void sub_1003ADC00()
{
}

void sub_1003ADC28()
{
  __assert_rtn("x_write", "json.hpp", 8337, "loc != nullptr");
}

void sub_1003ADC50()
{
  __assert_rtn("x_write", "json.hpp", 8386, "m_buf[i - 1] != '\\0'");
}

void sub_1003ADC78()
{
  __assert_rtn("x_write", "json.hpp", 8393, "m_buf[i + 2] == '\\0'");
}

void sub_1003ADCA0()
{
}

void sub_1003ADCC8()
{
}

void sub_1003ADCF0()
{
  __assert_rtn("assert_invariant", "json.hpp", 1787, "m_type != value_t::object or m_value.object != nullptr");
}

void sub_1003ADD18()
{
  __assert_rtn("assert_invariant", "json.hpp", 1788, "m_type != value_t::array or m_value.array != nullptr");
}

void sub_1003ADD40()
{
  __assert_rtn("assert_invariant", "json.hpp", 1789, "m_type != value_t::string or m_value.string != nullptr");
}

void sub_1003ADD68()
{
}

void sub_1003ADD94(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4 = a1[10];
  uint64_t v5 = *(void *)(*(void *)(v4 + ((a1[13] >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (a1[13] & 0x1FFLL));
  *(_DWORD *)buf = 134218496;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v5;
  *((_WORD *)buf + 11) = 2048;
  *((void *)buf + 3) = v6;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#sf,RoseSensorFusionManager::addIMUdata: IMU buffer size is %lu, time stamps from %f to %f",  buf,  0x20u);
}

void sub_1003ADE28()
{
}

void sub_1003ADE54()
{
}

void sub_1003ADE80()
{
}

void sub_1003ADEAC()
{
}

void sub_1003ADED8(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = sub_10038799C(a1);
  uint64_t v6 = a2[10];
  uint64_t v7 = *(void *)(*(void *)(v6 + ((a2[13] >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (a2[13] & 0x1FFLL));
  int v9 = 134218496;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "#sf,RoseSensorFusionManager::addRoseMeasurementsToTrackingTargetSet failed: IMU buffer size is %lu, time stamps from %f to %f",  (uint8_t *)&v9,  0x20u);
}

void sub_1003ADFB0()
{
}

void sub_1003ADFDC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1003AE010()
{
}

void sub_1003AE038()
{
}

void sub_1003AE060()
{
}

void sub_1003AE088()
{
}

void sub_1003AE0B0()
{
}

void sub_1003AE0D8()
{
}

void sub_1003AE100()
{
}

void sub_1003AE128()
{
}

void sub_1003AE150()
{
}

void sub_1003AE178()
{
  __assert_rtn("operator double", "cnmatrixbase.h", 979, "num_elements_ == 1");
}

void sub_1003AE1A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000AFA4( (void *)&_mh_execute_header,  a1,  a3,  "#sf,RoseSensorFusionTrackingTargetSet::findOptimalAssociation: assignment matrix is empty, return now",  a5,  a6,  a7,  a8,  0);
}

void sub_1003AE1D4()
{
}

void sub_1003AE1FC()
{
  __assert_rtn( "getAoaScaleFactor",  "RoseSensorFusionTrackingTargetSet.cpp",  717,  "probability_vector.size() == fNNClassifierPtr->getOutputSize()");
}

void sub_1003AE224()
{
  __assert_rtn( "getAoaScaleFactor",  "RoseSensorFusionTrackingTargetSet.cpp",  714,  "azimuth_rose_deg >=0 && azimuth_rose_deg <= 180 && elevation_rose_deg >= 0 && elevation_rose_deg <= 180");
}

void sub_1003AE24C()
{
}

void sub_1003AE274()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5349, "Ipiv.max_num_rows_ >= A.num_rows_");
}

void sub_1003AE29C()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5351, "Work.max_num_rows_ >= A.num_rows_");
}

void sub_1003AE2C4()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5352, "Work.max_num_cols_ >= A.num_cols_");
}

void sub_1003AE2EC()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5381, "info >= 0");
}

void sub_1003AE33C()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5347, "A.num_rows_ == A.num_cols_");
}

void sub_1003AE364()
{
  __assert_rtn("Dot", "cnmatrixbase.h", 4076, "a.num_rows_ == 1 || a.num_cols_ == 1");
}

void sub_1003AE38C()
{
  __assert_rtn("Dot", "cnmatrixbase.h", 4077, "b.num_rows_ == 1 || b.num_cols_ == 1");
}

void sub_1003AE3B4()
{
  __assert_rtn("Dot", "cnmatrixbase.h", 4079, "a.num_elements_ == b.num_elements_");
}

void sub_1003AE3DC()
{
}

void sub_1003AE408()
{
}

void sub_1003AE434()
{
}

void sub_1003AE460()
{
}

void sub_1003AE48C()
{
}

void sub_1003AE4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100385D1C("operator=", "cnsubmatrix.h", a3, "this->num_cols_ == A.num_cols_");
}

void sub_1003AE4DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100385D14("operator=", "cnsubmatrix.h", a3, "this->num_rows_ == A.num_rows_");
}

void sub_1003AE500(os_log_s *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  int v5 = 134218240;
  double v6 = a2;
  __int16 v7 = 2048;
  double v8 = a3;
  sub_10000AFC4( (void *)&_mh_execute_header,  a1,  a5,  "#sf,RoseEKF error: Trying to propagate state backward from time %f to time %f",  (uint8_t *)&v5);
  sub_10000668C();
}

void sub_1003AE578()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100021038((void *)&_mh_execute_header, v3, (uint64_t)v3, "#sf,%s", v4);
}

void sub_1003AE5D0()
{
  __assert_rtn("operator=", "cnsubvector.h", 347, "this->num_elements_ == A.num_elements_");
}

void sub_1003AE5F8()
{
}

void sub_1003AE624(const char *a1, const char *a2, int a3, const char *a4)
{
}

void sub_1003AE630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100385D24("operator()", "cnmatrix.h", a3, "strcmp(c, :) == 0");
}

void sub_1003AE654(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1003AE678( std::string *a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v15 = 136315138;
  uint64_t v16 = v9;
  sub_100156C30((void *)&_mh_execute_header, a2, v10, "#sf,RoseEKF measUpdateAlt R: %s", (uint8_t *)&v15);
  if (v14 < 0) {
    operator delete(__pa);
  }
  sub_100147814();
}

void sub_1003AE708(uint64_t a1, os_log_s *a2)
{
  int v4 = 134217984;
  double v5 = sub_100385D34(a1, 0);
  sub_100156C30((void *)&_mh_execute_header, a2, v3, "#sf,RoseEKF: measUpdateRange R: %f", (uint8_t *)&v4);
}

void sub_1003AE78C()
{
  __assert_rtn("SetMatrixSize", "cnmatrixbase.h", 422, "this->max_num_rows_ >= num_rows");
}

void sub_1003AE7B4()
{
  __assert_rtn("operator()", "cnmatrix.h", 992, "strcmp(c, :) == 0");
}

void sub_1003AE7DC(uint64_t a1, os_log_s *a2)
{
  int v4 = 134218752;
  double v5 = sub_100385D34(a1, 0);
  __int16 v6 = 2048;
  double v7 = sub_10024061C(a1, 0, 1);
  __int16 v8 = 2048;
  double v9 = sub_100385D34(a1, 1);
  __int16 v10 = 2048;
  double v11 = sub_10024061C(a1, 1, 1);
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#sf,RoseEKF: measUpdateAoA R: %f, %f; %f, %f",
    (uint8_t *)&v4,
    0x2Au);
}

void sub_1003AE8D0()
{
}

void sub_1003AE8FC()
{
}

void sub_1003AE928()
{
}

void sub_1003AE954()
{
}

void sub_1003AE980()
{
}

void sub_1003AE9AC()
{
}

void sub_1003AE9D8()
{
}

void sub_1003AEA04()
{
}

void sub_1003AEA30()
{
}

void sub_1003AEA5C()
{
}

void sub_1003AEA88()
{
}

void sub_1003AEB0C()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100156C30((void *)&_mh_execute_header, v3, (uint64_t)v3, "#sf,RoseEKF: initial P matrix %s", v4);
}

void sub_1003AEB64()
{
}

void sub_1003AEB90()
{
  sub_100021038( (void *)&_mh_execute_header,  v0,  v1,  "#sf,RoseEKF error: Aborting measurement update with a delayed measurement at t = %f s",  v2);
  sub_10000668C();
}

void sub_1003AEBF4()
{
}

void sub_1003AEC1C()
{
  sub_100021038( (void *)&_mh_execute_header,  v0,  v1,  "#sf,RoseEKF error: Delayed Rose range measurement with negative range rejected at t = %f s",  v2);
  sub_10000668C();
}

void sub_1003AEC80()
{
  sub_100156C30( (void *)&_mh_execute_header,  v0,  v1,  "#sf,RoseEKF: range measurement update done in the delayed measurement at t = %f s",  v2);
  sub_10000668C();
}

void sub_1003AECE4()
{
}

void sub_1003AED10()
{
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "#sf,RoseEKF: Rewinding back to the last measurement at t = %f s from t = %f s",  v1,  0x16u);
  sub_10000668C();
}

void sub_1003AED84()
{
  sub_100021038( (void *)&_mh_execute_header,  v0,  v1,  "#sf,RoseEKF error: Rose range measurement with negative range rejected at t = %f s",  v2);
  sub_10000668C();
}

void sub_1003AEDE8()
{
  sub_100156C30( (void *)&_mh_execute_header,  v0,  v1,  "#sf,RoseEKF: range measurement update done in the non-delayed measurement at t = %f s",  v2);
  sub_10000668C();
}

void sub_1003AEE4C()
{
  sub_100156C30( (void *)&_mh_execute_header,  v0,  v1,  "#sf,RoseEKF: AoA measurement update done in the non-delayed measurement at t = %f s",  v2);
  sub_10000668C();
}

void sub_1003AEEB0()
{
}

void sub_1003AEEDC()
{
}

void sub_1003AEF08()
{
}

void sub_1003AEF34()
{
}

void sub_1003AEF60()
{
}

void sub_1003AEF88()
{
}

void sub_1003AEFB0()
{
  __assert_rtn("Colon", "cnmatrixbase.h", 1788, "static_cast<s32>(idx.MaxNumCols()) >= n");
}

void sub_1003AEFD8()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 848, "data_ != __null");
}

void sub_1003AF000()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 849, "idx >= 0");
}

void sub_1003AF028()
{
}

void sub_1003AF050()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 881, "data_ != __null");
}

void sub_1003AF078()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 882, "idx >= 0");
}

void sub_1003AF0A0()
{
}

void sub_1003AF0C8()
{
}

void sub_1003AF0F0()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6212, "Ipiv.max_num_rows_ * Ipiv.max_num_cols_ >= A.num_rows_");
}

void sub_1003AF118()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6214, "Iwork.max_num_rows_ * Iwork.max_num_cols_ >= A.num_rows_");
}

void sub_1003AF140()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6216, "Work.max_num_rows_ * Work.max_num_cols_ >= 4 * A.num_rows_");
}

void sub_1003AF168()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6218, "B.max_num_rows_ >= A.num_rows_");
}

void sub_1003AF190()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6219, "B.max_num_cols_ >= A.num_cols_");
}

void sub_1003AF1B8()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6258, "info >= 0");
}

void sub_1003AF208()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6311, "info == 0");
}

void sub_1003AF230()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6343, "info >= 0");
}

void sub_1003AF258()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6210, "A.num_rows_ == A.num_cols_");
}

void sub_1003AF280()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3749, "&(A) != &(C)");
}

void sub_1003AF2A8()
{
  __assert_rtn("Negate", "cnmatrixbase.h", 3401, "&A != &B");
}

void sub_1003AF2D0()
{
  __assert_rtn("Negate", "cnmatrixbase.h", 3403, "B.max_num_rows_ >= A.num_rows_");
}

void sub_1003AF2F8()
{
  __assert_rtn("Negate", "cnmatrixbase.h", 3404, "B.max_num_cols_ >= A.num_cols_");
}

void sub_1003AF320()
{
  __assert_rtn("Chol", "cnmatrixbase.h", 5103, "B.max_num_rows_ >= A.num_rows_");
}

void sub_1003AF348()
{
  __assert_rtn("Chol", "cnmatrixbase.h", 5104, "B.max_num_cols_ >= A.num_cols_");
}

void sub_1003AF370()
{
  __assert_rtn("Chol", "cnmatrixbase.h", 5102, "A.num_rows_ == A.num_cols_");
}

void sub_1003AF398()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6541, "&A != &Tau");
}

void sub_1003AF3C0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6542, "&A != &Work");
}

void sub_1003AF3E8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6543, "&A != &R");
}

void sub_1003AF410()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6544, "&Tau != &Work");
}

void sub_1003AF438()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6545, "&Tau != &R");
}

void sub_1003AF460()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6546, "&Work != &R");
}

void sub_1003AF488()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6549, "R.max_num_rows_ >= A.num_rows_");
}

void sub_1003AF4B0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6550, "R.max_num_cols_ >= A.num_cols_");
}

void sub_1003AF4D8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6553, "Tau.max_num_rows_ >= A.num_rows_");
}

void sub_1003AF500()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6559, "Work.max_num_rows_ >= A.num_cols_");
}

void sub_1003AF528()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6560, "Work.max_num_cols_ >= A.num_cols_");
}

void sub_1003AF550()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6599, "info == 0");
}

void sub_1003AF578()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6557, "Tau.max_num_rows_ >= A.num_cols_");
}

void sub_1003AF5A0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6659, "&A != &Tau");
}

void sub_1003AF5C8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6660, "&A != &Work");
}

void sub_1003AF5F0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6661, "&A != &Q");
}

void sub_1003AF618()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6662, "&A != &R");
}

void sub_1003AF640()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6663, "&Tau != &Work");
}

void sub_1003AF668()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6664, "&Tau != &Q");
}

void sub_1003AF690()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6665, "&Tau != &R");
}

void sub_1003AF6B8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6666, "&Work != &Q");
}

void sub_1003AF6E0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6667, "&Work != &R");
}

void sub_1003AF708()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6668, "&Q != &R");
}

void sub_1003AF730()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6671, "Q.max_num_rows_ >= A.num_rows_");
}

void sub_1003AF758()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6672, "Q.max_num_rows_ >= A.num_cols_");
}

void sub_1003AF780()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6673, "Q.max_num_cols_ >= A.num_rows_");
}

void sub_1003AF7A8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6674, "Q.max_num_cols_ >= A.num_cols_");
}

void sub_1003AF7D0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6675, "R.max_num_rows_ >= A.num_rows_");
}

void sub_1003AF7F8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6676, "R.max_num_cols_ >= A.num_cols_");
}

void sub_1003AF820()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6679, "Tau.max_num_rows_ >= A.num_rows_");
}

void sub_1003AF848()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6685, "Work.max_num_rows_ >= A.num_cols_");
}

void sub_1003AF870()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6686, "Work.max_num_cols_ >= A.num_cols_");
}

void sub_1003AF898()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6769, "info == 0");
}

void sub_1003AF8C0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6725, "info == 0");
}

void sub_1003AF8E8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6683, "Tau.max_num_rows_ >= A.num_cols_");
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_AONSENSE_FRAMEWORK_AVAILABLE(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AONSENSE_FRAMEWORK_AVAILABLE");
}

id objc_msgSend_AntennaDiversityOverrideToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AntennaDiversityOverrideToString:");
}

id objc_msgSend_DataCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DataCallback:");
}

id objc_msgSend_ErrorCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ErrorCallback:");
}

id objc_msgSend_NINearbyObjectUpdateRateToShortString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NINearbyObjectUpdateRateToShortString:");
}

id objc_msgSend_NINearbyObjectUpdateRateToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NINearbyObjectUpdateRateToString:");
}

id objc_msgSend_NIRelationshipSpecifierToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NIRelationshipSpecifierToString:");
}

id objc_msgSend_NISessionBackgroundModeToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NISessionBackgroundModeToString:");
}

id objc_msgSend_NISystemPassiveAccessIntentToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NISystemPassiveAccessIntentToString:");
}

id objc_msgSend_NISystemResourceAvailabilityToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NISystemResourceAvailabilityToString:");
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_UUIDWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDWithString:");
}

id objc_msgSend__NIDevicePresenceMonitoringOptionToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_NIDevicePresenceMonitoringOptionToString:");
}

id objc_msgSend__acquireClientAssertionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _acquireClientAssertionIfNecessary];
}

id objc_msgSend__activateAssertionsWhileFindable(void *a1, const char *a2, ...)
{
  return _[a1 _activateAssertionsWhileFindable];
}

id objc_msgSend__activateAssertionsWhileInteracting(void *a1, const char *a2, ...)
{
  return _[a1 _activateAssertionsWhileInteracting];
}

id objc_msgSend__activateBluetoothResource(void *a1, const char *a2, ...)
{
  return _[a1 _activateBluetoothResource];
}

id objc_msgSend__activateProvidersLazy(void *a1, const char *a2, ...)
{
  return _[a1 _activateProvidersLazy];
}

id objc_msgSend__activateSensors(void *a1, const char *a2, ...)
{
  return _[a1 _activateSensors];
}

id objc_msgSend__addAlgorithmOutputFlagsToPeerTrackingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAlgorithmOutputFlagsToPeerTrackingState:");
}

id objc_msgSend__addObject_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addObject:reply:");
}

id objc_msgSend__addPeers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPeers:");
}

id objc_msgSend__adjustDutyCycleForInterfaceDelays_schedulingInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adjustDutyCycleForInterfaceDelays:schedulingInterval:");
}

id objc_msgSend__advertiseAndRangeWithPeer_peerAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_advertiseAndRangeWithPeer:peerAdvertisement:");
}

id objc_msgSend__advertisementCacheEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _advertisementCacheEnabled];
}

id objc_msgSend__algorithmSourceToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_algorithmSourceToString:");
}

id objc_msgSend__aopJobConfigWithTimeouts(void *a1, const char *a2, ...)
{
  return _[a1 _aopJobConfigWithTimeouts];
}

id objc_msgSend__armMutualAuthTimerForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_armMutualAuthTimerForFinder:");
}

id objc_msgSend__assignDebugParametersIfAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assignDebugParametersIfAvailable:");
}

id objc_msgSend__augmentDiscoveryToken_withHomeAnchorVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_augmentDiscoveryToken:withHomeAnchorVariant:");
}

id objc_msgSend__augmentDiscoveryTokenWithDeviceCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_augmentDiscoveryTokenWithDeviceCapabilities:");
}

id objc_msgSend__augmentDiscoveryTokenWithNbUwbAcquisitionChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_augmentDiscoveryTokenWithNbUwbAcquisitionChannel:");
}

id objc_msgSend__biasCorrectionRequirementFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_biasCorrectionRequirementFromDiscoveryToken:");
}

id objc_msgSend__biasCorrectionRequirementFromModelString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_biasCorrectionRequirementFromModelString:");
}

id objc_msgSend__buildAlishaSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildAlishaSession:");
}

id objc_msgSend__buildAndRunRangingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildAndRunRangingSession:");
}

id objc_msgSend__buildNbammsSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildNbammsSession:");
}

id objc_msgSend__buildRoseSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildRoseSession:");
}

id objc_msgSend__buildWifiSession(void *a1, const char *a2, ...)
{
  return _[a1 _buildWifiSession];
}

id objc_msgSend__cachePreloadValue(void *a1, const char *a2, ...)
{
  return _[a1 _cachePreloadValue];
}

id objc_msgSend__calculateAndLogErrorsFromIODeltaP_vioDeltaP_vioPos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateAndLogErrorsFromIODeltaP:vioDeltaP:vioPos:");
}

id objc_msgSend__calculateErrorStatsFromVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateErrorStatsFromVector:");
}

id objc_msgSend__calculateIOMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateIOMetrics:");
}

id objc_msgSend__calculateStraightLineDistance(void *a1, const char *a2, ...)
{
  return _[a1 _calculateStraightLineDistance];
}

id objc_msgSend__cancelScanRateAdjustmentTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelScanRateAdjustmentTimer];
}

id objc_msgSend__cbAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _[a1 _cbAdvertisingAddress];
}

id objc_msgSend__cbAdvertisingAddressChanged(void *a1, const char *a2, ...)
{
  return _[a1 _cbAdvertisingAddressChanged];
}

id objc_msgSend__cbAdvertisingAddressChangedHandler(void *a1, const char *a2, ...)
{
  return _[a1 _cbAdvertisingAddressChangedHandler];
}

id objc_msgSend__cbBluetoothStateChangedHandler(void *a1, const char *a2, ...)
{
  return _[a1 _cbBluetoothStateChangedHandler];
}

id objc_msgSend__cbDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cbDeviceFoundHandler:");
}

id objc_msgSend__cbErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cbErrorHandler:");
}

id objc_msgSend__cbInterruptionHandler(void *a1, const char *a2, ...)
{
  return _[a1 _cbInterruptionHandler];
}

id objc_msgSend__checkAndExerciseAuthorizationForBundleID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndExerciseAuthorizationForBundleID:error:");
}

id objc_msgSend__cleanupExcessiveDetachedPeers(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupExcessiveDetachedPeers];
}

id objc_msgSend__cleanupExcessiveDetachedSessions(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupExcessiveDetachedSessions];
}

id objc_msgSend__cleanupStaleObservers(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupStaleObservers];
}

id objc_msgSend__configureAdvertisementOOBRefreshTimerForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAdvertisementOOBRefreshTimerForToken:");
}

id objc_msgSend__configureAdvertisementTimeout_forToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAdvertisementTimeout:forToken:");
}

id objc_msgSend__configureAdvertiserForType_toPeer_withAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAdvertiserForType:toPeer:withAdvertisement:");
}

id objc_msgSend__configureCBSpatialSession(void *a1, const char *a2, ...)
{
  return _[a1 _configureCBSpatialSession];
}

id objc_msgSend__configureDiscoveryTimeout_forToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureDiscoveryTimeout:forToken:");
}

id objc_msgSend__configureForLabTestModeSession(void *a1, const char *a2, ...)
{
  return _[a1 _configureForLabTestModeSession];
}

id objc_msgSend__configureForOwnerDevice(void *a1, const char *a2, ...)
{
  return _[a1 _configureForOwnerDevice];
}

id objc_msgSend__configureForPassthroughSession(void *a1, const char *a2, ...)
{
  return _[a1 _configureForPassthroughSession];
}

id objc_msgSend__configureForRegionMonitoring_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureForRegionMonitoring:");
}

id objc_msgSend__configureKeepAliveTimeoutForPeer_useCase_isKeepAliveBluetooth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureKeepAliveTimeoutForPeer:useCase:isKeepAliveBluetooth:");
}

id objc_msgSend__configureNearbyActionNoWakeAdvertiserWithPeer_advertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureNearbyActionNoWakeAdvertiserWithPeer:advertisement:");
}

id objc_msgSend__configureNearbyActionNoWakeScannerAndRequestScan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureNearbyActionNoWakeScannerAndRequestScan:");
}

id objc_msgSend__configureRangeBiasEstimator(void *a1, const char *a2, ...)
{
  return _[a1 _configureRangeBiasEstimator];
}

id objc_msgSend__configureSpatialInteractionAdvertiserWithPeer_advertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureSpatialInteractionAdvertiserWithPeer:advertisement:");
}

id objc_msgSend__configureSpatialInteractionScannerAndRequestScan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureSpatialInteractionScannerAndRequestScan:");
}

id objc_msgSend__connectToPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectToPeer:");
}

id objc_msgSend__consolidateInputToMLModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_consolidateInputToMLModel:");
}

id objc_msgSend__convertFromPointingCoordinatesToSpatial_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertFromPointingCoordinatesToSpatial:");
}

id objc_msgSend__createFindeeAlgoContainer(void *a1, const char *a2, ...)
{
  return _[a1 _createFindeeAlgoContainer];
}

id objc_msgSend__createPeerFindingAlgoContainer(void *a1, const char *a2, ...)
{
  return _[a1 _createPeerFindingAlgoContainer];
}

id objc_msgSend__createPeopleFinderAlgoContainer(void *a1, const char *a2, ...)
{
  return _[a1 _createPeopleFinderAlgoContainer];
}

id objc_msgSend__createSyntheticApertureAlgoContainer(void *a1, const char *a2, ...)
{
  return _[a1 _createSyntheticApertureAlgoContainer];
}

id objc_msgSend__deactivateAssertionsWhileFindable(void *a1, const char *a2, ...)
{
  return _[a1 _deactivateAssertionsWhileFindable];
}

id objc_msgSend__deactivateAssertionsWhileInteracting(void *a1, const char *a2, ...)
{
  return _[a1 _deactivateAssertionsWhileInteracting];
}

id objc_msgSend__deactivateSensors(void *a1, const char *a2, ...)
{
  return _[a1 _deactivateSensors];
}

id objc_msgSend__decrypt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_decrypt:");
}

id objc_msgSend__deltaDistanceFromVIOPoses::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deltaDistanceFromVIOPoses::");
}

id objc_msgSend__deriveSessionKeyFromKeyDerivationKey_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deriveSessionKeyFromKeyDerivationKey:sessionIdentifier:");
}

id objc_msgSend__disableAllServicesAndSendHangupSignal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disableAllServicesAndSendHangupSignal:");
}

id objc_msgSend__disableInteractionAndKeepPersistedTokens(void *a1, const char *a2, ...)
{
  return _[a1 _disableInteractionAndKeepPersistedTokens];
}

id objc_msgSend__disableWiFiAndReturnError(void *a1, const char *a2, ...)
{
  return _[a1 _disableWiFiAndReturnError];
}

id objc_msgSend__displayPermissionsPromptIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _displayPermissionsPromptIfNeeded];
}

id objc_msgSend__doesClientWantFinderObserverSession(void *a1, const char *a2, ...)
{
  return _[a1 _doesClientWantFinderObserverSession];
}

id objc_msgSend__doesWantTriggeredDutyCycledAcquisition(void *a1, const char *a2, ...)
{
  return _[a1 _doesWantTriggeredDutyCycledAcquisition];
}

id objc_msgSend__dumpInterruptionsMapWithDebugString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dumpInterruptionsMapWithDebugString:");
}

id objc_msgSend__enableInteractionWithPersistedTokens(void *a1, const char *a2, ...)
{
  return _[a1 _enableInteractionWithPersistedTokens];
}

id objc_msgSend__encodeSignallingDataInMessageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encodeSignallingDataInMessageID:");
}

id objc_msgSend__encrypt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encrypt:");
}

id objc_msgSend__encryptAndUpdateAidingAndSignallingPayload(void *a1, const char *a2, ...)
{
  return _[a1 _encryptAndUpdateAidingAndSignallingPayload];
}

id objc_msgSend__encryptAndUpdateMutualAuthPayload(void *a1, const char *a2, ...)
{
  return _[a1 _encryptAndUpdateMutualAuthPayload];
}

id objc_msgSend__executeActivationPendingOperations(void *a1, const char *a2, ...)
{
  return _[a1 _executeActivationPendingOperations];
}

id objc_msgSend__fatalErrorForUwbServiceState_cause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fatalErrorForUwbServiceState:cause:");
}

id objc_msgSend__fillNearbyObject_fromRegionSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillNearbyObject:fromRegionSizeCategory:");
}

id objc_msgSend__finalizeRunning(void *a1, const char *a2, ...)
{
  return _[a1 _finalizeRunning];
}

id objc_msgSend__finderTimeFromFirstPoseTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finderTimeFromFirstPoseTo:");
}

id objc_msgSend__flagsFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flagsFromDiscoveryToken:");
}

id objc_msgSend__generateUwbSessionIdForNewServiceClientWithProcessName_parsedAccessoryConfigData_debugParameters_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_generateUwbSessionIdForNewServiceClientWithProcessName:parsedAccessoryConfigData:debugParameters:");
}

id objc_msgSend__getAdvertisementFromCBDevice_advertisementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAdvertisementFromCBDevice:advertisementType:");
}

id objc_msgSend__getAuthenticatedFinderFindeeClients(void *a1, const char *a2, ...)
{
  return _[a1 _getAuthenticatedFinderFindeeClients];
}

id objc_msgSend__getCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 _getCapabilities];
}

id objc_msgSend__getCommonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _getCommonConfiguration];
}

id objc_msgSend__getDefaultNbammsRangingConfigParameters(void *a1, const char *a2, ...)
{
  return _[a1 _getDefaultNbammsRangingConfigParameters];
}

id objc_msgSend__getDiscoveryTokenFlags(void *a1, const char *a2, ...)
{
  return _[a1 _getDiscoveryTokenFlags];
}

id objc_msgSend__getDiscoveryTokenFromCBDevice_advertisementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDiscoveryTokenFromCBDevice:advertisementType:");
}

id objc_msgSend__getDitherConst(void *a1, const char *a2, ...)
{
  return _[a1 _getDitherConst];
}

id objc_msgSend__getDutyCycleForTriggeredDutyCycledAcquisition(void *a1, const char *a2, ...)
{
  return _[a1 _getDutyCycleForTriggeredDutyCycledAcquisition];
}

id objc_msgSend__getExpandedCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 _getExpandedCapabilities];
}

id objc_msgSend__getFindeeAlgorithmConfig(void *a1, const char *a2, ...)
{
  return _[a1 _getFindeeAlgorithmConfig];
}

id objc_msgSend__getFindingSecondarySchedulingParameters(void *a1, const char *a2, ...)
{
  return _[a1 _getFindingSecondarySchedulingParameters];
}

id objc_msgSend__getNbUwbAcquisitionBandChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getNbUwbAcquisitionBandChannel:");
}

id objc_msgSend__getPeopleFinderAlgorithmConfig(void *a1, const char *a2, ...)
{
  return _[a1 _getPeopleFinderAlgorithmConfig];
}

id objc_msgSend__getPeopleFinderAlgorithmConfigForPeerSessions(void *a1, const char *a2, ...)
{
  return _[a1 _getPeopleFinderAlgorithmConfigForPeerSessions];
}

id objc_msgSend__getRangeUncertaintyWhenBiasEstimateNotAvailable(void *a1, const char *a2, ...)
{
  return _[a1 _getRangeUncertaintyWhenBiasEstimateNotAvailable];
}

id objc_msgSend__getRangingAcquisitionType(void *a1, const char *a2, ...)
{
  return _[a1 _getRangingAcquisitionType];
}

id objc_msgSend__getRangingTimeoutWithKey_timeoutIfNoOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getRangingTimeoutWithKey:timeoutIfNoOverride:");
}

id objc_msgSend__getRangingTriggerType(void *a1, const char *a2, ...)
{
  return _[a1 _getRangingTriggerType];
}

id objc_msgSend__getRegionSizeCategoriesFromRegions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getRegionSizeCategoriesFromRegions:");
}

id objc_msgSend__getSchedulingIntervalForTriggeredDutyCycledAcquisition(void *a1, const char *a2, ...)
{
  return _[a1 _getSchedulingIntervalForTriggeredDutyCycledAcquisition];
}

id objc_msgSend__getSecondarySchedulingParameters(void *a1, const char *a2, ...)
{
  return _[a1 _getSecondarySchedulingParameters];
}

id objc_msgSend__getSessionFailureError(void *a1, const char *a2, ...)
{
  return _[a1 _getSessionFailureError];
}

id objc_msgSend__getState(void *a1, const char *a2, ...)
{
  return _[a1 _getState];
}

id objc_msgSend__handleActivationError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleActivationError:");
}

id objc_msgSend__handleActivationSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleActivationSuccess:");
}

id objc_msgSend__handleBluetoothBecameAvailable(void *a1, const char *a2, ...)
{
  return _[a1 _handleBluetoothBecameAvailable];
}

id objc_msgSend__handleBluetoothBecameUnavailable(void *a1, const char *a2, ...)
{
  return _[a1 _handleBluetoothBecameUnavailable];
}

id objc_msgSend__handleBoundedRegionRange_forDevice_rangeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBoundedRegionRange:forDevice:rangeResult:");
}

id objc_msgSend__handleCryptoFailure(void *a1, const char *a2, ...)
{
  return _[a1 _handleCryptoFailure];
}

id objc_msgSend__handleDeviceMonitorActivation_forDevice_timestamp_regionSizeCategory_regions_predictorType_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_handleDeviceMonitorActivation:forDevice:timestamp:regionSizeCategory:regions:predictorType:");
}

id objc_msgSend__handleFailedToAddPeer(void *a1, const char *a2, ...)
{
  return _[a1 _handleFailedToAddPeer];
}

id objc_msgSend__handleInitiatorRangingBlockUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleInitiatorRangingBlockUpdate:");
}

id objc_msgSend__handleNonMutualAuthMessage(void *a1, const char *a2, ...)
{
  return _[a1 _handleNonMutualAuthMessage];
}

id objc_msgSend__handleObserverSessionXPCDisconnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleObserverSessionXPCDisconnection:");
}

id objc_msgSend__handlePauseSessionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePauseSessionError:");
}

id objc_msgSend__handlePauseSessionSuccess(void *a1, const char *a2, ...)
{
  return _[a1 _handlePauseSessionSuccess];
}

id objc_msgSend__handleRangeAndAoASolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRangeAndAoASolution:");
}

id objc_msgSend__handleRangeOnlySolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRangeOnlySolution:");
}

id objc_msgSend__handleRangingTerminatedCallbackForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRangingTerminatedCallbackForPeer:");
}

id objc_msgSend__handleRegionChangeForDevice_currentRegion_prevRegion_timestamp_rangeResult_intentPrediction_regionTransitionSuppressed_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_handleRegionChangeForDevice:currentRegion:prevRegion:timestamp:rangeResult:intentPrediction:regionTransitionSuppressed:");
}

id objc_msgSend__handleRunSessionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRunSessionError:");
}

id objc_msgSend__handleRunSessionSuccess(void *a1, const char *a2, ...)
{
  return _[a1 _handleRunSessionSuccess];
}

id objc_msgSend__handleSessionStats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSessionStats:");
}

id objc_msgSend__handleSpecializedSessionBackgroundSupportUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSpecializedSessionBackgroundSupportUpdate:");
}

id objc_msgSend__handleSpecializedSessionInvalidation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSpecializedSessionInvalidation:");
}

id objc_msgSend__handleWifiRangingAvailableUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleWifiRangingAvailableUpdate:");
}

id objc_msgSend__handleXPCDisconnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleXPCDisconnection:");
}

id objc_msgSend__homeAnchorVariantFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeAnchorVariantFromDiscoveryToken:");
}

id objc_msgSend__identifyingSequenceFromBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifyingSequenceFromBytes:");
}

id objc_msgSend__initAndConnectToServerWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initAndConnectToServerWithOptions:");
}

id objc_msgSend__initInternal(void *a1, const char *a2, ...)
{
  return _[a1 _initInternal];
}

id objc_msgSend__initInternalWithConfigType_isFinder_isObserver_specifiedToken_preferredUpdateRate_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:");
}

id objc_msgSend__initLowPowerModeListner(void *a1, const char *a2, ...)
{
  return _[a1 _initLowPowerModeListner];
}

id objc_msgSend__initPrivate(void *a1, const char *a2, ...)
{
  return _[a1 _initPrivate];
}

id objc_msgSend__initializeEncryptionSessionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _initializeEncryptionSessionIfNecessary];
}

id objc_msgSend__intentPredictorConfigFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_intentPredictorConfigFromDiscoveryToken:");
}

id objc_msgSend__intentPredictorConfigFromModelString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_intentPredictorConfigFromModelString:");
}

id objc_msgSend__internalBuildShouldDenyConnection(void *a1, const char *a2, ...)
{
  return _[a1 _internalBuildShouldDenyConnection];
}

id objc_msgSend__internalIsCameraAssistanceEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _internalIsCameraAssistanceEnabled];
}

id objc_msgSend__internalIsCameraAssistanceInClientProcess(void *a1, const char *a2, ...)
{
  return _[a1 _internalIsCameraAssistanceInClientProcess];
}

id objc_msgSend__internalIsExtendedDistanceMeasurementEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _internalIsExtendedDistanceMeasurementEnabled];
}

id objc_msgSend__internalOsTransactionRequired(void *a1, const char *a2, ...)
{
  return _[a1 _internalOsTransactionRequired];
}

id objc_msgSend__internalPrepareTokenCache(void *a1, const char *a2, ...)
{
  return _[a1 _internalPrepareTokenCache];
}

id objc_msgSend__internalPrintableState(void *a1, const char *a2, ...)
{
  return _[a1 _internalPrintableState];
}

id objc_msgSend__internalReadItemWithService_account_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalReadItemWithService:account:synchronizable:systemKeychain:");
}

id objc_msgSend__internalSetFindableDiscoveryTokens_tokenGroup_logInEventBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalSetFindableDiscoveryTokens:tokenGroup:logInEventBuffer:");
}

id objc_msgSend__interruptSessionWithInternalReason_cachedInterruption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interruptSessionWithInternalReason:cachedInterruption:");
}

id objc_msgSend__interruptionsMapAsString(void *a1, const char *a2, ...)
{
  return _[a1 _interruptionsMapAsString];
}

id objc_msgSend__invalidateInternal(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateInternal];
}

id objc_msgSend__invalidateSessionAndNotifyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateSessionAndNotifyError:");
}

id objc_msgSend__isAnyClientRunning(void *a1, const char *a2, ...)
{
  return _[a1 _isAnyClientRunning];
}

id objc_msgSend__isClientInternalTool(void *a1, const char *a2, ...)
{
  return _[a1 _isClientInternalTool];
}

id objc_msgSend__isClientOnGeneralEntitlementAllowlist(void *a1, const char *a2, ...)
{
  return _[a1 _isClientOnGeneralEntitlementAllowlist];
}

id objc_msgSend__isClientOnSystemShutdownAllowlist(void *a1, const char *a2, ...)
{
  return _[a1 _isClientOnSystemShutdownAllowlist];
}

id objc_msgSend__isCryptoDisabled(void *a1, const char *a2, ...)
{
  return _[a1 _isCryptoDisabled];
}

id objc_msgSend__isInternalClient(void *a1, const char *a2, ...)
{
  return _[a1 _isInternalClient];
}

id objc_msgSend__isListener_backgroundAuthorizedForPeer_useCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isListener:backgroundAuthorizedForPeer:useCache:");
}

id objc_msgSend__isPDRAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isPDRAvailable:");
}

id objc_msgSend__isReciprocalFindingPossibleRoleIsFinder_rangingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isReciprocalFindingPossibleRoleIsFinder:rangingSession:");
}

id objc_msgSend__isSemiStaticFromVIO_::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSemiStaticFromVIO:::");
}

id objc_msgSend__isTokenFindable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTokenFindable:");
}

id objc_msgSend__isWifiRangingAllowed(void *a1, const char *a2, ...)
{
  return _[a1 _isWifiRangingAllowed];
}

id objc_msgSend__kickKeepAliveForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_kickKeepAliveForPeer:");
}

id objc_msgSend__localDeviceLogger(void *a1, const char *a2, ...)
{
  return _[a1 _localDeviceLogger];
}

id objc_msgSend__logDurationAndSubmit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logDurationAndSubmit:");
}

id objc_msgSend__logSessionSummary(void *a1, const char *a2, ...)
{
  return _[a1 _logSessionSummary];
}

id objc_msgSend__logStatisticsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _logStatisticsIfNecessary];
}

id objc_msgSend__logSuccessfulRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logSuccessfulRange:");
}

id objc_msgSend__logTime(void *a1, const char *a2, ...)
{
  return _[a1 _logTime];
}

id objc_msgSend__logUnsuccessfulRange(void *a1, const char *a2, ...)
{
  return _[a1 _logUnsuccessfulRange];
}

id objc_msgSend__longRangeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _longRangeEnabled];
}

id objc_msgSend__macAddressForIRK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_macAddressForIRK:");
}

id objc_msgSend__magneticFieldStrengthCheckOptionFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_magneticFieldStrengthCheckOptionFromDiscoveryToken:");
}

id objc_msgSend__magneticFieldStrengthCheckOptionFromModelString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_magneticFieldStrengthCheckOptionFromModelString:");
}

id objc_msgSend__nearbyActionNoWakeDisableScanDupesIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyActionNoWakeDisableScanDupesIfNecessary];
}

id objc_msgSend__nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers];
}

id objc_msgSend__nearbydLogRange_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nearbydLogRange:token:");
}

id objc_msgSend__niFrameworkBundle(void *a1, const char *a2, ...)
{
  return _[a1 _niFrameworkBundle];
}

id objc_msgSend__niLocalizedStringFromFrameworkBundleWithKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_niLocalizedStringFromFrameworkBundleWithKey:");
}

id objc_msgSend__notifyDidInvalidateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyDidInvalidateWithError:");
}

id objc_msgSend__notifyPeerRemoval_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyPeerRemoval:withReason:");
}

id objc_msgSend__onVIOReset(void *a1, const char *a2, ...)
{
  return _[a1 _onVIOReset];
}

id objc_msgSend__osLogNearbyObjectUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_osLogNearbyObjectUpdate:");
}

id objc_msgSend__ownerDeviceServiceRequestDebugParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ownerDeviceServiceRequestDebugParams:");
}

id objc_msgSend__parseUWBData_presenceData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseUWBData:presenceData:");
}

id objc_msgSend__passthroughSessionServiceRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_passthroughSessionServiceRequest:");
}

id objc_msgSend__pauseOwnerSession(void *a1, const char *a2, ...)
{
  return _[a1 _pauseOwnerSession];
}

id objc_msgSend__pausePassthroughOrLabTestModeSession(void *a1, const char *a2, ...)
{
  return _[a1 _pausePassthroughOrLabTestModeSession];
}

id objc_msgSend__pauseServiceDueToClientTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pauseServiceDueToClientTimeout:");
}

id objc_msgSend__pauseWifiRanging(void *a1, const char *a2, ...)
{
  return _[a1 _pauseWifiRanging];
}

id objc_msgSend__peer_didFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peer:didFailWithError:");
}

id objc_msgSend__peerHungUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peerHungUp:");
}

id objc_msgSend__peerIndexReferenceForAdvertisementType_outPeers_outAdvertisements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:");
}

id objc_msgSend__peerSupportsLongRange(void *a1, const char *a2, ...)
{
  return _[a1 _peerSupportsLongRange];
}

id objc_msgSend__performBlockOnDelegateQueue_ifRespondsToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performBlockOnDelegateQueue:ifRespondsToSelector:");
}

id objc_msgSend__populateClientEntitlements(void *a1, const char *a2, ...)
{
  return _[a1 _populateClientEntitlements];
}

id objc_msgSend__prepareNbammsServiceRequestForDiscoveryToken_technology_useCase_nbMask_nbUwbAcquisitionBandChannel_mmsSlotSizeMsec_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:");
}

id objc_msgSend__prepareServiceRequest(void *a1, const char *a2, ...)
{
  return _[a1 _prepareServiceRequest];
}

id objc_msgSend__prepareServiceRequestForDiscoveryToken_nbUwbAcquisitionBandChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:");
}

id objc_msgSend__prepareServiceRequestForDiscoveryToken_technology_useCase_nbMask_nbUwbAcquisitionBandChannel_mmsSlotSizeMsec_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_prepareServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:");
}

id objc_msgSend__prepareServiceRequestWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareServiceRequestWithConfig:");
}

id objc_msgSend__prepareUwbSessionTrackingObjectsForClientTracking_outServiceRequest_outStartOptions_outShareableConfigData_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_prepareUwbSessionTrackingObjectsForClientTracking:outServiceRequest:outStartOptions:outShareableConfigData:");
}

id objc_msgSend__prepareUwbSessionTrackingObjectsFromDebugParameters_outServiceRequest_outStartOptions_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareUwbSessionTrackingObjectsFromDebugParameters:outServiceRequest:outStartOptions:");
}

id objc_msgSend__printStats(void *a1, const char *a2, ...)
{
  return _[a1 _printStats];
}

id objc_msgSend__process_didTerminate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_process:didTerminate:");
}

id objc_msgSend__process_didUpdateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_process:didUpdateState:");
}

id objc_msgSend__processBluetoothSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processBluetoothSample:");
}

id objc_msgSend__processCarKeyEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processCarKeyEvent:");
}

id objc_msgSend__processCarKeyEvent_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processCarKeyEvent:reply:");
}

id objc_msgSend__processCommonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _processCommonConfiguration];
}

id objc_msgSend__processFindingEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processFindingEvent:");
}

id objc_msgSend__processFindingEvent_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processFindingEvent:reply:");
}

id objc_msgSend__processNonMutualAuthMessageForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processNonMutualAuthMessageForFinder:");
}

id objc_msgSend__processPeerMessage_machAbsTimestamp_wasEncrypted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processPeerMessage:machAbsTimestamp:wasEncrypted:");
}

id objc_msgSend__processPeerMutualAuthState_peerIsFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processPeerMutualAuthState:peerIsFinder:");
}

id objc_msgSend__processReceivedAdvertisement_fromPeer_overBluetooth_cbDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:");
}

id objc_msgSend__processSystemEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processSystemEvent:");
}

id objc_msgSend__processSystemEvent_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processSystemEvent:reply:");
}

id objc_msgSend__processUpdatedCommonConfigurationIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _processUpdatedCommonConfigurationIfNecessary];
}

id objc_msgSend__processUpdatedLockState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processUpdatedLockState:");
}

id objc_msgSend__provideTruthTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_provideTruthTag:");
}

id objc_msgSend__queryAndCacheCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 _queryAndCacheCapabilities];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return _[a1 _queue];
}

id objc_msgSend__radiusFromDevicePresencePreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_radiusFromDevicePresencePreset:");
}

id objc_msgSend__receivedAidingAndSignallingMessage_machAbsTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedAidingAndSignallingMessage:machAbsTimestamp:");
}

id objc_msgSend__receivedCryptoSessionConfigMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedCryptoSessionConfigMessage:");
}

id objc_msgSend__receivedMutualAuthMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedMutualAuthMessage:");
}

id objc_msgSend__regionCategoryFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_regionCategoryFromDiscoveryToken:");
}

id objc_msgSend__regionCategoryFromModelString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_regionCategoryFromModelString:");
}

id objc_msgSend__registerObserverSessionWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerObserverSessionWithConnection:");
}

id objc_msgSend__registerSessionWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerSessionWithConnection:");
}

id objc_msgSend__reinterruptSessionWithCachedInterruption(void *a1, const char *a2, ...)
{
  return _[a1 _reinterruptSessionWithCachedInterruption];
}

id objc_msgSend__relayBlockToClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayBlockToClients:");
}

id objc_msgSend__relayDCKMessageInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayDCKMessageInternal:");
}

id objc_msgSend__relayToClientsOfUWBSessionId_blockToRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayToClientsOfUWBSessionId:blockToRelay:");
}

id objc_msgSend__remoteObject(void *a1, const char *a2, ...)
{
  return _[a1 _remoteObject];
}

id objc_msgSend__removeAlgorithmOutputFlagsFromPeerTrackingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAlgorithmOutputFlagsFromPeerTrackingState:");
}

id objc_msgSend__removeAllPeers(void *a1, const char *a2, ...)
{
  return _[a1 _removeAllPeers];
}

id objc_msgSend__removeObject_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeObject:reply:");
}

id objc_msgSend__removePeerObject_uwbIdentifier_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePeerObject:uwbIdentifier:withReason:");
}

id objc_msgSend__removePeerObject_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePeerObject:withReason:");
}

id objc_msgSend__reportMutualAuthStates(void *a1, const char *a2, ...)
{
  return _[a1 _reportMutualAuthStates];
}

id objc_msgSend__resetAdvertiserForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetAdvertiserForType:");
}

id objc_msgSend__resetAdvertisingStateForAllPeers(void *a1, const char *a2, ...)
{
  return _[a1 _resetAdvertisingStateForAllPeers];
}

id objc_msgSend__resetCryptoStateIncludingFailures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetCryptoStateIncludingFailures:");
}

id objc_msgSend__resetDiscoveryStateForAllPeers(void *a1, const char *a2, ...)
{
  return _[a1 _resetDiscoveryStateForAllPeers];
}

id objc_msgSend__resetDiscoveryStateForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetDiscoveryStateForPeer:");
}

id objc_msgSend__resetRangingStateForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetRangingStateForToken:");
}

id objc_msgSend__resetServiceStateForOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetServiceStateForOperation:");
}

id objc_msgSend__resetSessionStateForOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetSessionStateForOperation:");
}

id objc_msgSend__resetStatistics(void *a1, const char *a2, ...)
{
  return _[a1 _resetStatistics];
}

id objc_msgSend__resetUpdatesEngine(void *a1, const char *a2, ...)
{
  return _[a1 _resetUpdatesEngine];
}

id objc_msgSend__resumeWifiRanging(void *a1, const char *a2, ...)
{
  return _[a1 _resumeWifiRanging];
}

id objc_msgSend__reverse(void *a1, const char *a2, ...)
{
  return _[a1 _reverse];
}

id objc_msgSend__roseSession_didChangeRangingUpdateRate_newThrottleRate_prevThrottleRate_effectiveSinceCycleInde_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_roseSession:didChangeRangingUpdateRate:newThrottleRate:prevThrottleRate:effectiveSinceCycleInde:");
}

id objc_msgSend__roseSession_invalidatedWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_roseSession:invalidatedWithReason:");
}

id objc_msgSend__roundRobinTimerHandler(void *a1, const char *a2, ...)
{
  return _[a1 _roundRobinTimerHandler];
}

id objc_msgSend__runLabTestModeSession(void *a1, const char *a2, ...)
{
  return _[a1 _runLabTestModeSession];
}

id objc_msgSend__runOwnerSession(void *a1, const char *a2, ...)
{
  return _[a1 _runOwnerSession];
}

id objc_msgSend__runPassthroughSession(void *a1, const char *a2, ...)
{
  return _[a1 _runPassthroughSession];
}

id objc_msgSend__selectedTechnology(void *a1, const char *a2, ...)
{
  return _[a1 _selectedTechnology];
}

id objc_msgSend__sendAnalyticsOnRangingComplete_suspendReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendAnalyticsOnRangingComplete:suspendReason:");
}

id objc_msgSend__sendHangup_finderGone_findeeGone_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendHangup:finderGone:findeeGone:token:");
}

id objc_msgSend__sendHangupSignalForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendHangupSignalForSession:");
}

id objc_msgSend__sendTimeTupleToAlgorithms(void *a1, const char *a2, ...)
{
  return _[a1 _sendTimeTupleToAlgorithms];
}

id objc_msgSend__serverConnectionInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 _serverConnectionInterrupted];
}

id objc_msgSend__serverConnectionInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 _serverConnectionInvalidated];
}

id objc_msgSend__sessionConfiguredToRange(void *a1, const char *a2, ...)
{
  return _[a1 _sessionConfiguredToRange];
}

id objc_msgSend__sessionStoppedWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sessionStoppedWithTimestamp:");
}

id objc_msgSend__setContainerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContainerState:");
}

id objc_msgSend__setDebugURSK_transactionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDebugURSK:transactionIdentifier:");
}

id objc_msgSend__setDebugURSK_transactionIdentifier_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDebugURSK:transactionIdentifier:reply:");
}

id objc_msgSend__setInitiator(void *a1, const char *a2, ...)
{
  return _[a1 _setInitiator];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setReadValidateDefaultsWriteForTypeOfPredictor(void *a1, const char *a2, ...)
{
  return _[a1 _setReadValidateDefaultsWriteForTypeOfPredictor];
}

id objc_msgSend__setTokenCacheForGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTokenCacheForGroup:");
}

id objc_msgSend__setURSKTTL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setURSKTTL:");
}

id objc_msgSend__setURSKTTL_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setURSKTTL:reply:");
}

id objc_msgSend__setUpAlgorithmsContainerForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUpAlgorithmsContainerForToken:");
}

id objc_msgSend__shouldBypassBluetoothDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 _shouldBypassBluetoothDiscovery];
}

id objc_msgSend__shouldConsumeRoseSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldConsumeRoseSolution:");
}

id objc_msgSend__shouldEncodeSignallingDataInMessageID(void *a1, const char *a2, ...)
{
  return _[a1 _shouldEncodeSignallingDataInMessageID];
}

id objc_msgSend__shouldHoldOSTransactionWhileFindable(void *a1, const char *a2, ...)
{
  return _[a1 _shouldHoldOSTransactionWhileFindable];
}

id objc_msgSend__shouldInteract(void *a1, const char *a2, ...)
{
  return _[a1 _shouldInteract];
}

id objc_msgSend__shouldLog(void *a1, const char *a2, ...)
{
  return _[a1 _shouldLog];
}

id objc_msgSend__shouldRespondToDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldRespondToDevice:");
}

id objc_msgSend__shouldSendMutualAuthMessage(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSendMutualAuthMessage];
}

id objc_msgSend__shouldUseFinderToken_findeeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldUseFinderToken:findeeToken:");
}

id objc_msgSend__startMonitoringPeersActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startMonitoringPeersActivity:");
}

id objc_msgSend__startObserving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startObserving:");
}

id objc_msgSend__startOrUpdateAdvertising(void *a1, const char *a2, ...)
{
  return _[a1 _startOrUpdateAdvertising];
}

id objc_msgSend__startRoundRobinTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startRoundRobinTimer];
}

id objc_msgSend__startRunawayFindingBackstopTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startRunawayFindingBackstopTimer];
}

id objc_msgSend__startService(void *a1, const char *a2, ...)
{
  return _[a1 _startService];
}

id objc_msgSend__stopObserving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopObserving:");
}

id objc_msgSend__stopRoundRobinTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopRoundRobinTimer];
}

id objc_msgSend__stopWiFiSessionsWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopWiFiSessionsWithReason:");
}

id objc_msgSend__submitErrorMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitErrorMetric:");
}

id objc_msgSend__submitFindingSessionEndStats(void *a1, const char *a2, ...)
{
  return _[a1 _submitFindingSessionEndStats];
}

id objc_msgSend__supportedPlatform(void *a1, const char *a2, ...)
{
  return _[a1 _supportedPlatform];
}

id objc_msgSend__supportedPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportedPlatform:");
}

id objc_msgSend__synchronousRemoteObject(void *a1, const char *a2, ...)
{
  return _[a1 _synchronousRemoteObject];
}

id objc_msgSend__tearDownAlgorithmsContainerForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tearDownAlgorithmsContainerForToken:");
}

id objc_msgSend__tokensFromAllGroups(void *a1, const char *a2, ...)
{
  return _[a1 _tokensFromAllGroups];
}

id objc_msgSend__totalPeers(void *a1, const char *a2, ...)
{
  return _[a1 _totalPeers];
}

id objc_msgSend__triggerInitiatorRanging(void *a1, const char *a2, ...)
{
  return _[a1 _triggerInitiatorRanging];
}

id objc_msgSend__triggerRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerRanging:");
}

id objc_msgSend__triggerRanging_peerDiscoveryToken_technology_sharedProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerRanging:peerDiscoveryToken:technology:sharedProtocol:");
}

id objc_msgSend__triggerResponderRangingForSession_initiatorDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerResponderRangingForSession:initiatorDevice:");
}

id objc_msgSend__triggerWiFiRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerWiFiRanging:");
}

id objc_msgSend__tryToStartRangingWithPeerAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tryToStartRangingWithPeerAdvertisement:");
}

id objc_msgSend__unitTest1(void *a1, const char *a2, ...)
{
  return _[a1 _unitTest1];
}

id objc_msgSend__unitTest2(void *a1, const char *a2, ...)
{
  return _[a1 _unitTest2];
}

id objc_msgSend__updateAdvertisementAfterActivationForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAdvertisementAfterActivationForType:");
}

id objc_msgSend__updateAggregatedClientInfo(void *a1, const char *a2, ...)
{
  return _[a1 _updateAggregatedClientInfo];
}

id objc_msgSend__updateAlignedPDRMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAlignedPDRMetrics:");
}

id objc_msgSend__updateAnalyticsAboutRangingRateForDevice_responseSkipRatio_cycleRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnalyticsAboutRangingRateForDevice:responseSkipRatio:cycleRate:");
}

id objc_msgSend__updateAnalyticsWithFailedRangingRequestToken_isFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnalyticsWithFailedRangingRequestToken:isFinder:");
}

id objc_msgSend__updateAnalyticsWithSuccessfulRangingRequest(void *a1, const char *a2, ...)
{
  return _[a1 _updateAnalyticsWithSuccessfulRangingRequest];
}

id objc_msgSend__updateClientAppVisibilityInterruption(void *a1, const char *a2, ...)
{
  return _[a1 _updateClientAppVisibilityInterruption];
}

id objc_msgSend__updateCryptoSessionConfigPayload(void *a1, const char *a2, ...)
{
  return _[a1 _updateCryptoSessionConfigPayload];
}

id objc_msgSend__updateInterruptionForUWBServiceState_cause_requiresNarrowBand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInterruptionForUWBServiceState:cause:requiresNarrowBand:");
}

id objc_msgSend__updateInterruptionForUWBSystemError(void *a1, const char *a2, ...)
{
  return _[a1 _updateInterruptionForUWBSystemError];
}

id objc_msgSend__updateInterruptionForUWBSystemOffWithCause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInterruptionForUWBSystemOffWithCause:");
}

id objc_msgSend__updateInterruptionForUWBSystemReady(void *a1, const char *a2, ...)
{
  return _[a1 _updateInterruptionForUWBSystemReady];
}

id objc_msgSend__updateLaunchOnDemandScannerAndRequestScan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLaunchOnDemandScannerAndRequestScan:");
}

id objc_msgSend__updateMinMaxRangeAndRSSI_uwbRSSI_nbRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:");
}

id objc_msgSend__updatePeerTrackingAdvertisingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingAdvertisingState:");
}

id objc_msgSend__updatePeerTrackingClientWantsUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingClientWantsUpdates:");
}

id objc_msgSend__updatePeerTrackingDiscoveryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingDiscoveryState:");
}

id objc_msgSend__updatePeerTrackingForToken_newAdvertisingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingForToken:newAdvertisingState:");
}

id objc_msgSend__updatePeerTrackingForToken_newDiscoveryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingForToken:newDiscoveryState:");
}

id objc_msgSend__updatePeerTrackingForToken_newNbUwbAcquisitionChannelIdx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingForToken:newNbUwbAcquisitionChannelIdx:");
}

id objc_msgSend__updatePeerTrackingForToken_newRangingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingForToken:newRangingState:");
}

id objc_msgSend__updatePeerTrackingForToken_newTrackingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingForToken:newTrackingState:");
}

id objc_msgSend__updatePeerTrackingOverallState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingOverallState:");
}

id objc_msgSend__updatePeerTrackingRangingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingRangingState:");
}

id objc_msgSend__updateReceivedSignalFlags_toPeerTrackingForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateReceivedSignalFlags:toPeerTrackingForToken:");
}

id objc_msgSend__updateRegionDescription(void *a1, const char *a2, ...)
{
  return _[a1 _updateRegionDescription];
}

id objc_msgSend__updateSessionPayload(void *a1, const char *a2, ...)
{
  return _[a1 _updateSessionPayload];
}

id objc_msgSend__updateUserMovedDistanceWithPose_lastPoseInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUserMovedDistanceWithPose:lastPoseInfo:");
}

id objc_msgSend__updateUwbSessionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUwbSessionState:");
}

id objc_msgSend__useCase(void *a1, const char *a2, ...)
{
  return _[a1 _useCase];
}

id objc_msgSend__validateDiscoveryTokenDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateDiscoveryTokenDict:");
}

id objc_msgSend__validateLockAttributes(void *a1, const char *a2, ...)
{
  return _[a1 _validateLockAttributes];
}

id objc_msgSend__validateRegionIsPreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateRegionIsPreset:");
}

id objc_msgSend__validateRegionPredicates_outer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateRegionPredicates:outer:");
}

id objc_msgSend__validateTokensAndRangingParameters(void *a1, const char *a2, ...)
{
  return _[a1 _validateTokensAndRangingParameters];
}

id objc_msgSend__verifyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifyError:");
}

id objc_msgSend_acceptBluetoothSample_coarseEstimation_regionCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptBluetoothSample:coarseEstimation:regionCategory:");
}

id objc_msgSend_acceptDiscoveryEventForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptDiscoveryEventForPeer:");
}

id objc_msgSend_acceptGnssSatelliteData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptGnssSatelliteData:");
}

id objc_msgSend_acceptHeadingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptHeadingData:");
}

id objc_msgSend_acceptPeerData_fromPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPeerData:fromPeer:");
}

id objc_msgSend_acceptPeerDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPeerDeviceType:");
}

id objc_msgSend_acceptPeerLocationData_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPeerLocationData:forPeer:");
}

id objc_msgSend_acceptRoseSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptRoseSolution:");
}

id objc_msgSend_acceptRoseSolution_withProcessingOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptRoseSolution:withProcessingOptions:");
}

id objc_msgSend_acceptSelfLocationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptSelfLocationData:");
}

id objc_msgSend_acceptUnsuccessfulRoseSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptUnsuccessfulRoseSolution:");
}

id objc_msgSend_acceptVisionInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptVisionInput:");
}

id objc_msgSend_acceptWiFiRangeResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptWiFiRangeResults:");
}

id objc_msgSend_accessoryConfigData(void *a1, const char *a2, ...)
{
  return _[a1 accessoryConfigData];
}

id objc_msgSend_accessoryDiscoveryToken(void *a1, const char *a2, ...)
{
  return _[a1 accessoryDiscoveryToken];
}

id objc_msgSend_accessoryGATTServiceFailedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryGATTServiceFailedWithError:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_actOnRemoteObjectAndScheduleBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actOnRemoteObjectAndScheduleBarrierBlock:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate:");
}

id objc_msgSend_activateCBDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 activateCBDiscovery];
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activateWithDelegate_delegateQueue_sessionIRK_sessionIdentifier_controlFlags_tokenFlags_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithDelegate:delegateQueue:sessionIRK:sessionIdentifier:controlFlags:tokenFlags:");
}

id objc_msgSend_activationGuard(void *a1, const char *a2, ...)
{
  return _[a1 activationGuard];
}

id objc_msgSend_activationResponse(void *a1, const char *a2, ...)
{
  return _[a1 activationResponse];
}

id objc_msgSend_acwgRangingLimitExceeded(void *a1, const char *a2, ...)
{
  return _[a1 acwgRangingLimitExceeded];
}

id objc_msgSend_addBundleNameToModelResourcePackage_andBundleDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBundleNameToModelResourcePackage:andBundleDirectory:");
}

id objc_msgSend_addClient_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClient:identifier:");
}

id objc_msgSend_addClient_identifier_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClient:identifier:configuration:");
}

id objc_msgSend_addDiscoveryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDiscoveryType:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_identifier_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:identifier:token:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObservers:");
}

id objc_msgSend_addPayloadChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPayloadChangeObserver:");
}

id objc_msgSend_addPeerDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPeerDiscoveryToken:");
}

id objc_msgSend_addPeerToken_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPeerToken:completion:");
}

id objc_msgSend_addSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSample:");
}

id objc_msgSend_addServiceClient_identifier_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addServiceClient:identifier:configuration:");
}

id objc_msgSend_addServiceClient_identifier_processName_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addServiceClient:identifier:processName:configuration:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_adjustResponderThrottleRateIfNeeded_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustResponderThrottleRateIfNeeded:object:");
}

id objc_msgSend_advertiseRate(void *a1, const char *a2, ...)
{
  return _[a1 advertiseRate];
}

id objc_msgSend_advertisement(void *a1, const char *a2, ...)
{
  return _[a1 advertisement];
}

id objc_msgSend_advertisementForFinder_address_statusFlags_payload_uniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:");
}

id objc_msgSend_advertisementFromByteRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisementFromByteRepresentation:");
}

id objc_msgSend_advertisingAddress(void *a1, const char *a2, ...)
{
  return _[a1 advertisingAddress];
}

id objc_msgSend_advertisingAddressData(void *a1, const char *a2, ...)
{
  return _[a1 advertisingAddressData];
}

id objc_msgSend_advertisingAddressDataConnectable(void *a1, const char *a2, ...)
{
  return _[a1 advertisingAddressDataConnectable];
}

id objc_msgSend_advertisingAddressDataNonConnectable(void *a1, const char *a2, ...)
{
  return _[a1 advertisingAddressDataNonConnectable];
}

id objc_msgSend_advertisingPeers(void *a1, const char *a2, ...)
{
  return _[a1 advertisingPeers];
}

id objc_msgSend_advertisingState(void *a1, const char *a2, ...)
{
  return _[a1 advertisingState];
}

id objc_msgSend_aggregatedUWBData(void *a1, const char *a2, ...)
{
  return _[a1 aggregatedUWBData];
}

id objc_msgSend_airPodsProxCardSampleTooOld_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airPodsProxCardSampleTooOld:");
}

id objc_msgSend_airplaneModeStatus(void *a1, const char *a2, ...)
{
  return _[a1 airplaneModeStatus];
}

id objc_msgSend_algorithmOutputFlags(void *a1, const char *a2, ...)
{
  return _[a1 algorithmOutputFlags];
}

id objc_msgSend_algorithmSource(void *a1, const char *a2, ...)
{
  return _[a1 algorithmSource];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allSamples(void *a1, const char *a2, ...)
{
  return _[a1 allSamples];
}

id objc_msgSend_allSessionsPrintableState(void *a1, const char *a2, ...)
{
  return _[a1 allSessionsPrintableState];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowScreenOffOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowScreenOffOperation:");
}

id objc_msgSend_allowedDevices(void *a1, const char *a2, ...)
{
  return _[a1 allowedDevices];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return _[a1 altitude];
}

id objc_msgSend_analytics(void *a1, const char *a2, ...)
{
  return _[a1 analytics];
}

id objc_msgSend_analyticsManager(void *a1, const char *a2, ...)
{
  return _[a1 analyticsManager];
}

id objc_msgSend_antennaDiversityOverride(void *a1, const char *a2, ...)
{
  return _[a1 antennaDiversityOverride];
}

id objc_msgSend_antennaMask(void *a1, const char *a2, ...)
{
  return _[a1 antennaMask];
}

id objc_msgSend_aopWorkaroundDataReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aopWorkaroundDataReceived:");
}

id objc_msgSend_appBecameNotVisibleWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appBecameNotVisibleWithTimestamp:");
}

id objc_msgSend_appBecameVisibleWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appBecameVisibleWithTimestamp:");
}

id objc_msgSend_appStateMonitor(void *a1, const char *a2, ...)
{
  return _[a1 appStateMonitor];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyTransformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyTransformation:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithContentsOfFile:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachedRoles(void *a1, const char *a2, ...)
{
  return _[a1 attachedRoles];
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_authorizationStatusForSession_promptUserIfUndetermined_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationStatusForSession:promptUserIfUndetermined:");
}

id objc_msgSend_azimuth(void *a1, const char *a2, ...)
{
  return _[a1 azimuth];
}

id objc_msgSend_backgroundMode(void *a1, const char *a2, ...)
{
  return _[a1 backgroundMode];
}

id objc_msgSend_biasCorrectionEstimate(void *a1, const char *a2, ...)
{
  return _[a1 biasCorrectionEstimate];
}

id objc_msgSend_bleAdvertisementTimestampMachContinuous(void *a1, const char *a2, ...)
{
  return _[a1 bleAdvertisementTimestampMachContinuous];
}

id objc_msgSend_bleChannel(void *a1, const char *a2, ...)
{
  return _[a1 bleChannel];
}

id objc_msgSend_bleRSSIThresholdHint(void *a1, const char *a2, ...)
{
  return _[a1 bleRSSIThresholdHint];
}

id objc_msgSend_bleScanRate(void *a1, const char *a2, ...)
{
  return _[a1 bleScanRate];
}

id objc_msgSend_bluetoothAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothAdvertisingAddress];
}

id objc_msgSend_bluetoothAdvertisingAddressChanged(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothAdvertisingAddressChanged];
}

id objc_msgSend_bluetoothAdvertisingAddressChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothAdvertisingAddressChanged:");
}

id objc_msgSend_bluetoothDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothDeviceIdentifier];
}

id objc_msgSend_bluetoothDidChangeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothDidChangeState:");
}

id objc_msgSend_bluetoothDiscoveryBecameAvailable(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothDiscoveryBecameAvailable];
}

id objc_msgSend_bluetoothDiscoveryBecameUnavailable(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothDiscoveryBecameUnavailable];
}

id objc_msgSend_bluetoothDiscoveryFinishedActivating(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothDiscoveryFinishedActivating];
}

id objc_msgSend_bluetoothPeerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothPeerIdentifier];
}

id objc_msgSend_bluetoothServiceInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothServiceInterrupted];
}

id objc_msgSend_bluetoothState(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothState];
}

id objc_msgSend_bluetoothStateChanged(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothStateChanged];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_boundedRegionRange(void *a1, const char *a2, ...)
{
  return _[a1 boundedRegionRange];
}

id objc_msgSend_btAddressData(void *a1, const char *a2, ...)
{
  return _[a1 btAddressData];
}

id objc_msgSend_btAdvAddress(void *a1, const char *a2, ...)
{
  return _[a1 btAdvAddress];
}

id objc_msgSend_btAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _[a1 btAdvertisingAddress];
}

id objc_msgSend_btResource(void *a1, const char *a2, ...)
{
  return _[a1 btResource];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleInfoValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleInfoValueForKey:");
}

id objc_msgSend_bundleName(void *a1, const char *a2, ...)
{
  return _[a1 bundleName];
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_byteRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 byteRepresentation];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cacheCharacteristics(void *a1, const char *a2, ...)
{
  return _[a1 cacheCharacteristics];
}

id objc_msgSend_cacheDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheDevice:");
}

id objc_msgSend_cachedConfigCharacteristics(void *a1, const char *a2, ...)
{
  return _[a1 cachedConfigCharacteristics];
}

id objc_msgSend_cachedPlatformCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 cachedPlatformCapabilities];
}

id objc_msgSend_canHandleAcwgMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canHandleAcwgMsg:");
}

id objc_msgSend_canInteract(void *a1, const char *a2, ...)
{
  return _[a1 canInteract];
}

id objc_msgSend_canRange(void *a1, const char *a2, ...)
{
  return _[a1 canRange];
}

id objc_msgSend_canRangeWithPeer_technology_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRangeWithPeer:technology:");
}

id objc_msgSend_canUpdateToConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canUpdateToConfiguration:");
}

id objc_msgSend_cancelPeripheralConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPeripheralConnection:");
}

id objc_msgSend_carKeyRangingLimitExceeded(void *a1, const char *a2, ...)
{
  return _[a1 carKeyRangingLimitExceeded];
}

id objc_msgSend_cbDevice(void *a1, const char *a2, ...)
{
  return _[a1 cbDevice];
}

id objc_msgSend_changeConnectionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeConnectionState:");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return _[a1 channel];
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return _[a1 characteristics];
}

id objc_msgSend_checkCirsValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkCirsValid:");
}

id objc_msgSend_checkForUnlockSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 checkForUnlockSinceBoot];
}

id objc_msgSend_checkInForActivityWithCriteria_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkInForActivityWithCriteria:identifier:");
}

id objc_msgSend_cirPacket1(void *a1, const char *a2, ...)
{
  return _[a1 cirPacket1];
}

id objc_msgSend_cirPacket2(void *a1, const char *a2, ...)
{
  return _[a1 cirPacket2];
}

id objc_msgSend_cleanupPowerState(void *a1, const char *a2, ...)
{
  return _[a1 cleanupPowerState];
}

id objc_msgSend_cleanupRangingManagerAndCompanionAfterError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupRangingManagerAndCompanionAfterError:");
}

id objc_msgSend_clearStateForPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStateForPid:");
}

id objc_msgSend_clearStateForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStateForToken:");
}

id objc_msgSend_clearWifiRangingActiveAdvertisement(void *a1, const char *a2, ...)
{
  return _[a1 clearWifiRangingActiveAdvertisement];
}

id objc_msgSend_clientAuditToken(void *a1, const char *a2, ...)
{
  return _[a1 clientAuditToken];
}

id objc_msgSend_clientConnectionQueue(void *a1, const char *a2, ...)
{
  return _[a1 clientConnectionQueue];
}

id objc_msgSend_clientIdentifierData(void *a1, const char *a2, ...)
{
  return _[a1 clientIdentifierData];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _[a1 clientInfo];
}

id objc_msgSend_clientIrkData(void *a1, const char *a2, ...)
{
  return _[a1 clientIrkData];
}

id objc_msgSend_clientPid(void *a1, const char *a2, ...)
{
  return _[a1 clientPid];
}

id objc_msgSend_clientProcessNameBestGuess(void *a1, const char *a2, ...)
{
  return _[a1 clientProcessNameBestGuess];
}

id objc_msgSend_clientProcessSigningIdentity(void *a1, const char *a2, ...)
{
  return _[a1 clientProcessSigningIdentity];
}

id objc_msgSend_clientQueue(void *a1, const char *a2, ...)
{
  return _[a1 clientQueue];
}

id objc_msgSend_clientWantsUpdates(void *a1, const char *a2, ...)
{
  return _[a1 clientWantsUpdates];
}

id objc_msgSend_clientWithIdentifier_notifiedPassiveAccessIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWithIdentifier:notifiedPassiveAccessIntent:");
}

id objc_msgSend_clientWithIdentifier_notifiedResourceUsageLimitExceeded_forSessionConfigurationType_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWithIdentifier:notifiedResourceUsageLimitExceeded:forSessionConfigurationType:");
}

id objc_msgSend_clientWithIdentifier_requestedPrewarmUWB_prewarmSecureElementChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWithIdentifier:requestedPrewarmUWB:prewarmSecureElementChannel:");
}

id objc_msgSend_clientWithIdentifier_updatedStateToRunning_dueToTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWithIdentifier:updatedStateToRunning:dueToTimeout:");
}

id objc_msgSend_coarseEstimation(void *a1, const char *a2, ...)
{
  return _[a1 coarseEstimation];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_combineAndReportLocalAndCompanionRangingRequestStatus(void *a1, const char *a2, ...)
{
  return _[a1 combineAndReportLocalAndCompanionRangingRequestStatus];
}

id objc_msgSend_commitChange(void *a1, const char *a2, ...)
{
  return _[a1 commitChange];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configType(void *a1, const char *a2, ...)
{
  return _[a1 configType];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationForContainerObjects(void *a1, const char *a2, ...)
{
  return _[a1 configurationForContainerObjects];
}

id objc_msgSend_configurationType(void *a1, const char *a2, ...)
{
  return _[a1 configurationType];
}

id objc_msgSend_configure(void *a1, const char *a2, ...)
{
  return _[a1 configure];
}

id objc_msgSend_configure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configure:");
}

id objc_msgSend_configureBTMaxRateScanningForPrototypeHomeSession(void *a1, const char *a2, ...)
{
  return _[a1 configureBTMaxRateScanningForPrototypeHomeSession];
}

id objc_msgSend_configureCBDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 configureCBDiscovery];
}

id objc_msgSend_configureWithResourceFileHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithResourceFileHandler:");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return _[a1 connect];
}

id objc_msgSend_connectPeripheral_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectPeripheral:options:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return _[a1 connectionQueue];
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return _[a1 connectionState];
}

id objc_msgSend_consumeBluetoothSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeBluetoothSample:");
}

id objc_msgSend_consumeInputFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeInputFeatures:");
}

id objc_msgSend_consumeProtobufBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeProtobufBytes:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return _[a1 controlFlags];
}

id objc_msgSend_convergence(void *a1, const char *a2, ...)
{
  return _[a1 convergence];
}

id objc_msgSend_convergenceStatus(void *a1, const char *a2, ...)
{
  return _[a1 convergenceStatus];
}

id objc_msgSend_convertCBAddressToRoseAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertCBAddressToRoseAddress:");
}

id objc_msgSend_convertToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertToString:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _[a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_correctedRange(void *a1, const char *a2, ...)
{
  return _[a1 correctedRange];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_course(void *a1, const char *a2, ...)
{
  return _[a1 course];
}

id objc_msgSend_courseAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 courseAccuracy];
}

id objc_msgSend_createAndPopulateBiasEstimatorInput_ofDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAndPopulateBiasEstimatorInput:ofDimension:");
}

id objc_msgSend_createBeaconListenerJob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createBeaconListenerJob:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createOneShotConnectionAndResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOneShotConnectionAndResume:");
}

id objc_msgSend_createServices(void *a1, const char *a2, ...)
{
  return _[a1 createServices];
}

id objc_msgSend_createWithBluetoothConnectionEventCounterValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWithBluetoothConnectionEventCounterValue:");
}

id objc_msgSend_currentAppState(void *a1, const char *a2, ...)
{
  return _[a1 currentAppState];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentPeerCount(void *a1, const char *a2, ...)
{
  return _[a1 currentPeerCount];
}

id objc_msgSend_currentPeers(void *a1, const char *a2, ...)
{
  return _[a1 currentPeers];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentServiceState(void *a1, const char *a2, ...)
{
  return _[a1 currentServiceState];
}

id objc_msgSend_daemonJobLabel(void *a1, const char *a2, ...)
{
  return _[a1 daemonJobLabel];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataExchangeDisabledAndUsingParameterOverrides(void *a1, const char *a2, ...)
{
  return _[a1 dataExchangeDisabledAndUsingParameterOverrides];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithCapacity:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_debugDisplayInfo(void *a1, const char *a2, ...)
{
  return _[a1 debugDisplayInfo];
}

id objc_msgSend_debugOptions(void *a1, const char *a2, ...)
{
  return _[a1 debugOptions];
}

id objc_msgSend_debugParameters(void *a1, const char *a2, ...)
{
  return _[a1 debugParameters];
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDictionaryWithKeysOfClasses_objectsOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeFloatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeFloatForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeMatrix4x4ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeMatrix4x4ForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decodeQuatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeQuatForKey:");
}

id objc_msgSend_decodeVector3ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeVector3ForKey:");
}

id objc_msgSend_decrypt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decrypt:");
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return _[a1 defaultCStringEncoding];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_deinitCompanion(void *a1, const char *a2, ...)
{
  return _[a1 deinitCompanion];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegateProxyWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateProxyWithConnection:");
}

id objc_msgSend_deleteAllItemsWithService_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllItemsWithService:synchronizable:systemKeychain:");
}

id objc_msgSend_deleteItemWithService_account_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteItemWithService:account:synchronizable:systemKeychain:");
}

id objc_msgSend_deleteURSKs(void *a1, const char *a2, ...)
{
  return _[a1 deleteURSKs];
}

id objc_msgSend_deleteURSKs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteURSKs:");
}

id objc_msgSend_deregisterTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterTaskWithIdentifier:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionInternal(void *a1, const char *a2, ...)
{
  return _[a1 descriptionInternal];
}

id objc_msgSend_descriptions(void *a1, const char *a2, ...)
{
  return _[a1 descriptions];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _[a1 descriptor];
}

id objc_msgSend_deserialize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserialize:");
}

id objc_msgSend_destinationDevice(void *a1, const char *a2, ...)
{
  return _[a1 destinationDevice];
}

id objc_msgSend_device_rediscovered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device:rediscovered:");
}

id objc_msgSend_deviceCache(void *a1, const char *a2, ...)
{
  return _[a1 deviceCache];
}

id objc_msgSend_deviceCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 deviceCapabilities];
}

id objc_msgSend_deviceDiscovered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceDiscovered:");
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return _[a1 deviceFlags];
}

id objc_msgSend_deviceForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForIdentifier:");
}

id objc_msgSend_deviceForTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForTokenData:");
}

id objc_msgSend_deviceHasUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 deviceHasUnlockedSinceBoot];
}

id objc_msgSend_deviceIdentifer(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifer];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifier];
}

id objc_msgSend_deviceLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceLost:");
}

id objc_msgSend_devicePose(void *a1, const char *a2, ...)
{
  return _[a1 devicePose];
}

id objc_msgSend_devicePresencePreset(void *a1, const char *a2, ...)
{
  return _[a1 devicePresencePreset];
}

id objc_msgSend_devicePresenceResource(void *a1, const char *a2, ...)
{
  return _[a1 devicePresenceResource];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAttemptRangingWithPeer_unsuccessfulSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAttemptRangingWithPeer:unsuccessfulSolution:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didConnectDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didConnectDevice:error:");
}

id objc_msgSend_didDiscoverDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDiscoverDevice:");
}

id objc_msgSend_didDiscoverNearbyObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDiscoverNearbyObject:");
}

id objc_msgSend_didDiscoverPeer_advertisement_overBluetooth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDiscoverPeer:advertisement:overBluetooth:");
}

id objc_msgSend_didFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFailWithError:");
}

id objc_msgSend_didFailWithErrorCode_errorString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFailWithErrorCode:errorString:");
}

id objc_msgSend_didFetchTxPower_fromDevice_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchTxPower:fromDevice:withError:");
}

id objc_msgSend_didFinishActivatingWithDiscoveryTokenData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishActivatingWithDiscoveryTokenData:error:");
}

id objc_msgSend_didGenerateAdvertisement_toSendOOBToPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didGenerateAdvertisement:toSendOOBToPeer:");
}

id objc_msgSend_didGenerateShareableConfigurationData_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didGenerateShareableConfigurationData:forObject:");
}

id objc_msgSend_didGenerateShareableConfigurationData_forToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didGenerateShareableConfigurationData:forToken:");
}

id objc_msgSend_didInvalidateUWBSession(void *a1, const char *a2, ...)
{
  return _[a1 didInvalidateUWBSession];
}

id objc_msgSend_didLoseDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didLoseDevice:");
}

id objc_msgSend_didLosePeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didLosePeer:");
}

id objc_msgSend_didPrefetchAcwgUrsk_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPrefetchAcwgUrsk:error:");
}

id objc_msgSend_didProcessAcwgM1MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didProcessAcwgM1MsgWithResponse:error:");
}

id objc_msgSend_didProcessAcwgM3MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didProcessAcwgM3MsgWithResponse:error:");
}

id objc_msgSend_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:");
}

id objc_msgSend_didRangeWithPeer_newSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRangeWithPeer:newSolution:");
}

id objc_msgSend_didRangingAuthorizationFailForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRangingAuthorizationFailForPeer:");
}

id objc_msgSend_didReceiveAopSensorFusionUpdate_withBtConnHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveAopSensorFusionUpdate:withBtConnHandle:");
}

id objc_msgSend_didReceiveNewBTRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveNewBTRSSI:");
}

id objc_msgSend_didReceiveNewSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveNewSolution:");
}

id objc_msgSend_didReceiveNewSolutions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveNewSolutions:");
}

id objc_msgSend_didReceiveRangingAuthRecommendation_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveRangingAuthRecommendation:forObject:");
}

id objc_msgSend_didReceiveRangingDataForPeer_algorithmAidingData_signallingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveRangingDataForPeer:algorithmAidingData:signallingData:");
}

id objc_msgSend_didReceiveRemoteData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveRemoteData:");
}

id objc_msgSend_didReceiveSessionStartNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveSessionStartNotification:");
}

id objc_msgSend_didReceiveUnsuccessfulSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveUnsuccessfulSolution:");
}

id objc_msgSend_didRemoveNearbyObjects_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRemoveNearbyObjects:withReason:");
}

id objc_msgSend_didServiceRequestUpdateStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didServiceRequestUpdateStatus:");
}

id objc_msgSend_didStartAcwgRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartAcwgRanging:");
}

id objc_msgSend_didStartRangingOnDevice_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartRangingOnDevice:withError:");
}

id objc_msgSend_didStopAdvertisingToPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStopAdvertisingToPeer:");
}

id objc_msgSend_didStopOwnerRangingOnDevice_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStopOwnerRangingOnDevice:withError:");
}

id objc_msgSend_didStopRangingWithPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStopRangingWithPeer:");
}

id objc_msgSend_didSuspendAcwgRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSuspendAcwgRanging:");
}

id objc_msgSend_didUpdateAlgorithmState_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateAlgorithmState:forObject:");
}

id objc_msgSend_didUpdateHealthStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateHealthStatus:");
}

id objc_msgSend_didUpdateHomeDeviceUWBRangingAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateHomeDeviceUWBRangingAvailability:");
}

id objc_msgSend_didUpdateLocalDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateLocalDiscoveryToken:");
}

id objc_msgSend_didUpdateMinimumPreferredUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateMinimumPreferredUpdateRate:");
}

id objc_msgSend_didUpdateMotionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateMotionState:");
}

id objc_msgSend_didUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateNearbyObjects:");
}

id objc_msgSend_didUpdatePassiveAccessIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdatePassiveAccessIntent:");
}

id objc_msgSend_didUpdateResourceUsageLimitExceeded_forSessionConfigurationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateResourceUsageLimitExceeded:forSessionConfigurationType:");
}

id objc_msgSend_didUpdateSystemState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateSystemState:");
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return _[a1 direction];
}

id objc_msgSend_disableAllServices(void *a1, const char *a2, ...)
{
  return _[a1 disableAllServices];
}

id objc_msgSend_disablePTSInitiating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disablePTSInitiating:");
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return _[a1 disconnect];
}

id objc_msgSend_discoverCharacteristics_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverCharacteristics:forService:");
}

id objc_msgSend_discoverServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverServices:");
}

id objc_msgSend_discoveredDevice_didUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveredDevice:didUpdate:");
}

id objc_msgSend_discoveredDevices(void *a1, const char *a2, ...)
{
  return _[a1 discoveredDevices];
}

id objc_msgSend_discoveredPeers(void *a1, const char *a2, ...)
{
  return _[a1 discoveredPeers];
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return _[a1 discoveryFlags];
}

id objc_msgSend_discoveryState(void *a1, const char *a2, ...)
{
  return _[a1 discoveryState];
}

id objc_msgSend_discoveryToken(void *a1, const char *a2, ...)
{
  return _[a1 discoveryToken];
}

id objc_msgSend_discoveryTokenData(void *a1, const char *a2, ...)
{
  return _[a1 discoveryTokenData];
}

id objc_msgSend_discoveryTokenFromIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveryTokenFromIdentifier:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return _[a1 distance];
}

id objc_msgSend_distanceFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromLocation:");
}

id objc_msgSend_distanceMeasurementQuality(void *a1, const char *a2, ...)
{
  return _[a1 distanceMeasurementQuality];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_doesClientWantSessionToRun(void *a1, const char *a2, ...)
{
  return _[a1 doesClientWantSessionToRun];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_effectiveIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 effectiveIdentifier];
}

id objc_msgSend_elevation(void *a1, const char *a2, ...)
{
  return _[a1 elevation];
}

id objc_msgSend_ellipsoidalAltitude(void *a1, const char *a2, ...)
{
  return _[a1 ellipsoidalAltitude];
}

id objc_msgSend_enableInternalObserverSession(void *a1, const char *a2, ...)
{
  return _[a1 enableInternalObserverSession];
}

id objc_msgSend_enablePTSInitiating_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enablePTSInitiating:reply:");
}

id objc_msgSend_enableRanging_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableRanging:reply:");
}

id objc_msgSend_enableSPMIMessagingWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableSPMIMessagingWithHandler:");
}

id objc_msgSend_enabledGestures(void *a1, const char *a2, ...)
{
  return _[a1 enabledGestures];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeFloat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeFloat:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeMatrix4x4_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeMatrix4x4:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeQuat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeQuat:forKey:");
}

id objc_msgSend_encodeVector3_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeVector3:forKey:");
}

id objc_msgSend_encrypt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encrypt:");
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return _[a1 endowmentNamespaces];
}

id objc_msgSend_entitlementGranted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitlementGranted:");
}

id objc_msgSend_entryWithActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryWithActivityType:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exportedObjectClass(void *a1, const char *a2, ...)
{
  return _[a1 exportedObjectClass];
}

id objc_msgSend_failedToAddPeer(void *a1, const char *a2, ...)
{
  return _[a1 failedToAddPeer];
}

id objc_msgSend_failedToRemovePeer(void *a1, const char *a2, ...)
{
  return _[a1 failedToRemovePeer];
}

id objc_msgSend_fallbackBundle(void *a1, const char *a2, ...)
{
  return _[a1 fallbackBundle];
}

id objc_msgSend_fallbackBundleWithBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fallbackBundleWithBundle:");
}

id objc_msgSend_featureValueForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueForName:");
}

id objc_msgSend_featureValueWithMultiArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueWithMultiArray:");
}

id objc_msgSend_fetchAndUpdateAirplaneModeStatus(void *a1, const char *a2, ...)
{
  return _[a1 fetchAndUpdateAirplaneModeStatus];
}

id objc_msgSend_fetchPossibleTerritoriesForLocation_responseQueue_responseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fillNearbyObject_fromRangeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillNearbyObject:fromRangeResult:");
}

id objc_msgSend_fillNearbyObject_fromSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillNearbyObject:fromSolution:");
}

id objc_msgSend_filterUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterUsingPredicate:");
}

id objc_msgSend_findableDiscoveryTokensForGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findableDiscoveryTokensForGroup:");
}

id objc_msgSend_findingConfig(void *a1, const char *a2, ...)
{
  return _[a1 findingConfig];
}

id objc_msgSend_findingConfig2(void *a1, const char *a2, ...)
{
  return _[a1 findingConfig2];
}

id objc_msgSend_findingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 findingEnabled];
}

id objc_msgSend_findingStatus(void *a1, const char *a2, ...)
{
  return _[a1 findingStatus];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstPathIndexPacket1(void *a1, const char *a2, ...)
{
  return _[a1 firstPathIndexPacket1];
}

id objc_msgSend_firstPathIndexPacket2(void *a1, const char *a2, ...)
{
  return _[a1 firstPathIndexPacket2];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_floatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatForKey:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_floor(void *a1, const char *a2, ...)
{
  return _[a1 floor];
}

id objc_msgSend_fromStruct_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromStruct:");
}

id objc_msgSend_generateDiscoveryToken(void *a1, const char *a2, ...)
{
  return _[a1 generateDiscoveryToken];
}

id objc_msgSend_generateFindingDiscoveryTokenWithSharedSecret_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateFindingDiscoveryTokenWithSharedSecret:");
}

id objc_msgSend_generateFindingTokenWithIRK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateFindingTokenWithIRK:");
}

id objc_msgSend_getActivelyInteractingDiscoveryTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActivelyInteractingDiscoveryTokens:");
}

id objc_msgSend_getAlgorithmAidingData(void *a1, const char *a2, ...)
{
  return _[a1 getAlgorithmAidingData];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getContainerUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 getContainerUniqueIdentifier];
}

id objc_msgSend_getGnssSatelliteDataVecFromDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getGnssSatelliteDataVecFromDict:");
}

id objc_msgSend_getIRK(void *a1, const char *a2, ...)
{
  return _[a1 getIRK];
}

id objc_msgSend_getInteractableDiscoveryTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInteractableDiscoveryTokens:");
}

id objc_msgSend_getInternalConnectionQueue(void *a1, const char *a2, ...)
{
  return _[a1 getInternalConnectionQueue];
}

id objc_msgSend_getInternalIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 getInternalIdentifier];
}

id objc_msgSend_getInternalLogObject(void *a1, const char *a2, ...)
{
  return _[a1 getInternalLogObject];
}

id objc_msgSend_getLocalDevicePrintableState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocalDevicePrintableState:");
}

id objc_msgSend_getMostRecentObjectsWithMaxAge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMostRecentObjectsWithMaxAge:");
}

id objc_msgSend_getNIConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 getNIConfiguration];
}

id objc_msgSend_getNormalizedCirAndPeakMagnitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNormalizedCirAndPeakMagnitude:");
}

id objc_msgSend_getNormalizedFftCir_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNormalizedFftCir:");
}

id objc_msgSend_getPeerDataFromFindingContainerWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPeerDataFromFindingContainerWithToken:");
}

id objc_msgSend_getQueue(void *a1, const char *a2, ...)
{
  return _[a1 getQueue];
}

id objc_msgSend_getQueueForInputingData(void *a1, const char *a2, ...)
{
  return _[a1 getQueueForInputingData];
}

id objc_msgSend_getRangingActive(void *a1, const char *a2, ...)
{
  return _[a1 getRangingActive];
}

id objc_msgSend_getResourcePathWithBundleName_bundleDir_resourceName_resourceExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourcePathWithBundleName:bundleDir:resourceName:resourceExtension:");
}

id objc_msgSend_getResourcesManager(void *a1, const char *a2, ...)
{
  return _[a1 getResourcesManager];
}

id objc_msgSend_getSessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 getSessionIdentifier];
}

id objc_msgSend_getSignallingData(void *a1, const char *a2, ...)
{
  return _[a1 getSignallingData];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_handleCBDiscoveryInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 handleCBDiscoveryInterrupted];
}

id objc_msgSend_handleCBDiscoveryStateChanged(void *a1, const char *a2, ...)
{
  return _[a1 handleCBDiscoveryStateChanged];
}

id objc_msgSend_handleCBDiscoverySystemOverride(void *a1, const char *a2, ...)
{
  return _[a1 handleCBDiscoverySystemOverride];
}

id objc_msgSend_handleError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleError:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_handleXPCDisconnection(void *a1, const char *a2, ...)
{
  return _[a1 handleXPCDisconnection];
}

id objc_msgSend_handleXPCDisconnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleXPCDisconnection:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasReceivedRangingData(void *a1, const char *a2, ...)
{
  return _[a1 hasReceivedRangingData];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headingAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 headingAccuracy];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAccuracy];
}

id objc_msgSend_horizontalAngle(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAngle];
}

id objc_msgSend_horizontalAngleAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAngleAccuracy];
}

id objc_msgSend_horizontalAngleAccuracyNumber(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAngleAccuracyNumber];
}

id objc_msgSend_horizontalAngleNumber(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAngleNumber];
}

id objc_msgSend_horizontalDistanceNumber(void *a1, const char *a2, ...)
{
  return _[a1 horizontalDistanceNumber];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierFromDiscoveryToken:");
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_identityString(void *a1, const char *a2, ...)
{
  return _[a1 identityString];
}

id objc_msgSend_idsDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceID];
}

id objc_msgSend_imag(void *a1, const char *a2, ...)
{
  return _[a1 imag];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_informMutualAuthFailuresToClients(void *a1, const char *a2, ...)
{
  return _[a1 informMutualAuthFailuresToClients];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForFinder_address_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForFinder:address:");
}

id objc_msgSend_initInternal(void *a1, const char *a2, ...)
{
  return _[a1 initInternal];
}

id objc_msgSend_initLabTestModeConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initLabTestModeConfiguration:");
}

id objc_msgSend_initPrivate(void *a1, const char *a2, ...)
{
  return _[a1 initPrivate];
}

id objc_msgSend_initRadioSCPreferencesRef(void *a1, const char *a2, ...)
{
  return _[a1 initRadioSCPreferencesRef];
}

id objc_msgSend_initTime(void *a1, const char *a2, ...)
{
  return _[a1 initTime];
}

id objc_msgSend_initVehicleSimConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initVehicleSimConfiguration:");
}

id objc_msgSend_initWithAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAdvertisement:");
}

id objc_msgSend_initWithArray_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:copyItems:");
}

id objc_msgSend_initWithBeaconUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBeaconUUID:");
}

id objc_msgSend_initWithBiasEstimatorFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBiasEstimatorFeatures:");
}

id objc_msgSend_initWithBiasEstimatorOutputs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBiasEstimatorOutputs:");
}

id objc_msgSend_initWithBitmap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBitmap:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCBDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCBDevice:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:");
}

id objc_msgSend_initWithClient_clientInfo_connection_authorizationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:clientInfo:connection:authorizationManager:");
}

id objc_msgSend_initWithClientInfo_connection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientInfo:connection:");
}

id objc_msgSend_initWithClientPid_signingIdentity_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientPid:signingIdentity:sessionIdentifier:");
}

id objc_msgSend_initWithClientReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientReference:");
}

id objc_msgSend_initWithConfiguration_queue_delegate_dataSource_analyticsManager_protobufLogger_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithConnection_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:queue:");
}

id objc_msgSend_initWithConsumerBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConsumerBlock:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithConvergenceStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConvergenceStatus:");
}

id objc_msgSend_initWithCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCurrentTime:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:error:");
}

id objc_msgSend_initWithDataSource_delegate_clientQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:delegate:clientQueue:");
}

id objc_msgSend_initWithDelegate_dispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:dispatchQueue:");
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:");
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:options:");
}

id objc_msgSend_initWithDeviceAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceAddress:");
}

id objc_msgSend_initWithDeviceEventCount_uwbDeviceTimeUs_uwbDeviceTimeUncertainty_uwbClockSkewMeasurementAvailable_deviceMaxPpm_success_retryDelay_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:deviceMaxP pm:success:retryDelay:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithECID_chipID_boardID_bootMode_prodMode_secureMode_securityDomain_chipRevision_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:");
}

id objc_msgSend_initWithEffectiveBundleIdentifier_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffectiveBundleIdentifier:delegate:onQueue:");
}

id objc_msgSend_initWithEffectiveBundlePath_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffectiveBundlePath:delegate:onQueue:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExportedObject:");
}

id objc_msgSend_initWithFindingManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFindingManager:");
}

id objc_msgSend_initWithFineRangingSupport_aoaSupport_extendedDistanceMeasurementSupport_syntheticApertureSupport_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithFineRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:");
}

id objc_msgSend_initWithFineRangingSupport_coarseRangingSupport_aoaSupport_extendedDistanceMeasurementSupport_syntheticApertureSupport_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:");
}

id objc_msgSend_initWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFloat:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithGEOCoordinate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGEOCoordinate:");
}

id objc_msgSend_initWithGetPowerStatsResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGetPowerStatsResponse:");
}

id objc_msgSend_initWithHelloResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHelloResponse:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_isFinder_consumer_queue_pbLogger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:isFinder:consumer:queue:pbLogger:");
}

id objc_msgSend_initWithIdentifier_isFinder_enableBluetooth_launchOnDemand_scanRate_discoveryTimeout_oobRefreshPeriod_consumer_queue_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithIdentifier:isFinder:enableBluetooth:launchOnDemand:scanRate:discoveryTimeout:oobRefreshPeriod:consumer:queue:");
}

id objc_msgSend_initWithIdentifier_observer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:observer:");
}

id objc_msgSend_initWithInnerBoundary_outerBoundary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInnerBoundary:outerBoundary:error:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithKeyDerivationKey_sessionIdentifier_encrypt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyDerivationKey:sessionIdentifier:encrypt:");
}

id objc_msgSend_initWithLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLabel:");
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLatitude:longitude:");
}

id objc_msgSend_initWithLockIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLockIdentifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithNIConfiguration_parsedAccessoryConfigData_processName_uwbSessionId_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNIConfiguration:parsedAccessoryConfigData:processName:uwbSessionId:");
}

id objc_msgSend_initWithName_devicePresencePreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:devicePresencePreset:");
}

id objc_msgSend_initWithName_radius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:radius:");
}

id objc_msgSend_initWithName_radius_preferredUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:radius:preferredUpdateRate:");
}

id objc_msgSend_initWithName_radius_preferredUpdateRate_requiresUserIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:radius:preferredUpdateRate:requiresUserIntent:");
}

id objc_msgSend_initWithName_radius_preferredUpdateRate_requiresUserIntent_devicePresencePreset_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:radius:preferredUpdateRate:requiresUserIntent:devicePresencePreset:");
}

id objc_msgSend_initWithName_regionSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:regionSizeCategory:");
}

id objc_msgSend_initWithName_regionSizeCategory_radius_preferredUpdateRate_requiresUserIntent_coarseEstimation_devicePresencePreset_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithName:regionSizeCategory:radius:preferredUpdateRate:requiresUserIntent:coarseEstimation:devicePresencePreset:");
}

id objc_msgSend_initWithNeuralNetworkModel_andDataTransformer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNeuralNetworkModel:andDataTransformer:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPID:");
}

id objc_msgSend_initWithParentSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParentSession:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_bundle_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:bundle:reason:");
}

id objc_msgSend_initWithQueue_bundleId_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:bundleId:reason:");
}

id objc_msgSend_initWithQueue_identityString_stateUpdateHandler_mutualAuthHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:identityString:stateUpdateHandler:mutualAuthHandler:");
}

id objc_msgSend_initWithQueue_stateChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:stateChangeHandler:");
}

id objc_msgSend_initWithRSSI_identifier_model_channel_machContinuousTimeSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:");
}

id objc_msgSend_initWithRSSI_identifier_model_channel_machContinuousTimeSeconds_partIdentifier_name_presenceConfigData_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:partIdentifier:name:presenceConfigData:");
}

id objc_msgSend_initWithRealPart_imagPart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRealPart:imagPart:");
}

id objc_msgSend_initWithResourceBundleDirectory_bundleName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResourceBundleDirectory:bundleName:");
}

id objc_msgSend_initWithResourcesManager_configuration_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResourcesManager:configuration:error:");
}

id objc_msgSend_initWithRole_discoveryToken_preferredUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRole:discoveryToken:preferredUpdateRate:");
}

id objc_msgSend_initWithSelectedRanMultiplier_selectedNumChapsPerSlot_numResponders_numSlotsPerRound_supportedSyncCodeIndexBitmask_selectedHoppingConfigBitmask_macMode_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithSelectedRanMultiplier:selectedNumChapsPerSlot:numResponders:numSlotsPerRound:supportedSyncCodeIndexBi tmask:selectedHoppingConfigBitmask:macMode:");
}

id objc_msgSend_initWithSelectedUwbConfigId_selectedPulseShapeCombo_selectedChannelBitmask_supportedSyncCodeIndexBitmask_minRanMultiplier_supportedSlotBitmask_supportedHoppingConfigBitmask_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithSelectedUwbConfigId:selectedPulseShapeCombo:selectedChannelBitmask:supportedSyncCodeIndexBitmask:minR anMultiplier:supportedSlotBitmask:supportedHoppingConfigBitmask:");
}

id objc_msgSend_initWithSelectedUwbConfigId_selectedPulseShapeCombo_selectedChannelBitmask_supportedSyncCodeIndexBitmask_minRanMultiplier_supportedSlotBitmask_supportedHoppingConfigBitmask_selectedFinalData2Bitmask_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithSelectedUwbConfigId:selectedPulseShapeCombo:selectedChannelBitmask:supportedSyncCodeIndexBitmask:minR anMultiplier:supportedSlotBitmask:supportedHoppingConfigBitmask:selectedFinalData2Bitmask:");
}

id objc_msgSend_initWithService_account_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:account:data:");
}

id objc_msgSend_initWithServiceRequest_startOptions_shareableConfigData_processName_accessoryConfigData_persistWhileDetached_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithServiceRequest:startOptions:shareableConfigData:processName:accessoryConfigData:persistWhileDetached:");
}

id objc_msgSend_initWithSessionID_queue_exportedObject_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionID:queue:exportedObject:options:");
}

id objc_msgSend_initWithSessionIdentifier_cycleRate_updatesQueue_analyticsManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionIdentifier:cycleRate:updatesQueue:analyticsManager:");
}

id objc_msgSend_initWithSettings_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSettings:queue:");
}

id objc_msgSend_initWithShape_dataType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShape:dataType:error:");
}

id objc_msgSend_initWithStatus_andReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStatus:andReasons:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithStsIndex0_uwbTime0_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStsIndex0:uwbTime0:");
}

id objc_msgSend_initWithStsIndex0_uwbTime0_hopKey_selectedSyncCodeIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStsIndex0:uwbTime0:hopKey:selectedSyncCodeIndex:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithSupportedUwbConfigIds_supportedPulseShapeCombos_channelBitmask_uwbSessionId_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSupportedUwbConfigIds:supportedPulseShapeCombos:channelBitmask:uwbSessionId:");
}

id objc_msgSend_initWithSystemStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSystemStatus:");
}

id objc_msgSend_initWithTimestamp_latitude_longitude_altitude_ellipsoidalAltitude_horizontalAccuracy_verticalAccuracy_speed_speedAccuracy_course_courseAccuracy_floor_locationType_signalEnvironment_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:s peedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:");
}

id objc_msgSend_initWithTimestamp_trueHeading_magneticHeading_headingAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:");
}

id objc_msgSend_initWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithToken:");
}

id objc_msgSend_initWithToken_queue_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithToken:queue:delegate:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUWBConfigData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUWBConfigData:");
}

id objc_msgSend_initWithUWBPreciseDistanceAvailability_uwbExtendedDistanceAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:");
}

id objc_msgSend_initWithVariant_macAddr_machAbsTime_sec_machContTimeValid_machContTime_sec_range_m_rangeUnc_m_azValid_elValid_az_deg_el_deg_azUnc_deg_elUnc_deg_fovConfidence_soiRssiValid_soiRssi_dBm_antennaType_prevSolutionIsBad_trackScoreValid_trackScore_sweepAngleValid_sweepAngle_deg_multipathProbabilityValid_multipathProbability_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid :az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:track ScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:");
}

id objc_msgSend_initWithVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVehicleIdentifier:");
}

id objc_msgSend_innerBoundary(void *a1, const char *a2, ...)
{
  return _[a1 innerBoundary];
}

id objc_msgSend_inputFeatures(void *a1, const char *a2, ...)
{
  return _[a1 inputFeatures];
}

id objc_msgSend_insufficientHorizontalSweep(void *a1, const char *a2, ...)
{
  return _[a1 insufficientHorizontalSweep];
}

id objc_msgSend_insufficientLighting(void *a1, const char *a2, ...)
{
  return _[a1 insufficientLighting];
}

id objc_msgSend_insufficientMovement(void *a1, const char *a2, ...)
{
  return _[a1 insufficientMovement];
}

id objc_msgSend_insufficientSignalStrength(void *a1, const char *a2, ...)
{
  return _[a1 insufficientSignalStrength];
}

id objc_msgSend_insufficientVerticalSweep(void *a1, const char *a2, ...)
{
  return _[a1 insufficientVerticalSweep];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_integerValueForField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValueForField:");
}

id objc_msgSend_interactingFinderDiscoveryTokensForGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactingFinderDiscoveryTokensForGroup:");
}

id objc_msgSend_interestedClients(void *a1, const char *a2, ...)
{
  return _[a1 interestedClients];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalObserver(void *a1, const char *a2, ...)
{
  return _[a1 internalObserver];
}

id objc_msgSend_internalState(void *a1, const char *a2, ...)
{
  return _[a1 internalState];
}

id objc_msgSend_interruptSessionWithReason_monotonicTimeSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interruptSessionWithReason:monotonicTimeSeconds:");
}

id objc_msgSend_interruptionReasonEnded_monotonicTimeSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interruptionReasonEnded:monotonicTimeSeconds:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateCalled(void *a1, const char *a2, ...)
{
  return _[a1 invalidateCalled];
}

id objc_msgSend_invalidationError(void *a1, const char *a2, ...)
{
  return _[a1 invalidationError];
}

id objc_msgSend_isAirPods_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAirPods:");
}

id objc_msgSend_isAnchor(void *a1, const char *a2, ...)
{
  return _[a1 isAnchor];
}

id objc_msgSend_isApplication(void *a1, const char *a2, ...)
{
  return _[a1 isApplication];
}

id objc_msgSend_isAttemptingToRange(void *a1, const char *a2, ...)
{
  return _[a1 isAttemptingToRange];
}

id objc_msgSend_isBackgroundOperationAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isBackgroundOperationAllowed];
}

id objc_msgSend_isCachedByTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCachedByTokenData:");
}

id objc_msgSend_isCameraAssistanceEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCameraAssistanceEnabled];
}

id objc_msgSend_isCameraAssistanceInClientProcess(void *a1, const char *a2, ...)
{
  return _[a1 isCameraAssistanceInClientProcess];
}

id objc_msgSend_isCoastalWaters(void *a1, const char *a2, ...)
{
  return _[a1 isCoastalWaters];
}

id objc_msgSend_isDaemon(void *a1, const char *a2, ...)
{
  return _[a1 isDaemon];
}

id objc_msgSend_isDoingAnything(void *a1, const char *a2, ...)
{
  return _[a1 isDoingAnything];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExtendedDistanceMeasurementAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExtendedDistanceMeasurementAllowed:");
}

id objc_msgSend_isExtendedDistanceMeasurementEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isExtendedDistanceMeasurementEnabled];
}

id objc_msgSend_isFinder(void *a1, const char *a2, ...)
{
  return _[a1 isFinder];
}

id objc_msgSend_isIntValidAntennaDiversityOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIntValidAntennaDiversityOverride:");
}

id objc_msgSend_isIntValidNearbyObjectUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIntValidNearbyObjectUpdateRate:");
}

id objc_msgSend_isIntValidRelationshipSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIntValidRelationshipSpecifier:");
}

id objc_msgSend_isInteresetedInSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInteresetedInSample:");
}

id objc_msgSend_isInterestedInSamplesForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInterestedInSamplesForDevice:");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _[a1 isInternalBuild];
}

id objc_msgSend_isLegacyDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLegacyDiscoveryToken:");
}

id objc_msgSend_isLongRangeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLongRangeEnabled];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowPowerModeEnabled];
}

id objc_msgSend_isMobilePhoneModel(void *a1, const char *a2, ...)
{
  return _[a1 isMobilePhoneModel];
}

id objc_msgSend_isObserver(void *a1, const char *a2, ...)
{
  return _[a1 isObserver];
}

id objc_msgSend_isPreciseRangingAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreciseRangingAllowed:");
}

id objc_msgSend_isRangingEnabledReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRangingEnabledReply:");
}

id objc_msgSend_isRangingLimitExceeded(void *a1, const char *a2, ...)
{
  return _[a1 isRangingLimitExceeded];
}

id objc_msgSend_isRangingLimitExceeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRangingLimitExceeded:");
}

id objc_msgSend_isResponder(void *a1, const char *a2, ...)
{
  return _[a1 isResponder];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isRunningBoardApp(void *a1, const char *a2, ...)
{
  return _[a1 isRunningBoardApp];
}

id objc_msgSend_isSessionAllowedToActivate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSessionAllowedToActivate:");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return _[a1 isTracking];
}

id objc_msgSend_isTrackingPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTrackingPeer:");
}

id objc_msgSend_isUwbCapable(void *a1, const char *a2, ...)
{
  return _[a1 isUwbCapable];
}

id objc_msgSend_isWifiRangingCapable(void *a1, const char *a2, ...)
{
  return _[a1 isWifiRangingCapable];
}

id objc_msgSend_isXPCService(void *a1, const char *a2, ...)
{
  return _[a1 isXPCService];
}

id objc_msgSend_iso3166CountryCode2(void *a1, const char *a2, ...)
{
  return _[a1 iso3166CountryCode2];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_lastConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 lastConfiguration];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_latestActivityTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 latestActivityTimestamp];
}

id objc_msgSend_latestActivityType(void *a1, const char *a2, ...)
{
  return _[a1 latestActivityType];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _[a1 latitude];
}

id objc_msgSend_launchdJobLabel(void *a1, const char *a2, ...)
{
  return _[a1 launchdJobLabel];
}

id objc_msgSend_leadingEdgePacket1(void *a1, const char *a2, ...)
{
  return _[a1 leadingEdgePacket1];
}

id objc_msgSend_leadingEdgePacket2(void *a1, const char *a2, ...)
{
  return _[a1 leadingEdgePacket2];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_lifecycleSupervisor(void *a1, const char *a2, ...)
{
  return _[a1 lifecycleSupervisor];
}

id objc_msgSend_lifecycleTimeoutAfterTrackingForDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lifecycleTimeoutAfterTrackingForDiscoveryToken:");
}

id objc_msgSend_lifecycleTimeoutBeforeTrackingForDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lifecycleTimeoutBeforeTrackingForDiscoveryToken:");
}

id objc_msgSend_lightEstimate(void *a1, const char *a2, ...)
{
  return _[a1 lightEstimate];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return _[a1 listener];
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return _[a1 listeners];
}

id objc_msgSend_loadResourcesWithResourceIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadResourcesWithResourceIndex:");
}

id objc_msgSend_localDeviceConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 localDeviceConfiguration];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _[a1 localizations];
}

id objc_msgSend_localizedBundle(void *a1, const char *a2, ...)
{
  return _[a1 localizedBundle];
}

id objc_msgSend_localizedBundleWithBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedBundleWithBundle:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationType(void *a1, const char *a2, ...)
{
  return _[a1 locationType];
}

id objc_msgSend_lockBtConnHandle(void *a1, const char *a2, ...)
{
  return _[a1 lockBtConnHandle];
}

id objc_msgSend_lockIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 lockIdentifier];
}

id objc_msgSend_logSessionEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logSessionEvent:");
}

id objc_msgSend_logSessionSummary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logSessionSummary:");
}

id objc_msgSend_logSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logSolution:");
}

id objc_msgSend_logUnservableRangingRequestWithToken_isFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logUnservableRangingRequestWithToken:isFinder:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longRangeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 longRangeEnabled];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _[a1 longitude];
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return _[a1 macAddress];
}

id objc_msgSend_mac_addr(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mac_addr");
}

id objc_msgSend_machContinuousTimeSeconds(void *a1, const char *a2, ...)
{
  return _[a1 machContinuousTimeSeconds];
}

id objc_msgSend_machServicesNames(void *a1, const char *a2, ...)
{
  return _[a1 machServicesNames];
}

id objc_msgSend_magneticHeading(void *a1, const char *a2, ...)
{
  return _[a1 magneticHeading];
}

id objc_msgSend_majorRelocalization(void *a1, const char *a2, ...)
{
  return _[a1 majorRelocalization];
}

id objc_msgSend_marconiBypassEnabled(void *a1, const char *a2, ...)
{
  return _[a1 marconiBypassEnabled];
}

id objc_msgSend_maxAllowedOutgoingMessages(void *a1, const char *a2, ...)
{
  return _[a1 maxAllowedOutgoingMessages];
}

id objc_msgSend_maxInactivityAfterTrackingBeganSeconds(void *a1, const char *a2, ...)
{
  return _[a1 maxInactivityAfterTrackingBeganSeconds];
}

id objc_msgSend_maxInactivityBeforeTrackingBeganSeconds(void *a1, const char *a2, ...)
{
  return _[a1 maxInactivityBeforeTrackingBeganSeconds];
}

id objc_msgSend_maxNearbyObjectAge(void *a1, const char *a2, ...)
{
  return _[a1 maxNearbyObjectAge];
}

id objc_msgSend_measurementReceivedForToken_contTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measurementReceivedForToken:contTimestamp:");
}

id objc_msgSend_minimumPreferredUpdatedRate(void *a1, const char *a2, ...)
{
  return _[a1 minimumPreferredUpdatedRate];
}

id objc_msgSend_minorRelocalization(void *a1, const char *a2, ...)
{
  return _[a1 minorRelocalization];
}

id objc_msgSend_mmsRxStatus(void *a1, const char *a2, ...)
{
  return _[a1 mmsRxStatus];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelWithContentsOfURL:error:");
}

id objc_msgSend_monitorForDeath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorForDeath:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_monitoredProcessName(void *a1, const char *a2, ...)
{
  return _[a1 monitoredProcessName];
}

id objc_msgSend_monitoredRegions(void *a1, const char *a2, ...)
{
  return _[a1 monitoredRegions];
}

id objc_msgSend_monitoringOption(void *a1, const char *a2, ...)
{
  return _[a1 monitoringOption];
}

id objc_msgSend_motionState(void *a1, const char *a2, ...)
{
  return _[a1 motionState];
}

id objc_msgSend_multiArrayValue(void *a1, const char *a2, ...)
{
  return _[a1 multiArrayValue];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_narrowBandMask(void *a1, const char *a2, ...)
{
  return _[a1 narrowBandMask];
}

id objc_msgSend_nbRssi(void *a1, const char *a2, ...)
{
  return _[a1 nbRssi];
}

id objc_msgSend_nbRxStatus(void *a1, const char *a2, ...)
{
  return _[a1 nbRxStatus];
}

id objc_msgSend_nbUwbAcquisitionChannelIdx(void *a1, const char *a2, ...)
{
  return _[a1 nbUwbAcquisitionChannelIdx];
}

id objc_msgSend_nearbyActionNWPrecisionFindingStatus(void *a1, const char *a2, ...)
{
  return _[a1 nearbyActionNWPrecisionFindingStatus];
}

id objc_msgSend_nearbyActionNoWakeAuthTagData(void *a1, const char *a2, ...)
{
  return _[a1 nearbyActionNoWakeAuthTagData];
}

id objc_msgSend_nearbyActionNoWakeConfigData(void *a1, const char *a2, ...)
{
  return _[a1 nearbyActionNoWakeConfigData];
}

id objc_msgSend_nearbyActionNoWakeType(void *a1, const char *a2, ...)
{
  return _[a1 nearbyActionNoWakeType];
}

id objc_msgSend_nearbyObjectFromDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectFromDeviceIdentifier:");
}

id objc_msgSend_nearbyObjectFromRangeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectFromRangeResult:");
}

id objc_msgSend_nearbyObjectFromSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectFromSolution:");
}

id objc_msgSend_nearbyObjectFromSolution_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectFromSolution:forPeer:");
}

id objc_msgSend_nearbyObjectFromToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectFromToken:");
}

id objc_msgSend_nearbyObjectUpdateRate_isGreaterThan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectUpdateRate:isGreaterThan:");
}

id objc_msgSend_nearbyObjectUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectUpdated:");
}

id objc_msgSend_neuralNetworkModel(void *a1, const char *a2, ...)
{
  return _[a1 neuralNetworkModel];
}

id objc_msgSend_newAssertionForBundle_withReason_withCallbackQueue_andBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newAssertionForBundle:withReason:withCallbackQueue:andBlock:");
}

id objc_msgSend_newAssertionForBundleIdentifier_withReason_withCallbackQueue_andBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newAssertionForBundleIdentifier:withReason:withCallbackQueue:andBlock:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_niConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 niConfiguration];
}

id objc_msgSend_niConvergenceStateFromSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "niConvergenceStateFromSolution:");
}

id objc_msgSend_nominalCycleRate(void *a1, const char *a2, ...)
{
  return _[a1 nominalCycleRate];
}

id objc_msgSend_nonConnectableAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _[a1 nonConnectableAdvertisingAddress];
}

id objc_msgSend_notifyDeviceUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 notifyDeviceUnlockedSinceBoot];
}

id objc_msgSend_notifyServiceClientWithIdentifier_isRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyServiceClientWithIdentifier:isRunning:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numCharacteristicsLeftToRead(void *a1, const char *a2, ...)
{
  return _[a1 numCharacteristicsLeftToRead];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_object_didUpdateRegion_previousRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object:didUpdateRegion:previousRegion:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectFromBluetoothDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectFromBluetoothDevice:");
}

id objc_msgSend_objectFromIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectFromIdentifier:");
}

id objc_msgSend_objectInRawTokenOPACKDictForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectInRawTokenOPACKDictForKey:");
}

id objc_msgSend_observationRegistrar(void *a1, const char *a2, ...)
{
  return _[a1 observationRegistrar];
}

id objc_msgSend_observerTokens(void *a1, const char *a2, ...)
{
  return _[a1 observerTokens];
}

id objc_msgSend_oobKeys(void *a1, const char *a2, ...)
{
  return _[a1 oobKeys];
}

id objc_msgSend_outProbabilities(void *a1, const char *a2, ...)
{
  return _[a1 outProbabilities];
}

id objc_msgSend_outerBoundary(void *a1, const char *a2, ...)
{
  return _[a1 outerBoundary];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return _[a1 outputs];
}

id objc_msgSend_overrideSpatialScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideSpatialScore:");
}

id objc_msgSend_overrideTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideTimestamp:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_parsedAccessoryConfigData(void *a1, const char *a2, ...)
{
  return _[a1 parsedAccessoryConfigData];
}

id objc_msgSend_partIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 partIdentifier];
}

id objc_msgSend_passiveAccessIntent(void *a1, const char *a2, ...)
{
  return _[a1 passiveAccessIntent];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pathForResource_ofType_inDirectory_forLocalization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:inDirectory:forLocalization:");
}

id objc_msgSend_pause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pause:");
}

id objc_msgSend_pauseCalled(void *a1, const char *a2, ...)
{
  return _[a1 pauseCalled];
}

id objc_msgSend_pauseWithSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseWithSource:");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_payloadChangeObserverQueue(void *a1, const char *a2, ...)
{
  return _[a1 payloadChangeObserverQueue];
}

id objc_msgSend_peerDiscoveryToken(void *a1, const char *a2, ...)
{
  return _[a1 peerDiscoveryToken];
}

id objc_msgSend_peerHangupReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerHangupReceived:");
}

id objc_msgSend_peerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 peerIdentifier];
}

id objc_msgSend_peerInactivityPeriodExceeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerInactivityPeriodExceeded:");
}

id objc_msgSend_peerToken(void *a1, const char *a2, ...)
{
  return _[a1 peerToken];
}

id objc_msgSend_peerTrackingInitialState(void *a1, const char *a2, ...)
{
  return _[a1 peerTrackingInitialState];
}

id objc_msgSend_peerTrackingTerminalState(void *a1, const char *a2, ...)
{
  return _[a1 peerTrackingTerminalState];
}

id objc_msgSend_peerTrackingWithDiscoveryState_advertisingState_rangingState_algorithmOutputFlags_receivedSignalFlags_tellClientAboutPeer_clientWantsUpdates_nbUwbAcquisitionChannelIdx_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellCli entAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:");
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return _[a1 peripheral];
}

id objc_msgSend_persistWhileDetached(void *a1, const char *a2, ...)
{
  return _[a1 persistWhileDetached];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_populateOrderedBiasEstimatorOutputs(void *a1, const char *a2, ...)
{
  return _[a1 populateOrderedBiasEstimatorOutputs];
}

id objc_msgSend_populateOrderedInputFeature(void *a1, const char *a2, ...)
{
  return _[a1 populateOrderedInputFeature];
}

id objc_msgSend_positioningSensorSessionStarted(void *a1, const char *a2, ...)
{
  return _[a1 positioningSensorSessionStarted];
}

id objc_msgSend_positioningSensorSessionStopped(void *a1, const char *a2, ...)
{
  return _[a1 positioningSensorSessionStopped];
}

id objc_msgSend_powerBudgetProvider(void *a1, const char *a2, ...)
{
  return _[a1 powerBudgetProvider];
}

id objc_msgSend_predicateMatchingIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingIdentifier:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predictBiasEstimate_scaledInputFeatures_output_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictBiasEstimate:scaledInputFeatures:output:");
}

id objc_msgSend_predictOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictOutput:");
}

id objc_msgSend_predictionFromFeatures_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictionFromFeatures:error:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_preferredUpdateRate(void *a1, const char *a2, ...)
{
  return _[a1 preferredUpdateRate];
}

id objc_msgSend_prefetchAcwgUrsk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefetchAcwgUrsk:");
}

id objc_msgSend_preprocessInputFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preprocessInputFeatures:");
}

id objc_msgSend_presenceConfigData(void *a1, const char *a2, ...)
{
  return _[a1 presenceConfigData];
}

id objc_msgSend_presentUserAuthorizationPrompt_forAuditToken_withBundleRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentUserAuthorizationPrompt:forAuditToken:withBundleRecord:");
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _[a1 previousState];
}

id objc_msgSend_prewarmSecureElementChannel(void *a1, const char *a2, ...)
{
  return _[a1 prewarmSecureElementChannel];
}

id objc_msgSend_prewarmUWB(void *a1, const char *a2, ...)
{
  return _[a1 prewarmUWB];
}

id objc_msgSend_printableState(void *a1, const char *a2, ...)
{
  return _[a1 printableState];
}

id objc_msgSend_printableStateOnQueue(void *a1, const char *a2, ...)
{
  return _[a1 printableStateOnQueue];
}

id objc_msgSend_probeRegions(void *a1, const char *a2, ...)
{
  return _[a1 probeRegions];
}

id objc_msgSend_proceedWithPowerStatsQuery(void *a1, const char *a2, ...)
{
  return _[a1 proceedWithPowerStatsQuery];
}

id objc_msgSend_processAcwgM1Msg_withSessionTriggerReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAcwgM1Msg:withSessionTriggerReason:");
}

id objc_msgSend_processAcwgM3Msg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAcwgM3Msg:");
}

id objc_msgSend_processAcwgRangingSessionResumeRequestMsg_withResumeTriggerReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:");
}

id objc_msgSend_processAdvertisement_receivedOOBFromPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAdvertisement:receivedOOBFromPeer:");
}

id objc_msgSend_processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter_monotonicTimeSec_response_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monotonicTimeSec:response:");
}

id objc_msgSend_processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:reply:");
}

id objc_msgSend_processClientDiscoveryEventForToken_sharedConfigurationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processClientDiscoveryEventForToken:sharedConfigurationData:");
}

id objc_msgSend_processClientDiscoveryEventWithSharedConfigurationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processClientDiscoveryEventWithSharedConfigurationData:");
}

id objc_msgSend_processClientRemovePeerEvent(void *a1, const char *a2, ...)
{
  return _[a1 processClientRemovePeerEvent];
}

id objc_msgSend_processClientRemovePeerEventForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processClientRemovePeerEventForToken:");
}

id objc_msgSend_processDCKMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDCKMessage:");
}

id objc_msgSend_processDCKMessage_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDCKMessage:reply:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processLostEventReceivedOOBFromPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processLostEventReceivedOOBFromPeer:");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_processNameBestGuess(void *a1, const char *a2, ...)
{
  return _[a1 processNameBestGuess];
}

id objc_msgSend_processPeerLocation_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPeerLocation:forPeer:");
}

id objc_msgSend_processSelfHeading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processSelfHeading:");
}

id objc_msgSend_processSelfLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processSelfLocation:");
}

id objc_msgSend_processUWBResultForRegionMonitoring_roseSolution_processingOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUWBResultForRegionMonitoring:roseSolution:processingOptions:");
}

id objc_msgSend_processUWBResultForSyntheticAperture_roseSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUWBResultForSyntheticAperture:roseSolution:");
}

id objc_msgSend_processUpdatedConfiguration_forClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUpdatedConfiguration:forClientIdentifier:");
}

id objc_msgSend_processUpdatedLockState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUpdatedLockState:");
}

id objc_msgSend_processVisionInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processVisionInput:");
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return _[a1 productID];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_protobufLogger(void *a1, const char *a2, ...)
{
  return _[a1 protobufLogger];
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 protocolVersion];
}

id objc_msgSend_provideFindingSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provideFindingSolution:");
}

id objc_msgSend_proximityPairingProductID(void *a1, const char *a2, ...)
{
  return _[a1 proximityPairingProductID];
}

id objc_msgSend_publishBytes_amount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishBytes:amount:");
}

id objc_msgSend_publishWithAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishWithAuditToken:");
}

id objc_msgSend_publisherForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherForClient:");
}

id objc_msgSend_quaternion(void *a1, const char *a2, ...)
{
  return _[a1 quaternion];
}

id objc_msgSend_queryDeviceCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryDeviceCapabilities:");
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _[a1 radius];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeBiasEstimate(void *a1, const char *a2, ...)
{
  return _[a1 rangeBiasEstimate];
}

id objc_msgSend_rangeBiasEstimatorModelDataTransformer(void *a1, const char *a2, ...)
{
  return _[a1 rangeBiasEstimatorModelDataTransformer];
}

id objc_msgSend_rangeUncertainty(void *a1, const char *a2, ...)
{
  return _[a1 rangeUncertainty];
}

id objc_msgSend_rangingAcquisitionType(void *a1, const char *a2, ...)
{
  return _[a1 rangingAcquisitionType];
}

id objc_msgSend_rangingBecameUnavailable(void *a1, const char *a2, ...)
{
  return _[a1 rangingBecameUnavailable];
}

id objc_msgSend_rangingRequestDidUpdateStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingRequestDidUpdateStatus:");
}

id objc_msgSend_rangingRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 rangingRetryCount];
}

id objc_msgSend_rangingRetryTimer(void *a1, const char *a2, ...)
{
  return _[a1 rangingRetryTimer];
}

id objc_msgSend_rangingServiceDidUpdateState_cause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingServiceDidUpdateState:cause:");
}

id objc_msgSend_rangingSession(void *a1, const char *a2, ...)
{
  return _[a1 rangingSession];
}

id objc_msgSend_rangingState(void *a1, const char *a2, ...)
{
  return _[a1 rangingState];
}

id objc_msgSend_rangingTriggerType(void *a1, const char *a2, ...)
{
  return _[a1 rangingTriggerType];
}

id objc_msgSend_rawRange(void *a1, const char *a2, ...)
{
  return _[a1 rawRange];
}

id objc_msgSend_rawToken(void *a1, const char *a2, ...)
{
  return _[a1 rawToken];
}

id objc_msgSend_readAllItemsWithService_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readAllItemsWithService:synchronizable:systemKeychain:");
}

id objc_msgSend_readItemWithService_account_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readItemWithService:account:synchronizable:systemKeychain:");
}

id objc_msgSend_readValueForCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readValueForCharacteristic:");
}

id objc_msgSend_readingMultiConfigCharacteristics(void *a1, const char *a2, ...)
{
  return _[a1 readingMultiConfigCharacteristics];
}

id objc_msgSend_real(void *a1, const char *a2, ...)
{
  return _[a1 real];
}

id objc_msgSend_reasons(void *a1, const char *a2, ...)
{
  return _[a1 reasons];
}

id objc_msgSend_receivedSignalFlags(void *a1, const char *a2, ...)
{
  return _[a1 receivedSignalFlags];
}

id objc_msgSend_recentlyObservedObjectsCache(void *a1, const char *a2, ...)
{
  return _[a1 recentlyObservedObjectsCache];
}

id objc_msgSend_refreshRangingForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshRangingForToken:");
}

id objc_msgSend_regionName(void *a1, const char *a2, ...)
{
  return _[a1 regionName];
}

id objc_msgSend_regionSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 regionSizeCategory];
}

id objc_msgSend_registerForActivityWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForActivityWithIdentifier:");
}

id objc_msgSend_registerForInternalBluetoothSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForInternalBluetoothSamples:");
}

id objc_msgSend_registerForInternalBluetoothSamples_reportCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForInternalBluetoothSamples:reportCache:");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_registerForVisionInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForVisionInput:");
}

id objc_msgSend_registerNBAMMSSessionWithToken_isFinder_client_serviceRequest_startRangingOptions_sharedProtocol_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "registerNBAMMSSessionWithToken:isFinder:client:serviceRequest:startRangingOptions:sharedProtocol:");
}

id objc_msgSend_registerObserversForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObserversForSession:");
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerRequestID:options:handler:");
}

id objc_msgSend_registerSessionWithConnection_observerSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSessionWithConnection:observerSession:");
}

id objc_msgSend_relationship(void *a1, const char *a2, ...)
{
  return _[a1 relationship];
}

id objc_msgSend_relayDCKMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayDCKMessage:");
}

id objc_msgSend_relayInfoToNewObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayInfoToNewObserver:");
}

id objc_msgSend_relayToObserversForToken_blockToRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayToObserversForToken:blockToRelay:");
}

id objc_msgSend_remote(void *a1, const char *a2, ...)
{
  return _[a1 remote];
}

id objc_msgSend_remoteDevice_didChangeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDevice:didChangeState:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteTxAntennaMask(void *a1, const char *a2, ...)
{
  return _[a1 remoteTxAntennaMask];
}

id objc_msgSend_removeAllDiscoveryTypes(void *a1, const char *a2, ...)
{
  return _[a1 removeAllDiscoveryTypes];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeClientWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeClientWithIdentifier:");
}

id objc_msgSend_removeClientWithIdentifier_dueToTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeClientWithIdentifier:dueToTimeout:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeObserverWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserverWithIdentifier:");
}

id objc_msgSend_removeObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObservers:");
}

id objc_msgSend_removePayloadChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePayloadChangeObserver:");
}

id objc_msgSend_removePeerDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePeerDiscoveryToken:");
}

id objc_msgSend_removePeerToken_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePeerToken:completion:");
}

id objc_msgSend_removeServiceClientWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeServiceClientWithIdentifier:");
}

id objc_msgSend_removeStaleSamples(void *a1, const char *a2, ...)
{
  return _[a1 removeStaleSamples];
}

id objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:");
}

id objc_msgSend_reportAndLogNearbyObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportAndLogNearbyObject:");
}

id objc_msgSend_reportRangingRequestStatusUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportRangingRequestStatusUpdate:");
}

id objc_msgSend_requestAcwgRangingSessionSuspend_withSuspendTriggerReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAcwgRangingSessionSuspend:withSuspendTriggerReason:");
}

id objc_msgSend_requestAsyncServiceStatusUpdate(void *a1, const char *a2, ...)
{
  return _[a1 requestAsyncServiceStatusUpdate];
}

id objc_msgSend_requiresBiasCorrection(void *a1, const char *a2, ...)
{
  return _[a1 requiresBiasCorrection];
}

id objc_msgSend_requiresLargeRegions(void *a1, const char *a2, ...)
{
  return _[a1 requiresLargeRegions];
}

id objc_msgSend_requiresNarrowbandToRun(void *a1, const char *a2, ...)
{
  return _[a1 requiresNarrowbandToRun];
}

id objc_msgSend_requiresSpatialInteractionBluetoothResource(void *a1, const char *a2, ...)
{
  return _[a1 requiresSpatialInteractionBluetoothResource];
}

id objc_msgSend_requiresUWBToRun(void *a1, const char *a2, ...)
{
  return _[a1 requiresUWBToRun];
}

id objc_msgSend_requiresUserIntent(void *a1, const char *a2, ...)
{
  return _[a1 requiresUserIntent];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetARSession(void *a1, const char *a2, ...)
{
  return _[a1 resetARSession];
}

id objc_msgSend_resetAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 resetAnalytics];
}

id objc_msgSend_resourceBundleDir(void *a1, const char *a2, ...)
{
  return _[a1 resourceBundleDir];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return _[a1 resourcePath];
}

id objc_msgSend_resourcesManager(void *a1, const char *a2, ...)
{
  return _[a1 resourcesManager];
}

id objc_msgSend_resultConfigCharacteristics(void *a1, const char *a2, ...)
{
  return _[a1 resultConfigCharacteristics];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_allowAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveConnectedPeripheralsWithServices:allowAll:");
}

id objc_msgSend_retrievePairedPeers(void *a1, const char *a2, ...)
{
  return _[a1 retrievePairedPeers];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_revokeFindingExperience(void *a1, const char *a2, ...)
{
  return _[a1 revokeFindingExperience];
}

id objc_msgSend_revokeReason(void *a1, const char *a2, ...)
{
  return _[a1 revokeReason];
}

id objc_msgSend_roseMACAddress(void *a1, const char *a2, ...)
{
  return _[a1 roseMACAddress];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return _[a1 rssi];
}

id objc_msgSend_rssiDbm(void *a1, const char *a2, ...)
{
  return _[a1 rssiDbm];
}

id objc_msgSend_rttInitiator(void *a1, const char *a2, ...)
{
  return _[a1 rttInitiator];
}

id objc_msgSend_rttResponder(void *a1, const char *a2, ...)
{
  return _[a1 rttResponder];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_runWithConfiguration_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithConfiguration:reply:");
}

id objc_msgSend_runWithConfigurationCalled(void *a1, const char *a2, ...)
{
  return _[a1 runWithConfigurationCalled];
}

id objc_msgSend_rxAntennaPacket1(void *a1, const char *a2, ...)
{
  return _[a1 rxAntennaPacket1];
}

id objc_msgSend_rxAntennaPacket2(void *a1, const char *a2, ...)
{
  return _[a1 rxAntennaPacket2];
}

id objc_msgSend_scaleCirValuesIfRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaleCirValuesIfRequired:");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scanRate(void *a1, const char *a2, ...)
{
  return _[a1 scanRate];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_scheduleSendBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleSendBarrierBlock:");
}

id objc_msgSend_secureKey(void *a1, const char *a2, ...)
{
  return _[a1 secureKey];
}

id objc_msgSend_selectedTechnology(void *a1, const char *a2, ...)
{
  return _[a1 selectedTechnology];
}

id objc_msgSend_sendAnalyticsHeartbeatWasSuccessful_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAnalyticsHeartbeatWasSuccessful:");
}

id objc_msgSend_sendDataToPeers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDataToPeers:");
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestID:request:options:responseHandler:");
}

id objc_msgSend_serialNumberLeft(void *a1, const char *a2, ...)
{
  return _[a1 serialNumberLeft];
}

id objc_msgSend_serialNumberRight(void *a1, const char *a2, ...)
{
  return _[a1 serialNumberRight];
}

id objc_msgSend_serialize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialize:");
}

id objc_msgSend_serverSessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 serverSessionIdentifier];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceDidDiscoverNearbyObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidDiscoverNearbyObject:");
}

id objc_msgSend_serviceDidGenerateShareableConfigurationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidGenerateShareableConfigurationData:");
}

id objc_msgSend_serviceDidGenerateShareableConfigurationData_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidGenerateShareableConfigurationData:forObject:");
}

id objc_msgSend_serviceDidRemoveNearbyObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidRemoveNearbyObject:");
}

id objc_msgSend_serviceDidUpdateAlgorithmConvergenceState_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidUpdateAlgorithmConvergenceState:forObject:");
}

id objc_msgSend_serviceDidUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidUpdateNearbyObjects:");
}

id objc_msgSend_serviceForToken_createIfNotExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceForToken:createIfNotExists:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceRequest(void *a1, const char *a2, ...)
{
  return _[a1 serviceRequest];
}

id objc_msgSend_serviceRequestDidUpdateStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceRequestDidUpdateStatus:");
}

id objc_msgSend_serviceWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceWithQueue:");
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return _[a1 services];
}

id objc_msgSend_session_didDiscoverNearbyObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didDiscoverNearbyObject:");
}

id objc_msgSend_session_didFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didFailWithError:");
}

id objc_msgSend_session_didGenerateShareableConfigurationData_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didGenerateShareableConfigurationData:forObject:");
}

id objc_msgSend_session_didInvalidateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didInvalidateWithError:");
}

id objc_msgSend_session_didPrefetchAcwgUrsk_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didPrefetchAcwgUrsk:error:");
}

id objc_msgSend_session_didProcessAcwgM1MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didProcessAcwgM1MsgWithResponse:error:");
}

id objc_msgSend_session_didProcessAcwgM3MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didProcessAcwgM3MsgWithResponse:error:");
}

id objc_msgSend_session_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:");
}

id objc_msgSend_session_didProcessBluetoothHostTimeSyncWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didProcessBluetoothHostTimeSyncWithResponse:error:");
}

id objc_msgSend_session_didReceiveRangingAuthRecommendation_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didReceiveRangingAuthRecommendation:forObject:");
}

id objc_msgSend_session_didRemoveNearbyObjects_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didRemoveNearbyObjects:withReason:");
}

id objc_msgSend_session_didStartAcwgRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didStartAcwgRanging:");
}

id objc_msgSend_session_didSuspendAcwgRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didSuspendAcwgRanging:");
}

id objc_msgSend_session_didUpdateAlgorithmConvergence_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateAlgorithmConvergence:forObject:");
}

id objc_msgSend_session_didUpdateAlgorithmState_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateAlgorithmState:forObject:");
}

id objc_msgSend_session_didUpdateHealthStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateHealthStatus:");
}

id objc_msgSend_session_didUpdateHomeDeviceUWBRangingAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateHomeDeviceUWBRangingAvailability:");
}

id objc_msgSend_session_didUpdateLocalMotionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateLocalMotionState:");
}

id objc_msgSend_session_didUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateNearbyObjects:");
}

id objc_msgSend_session_object_didUpdateRegion_previousRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:object:didUpdateRegion:previousRegion:");
}

id objc_msgSend_session_relayDCKMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:relayDCKMessage:");
}

id objc_msgSend_session_requestAcwgRangingSessionSuspend_withSuspendTriggerReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:requestAcwgRangingSessionSuspend:withSuspendTriggerReason:");
}

id objc_msgSend_session_suspendedWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:suspendedWithReason:");
}

id objc_msgSend_session_suspensionReasonEnded_isNoLongerSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:suspensionReasonEnded:isNoLongerSuspended:");
}

id objc_msgSend_sessionClientForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionClientForFinder:");
}

id objc_msgSend_sessionClientsStatus(void *a1, const char *a2, ...)
{
  return _[a1 sessionClientsStatus];
}

id objc_msgSend_sessionDidStartRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionDidStartRunning:");
}

id objc_msgSend_sessionDidUpdateDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionDidUpdateDiscoveryToken:");
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sessionIdentifier];
}

id objc_msgSend_sessionInterruptedWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionInterruptedWithTimestamp:");
}

id objc_msgSend_sessionKey(void *a1, const char *a2, ...)
{
  return _[a1 sessionKey];
}

id objc_msgSend_sessionPausedWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionPausedWithTimestamp:");
}

id objc_msgSend_sessionRegistered(void *a1, const char *a2, ...)
{
  return _[a1 sessionRegistered];
}

id objc_msgSend_sessionServiceRequestForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionServiceRequestForFinder:");
}

id objc_msgSend_sessionStartRangingOptionsForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionStartRangingOptionsForFinder:");
}

id objc_msgSend_sessionState(void *a1, const char *a2, ...)
{
  return _[a1 sessionState];
}

id objc_msgSend_sessionSuccessfullyRanWithConfig_withTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionSuccessfullyRanWithConfig:withTimestamp:");
}

id objc_msgSend_sessionSuspensionEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionSuspensionEnded:");
}

id objc_msgSend_sessionTokenForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionTokenForFinder:");
}

id objc_msgSend_sessionWasSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWasSuspended:");
}

id objc_msgSend_setAcceleration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceleration:");
}

id objc_msgSend_setActivationGuard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationGuard:");
}

id objc_msgSend_setActivationResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationResponse:");
}

id objc_msgSend_setActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityType:");
}

id objc_msgSend_setAcwgRangingLimitExceeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcwgRangingLimitExceeded:");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setAdvertiseRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertiseRate:");
}

id objc_msgSend_setAdvertiseRate_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertiseRate:timeout:");
}

id objc_msgSend_setAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertisement:");
}

id objc_msgSend_setAdvertisingAddressChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertisingAddressChangedHandler:");
}

id objc_msgSend_setAdvertisingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertisingState:");
}

id objc_msgSend_setAggregateStateProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAggregateStateProvider:");
}

id objc_msgSend_setAirplaneModeChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAirplaneModeChangedHandler:");
}

id objc_msgSend_setAirplaneModeStatusInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAirplaneModeStatusInternal:");
}

id objc_msgSend_setAlgorithmAidingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlgorithmAidingData:");
}

id objc_msgSend_setAlgorithmAidingData_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlgorithmAidingData:forPeer:");
}

id objc_msgSend_setAlgorithmOutputFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlgorithmOutputFlags:");
}

id objc_msgSend_setAlgorithmSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlgorithmSource:");
}

id objc_msgSend_setAllowedDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedDevices:");
}

id objc_msgSend_setAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchor:");
}

id objc_msgSend_setAntennaDiversityOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAntennaDiversityOverride:");
}

id objc_msgSend_setAntennaMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAntennaMask:");
}

id objc_msgSend_setAopDataHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAopDataHandler:");
}

id objc_msgSend_setAppStateMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppStateMonitor:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAzimuth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAzimuth:");
}

id objc_msgSend_setBackgroundMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundMode:");
}

id objc_msgSend_setBackgroundSupportUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundSupportUpdateHandler:");
}

id objc_msgSend_setBleRSSIThresholdHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleRSSIThresholdHint:");
}

id objc_msgSend_setBleRSSIThresholdOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleRSSIThresholdOrder:");
}

id objc_msgSend_setBleScanRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleScanRate:");
}

id objc_msgSend_setBluetoothAdvertisingAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothAdvertisingAddress:");
}

id objc_msgSend_setBluetoothDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothDeviceIdentifier:");
}

id objc_msgSend_setBluetoothStateChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothStateChangedHandler:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBoundedRegionRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBoundedRegionRange:");
}

id objc_msgSend_setBtAddressData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBtAddressData:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCachedPlatformCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedPlatformCapabilities:");
}

id objc_msgSend_setCameraAssistanceEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraAssistanceEnabled:");
}

id objc_msgSend_setCameraAssistanceInClientProcess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraAssistanceInClientProcess:");
}

id objc_msgSend_setCanRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanRange:");
}

id objc_msgSend_setCancelHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelHandler:");
}

id objc_msgSend_setCarKeyRangingLimitExceeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarKeyRangingLimitExceeded:");
}

id objc_msgSend_setCirPacket1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCirPacket1:");
}

id objc_msgSend_setCirPacket2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCirPacket2:");
}

id objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientIdentifierData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIdentifierData:");
}

id objc_msgSend_setClientIrkData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIrkData:");
}

id objc_msgSend_setClientVoucher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientVoucher:");
}

id objc_msgSend_setClientWantsUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientWantsUpdates:");
}

id objc_msgSend_setCoarseEstimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoarseEstimation:");
}

id objc_msgSend_setConfigType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigType:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlFlags:");
}

id objc_msgSend_setCorrectedRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCorrectedRange:");
}

id objc_msgSend_setCrown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCrown:");
}

id objc_msgSend_setCurrentSolutionMacAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSolutionMacAddress:");
}

id objc_msgSend_setCurrentTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTask:");
}

id objc_msgSend_setCycleIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCycleIndex:");
}

id objc_msgSend_setDataFrame_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataFrame:forPeer:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDebugDisplayInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugDisplayInfo:");
}

id objc_msgSend_setDebugOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugOptions:");
}

id objc_msgSend_setDebugParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugParameters:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationDevice:");
}

id objc_msgSend_setDeviceFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFilter:");
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFoundHandler:");
}

id objc_msgSend_setDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceIdentifier:");
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceLostHandler:");
}

id objc_msgSend_setDevicePresencePreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevicePresencePreset:");
}

id objc_msgSend_setDeviceRelationshipFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceRelationshipFlags:");
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirection:");
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryFlags:");
}

id objc_msgSend_setDiscoveryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryState:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistance:");
}

id objc_msgSend_setDistanceFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistanceFilter:");
}

id objc_msgSend_setDistanceMeasurementQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistanceMeasurementQuality:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setElevation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElevation:");
}

id objc_msgSend_setEnableEPAForLEAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableEPAForLEAdvertisement:");
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndowmentNamespaces:");
}

id objc_msgSend_setEnteredFromActiveFindingUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnteredFromActiveFindingUI:");
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorHandler:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExportedObjectClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObjectClass:");
}

id objc_msgSend_setFindableDiscoveryTokens_tokenGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindableDiscoveryTokens:tokenGroup:");
}

id objc_msgSend_setFindingConfig2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingConfig2:");
}

id objc_msgSend_setFindingConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingConfig:");
}

id objc_msgSend_setFindingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingEnabled:");
}

id objc_msgSend_setFindingPeerToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingPeerToken:");
}

id objc_msgSend_setFindingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingStatus:");
}

id objc_msgSend_setFirstPathIndexPacket1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstPathIndexPacket1:");
}

id objc_msgSend_setFirstPathIndexPacket2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstPathIndexPacket2:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setHeadingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadingFilter:");
}

id objc_msgSend_setHorizontalAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalAccuracy:");
}

id objc_msgSend_setHorizontalAngle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalAngle:");
}

id objc_msgSend_setHorizontalAngleAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalAngleAccuracy:");
}

id objc_msgSend_setImag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImag:");
}

id objc_msgSend_setInputFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputFeatures:");
}

id objc_msgSend_setInsufficientHorizontalSweep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsufficientHorizontalSweep:");
}

id objc_msgSend_setInsufficientLighting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsufficientLighting:");
}

id objc_msgSend_setInsufficientMovement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsufficientMovement:");
}

id objc_msgSend_setInsufficientVerticalSweep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsufficientVerticalSweep:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setInternalState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalState:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterval:");
}

id objc_msgSend_setInvalidationError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationError:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIrkData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIrkData:");
}

id objc_msgSend_setIsFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFinder:");
}

id objc_msgSend_setIsObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsObserver:");
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRunning:");
}

id objc_msgSend_setKeyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyType:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLatestActivityTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestActivityTimestamp:");
}

id objc_msgSend_setLatestActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestActivityType:");
}

id objc_msgSend_setLatestBluetoothState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestBluetoothState:");
}

id objc_msgSend_setLeadingEdgePacket1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeadingEdgePacket1:");
}

id objc_msgSend_setLeadingEdgePacket2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeadingEdgePacket2:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setLocalDeviceCanInteract_withDiscoveryTokens_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceCanInteract:withDiscoveryTokens:reply:");
}

id objc_msgSend_setLocalDeviceDebugParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceDebugParameters:");
}

id objc_msgSend_setLocalDeviceDebugParameters_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceDebugParameters:reply:");
}

id objc_msgSend_setLocalDeviceInteractableDiscoveryTokens_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceInteractableDiscoveryTokens:reply:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLockBtConnHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockBtConnHandle:");
}

id objc_msgSend_setLockIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockIdentifier:");
}

id objc_msgSend_setLongRangeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongRangeEnabled:");
}

id objc_msgSend_setMachAbsoluteTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMachAbsoluteTimestamp:");
}

id objc_msgSend_setMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatching:");
}

id objc_msgSend_setMaxInactivityAfterTrackingBeganSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxInactivityAfterTrackingBeganSeconds:");
}

id objc_msgSend_setMaxInactivityBeforeTrackingBeganSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxInactivityBeforeTrackingBeganSeconds:");
}

id objc_msgSend_setMaxNearbyObjectAge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxNearbyObjectAge:");
}

id objc_msgSend_setMinDurationBetweenInstances_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinDurationBetweenInstances:");
}

id objc_msgSend_setMinimumPreferredUpdatedRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumPreferredUpdatedRate:");
}

id objc_msgSend_setMmsRxStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMmsRxStatus:");
}

id objc_msgSend_setMonitoredRegions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonitoredRegions:");
}

id objc_msgSend_setMonitoringOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonitoringOption:");
}

id objc_msgSend_setMotionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMotionState:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNarrowBandMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNarrowBandMask:");
}

id objc_msgSend_setNbRssi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNbRssi:");
}

id objc_msgSend_setNbRxStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNbRxStatus:");
}

id objc_msgSend_setNbUwbAcquisitionChannelIdx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNbUwbAcquisitionChannelIdx:");
}

id objc_msgSend_setNearbyActionFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionFlags:");
}

id objc_msgSend_setNearbyActionNWPrecisionFindingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionNWPrecisionFindingStatus:");
}

id objc_msgSend_setNearbyActionNoWakeAuthTagData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionNoWakeAuthTagData:");
}

id objc_msgSend_setNearbyActionNoWakeConfigData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionNoWakeConfigData:");
}

id objc_msgSend_setNearbyActionNoWakeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionNoWakeType:");
}

id objc_msgSend_setNearbyActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionType:");
}

id objc_msgSend_setNumCharacteristicsLeftToRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumCharacteristicsLeftToRead:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObservationRegistrar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObservationRegistrar:");
}

id objc_msgSend_setOobKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOobKeys:");
}

id objc_msgSend_setOutProbabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutProbabilities:");
}

id objc_msgSend_setOutputs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputs:");
}

id objc_msgSend_setPassiveAccessIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassiveAccessIntent:");
}

id objc_msgSend_setPeerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerIdentifier:");
}

id objc_msgSend_setPeerLostCallbackReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerLostCallbackReceived:");
}

id objc_msgSend_setPeersEligibleForDiscovery_requestScan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeersEligibleForDiscovery:requestScan:");
}

id objc_msgSend_setPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeripheral:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setPreferredUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredUpdateRate:");
}

id objc_msgSend_setPressure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPressure:");
}

id objc_msgSend_setPreventsDeviceSleep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreventsDeviceSleep:");
}

id objc_msgSend_setPrewarmSecureElementChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrewarmSecureElementChannel:");
}

id objc_msgSend_setPrewarmUWB_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrewarmUWB:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtocolVersion:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQuaternion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQuaternion:");
}

id objc_msgSend_setRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRange:");
}

id objc_msgSend_setRangeBiasEstimate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangeBiasEstimate:");
}

id objc_msgSend_setRangeError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangeError:");
}

id objc_msgSend_setRangeUncertainty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangeUncertainty:");
}

id objc_msgSend_setRangingActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangingActive:");
}

id objc_msgSend_setRangingRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangingRetryCount:");
}

id objc_msgSend_setRangingRetryTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangingRetryTimer:");
}

id objc_msgSend_setRangingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangingSession:");
}

id objc_msgSend_setRangingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangingState:");
}

id objc_msgSend_setRawRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRawRange:");
}

id objc_msgSend_setReadingMultiConfigCharacteristics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReadingMultiConfigCharacteristics:");
}

id objc_msgSend_setReal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReal:");
}

id objc_msgSend_setReceivedSignalFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedSignalFlags:");
}

id objc_msgSend_setRegionSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegionSizeCategory:");
}

id objc_msgSend_setRegulatoryLocationAuthorized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegulatoryLocationAuthorized:");
}

id objc_msgSend_setRegulatoryLocationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegulatoryLocationHandler:");
}

id objc_msgSend_setRelationship_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelationship:");
}

id objc_msgSend_setRelativeAltitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelativeAltitude:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoteTxAntennaMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteTxAntennaMask:");
}

id objc_msgSend_setRepeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepeats:");
}

id objc_msgSend_setRequiresBiasCorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresBiasCorrection:");
}

id objc_msgSend_setRequiresUserIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresUserIntent:");
}

id objc_msgSend_setResetARSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResetARSession:");
}

id objc_msgSend_setResetHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResetHandler:");
}

id objc_msgSend_setResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponder:");
}

id objc_msgSend_setRevokeFindingExperience_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRevokeFindingExperience:");
}

id objc_msgSend_setRotationRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotationRate:");
}

id objc_msgSend_setRssi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRssi:");
}

id objc_msgSend_setRssiDbm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRssiDbm:");
}

id objc_msgSend_setRttInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRttInitiator:");
}

id objc_msgSend_setRttResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRttResponder:");
}

id objc_msgSend_setRxAntennaPacket1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRxAntennaPacket1:");
}

id objc_msgSend_setRxAntennaPacket2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRxAntennaPacket2:");
}

id objc_msgSend_setScanRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanRate:");
}

id objc_msgSend_setService_forToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:forToken:");
}

id objc_msgSend_setSessionKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionKey:");
}

id objc_msgSend_setShouldWakeDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldWakeDevice:");
}

id objc_msgSend_setSignalStrength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignalStrength:");
}

id objc_msgSend_setSignallingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignallingData:");
}

id objc_msgSend_setSignallingData_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignallingData:forPeer:");
}

id objc_msgSend_setSoiRssiDbm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoiRssiDbm:");
}

id objc_msgSend_setSpecifiedToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiedToken:");
}

id objc_msgSend_setStateChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateChangeHandler:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setSupportedTechnologies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedTechnologies:");
}

id objc_msgSend_setSupportsCameraAssistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsCameraAssistance:");
}

id objc_msgSend_setSystemOverrideHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemOverrideHandler:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return _[a1 setTaskCompleted];
}

id objc_msgSend_setTatInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTatInitiator:");
}

id objc_msgSend_setTatResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTatResponder:");
}

id objc_msgSend_setTellClientAboutPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTellClientAboutPeer:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeoutOnPeerInactivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutOnPeerInactivity:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setToaNoiseRms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToaNoiseRms:");
}

id objc_msgSend_setToaPpwinPeak_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToaPpwinPeak:");
}

id objc_msgSend_setToaPpwinRms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToaPpwinRms:");
}

id objc_msgSend_setTofPicSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTofPicSecond:");
}

id objc_msgSend_setTolerance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTolerance:");
}

id objc_msgSend_setUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUUID:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUpdatesPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatesPolicy:");
}

id objc_msgSend_setUseCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseCase:");
}

id objc_msgSend_setUwbConfigData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbConfigData:");
}

id objc_msgSend_setUwbExtendedDistanceAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbExtendedDistanceAvailability:");
}

id objc_msgSend_setUwbPreciseDistanceAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbPreciseDistanceAvailability:");
}

id objc_msgSend_setUwbSignalFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbSignalFeatures:");
}

id objc_msgSend_setUwbTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbTime:");
}

id objc_msgSend_setUwbTokenFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbTokenFlags:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVehicleIdentifier:");
}

id objc_msgSend_setVerticalDirectionEstimate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerticalDirectionEstimate:");
}

id objc_msgSend_setWifiRangingActiveAdvertisement(void *a1, const char *a2, ...)
{
  return _[a1 setWifiRangingActiveAdvertisement];
}

id objc_msgSend_setWiproxStateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiproxStateHandler:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWorldPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorldPosition:");
}

id objc_msgSend_setWrist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWrist:");
}

id objc_msgSend_setupActivityInterval(void *a1, const char *a2, ...)
{
  return _[a1 setupActivityInterval];
}

id objc_msgSend_setupBackoffResumeManager(void *a1, const char *a2, ...)
{
  return _[a1 setupBackoffResumeManager];
}

id objc_msgSend_setupXPCListeners(void *a1, const char *a2, ...)
{
  return _[a1 setupXPCListeners];
}

id objc_msgSend_shareableConfigData(void *a1, const char *a2, ...)
{
  return _[a1 shareableConfigData];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedObserver(void *a1, const char *a2, ...)
{
  return _[a1 sharedObserver];
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return _[a1 sharedPairingAgent];
}

id objc_msgSend_sharedProtocol(void *a1, const char *a2, ...)
{
  return _[a1 sharedProtocol];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedProvider];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_sharedServicePrintableState(void *a1, const char *a2, ...)
{
  return _[a1 sharedServicePrintableState];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return _[a1 sharedSettings];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return _[a1 shortDescription];
}

id objc_msgSend_shortDeviceAddress(void *a1, const char *a2, ...)
{
  return _[a1 shortDeviceAddress];
}

id objc_msgSend_shouldAcceptNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptNewConnection:");
}

id objc_msgSend_shouldAttemptMerging(void *a1, const char *a2, ...)
{
  return _[a1 shouldAttemptMerging];
}

id objc_msgSend_shouldBypassBleDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 shouldBypassBleDiscovery];
}

id objc_msgSend_shouldInformMutualAuthFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldInformMutualAuthFailure:");
}

id objc_msgSend_shouldInitiate_peerDiscoveryToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldInitiate:peerDiscoveryToken:error:");
}

id objc_msgSend_signalEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 signalEnvironment];
}

id objc_msgSend_signalEnvironmentType(void *a1, const char *a2, ...)
{
  return _[a1 signalEnvironmentType];
}

id objc_msgSend_signalStrength(void *a1, const char *a2, ...)
{
  return _[a1 signalStrength];
}

id objc_msgSend_signingIdentity(void *a1, const char *a2, ...)
{
  return _[a1 signingIdentity];
}

id objc_msgSend_sipHashForIRK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sipHashForIRK:");
}

id objc_msgSend_soiRssiDbm(void *a1, const char *a2, ...)
{
  return _[a1 soiRssiDbm];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_spatialInteractionFlags(void *a1, const char *a2, ...)
{
  return _[a1 spatialInteractionFlags];
}

id objc_msgSend_spatialInteractionTokenData(void *a1, const char *a2, ...)
{
  return _[a1 spatialInteractionTokenData];
}

id objc_msgSend_spatialInteractionUWBConfigData(void *a1, const char *a2, ...)
{
  return _[a1 spatialInteractionUWBConfigData];
}

id objc_msgSend_spatialInteractionUWBTokenFlags(void *a1, const char *a2, ...)
{
  return _[a1 spatialInteractionUWBTokenFlags];
}

id objc_msgSend_spatialScore(void *a1, const char *a2, ...)
{
  return _[a1 spatialScore];
}

id objc_msgSend_specifiedToken(void *a1, const char *a2, ...)
{
  return _[a1 specifiedToken];
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return _[a1 speed];
}

id objc_msgSend_speedAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 speedAccuracy];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startAdvertising(void *a1, const char *a2, ...)
{
  return _[a1 startAdvertising];
}

id objc_msgSend_startAdvertisingAsFinder_toPeer_withAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAdvertisingAsFinder:toPeer:withAdvertisement:");
}

id objc_msgSend_startAdvertisingBurstForDeviceDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 startAdvertisingBurstForDeviceDiscovery];
}

id objc_msgSend_startAdvertisingToPeer_advertisement_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAdvertisingToPeer:advertisement:timeout:");
}

id objc_msgSend_startBTScanningWithMaxRateForPrototypeHomeSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startBTScanningWithMaxRateForPrototypeHomeSession:");
}

id objc_msgSend_startBeingFindableWithDiscoveryTokens_tokenGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startBeingFindableWithDiscoveryTokens:tokenGroup:");
}

id objc_msgSend_startDeviceFindingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 startDeviceFindingUpdates];
}

id objc_msgSend_startHighPriorityScanningForToken_forConsumer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startHighPriorityScanningForToken:forConsumer:");
}

id objc_msgSend_startLeechingForConsumer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLeechingForConsumer:");
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 startMonitoring];
}

id objc_msgSend_startMonitoringEventType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMonitoringEventType:error:");
}

id objc_msgSend_startObserving_observeImmediately_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObserving:observeImmediately:callback:");
}

id objc_msgSend_startOptions(void *a1, const char *a2, ...)
{
  return _[a1 startOptions];
}

id objc_msgSend_startRangingMangagerAndCompanion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRangingMangagerAndCompanion:");
}

id objc_msgSend_startRangingWithPeer_technology_peerAdvertisement_OOBRangingParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:");
}

id objc_msgSend_startScanning(void *a1, const char *a2, ...)
{
  return _[a1 startScanning];
}

id objc_msgSend_startScanningWithBurstPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startScanningWithBurstPeriod:");
}

id objc_msgSend_startServices(void *a1, const char *a2, ...)
{
  return _[a1 startServices];
}

id objc_msgSend_startUpdatingHeading(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingHeading];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingLocation];
}

id objc_msgSend_startedDiscoveringPeersWithTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedDiscoveringPeersWithTokens:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return _[a1 statusFlags];
}

id objc_msgSend_stopAdvertising(void *a1, const char *a2, ...)
{
  return _[a1 stopAdvertising];
}

id objc_msgSend_stopAdvertisingAsFinder_toPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAdvertisingAsFinder:toPeer:");
}

id objc_msgSend_stopAdvertisingToPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAdvertisingToPeer:");
}

id objc_msgSend_stopAndClearState(void *a1, const char *a2, ...)
{
  return _[a1 stopAndClearState];
}

id objc_msgSend_stopBTScanningWithMaxRateForPrototypeHomeSession(void *a1, const char *a2, ...)
{
  return _[a1 stopBTScanningWithMaxRateForPrototypeHomeSession];
}

id objc_msgSend_stopBeingFindableWithDiscoveryTokens_tokenGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopBeingFindableWithDiscoveryTokens:tokenGroup:");
}

id objc_msgSend_stopDeviceFindingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopDeviceFindingUpdates];
}

id objc_msgSend_stopHighPriorityScanning(void *a1, const char *a2, ...)
{
  return _[a1 stopHighPriorityScanning];
}

id objc_msgSend_stopLeechingForConsumer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopLeechingForConsumer:");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoring];
}

id objc_msgSend_stopRanging(void *a1, const char *a2, ...)
{
  return _[a1 stopRanging];
}

id objc_msgSend_stopRangingMangagerAndCompanion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopRangingMangagerAndCompanion:");
}

id objc_msgSend_stopRangingWithPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopRangingWithPeer:");
}

id objc_msgSend_stopScanningAndRemovePeers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopScanningAndRemovePeers:");
}

id objc_msgSend_stopUpdatingHeading(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdatingHeading];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdatingLocation];
}

id objc_msgSend_stoppedDiscoveringAllPeers(void *a1, const char *a2, ...)
{
  return _[a1 stoppedDiscoveringAllPeers];
}

id objc_msgSend_stoppedDiscoveringPeersWithTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stoppedDiscoveringPeersWithTokens:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_submitAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 submitAnalytics];
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitTaskRequest:error:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_supportedTechnologies(void *a1, const char *a2, ...)
{
  return _[a1 supportedTechnologies];
}

id objc_msgSend_supportsAoA(void *a1, const char *a2, ...)
{
  return _[a1 supportsAoA];
}

id objc_msgSend_supportsBackgroundedClients(void *a1, const char *a2, ...)
{
  return _[a1 supportsBackgroundedClients];
}

id objc_msgSend_supportsCameraAssistance(void *a1, const char *a2, ...)
{
  return _[a1 supportsCameraAssistance];
}

id objc_msgSend_supportsDevicePresence(void *a1, const char *a2, ...)
{
  return _[a1 supportsDevicePresence];
}

id objc_msgSend_supportsDirectionMeasurement(void *a1, const char *a2, ...)
{
  return _[a1 supportsDirectionMeasurement];
}

id objc_msgSend_supportsExtendedDistanceMeasurement(void *a1, const char *a2, ...)
{
  return _[a1 supportsExtendedDistanceMeasurement];
}

id objc_msgSend_supportsNBAMMS(void *a1, const char *a2, ...)
{
  return _[a1 supportsNBAMMS];
}

id objc_msgSend_supportsPreciseDistanceMeasurement(void *a1, const char *a2, ...)
{
  return _[a1 supportsPreciseDistanceMeasurement];
}

id objc_msgSend_supportsSessionObservers(void *a1, const char *a2, ...)
{
  return _[a1 supportsSessionObservers];
}

id objc_msgSend_supportsSyntheticAperture(void *a1, const char *a2, ...)
{
  return _[a1 supportsSyntheticAperture];
}

id objc_msgSend_supportsUWB(void *a1, const char *a2, ...)
{
  return _[a1 supportsUWB];
}

id objc_msgSend_suspendAcwgRanging_withSuspendTriggerReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendAcwgRanging:withSuspendTriggerReason:");
}

id objc_msgSend_suspensionPolicy(void *a1, const char *a2, ...)
{
  return _[a1 suspensionPolicy];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_systemConfigurator_didUpdateResourceUsageLimitExceeded_forSessionConfigurationType_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemConfigurator:didUpdateResourceUsageLimitExceeded:forSessionConfigurationType:");
}

id objc_msgSend_systemConfigurator_didUpdateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemConfigurator:didUpdateState:");
}

id objc_msgSend_systemDidUpdateResourceUsageLimitExceeded_forSessionConfigurationTypeWithName_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemDidUpdateResourceUsageLimitExceeded:forSessionConfigurationTypeWithName:");
}

id objc_msgSend_systemDidUpdateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemDidUpdateState:");
}

id objc_msgSend_systemKeyRelationship(void *a1, const char *a2, ...)
{
  return _[a1 systemKeyRelationship];
}

id objc_msgSend_systemOverrideFlags(void *a1, const char *a2, ...)
{
  return _[a1 systemOverrideFlags];
}

id objc_msgSend_systemOverrideNotification(void *a1, const char *a2, ...)
{
  return _[a1 systemOverrideNotification];
}

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithPid:");
}

id objc_msgSend_taskRequestForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskRequestForIdentifier:");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _[a1 taskState];
}

id objc_msgSend_tatInitiator(void *a1, const char *a2, ...)
{
  return _[a1 tatInitiator];
}

id objc_msgSend_tatResponder(void *a1, const char *a2, ...)
{
  return _[a1 tatResponder];
}

id objc_msgSend_tellClientAboutPeer(void *a1, const char *a2, ...)
{
  return _[a1 tellClientAboutPeer];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return _[a1 terminate];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeOfLatestConnectionState(void *a1, const char *a2, ...)
{
  return _[a1 timeOfLatestConnectionState];
}

id objc_msgSend_timeOfLatestSessionLifecycleChange(void *a1, const char *a2, ...)
{
  return _[a1 timeOfLatestSessionLifecycleChange];
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_timeoutOnPeerInactivity(void *a1, const char *a2, ...)
{
  return _[a1 timeoutOnPeerInactivity];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_toBitmap(void *a1, const char *a2, ...)
{
  return _[a1 toBitmap];
}

id objc_msgSend_toStruct(void *a1, const char *a2, ...)
{
  return _[a1 toStruct];
}

id objc_msgSend_toaNoiseRms(void *a1, const char *a2, ...)
{
  return _[a1 toaNoiseRms];
}

id objc_msgSend_toaPpwinPeak(void *a1, const char *a2, ...)
{
  return _[a1 toaPpwinPeak];
}

id objc_msgSend_toaPpwinRms(void *a1, const char *a2, ...)
{
  return _[a1 toaPpwinRms];
}

id objc_msgSend_tofPicSecond(void *a1, const char *a2, ...)
{
  return _[a1 tofPicSecond];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_tokenData(void *a1, const char *a2, ...)
{
  return _[a1 tokenData];
}

id objc_msgSend_tokenVariant(void *a1, const char *a2, ...)
{
  return _[a1 tokenVariant];
}

id objc_msgSend_trackingState(void *a1, const char *a2, ...)
{
  return _[a1 trackingState];
}

id objc_msgSend_transmitPowerOne(void *a1, const char *a2, ...)
{
  return _[a1 transmitPowerOne];
}

id objc_msgSend_transmitPowerThree(void *a1, const char *a2, ...)
{
  return _[a1 transmitPowerThree];
}

id objc_msgSend_transmitPowerTwo(void *a1, const char *a2, ...)
{
  return _[a1 transmitPowerTwo];
}

id objc_msgSend_triggerEnhancedDiscovery_useCase_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerEnhancedDiscovery:useCase:completion:");
}

id objc_msgSend_trueHeading(void *a1, const char *a2, ...)
{
  return _[a1 trueHeading];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_u64Identifier(void *a1, const char *a2, ...)
{
  return _[a1 u64Identifier];
}

id objc_msgSend_uncacheDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uncacheDevice:");
}

id objc_msgSend_uncacheDeviceByTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uncacheDeviceByTokenData:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_uniqueIdentifierForEngine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifierForEngine:");
}

id objc_msgSend_unpublish(void *a1, const char *a2, ...)
{
  return _[a1 unpublish];
}

id objc_msgSend_unregisterForInternalBluetoothSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForInternalBluetoothSamples:");
}

id objc_msgSend_unregisterForVisionInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForVisionInput:");
}

id objc_msgSend_unregisterNBAMMSSessionForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterNBAMMSSessionForToken:");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedShortValue];
}

id objc_msgSend_updateAlgorithmAidingData_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAlgorithmAidingData:token:");
}

id objc_msgSend_updateAltimeterData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAltimeterData:");
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfiguration:");
}

id objc_msgSend_updateDeviceMotion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDeviceMotion:");
}

id objc_msgSend_updateDistanceAnalytics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDistanceAnalytics:");
}

id objc_msgSend_updateLocationAuthorized(void *a1, const char *a2, ...)
{
  return _[a1 updateLocationAuthorized];
}

id objc_msgSend_updatePeerData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePeerData:");
}

id objc_msgSend_updatePeerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePeerState:");
}

id objc_msgSend_updateRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRanging:");
}

id objc_msgSend_updateSignallingData_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSignallingData:token:");
}

id objc_msgSend_updateTimeAnalytics_currentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTimeAnalytics:currentTime:");
}

id objc_msgSend_updateWatchOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWatchOrientation:");
}

id objc_msgSend_updateWithAcquisitionReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithAcquisitionReason:");
}

id objc_msgSend_updateWithFindeePeerData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFindeePeerData:");
}

id objc_msgSend_updateWithFindeeRequestAt0Finder2Findee_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFindeeRequestAt0Finder2Findee:");
}

id objc_msgSend_updateWithFindeeRequestAt1Finder1Findee_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFindeeRequestAt1Finder1Findee:");
}

id objc_msgSend_updateWithFindeeRequestAt1Finder2Findee_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFindeeRequestAt1Finder2Findee:");
}

id objc_msgSend_updateWithFinderPeerData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFinderPeerData:");
}

id objc_msgSend_updateWithFinderRequestAt0Finder2Findee_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFinderRequestAt0Finder2Findee:");
}

id objc_msgSend_updateWithMissedRange(void *a1, const char *a2, ...)
{
  return _[a1 updateWithMissedRange];
}

id objc_msgSend_updateWithMostRecentDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithMostRecentDistance:");
}

id objc_msgSend_updateWithMostRecentRawDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithMostRecentRawDistance:");
}

id objc_msgSend_updateWithPDR_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPDR:");
}

id objc_msgSend_updateWithPeerLocationFromFMF(void *a1, const char *a2, ...)
{
  return _[a1 updateWithPeerLocationFromFMF];
}

id objc_msgSend_updateWithPose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPose:");
}

id objc_msgSend_updateWithRangeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithRangeResult:");
}

id objc_msgSend_updateWithSASolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithSASolution:");
}

id objc_msgSend_updateWithSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithSolution:");
}

id objc_msgSend_updateWithSuccessfulRange_uwbRSSI_nbRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithSuccessfulRange:uwbRSSI:nbRSSI:");
}

id objc_msgSend_updateWithVIOPose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithVIOPose:");
}

id objc_msgSend_updatesEngine(void *a1, const char *a2, ...)
{
  return _[a1 updatesEngine];
}

id objc_msgSend_updatesEngine_didUpdateAlgorithmConvergenceState_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesEngine:didUpdateAlgorithmConvergenceState:forObject:");
}

id objc_msgSend_updatesEngine_didUpdateFindeeData_forToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesEngine:didUpdateFindeeData:forToken:");
}

id objc_msgSend_updatesEngine_didUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesEngine:didUpdateNearbyObjects:");
}

id objc_msgSend_updatesEngine_object_didUpdateRegion_previousRegion_regionTransitionSuppressed_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:");
}

id objc_msgSend_updatesPolicy(void *a1, const char *a2, ...)
{
  return _[a1 updatesPolicy];
}

id objc_msgSend_updatesQueue(void *a1, const char *a2, ...)
{
  return _[a1 updatesQueue];
}

id objc_msgSend_useCase(void *a1, const char *a2, ...)
{
  return _[a1 useCase];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_uwbConfigData(void *a1, const char *a2, ...)
{
  return _[a1 uwbConfigData];
}

id objc_msgSend_uwbExtendedDistanceAvailability(void *a1, const char *a2, ...)
{
  return _[a1 uwbExtendedDistanceAvailability];
}

id objc_msgSend_uwbPreciseDistanceAvailability(void *a1, const char *a2, ...)
{
  return _[a1 uwbPreciseDistanceAvailability];
}

id objc_msgSend_uwbProvider(void *a1, const char *a2, ...)
{
  return _[a1 uwbProvider];
}

id objc_msgSend_uwbResource(void *a1, const char *a2, ...)
{
  return _[a1 uwbResource];
}

id objc_msgSend_uwbSessionDidFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbSessionDidFailWithError:");
}

id objc_msgSend_uwbSessionDidInvalidateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbSessionDidInvalidateWithError:");
}

id objc_msgSend_uwbSessionId(void *a1, const char *a2, ...)
{
  return _[a1 uwbSessionId];
}

id objc_msgSend_uwbSessionInterruptedWithReason_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbSessionInterruptedWithReason:timestamp:");
}

id objc_msgSend_uwbSessionInterruptionReasonEnded_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbSessionInterruptionReasonEnded:timestamp:");
}

id objc_msgSend_uwbSignalFeatures(void *a1, const char *a2, ...)
{
  return _[a1 uwbSignalFeatures];
}

id objc_msgSend_uwbTime(void *a1, const char *a2, ...)
{
  return _[a1 uwbTime];
}

id objc_msgSend_uwbTokenFlags(void *a1, const char *a2, ...)
{
  return _[a1 uwbTokenFlags];
}

id objc_msgSend_validateClientEntitlements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateClientEntitlements:");
}

id objc_msgSend_validateClientPermissions(void *a1, const char *a2, ...)
{
  return _[a1 validateClientPermissions];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_vehicleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 vehicleIdentifier];
}

id objc_msgSend_verticalAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 verticalAccuracy];
}

id objc_msgSend_verticalDirectionEstimate(void *a1, const char *a2, ...)
{
  return _[a1 verticalDirectionEstimate];
}

id objc_msgSend_verticalState(void *a1, const char *a2, ...)
{
  return _[a1 verticalState];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_wifiProvider(void *a1, const char *a2, ...)
{
  return _[a1 wifiProvider];
}

id objc_msgSend_wifiRangingRangeError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiRangingRangeError:");
}

id objc_msgSend_wifiRangingReadiness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiRangingReadiness:");
}

id objc_msgSend_wifiResource(void *a1, const char *a2, ...)
{
  return _[a1 wifiResource];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_worldPosition(void *a1, const char *a2, ...)
{
  return _[a1 worldPosition];
}

id objc_msgSend_writeItem_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeItem:synchronizable:systemKeychain:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}