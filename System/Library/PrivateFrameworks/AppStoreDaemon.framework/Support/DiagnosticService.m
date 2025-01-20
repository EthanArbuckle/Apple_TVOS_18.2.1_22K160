@interface DiagnosticService
- (DiagnosticService)init;
- (void)activeClientsWithReplyHandler:(id)a3;
- (void)addSubscriberWithEndpoint:(id)a3;
- (void)pingWithReplyHandler:(id)a3;
- (void)sendCommandWithDetailedReplyHandler:(int64_t)a3 handler:(id)a4;
- (void)sendCommandWithReplyHandler:(int64_t)a3 handler:(id)a4;
@end

@implementation DiagnosticService

- (DiagnosticService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DiagnosticService;
  v2 = -[DiagnosticService init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    listenerConnections = v2->_listenerConnections;
    v2->_listenerConnections = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___UnfairLock);
    listenerLock = v2->_listenerLock;
    v2->_listenerLock = v5;
  }

  return v2;
}

- (void)activeClientsWithReplyHandler:(id)a3
{
}

- (void)addSubscriberWithEndpoint:(id)a3
{
  id v4 = a3;
  listenerLock = self->_listenerLock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100274034;
  v7[3] = &unk_1003E9DC0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  sub_1002C11C4(listenerLock, v7);
}

- (void)pingWithReplyHandler:(id)a3
{
  v3 = (void (**)(void))a3;
  id v4 = sub_10023B9CC((uint64_t)&OBJC_CLASS___AppInstallScheduler);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10023C018((uint64_t)v5, 2048LL);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100274550;
  v17[3] = &unk_1003EBFB0;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"\nExisting coordinators:"));
  id v18 = v6;
  +[IXAppInstallCoordinator enumerateCoordinatorsWithError:usingBlock:]( &OBJC_CLASS___IXAppInstallCoordinator,  "enumerateCoordinatorsWithError:usingBlock:",  0LL,  v17);
  [v6 appendFormat:@"\n  ~ END ~"];
  [v6 appendString:@"\n\nActive installations:"];
  id v7 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_100274580;
  v15 = &unk_1003ED090;
  id v9 = v6;
  id v16 = v9;
  [v8 readUsingSession:&v12];

  objc_msgSend(v9, "appendFormat:", @"\n  ~ END ~", v12, v13, v14, v15);
  uint64_t v10 = ASDLogHandleForCategory(2LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "->> %{public}@", buf, 0xCu);
  }

  v3[2](v3);
}

