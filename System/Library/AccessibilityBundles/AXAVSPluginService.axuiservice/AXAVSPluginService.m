}

void sub_1778(_Unwind_Exception *a1)
{
}

void sub_1798(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateDisplayOnState];
    id WeakRetained = v2;
  }
}

void sub_1964( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_198C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _monitorAVSSupport];
}

void sub_19B8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if ((byte_8B50 & 1) == 0)
    {
      uint64_t v3 = objc_opt_class(&OBJC_CLASS___AXAVSPluginService);
      if ((objc_opt_isKindOfClass(a2, v3) & 1) == 0) {
        return;
      }
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_2270;
      v4[3] = &unk_4288;
      v4[4] = a2;
      AXPerformBlockAsynchronouslyOnMainThread(v4);
    }

    byte_8B50 = 1;
  }

void sub_1DC0(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  id v7 =  [v6 showAlertWithText:v5 subtitleText:v8 iconImage:0 type:6 priority:30 duration:*(void *)(a1 + 32) forService:3.0];
}

id sub_1F84(uint64_t a1)
{
  return [*(id *)(a1 + 32) _monitorAVSPausingSupport];
}

id sub_2270(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) avsShouldBeOn];
  if ((_DWORD)result) {
    return [*(id *)(a1 + 32) _monitorAVSSupport];
  }
  return result;
}

void sub_22A8(uint64_t a1, void *a2, os_log_s *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", *a2));
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "Display status ambiguous: notify_get_state status %@ != NOTIFY_STATUS_OK and state == %@",  (uint8_t *)&v7,  0x16u);
}

void sub_2378(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Fail to register for screen state change", v1, 2u);
}

void sub_23B8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Received message: Startup", v1, 2u);
}

void sub_23F8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error reading file into buffer", v1, 2u);
}

id objc_msgSend_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertWithText:subtitleText:iconImage:type:priority:duration:forService:");
}

id objc_msgSend_stopListening(void *a1, const char *a2, ...)
{
  return [a1 stopListening];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVSTriggerController sharedInstance](&OBJC_CLASS___AVSTriggerController, "sharedInstance"));
  [v6 startListening];
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));

  id v8 = -[AVAudioFile initForReading:commonFormat:interleaved:error:]( objc_alloc(&OBJC_CLASS___AVAudioFile),  "initForReading:commonFormat:interleaved:error:",  v7,  3LL,  0LL,  0LL);
  __int16 v9 = -[AVAudioFile length](v8, "length");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AVAudioFile processingFormat](v8, "processingFormat"));
  [v10 sampleRate];
  v12 = v11;

  v13 = -[AVAudioFile length](v8, "length");
  v14 = objc_alloc(&OBJC_CLASS___AVAudioPCMBuffer);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AVAudioFile processingFormat](v8, "processingFormat"));
  v16 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:](v14, "initWithPCMFormat:frameCapacity:", v15, v9);

  if (-[AVAudioFile readIntoBuffer:error:](v8, "readIntoBuffer:error:", v16, 0LL))
  {
    v17 = (double)v13 / v12;
    v18 = [v6 handleAudioBufferInput:v16 time:mach_absolute_time()];
    v19 = AXLogAVS(v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134217984;
      v25 = v17;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "Audio length is %f seconds, will sleep for that duration",  (uint8_t *)&v24,  0xCu);
    }

    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", v17);
    v21 = AXLogAVS([v6 stopListening]);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Finished piping audio from file to AVS", (uint8_t *)&v24, 2u);
    }
  }

  else
  {
    v23 = ((uint64_t (*)(void))AXLogAVS)();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_23F8(v22);
    }
  }
}

- (AXPluginDisplayOnMonitor)displayOnMonitor
{
  return self->_displayOnMonitor;
}

- (void)setDisplayOnMonitor:(id)a3
{
}

- (UIViewController)vocalShortcutsViewController
{
  return self->_vocalShortcutsViewController;
}

- (void)setVocalShortcutsViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end