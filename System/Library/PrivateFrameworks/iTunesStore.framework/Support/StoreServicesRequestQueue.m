@interface StoreServicesRequestQueue
+ (id)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (id)_newClientWithMessage:(id)a3 connection:(id)a4;
- (void)_sendMessageWithError:(id)a3 toClient:(id)a4;
- (void)_sendUnentitledMessageToClient:(id)a3;
- (void)_sendUnentitledReplyForMessage:(id)a3 connection:(id)a4;
- (void)addDownloadsUsingManifestWithMessage:(id)a3 connection:(id)a4;
- (void)addMediaSocialPostWithMessage:(id)a3 connection:(id)a4;
- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5;
- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6;
- (void)authorizeMachineWithMessage:(id)a3 connection:(id)a4;
- (void)checkinRentalWithMessage:(id)a3 connection:(id)a4;
- (void)checkoutRentalWithMessage:(id)a3 connection:(id)a4;
- (void)collectURLSessionDataWithMessage:(id)a3 connection:(id)a4;
- (void)demoteApplicationWithMessage:(id)a3 connection:(id)a4;
- (void)getAccountPurchaseHistoryWithMessage:(id)a3 connection:(id)a4;
- (void)getApplicationCapabilitiesMessage:(id)a3 connection:(id)a4;
- (void)getApplicationWithMessage:(id)a3 connection:(id)a4;
- (void)getAvailableItemKindsWithMessage:(id)a3 connection:(id)a4;
- (void)getFamilyCircleWithMessage:(id)a3 connection:(id)a4;
- (void)getKBSyncWithMessage:(id)a3 connection:(id)a4;
- (void)getMediaSocialShareExtensionVisibilityWithMessage:(id)a3 connection:(id)a4;
- (void)getPlayInfoWithMessage:(id)a3 connection:(id)a4;
- (void)getRemovableSytemApplicationsWithMessage:(id)a3 connection:(id)a4;
- (void)getSoftwareLibraryItemsWithMessage:(id)a3 connection:(id)a4;
- (void)getUserApplicationsWithMessage:(id)a3 connection:(id)a4;
- (void)handlePurchaseIntentActionWithMessage:(id)a3 connection:(id)a4;
- (void)hasDemotedApplicationsWithMessage2:(id)a3 connection:(id)a4;
- (void)hasDemotedApplicationsWithMessage:(id)a3 connection:(id)a4;
- (void)haveApplicationsOfTypeWithMessage:(id)a3 connection:(id)a4;
- (void)invalidateURLBagWithMessage:(id)a3 connection:(id)a4;
- (void)isInstalledAppWithMessage:(id)a3 connection:(id)a4;
- (void)isRemovedSystemAppWithMessage:(id)a3 connection:(id)a4;
- (void)keybagRequestWithMessage:(id)a3 connection:(id)a4;
- (void)observeXPCServer:(id)a3;
- (void)personalizeOffersWithMessage:(id)a3 connection:(id)a4;
- (void)playableApplicationsWithMessage:(id)a3 connection:(id)a4;
- (void)pushNotificationRequestWithMessage:(id)a3 connection:(id)a4;
- (void)pushNotificationTokenRequestWithMessage:(id)a3 connection:(id)a4;
- (void)redeemCodesWithMessage:(id)a3 connection:(id)a4;
- (void)rentalSyncRequestWithMessage:(id)a3 connection:(id)a4;
- (void)saveInstallAttributionParamsWithMessage:(id)a3 connection:(id)a4;
- (void)sdk_getStorefrontCountryCodeWithMessage:(id)a3 connection:(id)a4;
- (void)sendAskToBuyWithMessage:(id)a3 connection:(id)a4;
- (void)sendInstallAttributionPingbackWithMessage:(id)a3 connection:(id)a4;
- (void)showDialogRequestWithMessage:(id)a3 connection:(id)a4;
- (void)showServerPromptWithMessage:(id)a3 connection:(id)a4;
- (void)softwareLibraryItemSetValuesWithMessage:(id)a3 connection:(id)a4;
@end

@implementation StoreServicesRequestQueue

+ (void)setSharedInstance:(id)a3
{
  if ((id)qword_1003A32A0 != a3)
  {

    qword_1003A32A0 = (uint64_t)a3;
  }

  pthread_mutex_unlock(&stru_1003A23F8);
}

+ (id)sharedInstance
{
  id v3 = (id)qword_1003A32A0;
  if (!qword_1003A32A0)
  {
    id v3 = objc_alloc_init((Class)a1);
    qword_1003A32A0 = (uint64_t)v3;
  }

  id v4 = v3;
  pthread_mutex_unlock(&stru_1003A23F8);
  return v4;
}

- (void)observeXPCServer:(id)a3
{
  if (SSIsInternalBuild( [a3 addObserver:self selector:"sendInstallAttributionPingbackWithMessage:connection:" forMessage:201])) {
    [a3 addObserver:self selector:"collectURLSessionDataWithMessage:connection:" forMessage:199];
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___StoreServicesRequestQueue;
  -[RequestQueue observeXPCServer:](&v5, "observeXPCServer:", a3);
}

- (void)addDownloadsUsingManifestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSDownloadManifestRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    if (v7)
    {
      v8 = v7;
      v9 = -[LoadExternalDownloadManifestOperation initWithRequest:]( objc_alloc(&OBJC_CLASS___LoadExternalDownloadManifestOperation),  "initWithRequest:",  v7);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100059B90;
      v18[3] = &unk_10034BD60;
      v18[4] = v9;
      -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v9,  v6,  v18);
    }
  }

  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class(self);
      __int16 v21 = 2112;
      id v22 = v6;
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Cannot load manifest for unentitled client: %@",  &v19,  22);
      if (v14)
      {
        v15 = (void *)v14;
        v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        v17 = v16;
        SSFileLog(v10, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v17);
  }
}

