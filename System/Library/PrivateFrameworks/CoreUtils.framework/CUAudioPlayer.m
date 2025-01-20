@interface CUAudioPlayer
- (BOOL)setPortUID:(id)a3 channelName:(id)a4 error:(id *)a5;
- (CUAudioPlayer)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (unsigned)enableSmartRouting;
- (unsigned)flags;
- (void)_abortRequestsWithError:(id)a3;
- (void)_activate;
- (void)_applyChannelAssignments:(id)a3;
- (void)_completeRequest:(id)a3 error:(id)a4;
- (void)_invalidateWithFlags:(unsigned int)a3;
- (void)_invalidated;
- (void)_playPreparedIdentifier:(id)a3 completion:(id)a4;
- (void)_playURL:(id)a3 loop:(BOOL)a4 completion:(id)a5;
- (void)_prepareURL:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)_processRequests;
- (void)activate;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)audioSessionInterrupted:(id)a3;
- (void)dealloc;
- (void)invalidateWithFlags:(unsigned int)a3;
- (void)playPreparedIdentifier:(id)a3 completion:(id)a4;
- (void)playURL:(id)a3 completion:(id)a4;
- (void)playURL:(id)a3 loop:(BOOL)a4 completion:(id)a5;
- (void)prepareURL:(id)a3 identifier:(id *)a4 completion:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setEnableSmartRouting:(unsigned int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CUAudioPlayer

- (CUAudioPlayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUAudioPlayer;
  v2 = -[CUAudioPlayer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUAudioPlayer;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUAudioPlayer;
  -[CUAudioPlayer dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (BOOL)setPortUID:(id)a3 channelName:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  v10 = -[objc_class sharedInstance](getAVAudioSessionClass(), "sharedInstance");
  [v10 currentRoute];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 outputs];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    v33 = v12;
    id v34 = v8;
    v30 = a5;
    uint64_t v31 = *(void *)v40;
    v32 = self;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        [v17 UID];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v19 = [v18 isEqual:v8];

        if (v19)
        {
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          [v17 channels];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v36;
            while (2)
            {
              for (uint64_t j = 0LL; j != v22; ++j)
              {
                if (*(void *)v36 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                [v25 channelName];
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                int v27 = [v26 isEqual:v9];

                if (v27)
                {
                  objc_storeStrong((id *)&v32->_channel, v25);

                  BOOL v28 = 1;
                  id v8 = v34;
                  goto LABEL_21;
                }
              }

              uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          v12 = v33;
          id v8 = v34;
          uint64_t v15 = v31;
        }
      }

      uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
      a5 = v30;
    }

    while (v14);
  }

  if (a5)
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
    BOOL v28 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v28 = 0;
  }

- (void)_applyChannelAssignments:(id)a3
{
  id v4 = a3;
  id v22 = v4;
  if (self->_channel)
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v6 = [v22 numberOfChannels];
    if (v6)
    {
      uint64_t v7 = v6;
      do
      {
        [v5 addObject:self->_channel];
        --v7;
      }

      while (v7);
    }

    ucat = self->_ucat;
    if (ucat->var0 >= 31) {
      goto LABEL_13;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    -[AVAudioSessionChannelDescription owningPortUID](self->_channel, "owningPortUID");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSessionChannelDescription channelName](self->_channel, "channelName");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUAudioPlayer _applyChannelAssignments:]",  0x1Eu,  (uint64_t)"Applying channel: portUID=%@, channelName=%@",  v10,  v11,  v12,  v13,  (char)v9);

LABEL_13:
    [v22 setChannelAssignments:v5];

    goto LABEL_16;
  }

  [v4 channelAssignments];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    int v19 = self->_ucat;
    if (v19->var0 <= 30)
    {
      if (v19->var0 == -1)
      {
        int v19 = self->_ucat;
      }

      LogPrintF( (uint64_t)v19,  (uint64_t)"-[CUAudioPlayer _applyChannelAssignments:]",  0x1Eu,  (uint64_t)"Applying channel: nil",  v15,  v16,  v17,  v18,  v20);
    }

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__CUAudioPlayer_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUAudioPlayer _activate]",  0x1Eu,  (uint64_t)"Activate %#{flags}\n",  v2,  v3,  v4,  v5,  self->_flags);
  }

