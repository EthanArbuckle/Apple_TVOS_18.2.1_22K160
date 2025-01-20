@interface PDPaymentUserCommunicationManager
- (BOOL)_safariCredentialImportNotifiedForCredential:(id)a3;
- (PDPaymentUserCommunicationManager)init;
- (PDPaymentUserCommunicationManager)initWithNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 applicationMessageManager:(id)a5;
- (id)_applicationMessageContentForSafariImportCardWithSink:(id)a3 registration:(id)a4;
- (id)_applicationMessageContentForSafariImportConsentWithSink:(id)a3 registration:(id)a4;
- (id)_fpanSuffixFromSafariImportCardApplicationMessageIdentifier:(id)a3;
- (id)_keychainItemWithIdentifier:(id)a3;
- (id)_networkNameFromSafariImportCardApplicationMessageIdentifier:(id)a3;
- (id)_notifiedIdentifierForCredential:(id)a3;
- (id)_notifiedIdentifiersForKeychainItemIdentifier:(id)a3;
- (id)_safariIconImage;
- (id)_safariImportCardApplicationMessageIdentifierForCredential:(id)a3;
- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4;
- (void)_addNotifiedIdentifier:(id)a3 forKeychainItemIdentifier:(id)a4;
- (void)_addSafariCredentialImportNotifiedForCredential:(id)a3;
- (void)_handlePossibleVPANIssued:(id)a3 fromPreviousApplications:(id)a4;
- (void)_notificationsSupportedForType:(int64_t)a3 completion:(id)a4;
- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4;
- (void)clearSafariCredentialImportMessages;
- (void)clearSafariCredentialImportNotifiedIdentifiers;
- (void)connectApplicationMessageSink:(id)a3;
- (void)handlePaymentPassDidUpdatePaymentApplications:(id)a3 fromPaymentApplications:(id)a4 withCompletion:(id)a5;
- (void)sendSafariCredentialImportConsentNotificationWithCompletion:(id)a3;
- (void)sendSafariCredentialImportNotificationForCredentials:(id)a3 withCompletion:(id)a4;
- (void)sendVirtualCardNumberIssuedDueToTransactionNotificationForPaymentPass:(id)a3 withCompletion:(id)a4;
@end

@implementation PDPaymentUserCommunicationManager

- (PDPaymentUserCommunicationManager)init
{
  return 0LL;
}

- (PDPaymentUserCommunicationManager)initWithNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 applicationMessageManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPaymentUserCommunicationManager;
  v12 = -[PDPaymentUserCommunicationManager init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationManager, a3);
    objc_storeStrong((id *)&v13->_applicationMessageManager, a5);
    objc_storeStrong((id *)&v13->_paymentWebServiceCoordinator, a4);
    sub_10030C3AC((uint64_t)v13->_applicationMessageManager, 3LL, v13);
  }

  return v13;
}

- (void)sendSafariCredentialImportConsentNotificationWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003D1680;
  v4[3] = &unk_10063CAE0;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[PDPaymentUserCommunicationManager _notificationsSupportedForType:completion:]( v5,  "_notificationsSupportedForType:completion:",  0LL,  v4);
}

- (void)sendSafariCredentialImportNotificationForCredentials:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003D1878;
  v9[3] = &unk_10063E0E8;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  -[PDPaymentUserCommunicationManager _notificationsSupportedForType:completion:]( self,  "_notificationsSupportedForType:completion:",  1LL,  v9);
}

- (void)sendVirtualCardNumberIssuedDueToTransactionNotificationForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003D2014;
  v9[3] = &unk_10063E0E8;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  -[PDPaymentUserCommunicationManager _notificationsSupportedForType:completion:]( self,  "_notificationsSupportedForType:completion:",  2LL,  v9);
}

- (void)handlePaymentPassDidUpdatePaymentApplications:(id)a3 fromPaymentApplications:(id)a4 withCompletion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1003D21F0;
  v10[3] = &unk_10065BBC8;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  -[PDPaymentUserCommunicationManager _notificationsSupportedForType:completion:]( v11,  "_notificationsSupportedForType:completion:",  2LL,  v10);
}

