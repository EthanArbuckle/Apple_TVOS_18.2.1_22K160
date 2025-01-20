@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (void *)MEMORY[0x189604010];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  objc_msgSend(a4, "setExportedInterface:", objc_msgSend(MEMORY[0x189607B48], "interfaceWithProtocol:", &unk_18C7038B8));
  objc_msgSend( (id)objc_msgSend(a4, "exportedInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v10,  sel_deviceClassAttached_options_withReply_,  1,  0);
  objc_msgSend( (id)objc_msgSend(a4, "exportedInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v10,  sel_bootstrapWithOptions_,  0,  0);
  objc_msgSend( (id)objc_msgSend(a4, "exportedInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v10,  sel_findFirmwareWithOptions_remote_,  0,  0);
  objc_msgSend( (id)objc_msgSend(a4, "exportedInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v10,  sel_downloadFirmwareWithOptions_,  0,  0);
  objc_msgSend( (id)objc_msgSend(a4, "exportedInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v10,  sel_prepareFirmwareWithOptions_,  0,  0);
  objc_msgSend( (id)objc_msgSend(a4, "exportedInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v10,  sel_applyFirmwareWithOptions_,  0,  0);
  objc_msgSend( (id)objc_msgSend(a4, "exportedInterface"),  "setClasses:forSelector:argumentIndex:ofReply:",  v10,  sel_finishWithOptions_,  0,  0);
  objc_msgSend( a4,  "setRemoteObjectInterface:",  objc_msgSend(MEMORY[0x189607B48], "interfaceWithProtocol:", &unk_18C705318));
  objc_msgSend( a4,  "setExportedObject:",  +[AUServiceAdapter sharedInstance](AUServiceAdapter, "sharedInstance"));
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x3052000000LL;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  v17[5] = +[AUServiceAdapter sharedInstance](&OBJC_CLASS___AUServiceAdapter, "sharedInstance");
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x3052000000LL;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v16[5] = a4;
  uint64_t v11 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_18A200B08;
  v15[4] = v16;
  v15[5] = v17;
  [a4 setInvalidationHandler:v15];
  v14[0] = v11;
  v14[1] = 3221225472LL;
  v14[2] = __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v14[3] = &unk_18A200B08;
  v14[4] = v16;
  v14[5] = v17;
  [a4 setInterruptionHandler:v14];
  if (-[AUServiceAdapter hasActiveConnection]( +[AUServiceAdapter sharedInstance](&OBJC_CLASS___AUServiceAdapter, "sharedInstance"),  "hasActiveConnection")
    || ![a4 valueForEntitlement:@"com.apple.private.accessoryupdater.client"])
  {
    NSLog( @"%s: Denying incoming connection, connection status=%d",  "-[ServiceDelegate listener:shouldAcceptNewConnection:]",  -[AUServiceAdapter hasActiveConnection]( +[AUServiceAdapter sharedInstance](&OBJC_CLASS___AUServiceAdapter, "sharedInstance"),  "hasActiveConnection"));
    BOOL v12 = 0;
  }

  else
  {
    -[AUServiceAdapter setActiveConnection:]( +[AUServiceAdapter sharedInstance](&OBJC_CLASS___AUServiceAdapter, "sharedInstance"),  "setActiveConnection:",  a4);
    [a4 resume];
    BOOL v12 = 1;
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);
  return v12;
}

uint64_t __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setActiveConnection:0];
}

uint64_t __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setActiveConnection:0];
}

@end