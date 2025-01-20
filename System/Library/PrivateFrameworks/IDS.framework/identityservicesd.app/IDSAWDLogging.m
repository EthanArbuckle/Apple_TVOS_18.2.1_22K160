@interface IDSAWDLogging
- (BOOL)_shouldSubmitRegistrationCompletedForServiceIdentifier:(id)a3;
- (void)IDSDeviceConnectionForService:(id)a3 wasSuccessful:(BOOL)a4 clientInitTime:(id)a5 clientOpenSocketCompletionTime:(id)a6 daemonOpenSocketTime:(id)a7 daemonOpenSocketCompletionTime:(id)a8 firstPacketReceiveTime:(id)a9 connectionInitTime:(id)a10;
- (void)IDSGenericConnectionForLink:(unint64_t)a3 connectionSetupStartTime:(id)a4 firstPacketReceiveTime:(id)a5 connectionType:(id)a6 success:(BOOL)a7 errorCode:(id)a8;
- (void)IDSMagnetCorruptionDetailedEvent:(unint64_t)a3 correctRawBytesSinceLastCorruption:(unint64_t)a4 discardedRawBytes:(unint64_t)a5 recoveryTimeInMs:(unint64_t)a6 linkType:(unint64_t)a7;
- (void)IDSQRAllocation:(unint64_t)a3 result:(unsigned int)a4 hasRecipientAccepted:(unsigned int)a5 payloadSize:(unsigned int)a6 topic:(id)a7 service:(id)a8;
- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(int64_t)a4 firstReceivedPacketMKMtimeDelta:(int64_t)a5;
- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(int64_t)a4 membershipChangeMKMTimeDelta:(int64_t)a5;
- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(unint64_t)a4 missingPrekeys:(unint64_t)a5;
- (void)IDSSocketPairConnectionTCPInfoLinkType:(unint64_t)a3 currentRTT:(unint64_t)a4 bandwidth:(unint64_t)a5;
- (void)IDSWiProxDidConnectToPeer:(unint64_t)a3 resultCode:(unint64_t)a4;
- (void)IDSWiProxDidDisconnectFromPeer:(unint64_t)a3 resultCode:(unint64_t)a4;
- (void)IDSWiProxDidSendData:(unint64_t)a3;
- (void)OTRSessionNegotiation:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 result:(unsigned int)a6;
- (void)WRMLinkRecommendation:(unsigned int)a3 primaryLinkType:(unsigned int)a4 magnetState:(unsigned int)a5 infraWiFiState:(unsigned int)a6;
- (void)_submitRegistrationAccountStatusMetric:(id)a3;
- (void)clientProcessReceivedMessage:(id)a3 messageSize:(unint64_t)a4 deltaTime:(unint64_t)a5 priority:(unint64_t)a6;
- (void)messageDeliveredForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 deliveryError:(unint64_t)a7 RTT:(unint64_t)a8 priority:(unint64_t)a9;
- (void)messageReceivedForService:(id)a3 isFromDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(int64_t)a7;
- (void)messageSentForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(unint64_t)a7;
- (void)noteMessageReceivedForService:(id)a3 accountType:(id)a4 fromStorage:(BOOL)a5 serverTimestamp:(double)a6 localTimeDelta:(double)a7;
- (void)noteServerStorageStateMachineEndedFor:(id)a3 linkType:(int64_t)a4 wasPrimary:(BOOL)a5 timeTaken:(double)a6 numberProcessed:(int64_t)a7;
- (void)queryAndSubmitStatusForAccounts;
- (void)registrationCompletedForRegistrationType:(int)a3 serviceIdentifier:(id)a4 wasSuccessful:(BOOL)a5 registrationError:(int64_t)a6;
- (void)sessionAcceptReceivedWithAWDGUID:(id)a3;
- (void)sessionAcceptSentWithAWDGUID:(id)a3;
- (void)sessionCancelReceivedWithAWDGUID:(id)a3;
- (void)sessionCancelSentWithAWDGUID:(id)a3 numberOfRecipients:(id)a4 remoteSessionEndReason:(unsigned int)a5;
- (void)sessionCompletedWithAWDGUID:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(int64_t)a6 isQREnabled:(BOOL)a7 isUsingQRDirectly:(BOOL)a8 isInitiator:(BOOL)a9 isScreenSharingSessionType:(BOOL)a10 isWithDefaultPairedDevice:(BOOL)a11 transportType:(int64_t)a12 linkType:(unint64_t)a13 linkProtocol:(int64_t)a14 endedReason:(unsigned int)a15 destinationType:(int)a16 durationOfSession:(id)a17 durationToConnect:(id)a18 isNetworkEnabled:(BOOL)a19 isNetworkActive:(BOOL)a20 isNetworkReachable:(BOOL)a21 isWifiInterfaceDisallowed:(BOOL)a22 isCellularInterfaceDisallowed:(BOOL)a23;
- (void)sessionConnectedWithAWDGUID:(id)a3;
- (void)sessionDeclineReceivedWithAWDGUID:(id)a3;
- (void)sessionDeclineSentWithAWDGUID:(id)a3;
- (void)sessionEndedWithGuid:(id)a3 endedReason:(unsigned int)a4 genericError:(unsigned int)a5 gameKitError:(unsigned int)a6 conferenceMiscError:(unsigned int)a7 callDuration:(id)a8 isNetworkEnabled:(BOOL)a9 isNetworkActive:(BOOL)a10 isNetworkReachable:(BOOL)a11 networkCheckResult:(unsigned int)a12 dataRate:(id)a13 gksError:(id)a14 connectDuration:(id)a15 remoteNetworkConnection:(unsigned int)a16 localNetworkConnection:(unsigned int)a17 connectionType:(unsigned int)a18 usesRelay:(BOOL)a19 currentNATType:(id)a20 remoteNATType:(id)a21 relayConnectDuration:(id)a22 isInitiator:(BOOL)a23 linkQuality:(id)a24 gksReturnCode:(id)a25;
- (void)sessionInvitationReceivedWithAWDGUID:(id)a3;
- (void)sessionInvitationSentWithAWDGUID:(id)a3 numberOfRecipients:(id)a4;
- (void)sessionReinitiateConnectedWithAWDGUID:(id)a3;
- (void)sessionReinitiateRequestedWithAWDGUID:(id)a3;
- (void)sessionReinitiateStartedWithAWDGUID:(id)a3;
- (void)sessionStartedWithAWDGUID:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(int64_t)a6;
- (void)socketClosedForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 closeError:(unint64_t)a5 socketError:(unint64_t)a6 bytesSent:(unint64_t)a7 packetsSent:(unint64_t)a8 bytesReceived:(unint64_t)a9 packetsReceived:(unint64_t)a10;
- (void)socketOpenedForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 openError:(unint64_t)a5 socketError:(unint64_t)a6;
- (void)wifiSetupAttemptType:(unint64_t)a3 duration:(unint64_t)a4 result:(unint64_t)a5 client:(id)a6;
@end