- (void)invalidateWithFlags:(unsigned int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __37__CUAudioPlayer_invalidateWithFlags___block_invoke;
  v4[3] = &unk_189F32F60;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_invalidateWithFlags:(unsigned int)a3
{
  if (self->_invalidateCalled) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUAudioPlayer _invalidateWithFlags:]",  0x1Eu,  (uint64_t)"Invalidate %#{flags}\n",  v3,  v4,  v5,  v6,  a3);
  }

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_currentRequest
    && !-[NSMutableArray count](self->_playRequests, "count")
    && !-[NSMutableDictionary count](self->_preparedRequests, "count"))
  {
    if (self->_audioSession)
    {
      [MEMORY[0x189607958] defaultCenter];
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      getAVAudioSessionInterruptionNotification();
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 removeObserver:self name:v4 object:self->_audioSession];

      audioSession = self->_audioSession;
      self->_audioSession = 0LL;
    }

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v7 = self->_invalidationHandler;
    }

    else
    {
      id v7 = 0LL;
    }

    self->_invalidationHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_16;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUAudioPlayer _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v8,  v9,  v10,  v11,  v14);
LABEL_16:
    selfRef = self->_selfRef;
    self->_selfRef = 0LL;
  }

- (void)playPreparedIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__CUAudioPlayer_playPreparedIdentifier_completion___block_invoke;
  block[3] = &unk_189F31B90;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_playPreparedIdentifier:(id)a3 completion:(id)a4
{
  id v21 = a3;
  id v6 = (void (**)(id, void *))a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_preparedRequests, "objectForKeyedSubscript:", v21);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  ucat = self->_ucat;
  int var0 = ucat->var0;
  if (v11)
  {
    if (var0 <= 30)
    {
      if (var0 == -1)
      {
        ucat = self->_ucat;
      }

      [v11 label];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUAudioPlayer _playPreparedIdentifier:completion:]",  0x1Eu,  (uint64_t)"Play prepared ID %@ '%@'\n",  v14,  v15,  v16,  v17,  (char)v21);
    }

- (void)playURL:(id)a3 completion:(id)a4
{
}

- (void)playURL:(id)a3 loop:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __41__CUAudioPlayer_playURL_loop_completion___block_invoke;
  v13[3] = &unk_189F30658;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)_playURL:(id)a3 loop:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(id, id))a5;
  id v9 = a3;
  [v9 absoluteString];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 lastPathComponent];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUAudioPlayer _playURL:loop:completion:]",  0x1Eu,  (uint64_t)"Play request '%@'\n",  v12,  v13,  v14,  v15,  (char)v11);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)prepareURL:(id)a3 identifier:(id *)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [MEMORY[0x189607AB8] UUID];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(a4, v10);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __50__CUAudioPlayer_prepareURL_identifier_completion___block_invoke;
  v15[3] = &unk_189F32D28;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

- (void)_prepareURL:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = a3;
  [v10 absoluteString];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 lastPathComponent];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUAudioPlayer _prepareURL:identifier:completion:]",  0x1Eu,  (uint64_t)"Prepare request '%@'\n",  v13,  v14,  v15,  v16,  (char)v12);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)_processRequests
{
  if (!self->_currentRequest)
  {
    -[NSMutableArray firstObject](self->_playRequests, "firstObject");
    uint64_t v3 = (CUAudioRequest *)objc_claimAutoreleasedReturnValue();
    currentRequest = self->_currentRequest;
    self->_currentRequest = v3;

    if (self->_currentRequest)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_playRequests, "removeObjectAtIndex:", 0LL);
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        -[CUAudioRequest label](self->_currentRequest, "label");
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUAudioPlayer _processRequests]",  0x1Eu,  (uint64_t)"Play start '%@'\n",  v7,  v8,  v9,  v10,  (char)v6);
      }

- (void)_completeRequest:(id)a3 error:(id)a4
{
  uint64_t v21 = (CUAudioRequest *)a3;
  id v6 = a4;
  uint64_t v7 = v21;
  id v8 = v6;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      -[CUAudioRequest label](v21, "label");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUAudioPlayer _completeRequest:error:]",  0x1Eu,  (uint64_t)"Play completed '%@', %{error}\n",  v11,  v12,  v13,  v14,  (char)v10);

      uint64_t v7 = v21;
      goto LABEL_5;
    }

    BOOL v15 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu);
    uint64_t v7 = v21;
    if (v15)
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)_abortRequestsWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  BOOL v5 = self->_currentRequest;
  if (v5)
  {
    currentRequest = self->_currentRequest;
    self->_currentRequest = 0LL;

    -[CUAudioRequest completion](v5, "completion");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CUAudioRequest completion](v5, "completion");
      id v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id))v8)[2](v8, v4);
    }
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v9 = self->_playRequests;
  uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0LL;
      uint64_t v14 = v5;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v5 = (CUAudioRequest *)*(id *)(*((void *)&v21 + 1) + 8 * v13);

        -[CUAudioRequest completion](v5, "completion");
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[CUAudioRequest completion](v5, "completion");
          uint64_t v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
          ((void (**)(void, id))v16)[2](v16, v4);
        }

        ++v13;
        uint64_t v14 = v5;
      }

      while (v11 != v13);
      uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    }

    while (v11);
  }

  -[NSMutableArray removeAllObjects](self->_playRequests, "removeAllObjects");
  preparedRequests = self->_preparedRequests;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __41__CUAudioPlayer__abortRequestsWithError___block_invoke;
  v19[3] = &unk_189F30680;
  id v20 = v4;
  id v18 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](preparedRequests, "enumerateKeysAndObjectsUsingBlock:", v19);
  -[NSMutableDictionary removeAllObjects](self->_preparedRequests, "removeAllObjects");
  -[CUAudioPlayer _invalidated](self, "_invalidated");
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__CUAudioPlayer_audioPlayerDecodeErrorDidOccur_error___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v6 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__CUAudioPlayer_audioPlayerDidFinishPlaying_successfully___block_invoke;
  block[3] = &unk_189F320C8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)audioSessionInterrupted:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__CUAudioPlayer_audioSessionInterrupted___block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)enableSmartRouting
{
  return self->_enableSmartRouting;
}

