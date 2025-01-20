@interface CSDThumperPushHandler
- (BOOL)thumperCallingAllowedOnDefaultPairedDeviceDefault;
- (__CFString)ctServiceType;
- (id)serviceDescription;
- (void)displayIncomingPinCode:(id)a3 fromID:(id)a4 completionHandler:(id)a5;
- (void)displayPinMessageForDevice:(id)a3 completionHandler:(id)a4;
- (void)displayPinRequestFailure;
- (void)displayServiceConfirmationWithCompletionHandler:(id)a3;
- (void)enrollDevice:(id)a3 forSenderIdentityUUID:(id)a4;
- (void)pinCodeEnteredSuccessfully:(BOOL)a3 cancelled:(BOOL)a4 onPrimaryDevice:(id)a5;
- (void)setThumperCallingAllowedOnDefaultPairedDeviceDefault:(BOOL)a3;
- (void)unenrollDevice:(id)a3;
- (void)updateUINotification;
@end

@implementation CSDThumperPushHandler

- (__CFString)ctServiceType
{
  return (__CFString *)kCTCapabilityPhoneServices;
}

- (id)serviceDescription
{
  uint64_t v2 = TUBundle(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = TUStringKeyForNetwork(@"THUMPER_SERVICE_NAME");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:v5 value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  return v6;
}

- (void)enrollDevice:(id)a3 forSenderIdentityUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Enabling relay calling on secondary device %@.",  (uint8_t *)&v13,  0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIDOverride]);
  +[TUCallCapabilities setRelayCallingEnabled:forDeviceWithID:]( &OBJC_CLASS___TUCallCapabilities,  "setRelayCallingEnabled:forDeviceWithID:",  1LL,  v9);

  id v10 = sub_1001704C4();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Activating Thumper calling on secondary device %@ for telephony subscription with UUID %@.",  (uint8_t *)&v13,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIDOverride]);
  +[TUCallCapabilities setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:]( &OBJC_CLASS___TUCallCapabilities,  "setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:",  1LL,  v12,  v6);
}

- (void)unenrollDevice:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 uniqueIDOverride]);
  +[TUCallCapabilities setThumperCallingAllowed:onSecondaryDeviceWithID:]( &OBJC_CLASS___TUCallCapabilities,  "setThumperCallingAllowed:onSecondaryDeviceWithID:",  0LL,  v4);

  -[CSDThumperPushHandler updateUINotification](self, "updateUINotification");
}

- (void)displayPinMessageForDevice:(id)a3 completionHandler:(id)a4
{
  id v46 = a4;
  id v5 = a3;
  v45 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  uint64_t v6 = TUStringKeyForNetwork(@"ENTER_CODE_FOR_%@");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 normalizedDeviceType]);

  v47 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingFormat:@"_%@", v8]);
  uint64_t v11 = TUBundle(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v44 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:v47 value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  uint64_t v15 = TUBundle(v13, v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = TUStringKeyForNetwork(@"THUMPER_CALLING");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v43 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:v18 value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  uint64_t v21 = TUBundle(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v42 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"ALLOW" value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  uint64_t v25 = TUBundle(v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue( [v26 localizedStringForKey:@"CANCEL" value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  uint64_t v41 = IMUserNotificationTitleKey;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v44, v45));
  uint64_t v29 = IMUserNotificationMessageKey;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", &stru_1003E7718));
  uint64_t v31 = IMUserNotificationTextFieldValuesKey;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", &stru_1003E7718));
  uint64_t v33 = IMUserNotificationTextFieldTitlesKey;
  uint64_t v34 = IMUserNotificationDefaultButtonTitleKey;
  uint64_t v35 = IMUserNotificationAlternateButtonTitleKey;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 5LL));
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v43,  v41,  v28,  v29,  v30,  v31,  v32,  v33,  v42,  v34,  v27,  v35,  v36,  kCFUserNotificationKeyboardTypesKey,  0LL));

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:",  @"PrimaryDeviceNotification",  3LL,  0LL,  v37,  0.0));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100093EE4;
  v48[3] = &unk_1003D8F30;
  id v49 = v46;
  id v40 = v46;
  [v39 addUserNotification:v38 listener:0 completionHandler:v48];
}