- (void)clearSafariCredentialImportMessages
{
  applicationMessageSink = self->_applicationMessageSink;
  if (applicationMessageSink)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKApplicationMessageSink registrations](applicationMessageSink, "registrations", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) key]);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)v9 identifier]);

          LOBYTE(v9) = [v10 isEqualToString:@"SafariImportConsentAMID"];
          unsigned int v11 = [v10 hasPrefix:@"SafariImportCard"];
          if ((v9 & 1) != 0 || v11) {
            -[PKApplicationMessageSink unregisterMessageForIdentifier:]( self->_applicationMessageSink,  "unregisterMessageForIdentifier:",  v10);
          }

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v6);
    }
  }

- (void)clearSafariCredentialImportNotifiedIdentifiers
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _keychainItemWithIdentifier:]( self,  "_keychainItemWithIdentifier:",  @"PDSafariCredentialImportNotified"));
  [v2 resetKeychainItem];
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 key]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);

  LODWORD(v8) = [v9 isEqualToString:@"SafariImportConsentAMID"];
  unsigned int v10 = [v9 hasPrefix:@"SafariImportCard"];
  if ((_DWORD)v8)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _applicationMessageContentForSafariImportConsentWithSink:registration:]( self,  "_applicationMessageContentForSafariImportConsentWithSink:registration:",  v6,  v7));
  }

  else
  {
    if (!v10)
    {
      __int128 v12 = 0LL;
      goto LABEL_7;
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _applicationMessageContentForSafariImportCardWithSink:registration:]( self,  "_applicationMessageContentForSafariImportCardWithSink:registration:",  v6,  v7));
  }

  __int128 v12 = (void *)v11;
LABEL_7:

  return v12;
}

- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "key", a3));
  id v7 = (id)objc_claimAutoreleasedReturnValue([(id)v5 identifier]);

  LOBYTE(v5) = [v7 isEqualToString:@"SafariImportConsentAMID"];
  unsigned int v6 = [v7 hasPrefix:@"SafariImportCard"];
  if ((v5 & 1) != 0 || v6) {
    -[PDPaymentUserCommunicationManager clearSafariCredentialImportMessages]( self,  "clearSafariCredentialImportMessages");
  }
}

- (void)connectApplicationMessageSink:(id)a3
{
}

- (void)_notificationsSupportedForType:(int64_t)a3 completion:(id)a4
{
  unsigned int v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if (PKPassbookIsCurrentlyDeletedByUser())
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDPaymentUserCommunicationManager: Notifications not supported as Wallet has been deleted",  buf,  2u);
      }

      v6[2](v6, 0LL);
      goto LABEL_18;
    }

    if ((unint64_t)a3 >= 2)
    {
      if (a3 != 2)
      {
        uint64_t v12 = 1LL;
LABEL_17:
        v6[2](v6, v12);
        goto LABEL_18;
      }

      if (PKNativeVPANAutofillSupported())
      {
        paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1003D26C4;
        v13[3] = &unk_10065C1E0;
        v13[4] = self;
        __int128 v14 = v6;
        -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v13);

        goto LABEL_18;
      }
    }

    else if (PKSafariCredentialProvisioningEnabled())
    {
      v6[2](v6, 1LL);
      goto LABEL_18;
    }

    uint64_t v12 = 0LL;
    goto LABEL_17;
  }

  uint64_t v9 = PKLogFacilityTypeGetObject(6LL);
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PDPaymentUserCommunicationManager: No completion block provided to eligibility check.",  buf,  2u);
  }

LABEL_18:
}

