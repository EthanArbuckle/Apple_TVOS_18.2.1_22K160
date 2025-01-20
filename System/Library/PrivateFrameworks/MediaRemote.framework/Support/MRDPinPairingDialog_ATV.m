@interface MRDPinPairingDialog_ATV
- (MRDPinPairingDialog_ATV)init;
- (id)_pineboardHangdogInterface;
- (void)closeAll;
- (void)closeForClient:(id)a3;
- (void)closeForClient:(id)a3 userCancelled:(BOOL)a4;
- (void)dealloc;
- (void)showWithPin:(id)a3 forClient:(id)a4;
@end

@implementation MRDPinPairingDialog_ATV

- (MRDPinPairingDialog_ATV)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRDPinPairingDialog_ATV;
  v2 = -[MRDPinPairingDialog_ATV init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    clients = v2->_clients;
    v2->_clients = v3;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDPinPairingDialog_ATV;
  -[MRDPinPairingDialog_ATV dealloc](&v3, "dealloc");
}

- (void)showWithPin:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_titleKey)
  {
    uint64_t v8 = MSVWeakLinkStringConstant("PBSMediaRemoteServiceDialogOptionTitleKey", @"PineBoardServices");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
    titleKey = self->_titleKey;
    self->_titleKey = v9;

    uint64_t v11 = MSVWeakLinkStringConstant("PBSMediaRemoteServiceDialogOptionPINKey", @"PineBoardServices");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
    pinKey = self->_pinKey;
    self->_pinKey = v12;

    uint64_t v14 = MSVWeakLinkStringConstant("PBSMediaRemoteServiceDialogOptionMessageKey", @"PineBoardServices");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(v14);
    messageKey = self->_messageKey;
    self->_messageKey = v15;

    uint64_t v17 = MSVWeakLinkStringConstant("PBSMediaRemoteServiceDialogOptionTimeoutKey", @"PineBoardServices");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue(v17);
    timeoutKey = self->_timeoutKey;
    self->_timeoutKey = v18;
  }

  v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v21 = MRLocalizedString(@"TV_REMOTE_AUTHENTICATION_PIN_DIALOG_HEADER", 0LL);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v22, self->_titleKey);

  -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v6, self->_pinKey);
  uint64_t v23 = MRLocalizedString(@"TV_REMOTE_AUTHENTICATION_PIN_DIALOG_MESSAGE", 0LL);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v24, self->_messageKey);

  -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", &off_1003BB228, self->_timeoutKey);
  if (sub_10013DAD4())
  {
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    v33 = sub_100044A5C;
    v34 = &unk_10039B4C0;
    v35 = self;
    id v25 = v7;
    id v36 = v25;
    v26 = objc_retainBlock(&v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPinPairingDialog_ATV _pineboardHangdogInterface]( self,  "_pineboardHangdogInterface",  v31,  v32,  v33,  v34,  v35));
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 showPinDialogWithOptions:v20 completion:v26]);
    [v25 setPinPairingToken:v28];

    -[NSMutableArray addObject:](self->_clients, "addObject:", v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPinPairingDialog delegate](self, "delegate"));
    LOBYTE(v28) = objc_opt_respondsToSelector(v29, "pinPairingDialogDidOpen:forClient:");

    if ((v28 & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPinPairingDialog delegate](self, "delegate"));
      [v30 pinPairingDialogDidOpen:self forClient:v25];
    }
  }
}

- (void)closeForClient:(id)a3
{
}

- (void)closeForClient:(id)a3 userCancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = self->_clients;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v7);
      }
      if (*(id *)(*((void *)&v16 + 1) + 8 * v10) == v6) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }

    id v8 = v6;

    if (v8)
    {
      -[NSMutableArray removeObject:](self->_clients, "removeObject:", v8, (void)v16);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 pinPairingToken]);

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPinPairingDialog_ATV _pineboardHangdogInterface](self, "_pineboardHangdogInterface"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 pinPairingToken]);
        [v12 dismissPinDialogWithToken:v13];
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPinPairingDialog delegate](self, "delegate"));
      char v15 = objc_opt_respondsToSelector(v14, "pinPairingDialogDidClose:forClient:userCancelled:");

      if ((v15 & 1) != 0)
      {
        id v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MRDPinPairingDialog delegate](self, "delegate"));
        -[NSMutableArray pinPairingDialogDidClose:forClient:userCancelled:]( v7,  "pinPairingDialogDidClose:forClient:userCancelled:",  self,  v8,  v4);
        goto LABEL_15;
      }
    }
  }

  else
  {
LABEL_15:
  }
}

- (void)closeAll
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  objc_super v3 = self->_clients;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v7);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPinPairingDialog_ATV _pineboardHangdogInterface]( self,  "_pineboardHangdogInterface",  (void)v11));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 pinPairingToken]);
        [v9 dismissPinDialogWithToken:v10];

        [v8 setPinPairingToken:0];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_clients, "removeAllObjects");
}

- (id)_pineboardHangdogInterface
{
  if (sub_10013DAD4())
  {
    id v2 = objc_msgSend( (id)MSVWeakLinkClass(@"PBSSystemServiceConnection", @"PineBoardServices"),  "sharedConnection");
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaRemoteServiceProxy]);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end