- (void)addMediaSocialPostWithMessage:(id)a3 connection:(id)a4
{
  id v11 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementUploads) & 1) != 0)
  {
    id v7 = objc_msgSend( [SSVMediaSocialPostRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    id v8 = [v7 postDescription];
    if ([v8 accountIdentifier]
      || (id v9 = objc_msgSend( objc_msgSend( +[SSAccountStore defaultStore](SSAccountStore, "defaultStore"),  "activeAccount"),  "uniqueIdentifier"),  objc_msgSend(v8, "setAccountIdentifier:", v9),  v9))
    {
      objc_msgSend( +[DirectUploadController sharedController](DirectUploadController, "sharedController"),  "addMediaSocialPostWithDescription:client:",  v8,  v11);
      uint64_t v10 = 0LL;
    }

    else
    {
      uint64_t v10 = SSError(SSErrorDomain, 119LL, 0LL, 0LL);
    }

    -[StoreServicesRequestQueue _sendMessageWithError:toClient:](self, "_sendMessageWithError:toClient:", v10, v11);
  }

  else
  {
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v11);
  }
}

- (void)authorizeMachineWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSAuthorizationRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    id v8 = -[AuthorizeMachineOperation initWithAuthorizationRequest:]( objc_alloc(&OBJC_CLASS___AuthorizeMachineOperation),  "initWithAuthorizationRequest:",  v7);
    if (objc_msgSend(objc_msgSend(v7, "clientIdentifierHeader"), "length")) {
      id v9 = v7;
    }
    else {
      id v9 = v6;
    }
    -[AuthorizeMachineOperation setClientIdentifierHeader:]( v8,  "setClientIdentifierHeader:",  [v9 clientIdentifierHeader]);
    if (objc_msgSend(objc_msgSend(v7, "userAgent"), "length")) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = v6;
    }
    -[AuthorizeMachineOperation setUserAgent:](v8, "setUserAgent:", [v10 userAgent]);
    -[AuthorizeMachineOperation setShouldPromptForCredentials:]( v8,  "setShouldPromptForCredentials:",  [v7 shouldPromptForCredentials]);
    -[AuthorizeMachineOperation setShouldAddKeysToKeyBag:]( v8,  "setShouldAddKeysToKeyBag:",  [v7 shouldAddKeysToKeyBag]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100059FA8;
    v19[3] = &unk_10034BD60;
    v19[4] = v8;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v8,  v6,  v19);
  }

  else
  {
    id v11 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v12 = [v11 shouldLog];
    else {
      LODWORD(v13) = v12;
    }
    uint64_t v14 = (os_log_s *)[v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      int v20 = 138412546;
      uint64_t v21 = objc_opt_class(self);
      __int16 v22 = 2112;
      id v23 = v6;
      uint64_t v15 = _os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%@: Cannot authorize for unentitled client: %@",  &v20,  22);
      if (v15)
      {
        v16 = (void *)v15;
        v17 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v15, 4LL);
        free(v16);
        v18 = v17;
        SSFileLog(v11, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v18);
  }
}

- (void)checkinRentalWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSRentalCheckinRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    id v8 = -[CheckinRentalOperation initWithCheckinRequest:]( objc_alloc(&OBJC_CLASS___CheckinRentalOperation),  "initWithCheckinRequest:",  v7);
    -[CheckinRentalOperation setClientIdentifierHeader:]( v8,  "setClientIdentifierHeader:",  [v6 clientIdentifierHeader]);
    -[CheckinRentalOperation setUserAgent:](v8, "setUserAgent:", [v6 userAgent]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10005A234;
    v15[3] = &unk_10034BD60;
    v15[4] = v8;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v8,  v6,  v15);
  }

  else
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    unsigned int v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v16 = 138412546;
      uint64_t v17 = objc_opt_class(self);
      __int16 v18 = 2112;
      id v19 = v6;
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Cannot checkin rental for unentitled client: %@",  &v16,  22);
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        SSFileLog(v9, @"%@");
      }
    }
  }
}

- (void)checkoutRentalWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSRentalCheckoutRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    if ([v7 accountIdentifier] && objc_msgSend(v7, "rentalKeyIdentifier"))
    {
      id v8 = -[CheckoutRentalKeysOperation initWithAccountIdentifier:rentalKeyIdentifier:]( [CheckoutRentalKeysOperation alloc],  "initWithAccountIdentifier:rentalKeyIdentifier:",  [v7 accountIdentifier],  objc_msgSend(v7, "rentalKeyIdentifier"));
    }

    else
    {
      id v15 = [v7 sinfs];
      if (![v15 count])
      {
        id v18 = [v7 downloadIdentifier];
        if (v18)
        {
          id v19 = -[StoreDownload initWithContentsOfFile:]( [StoreDownload alloc],  "initWithContentsOfFile:",  objc_msgSend( +[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:]( ScratchManager,  "directoryPathForDownloadID:kind:createIfNeeded:",  v18,  0,  1),  "stringByAppendingPathComponent:",  @"iTunesMetadata.plist"));
          int v16 = (CheckoutRentalKeysOperation *)-[StoreDownload sinfs](v19, "sinfs");
          if (v16) {
            int v16 = -[CheckoutRentalKeysOperation initWithStoreDownloadSinfs:]( objc_alloc(&OBJC_CLASS___CheckoutRentalKeysOperation),  "initWithStoreDownloadSinfs:",  v16);
          }

          if (v16) {
            goto LABEL_19;
          }
        }

        goto LABEL_26;
      }

      id v8 = -[CheckoutRentalKeysOperation initWithSinfs:]( objc_alloc(&OBJC_CLASS___CheckoutRentalKeysOperation),  "initWithSinfs:",  v15);
    }

    int v16 = v8;
    if (v8)
    {
LABEL_19:
      -[CheckoutRentalKeysOperation setBackgroundCheckout:](v16, "setBackgroundCheckout:", 1LL);
      -[CheckoutRentalKeysOperation setCheckoutWithPlay:]( v16,  "setCheckoutWithPlay:",  [v7 shouldCheckoutWithPlay]);
      -[CheckoutRentalKeysOperation setClientIdentifierHeader:]( v16,  "setClientIdentifierHeader:",  [v6 clientIdentifierHeader]);
      uint64_t v17 = (char *)[v7 checkoutType];
      -[CheckoutRentalKeysOperation setShouldValidateRentalInfo:]( v16,  "setShouldValidateRentalInfo:",  [v7 shouldValidateRentalInfo]);
      -[CheckoutRentalKeysOperation setUserAgent:](v16, "setUserAgent:", [v6 userAgent]);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10005A680;
      v20[3] = &unk_10034BD60;
      v20[4] = v16;
      -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v16,  v6,  v20);

      goto LABEL_27;
    }