- (void)_handlePossibleVPANIssued:(id)a3 fromPreviousApplications:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 paymentApplications]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:@"applicationIdentifier"]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"applicationIdentifier IN %@",  v9));

  v32 = v8;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 filteredSetUsingPredicate:v10]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKey:@"applicationIdentifier"]);

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v41 = [v12 count];
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "VPAN Issuance: Checking for change in VPAN status across %ld applications",  buf,  0xCu);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v12;
  id v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v15) {
    goto LABEL_30;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v36;
  v29 = v10;
  id v30 = v6;
  v28 = self;
  while (2)
  {
    for (i = 0LL; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v36 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_1003D2B34;
      v34[3] = &unk_100644D90;
      v34[4] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "pk_anyObjectPassingTest:", v34));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1003D2BBC;
      v33[3] = &unk_100644D90;
      v33[4] = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pk_anyObjectPassingTest:", v33));
      v22 = v21;
      if (!v20 || !v21)
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        *(_WORD *)buf = 0;
        v27 = "VPAN Issuance: Missing an application for comparison, skipping";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
        goto LABEL_25;
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue([v21 virtualCardIdentifier]);

      if (v23)
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        *(_WORD *)buf = 0;
        v27 = "VPAN Issuance: Previous application already had VPAN, won't notify for new issuance";
        goto LABEL_24;
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue([v20 virtualCardIdentifier]);

      if (!v24)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v27 = "VPAN Issuance: New application doesn't have a VPAN";
          goto LABEL_24;
        }

- (id)_applicationMessageContentForSafariImportConsentWithSink:(id)a3 registration:(id)a4
{
  uint64_t v5 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_CONSENT_REQUIRED_APP_MESSAGE_TITLE");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_CONSENT_REQUIRED_APP_MESSAGE_BODY");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = objc_alloc(&OBJC_CLASS___NSURL);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"wallet://%@",  PKUserNotificationActionRouteImportSafariCardConsent));
  uint64_t v11 = -[NSURL initWithString:](v9, "initWithString:", v10);

  uint64_t v12 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_APP_MESSAGE_GROUP_SUMMARY");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"SafariImportCardMessageGroup",  v13,  v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentUserCommunicationManager _safariIconImage](self, "_safariIconImage"));
  if (v15)
  {
    id v16 = +[PKImageDescriptorBitmap createForImage:withTintColor:]( &OBJC_CLASS___PKImageDescriptorBitmap,  "createForImage:withTintColor:",  v15,  0LL);
    id v17 = +[PKApplicationMessageIcon createWithImage:style:]( &OBJC_CLASS___PKApplicationMessageIcon,  "createWithImage:style:",  v16,  0LL);
  }

  else
  {
    id v17 = 0LL;
  }

  id v18 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v11);
  id v19 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v14,  v18,  v17,  v6,  v8);

  return v19;
}

- (id)_applicationMessageContentForSafariImportCardWithSink:(id)a3 registration:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "key", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  uint64_t v7 = objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _fpanSuffixFromSafariImportCardApplicationMessageIdentifier:]( self,  "_fpanSuffixFromSafariImportCardApplicationMessageIdentifier:",  v6));
  uint64_t v8 = objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _networkNameFromSafariImportCardApplicationMessageIdentifier:]( self,  "_networkNameFromSafariImportCardApplicationMessageIdentifier:",  v6));
  uint64_t v9 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_ADD_CARD_APP_MESSAGE_TITLE");
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unint64_t v25 = (void *)v8;
  BOOL v26 = (void *)v7;
  uint64_t v11 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_ADD_CARD_BODY", @"%1$@%2$@", v8, v7);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  __int128 v13 = objc_alloc(&OBJC_CLASS___NSURL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"wallet://%@",  PKUserNotificationActionRouteAddPaymentCard));
  id v15 = -[NSURL initWithString:](v13, "initWithString:", v14);

  uint64_t v16 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_APP_MESSAGE_GROUP_SUMMARY");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"SafariImportCardMessageGroup",  v17,  v17);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentUserCommunicationManager _safariIconImage](self, "_safariIconImage"));
  if (v19)
  {
    id v20 = +[PKImageDescriptorBitmap createForImage:withTintColor:]( &OBJC_CLASS___PKImageDescriptorBitmap,  "createForImage:withTintColor:",  v19,  0LL);
    id v21 = +[PKApplicationMessageIcon createWithImage:style:]( &OBJC_CLASS___PKApplicationMessageIcon,  "createWithImage:style:",  v20,  0LL);
  }

  else
  {
    id v21 = 0LL;
  }

  id v22 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v15);
  id v23 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v18,  v22,  v21,  v10,  v12);

  return v23;
}

- (id)_safariImportCardApplicationMessageIdentifierForCredential:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cardNumber]);
  uint64_t v5 = PKFPANSuffixFromFPAN(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = [v3 credentialType];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%ld_%@",  @"SafariImportCard",  v7,  v6));

  return v8;
}