- (void)sendCommandWithReplyHandler:(int64_t)a3 handler:(id)a4
{
  id v6 = (void (**)(void))a4;
  uint64_t v7 = ASDLogHandleForCategory(14LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v133 = objc_opt_class(self, v9);
    *(_WORD *)&v133[8] = 2048;
    int64_t v134 = a3;
    id v10 = *(id *)v133;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@]: Recieved command: %ld", buf, 0x16u);
  }

  if (a3 <= 719)
  {
    if (a3 > 300)
    {
      switch(a3)
      {
        case 601LL:
          id v91 = sub_10023B9CC((uint64_t)&OBJC_CLASS___AppInstallScheduler);
          v26 = (AppUsageManager *)objc_claimAutoreleasedReturnValue(v91);
          sub_10023C018((uint64_t)v26, 256LL);
          goto LABEL_97;
        case 602LL:
          v92 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStore]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStore"));
          v93 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "ams_activeiTunesAccount"));

          v34 = (_TtC9appstored6LogKey *)sub_1002FF088(objc_alloc(&OBJC_CLASS___AuthorizeMachine), v93, 2LL);
          v127[0] = _NSConcreteStackBlock;
          v127[1] = 3221225472LL;
          v127[2] = sub_1002756EC;
          v127[3] = &unk_1003EA020;
          v128 = v93;
          v129 = v6;
          v36 = v93;
          sub_1002FF718((id *)&v34->super.isa, v127);

          v37 = v128;
          goto LABEL_67;
        case 603LL:
        case 606LL:
          goto LABEL_98;
        case 604LL:
        case 605LL:
          id v11 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);

          goto LABEL_98;
        case 607LL:
        case 608LL:
        case 609LL:
          goto LABEL_37;
        case 610LL:
          id v94 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
          uint64_t v95 = objc_claimAutoreleasedReturnValue(v94);
          v26 = (AppUsageManager *)v95;
          char v96 = 1;
          goto LABEL_96;
        case 611LL:
          id v97 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
          v26 = (AppUsageManager *)objc_claimAutoreleasedReturnValue(v97);
          sub_10020FEBC((uint64_t)v26, 1);
          goto LABEL_97;
        case 612LL:
          id v98 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
          v26 = (AppUsageManager *)objc_claimAutoreleasedReturnValue(v98);
          sub_100215070(v26, 1u);
          goto LABEL_97;
        case 613LL:
          v99 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStore]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStore"));
          v34 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "ams_activeiTunesAccount"));

          uint64_t v100 = ASDLogHandleForCategory(14LL);
          v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v133 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEFAULT,  "Kicking retry restores for  %@",  buf,  0xCu);
          }

          id v102 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
          v42 = (id *)objc_claimAutoreleasedReturnValue(v102);
          sub_100212B78((uint64_t)v42, v34, 0);
          goto LABEL_88;
        case 614LL:
          uint64_t v103 = ASDLogHandleForCategory(14LL);
          v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Logging commonly usage apps", buf, 2u);
          }

          v26 = objc_alloc_init(&OBJC_CLASS___AppUsageManager);
          id v105 = sub_100221CC4((uint64_t)v26);
          goto LABEL_97;
        case 615LL:
          uint64_t v106 = ASDLogHandleForCategory(14LL);
          v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v107,  OS_LOG_TYPE_DEFAULT,  "Persisting commonly usage apps",  buf,  2u);
          }

          v26 = objc_alloc_init(&OBJC_CLASS___AppUsageManager);
          sub_100221E34((uint64_t)v26);
          goto LABEL_97;
        case 616LL:
          uint64_t v108 = ASDLogHandleForCategory(14LL);
          v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_DEFAULT,  "Install distributor if needed - with app",  buf,  2u);
          }

          v34 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
          id v110 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
          uint64_t v111 = objc_claimAutoreleasedReturnValue(v110);
          v42 = (id *)v111;
          v112 = @"com.dreamgames.royalmatch";
          v113 = v34;
          goto LABEL_87;
        case 617LL:
          uint64_t v114 = ASDLogHandleForCategory(14LL);
          v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_DEFAULT,  "Install distributor if needed - generic",  buf,  2u);
          }

          v34 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
          id v116 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
          uint64_t v111 = objc_claimAutoreleasedReturnValue(v116);
          v42 = (id *)v111;
          v113 = v34;
          v112 = 0LL;
LABEL_87:
          sub_1002110A8(v111, v113, v112, 0LL);
          goto LABEL_88;
        case 618LL:
          uint64_t v117 = ASDLogHandleForCategory(14LL);
          v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_DEFAULT,  "Retrying restores requiring distributor",  buf,  2u);
          }

          id v119 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
          v26 = (AppUsageManager *)objc_claimAutoreleasedReturnValue(v119);
          sub_100213174((uint64_t)v26);
          goto LABEL_97;
        case 619LL:
          uint64_t v120 = ASDLogHandleForCategory(14LL);
          v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "Bootstrap Restores", buf, 2u);
          }

          id v122 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
          uint64_t v95 = objc_claimAutoreleasedReturnValue(v122);
          v26 = (AppUsageManager *)v95;
          char v96 = 0;