- (void)demoteApplicationWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    id v8 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v7);
    id v9 = -[DemoteApplicationOperation initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___DemoteApplicationOperation),  "initWithBundleIdentifier:",  v8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10005A830;
    v10[3] = &unk_10034BD60;
    v10[4] = v9;
    -[StoreServicesRequestQueue addOperation:forMessage:connection:replyBlock:]( self,  "addOperation:forMessage:connection:replyBlock:",  v9,  a3,  a4,  v10);
  }

  else
  {
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4);
  }

- (void)getAccountPurchaseHistoryWithMessage:(id)a3 connection:(id)a4
{
  uint64_t v7 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", a4);
  if (-[XPCClient hasEntitlements](v7, "hasEntitlements"))
  {
    id v8 = -[SSMutableAuthenticationContext initWithXPCEncoding:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    xpc_object_t value = xpc_dictionary_get_value(a3, "2");
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___SSPurchaseHistoryItem);
    uint64_t v11 = (void *)SSXPCCreateNSArrayFromXPCEncodedArray(value, v10);
    if (!-[SSMutableAuthenticationContext clientIdentifierHeader](v8, "clientIdentifierHeader")) {
      -[SSMutableAuthenticationContext setClientIdentifierHeader:]( v8,  "setClientIdentifierHeader:",  -[XPCClient clientIdentifierHeader](v7, "clientIdentifierHeader"));
    }
    id v12 = -[SSMutableAuthenticationContext HTTPHeaders](v8, "HTTPHeaders");
    uint64_t v13 = SSHTTPHeaderUserAgent;
    if (![v12 objectForKey:SSHTTPHeaderUserAgent]) {
      -[SSMutableAuthenticationContext setValue:forHTTPHeaderField:]( v8,  "setValue:forHTTPHeaderField:",  -[XPCClient userAgent](v7, "userAgent"),  v13);
    }
    uint64_t v14 = -[PurchaseHistoryOperation initWithPurchaseHistoryItems:authenticationContext:]( objc_alloc(&OBJC_CLASS___PurchaseHistoryOperation),  "initWithPurchaseHistoryItems:authenticationContext:",  v11,  v8);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10005AB50;
    v23[3] = &unk_10034BD60;
    v23[4] = v14;
    -[StoreServicesRequestQueue addOperation:forMessage:connection:replyBlock:]( self,  "addOperation:forMessage:connection:replyBlock:",  v14,  a3,  a4,  v23);
  }

  else
  {
    id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v16 = [v15 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    id v18 = (os_log_s *)[v15 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      int v24 = 138412546;
      uint64_t v25 = objc_opt_class(self);
      __int16 v26 = 2112;
      v27 = v7;
      uint64_t v19 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Cannot get purchase history for unentitled client: %@",  &v24,  22);
      if (v19)
      {
        int v20 = (void *)v19;
        int v21 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
        free(v20);
        uint64_t v22 = v21;
        SSFileLog(v15, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v7, v22);
  }
}

- (void)getApplicationWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementSoftwareLibrary) & 1) != 0)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005AC6C;
    v8[3] = &unk_10034AE70;
    v8[4] = a3;
    v8[5] = a4;
    dispatch_async(global_queue, v8);
  }

  else
  {
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4);
  }

- (void)getApplicationCapabilitiesMessage:(id)a3 connection:(id)a4
{
  BOOL v7 = (SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementSoftwareLibrary);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005AE10;
  v9[3] = &unk_10034C5B0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  BOOL v10 = v7;
  dispatch_async(global_queue, v9);
}

- (void)getAvailableItemKindsWithMessage:(id)a3 connection:(id)a4
{
  BOOL v7 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", a4);
  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  id v8 = +[SSDevice copyCachedAvailableItemKinds](&OBJC_CLASS___SSDevice, "copyCachedAvailableItemKinds");
  if (v8)
  {
    id v9 = v8;
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    SSXPCDictionarySetCFObject(reply, "1", [v9 allObjects]);
    xpc_connection_send_message((xpc_connection_t)a4, reply);

    xpc_release(reply);
  }

  else
  {
    uint64_t v11 = +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL);
    id v12 = -[XPCClient userAgent](v7, "userAgent");
    -[SSURLBagContext setValue:forHTTPHeaderField:](v11, "setValue:forHTTPHeaderField:", v12, SSHTTPHeaderUserAgent);
    uint64_t v13 = -[ISLoadURLBagOperation initWithBagContext:]( objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation),  "initWithBagContext:",  v11);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10005B094;
    v14[3] = &unk_10034BD60;
    v14[4] = v13;
    -[StoreServicesRequestQueue addOperation:forMessage:connection:replyBlock:]( self,  "addOperation:forMessage:connection:replyBlock:",  v13,  a3,  a4,  v14);
  }
}

- (void)getFamilyCircleWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSFamilyCircleRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    id v8 = objc_alloc_init(&OBJC_CLASS___FamilyCircleOperation);
    -[FamilyCircleOperation setAuthenticationPromptStyle:]( v8,  "setAuthenticationPromptStyle:",  [v7 authenticationPromptStyle]);
    -[FamilyCircleOperation setClientAuditTokenData:]( v8,  "setClientAuditTokenData:",  [v6 auditTokenData]);
    -[FamilyCircleOperation setFetchITunesAccountNames:]( v8,  "setFetchITunesAccountNames:",  [v7 fetchITunesAccountNames]);
    -[FamilyCircleOperation setUserAgent:](v8, "setUserAgent:", [v6 userAgent]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10005B32C;
    v15[3] = &unk_10034BD60;
    v15[4] = v8;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v8,  v6,  v15);
  }

  else
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    id v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v16 = 138412290;
      uint64_t v17 = objc_opt_class(self);
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Could get family circle for unentitled client",  &v16,  12);
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        SSFileLog(v9, @"%@");
      }
    }
  }
}

