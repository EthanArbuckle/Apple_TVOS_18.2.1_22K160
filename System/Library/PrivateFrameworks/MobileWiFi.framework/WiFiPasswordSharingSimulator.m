@interface WiFiPasswordSharingSimulator
- (BOOL)service:(id)a3 shouldPromptForNetwork:(id)a4;
- (WiFiPasswordSharingSimulator)init;
- (void)dealloc;
- (void)runWithSSID:(id)a3 reply:(id)a4;
- (void)service:(id)a3 receivedNetworkInfo:(id)a4;
@end

@implementation WiFiPasswordSharingSimulator

- (WiFiPasswordSharingSimulator)init
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WiFiPasswordSharingSimulator;
  v2 = -[WiFiPasswordSharingSimulator init](&v6, sel_init);
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("mobilewifitool.wifi-password-sharing", 0LL);
    if (!SharingLibraryCore_frameworkLibrary)
    {
      __int128 v8 = xmmword_189E8C840;
      uint64_t v9 = 0LL;
      SharingLibraryCore_frameworkLibrary = _sl_dlopen();
    }

    if (SharingLibraryCore_frameworkLibrary)
    {
      *(void *)&__int128 v8 = 0LL;
      *((void *)&v8 + 1) = &v8;
      uint64_t v9 = 0x3052000000LL;
      v10 = __Block_byref_object_copy__0;
      v11 = __Block_byref_object_dispose__0;
      v3 = (objc_class *)getSFPasswordSharingServiceClass_softClass;
      uint64_t v12 = getSFPasswordSharingServiceClass_softClass;
      if (!getSFPasswordSharingServiceClass_softClass)
      {
        v7[0] = MEMORY[0x1895F87A8];
        v7[1] = 3221225472LL;
        v7[2] = __getSFPasswordSharingServiceClass_block_invoke;
        v7[3] = &unk_189E8BA58;
        v7[4] = &v8;
        __getSFPasswordSharingServiceClass_block_invoke((uint64_t)v7);
        v3 = *(objc_class **)(*((void *)&v8 + 1) + 40LL);
      }

      _Block_object_dispose(&v8, 8);
      v4 = (SFPasswordSharingService *)objc_alloc_init(v3);
      v2->_service = v4;
      -[SFPasswordSharingService setDelegate:](v4, "setDelegate:", v2);
      -[SFPasswordSharingService setDispatchQueue:](v2->_service, "setDispatchQueue:", v2->_queue);
    }
  }

  return v2;
}

- (void)dealloc
{
  -[SFPasswordSharingService invalidate](self->_service, "invalidate");
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiPasswordSharingSimulator;
  -[WiFiPasswordSharingSimulator dealloc](&v4, sel_dealloc);
}

- (void)runWithSSID:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__WiFiPasswordSharingSimulator_runWithSSID_reply___block_invoke;
  block[3] = &unk_189E8C7F8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

uint64_t __50__WiFiPasswordSharingSimulator_runWithSSID_reply___block_invoke(uint64_t a1)
{
  if (!SharingLibraryCore_frameworkLibrary) {
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (SharingLibraryCore_frameworkLibrary)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setNetworkName:*(void *)(a1 + 40)];

    *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 48) copy];
    return [*(id *)(*(void *)(a1 + 32) + 16) activate];
  }

  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0LL, 0LL);
    }
  }

  return result;
}

- (void)service:(id)a3 receivedNetworkInfo:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __60__WiFiPasswordSharingSimulator_service_receivedNetworkInfo___block_invoke;
  block[3] = &unk_189E8C820;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async(queue, block);
}

uint64_t __60__WiFiPasswordSharingSimulator_service_receivedNetworkInfo___block_invoke(uint64_t a1)
{
  uint64_t result = printf( "Received '%s' [ch=%ld psk=%s]\n",  (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "networkName"), "UTF8String"),  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "channel"), "integerValue"),  (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "psk"), "UTF8String"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 24LL);
  if (v3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))( v3,  [*(id *)(a1 + 40) channel],  objc_msgSend(*(id *)(a1 + 40), "psk"));
  }
  return result;
}

- (BOOL)service:(id)a3 shouldPromptForNetwork:(id)a4
{
  return 0;
}

@end