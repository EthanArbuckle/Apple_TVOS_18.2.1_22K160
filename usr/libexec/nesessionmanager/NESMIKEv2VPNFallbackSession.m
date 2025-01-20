@interface NESMIKEv2VPNFallbackSession
- (BOOL)handleSleep;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (id)copyExtendedStatus;
- (int)type;
- (void)dropServer;
- (void)handleChangeEventForFallback:(BOOL)a3;
- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleInitializeState;
- (void)handleNetworkConfigurationChange:(int64_t)a3;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleSleepTime:(double)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUserLogout;
- (void)handleUserSwitch;
- (void)handleWakeup;
- (void)install;
- (void)installPended;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setStatus:(int)a3;
- (void)uninstall;
@end

@implementation NESMIKEv2VPNFallbackSession

- (void)handleChangeEventForFallback:(BOOL)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000852BC;
  v6[3] = &unk_1000BECE0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000849A4;
  block[3] = &unk_1000BE900;
  id v14 = v9;
  v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, block);
}

- (int)type
{
  return 1;
}

- (void)handleInitializeState
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NESMIKEv2VPNFallbackSession;
  -[NESMSession handleInitializeState](&v17, "handleInitializeState");
  if (self) {
    id Property = objc_getProperty(self, v3, 360LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue([Property objectAtIndexedSubscript:0]);
  BOOL v7 = v5;
  if (v5) {
    id v5 = objc_getProperty(v5, v6, 24LL, 1);
  }
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000848F4;
  block[3] = &unk_1000BEC08;
  void block[4] = self;
  dispatch_async(v8, block);

  if (self) {
    id v10 = objc_getProperty(self, v9, 360LL, 1);
  }
  else {
    id v10 = 0LL;
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
  v13 = v11;
  if (v11) {
    id v11 = objc_getProperty(v11, v12, 24LL, 1);
  }
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 queue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10008494C;
  v15[3] = &unk_1000BEC08;
  v15[4] = self;
  dispatch_async(v14, v15);
}

- (void)handleStartMessage:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 360LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue([Property objectAtIndexedSubscript:0]);
  id v9 = v7;
  if (v7) {
    id v7 = objc_getProperty(v7, v8, 24LL, 1);
  }
  id v10 = [v7 state];

  if (v10 == (id)1)
  {
    if (self) {
      id v12 = objc_getProperty(self, v11, 360LL, 1);
    }
    else {
      id v12 = 0LL;
    }
    id v13 = (id)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
    v15 = v13;
    if (v13) {
      id v13 = objc_getProperty(v13, v14, 24LL, 1);
    }
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 queue]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10008488C;
    v17[3] = &unk_1000BEBE0;
    v17[4] = self;
    id v18 = v5;
    dispatch_async(v16, v17);
  }
}

- (void)handleStopMessageWithReason:(int)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NESMIKEv2VPNFallbackSession;
  -[NESMSession handleStopMessageWithReason:](&v21, "handleStopMessageWithReason:");
  if (self) {
    id Property = objc_getProperty(self, v5, 360LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue([Property objectAtIndexedSubscript:0]);
  id v9 = v7;
  if (v7) {
    id v7 = objc_getProperty(v7, v8, 24LL, 1);
  }
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000847BC;
  block[3] = &unk_1000BED80;
  void block[4] = self;
  int v20 = a3;
  dispatch_async(v10, block);

  if (self) {
    id v12 = objc_getProperty(self, v11, 360LL, 1);
  }
  else {
    id v12 = 0LL;
  }
  id v13 = (id)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:1]);
  v15 = v13;
  if (v13) {
    id v13 = objc_getProperty(v13, v14, 24LL, 1);
  }
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 queue]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100084824;
  v17[3] = &unk_1000BED80;
  v17[4] = self;
  int v18 = a3;
  dispatch_async(v16, v17);
}