@implementation IDSAWDLogging

- (void)IDSDeviceConnectionForService:(id)a3 wasSuccessful:(BOOL)a4 clientInitTime:(id)a5 clientOpenSocketCompletionTime:(id)a6 daemonOpenSocketTime:(id)a7 daemonOpenSocketCompletionTime:(id)a8 firstPacketReceiveTime:(id)a9 connectionInitTime:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  uint64_t v22 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000385F0;
  v31[3] = &unk_1008F76D8;
  id v32 = v18;
  id v33 = v16;
  id v34 = v17;
  id v35 = v20;
  id v36 = v19;
  id v37 = v21;
  BOOL v40 = a4;
  v38 = self;
  id v39 = v15;
  id v23 = v15;
  id v24 = v21;
  id v25 = v19;
  id v26 = v20;
  id v27 = v17;
  id v28 = v16;
  id v29 = v18;
  IDSAWDSubmitBlockAsync(v22, v31);
}

- (BOOL)_shouldSubmitRegistrationCompletedForServiceIdentifier:(id)a3
{
  return [&off_100948838 containsObject:a3];
}

- (void)queryAndSubmitStatusForAccounts
{
  id v3 = objc_msgSend( &off_100948850,  "objectAtIndexedSubscript:",  arc4random_uniform((uint32_t)objc_msgSend(&off_100948850, "count")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [&off_100948868 mutableCopy];
  if (+[IDSRegistrationController systemSupportsPhoneNumberRegistration]( &OBJC_CLASS___IDSRegistrationController,  "systemSupportsPhoneNumberRegistration"))
  {
    [v5 addObject:&off_100947338];
  }

  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)objc_msgSend(v5, "count")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v7 integerValue];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceWithIdentifier:v4]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountsOnService:v10]);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (objc_msgSend(v18, "accountType", (void)v21) == (_DWORD)v8)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDAccountMetrics registrationAccountStatusMetricForAccount:]( &OBJC_CLASS___IDSDAccountMetrics,  "registrationAccountStatusMetricForAccount:",  v18));
          -[IDSAWDLogging _submitRegistrationAccountStatusMetric:](self, "_submitRegistrationAccountStatusMetric:", v20);

          id v19 = v13;
          goto LABEL_13;
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDAccountMetrics registrationAccountStatusMetricForNonexistentAccountWithType:serviceIdentifier:]( &OBJC_CLASS___IDSDAccountMetrics,  "registrationAccountStatusMetricForNonexistentAccountWithType:serviceIdentifier:",  v8,  v4));
  -[IDSAWDLogging _submitRegistrationAccountStatusMetric:](self, "_submitRegistrationAccountStatusMetric:", v19);
