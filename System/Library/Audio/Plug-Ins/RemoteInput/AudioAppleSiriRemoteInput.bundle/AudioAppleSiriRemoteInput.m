void sub_1F78(char *category)
{
  os_log_t v1;
  void *v2;
  v1 = os_log_create("com.apple.bluetooth", category);
  v2 = (void *)qword_D420;
  qword_D420 = (uint64_t)v1;
}

void sub_21B4(_Unwind_Exception *a1)
{
}

void sub_290C(_Unwind_Exception *a1)
{
}

void sub_2A80(_Unwind_Exception *a1)
{
}

id sub_2EFC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleEvent:a2];
}

void sub_32A4(_Unwind_Exception *a1)
{
}

LABEL_11:
  objc_sync_exit(v6);
  return v8;
}

void sub_3440(_Unwind_Exception *a1)
{
}

void sub_34DC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_3510( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_3520( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}
}

void sub_4D70( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_4D90( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_4DA0(id a1)
{
  return a1;
}

  ;
}

void sub_4DB4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_4DC0()
{
  return v0;
}

  ;
}

  ;
}

void sub_4DE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4E14( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4E48()
{
}

void sub_4EAC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4F10( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4F74()
{
}

void sub_4FD8(void *a1)
{
  id v2 = [(id)sub_4DC0() description];
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_4DA8();
  sub_4D70(&dword_0, v4, v5, "Unknown device info %@", v6, v7, v8, v9, v10);

  sub_4D84();
}

void sub_5058()
{
}

void sub_50BC()
{
}

void sub_5120()
{
}

void sub_518C(void *a1)
{
  id v2 = [(id)sub_4DC0() identifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_4DA8();
  sub_4D70(&dword_0, v4, v5, "Could not find service for identifier %@", v6, v7, v8, v9, v10);

  sub_4D84();
}

void sub_520C(void *a1)
{
  id v2 = [(id)sub_4DC0() identifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_4DA8();
  sub_4D70(&dword_0, v4, v5, "Identifier %@ audio format was not initialized properly", v6, v7, v8, v9, v10);

  sub_4D84();
}

void sub_528C(unsigned __int16 a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 1024;
  int v6 = a1;
  sub_4DB4(&dword_0, a3, (uint64_t)a3, "Received BufferLength %ld is shorter than FrameLength %d", (uint8_t *)&v3);
  sub_3508();
}

void sub_5308()
{
  __int16 v3 = 2048;
  uint64_t v4 = 94LL;
  sub_4DB4(&dword_0, v0, v1, "Opus buffer length(%d) is bigger than max size(%lu)", v2);
  sub_3508();
}

void sub_5380(void *a1)
{
  sub_4D84();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__RequestSiriAudioConnection(void *a1, const char *a2, ...)
{
  return _[a1 _RequestSiriAudioConnection];
}

id objc_msgSend__audioBufferForFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_audioBufferForFrame:");
}

id objc_msgSend__audioTimeForFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_audioTimeForFrame:");
}

id objc_msgSend__checkIn(void *a1, const char *a2, ...)
{
  return _[a1 _checkIn];
}

id objc_msgSend__gainForDoapFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gainForDoapFrame:");
}

id objc_msgSend__gainForFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gainForFrame:");
}

id objc_msgSend__gainForTVRemoteFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gainForTVRemoteFrame:");
}

id objc_msgSend__handleError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleError:");
}

id objc_msgSend__handleMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMsg:");
}

id objc_msgSend__handlePublishMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePublishMsg:");
}

id objc_msgSend__inputDeviceForArgs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inputDeviceForArgs:");
}

id objc_msgSend__processAudioFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processAudioFrame:");
}

id objc_msgSend__qualityForSpeexFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_qualityForSpeexFrame:");
}

id objc_msgSend__supportedFormats(void *a1, const char *a2, ...)
{
  return _[a1 _supportedFormats];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_audioInputBlock(void *a1, const char *a2, ...)
{
  return _[a1 audioInputBlock];
}

id objc_msgSend_codec(void *a1, const char *a2, ...)
{
  return _[a1 codec];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return _[a1 format];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getMatchingDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMatchingDict:");
}

id objc_msgSend_handleAudioFrameMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAudioFrameMsg:");
}

id objc_msgSend_handleStreamDidCancelMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStreamDidCancelMsg:");
}

id objc_msgSend_handleTransportDidStartMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTransportDidStartMsg:");
}

id objc_msgSend_handleTransportDidStopMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTransportDidStopMsg:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithFormat_packetCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:packetCapacity:");
}

id objc_msgSend_initWithFormat_packetCapacity_maximumPacketSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:packetCapacity:maximumPacketSize:");
}

id objc_msgSend_initWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInfo:");
}

id objc_msgSend_initWithSampleTime_atRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSampleTime:atRate:");
}

id objc_msgSend_initWithStreamDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStreamDescription:");
}

id objc_msgSend_inputDevices(void *a1, const char *a2, ...)
{
  return _[a1 inputDevices];
}

id objc_msgSend_inputPlugin_didPublishDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputPlugin:didPublishDevice:");
}

id objc_msgSend_inputPlugin_didUnpublishDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputPlugin:didUnpublishDevice:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_packetDescriptions(void *a1, const char *a2, ...)
{
  return _[a1 packetDescriptions];
}

id objc_msgSend_pidNum(void *a1, const char *a2, ...)
{
  return _[a1 pidNum];
}

id objc_msgSend_plugin(void *a1, const char *a2, ...)
{
  return _[a1 plugin];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_resolvedDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 resolvedDeviceIdentifier];
}

id objc_msgSend_sendMsg_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMsg:args:");
}

id objc_msgSend_sendSyncMsg_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSyncMsg:args:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPacketCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPacketCount:");
}

id objc_msgSend_setPlugin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlugin:");
}

id objc_msgSend_setResolvedDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResolvedDeviceIdentifier:");
}

id objc_msgSend_setStartCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartCompletionBlock:");
}

id objc_msgSend_setStatusChangeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusChangeBlock:");
}

id objc_msgSend_setStopCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStopCompletionBlock:");
}

id objc_msgSend_startCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 startCompletionBlock];
}

id objc_msgSend_statusChangeBlock(void *a1, const char *a2, ...)
{
  return _[a1 statusChangeBlock];
}

id objc_msgSend_stopCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 stopCompletionBlock];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_supportedFormats(void *a1, const char *a2, ...)
{
  return _[a1 supportedFormats];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedShortValue];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnection];
}