- (void)handleWakeup
{
  v2 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360LL, 1);
  }
  id Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0LL));
  id v5 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v4, 24LL, 1);
  }
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([Property queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008470C;
  block[3] = &unk_1000BEC08;
  void block[4] = v2;
  dispatch_async(v6, block);

  if (v2) {
    id v8 = objc_getProperty(v2, v7, 360LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
  id v11 = v9;
  if (v9) {
    id v9 = objc_getProperty(v9, v10, 24LL, 1);
  }
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 queue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100084764;
  v13[3] = &unk_1000BEC08;
  v13[4] = v2;
  dispatch_async(v12, v13);
}

- (BOOL)handleSleep
{
  v2 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360LL, 1);
  }
  id Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0LL));
  id v5 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v4, 24LL, 1);
  }
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([Property queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008465C;
  block[3] = &unk_1000BEC08;
  void block[4] = v2;
  dispatch_async(v6, block);

  if (v2)
  {
    ++v2->_sleepAckCount;
    id v8 = objc_getProperty(v2, v7, 360LL, 1);
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
  id v11 = v9;
  if (v9) {
    id v9 = objc_getProperty(v9, v10, 24LL, 1);
  }
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 queue]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000846B4;
  v14[3] = &unk_1000BEC08;
  v14[4] = v2;
  dispatch_async(v12, v14);

  if (v2) {
    ++v2->_sleepAckCount;
  }
  return 1;
}

- (void)handleSleepTime:(double)a3
{
  v4 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360LL, 1);
  }
  id Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0LL));
  id v7 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v6, 24LL, 1);
  }
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([Property queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008458C;
  block[3] = &unk_1000BEB20;
  void block[4] = v4;
  *(double *)&void block[5] = a3;
  dispatch_async(v8, block);

  if (v4) {
    id v10 = objc_getProperty(v4, v9, 360LL, 1);
  }
  else {
    id v10 = 0LL;
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
  id v13 = v11;
  if (v11) {
    id v11 = objc_getProperty(v11, v12, 24LL, 1);
  }
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 queue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000845F4;
  v15[3] = &unk_1000BEB20;
  v15[4] = v4;
  *(double *)&void v15[5] = a3;
  dispatch_async(v14, v15);
}

- (void)handleUserLogout
{
  v2 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360LL, 1);
  }
  id Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0LL));
  id v5 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v4, 24LL, 1);
  }
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([Property queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000844DC;
  block[3] = &unk_1000BEC08;
  void block[4] = v2;
  dispatch_async(v6, block);

  if (v2) {
    id v8 = objc_getProperty(v2, v7, 360LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
  id v11 = v9;
  if (v9) {
    id v9 = objc_getProperty(v9, v10, 24LL, 1);
  }
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 queue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100084534;
  v13[3] = &unk_1000BEC08;
  v13[4] = v2;
  dispatch_async(v12, v13);
}

- (void)handleUserSwitch
{
  v2 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360LL, 1);
  }
  id Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0LL));
  id v5 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v4, 24LL, 1);
  }
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([Property queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008442C;
  block[3] = &unk_1000BEC08;
  void block[4] = v2;
  dispatch_async(v6, block);

  if (v2) {
    id v8 = objc_getProperty(v2, v7, 360LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
  id v11 = v9;
  if (v9) {
    id v9 = objc_getProperty(v9, v10, 24LL, 1);
  }
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 queue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100084484;
  v13[3] = &unk_1000BEC08;
  v13[4] = v2;
  dispatch_async(v12, v13);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v38.receiver = self;
    v38.super_class = (Class)&OBJC_CLASS___NESMIKEv2VPNFallbackSession;
    if (!-[NESMSession handleUpdateConfiguration:](&v38, "handleUpdateConfiguration:", v5))
    {
      BOOL v30 = 0;
      goto LABEL_23;
    }

    if (self) {
      id Property = objc_getProperty(self, v6, 360LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v8 = (id)objc_claimAutoreleasedReturnValue([Property objectAtIndexedSubscript:0]);
    id v10 = v8;
    if (v8) {
      id v8 = objc_getProperty(v8, v9, 24LL, 1);
    }
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008427C;
    block[3] = &unk_1000BEBE0;
    id v12 = v5;
    id v36 = v12;
    v37 = self;
    dispatch_async(v11, block);

    if (self) {
      id v14 = objc_getProperty(self, v13, 360LL, 1);
    }
    else {
      id v14 = 0LL;
    }
    id v15 = (id)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:1]);
    objc_super v17 = v15;
    if (v15) {
      id v15 = objc_getProperty(v15, v16, 24LL, 1);
    }
    int v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v15 queue]);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100084354;
    v32[3] = &unk_1000BEBE0;
    id v33 = v12;
    v34 = self;
    dispatch_async(v18, v32);
  }

  else
  {
    if (self) {
      id v19 = objc_getProperty(self, v4, 360LL, 1);
    }
    else {
      id v19 = 0LL;
    }
    id v20 = (id)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:0]);
    v22 = v20;
    if (v20) {
      id v20 = objc_getProperty(v20, v21, 24LL, 1);
    }
    v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v20 queue]);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10008401C;
    v40[3] = &unk_1000BEC08;
    v40[4] = self;
    dispatch_async(v23, v40);

    if (self) {
      id v25 = objc_getProperty(self, v24, 360LL, 1);
    }
    else {
      id v25 = 0LL;
    }
    id v26 = (id)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:1]);
    v28 = v26;
    if (v26) {
      id v26 = objc_getProperty(v26, v27, 24LL, 1);
    }
    v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v26 queue]);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10008414C;
    v39[3] = &unk_1000BEC08;
    v39[4] = self;
    dispatch_async(v29, v39);
  }

  BOOL v30 = 1;
