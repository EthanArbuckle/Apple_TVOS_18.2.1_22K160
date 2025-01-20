@interface INRegistrar
- (INRegistrar)init;
- (void)_handleRegistrationResponse:(id)a3 forRequest:(id)a4 digest:(id)a5 account:(id)a6 completion:(id)a7;
- (void)_handleUnregistrationResponse:(id)a3 account:(id)a4 completion:(id)a5;
- (void)registerForLoggedOutPushWithToken:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)registerForPushNotificationsWithAccount:(id)a3 pushToken:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)unregisterFromLoggedOutPushNotificationsWithToken:(NSData *)a3 reason:(unint64_t)a4 completionHandler:(id)a5;
- (void)unregisterFromPushNotificationsForAccount:(id)a3 pushToken:(id)a4 completion:(id)a5;
@end

@implementation INRegistrar

- (INRegistrar)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___INRegistrar;
  v2 = -[INRegistrar init](&v16, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    inflightRegistrationRequestsByAccountID = v2->_inflightRegistrationRequestsByAccountID;
    v2->_inflightRegistrationRequestsByAccountID = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    unregisteredAccountIDs = v2->_unregisteredAccountIDs;
    v2->_unregisteredAccountIDs = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSLock);
    inflightRegistrationLock = v2->_inflightRegistrationLock;
    v2->_inflightRegistrationLock = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSLock);
    unregisteredAcountsLock = v2->_unregisteredAcountsLock;
    v2->_unregisteredAcountsLock = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[INRegistrationDigestCache sharedInstance](&OBJC_CLASS___INRegistrationDigestCache, "sharedInstance"));
    registrationDigestCache = v2->_registrationDigestCache;
    v2->_registrationDigestCache = (INRegistrationDigestCache *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[AAURLSession sharedSessionWithNoUrlCache](&OBJC_CLASS___AAURLSession, "sharedSessionWithNoUrlCache"));
    aaUrlSession = v2->_aaUrlSession;
    v2->_aaUrlSession = (AAURLSession *)v13;
  }

  return v2;
}

- (void)registerForPushNotificationsWithAccount:(id)a3 pushToken:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[INRegistrationRequest bodyParameterValueForRegistrationReason:]( &OBJC_CLASS___INRegistrationRequest,  "bodyParameterValueForRegistrationReason:",  a5));
  uint64_t v14 = _INLogSystem(v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v65 = v10;
    __int16 v66 = 2112;
    v67 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Registration request for account %@ has reason code %@",  buf,  0x16u);
  }

  -[NSLock lock](self->_unregisteredAcountsLock, "lock");
  unregisteredAccountIDs = self->_unregisteredAccountIDs;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v10, "identifier"));
  LODWORD(unregisteredAccountIDs) = -[NSMutableArray containsObject:]( unregisteredAccountIDs,  "containsObject:",  v17);

  -[NSLock unlock](self->_unregisteredAcountsLock, "unlock");
  if (!(_DWORD)unregisteredAccountIDs)
  {
    v18 = -[INRequest initWithAccount:pushToken:]( objc_alloc(&OBJC_CLASS___INRegistrationRequest),  "initWithAccount:pushToken:",  v10,  v11);
    v19 = v18;
    if (!v18)
    {
      uint64_t v36 = _INLogSystem(0LL);
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_100015A58();
      }

      if (!v12) {
        goto LABEL_36;
      }
      uint64_t v38 = INCreateError(11LL);
      v20 = (INRegistrationDigest *)objc_claimAutoreleasedReturnValue(v38);
      (*((void (**)(id, void, void, INRegistrationDigest *))v12 + 2))(v12, 0LL, 0LL, v20);
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }

    v59 = v13;
    -[INRegistrationRequest setRegistrationReason:](v18, "setRegistrationReason:", a5);
    v20 = -[INRegistrationDigest initWithRegistrationRequest:]( objc_alloc(&OBJC_CLASS___INRegistrationDigest),  "initWithRegistrationRequest:",  v19);
    -[NSLock lock](self->_inflightRegistrationLock, "lock");
    inflightRegistrationRequestsByAccountID = self->_inflightRegistrationRequestsByAccountID;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v10, "identifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](inflightRegistrationRequestsByAccountID, "objectForKey:", v22));

    uint64_t v25 = _INLogSystem(v24);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
    if (v23)
    {
      if (v27) {
        sub_100015B98();
      }

      v58 = v23;
      v28 = -[INRegistrationDigest initWithRegistrationRequest:]( objc_alloc(&OBJC_CLASS___INRegistrationDigest),  "initWithRegistrationRequest:",  v23);
      BOOL v29 = -[INRegistrationDigest isEqual:](v28, "isEqual:", v20);
      BOOL v30 = v29;
      uint64_t v31 = _INLogSystem(v29);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      v33 = v32;
      if (v30)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          sub_100015B6C();
        }

        v23 = v58;
