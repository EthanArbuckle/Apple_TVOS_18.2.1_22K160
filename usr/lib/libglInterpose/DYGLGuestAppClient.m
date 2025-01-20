@interface DYGLGuestAppClient
- (BOOL)_canTriggerCaptureOnNextGraphicsCommand;
- (BOOL)armCaptureWithDescriptor:(id)a3;
- (BOOL)startCaptureWithDescriptor:(id)a3;
- (BOOL)triggerCaptureOnNextGLCommand;
- (id)_copyContextsInfo;
- (void)_appendLinkTimeLibrariesToVersionsDictionary:(id)a3;
- (void)_appendToAllCaptureDataSentMessagePayload:(id)a3;
- (void)_armCaptureWithTransportMessage:(id)a3;
- (void)_handleTurnOffCapture;
- (void)_handleTurnOnCapture;
- (void)_populateQueueAndThreadLabelMaps;
- (void)_waitForGraphicsThreads;
- (void)processMessage:(id)a3;
- (void)sendContextInfoUpdate;
- (void)setTraceMode:(int)a3;
@end

@implementation DYGLGuestAppClient

- (void)setTraceMode:(int)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DYGLGuestAppClient;
  id v5 = -[DYGLGuestAppClient setTraceMode:](&v11, "setTraceMode:");
  v6 = choose_dispatch_table((uint64_t)v5);
  BOOL v7 = (a3 & 0xFFFFFFFE) != 4 || gCheckGLErrors == 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  char v8 = !v7;
  v9[2] = __35__DYGLGuestAppClient_setTraceMode___block_invoke;
  v9[3] = &unk_1F8F68;
  char v10 = v8;
  v9[4] = self;
  v9[5] = v6;
  iter_contexts((uint64_t)v9);
  handle_trace_mode_transition_platform();
}

void __35__DYGLGuestAppClient_setTraceMode___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 48)) {
    clear_errors((void *)a2);
  }
  if (*(_BYTE *)(*(void *)(a1 + 32) + 201LL)) {
    clear_driver_events((id *)a2);
  }
  install_dispatch_table(*(void *)a2, *(void *)(a1 + 40));
  *(_BYTE *)(a2 + 4837) = [*(id *)(a1 + 32) traceMode] == 5;
  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::clear(a2 + 3480);
  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::clear(a2 + 3520);
}

- (id)_copyContextsInfo
{
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __39__DYGLGuestAppClient__copyContextsInfo__block_invoke;
  v4[3] = &unk_1F8DB8;
  v4[4] = v2;
  iter_contexts((uint64_t)v4);
  return v2;
}

id __39__DYGLGuestAppClient__copyContextsInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a2 + 3464)];
}