LABEL_23:

  return v30;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t xdict = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    id v29 = -[NESMIKEv2VPNFallbackSession copyExtendedStatus](self, "copyExtendedStatus");
    id v8 = xdict;
    if (!v29) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  id v8 = xdict;
  if (a4 == 1)
  {
    xpc_object_t v56 = reply;
    if (!self)
    {
      id v29 = 0LL;
LABEL_21:
      xpc_object_t reply = v56;
      id v8 = xdict;
      if (v29)
      {
LABEL_22:
        v50 = (void *)_CFXPCCreateXPCObjectFromCFObject(v29);
        xpc_dictionary_set_value(reply, "SessionInfo", v50);

        id v8 = xdict;
        goto LABEL_23;
      }

      goto LABEL_23;
    }

    id v9 = &selRef_setName_;
    id v10 = objc_msgSend(objc_getProperty(self, v6, 360, 1), "objectAtIndexedSubscript:", 0);
    id Property = (id)objc_claimAutoreleasedReturnValue(v10);
    id v13 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v12, 24LL, 1);
    }
    id v14 = [Property copyStatistics];

    if (v14)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"VPN"]);
      objc_super v17 = v16;
      if (v16)
      {
        int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"BytesIn"]);
        id v19 = (char *)[v18 unsignedLongLongValue];

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"BytesOut"]);
        objc_super v21 = (char *)[v20 unsignedLongLongValue];

        v22 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"PacketsIn"]);
        id v53 = [v22 unsignedLongLongValue];

        v23 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"PacketsOut"]);
        v24 = (char *)[v23 unsignedLongLongValue];

        id v25 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"ErrorsIn"]);
        id v26 = (char *)[v25 unsignedLongLongValue];

        v27 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"ErrorsOut"]);
        v28 = (char *)[v27 unsignedLongLongValue];

        id v9 = &selRef_setName_;
        goto LABEL_13;
      }
    }

    else
    {
      objc_super v17 = 0LL;
    }

    id v19 = 0LL;
    objc_super v21 = 0LL;
    id v53 = 0LL;
    v24 = 0LL;
    id v26 = 0LL;
    v28 = 0LL;
LABEL_13:
    id v30 = objc_msgSend(objc_getProperty(self, v15, *((int *)v9 + 678), 1), "objectAtIndexedSubscript:", 1);
    id v31 = (id)objc_claimAutoreleasedReturnValue(v30);
    id v33 = v31;
    if (v31) {
      id v31 = objc_getProperty(v31, v32, 24LL, 1);
    }
    id v34 = objc_msgSend(v31, "copyStatistics", v53);

    v55 = v34;
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"VPN"]);

      if (v35)
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"BytesIn"]);
        id v19 = &v19[(void)[v36 unsignedLongLongValue]];

        v37 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"BytesOut"]);
        objc_super v21 = &v21[(void)[v37 unsignedLongLongValue]];

        objc_super v38 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"PacketsIn"]);
        v39 = &v54[(void)[v38 unsignedLongLongValue]];

        v40 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"PacketsOut"]);
        v24 = &v24[(void)[v40 unsignedLongLongValue]];

        v41 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"ErrorsIn"]);
        id v26 = &v26[(void)[v41 unsignedLongLongValue]];

        v42 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"ErrorsOut"]);
        v28 = &v28[(void)[v42 unsignedLongLongValue]];

        objc_super v17 = v35;