LABEL_13:
}

- (void)_submitRegistrationAccountStatusMetric:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100156E30;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)registrationCompletedForRegistrationType:(int)a3 serviceIdentifier:(id)a4 wasSuccessful:(BOOL)a5 registrationError:(int64_t)a6
{
  id v10 = a4;
  if (-[IDSAWDLogging _shouldSubmitRegistrationCompletedForServiceIdentifier:]( self,  "_shouldSubmitRegistrationCompletedForServiceIdentifier:",  v10))
  {
    uint64_t v11 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100156F58;
    v12[3] = &unk_1008FBAB0;
    v12[4] = self;
    int v15 = a3;
    BOOL v16 = a5;
    id v13 = v10;
    int64_t v14 = a6;
    IDSAWDSubmitBlockAsync(v11, v12);
  }
}

- (void)IDSGenericConnectionForLink:(unint64_t)a3 connectionSetupStartTime:(id)a4 firstPacketReceiveTime:(id)a5 connectionType:(id)a6 success:(BOOL)a7 errorCode:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100173DD0;
  v23[3] = &unk_1008FC0B0;
  id v24 = v15;
  id v25 = v14;
  id v26 = v16;
  id v27 = v17;
  id v28 = self;
  unint64_t v29 = a3;
  BOOL v30 = a7;
  id v19 = v17;
  id v20 = v16;
  id v21 = v14;
  id v22 = v15;
  IDSAWDSubmitBlockAsync(v18, v23);
}

- (void)sessionStartedWithAWDGUID:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001B0140;
  v17[3] = &unk_1008FCFC0;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  int64_t v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  IDSAWDSubmitBlockAsync(v13, v17);
}

- (void)sessionInvitationSentWithAWDGUID:(id)a3 numberOfRecipients:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001B029C;
  v11[3] = &unk_1008F5F58;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  IDSAWDSubmitBlockAsync(v8, v11);
}

- (void)sessionInvitationReceivedWithAWDGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B03B4;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)sessionCancelSentWithAWDGUID:(id)a3 numberOfRecipients:(id)a4 remoteSessionEndReason:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001B04EC;
  v13[3] = &unk_1008F9060;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unsigned int v16 = a5;
  id v11 = v9;
  id v12 = v8;
  IDSAWDSubmitBlockAsync(v10, v13);
}

- (void)sessionCancelReceivedWithAWDGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B0610;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)sessionDeclineSentWithAWDGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B0714;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)sessionDeclineReceivedWithAWDGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B0818;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)sessionAcceptSentWithAWDGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B091C;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)sessionAcceptReceivedWithAWDGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B0A20;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)sessionConnectedWithAWDGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B0B24;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)sessionReinitiateRequestedWithAWDGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B0C28;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)sessionReinitiateStartedWithAWDGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B0D2C;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)sessionReinitiateConnectedWithAWDGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B0E30;
  v7[3] = &unk_1008F5F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IDSAWDSubmitBlockAsync(v5, v7);
}

- (void)sessionCompletedWithAWDGUID:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(int64_t)a6 isQREnabled:(BOOL)a7 isUsingQRDirectly:(BOOL)a8 isInitiator:(BOOL)a9 isScreenSharingSessionType:(BOOL)a10 isWithDefaultPairedDevice:(BOOL)a11 transportType:(int64_t)a12 linkType:(unint64_t)a13 linkProtocol:(int64_t)a14 endedReason:(unsigned int)a15 destinationType:(int)a16 durationOfSession:(id)a17 durationToConnect:(id)a18 isNetworkEnabled:(BOOL)a19 isNetworkActive:(BOOL)a20 isNetworkReachable:(BOOL)a21 isWifiInterfaceDisallowed:(BOOL)a22 isCellularInterfaceDisallowed:(BOOL)a23
{
  id v26 = a3;
  id v27 = a4;
  id v28 = a5;
  id v29 = a17;
  id v30 = a18;
  uint64_t v31 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1001B10AC;
  v40[3] = &unk_1008FCFE8;
  v40[4] = self;
  id v41 = v29;
  id v42 = v30;
  id v43 = v26;
  id v44 = v27;
  id v45 = v28;
  int64_t v46 = a6;
  BOOL v51 = a7;
  BOOL v52 = a8;
  BOOL v53 = a9;
  BOOL v54 = a10;
  BOOL v55 = a11;
  __int128 v47 = *(_OWORD *)&a12;
  int64_t v48 = a14;
  BOOL v56 = a19;
  BOOL v57 = a20;
  BOOL v58 = a21;
  BOOL v59 = a22;
  BOOL v60 = a23;
  unsigned int v49 = a15;
  int v50 = a16;
  id v32 = v28;
  id v33 = v27;
  id v34 = v26;
  id v35 = v30;
  id v36 = v29;
  IDSAWDSubmitBlockAsync(v31, v40);
}

- (void)sessionEndedWithGuid:(id)a3 endedReason:(unsigned int)a4 genericError:(unsigned int)a5 gameKitError:(unsigned int)a6 conferenceMiscError:(unsigned int)a7 callDuration:(id)a8 isNetworkEnabled:(BOOL)a9 isNetworkActive:(BOOL)a10 isNetworkReachable:(BOOL)a11 networkCheckResult:(unsigned int)a12 dataRate:(id)a13 gksError:(id)a14 connectDuration:(id)a15 remoteNetworkConnection:(unsigned int)a16 localNetworkConnection:(unsigned int)a17 connectionType:(unsigned int)a18 usesRelay:(BOOL)a19 currentNATType:(id)a20 remoteNATType:(id)a21 relayConnectDuration:(id)a22 isInitiator:(BOOL)a23 linkQuality:(id)a24 gksReturnCode:(id)a25
{
  id v44 = a3;
  id v27 = a8;
  id v28 = a13;
  id v29 = a14;
  id v30 = a15;
  id v31 = a20;
  id v32 = a21;
  id v33 = a22;
  id v34 = a24;
  id v35 = a25;
  uint64_t v47 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1001B14E0;
  v52[3] = &unk_1008FD010;
  v52[4] = self;
  id v53 = v44;
  unsigned int v63 = a4;
  unsigned int v64 = a5;
  unsigned int v65 = a6;
  unsigned int v66 = a7;
  BOOL v70 = a9;
  BOOL v71 = a10;
  BOOL v72 = a11;
  unsigned int v67 = a12;
  id v54 = v27;
  id v55 = v28;
  id v56 = v29;
  id v57 = v30;
  uint64_t v68 = *(void *)&a16;
  unsigned int v69 = a18;
  BOOL v73 = a19;
  id v58 = v31;
  id v59 = v32;
  BOOL v74 = a23;
  id v60 = v33;
  id v61 = v34;
  id v62 = v35;
  id v51 = v35;
  id v50 = v34;
  id v36 = v33;
  id v37 = v32;
  id v38 = v31;
  id v39 = v30;
  id v40 = v29;
  id v41 = v28;
  id v42 = v27;
  id v43 = v44;
  IDSAWDSubmitBlockAsync(v47, v52);
}

- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(unint64_t)a4 missingPrekeys:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002BA9BC;
  v11[3] = &unk_1008F6D70;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  id v10 = v8;
  IDSAWDSubmitBlockAsync(v9, v11);
}

- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(int64_t)a4 firstReceivedPacketMKMtimeDelta:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002BAAEC;
  v11[3] = &unk_1008F6D70;
  v11[4] = self;
  id v12 = v8;
  int64_t v13 = a5;
  int64_t v14 = a4;
  id v10 = v8;
  IDSAWDSubmitBlockAsync(v9, v11);
}

- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(int64_t)a4 membershipChangeMKMTimeDelta:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002BAC38;
  v11[3] = &unk_1008F6D70;
  v11[4] = self;
  id v12 = v8;
  int64_t v13 = a5;
  int64_t v14 = a4;
  id v10 = v8;
  IDSAWDSubmitBlockAsync(v9, v11);
}

- (void)IDSSocketPairConnectionTCPInfoLinkType:(unint64_t)a3 currentRTT:(unint64_t)a4 bandwidth:(unint64_t)a5
{
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002BD0FC;
  v6[3] = &unk_1008FFB68;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  IDSAWDSubmitBlockAsync(v5, v6);
}

- (void)messageSentForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(unint64_t)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  uint64_t v13 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  id v20 = sub_100301F70;
  int64_t v21 = &unk_1009008E0;
  id v22 = self;
  id v14 = v12;
  BOOL v27 = v10;
  id v23 = v14;
  unint64_t v24 = a5;
  unint64_t v25 = a6;
  unint64_t v26 = a7;
  IDSAWDSubmitBlockAsync(v13, &v18);
  if (v10)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___IDSWRMMetricContainer);
    unsigned int v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "setMessageSentSize:", a5, v18, v19, v20, v21, v22);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWRMExchange sharedInstance](&OBJC_CLASS___IDSWRMExchange, "sharedInstance"));
      [v17 submitMetric:v16];
    }
  }
}

- (void)clientProcessReceivedMessage:(id)a3 messageSize:(unint64_t)a4 deltaTime:(unint64_t)a5 priority:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003020C8;
  v13[3] = &unk_100900908;
  v13[4] = self;
  id v14 = v10;
  unint64_t v15 = a4;
  unint64_t v16 = a5;
  unint64_t v17 = a6;
  id v12 = v10;
  IDSAWDSubmitBlockAsync(v11, v13);
}

- (void)messageDeliveredForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 deliveryError:(unint64_t)a7 RTT:(unint64_t)a8 priority:(unint64_t)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  uint64_t v16 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  int64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  id v23 = sub_100302290;
  unint64_t v24 = &unk_100900930;
  unint64_t v25 = self;
  id v17 = v15;
  BOOL v32 = v13;
  id v26 = v17;
  unint64_t v27 = a5;
  unint64_t v28 = a6;
  unint64_t v29 = a7;
  unint64_t v30 = a8;
  unint64_t v31 = a9;
  IDSAWDSubmitBlockAsync(v16, &v21);
  if (v13)
  {
    id v18 = objc_alloc_init(&OBJC_CLASS___IDSWRMMetricContainer);
    uint64_t v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "setMessageDeliveredSize:", a5, v21, v22, v23, v24, v25);
      [v19 setMessageDeliveredDeliveryError:a7];
      [v19 setMessageDeliveredRTT:a8];
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWRMExchange sharedInstance](&OBJC_CLASS___IDSWRMExchange, "sharedInstance"));
      [v20 submitMetric:v19];
    }
  }
}