- (void)getKBSyncWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementKBSync) & 1) != 0)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005B430;
    v8[3] = &unk_10034AE70;
    v8[4] = a3;
    v8[5] = a4;
    dispatch_async(global_queue, v8);
  }

  else
  {
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4);
  }

- (void)getMediaSocialShareExtensionVisibilityWithMessage:(id)a3 connection:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_BOOL( reply,  "1",  (BOOL)objc_msgSend( +[SSVMediaSocialAdminPermissionsCoordinator sharedCoordinator]( SSVMediaSocialAdminPermissionsCoordinator,  "sharedCoordinator"),  "isCurrentUserAdmin"));
  xpc_connection_send_message((xpc_connection_t)a4, reply);
  xpc_release(reply);
}

- (void)getPlayInfoWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSPlayInfoRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    id v8 = -[GetPlayInfoOperation initWithPlayInfoRequestContext:]( [GetPlayInfoOperation alloc],  "initWithPlayInfoRequestContext:",  [v7 playInfoContext]);
    -[GetPlayInfoOperation setClientIdentifierHeader:]( v8,  "setClientIdentifierHeader:",  [v6 clientIdentifierHeader]);
    -[GetPlayInfoOperation setUserAgent:](v8, "setUserAgent:", [v6 userAgent]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10005B7C8;
    v17[3] = &unk_10034BD60;
    v17[4] = v8;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v8,  v6,  v17);
  }

  else
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    id v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v18 = 138412546;
      uint64_t v19 = objc_opt_class(self);
      __int16 v20 = 2112;
      id v21 = v6;
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Cannot get play info for unentitled client: %@",  &v18,  22);
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        id v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        int v16 = v15;
        SSFileLog(v9, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v16);
  }
}

- (void)getSoftwareLibraryItemsWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementSoftwareLibrary) & 1) != 0)
  {
    id v7 = (void *)SSXPCConnectionCopyClientIdentifier(a4, 0LL);
    id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    uint64_t v11 = (os_log_s *)[v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v31 = 138543618;
      uint64_t v32 = objc_opt_class(self);
      __int16 v33 = 2114;
      v34 = v7;
      uint64_t v12 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%{public}@: Performing a software-library lookup operation on behalf of %{public}@…",  &v31,  22);
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        v29 = v14;
        SSFileLog(v8, @"%@");
      }
    }

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
    int v16 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v15);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray);
    int v18 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "2", v17);
    uint64_t v19 = objc_alloc(&OBJC_CLASS___SoftwareLibraryLookupOperation);
    if (v18) {
      __int16 v20 = -[SoftwareLibraryLookupOperation initWithItemIdentifiers:](v19, "initWithItemIdentifiers:", v18);
    }
    else {
      __int16 v20 = -[SoftwareLibraryLookupOperation initWithBundleIdentifiers:](v19, "initWithBundleIdentifiers:", v16);
    }
    id v21 = v20;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10005BB98;
    v30[3] = &unk_10034BD60;
    v30[4] = v20;
    -[StoreServicesRequestQueue addOperation:forMessage:connection:replyBlock:]( self,  "addOperation:forMessage:connection:replyBlock:",  v20,  a3,  a4,  v30,  v29);
  }

  else
  {
    id v22 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v22) {
      id v22 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v23 = [v22 shouldLog];
    else {
      LODWORD(v24) = v23;
    }
    uint64_t v25 = (os_log_s *)[v22 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v24 = v24;
    }
    else {
      v24 &= 2u;
    }
    if ((_DWORD)v24)
    {
      int v31 = 138412290;
      uint64_t v32 = objc_opt_class(self);
      uint64_t v26 = _os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%@: Cannot get software library for unentitled client",  &v31,  12);
      if (v26)
      {
        v27 = (void *)v26;
        v28 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v26, 4LL);
        free(v27);
        v29 = v28;
        SSFileLog(v22, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4,  v29);
  }

- (void)getRemovableSytemApplicationsWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementSoftwareLibrary) & 1) != 0)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___RemoveableSoftwareLookupOperation);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10005BDE8;
    v16[3] = &unk_10034BD60;
    v16[4] = v7;
    -[StoreServicesRequestQueue addOperation:forMessage:connection:replyBlock:]( self,  "addOperation:forMessage:connection:replyBlock:",  v7,  a3,  a4,  v16);
  }

  else
  {
    id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    uint64_t v11 = (os_log_s *)[v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v17 = 138412290;
      uint64_t v18 = objc_opt_class(self);
      uint64_t v12 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Cannot get software library for unentitled client",  &v17,  12);
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        uint64_t v15 = v14;
        SSFileLog(v8, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4,  v15);
  }

- (void)getUserApplicationsWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementSoftwareLibrary) & 1) != 0)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005BF04;
    v8[3] = &unk_10034AE70;
    v8[4] = a3;
    v8[5] = a4;
    dispatch_async(global_queue, v8);
  }

  else
  {
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4);
  }

- (void)handlePurchaseIntentActionWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSPurchaseIntentActionRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    if (v7)
    {
      id v8 = v7;
      unsigned int v9 = -[PurchaseIntentActionOperation initWithRequest:]( objc_alloc(&OBJC_CLASS___PurchaseIntentActionOperation),  "initWithRequest:",  v7);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10005C180;
      v18[3] = &unk_10034BD60;
      v18[4] = v9;
      -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v9,  v6,  v18);
    }
  }

  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    uint64_t v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class(self);
      __int16 v21 = 2112;
      id v22 = v6;
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Ignoring purchase intent action from unentitled client: %@",  &v19,  22);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        int v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        int v17 = v16;
        SSFileLog(v10, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v17);
  }
}

