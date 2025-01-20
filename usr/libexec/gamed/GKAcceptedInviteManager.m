@interface GKAcceptedInviteManager
+ (id)syncQueue;
- (BOOL)removeAndReturnQueuedCancelledInviteWithSessionToken:(id)a3;
- (GKAcceptedInviteManager)init;
- (NSMutableArray)acceptedMultiplayerInvites;
- (NSMutableArray)acceptedTurnBased;
- (NSMutableArray)queuedCancelledMultiplayerInviteSessionTokens;
- (id)_fetchAndRemoveBulletinFromArray:(id)a3 passingTest:(id)a4;
- (id)_fetchObjectFromArray:(id)a3 passingTest:(id)a4;
- (id)description;
- (id)multiplayerInviteForGame:(id)a3;
- (id)multiplayerInviteForGameDescriptor:(id)a3;
- (id)removeAndReturnInviteWithSessionToken:(id)a3;
- (id)removeAndReturnTurnBasedInviteWithMatchID:(id)a3;
- (id)turnBasedInviteForGame:(id)a3;
- (id)turnBasedInviteForGameDescriptor:(id)a3;
- (void)_addBulletin:(id)a3 toArray:(id)a4;
- (void)_insertBulletin:(id)a3 atFrontOfArray:(id)a4;
- (void)addMultiplayerInvite:(id)a3;
- (void)addTurnBasedEvent:(id)a3;
- (void)declineMultiplayerInvite:(id)a3;
- (void)performSync:(id)a3;
- (void)queueCancelledMultiplayerInviteSessionToken:(id)a3;
- (void)setAcceptedMultiplayerInvites:(id)a3;
- (void)setAcceptedTurnBased:(id)a3;
- (void)setQueuedCancelledMultiplayerInviteSessionTokens:(id)a3;
@end

@implementation GKAcceptedInviteManager

- (GKAcceptedInviteManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GKAcceptedInviteManager;
  v2 = -[GKAcceptedInviteManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    acceptedMultiplayerInvites = v2->_acceptedMultiplayerInvites;
    v2->_acceptedMultiplayerInvites = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    queuedCancelledMultiplayerInviteSessionTokens = v2->_queuedCancelledMultiplayerInviteSessionTokens;
    v2->_queuedCancelledMultiplayerInviteSessionTokens = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    acceptedTurnBased = v2->_acceptedTurnBased;
    v2->_acceptedTurnBased = v7;
  }

  return v2;
}

+ (id)syncQueue
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers(a1);
  }
  v3 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager syncQueue", v5, 2u);
  }

  if (qword_1002BB770 != -1) {
    dispatch_once(&qword_1002BB770, &stru_100273188);
  }
  return (id)qword_1002BB768;
}

- (void)performSync:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager performSync:", buf, 2u);
  }

  id v8 = [(id)objc_opt_class(self) syncQueue];
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);

  if (v11 == v9)
  {
    label = dispatch_queue_get_label(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the same queue(%s), would deadlock at %@",  "-[GKAcceptedInviteManager performSync:]",  label,  v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAcceptedInviteManager.m"));
    id v16 = objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]",  v14,  "-[GKAcceptedInviteManager performSync:]",  [v16 UTF8String],  58));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v17);
  }

  dispatch_sync(v9, v5);
}

- (void)_addBulletin:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  objc_super v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager _addBulletin: toArray:",  buf,  2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010E4C4;
  v13[3] = &unk_10026BDB0;
  id v14 = v8;
  id v15 = v6;
  id v11 = v6;
  id v12 = v8;
  -[GKAcceptedInviteManager performSync:](self, "performSync:", v13);
}

- (void)_insertBulletin:(id)a3 atFrontOfArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  objc_super v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager _insertBulletin:toFrontOfArray:",  buf,  2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010E5D4;
  v13[3] = &unk_10026BDB0;
  id v14 = v8;
  id v15 = v6;
  id v11 = v6;
  id v12 = v8;
  -[GKAcceptedInviteManager performSync:](self, "performSync:", v13);
}