- (id)_fpanSuffixFromSafariImportCardApplicationMessageIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"_"]);
  if ([v3 count] == (id)3) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:2]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)_networkNameFromSafariImportCardApplicationMessageIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"_"]);
  if ([v3 count] == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:1]);
    id v5 = [v4 integerValue];

    uint64_t v6 = PKDisplayablePaymentNetworkCardNameForPaymentCredentialType(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)_safariIconImage
{
  id v2 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  id v3 = [v2 initWithBundleIdentifier:PKSafariBundleIdentifier allowPlaceholder:0 error:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URL]);
  if (v4)
  {
    id v5 = [[ISIcon alloc] initWithURL:v4];
    double v6 = PKScreenScale(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ISImageDescriptor imageDescriptorNamed:]( &OBJC_CLASS___ISImageDescriptor,  "imageDescriptorNamed:",  kISImageDescriptorTableUIName));
    [v7 setScale:v6];
    objc_msgSend(v7, "setSize:", 45.0, 45.0);
    [v7 setDrawBorder:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 prepareImageForDescriptor:v7]);
    CGImageRef v9 = CGImageRetain((CGImageRef)[v8 CGImage]);
    if (v9)
    {
      unsigned int v10 = v9;
      id v11 = [[PKImage alloc] initWithCGImage:v9 scale:0 orientation:v6];
      CGImageRelease(v10);
    }

    else
    {
      id v11 = 0LL;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (BOOL)_safariCredentialImportNotifiedForCredential:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _notifiedIdentifiersForKeychainItemIdentifier:]( self,  "_notifiedIdentifiersForKeychainItemIdentifier:",  @"PDSafariCredentialImportNotified"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _notifiedIdentifierForCredential:]( self,  "_notifiedIdentifierForCredential:",  v4));

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)_addSafariCredentialImportNotifiedForCredential:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _notifiedIdentifierForCredential:]( self,  "_notifiedIdentifierForCredential:",  a3));
  if (v4)
  {
    id v5 = v4;
    -[PDPaymentUserCommunicationManager _addNotifiedIdentifier:forKeychainItemIdentifier:]( self,  "_addNotifiedIdentifier:forKeychainItemIdentifier:",  v4,  @"PDSafariCredentialImportNotified");
    id v4 = v5;
  }
}

- (id)_notifiedIdentifiersForKeychainItemIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _keychainItemWithIdentifier:]( self,  "_keychainItemWithIdentifier:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecValueData]);
  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSSet, v6);
    CGImageRef v9 = -[NSSet initWithObjects:](v5, "initWithObjects:", v7, objc_opt_class(&OBJC_CLASS___NSData, v8), 0LL);
    id v16 = 0LL;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v4,  &v16));
    id v11 = v16;

    if (v11)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1004429B0((uint64_t)v11, v13);
      }

      id v14 = 0LL;
    }

    else
    {
      id v14 = v10;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (void)_addNotifiedIdentifier:(id)a3 forKeychainItemIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _notifiedIdentifiersForKeychainItemIdentifier:]( self,  "_notifiedIdentifiersForKeychainItemIdentifier:",  v6));
  if (([v7 containsObject:v11] & 1) == 0)
  {
    if (v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 setByAddingObject:v11]);

      uint64_t v7 = (void *)v8;
    }

    else
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v11));
    }

    CGImageRef v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentUserCommunicationManager _keychainItemWithIdentifier:]( self,  "_keychainItemWithIdentifier:",  v6));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  0LL));
    [v9 setObject:v10 forKey:kSecValueData];
  }
}

- (id)_notifiedIdentifierForCredential:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 cardNumber]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataUsingEncoding:4]);

  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 SHA256Hash]);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_keychainItemWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___PKKeychainItemWrapper);
  id v5 = [v4 initWithIdentifier:v3 accessGroup:PKPassdBundleIdentifier serviceName:@"com.apple.passd.payment-user-communication" type:0 invisible:1 accessibility:1];

  [v5 setLabel:@"com.apple.passd.payment-user-communication"];
  return v5;
}

- (void).cxx_destruct
{
}

@end