LABEL_20:
        uint64_t v60 = kSCEntNetVPN;
        v58[0] = @"BytesIn";
        v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v19));
        v59[0] = v43;
        v58[1] = @"BytesOut";
        v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v21));
        v59[1] = v44;
        v58[2] = @"PacketsIn";
        v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v39));
        v59[2] = v45;
        v58[3] = @"PacketsOut";
        v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v24));
        v59[3] = v46;
        v58[4] = @"ErrorsIn";
        v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v26));
        v59[4] = v47;
        v58[5] = @"ErrorsOut";
        v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v28));
        v59[5] = v48;
        v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  6LL));
        v61 = v49;
        id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));

        goto LABEL_21;
      }

      objc_super v17 = 0LL;
    }

    v39 = v54;
    goto LABEL_20;
  }

- (id)copyExtendedStatus
{
  v2 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360LL, 1);
  }
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0LL));
  id v5 = (void *)v3;
  if (v3 && *(_DWORD *)(v3 + 8) == 3
    || (!v2 ? (id v7 = 0LL) : (id v7 = objc_getProperty(v2, v4, 360LL, 1)),
        (id v8 = (_DWORD *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:1])) == 0))
  {

LABEL_13:
    if (v2) {
      id Property = objc_getProperty(v2, v6, 360LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v11 = 0LL;
    goto LABEL_16;
  }

  int v9 = v8[2];

  if (v9 != 3) {
    goto LABEL_13;
  }
  if (v2) {
    id Property = objc_getProperty(v2, v6, 360LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v11 = 1LL;
LABEL_16:
  id v12 = (id)objc_claimAutoreleasedReturnValue([Property objectAtIndexedSubscript:v11]);
  id v14 = v12;
  if (v12) {
    id v12 = objc_getProperty(v12, v13, 24LL, 1);
  }
  id v15 = [v12 copyExtendedStatus];

  if (!v15)
  {
    id v16 = 0LL;
    goto LABEL_41;
  }

  id v16 = [v15 mutableCopy];
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"VPN"]);
  int v18 = isa_nsdictionary(v17);

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"VPN"]);
    id v20 = (NSMutableDictionary *)[v19 mutableCopy];
  }

  else
  {
    id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  if (-[NESMSession status](v2, "status") == 3)
  {
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[NESMSession connectTime](v2, "connectTime")));
    v22 = @"ConnectTime";