- (id)_fetchObjectFromArray:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  objc_super v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager _fetchObjectinFromArray: passingTest:",  buf,  2u);
  }

  *(void *)buf = 0LL;
  v20 = buf;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10010E758;
  v23 = sub_10010E768;
  id v24 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10010E770;
  v15[3] = &unk_1002731B0;
  id v11 = v6;
  id v16 = v11;
  id v12 = v8;
  id v17 = v12;
  v18 = buf;
  -[GKAcceptedInviteManager performSync:](self, "performSync:", v15);
  id v13 = *((id *)v20 + 5);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (id)_fetchAndRemoveBulletinFromArray:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  objc_super v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray: passingTest:",  buf,  2u);
  }

  *(void *)buf = 0LL;
  v20 = buf;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10010E758;
  v23 = sub_10010E768;
  id v24 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10010E9AC;
  v15[3] = &unk_1002731B0;
  id v11 = v6;
  id v16 = v11;
  id v12 = v8;
  id v17 = v12;
  v18 = buf;
  -[GKAcceptedInviteManager performSync:](self, "performSync:", v15);
  id v13 = *((id *)v20 + 5);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (void)addMultiplayerInvite:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager addMultiplayerInvite:",  buf,  2u);
  }

  queuedCancelledMultiplayerInviteSessionTokens = self->_queuedCancelledMultiplayerInviteSessionTokens;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10010EC2C;
  v14[3] = &unk_1002731D8;
  id v9 = v5;
  id v15 = v9;
  uint64_t v10 = objc_claimAutoreleasedReturnValue( -[GKAcceptedInviteManager _fetchObjectFromArray:passingTest:]( self,  "_fetchObjectFromArray:passingTest:",  queuedCancelledMultiplayerInviteSessionTokens,  v14));
  id v11 = (void *)v10;
  if (v10)
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers(v10);
    }
    id v13 = (os_log_s *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager remove a queuedCancelledMultiplayerInviteSessionToken: %@",  buf,  0xCu);
    }

    -[GKAcceptedInviteManager removeAndReturnQueuedCancelledInviteWithSessionToken:]( self,  "removeAndReturnQueuedCancelledInviteWithSessionToken:",  v11);
  }

  -[GKAcceptedInviteManager _insertBulletin:atFrontOfArray:]( self,  "_insertBulletin:atFrontOfArray:",  v9,  self->_acceptedMultiplayerInvites);
}

- (void)declineMultiplayerInvite:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager declineMultiplayerInvite:",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 declineReason]);

  if (v8)
  {
    -[GKAcceptedInviteManager addMultiplayerInvite:](self, "addMultiplayerInvite:", v5);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers(v9);
    }
    id v11 = (os_log_s *)os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Cannot add a multiplayer invite as a declined invite if there is no declineReason set!",  v12,  2u);
    }
  }
}

- (void)queueCancelledMultiplayerInviteSessionToken:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager queueCancelledMultiplayerInvite:",  v8,  2u);
  }

  -[GKAcceptedInviteManager _insertBulletin:atFrontOfArray:]( self,  "_insertBulletin:atFrontOfArray:",  v5,  self->_queuedCancelledMultiplayerInviteSessionTokens);
}

- (void)addTurnBasedEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager addTurnBasedEvent:",  v8,  2u);
  }

  -[GKAcceptedInviteManager _addBulletin:toArray:](self, "_addBulletin:toArray:", v5, self->_acceptedTurnBased);
}

- (id)removeAndReturnInviteWithSessionToken:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager removeAndReturnInviteWithSessionToken:",  buf,  2u);
  }

  acceptedMultiplayerInvites = self->_acceptedMultiplayerInvites;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10010EFE4;
  v12[3] = &unk_100273200;
  id v13 = v5;
  id v9 = v5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray:passingTest:]( self,  "_fetchAndRemoveBulletinFromArray:passingTest:",  acceptedMultiplayerInvites,  v12));

  return v10;
}