- (void)messageReceivedForService:(id)a3 isFromDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(int64_t)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  uint64_t v13 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  id v20 = sub_100302450;
  int64_t v21 = &unk_1009008E0;
  uint64_t v22 = self;
  id v14 = v12;
  BOOL v27 = v10;
  id v23 = v14;
  unint64_t v24 = a5;
  unint64_t v25 = a6;
  int64_t v26 = a7;
  IDSAWDSubmitBlockAsync(v13, &v18);
  if (v10)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___IDSWRMMetricContainer);
    uint64_t v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "setMessageReceivedSize:", a5, v18, v19, v20, v21, v22);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWRMExchange sharedInstance](&OBJC_CLASS___IDSWRMExchange, "sharedInstance"));
      [v17 submitMetric:v16];
    }
  }
}

- (void)socketOpenedForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 openError:(unint64_t)a5 socketError:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003025A8;
  v13[3] = &unk_100900958;
  v13[4] = self;
  id v14 = v10;
  BOOL v17 = a4;
  unint64_t v15 = a5;
  unint64_t v16 = a6;
  id v12 = v10;
  IDSAWDSubmitBlockAsync(v11, v13);
}

- (void)socketClosedForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 closeError:(unint64_t)a5 socketError:(unint64_t)a6 bytesSent:(unint64_t)a7 packetsSent:(unint64_t)a8 bytesReceived:(unint64_t)a9 packetsReceived:(unint64_t)a10
{
  BOOL v14 = a4;
  id v16 = a3;
  uint64_t v17 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100302788;
  v22[3] = &unk_100900980;
  v22[4] = self;
  id v18 = v16;
  BOOL v30 = v14;
  id v23 = v18;
  unint64_t v24 = a5;
  unint64_t v25 = a6;
  unint64_t v26 = a7;
  unint64_t v27 = a8;
  unint64_t v28 = a9;
  unint64_t v29 = a10;
  IDSAWDSubmitBlockAsync(v17, v22);
  if (v14)
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___IDSWRMMetricContainer);
    id v20 = v19;
    if (v19)
    {
      [v19 setStreamBytesSent:a7];
      [v20 setStreamPacketsSent:a8];
      [v20 setStreamBytesReceived:a9];
      [v20 setStreamPacketsReceived:a10];
      int64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWRMExchange sharedInstance](&OBJC_CLASS___IDSWRMExchange, "sharedInstance"));
      [v21 submitMetric:v20];
    }
  }
}

- (void)wifiSetupAttemptType:(unint64_t)a3 duration:(unint64_t)a4 result:(unint64_t)a5 client:(id)a6
{
  id v10 = a6;
  uint64_t v11 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100302904;
  v13[3] = &unk_100900908;
  unint64_t v15 = a3;
  unint64_t v16 = a4;
  unint64_t v17 = a5;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  IDSAWDSubmitBlockAsync(v11, v13);
}

- (void)OTRSessionNegotiation:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 result:(unsigned int)a6
{
  id v10 = a3;
  uint64_t v11 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100302A54;
  v13[3] = &unk_1009009A8;
  v13[4] = self;
  id v14 = v10;
  unint64_t v15 = a4;
  unint64_t v16 = a5;
  unsigned int v17 = a6;
  id v12 = v10;
  IDSAWDSubmitBlockAsync(v11, v13);
}

- (void)WRMLinkRecommendation:(unsigned int)a3 primaryLinkType:(unsigned int)a4 magnetState:(unsigned int)a5 infraWiFiState:(unsigned int)a6
{
  uint64_t v6 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100302B60;
  v7[3] = &unk_100900870;
  v7[4] = self;
  unsigned int v8 = a3;
  unsigned int v9 = a4;
  unsigned int v10 = a5;
  unsigned int v11 = a6;
  IDSAWDSubmitBlockAsync(v6, v7);
}