LABEL_27:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v21, v22);

    goto LABEL_28;
  }

  if (-[NESMSession status](v2, "status") != 2)
  {
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NESMSession lastStopReason](v2, "lastStopReason")));
    v22 = @"LastCause";
    goto LABEL_27;
  }

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v10 = ne_log_obj(v8, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    int v24 = self;
    __int16 v25 = 2080;
    id v26 = "-[NESMIKEv2VPNFallbackSession handleChangeEventForInterface:newFlags:previousFlags:]";
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 1024;
    int v30 = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%@:%s: Enter (ifName %@, flags %X)",  buf,  0x26u);
  }

  if (self) {
    id Property = objc_getProperty(self, v12, 360LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v14 = (id)objc_claimAutoreleasedReturnValue([Property objectAtIndexedSubscript:0]);
  id v16 = v14;
  if (v14) {
    id v14 = objc_getProperty(v14, v15, 24LL, 1);
  }
  objc_super v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 queue]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100083FB0;
  v19[3] = &unk_1000BE928;
  v19[4] = self;
  id v20 = v8;
  unint64_t v21 = a4;
  unint64_t v22 = a5;
  id v18 = v8;
  dispatch_async(v17, v19);
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  v4 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360LL, 1);
  }
  id Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0LL));
  id v7 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v6, 24LL, 1);
  }
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([Property queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100083EE0;
  block[3] = &unk_1000BED80;
  void block[4] = v4;
  int v18 = a3;
  dispatch_async(v8, block);

  if (v4) {
    id v10 = objc_getProperty(v4, v9, 360LL, 1);
  }
  else {
    id v10 = 0LL;
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
  id v13 = v11;
  if (v11) {
    id v11 = objc_getProperty(v11, v12, 24LL, 1);
  }
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 queue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100083F48;
  v15[3] = &unk_1000BED80;
  v15[4] = v4;
  int v16 = a3;
  dispatch_async(v14, v15);
}

- (void)setStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = ne_log_obj(self, a2);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v23 = self;
    __int16 v24 = 2080;
    __int16 v25 = "-[NESMIKEv2VPNFallbackSession setStatus:]";
    __int16 v26 = 2080;
    uint64_t v27 = ne_session_status_to_string(v3);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@:%s: Enter (new status %s)", buf, 0x20u);
  }

  if (self) {
    id Property = objc_getProperty(self, v7, 360LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v9 = (_DWORD *)objc_claimAutoreleasedReturnValue([Property objectAtIndexedSubscript:0]);
  if (v9) {
    int v10 = v9[2];
  }
  else {
    int v10 = 0;
  }

  if (self) {
    id v12 = objc_getProperty(self, v11, 360LL, 1);
  }
  else {
    id v12 = 0LL;
  }
  id v13 = (unsigned int *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:1]);
  if (v13) {
    uint64_t v14 = v13[2];
  }
  else {
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = sub_100083D24((uint64_t)self, v10, v14);
  uint64_t v16 = sub_100083D24((uint64_t)self, v3, v15);
  uint64_t v18 = ne_log_obj(v16, v17);
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = ne_session_status_to_string(v16);
    *(_DWORD *)buf = 138412802;
    v23 = self;
    __int16 v24 = 2080;
    __int16 v25 = "-[NESMIKEv2VPNFallbackSession setStatus:]";
    __int16 v26 = 2080;
    uint64_t v27 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@:%s: Status to Client: %s", buf, 0x20u);
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NESMIKEv2VPNFallbackSession;
  -[NESMSession setStatus:](&v21, "setStatus:", v16);
}

- (void)install
{
  if (self && (v2 = self, (self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 408LL, 1)) != 0LL))
  {
    if (objc_msgSend(objc_getProperty(v2, a2, 408, 1), "count"))
    {
      id v5 = objc_msgSend(objc_getProperty(v2, v3, 408, 1), "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      id v8 = v6;
      if (v6 && v6[2] == 3LL)
      {
        id Property = objc_getProperty(v6, v7, 24LL, 1);
        if (Property) {
          id Property = objc_getProperty(Property, v10, 24LL, 1);
        }
        id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([Property queue]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100083CCC;
        block[3] = &unk_1000BEC08;
        id v12 = v8;
        id v55 = v12;
        dispatch_async(v11, block);

        uint64_t v15 = ne_log_obj(v13, v14);
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = objc_getProperty(v12, v17, 24LL, 1);
          *(_DWORD *)buf = 138412546;
          v58 = (const char *)v2;
          __int16 v59 = 2112;
          id v60 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@, installed session %@", buf, 0x16u);
        }

        uint64_t v20 = objc_getProperty(v12, v19, 24LL, 1);
        if (v20) {
          v20[4] = 5LL;
        }
        objc_msgSend(objc_getProperty(v2, v21, 408, 1), "removeObject:", v12);

        v2->_installState = 5LL;
        if (!objc_msgSend(objc_getProperty(v2, v22, 408, 1), "count")) {
          goto LABEL_23;
        }
        id v24 = objc_msgSend(objc_getProperty(v2, v23, 408, 1), "objectAtIndexedSubscript:", 0);
        uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
        uint64_t v27 = (os_log_s *)v25;
        if (v25)
        {
          uint64_t v28 = *(void *)(v25 + 16);
          if (v28 == 2)
          {
            sub_100083678(v2, v26);
          }

          else if (v28 == 3)
          {
            sub_100083188(v2, v26);
          }
        }
      }

      else
      {
        uint64_t v31 = ne_log_obj(v6, v7);
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_FAULT,  "bad operation request state",  buf,  2u);
        }
      }

LABEL_23:
      return;
    }

    uint64_t v32 = 0LL;
    char v33 = 1;
    *(void *)&__int128 v4 = 138412546LL;
    __int128 v53 = v4;
    do
    {
      char v34 = v33;
      id v35 = objc_msgSend(objc_getProperty(v2, v3, 360, 1), "objectAtIndexedSubscript:", v32);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      if (v36)
      {
        uint64_t v37 = v36[4];

        if (v37 == 4)
        {
          id v38 = objc_msgSend(objc_getProperty(v2, v3, 360, 1), "objectAtIndexedSubscript:", v32);
          id v39 = (id)objc_claimAutoreleasedReturnValue(v38);
          v41 = v39;
          if (v39) {
            id v39 = objc_getProperty(v39, v40, 24LL, 1);
          }
          v42 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "queue", v53));
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472LL;
          v56[2] = sub_100083C68;
          v56[3] = &unk_1000BEB20;
          v56[4] = v2;
          v56[5] = v32;
          dispatch_async(v42, v56);

          uint64_t v45 = ne_log_obj(v43, v44);
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            id v48 = objc_msgSend(objc_getProperty(v2, v47, 360, 1), "objectAtIndexedSubscript:", v32);
            v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
            *(_DWORD *)buf = v53;
            v58 = (const char *)v2;
            __int16 v59 = 2112;
            id v60 = v49;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%@ installing pending session %@",  buf,  0x16u);
          }

          id v51 = objc_msgSend(objc_getProperty(v2, v50, 360, 1), "objectAtIndexedSubscript:", v32);
          v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          if (v52) {
            v52[4] = 5LL;
          }
        }
      }

      char v33 = 0;
      uint64_t v32 = 1LL;
    }

    while ((v34 & 1) != 0);
    v2->_installState = 5LL;
  }

  else
  {
    uint64_t v29 = ne_log_obj(self, a2);
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[NESMIKEv2VPNFallbackSession install]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_FAULT,  "%s called with null self.configurationOperationArray",  buf,  0xCu);
    }
  }