- (void)setEnableSmartRouting:(unsigned int)a3
{
  self->_enableSmartRouting = a3;
}

- (void).cxx_destruct
{
}

void __41__CUAudioPlayer_audioSessionInterrupted___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = (int *)v9[8];
  if (*v10 <= 60)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x3Cu);
      id v9 = *(void **)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      id v10 = (int *)v9[8];
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUAudioPlayer audioSessionInterrupted:]_block_invoke",  0x3Cu,  (uint64_t)"### AudioPlayer interrupted\n",  a5,  a6,  a7,  a8,  v12);
    id v9 = *(void **)(a1 + 32);
  }

void __58__CUAudioPlayer_audioPlayerDidFinishPlaying_successfully___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24LL);
  id v7 = v2;
  id v15 = v2;
  if (v2)
  {
    id v8 = *(void **)(a1 + 40);
    [v2 audioPlayer];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    id v7 = v15;
    if (v8 == v9)
    {
      BOOL v11 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 48))
      {
        [*(id *)(a1 + 32) _completeRequest:v15 error:0];
      }

      else
      {
        NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 _completeRequest:v15 error:v13];
      }

      goto LABEL_11;
    }
  }

  id v10 = *(int **)(*(void *)(a1 + 32) + 64LL);
  if (*v10 <= 90)
  {
    if (*v10 != -1)
    {
LABEL_5:
      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUAudioPlayer audioPlayerDidFinishPlaying:successfully:]_block_invoke",  0x5Au,  (uint64_t)"### AudioPlayer finished for non-current player\n",  v3,  v4,  v5,  v6,  v14);
LABEL_11:
      id v7 = v15;
      goto LABEL_12;
    }

    BOOL v12 = _LogCategory_Initialize((uint64_t)v10, 0x5Au);
    id v7 = v15;
    if (v12)
    {
      id v10 = *(int **)(*(void *)(a1 + 32) + 64LL);
      goto LABEL_5;
    }
  }

void __54__CUAudioPlayer_audioPlayerDecodeErrorDidOccur_error___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24LL);
  uint64_t v3 = *(int **)(*(void *)(a1 + 32) + 64LL);
  id v13 = v2;
  if (*v3 <= 60)
  {
    if (*v3 == -1)
    {
      BOOL v10 = _LogCategory_Initialize((uint64_t)v3, 0x3Cu);
      id v2 = v13;
      if (!v10) {
        goto LABEL_5;
      }
      uint64_t v3 = *(int **)(*(void *)(a1 + 32) + 64LL);
    }

    uint64_t v4 = *(void *)(a1 + 40);
    [v2 audioPlayer];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUAudioPlayer audioPlayerDecodeErrorDidOccur:error:]_block_invoke",  0x3Cu,  (uint64_t)"### AudioPlayer decode failed %{error} %s\n",  v6,  v7,  v8,  v9,  v4);

    id v2 = v13;
  }

void __41__CUAudioPlayer__abortRequestsWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [v6 completion];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [v6 completion];
    uint64_t v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(void *)(a1 + 32));
  }
}

uint64_t __50__CUAudioPlayer_prepareURL_identifier_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareURL:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __41__CUAudioPlayer_playURL_loop_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playURL:*(void *)(a1 + 40) loop:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

uint64_t __51__CUAudioPlayer_playPreparedIdentifier_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playPreparedIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __37__CUAudioPlayer_invalidateWithFlags___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithFlags:*(unsigned int *)(a1 + 40)];
}

uint64_t __25__CUAudioPlayer_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

@end