- (void)hasDemotedApplicationsWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementSoftwareLibrary) & 1) != 0)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___CheckForDemotedApplicationsOperation);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10005C3B0;
    v16[3] = &unk_10034BD60;
    v16[4] = v7;
    -[StoreServicesRequestQueue addOperation:forMessage:connection:replyBlock:]( self,  "addOperation:forMessage:connection:replyBlock:",  v7,  a3,  a4,  v16);
  }

  else
  {
    id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    unsigned int v11 = (os_log_s *)[v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v17 = 138412290;
      uint64_t v18 = objc_opt_class(self);
      uint64_t v12 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Cannot get software library for unentitled client",  &v17,  12);
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        uint64_t v15 = v14;
        SSFileLog(v8, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4,  v15);
  }

- (void)hasDemotedApplicationsWithMessage2:(id)a3 connection:(id)a4
{
  id v5 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v5 hasEntitlements])
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___CheckForDemotedApplicationsOperation);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10005C5C8;
    v13[3] = &unk_10034BD60;
    v13[4] = v6;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v6,  v5,  v13);
  }

  else
  {
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    uint64_t v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v14 = 138412290;
      uint64_t v15 = objc_opt_class(self);
      uint64_t v11 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%@: Could discover if there are demoted applications for unentitled client",  &v14,  12);
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
        free(v12);
        SSFileLog(v7, @"%@");
      }
    }
  }
}

- (void)haveApplicationsOfTypeWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementSoftwareLibrary) & 1) != 0)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005C6D8;
    v8[3] = &unk_10034AE70;
    v8[4] = a3;
    v8[5] = a4;
    dispatch_async(global_queue, v8);
  }

  else
  {
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4);
  }

- (void)invalidateURLBagWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = -[SSURLBagContext initWithXPCEncoding:]( objc_alloc(&OBJC_CLASS___SSURLBagContext),  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    uint64_t v8 = SSHTTPHeaderUserAgent;
    if (!-[SSURLBagContext valueForHTTPHeaderField:](v7, "valueForHTTPHeaderField:", SSHTTPHeaderUserAgent)) {
      -[SSURLBagContext setValue:forHTTPHeaderField:]( v7,  "setValue:forHTTPHeaderField:",  [v6 userAgent],  v8);
    }
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___SSURLBagContext);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
      objc_msgSend( +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"),  "invalidateURLBagForContext:",  v7);
    }
  }

  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    uint64_t v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v16 = 138412546;
      uint64_t v17 = objc_opt_class(self);
      __int16 v18 = 2112;
      id v19 = v6;
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Cannot invalidate URL bag for unentitled client: %@",  &v16,  22);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        SSFileLog(v10, @"%@");
      }
    }
  }
}

- (void)isInstalledAppWithMessage:(id)a3 connection:(id)a4
{
  id v7 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if ([v7 hasEntitlements])
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v9 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v8);
    id v10 = v9;
    if (v9 && [v9 length]) {
      unsigned __int8 v11 = objc_msgSend( +[ApplicationWorkspace defaultWorkspace]( ApplicationWorkspace,  "defaultWorkspace"),  "isInstalledApp:",  v10);
    }
    else {
      unsigned __int8 v11 = 0;
    }
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    xpc_dictionary_set_BOOL(reply, "0", v11);
    xpc_connection_send_message((xpc_connection_t)a4, reply);
    xpc_release(reply);
  }

  else
  {
    id v12 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v12) {
      id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v13 = [v12 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    uint64_t v15 = (os_log_s *)[v12 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if ((_DWORD)v14)
    {
      int v21 = 138412546;
      uint64_t v22 = objc_opt_class(self);
      __int16 v23 = 2112;
      id v24 = v7;
      uint64_t v16 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%@: Cannot check if application is installed for unentitled client: %@",  &v21,  22);
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        __int16 v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        uint64_t v20 = v18;
        SSFileLog(v12, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v7, v20);
  }
}

- (void)isRemovedSystemAppWithMessage:(id)a3 connection:(id)a4
{
  id v7 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if ([v7 hasEntitlements])
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v9 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v8);
    id v10 = v9;
    if (v9 && [v9 length]) {
      unsigned __int8 v11 = objc_msgSend( +[ApplicationWorkspace defaultWorkspace]( ApplicationWorkspace,  "defaultWorkspace"),  "isRemovedSystemApp:",  v10);
    }
    else {
      unsigned __int8 v11 = 0;
    }
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    xpc_dictionary_set_BOOL(reply, "0", v11);
    xpc_connection_send_message((xpc_connection_t)a4, reply);
    xpc_release(reply);
  }

  else
  {
    id v12 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v12) {
      id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v13 = [v12 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    uint64_t v15 = (os_log_s *)[v12 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if ((_DWORD)v14)
    {
      int v21 = 138412546;
      uint64_t v22 = objc_opt_class(self);
      __int16 v23 = 2112;
      id v24 = v7;
      uint64_t v16 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%@: Cannot check if application is hidden for unentitled client: %@",  &v21,  22);
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        __int16 v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        uint64_t v20 = v18;
        SSFileLog(v12, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v7, v20);
  }
}

- (void)playableApplicationsWithMessage:(id)a3 connection:(id)a4
{
  id v7 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementSoftwareLibrary) & 1) != 0)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v9 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v8);
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    xpc_dictionary_set_int64(reply, "0", 1011LL);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v12 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        }

        id v13 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v13);
    }

    SSXPCDictionarySetCFObject(reply, "1", v10);
    xpc_connection_send_message((xpc_connection_t)a4, reply);
    xpc_release(reply);
  }

  else
  {
    id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v17) {
      id v17 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v18 = [v17 shouldLog];
    else {
      LODWORD(v19) = v18;
    }
    uint64_t v20 = (os_log_s *)[v17 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      int v30 = 138412546;
      uint64_t v31 = objc_opt_class(self);
      __int16 v32 = 2112;
      id v33 = v7;
      uint64_t v21 = _os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[%@]: Cannot check if applications are playable for unentitled client: %@",  &v30,  22);
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        __int16 v23 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
        free(v22);
        id v24 = v23;
        SSFileLog(v17, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4,  v24);
  }
}