LABEL_13:
        uint64_t v34 = _INLogSystem(-[NSLock unlock](self->_inflightRegistrationLock, "unlock"));
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          sub_100015A84();
        }

        if (v12) {
          (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, 2LL, 0LL, 0LL);
        }
LABEL_34:

        goto LABEL_35;
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "The request being prepared looks new!",  buf,  2u);
      }

      v23 = v58;
    }

    else
    {
      if (v27) {
        sub_100015B40();
      }

      if (a5 != 5 && a5)
      {
        uint64_t v48 = _INLogSystem(v39);
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          sub_100015AB0();
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue( -[INRegistrationDigestCache registrationDigestForAccount:withError:]( self->_registrationDigestCache,  "registrationDigestForAccount:withError:",  v10,  0LL));
        if (v50)
        {
          v51 = v50;
          id v52 = [v50 isEqual:v20];
          uint64_t v53 = _INLogSystem(v52);
          v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            v55 = @"YES";
            if ((_DWORD)v52) {
              v55 = @"NO";
            }
            *(_DWORD *)buf = 138412290;
            v65 = v55;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Previous registration digest found. Is it different? %@",  buf,  0xCu);
          }

          char v56 = (char)v52;
          uint64_t v13 = v59;
          if ((v56 & 1) != 0) {
            goto LABEL_13;
          }
LABEL_31:
          v42 = v23;
          uint64_t v43 = _INLogSystem(v41);
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v65 = (const __CFString *)v19;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Sending registration request %@",  buf,  0xCu);
          }

          v45 = self->_inflightRegistrationRequestsByAccountID;
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v10, "identifier"));
          -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v19, v46);

          aaUrlSession = self->_aaUrlSession;
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472LL;
          v60[2] = sub_100006754;
          v60[3] = &unk_100024D48;
          v60[4] = self;
          v61 = v20;
          v62 = v10;
          id v63 = v12;
          -[INRegistrationRequest performRequestWithSession:withHandler:]( v19,  "performRequestWithSession:withHandler:",  aaUrlSession,  v60);

          -[NSLock unlock](self->_inflightRegistrationLock, "unlock");
          v23 = v42;
          goto LABEL_34;
        }

        uint64_t v57 = _INLogSystem(0LL);
        v28 = (INRegistrationDigest *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v28,  OS_LOG_TYPE_DEFAULT,  "No previous registration digest was found.",  buf,  2u);
        }
      }

      else
      {
        uint64_t v40 = _INLogSystem(v39);
        v28 = (INRegistrationDigest *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG)) {
          sub_100015ADC();
        }
      }
    }

    goto LABEL_31;
  }

  (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, 2LL, 0LL, 0LL);
LABEL_37:
}

- (void)_handleRegistrationResponse:(id)a3 forRequest:(id)a4 digest:(id)a5 account:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = (void (**)(id, uint64_t, id, void *))a7;
  inflightRegistrationLock = self->_inflightRegistrationLock;
  id v17 = a4;
  -[NSLock lock](inflightRegistrationLock, "lock");
  inflightRegistrationRequestsByAccountID = self->_inflightRegistrationRequestsByAccountID;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
  id v20 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](inflightRegistrationRequestsByAccountID, "objectForKey:", v19));

  if (v20 != v17)
  {
    uint64_t v22 = _INLogSystem(v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "This response is for a stale request. We have another one in-flight.",  buf,  2u);
    }

    uint64_t v24 = 0LL;
    id v25 = 0LL;
    uint64_t v26 = 2LL;
    goto LABEL_15;
  }

  BOOL v27 = self->_inflightRegistrationRequestsByAccountID;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
  -[NSMutableDictionary removeObjectForKey:](v27, "removeObjectForKey:", v28);

  if (!v12 || (id v29 = [v12 isResponseEmpty], (_DWORD)v29))
  {
    uint64_t v30 = _INLogSystem(v29);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100015C44(v12, v31);
    }

    uint64_t v32 = 7LL;
LABEL_14:
    uint64_t v37 = INCreateError(v32);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v37);
    id v25 = 0LL;
    uint64_t v26 = 0LL;
    goto LABEL_15;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v12 error]);

  if (v33)
  {
    uint64_t v35 = _INLogSystem(v34);
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100015D28(v12, v36);
    }

    uint64_t v32 = 6LL;
    goto LABEL_14;
  }

  id v25 = [v12 timeToLive];
  registrationDigestCache = self->_registrationDigestCache;
  id v44 = 0LL;
  unsigned __int8 v39 = -[INRegistrationDigestCache updateRegistrationDigest:forAccount:withError:]( registrationDigestCache,  "updateRegistrationDigest:forAccount:withError:",  v13,  v14,  &v44);
  id v40 = v44;
  uint64_t v41 = v40;
  if ((v39 & 1) == 0)
  {
    uint64_t v42 = _INLogSystem(v40);
    uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_100015CC4();
    }
  }

  uint64_t v24 = 0LL;
  uint64_t v26 = 1LL;