- (void)processMessage:(id)a3
{
  id v5 = [a3 kind];
  if ((int)v5 > 1541)
  {
    switch((_DWORD)v5)
    {
      case 0x702:
        -[DYGLGuestAppClient lockGraphicsAndWaitForThreads:](self, "lockGraphicsAndWaitForThreads:", 1LL);
        uint64_t v7 = OBJC_IVAR___DYGuestAppClient__overrideFlags;
        int v8 = *(_DWORD *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__overrideFlags] & 0x100;
        unsigned int v37 = v8;
        if ([a3 BOOLForKey:kDYOverridesForceOneByOneScissor])
        {
          v8 |= 4u;
          unsigned int v37 = v8;
        }

        if ([a3 BOOLForKey:kDYOverridesForceTwoByTwoTextures])
        {
          v8 |= 0x20u;
          unsigned int v37 = v8;
        }

        if ([a3 BOOLForKey:kDYOverridesDisableAllDrawCommands])
        {
          v8 |= 8u;
          unsigned int v37 = v8;
        }

        if ([a3 BOOLForKey:kDYOverridesDisableAllGLCommands])
        {
          v8 |= 0x10u;
          unsigned int v37 = v8;
        }

        unsigned int v9 = [a3 uint32ForKey:kDYOverridesFlagsKey];
        if (*(void *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__xcodeOverrideFlags] != v9)
        {
          unsigned int v37 = (v9 << 19) & 0x300000 | (32 * (v9 & 1)) | (v9 >> 1) & 8 | v8 & 0x1D7;
          *(void *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__xcodeOverrideFlags] = v9;
        }

        update_overrides(a3, (int *)&v37);
        *(_DWORD *)&self->DYGuestAppClient_opaque[v7] = v37;
        -[DYGLGuestAppClient unlockGraphics](self, "unlockGraphics");
        break;
      case 0x701:
        -[DYGLGuestAppClient lockGraphicsAndWaitForThreads:](self, "lockGraphicsAndWaitForThreads:", 1LL);
        id v10 = objc_msgSend(objc_msgSend(a3, "attributeForKey:", kDYTraceModeKey), "unsignedIntValue");
        if ((_DWORD)v10 == 5)
        {
          v29 = (DYGLGuestAppClient *)dy_abort("capture trace mode cannot be set directly; create and start a capture session");
          -[DYGLGuestAppClient sendContextInfoUpdate](v29, v30);
        }

        else
        {
          id v11 = v10;
          self->_includeBacktraceInFbufs = [a3 BOOLForKey:kDYTraceIncludeBacktracesKey];
          self->_queryDriverEventsOnGraphicsCommands = [a3 BOOLForKey:kDYTraceIncludeDriverEventsKey];
          gProfilingSendPeriod = (uint64_t)[a3 uint64ForKey:kDYTraceProfilingSendPeriodKey];
          id v12 = [a3 uint64ForKey:kDYTraceProfilingFlagsKey];
          gProfilingFlags = 0LL;
          enable_profiling_flag((uint64_t)v12);
          self->_BOOL checkGLErrors = [a3 BOOLForKey:kDYTraceCheckGLErrorsKey];
          unsigned __int8 v13 = [a3 BOOLForKey:kDYTraceTrapOnGLErrorsKey];
          gTrapOnGLError = v13;
          BOOL checkGLErrors = 1;
          if (!gBreakOnError && (v13 & 1) == 0) {
            BOOL checkGLErrors = self->_checkGLErrors;
          }
          gCheckGLErrors = checkGLErrors;
          id v15 = [a3 attributeForKey:kDYTraceProfilingHardwareCountersConfigurationKey];
          v16 = v15;
          if (v15 && ![v15 objectForKey:kDYProfilingHardwareCountersConfigurationTypeKey]) {
            __assert_rtn( "-[DYGLGuestAppClient processMessage:]",  (const char *)&unk_1F0B16,  0,  "[hardwareCountersConfiguration objectForKey:kDYProfilingHardwareCountersConfigurationTypeKey] != nil");
          }
          set_hardware_counters_configuration(v16);
          else {
            -[DYGLGuestAppClient setTraceMode:](self, "setTraceMode:", v11);
          }
          -[DYGLGuestAppClient unlockGraphics](self, "unlockGraphics");
        }

        break;
      case 0x606:
        id v31 = -[DYGLGuestAppClient _copyContextsInfo](self, "_copyContextsInfo");
        -[DYGLGuestAppClient sendMessage:inReplyTo:]( self,  "sendMessage:inReplyTo:",  +[DYTransportMessage messageWithKind:objectPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:objectPayload:",  1542LL),  a3);

        break;
      default:
LABEL_23:
        v32.receiver = self;
        v32.super_class = (Class)&OBJC_CLASS___DYGLGuestAppClient;
        -[DYGLGuestAppClient processMessage:](&v32, "processMessage:", a3);
        break;
    }
  }

  else
  {
    switch((int)v5)
    {
      case 1025:
        HarvestResourceNames(a3);
        break;
      case 1026:
        HarvestResourceObject([a3 attributes], (uint64_t)a3);
        break;
      case 1027:
        HarvestState(a3);
        break;
      case 1028:
        UpdateResourceObject(a3);
        break;
      case 1029:
        ClearResourceOverrides(a3);
        break;
      default:
        if ((_DWORD)v5 == 512)
        {
          GPUTools::DYLockUtils::Lock((GPUTools::DYLockUtils *)&breakpoint_flags_write_lock, v6);
          bzero(breakpoint_flags, 0x46EuLL);
          GPUTools::DYLockUtils::Unlock((GPUTools::DYLockUtils *)&breakpoint_flags_write_lock, v17);
          __dmb(0xBu);
          id v18 = [a3 objectPayload];
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          id v19 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v34;
            do
            {
              for (i = 0LL; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v34 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
                unsigned __int8 v24 = [v23 breakBefore];
                int unified_index = dy_fenum_get_unified_index([v23 fenum]);
                GPUTools::DYLockUtils::Lock((GPUTools::DYLockUtils *)&breakpoint_flags_write_lock, v26);
                breakpoint_flags[unified_index] = v24;
                GPUTools::DYLockUtils::Unlock((GPUTools::DYLockUtils *)&breakpoint_flags_write_lock, v27);
                __dmb(0xBu);
              }

              id v20 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
            }

            while (v20);
          }

          gBreakOnError = objc_msgSend( objc_msgSend(a3, "attributeForKey:", kDYBreakpointBreakOnGLErrorsKey),  "BOOLValue");
          BOOL v28 = 1;
          if ((gBreakOnError & 1) == 0 && !gTrapOnGLError) {
            BOOL v28 = self->_checkGLErrors;
          }
          gCheckGLErrors = v28;
          __dmb(0xBu);
        }

        else
        {
          if ((_DWORD)v5 != 513) {
            goto LABEL_23;
          }
          breakpoint_continue((uint64_t)v5);
        }

        break;
    }
  }

- (void)sendContextInfoUpdate
{
  id v3 = -[DYGLGuestAppClient _copyContextsInfo](self, "_copyContextsInfo");
  -[DYGLGuestAppClient sendMessage:]( self,  "sendMessage:",  +[DYTransportMessage messageWithKind:objectPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:objectPayload:",  1542LL,  v3));
}

- (void)_populateQueueAndThreadLabelMaps
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = __54__DYGLGuestAppClient__populateQueueAndThreadLabelMaps__block_invoke;
  v2[3] = &unk_1F8DB8;
  v2[4] = self;
  iter_contexts((uint64_t)v2);
}

void *__54__DYGLGuestAppClient__populateQueueAndThreadLabelMaps__block_invoke(void *result, uint64_t a2)
{
  uint64_t v3 = OBJC_IVAR___DYGuestAppClient__activeCaptureState;
  uint64_t v4 = *(void *)(result[4] + OBJC_IVAR___DYGuestAppClient__activeCaptureState);
  id v5 = *(void **)(a2 + 3496);
  if (v5)
  {
    v6 = result;
    uint64_t v7 = v4 + OBJC_IVAR___DYCaptureState__dispatchQueueLabelMap;
    do
    {
      result = std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__emplace_unique_key_args<void const*,std::pair<void const* const,std::string> const&>( v7,  v5 + 2,  (uint64_t)(v5 + 2));
      id v5 = (void *)*v5;
    }

    while (v5);
    uint64_t v4 = *(void *)(v6[4] + v3);
  }

  int v8 = *(void **)(a2 + 3536);
  if (v8)
  {
    uint64_t v9 = v4 + OBJC_IVAR___DYCaptureState__threadLabelMap;
    do
    {
      result = std::__hash_table<std::__hash_value_type<unsigned long long,std::string>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::string>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,std::string> const&>( v9,  v8 + 2,  (uint64_t)(v8 + 2));
      int v8 = (void *)*v8;
    }

    while (v8);
  }

  return result;
}

- (void)_waitForGraphicsThreads
{
  v2 = &v7;
  uint64_t v4 = 0LL;
  id v5 = (int *)&v4;
  uint64_t v6 = 0x2020000000LL;
  do
  {
    *(_DWORD *)v2 = 0;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = __45__DYGLGuestAppClient__waitForGraphicsThreads__block_invoke;
    v3[3] = &unk_1F8DE0;
    v3[4] = &v4;
    iter_contexts((uint64_t)v3);
    if (v5[6] < 1) {
      break;
    }
    usleep(0xAu);
    __dmb(0xBu);
    v2 = (uint64_t *)(v5 + 6);
  }

  while (v5[6] > 0);
  _Block_object_dispose(&v4, 8);
}

uint64_t __45__DYGLGuestAppClient__waitForGraphicsThreads__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) += *(_DWORD *)(a2 + 4640);
  return result;
}

- (void)_appendToAllCaptureDataSentMessagePayload:(id)a3
{
  id v4 = -[DYGLGuestAppClient _copyContextsInfo](self, "_copyContextsInfo");
  [a3 setObject:v4 forKey:@"contexts info"];
}

- (void)_appendLinkTimeLibrariesToVersionsDictionary:(id)a3
{
  for (uint64_t i = 0LL; i != 2; ++i)
    -[DYGLGuestAppClient _appendLinkTimeLibrary:toVersionsDictionary:]( self,  "_appendLinkTimeLibrary:toVersionsDictionary:",  -[DYGLGuestAppClient _appendLinkTimeLibrariesToVersionsDictionary:]::libraries[i],  a3);
}

- (BOOL)_canTriggerCaptureOnNextGraphicsCommand
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __61__DYGLGuestAppClient__canTriggerCaptureOnNextGraphicsCommand__block_invoke;
  v4[3] = &unk_1F8DE0;
  v4[4] = &v5;
  iter_contexts((uint64_t)v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __61__DYGLGuestAppClient__canTriggerCaptureOnNextGraphicsCommand__block_invoke( uint64_t result,  uint64_t a2,  _BYTE *a3)
{
  if (*(_BYTE *)(a2 + 4839))
  {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
    *a3 = 1;
  }

  return result;
}

- (void)_handleTurnOnCapture
{
  if ([*(id *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__activeCaptureDescriptor] triggerFrame])
  {
    harvest_contexts(0LL, 1);
  }

- (void)_handleTurnOffCapture
{
}

- (void)_armCaptureWithTransportMessage:(id)a3
{
  if (!*(void *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__state])
  {
    id v4 = [a3 plistPayload];
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___DYGLESCaptureDescriptor);
    -[DYGLESCaptureDescriptor setSessionId:]( v6,  "setSessionId:",  objc_msgSend(objc_msgSend(v4, "objectForKey:", @"Serial"), "unsignedIntValue"));
    if (!-[DYGLESCaptureDescriptor sessionId](v6, "sessionId")) {
      __assert_rtn( "-[DYGLGuestAppClient _armCaptureWithTransportMessage:]",  (const char *)&unk_1F0B16,  0,  "captureDescriptor.sessionId != 0");
    }
    id v5 = -[DYGLESCaptureDescriptor sessionId](v6, "sessionId");
    *(void *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__lastSessionSerial] = v5;
    -[DYGLESCaptureDescriptor setFramesToCapture:]( v6,  "setFramesToCapture:",  objc_msgSend(objc_msgSend(v4, "objectForKey:", @"FrameLimit"), "unsignedLongLongValue"));
    -[DYGLESCaptureDescriptor setTriggerFrame:]( v6,  "setTriggerFrame:",  objc_msgSend(objc_msgSend(v4, "objectForKey:", @"TriggerFrame"), "unsignedLongLongValue"));
    -[DYGLESCaptureDescriptor setSuspendAfterCapture:]( v6,  "setSuspendAfterCapture:",  objc_msgSend(objc_msgSend(v4, "objectForKey:", @"SuspendAfterCompletion"), "BOOLValue"));
    -[DYGLESCaptureDescriptor setLockGraphicsAfterCapture:]( v6,  "setLockGraphicsAfterCapture:",  objc_msgSend(objc_msgSend(v4, "objectForKey:", @"LockOpenGLAfterCompletion"), "BOOLValue"));
    -[DYGLGuestAppClient armCaptureWithDescriptor:](self, "armCaptureWithDescriptor:", v6);
  }

- (BOOL)armCaptureWithDescriptor:(id)a3
{
  if (a3) {
    BOOL v3 = *(void *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__state] == 0LL;
  }
  else {
    BOOL v3 = 0;
  }
  BOOL v4 = v3;
  if (v3)
  {
    id v6 = a3;
    uint64_t v7 = OBJC_IVAR___DYGuestAppClient__activeCaptureDescriptor;
    *(void *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__activeCaptureDescriptor] = v6;
    char v8 = objc_alloc_init(&OBJC_CLASS___DYGLESCaptureState);
    *(void *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__activeCaptureState] = v8;
    [*(id *)&self->DYGuestAppClient_opaque[v7] setIncludeBacktraceInFbufs:self->_includeBacktraceInFbufs];
    [*(id *)&self->DYGuestAppClient_opaque[v7] setQueryDriverEventsOnGraphicsCommands:self->_queryDriverEventsOnGraphicsCommands];
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___DYGLGuestAppClient;
    -[DYGLGuestAppClient _armCapture](&v10, "_armCapture");
  }

  return v4;
}

- (BOOL)startCaptureWithDescriptor:(id)a3
{
  if (*(_DWORD *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__traceMode] != 1) {
    return 0;
  }
  BOOL result = 0;
  if (a3)
  {
    if (!*(void *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__state])
    {
      id v5 = a3;
      uint64_t v6 = OBJC_IVAR___DYGuestAppClient__activeCaptureDescriptor;
      *(void *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__activeCaptureDescriptor] = v5;
      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___DYGLESCaptureState);
      *(void *)&self->DYGuestAppClient_opaque[OBJC_IVAR___DYGuestAppClient__activeCaptureState] = v7;
      [*(id *)&self->DYGuestAppClient_opaque[v6] setIncludeBacktraceInFbufs:self->_includeBacktraceInFbufs];
      v8.receiver = self;
      v8.super_class = (Class)&OBJC_CLASS___DYGLGuestAppClient;
      -[DYGLGuestAppClient _startCapture](&v8, "_startCapture");
      return 1;
    }
  }

  return result;
}

- (BOOL)triggerCaptureOnNextGLCommand
{
  return self->_triggerCaptureOnNextGLCommand;
}

@end