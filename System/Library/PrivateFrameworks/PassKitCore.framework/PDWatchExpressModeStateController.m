@interface PDWatchExpressModeStateController
- (BOOL)isInLostMode;
- (NSSet)expressPassConfigurations;
- (PDWatchExpressModeStateController)initWithExpressPassConfigurations:(id)a3 inLostMode:(BOOL)a4;
- (PDWatchExpressModeStateControllerDelegate)delegate;
- (unint64_t)expressStatus;
- (unint64_t)lastSuggestedExpressStatus;
- (void)_logControllerState;
- (void)_registerForExpressAvailabilityChanges;
- (void)_requestUpdateExpressStatus:(unint64_t)a3;
- (void)_unregisterForExpressAvailabilityChanges;
- (void)_updateExpressAvailabilityListeners;
- (void)_updateExpressModeEnablement;
- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setExpressModeAllowed:(BOOL)a3;
- (void)setExpressPassConfigurations:(id)a3;
- (void)setExpressStatus:(unint64_t)a3;
- (void)setInLostMode:(BOOL)a3;
- (void)setLastSuggestedExpressStatus:(unint64_t)a3;
@end

@implementation PDWatchExpressModeStateController

- (PDWatchExpressModeStateController)initWithExpressPassConfigurations:(id)a3 inLostMode:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDWatchExpressModeStateController;
  v8 = -[PDWatchExpressModeStateController init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v8->_expressStatus = 0LL;
    v8->_lastSuggestedExpressStatus = 0LL;
    objc_storeStrong((id *)&v8->_expressPassConfigurations, a3);
    v9->_inLostMode = a4;
    -[PDWatchExpressModeStateController _logControllerState](v9, "_logControllerState");
    id v10 = PDDefaultQueue();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    PDXPCEventStreamRegisterObserver(v9, @"com.apple.NanoPassbookEvents", v11);

    -[PDWatchExpressModeStateController _updateExpressAvailabilityListeners](v9, "_updateExpressAvailabilityListeners");
  }

  return v9;
}

- (void)setExpressStatus:(unint64_t)a3
{
  if (self->_expressStatus != a3)
  {
    self->_expressStatus = a3;
    -[PDWatchExpressModeStateController _logControllerState](self, "_logControllerState");
    -[PDWatchExpressModeStateController _updateExpressModeEnablement](self, "_updateExpressModeEnablement");
  }

- (void)setExpressModeAllowed:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = 3LL;
  }
  -[PDWatchExpressModeStateController setExpressStatus:](self, "setExpressStatus:", v3);
}

- (void)setExpressPassConfigurations:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects(v5, self->_expressPassConfigurations) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_expressPassConfigurations, a3);
    -[PDWatchExpressModeStateController _logControllerState](self, "_logControllerState");
    -[PDWatchExpressModeStateController _updateExpressAvailabilityListeners]( self,  "_updateExpressAvailabilityListeners");
    -[PDWatchExpressModeStateController _updateExpressModeEnablement](self, "_updateExpressModeEnablement");
  }
}

- (void)setInLostMode:(BOOL)a3
{
  if (self->_inLostMode != a3)
  {
    self->_inLostMode = a3;
    -[PDWatchExpressModeStateController _logControllerState](self, "_logControllerState");
    -[PDWatchExpressModeStateController _updateExpressModeEnablement](self, "_updateExpressModeEnablement");
  }

- (void)_registerForExpressAvailabilityChanges
{
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Registering for watch express availability changes",  v5,  2u);
  }

  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "Event", "ExpressModeEvent");
  xpc_set_event("com.apple.NanoPassbookEvents", "ExpressModeEvent", v4);
}

- (void)_unregisterForExpressAvailabilityChanges
{
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)xpc_object_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Unregistering for watch express availability changes",  v4,  2u);
  }

  xpc_set_event("com.apple.NanoPassbookEvents", "ExpressModeEvent", 0LL);
}

- (void)_logControllerState
{
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  xpc_object_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = PKWatchExpressStatusToString(-[PDWatchExpressModeStateController expressStatus](self, "expressStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    unsigned int v7 = -[PDWatchExpressModeStateController isInLostMode](self, "isInLostMode");
    v8 = "is not";
    if (v7) {
      v8 = "is";
    }
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2080;
    v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Express mode state: express status is %@; device %s in lost mode",
      (uint8_t *)&v9,
      0x16u);
  }
}