- (void)installPended
{
  if (!self || (v2 = self, (self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 408LL, 1)) == 0LL))
  {
    uint64_t v28 = ne_log_obj(self, a2);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v37 = "-[NESMIKEv2VPNFallbackSession installPended]";
    uint64_t v29 = "%s called with null self.configurationOperationArray";
    int v30 = v11;
    uint32_t v31 = 12;
LABEL_21:
    _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, v29, buf, v31);
    goto LABEL_25;
  }

  if (!objc_msgSend(objc_getProperty(v2, a2, 408, 1), "count"))
  {
    uint64_t v32 = ne_log_obj(0LL, v3);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    uint64_t v29 = "request install configuration operation array is empty";
    int v30 = v11;
    uint32_t v31 = 2;
    goto LABEL_21;
  }

  id v4 = objc_msgSend(objc_getProperty(v2, v3, 408, 1), "objectAtIndexedSubscript:", 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v7 = v5;
  if (!v5 || v5[2] != 3LL)
  {
    uint64_t v33 = ne_log_obj(v5, v6);
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "bad operation request state", buf, 2u);
    }

    goto LABEL_24;
  }

  id Property = objc_getProperty(v5, v6, 24LL, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v9, 24LL, 1);
  }
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([Property queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100083C10;
  block[3] = &unk_1000BEC08;
  id v11 = v7;
  id v35 = v11;
  dispatch_async(v10, block);

  uint64_t v14 = ne_log_obj(v12, v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_getProperty(v11, v16, 24LL, 1);
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = (const char *)v2;
    __int16 v38 = 2112;
    id v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@, pending session %@", buf, 0x16u);
  }

  SEL v19 = objc_getProperty(v11, v18, 24LL, 1);
  if (v19) {
    v19[4] = 4LL;
  }
  objc_msgSend(objc_getProperty(v2, v20, 408, 1), "removeObject:", v11);

  v2->_installState = 4LL;
  if (objc_msgSend(objc_getProperty(v2, v21, 408, 1), "count"))
  {
    id v23 = objc_msgSend(objc_getProperty(v2, v22, 408, 1), "objectAtIndexedSubscript:", 0);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    __int16 v26 = (os_log_s *)v24;
    if (v24)
    {
      uint64_t v27 = *(void *)(v24 + 16);
      if (v27 == 2)
      {
        sub_100083678(v2, v25);
      }

      else if (v27 == 3)
      {
        sub_100083188(v2, v25);
      }
    }

- (void)uninstall
{
  if (!self || (v2 = self, (self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 408LL, 1)) == 0LL))
  {
    uint64_t v28 = ne_log_obj(self, a2);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v37 = "-[NESMIKEv2VPNFallbackSession uninstall]";
    uint64_t v29 = "%s called with null self.configurationOperationArray";
    int v30 = v11;
    uint32_t v31 = 12;
LABEL_26:
    _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, v29, buf, v31);
    goto LABEL_23;
  }

  if (!objc_msgSend(objc_getProperty(v2, a2, 408, 1), "count"))
  {
    uint64_t v33 = ne_log_obj(0LL, v3);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    uint64_t v29 = "request uninstall configuration operation array is empty";
    int v30 = v11;
    uint32_t v31 = 2;
    goto LABEL_26;
  }

  id v4 = objc_msgSend(objc_getProperty(v2, v3, 408, 1), "objectAtIndexedSubscript:", 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v7 = v5;
  if (!v5 || v5[2] != 2LL)
  {
    uint64_t v32 = ne_log_obj(v5, v6);
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "bad operation request state", buf, 2u);
    }

    goto LABEL_21;
  }

  id Property = objc_getProperty(v5, v6, 24LL, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v9, 24LL, 1);
  }
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([Property queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100083130;
  block[3] = &unk_1000BEC08;
  id v11 = v7;
  id v35 = v11;
  dispatch_async(v10, block);

  uint64_t v14 = ne_log_obj(v12, v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_getProperty(v11, v16, 24LL, 1);
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = (const char *)v2;
    __int16 v38 = 2112;
    id v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ uninstalling session %@", buf, 0x16u);
  }

  SEL v19 = objc_getProperty(v11, v18, 24LL, 1);
  if (v19) {
    v19[4] = 1LL;
  }
  objc_msgSend(objc_getProperty(v2, v20, 408, 1), "removeObject:", v11);

  v2->_installState = 1LL;
  if (objc_msgSend(objc_getProperty(v2, v21, 408, 1), "count"))
  {
    id v23 = objc_msgSend(objc_getProperty(v2, v22, 408, 1), "objectAtIndexedSubscript:", 0);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    __int16 v26 = (os_log_s *)v24;
    if (v24)
    {
      uint64_t v27 = *(void *)(v24 + 16);
      if (v27 == 2)
      {
        sub_100083678(v2, v25);
      }

      else if (v27 == 3)
      {
        sub_100083188(v2, v25);
      }
    }

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  id v4 = self;
  if (self) {
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360LL, 1);
  }
  id Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0LL));
  id v7 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v6, 24LL, 1);
  }
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([Property queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100083060;
  block[3] = &unk_1000BEB20;
  void block[4] = v4;
  void block[5] = a3;
  dispatch_async(v8, block);

  if (v4) {
    id v10 = objc_getProperty(v4, v9, 360LL, 1);
  }
  else {
    id v10 = 0LL;
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
  uint64_t v13 = v11;
  if (v11) {
    id v11 = objc_getProperty(v11, v12, 24LL, 1);
  }
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 queue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000830C8;
  v15[3] = &unk_1000BEB20;
  v15[4] = v4;
  void v15[5] = a3;
  dispatch_async(v14, v15);
}

- (void)dropServer
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  [v3 removeObserver:self forKeyPath:@"primaryCellularInterface"];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NESMIKEv2VPNFallbackSession;
  -[NESMSession dropServer](&v4, "dropServer");
}

- (void).cxx_destruct
{
}

@end