- (void)keybagRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = -[SSKeybagRequest initWithXPCEncoding:]( objc_alloc(&OBJC_CLASS___SSKeybagRequest),  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    uint64_t v8 = -[KeybagRequestOperation initWithKeybagRequest:client:]( objc_alloc(&OBJC_CLASS___KeybagRequestOperation),  "initWithKeybagRequest:client:",  v7,  v6);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10005D3CC;
    v17[3] = &unk_10034BD60;
    v17[4] = v8;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v8,  v6,  v17);
  }

  else
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    id v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v18 = 138412546;
      uint64_t v19 = objc_opt_class(self);
      __int16 v20 = 2112;
      id v21 = v6;
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Cannot request keybag for unentitled client: %@",  &v18,  22);
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        uint64_t v16 = v15;
        SSFileLog(v9, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v16);
  }
}

- (void)personalizeOffersWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSPersonalizeOffersRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    id v8 = objc_msgSend([ISPersonalizeOffersRequest alloc], "initWithItems:", objc_msgSend(v7, "items"));
    objc_msgSend( v8,  "setAccountIdentifier:",  objc_msgSend( objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"),  "uniqueIdentifier"));
    id v9 = [[ISPersonalizeOffersOperation alloc] initWithPersonalizeOffersRequest:v8];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10005D688;
    v18[3] = &unk_10034BD60;
    v18[4] = v9;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v9,  v6,  v18);
  }

  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    uint64_t v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class(self);
      __int16 v21 = 2112;
      id v22 = v6;
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Cannot personalize for unentitled client: %@",  &v19,  22);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        uint64_t v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        id v17 = v16;
        SSFileLog(v10, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v17);
  }
}

- (void)pushNotificationTokenRequestWithMessage:(id)a3 connection:(id)a4
{
  id v7 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementPushNotifications) & 1) != 0)
  {
    id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    unsigned int v11 = (os_log_s *)[v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v25 = 138543362;
      uint64_t v26 = objc_opt_class(self);
      uint64_t v12 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%{public}@: Received request to post push tokens",  &v25,  12);
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        id v24 = v14;
        SSFileLog(v8, @"%@");
      }
    }

    -[PushNotificationController postPushTokens]( +[PushNotificationController sharedInstance](&OBJC_CLASS___PushNotificationController, "sharedInstance", v24),  "postPushTokens");
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    if (reply)
    {
      uint64_t v16 = reply;
      xpc_dictionary_set_BOOL(reply, "1", 1);
      SSXPCDictionarySetCFObject(v16, "2", 0LL);
      xpc_connection_send_message((xpc_connection_t)a4, v16);
      xpc_release(v16);
    }
  }

  else
  {
    id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v17) {
      id v17 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v18 = [v17 shouldLog];
    else {
      LODWORD(v19) = v18;
    }
    uint64_t v20 = (os_log_s *)[v17 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      int v25 = 138543618;
      uint64_t v26 = objc_opt_class(self);
      __int16 v27 = 2114;
      id v28 = v7;
      uint64_t v21 = _os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "%{public}@: Rejecting push notification request from unentitled client: %{public}@",  &v25,  22);
      if (v21)
      {
        id v22 = (void *)v21;
        __int16 v23 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
        free(v22);
        id v24 = v23;
        SSFileLog(v17, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v7, v24);
  }
}

- (void)pushNotificationRequestWithMessage:(id)a3 connection:(id)a4
{
  id v7 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0
    || (SSXPCConnectionHasEntitlement(a4, kSSITunesStoreEntitlementPushNotifications) & 1) != 0)
  {
    id v8 = objc_msgSend( [SSVPushNotificationRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    unsigned int v9 = -[PushNotificationRequestOperation initWithPushNotificationParameters:]( [PushNotificationRequestOperation alloc],  "initWithPushNotificationParameters:",  [v8 pushNotificationParameters]);
    -[PushNotificationRequestOperation setUserAgent:](v9, "setUserAgent:", [v7 userAgent]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10005DC50;
    v18[3] = &unk_10034BD60;
    v18[4] = v9;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v9,  v7,  v18);
  }

  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    uint64_t v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class(self);
      __int16 v21 = 2112;
      id v22 = v7;
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Rejecting push notification request from unentitled client: %@",  &v19,  22);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        uint64_t v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        id v17 = v16;
        SSFileLog(v10, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v7, v17);
  }
}

- (void)redeemCodesWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSRedeemCodesRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    id v8 = -[RedeemCodesOperation initWithRedeemCodes:]( [RedeemCodesOperation alloc],  "initWithRedeemCodes:",  [v7 redeemCodes]);
    -[RedeemCodesOperation setHeadless:](v8, "setHeadless:", [v7 headless]);
    -[RedeemCodesOperation setCameraRecognized:](v8, "setCameraRecognized:", [v7 cameraRecognized]);
    -[RedeemCodesOperation setAuthenticationContext:]( v8,  "setAuthenticationContext:",  [v7 authenticationContext]);
    -[RedeemCodesOperation setLogCorrelationKey:](v8, "setLogCorrelationKey:", [v7 logCorrelationKey]);
    -[RedeemCodesOperation setParams:](v8, "setParams:", [v7 params]);
    -[RedeemCodesOperation setUserAgent:](v8, "setUserAgent:", [v6 userAgent]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10005DF48;
    v17[3] = &unk_10034BD60;
    v17[4] = v8;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v8,  v6,  v17);
  }

  else
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    uint64_t v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v18 = 138412546;
      uint64_t v19 = objc_opt_class(self);
      __int16 v20 = 2112;
      id v21 = v6;
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Cannot redeem codes for unentitled client: %@",  &v18,  22);
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        uint64_t v16 = v15;
        SSFileLog(v9, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v16);
  }
}

- (void)rentalSyncRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSRentalSyncRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    id v8 = [v7 accountIdentifier];
    id v9 = [v7 sinfs];
    if (v8)
    {
      unsigned int v10 = -[SyncRentalOperation initWithAccountIdentifier:]( [SyncRentalOperation alloc],  "initWithAccountIdentifier:",  [v7 accountIdentifier]);
    }

    else
    {
      id v18 = v9;
      if (![v9 count]) {
        goto LABEL_20;
      }
      unsigned int v10 = -[SyncRentalOperation initWithSinfs:](objc_alloc(&OBJC_CLASS___SyncRentalOperation), "initWithSinfs:", v18);
    }

    uint64_t v19 = v10;
    if (v10)
    {
      -[SyncRentalOperation setClientIdentifierHeader:]( v10,  "setClientIdentifierHeader:",  [v6 clientIdentifierHeader]);
      -[SyncRentalOperation setUserAgent:](v19, "setUserAgent:", [v6 userAgent]);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10005E25C;
      v21[3] = &unk_10034BD60;
      v21[4] = v19;
      -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v19,  v6,  v21);