- (void)_requestUpdateExpressStatus:(unint64_t)a3
{
  if (-[PDWatchExpressModeStateController lastSuggestedExpressStatus](self, "lastSuggestedExpressStatus") != a3)
  {
    switch(a3)
    {
      case 0uLL:
        uint64_t Object = PKLogFacilityTypeGetObject(0LL);
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        unsigned int v7 = "Suggesting that express status is unknown";
        break;
      case 1uLL:
        uint64_t v10 = PKLogFacilityTypeGetObject(0LL);
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        unsigned int v7 = "Suggesting that express should be enabled";
        break;
      case 2uLL:
        uint64_t v8 = PKLogFacilityTypeGetObject(0LL);
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        unsigned int v7 = "Suggesting that express grace period should become active";
        break;
      case 3uLL:
        uint64_t v9 = PKLogFacilityTypeGetObject(0LL);
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        unsigned int v7 = "Suggesting that express should be disabled";
        break;
      default:
        goto LABEL_13;
    }

    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
LABEL_12:

LABEL_13:
    -[PDWatchExpressModeStateController setLastSuggestedExpressStatus:](self, "setLastSuggestedExpressStatus:", a3);
    id v11 = PDDefaultQueue();
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100317510;
    v13[3] = &unk_10063A8A8;
    v13[4] = self;
    v13[5] = a3;
    dispatch_async(v12, v13);
  }

- (void)_updateExpressAvailabilityListeners
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWatchExpressModeStateController expressPassConfigurations](self, "expressPassConfigurations"));
  id v4 = [v3 count];

  if (v4) {
    -[PDWatchExpressModeStateController _registerForExpressAvailabilityChanges]( self,  "_registerForExpressAvailabilityChanges");
  }
  else {
    -[PDWatchExpressModeStateController _unregisterForExpressAvailabilityChanges]( self,  "_unregisterForExpressAvailabilityChanges");
  }
}

- (void)_updateExpressModeEnablement
{
  unint64_t v3 = -[PDWatchExpressModeStateController expressStatus](self, "expressStatus");
  if (!v3) {
    goto LABEL_7;
  }
  unint64_t v4 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDWatchExpressModeStateController expressPassConfigurations](self, "expressPassConfigurations"));
  if (![v5 count])
  {

LABEL_7:
    uint64_t v7 = 3LL;
    goto LABEL_8;
  }

  unsigned int v6 = -[PDWatchExpressModeStateController isInLostMode](self, "isInLostMode");

  if (v6) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = v4;
  }
LABEL_8:
  -[PDWatchExpressModeStateController _requestUpdateExpressStatus:](self, "_requestUpdateExpressStatus:", v7);
}

- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4
{
  id v6 = a3;
  string = xpc_dictionary_get_string(v6, _xpc_event_key_name);
  if (!string)
  {
    uint64_t v8 = 0LL;
    if (v6) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v9 = 0LL;
    goto LABEL_7;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  if (!v6) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v9 = (void *)_CFXPCCreateCFObjectFromXPCObject(v6);
LABEL_7:
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    v24 = v8;
    __int16 v25 = 2112;
    v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Express mode state: Received XPC events stream handler callback for NanoPassbook event name %@ dict %@",  (uint8_t *)&v23,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "ExpressModeEvent"));
  unsigned int v13 = [v8 isEqualToString:v12];

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "ExpressModeStatus"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v9 objectForKey:v14]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([(id)v15 stringValue]);

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "ExpressModeAllowed"));
    LOBYTE(v15) = [v16 isEqualToString:v17];

    if ((v15 & 1) != 0)
    {
      uint64_t v18 = 1LL;
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "ExpressGracePeriodActive"));
      unsigned __int8 v20 = [v16 isEqualToString:v19];

      if ((v20 & 1) != 0)
      {
        uint64_t v18 = 2LL;
      }

      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "ExpressModeForbidden"));
        unsigned __int8 v22 = [v16 isEqualToString:v21];

        if ((v22 & 1) != 0)
        {
          uint64_t v18 = 3LL;
        }

        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = 138412290;
            v24 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Express mode state: Received unrecognized express status: %@",  (uint8_t *)&v23,  0xCu);
          }

          uint64_t v18 = 0LL;
        }
      }
    }

    -[PDWatchExpressModeStateController setExpressStatus:](self, "setExpressStatus:", v18);
  }

LABEL_21:
}

- (NSSet)expressPassConfigurations
{
  return self->_expressPassConfigurations;
}

- (BOOL)isInLostMode
{
  return self->_inLostMode;
}

- (PDWatchExpressModeStateControllerDelegate)delegate
{
  return (PDWatchExpressModeStateControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)expressStatus
{
  return self->_expressStatus;
}

- (unint64_t)lastSuggestedExpressStatus
{
  return self->_lastSuggestedExpressStatus;
}

- (void)setLastSuggestedExpressStatus:(unint64_t)a3
{
  self->_lastSuggestedExpressStatus = a3;
}

- (void).cxx_destruct
{
}

@end