- (void)IDSQRAllocation:(unint64_t)a3 result:(unsigned int)a4 hasRecipientAccepted:(unsigned int)a5 payloadSize:(unsigned int)a6 topic:(id)a7 service:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  uint64_t v16 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100302CDC;
  v19[3] = &unk_1009009D0;
  unsigned int v23 = a4;
  unsigned int v24 = a5;
  unsigned int v25 = a6;
  v19[4] = self;
  id v20 = v14;
  id v21 = v15;
  unint64_t v22 = a3;
  id v17 = v15;
  id v18 = v14;
  IDSAWDSubmitBlockAsync(v16, v19);
}

- (void)IDSWiProxDidConnectToPeer:(unint64_t)a3 resultCode:(unint64_t)a4
{
  uint64_t v7 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100302E30;
  v8[3] = &unk_100900870;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  IDSAWDSubmitBlockAsync(v7, v8);
  -[IDSAWDLogging IDSCoreAnalyticsWiProxConnectionEvent:duration:resultCode:]( self,  "IDSCoreAnalyticsWiProxConnectionEvent:duration:resultCode:",  kIDSWiProxDidConnectToPeerMetricName,  a3,  a4);
}

- (void)IDSWiProxDidDisconnectFromPeer:(unint64_t)a3 resultCode:(unint64_t)a4
{
  uint64_t v7 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100302F54;
  v8[3] = &unk_100900870;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  IDSAWDSubmitBlockAsync(v7, v8);
  -[IDSAWDLogging IDSCoreAnalyticsWiProxConnectionEvent:duration:resultCode:]( self,  "IDSCoreAnalyticsWiProxConnectionEvent:duration:resultCode:",  kIDSWiProxDidDisconnectFromPeerMetricName,  a3,  a4);
}

- (void)IDSWiProxDidSendData:(unint64_t)a3
{
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10030305C;
  v6[3] = &unk_1008F68C8;
  v6[4] = self;
  v6[5] = a3;
  IDSAWDSubmitBlockAsync(v5, v6);
  -[IDSAWDLogging IDSCoreAnalyticsWiProxDidSendData:](self, "IDSCoreAnalyticsWiProxDidSendData:", a3);
}

- (void)noteMessageReceivedForService:(id)a3 accountType:(id)a4 fromStorage:(BOOL)a5 serverTimestamp:(double)a6 localTimeDelta:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1003031AC;
  v17[3] = &unk_1009009F8;
  BOOL v22 = a5;
  double v20 = a6;
  double v21 = a7;
  v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  IDSAWDSubmitBlockAsync(v14, v17);
}

- (void)IDSMagnetCorruptionDetailedEvent:(unint64_t)a3 correctRawBytesSinceLastCorruption:(unint64_t)a4 discardedRawBytes:(unint64_t)a5 recoveryTimeInMs:(unint64_t)a6 linkType:(unint64_t)a7
{
  uint64_t v7 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100303338;
  v8[3] = &unk_100900A20;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  void v8[7] = a5;
  v8[8] = a6;
  v8[9] = a7;
  IDSAWDSubmitBlockAsync(v7, v8);
}

- (void)noteServerStorageStateMachineEndedFor:(id)a3 linkType:(int64_t)a4 wasPrimary:(BOOL)a5 timeTaken:(double)a6 numberProcessed:(int64_t)a7
{
  id v12 = a3;
  uint64_t v13 = *(void *)((char *)self + OBJC_IVAR___IDSAWDLogging__queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003034A4;
  v15[3] = &unk_1009008E0;
  v15[4] = self;
  id v16 = v12;
  int64_t v17 = a4;
  BOOL v20 = a5;
  double v18 = a6;
  int64_t v19 = a7;
  id v14 = v12;
  IDSAWDSubmitBlockAsync(v13, v15);
}

@end