LABEL_21:
      goto LABEL_22;
    }

- (void)saveInstallAttributionParamsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSInstallAttributionParamsRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    if (v7)
    {
      id v8 = v7;
      id v9 = -[SaveInstallAttributionParamsOperation initWithRequest:]( objc_alloc(&OBJC_CLASS___SaveInstallAttributionParamsOperation),  "initWithRequest:",  v7);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10005E558;
      v18[3] = &unk_10034BD60;
      v18[4] = v9;
      -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v9,  v6,  v18);
    }

    else
    {
      -[StoreServicesRequestQueue _sendMessageWithError:toClient:]( self,  "_sendMessageWithError:toClient:",  SSError(SSErrorDomain, 100LL, 0LL, 0LL),  v6);
    }
  }

  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    uint64_t v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class(self);
      __int16 v21 = 2112;
      id v22 = v6;
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Ignoring install attribution params from unentitled client: %@",  &v19,  22);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        uint64_t v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        id v17 = v16;
        SSFileLog(v10, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v17);
  }
}

- (void)sdk_getStorefrontCountryCodeWithMessage:(id)a3 connection:(id)a4
{
  v20[0] = v19[0];
  v20[1] = v19[1];
  if (TCCAccessCheckAuditToken(kTCCServiceMediaLibrary, v20, 0LL))
  {
    id v7 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", a4);
    id v8 = +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL);
    id v9 = -[XPCClient userAgent](v7, "userAgent");
    -[SSURLBagContext setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", v9, SSHTTPHeaderUserAgent);
    id v10 = -[ISLoadURLBagOperation initWithBagContext:]( objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation),  "initWithBagContext:",  v8);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10005E7D0;
    v18[3] = &unk_10034BD60;
    v18[4] = v10;
    -[StoreServicesRequestQueue addOperation:forMessage:connection:replyBlock:]( self,  "addOperation:forMessage:connection:replyBlock:",  v10,  a3,  a4,  v18);
  }

  else
  {
    id v11 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v12 = [v11 shouldLog];
    else {
      LODWORD(v13) = v12;
    }
    uint64_t v14 = (os_log_s *)[v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      uint64_t v15 = objc_opt_class(self);
      LODWORD(v20[0]) = 138543362;
      *(void *)((char *)v20 + 4) = v15;
      uint64_t v16 = _os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%{public}@: Cannot load storefront country code for unauthorized client",  v20,  12);
      if (v16)
      {
        id v17 = (void *)v16;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        SSFileLog(v11, @"%@");
      }
    }
  }

- (void)sendAskToBuyWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSAskPermissionActionRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    id v8 = -[AskPermissionActionOperation initWithURL:account:]( [AskPermissionActionOperation alloc],  "initWithURL:account:",  [v7 URL],  objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10005EBCC;
    v15[3] = &unk_10034BD60;
    v15[4] = v8;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v8,  v6,  v15);
  }

  else
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    unsigned int v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v16 = 138412290;
      uint64_t v17 = objc_opt_class(self);
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Could not do ATB for unentitled client",  &v16,  12);
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        SSFileLog(v9, @"%@");
      }
    }
  }
}

- (void)sendInstallAttributionPingbackWithMessage:(id)a3 connection:(id)a4
{
  id v5 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  id v6 = +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  [v5 clientIdentifier],  0);
  if (!v6)
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    unsigned int v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v24 = 138543618;
      uint64_t v25 = objc_opt_class(self);
      __int16 v26 = 2114;
      id v27 = [v5 clientIdentifier];
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  16LL,  "[%{public}@]: Did not find proxy for bundle id: %{public}@",  &v24,  22);
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        SSFileLog(v9, @"%@");
      }
    }

    uint64_t v15 = SSErrorDomain;
    uint64_t v16 = 108LL;
    goto LABEL_28;
  }

  id v7 = [v6 itemID];
  if (!v7)
  {
    id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v17) {
      id v17 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v18 = [v17 shouldLog];
    else {
      LODWORD(v19) = v18;
    }
    uint64_t v20 = (os_log_s *)[v17 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      int v24 = 138543618;
      uint64_t v25 = objc_opt_class(self);
      __int16 v26 = 2114;
      id v27 = [v5 clientIdentifier];
      uint64_t v21 = _os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  16LL,  "[%{public}@]: Did not find adam id for bundle id: %{public}@",  &v24,  22);
      if (v21)
      {
        id v22 = (void *)v21;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
        free(v22);
        SSFileLog(v17, @"%@");
      }
    }

    uint64_t v15 = SSErrorDomain;
    uint64_t v16 = 116LL;
LABEL_28:
    -[StoreServicesRequestQueue _sendMessageWithError:toClient:]( self,  "_sendMessageWithError:toClient:",  SSError(v15, v16, 0LL, 0LL),  v5);
    goto LABEL_29;
  }

  id v8 = -[SendInstallAttributionPingbackOperation initWithAdamId:]( objc_alloc(&OBJC_CLASS___SendInstallAttributionPingbackOperation),  "initWithAdamId:",  v7);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10005EF54;
  v23[3] = &unk_10034BD60;
  v23[4] = v8;
  -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v8,  v5,  v23);

LABEL_29:
}