LABEL_96:
          sub_100210B70(v95, @"Diagnostic", 0LL, v96);
          goto LABEL_97;
        default:
          if (a3 != 301) {
            goto LABEL_37;
          }
          id v58 = sub_1001995C0((uint64_t)&OBJC_CLASS___PurchaseManager);
          v25 = (AppUsageManager *)objc_claimAutoreleasedReturnValue(v58);
          v26 = v25;
          uint64_t v27 = 1LL;
          goto LABEL_36;
      }
    }

    if (a3 == 1)
    {
      id v44 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      id v46 = [v45 URLForKey:@"app-receipt-create"];

      v26 = (AppUsageManager *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
      -[AppUsageManager postNotificationName:object:]( v26,  "postNotificationName:object:",  AMSBagChangedNotification,  &__NSDictionary0__struct);
LABEL_97:

LABEL_98:
      v6[2](v6);
      goto LABEL_99;
    }

    if (a3 != 100)
    {
      if (a3 == 300)
      {
        id v24 = sub_1001995C0((uint64_t)&OBJC_CLASS___PurchaseManager);
        v25 = (AppUsageManager *)objc_claimAutoreleasedReturnValue(v24);
        v26 = v25;
        uint64_t v27 = 0LL;
LABEL_36:
        -[AppUsageManager checkStoreQueue:](v25, "checkStoreQueue:", v27);
        goto LABEL_97;
      }

- (void)sendCommandWithDetailedReplyHandler:(int64_t)a3 handler:(id)a4
{
  id v91 = (void (**)(id, void *))a4;
  if ((os_variant_has_internal_content("com.apple.appstored") & 1) == 0)
  {
    uint64_t v5 = ASDLogHandleForCategory(14LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client not supported", (uint8_t *)&buf, 2u);
    }
  }

  uint64_t v7 = ASDLogHandleForCategory(14LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Recieved detailed command: %ld",  (uint8_t *)&buf,  0xCu);
  }

  if (a3 > 804)
  {
    if (a3 > 820)
    {
      switch(a3)
      {
        case 821LL:
          unsigned int v53 = sub_1002DDEA8(objc_alloc(&OBJC_CLASS___HandleInvalidReceiptTask), @"com.shazam.Shazam");
          id v54 = sub_10020F1C0((uint64_t)&OBJC_CLASS___TaskQueue);
          v55 = (id *)objc_claimAutoreleasedReturnValue(v54);
          uint64_t v111 = v53;
          v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v111,  1LL));
          if (v55) {
            [v55[1] addOperations:v56 waitUntilFinished:1];
          }

          v91[2](v91, &__NSDictionary0__struct);
          break;
        case 860LL:
          uint64_t v57 = ASDLogHandleForCategory(40LL);
          id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Clearing optimal download windows from automatic updates",  (uint8_t *)&buf,  2u);
          }

          *(void *)&__int128 buf = 0LL;
          *((void *)&buf + 1) = &buf;
          uint64_t v107 = 0x3032000000LL;
          uint64_t v108 = sub_100275AFC;
          v109 = sub_100275B0C;
          id v110 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          id v59 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
          v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
          v95[0] = _NSConcreteStackBlock;
          v95[1] = 3221225472LL;
          v95[2] = sub_100276A54;
          v95[3] = &unk_1003EBA18;
          v95[4] = &buf;
          [v60 modifyUsingTransaction:v95];

          if ([*(id *)(*((void *)&buf + 1) + 40) count])
          {
            id v61 = sub_10023B9CC((uint64_t)&OBJC_CLASS___AppInstallScheduler);
            v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
            sub_10023C018((uint64_t)v62, 128LL);
          }

          uint64_t v63 = *(void *)(*((void *)&buf + 1) + 40LL);
          v104 = @"optimalDownloadWindowsCleared";
          uint64_t v105 = v63;
          uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v105,  &v104,  1LL));
          v91[2](v91, v64);

          _Block_object_dispose(&buf, 8);
          break;
        case 870LL:
          uint64_t v36 = ASDLogHandleForCategory(14LL);
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Expiring app asset download URLs",  (uint8_t *)&buf,  2u);
          }

          *(void *)&__int128 buf = 0LL;
          *((void *)&buf + 1) = &buf;
          uint64_t v107 = 0x3032000000LL;
          uint64_t v108 = sub_100275AFC;
          v109 = sub_100275B0C;
          id v110 = (NSMutableArray *)&__NSArray0__struct;
          id v38 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v94[0] = _NSConcreteStackBlock;
          v94[1] = 3221225472LL;
          v94[2] = sub_100276CF0;
          v94[3] = &unk_1003EBA18;
          v94[4] = &buf;
          [v39 modifyUsingTransaction:v94];

          uint64_t v40 = *(void *)(*((void *)&buf + 1) + 40LL);
          id v102 = @"assetDownloadsExpired";
          uint64_t v103 = v40;
          id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v103,  &v102,  1LL));
          v91[2](v91, v41);

          _Block_object_dispose(&buf, 8);
          break;
        default:
          goto LABEL_53;
      }
    }

    else
    {
      if (a3 == 805)
      {
        uint64_t v49 = objc_alloc_init(&OBJC_CLASS___AppPurgeCoordinator);
        sub_1001A2920((uint64_t)v49);
        v91[2](v91, &__NSDictionary0__struct);

        goto LABEL_69;
      }

      if (a3 == 806)
      {
        v50 = objc_alloc_init(&OBJC_CLASS___AppPurgeCoordinator);
        id v51 = sub_10019F59C(v50);
        unsigned int v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        v91[2](v91, v52);

        goto LABEL_69;
      }

      if (a3 != 820) {
        goto LABEL_53;
      }
      v25 = objc_alloc_init(&OBJC_CLASS___VerifyReceiptsTask);
      v26 = v25;
      if (v25) {
        LOBYTE(v25->_qaVerficationExpiredApps) = 1;
      }
      id v27 = sub_10020F1C0((uint64_t)&OBJC_CLASS___TaskQueue);
      uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)v28;
      if (v28) {
        [*(id *)(v28 + 8) addOperation:v26];
      }

      v91[2](v91, &__NSDictionary0__struct);
    }
  }

  else
  {
    if (a3 <= 599)
    {
      switch(a3)
      {
        case 100LL:
          v121 = @"ledger";
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[QALogger serializeLedger](&OBJC_CLASS____TtC9appstored8QALogger, "serializeLedger"));
          id v122 = v42;
          v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v122,  &v121,  1LL));
          v91[2](v91, v43);

          goto LABEL_69;
        case 411LL:
          id v119 = @"installs";
          id v44 = sub_10023B9CC((uint64_t)&OBJC_CLASS___AppInstallScheduler);
          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
          id v46 = sub_10023C5CC(v45);
          id v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
          uint64_t v120 = v47;
          id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v120,  &v119,  1LL));
          v91[2](v91, v48);

          goto LABEL_69;
        case 412LL:
          v93 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v9 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
          id v90 = (void *)objc_claimAutoreleasedReturnValue(v9);
          v117[0] = @"isConnected";
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v90 isConnected]));
          v118[0] = v10;
          v117[1] = @"isConstrained";
          id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v90 isConstrained]));
          v118[1] = v11;
          v117[2] = @"isExpensive";
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v90 isExpensive]));
          v118[2] = v12;
          v117[3] = @"interfaceType";
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v90 interfaceType]));
          v118[3] = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v118,  v117,  4LL));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v93,  "setObject:forKeyedSubscript:",  v14,  @"default");

          __int128 v100 = 0u;
          __int128 v101 = 0u;
          __int128 v99 = 0u;
          __int128 v98 = 0u;
          id v15 = [&off_10040DEB8 countByEnumeratingWithState:&v98 objects:v116 count:16];
          if (v15)
          {
            uint64_t v92 = *(void *)v99;
            do
            {
              for (i = 0LL; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v99 != v92) {
                  objc_enumerationMutation(&off_10040DEB8);
                }
                uint64_t v17 = *(void *)(*((void *)&v98 + 1) + 8LL * (void)i);
                id v18 = sub_1001D19F0((uint64_t)&OBJC_CLASS___NetworkMonitor);
                v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
                v114[0] = @"isConnected";
                id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v19 isConnected]));
                v115[0] = v20;
                v114[1] = @"isConstrained";
                unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v19 isConstrained]));
                v115[1] = v21;
                v114[2] = @"isExpensive";
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v19 isExpensive]));
                v115[2] = v22;
                v114[3] = @"interfaceType";
                v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v19 interfaceType]));
                v115[3] = v23;
                id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v115,  v114,  4LL));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v93, "setObject:forKeyedSubscript:", v24, v17);
              }

              id v15 = [&off_10040DEB8 countByEnumeratingWithState:&v98 objects:v116 count:16];
            }

            while (v15);
          }

          v91[2](v91, v93);

          goto LABEL_69;
      }

- (void).cxx_destruct
{
}

@end