LABEL_15:
  -[NSLock unlock](self->_inflightRegistrationLock, "unlock");
  if (v15) {
    v15[2](v15, v26, v25, v24);
  }
}

- (void)unregisterFromPushNotificationsForAccount:(id)a3 pushToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = -[INRequest initWithAccount:pushToken:]( objc_alloc(&OBJC_CLASS___INUnregistrationRequest),  "initWithAccount:pushToken:",  v8,  v10);

  uint64_t v13 = _INLogSystem(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting unregistration request %@", buf, 0xCu);
  }

  if (v11)
  {
    uint64_t v16 = _INLogSystem(-[NSLock lock](self->_unregisteredAcountsLock, "lock"));
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (INUnregistrationRequest *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Adding %@ to unregistered account IDs.",  buf,  0xCu);
    }

    unregisteredAccountIDs = self->_unregisteredAccountIDs;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    -[NSMutableArray addObject:](unregisteredAccountIDs, "addObject:", v20);

    uint64_t v21 = _INLogSystem(-[NSLock unlock](self->_unregisteredAcountsLock, "unlock"));
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending unregistration request.", buf, 2u);
    }

    aaUrlSession = self->_aaUrlSession;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100006CF4;
    v28[3] = &unk_100024D70;
    v28[4] = self;
    id v29 = v8;
    id v30 = v9;
    -[INUnregistrationRequest performRequestWithSession:withHandler:]( v11,  "performRequestWithSession:withHandler:",  aaUrlSession,  v28);
  }

  else
  {
    uint64_t v24 = _INLogSystem(v15);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100015DA8();
    }

    uint64_t v26 = INCreateError(11LL);
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v27);
  }
}

- (void)_handleUnregistrationResponse:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);

    if (!v12)
    {
      registrationDigestCache = self->_registrationDigestCache;
      id v22 = 0LL;
      uint64_t v18 = -[INRegistrationDigestCache removeRegistrationDigestForAccount:withError:]( registrationDigestCache,  "removeRegistrationDigestForAccount:withError:",  v9,  &v22);
      id v19 = v22;
      uint64_t v16 = v19;
      if ((v18 & 1) == 0)
      {
        uint64_t v20 = _INLogSystem(v19);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100015EF0();
        }
      }

      if (v11) {
        v11[2](v11, 1LL, 0LL);
      }
      goto LABEL_13;
    }
  }

  uint64_t v13 = _INLogSystem(v10);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100015E70(v8, v14);
  }

  if (v11)
  {
    uint64_t v15 = INCreateError(7LL);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    ((void (**)(void, void, void *))v11)[2](v11, 0LL, v16);
LABEL_13:
  }
}

- (void).cxx_destruct
{
}

- (void)registerForLoggedOutPushWithToken:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v11 = _Block_copy(a5);
  id v12 = a3;
  uint64_t v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v16 = v15;

  uint64_t v17 = swift_allocObject(&unk_1000256A8, 24LL, 7LL);
  *(void *)(v17 + 16) = v11;
  uint64_t v18 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v10, 1LL, 1LL, v18);
  id v19 = (void *)swift_allocObject(&unk_1000256D0, 80LL, 7LL);
  v19[2] = 0LL;
  v19[3] = 0LL;
  v19[4] = v14;
  v19[5] = v16;
  v19[6] = a4;
  v19[7] = v13;
  v19[8] = sub_100014320;
  v19[9] = v17;
  uint64_t v20 = v13;
  sub_100010078(v14, v16);
  swift_retain(v17);
  uint64_t v21 = sub_10000FF2C((uint64_t)v10, (uint64_t)&unk_10002C178, (uint64_t)v19);
  swift_release(v17);
  swift_release(v21);
  sub_10000F908(v14, v16);
}

- (void)unregisterFromLoggedOutPushNotificationsWithToken:(NSData *)a3 reason:(unint64_t)a4 completionHandler:(id)a5
{
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v11 = _Block_copy(a5);
  id v12 = (void *)swift_allocObject(&unk_100025608, 48LL, 7LL);
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v10, 1LL, 1LL, v13);
  uint64_t v14 = (void *)swift_allocObject(&unk_100025630, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10002C140;
  v14[5] = v12;
  unint64_t v15 = (void *)swift_allocObject(&unk_100025658, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_10002C150;
  v15[5] = v14;
  unint64_t v16 = a3;
  uint64_t v17 = self;
  uint64_t v18 = sub_100011DDC((uint64_t)v10, (uint64_t)&unk_10002C160, (uint64_t)v15);
  swift_release(v18);
}

@end