- (void)showDialogRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:", a3, a4);
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend( [SSVShowDialogRequest alloc],  "initWithXPCEncoding:",  xpc_dictionary_get_value(a3, "1"));
    id v8 = -[ISDialog initWithXPCEncoding:]( [ISDialog alloc],  "initWithXPCEncoding:",  [v7 encodedDialog]);
    id v9 = -[DaemonDialogOperation initWithDialog:]( objc_alloc(&OBJC_CLASS___DaemonDialogOperation),  "initWithDialog:",  v8);
    -[DaemonDialogOperation setDisplaysOnLockscreen:]( v9,  "setDisplaysOnLockscreen:",  objc_msgSend(-[ISDialog authenticationContext](v8, "authenticationContext"), "displaysOnLockScreen"));
    -[DaemonDialogOperation setOutputBlock:](v9, "setOutputBlock:", &stru_10034C618);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10005F1FC;
    v18[3] = &unk_10034BD60;
    v18[4] = v9;
    -[StoreServicesRequestQueue addOperation:forClient:withMessageBlock:]( self,  "addOperation:forClient:withMessageBlock:",  v9,  v6,  v18);
  }

  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    uint64_t v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class(self);
      __int16 v21 = 2112;
      id v22 = v6;
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Cannot show dialog for unentitled client: %@",  &v19,  22);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        uint64_t v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        id v17 = v16;
        SSFileLog(v10, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v17);
  }
}

- (void)showServerPromptWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    id v8 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v7);
    id v9 = -[ShowServerPromptOperation initWithPromptIdentifier:]( objc_alloc(&OBJC_CLASS___ShowServerPromptOperation),  "initWithPromptIdentifier:",  v8);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10005F464;
    v18[3] = &unk_10034BD60;
    v18[4] = v9;
    -[StoreServicesRequestQueue addOperation:forMessage:connection:replyBlock:]( self,  "addOperation:forMessage:connection:replyBlock:",  v9,  a3,  a4,  v18);
  }

  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    uint64_t v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v19 = 138412290;
      uint64_t v20 = objc_opt_class(self);
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Cannot show prompt for unentitled client",  &v19,  12);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        uint64_t v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        id v17 = v16;
        SSFileLog(v10, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4,  v17);
  }

- (void)softwareLibraryItemSetValuesWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    id v8 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1", v7);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v10 = (void *)SSXPCDictionaryCopyCFObjectWithClass(a3, "2", v9);
    unsigned int v11 = -[SoftwareLibraryUpdateOperation initWithBundleIdentifier:changeset:]( objc_alloc(&OBJC_CLASS___SoftwareLibraryUpdateOperation),  "initWithBundleIdentifier:changeset:",  v8,  v10);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    _OWORD v20[2] = sub_10005F6D8;
    v20[3] = &unk_10034BD60;
    v20[4] = v11;
    -[StoreServicesRequestQueue addOperation:forMessage:connection:replyBlock:]( self,  "addOperation:forMessage:connection:replyBlock:",  v11,  a3,  a4,  v20);
  }

  else
  {
    id v12 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v12) {
      id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v13 = [v12 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    uint64_t v15 = (os_log_s *)[v12 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if ((_DWORD)v14)
    {
      int v21 = 138412290;
      uint64_t v22 = objc_opt_class(self);
      uint64_t v16 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%@: Cannot set software properties for unentitled client",  &v21,  12);
      if (v16)
      {
        id v17 = (void *)v16;
        unsigned int v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        int v19 = v18;
        SSFileLog(v12, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4,  v19);
  }

- (void)collectURLSessionDataWithMessage:(id)a3 connection:(id)a4
{
  if ((SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement) & 1) != 0)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005F8F8;
    block[3] = &unk_10034AE70;
    block[4] = a3;
    block[5] = a4;
    dispatch_async(global_queue, block);
  }

  else
  {
    id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    unsigned int v11 = (os_log_s *)[v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v17 = 138412290;
      uint64_t v18 = objc_opt_class(self);
      uint64_t v12 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Cannot collect .har file for unentitled client",  &v17,  12);
      if (v12)
      {
        unsigned int v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        uint64_t v15 = v14;
        SSFileLog(v8, @"%@");
      }
    }

    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:]( self,  "_sendUnentitledReplyForMessage:connection:",  a3,  a4,  v15);
  }

- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5
{
  v6[1] = 3221225472LL;
  v6[2] = sub_10005F9D4;
  v6[3] = &unk_10034BD88;
  v6[4] = a5;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___StoreServicesRequestQueue;
  v6[0] = _NSConcreteStackBlock;
  -[RequestQueue addOperation:forClient:withMessageBlock:](&v5, "addOperation:forClient:withMessageBlock:", a3, a4, v6);
}

- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6
{
  v7[1] = 3221225472LL;
  v7[2] = sub_10005FA8C;
  v7[3] = &unk_10034BD88;
  v7[4] = a6;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___StoreServicesRequestQueue;
  v7[0] = _NSConcreteStackBlock;
  -[RequestQueue addOperation:forMessage:connection:replyBlock:]( &v6,  "addOperation:forMessage:connection:replyBlock:",  a3,  a4,  a5,  v7);
}

- (id)_newClientWithMessage:(id)a3 connection:(id)a4
{
  objc_super v5 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", a4);
  xpc_object_t value = (_xpc_endpoint_s *)xpc_dictionary_get_value(a3, "2");
  if (value)
  {
    uint64_t v7 = value;
    if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_endpoint)
    {
      xpc_connection_t v8 = xpc_connection_create_from_endpoint(v7);
      if (v8)
      {
        xpc_connection_t v9 = v8;
        -[XPCClient setOutputConnectionWithConnection:](v5, "setOutputConnectionWithConnection:", v8);
        xpc_release(v9);
      }
    }
  }

  return v5;
}

- (void)_sendMessageWithError:(id)a3 toClient:(id)a4
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v6, "0", 1011LL);
  SSXPCDictionarySetCFObject(v6, "2", a3);
  objc_msgSend(objc_msgSend(a4, "outputConnection"), "sendMessage:", v6);
  xpc_release(v6);
}

- (void)_sendUnentitledMessageToClient:(id)a3
{
}

- (void)_sendUnentitledReplyForMessage:(id)a3 connection:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    xpc_object_t v6 = reply;
    uint64_t v7 = SSError(SSErrorDomain, 107LL, 0LL, 0LL);
    SSXPCDictionarySetCFObject(v6, "2", v7);
    xpc_connection_send_message((xpc_connection_t)a4, v6);
    xpc_release(v6);
  }

@end