- (BOOL)removeAndReturnQueuedCancelledInviteWithSessionToken:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager removeAndReturnQueuedCancelledInviteWithSessionToken:",  buf,  2u);
  }

  queuedCancelledMultiplayerInviteSessionTokens = self->_queuedCancelledMultiplayerInviteSessionTokens;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010F124;
  v13[3] = &unk_1002731D8;
  id v14 = v5;
  id v9 = v5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray:passingTest:]( self,  "_fetchAndRemoveBulletinFromArray:passingTest:",  queuedCancelledMultiplayerInviteSessionTokens,  v13));
  BOOL v11 = v10 != 0LL;

  return v11;
}

- (id)removeAndReturnTurnBasedInviteWithMatchID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager removeAndReturnTurnBasedInviteWithMatchID:",  buf,  2u);
  }

  acceptedTurnBased = self->_acceptedTurnBased;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10010F228;
  v12[3] = &unk_100273228;
  id v13 = v5;
  id v9 = v5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray:passingTest:]( self,  "_fetchAndRemoveBulletinFromArray:passingTest:",  acceptedTurnBased,  v12));

  return v10;
}

- (id)multiplayerInviteForGame:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager multiplayerInviteForGame:",  v11,  2u);
  }

  id v8 = -[GKGameDescriptor initWithDictionary:](objc_alloc(&OBJC_CLASS___GKGameDescriptor), "initWithDictionary:", v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[GKAcceptedInviteManager multiplayerInviteForGameDescriptor:]( self,  "multiplayerInviteForGameDescriptor:",  v8));

  return v9;
}

- (id)multiplayerInviteForGameDescriptor:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  BOOL v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager multiplayerInviteForGameDescriptor:",  buf,  2u);
  }

  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  id v10 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    acceptedMultiplayerInvites = self->_acceptedMultiplayerInvites;
    *(_DWORD *)buf = 138412290;
    v19 = acceptedMultiplayerInvites;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager - accepted invite bulletins %@",  buf,  0xCu);
  }

  id v12 = self->_acceptedMultiplayerInvites;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10010F4C0;
  v16[3] = &unk_100273200;
  id v17 = v5;
  id v13 = v5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray:passingTest:]( self,  "_fetchAndRemoveBulletinFromArray:passingTest:",  v12,  v16));

  return v14;
}

- (id)turnBasedInviteForGame:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager turnBasedInviteForGame:",  v11,  2u);
  }

  BOOL v8 = -[GKGameDescriptor initWithDictionary:](objc_alloc(&OBJC_CLASS___GKGameDescriptor), "initWithDictionary:", v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[GKAcceptedInviteManager turnBasedInviteForGameDescriptor:]( self,  "turnBasedInviteForGameDescriptor:",  v8));

  return v9;
}

- (id)turnBasedInviteForGameDescriptor:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAcceptedInviteManager turnBasedInviteForGameDescriptor:",  buf,  2u);
  }

  acceptedTurnBased = self->_acceptedTurnBased;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10010F690;
  v12[3] = &unk_100273250;
  id v13 = v5;
  id v9 = v5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray:passingTest:]( self,  "_fetchAndRemoveBulletinFromArray:passingTest:",  acceptedTurnBased,  v12));

  return v10;
}

- (id)description
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  BOOL v8 = sub_10010E758;
  id v9 = sub_10010E768;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10010F760;
  v4[3] = &unk_10026E058;
  v4[4] = self;
  v4[5] = &v5;
  -[GKAcceptedInviteManager performSync:](self, "performSync:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (NSMutableArray)acceptedMultiplayerInvites
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAcceptedMultiplayerInvites:(id)a3
{
}

- (NSMutableArray)queuedCancelledMultiplayerInviteSessionTokens
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setQueuedCancelledMultiplayerInviteSessionTokens:(id)a3
{
}

- (NSMutableArray)acceptedTurnBased
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAcceptedTurnBased:(id)a3
{
}

- (void).cxx_destruct
{
}

@end