- (void)displayServiceConfirmationWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Showing service confirmation dialog to user",  buf,  2u);
  }

  uint64_t v8 = TUBundle(v6, v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = TUStringKeyForNetwork(@"THUMPER_PUSH_HANDLER_CONSENT_ALERT_MESSAGE");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:v11 value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  uint64_t v15 = TUBundle(v13, v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = TUStringKeyForNetwork(@"THUMPER_PUSH_HANDLER_CONSENT_ALERT_TITLE");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:v18 value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  uint64_t v22 = TUBundle(v20, v21);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"THUMPER_PUSH_HANDLER_CONSENT_ALERT_ENABLE" value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  uint64_t v27 = TUBundle(v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( [v28 localizedStringForKey:@"THUMPER_PUSH_HANDLER_CONSENT_ALERT_CANCEL" value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v19,  IMUserNotificationTitleKey,  v12,  IMUserNotificationMessageKey,  v24,  IMUserNotificationDefaultButtonTitleKey,  v29,  IMUserNotificationAlternateButtonTitleKey,  0LL));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:",  @"SecondaryDeviceNotification",  3LL,  0LL,  v30,  0.0));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000942B8;
  v34[3] = &unk_1003D8F30;
  id v35 = v3;
  id v33 = v3;
  [v32 addUserNotification:v31 listener:0 completionHandler:v34];
}

- (void)pinCodeEnteredSuccessfully:(BOOL)a3 cancelled:(BOOL)a4 onPrimaryDevice:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109376;
    v12[1] = v6;
    __int16 v13 = 1024;
    BOOL v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PIN code entered with success=%d cancelled=%d",  (uint8_t *)v12,  0xEu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
  [v10 removeNotificationsForServiceIdentifier:@"PrimaryDeviceNotification"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
  [v11 removeNotificationsForServiceIdentifier:@"SecondaryDeviceNotification"];

  -[CSDThumperPushHandler updateUINotification](self, "updateUINotification");
  if (v6)
  {
    +[TUCallCapabilities setRelayCallingEnabled:](&OBJC_CLASS___TUCallCapabilities, "setRelayCallingEnabled:", 1LL);
    +[TUCallCapabilities setThumperCallingEnabled:](&OBJC_CLASS___TUCallCapabilities, "setThumperCallingEnabled:", 1LL);
  }

- (void)displayIncomingPinCode:(id)a3 fromID:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1001704C4();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Device Pin Exchange received an incoming approval request",  buf,  2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceForFromID:v8]);

  if ([v13 supportsPhoneCalls])
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 linkedUserURIs]);
    id v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v44;
LABEL_6:
      uint64_t v18 = 0LL;
      while (1)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)IDSCopyRawAddressForDestination(*(void *)(*((void *)&v43 + 1) + 8 * v18));
        if ((IMStringIsPhoneNumber() & 1) != 0) {
          break;
        }

        if (v16 == (id)++v18)
        {
          id v16 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v16) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }

      uint64_t v22 = IMFormattedDisplayStringForNumber(v19, 3LL);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);

      if (v21) {
        goto LABEL_17;
      }
    }

    else
    {
LABEL_12:
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 service]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 uriForFromID:v8]);

    uint64_t v21 = (os_log_s *)IDSCopyRawAddressForDestination(v27);
LABEL_17:
    uint64_t v28 = TUBundle(v23, v24);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = TUStringKeyForNetworkAndProduct(@"RECEIVE_THUMPER_CALLS_FROM_PHONE_NUMBER_ENTER_CODE_%@_%@");
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:v31 value:&stru_1003E7718 table:@"TelephonyUtilities"]);

    uint64_t v35 = TUBundle(v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue( [v36 localizedStringForKey:@"CANCEL" value:&stru_1003E7718 table:@"TelephonyUtilities"]);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v32, v21, v7));
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:",  @"SecondaryDeviceNotification",  v38,  0LL,  v37,  0LL,  0LL));

    if (v39)
    {
      [v39 setUsesNotificationCenter:0];
      [v39 setRepresentedApplicationBundle:TUBundleIdentifierTelephonyUtilitiesFramework];
      id v40 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotificationCenter sharedInstance]( &OBJC_CLASS___IMUserNotificationCenter,  "sharedInstance"));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_100094898;
      v41[3] = &unk_1003D8F30;
      id v42 = v9;
      [v40 addUserNotification:v39 listener:0 completionHandler:v41];
    }
  }

  else
  {
    id v20 = sub_1001704C4();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] We received an incoming pin code alert from a non-telephony device: %@",  buf,  0xCu);
    }
  }
}

- (void)displayPinRequestFailure
{
  id v2 = sub_1001704C4();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request for pin exchange failed", v26, 2u);
  }

  uint64_t v6 = TUBundle(v4, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = TUStringKeyForNetwork(@"THUMPER_PIN_EXCHANGE_REQUEST_FAILED_TITLE");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:v9 value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  uint64_t v13 = TUBundle(v11, v12);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = TUStringKeyForNetworkAndProduct(@"THUMPER_PIN_EXCHANGE_REQUEST_FAILED_MESSAGE");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:v16 value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  uint64_t v20 = TUBundle(v18, v19);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"OK" value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:",  @"SecondaryDeviceNotification",  v10,  v17,  v22,  0LL,  0LL));
  uint64_t v24 = v23;
  if (v23)
  {
    [v23 setUsesNotificationCenter:0];
    [v24 setRepresentedApplicationBundle:TUBundleIdentifierTelephonyUtilitiesFramework];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
    [v25 addUserNotification:v24 listener:0 completionHandler:0];
  }
}

- (void)updateUINotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  TUCallCapabilitiesThumperPinAlertCompletedNotification,  0LL,  0LL,  1u);
}

- (BOOL)thumperCallingAllowedOnDefaultPairedDeviceDefault
{
  return self->_thumperCallingAllowedOnDefaultPairedDeviceDefault;
}

- (void)setThumperCallingAllowedOnDefaultPairedDeviceDefault:(BOOL)a3
{
  self->_thumperCallingAllowedOnDefaultPairedDeviceDefault = a3;
}

@end