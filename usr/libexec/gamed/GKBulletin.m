@interface GKBulletin
+ (BOOL)playerIsLocal:(id)a3;
+ (BOOL)shouldProcessNotification;
+ (BOOL)supportsSecureCoding;
+ (id)cacheTransactionGroup;
+ (id)syncQueue;
+ (void)bulletinsForPushNotification:(id)a3 withHandler:(id)a4;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
+ (void)performAsync:(id)a3;
- (BOOL)hasSound;
- (BOOL)showInListOnly;
- (GKBulletin)initWithCoder:(id)a3;
- (GKBulletin)initWithPushNotification:(id)a3;
- (GKBulletinAction)acceptAction;
- (GKBulletinAction)declineAction;
- (GKBulletinAction)defaultAction;
- (GKBulletinAction)dismissAction;
- (GKBulletinAction)viewAction;
- (GKGameDescriptor)gameDescriptor;
- (NSArray)attachments;
- (NSDate)date;
- (NSDate)expirationDate;
- (NSString)categoryIdentifier;
- (NSString)gameName;
- (NSString)message;
- (NSString)metricsBundleID;
- (NSString)recordID;
- (NSString)soundPath;
- (NSString)title;
- (NSURL)gameIcon;
- (id)dataFrom64String:(id)a3;
- (id)description;
- (id)updatedNotificationCategoriesOrNil:(id)a3;
- (signed)pushCommand;
- (unint64_t)bulletinType;
- (void)encodeWithCoder:(id)a3;
- (void)executeBulletinWithBulletinController:(id)a3;
- (void)handleAction:(id)a3;
- (void)launchBulletinWithCompletionHandler:(id)a3;
- (void)reportMetricsForActionID:(id)a3 withAdditionalFields:(id)a4;
- (void)reportMetricsForPresented;
- (void)reportMetricsWithEventType:(id)a3 additionalFields:(id)a4;
- (void)reportMetricsWithHostAppBundleId:(id)a3 fields:(id)a4;
- (void)setAcceptAction:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBulletinType:(unint64_t)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setDate:(id)a3;
- (void)setDeclineAction:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setDismissAction:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setGameDescriptor:(id)a3;
- (void)setGameIcon:(id)a3;
- (void)setGameName:(id)a3;
- (void)setHasSound:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setPushCommand:(signed __int16)a3;
- (void)setRecordID:(id)a3;
- (void)setShowInListOnly:(BOOL)a3;
- (void)setSoundPath:(id)a3;
- (void)setTitle:(id)a3;
- (void)setViewAction:(id)a3;
@end

@implementation GKBulletin

+ (id)syncQueue
{
  if (qword_1002BB750 != -1) {
    dispatch_once(&qword_1002BB750, &stru_100272FF0);
  }
  return (id)qword_1002BB748;
}

+ (void)bulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void (**)(void, void))v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKBulletin bulletinsForPushNotification: withHandler:",  buf,  2u);
  }

  if (qword_1002BB760 != -1) {
    dispatch_once(&qword_1002BB760, &stru_100273010);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:GKPushCommandKey]);
  id v11 = [(id)qword_1002BB758 objectForKeyedSubscript:v10];
  id v12 = [v11 shouldProcessNotification];
  if ((_DWORD)v12)
  {
    [v11 loadBulletinsForPushNotification:v5 withHandler:v7];
  }

  else
  {
    if (!v11)
    {
      if (!os_log_GKGeneral) {
        id v13 = (id)GKOSLoggers(v12);
      }
      v14 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "PUSH FAILED: Invalid payload", v15, 2u);
      }
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers(v8);
  }
  id v11 = (void *)os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_100106104(v11, (uint64_t)a1, a2);
  }
}

- (GKBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin initWithCoder:", buf, 2u);
  }

  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___GKBulletin;
  id v8 = -[GKBulletin init](&v63, "init");
  if (v8)
  {
    id v9 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"pushCommand"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8->_pushCommand = (unsigned __int16)[v10 integerValue];

    id v11 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"recordID"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    recordID = v8->_recordID;
    v8->_recordID = (NSString *)v12;

    id v14 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"title"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    title = v8->_title;
    v8->_title = (NSString *)v15;

    id v17 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"message"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    message = v8->_message;
    v8->_message = (NSString *)v18;

    id v20 = [v5 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"date"];
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    date = v8->_date;
    v8->_date = (NSDate *)v21;

    id v23 = [v5 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"expirationDate"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v24;

    id v26 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"hasSound"];
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v8->_hasSound = [v27 BOOLValue];

    id v28 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"soundPath"];
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    soundPath = v8->_soundPath;
    v8->_soundPath = (NSString *)v29;

    id v31 = [v5 decodeObjectOfClass:objc_opt_class(GKBulletinAction) forKey:@"acceptAction"];
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    acceptAction = v8->_acceptAction;
    v8->_acceptAction = (GKBulletinAction *)v32;

    id v34 = [v5 decodeObjectOfClass:objc_opt_class(GKBulletinAction) forKey:@"defaultAction"];
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    defaultAction = v8->_defaultAction;
    v8->_defaultAction = (GKBulletinAction *)v35;

    id v37 = [v5 decodeObjectOfClass:objc_opt_class(GKBulletinAction) forKey:@"dismissAction"];
    uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
    dismissAction = v8->_dismissAction;
    v8->_dismissAction = (GKBulletinAction *)v38;

    id v40 = [v5 decodeObjectOfClass:objc_opt_class(GKBulletinAction) forKey:@"declineAction"];
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
    declineAction = v8->_declineAction;
    v8->_declineAction = (GKBulletinAction *)v41;

    id v43 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"showInListOnly"];
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v8->_showInListOnly = [v44 BOOLValue];

    id v45 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"gameName"];
    uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
    gameName = v8->_gameName;
    v8->_gameName = (NSString *)v46;

    id v48 = [v5 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"gameIcon"];
    uint64_t v49 = objc_claimAutoreleasedReturnValue(v48);
    gameIcon = v8->_gameIcon;
    v8->_gameIcon = (NSURL *)v49;

    id v51 = [v5 decodeObjectOfClass:objc_opt_class(GKGameDescriptor) forKey:@"gameDescriptor"];
    uint64_t v52 = objc_claimAutoreleasedReturnValue(v51);
    gameDescriptor = v8->_gameDescriptor;
    v8->_gameDescriptor = (GKGameDescriptor *)v52;

    id v54 = [v5 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"categoryIdentifier"];
    uint64_t v55 = objc_claimAutoreleasedReturnValue(v54);
    categoryIdentifier = v8->_categoryIdentifier;
    v8->_categoryIdentifier = (NSString *)v55;

    uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSArray);
    v58 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v57,  objc_opt_class(&OBJC_CLASS___GKBulletinAttachment),  0LL);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    uint64_t v60 = objc_claimAutoreleasedReturnValue([v5 decodeObjectOfClasses:v59 forKey:@"attachments"]);
    attachments = v8->_attachments;
    v8->_attachments = (NSArray *)v60;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin encodeWithCoder:", v26, 2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[GKBulletin pushCommand](self, "pushCommand")));
  [v5 encodeObject:v8 forKey:@"pushCommand"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin recordID](self, "recordID"));
  [v5 encodeObject:v9 forKey:@"recordID"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin title](self, "title"));
  [v5 encodeObject:v10 forKey:@"title"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  [v5 encodeObject:v11 forKey:@"message"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin date](self, "date"));
  [v5 encodeObject:v12 forKey:@"date"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin expirationDate](self, "expirationDate"));
  [v5 encodeObject:v13 forKey:@"expirationDate"];

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[GKBulletin hasSound](self, "hasSound")));
  [v5 encodeObject:v14 forKey:@"hasSound"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin soundPath](self, "soundPath"));
  [v5 encodeObject:v15 forKey:@"soundPath"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin acceptAction](self, "acceptAction"));
  [v5 encodeObject:v16 forKey:@"acceptAction"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin defaultAction](self, "defaultAction"));
  [v5 encodeObject:v17 forKey:@"defaultAction"];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin dismissAction](self, "dismissAction"));
  [v5 encodeObject:v18 forKey:@"dismissAction"];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin declineAction](self, "declineAction"));
  [v5 encodeObject:v19 forKey:@"declineAction"];

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[GKBulletin showInListOnly](self, "showInListOnly")));
  [v5 encodeObject:v20 forKey:@"showInListOnly"];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameName](self, "gameName"));
  [v5 encodeObject:v21 forKey:@"gameName"];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameIcon](self, "gameIcon"));
  [v5 encodeObject:v22 forKey:@"gameIcon"];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  [v5 encodeObject:v23 forKey:@"gameDescriptor"];

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin categoryIdentifier](self, "categoryIdentifier"));
  [v5 encodeObject:v24 forKey:@"categoryIdentifier"];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin attachments](self, "attachments"));
  [v5 encodeObject:v25 forKey:@"attachments"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dataFrom64String:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin dataFrom64String:", v9, 2u);
  }

  if (v4) {
    id v7 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v4,  0LL);
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (GKBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin initWithPushNotification:", buf, 2u);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GKBulletin;
  id v8 = -[GKBulletin init](&v14, "init");
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    recordID = v8->_recordID;
    v8->_recordID = (NSString *)v10;

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:GKPushCommandKey]);
    v8->_pushCommand = (unsigned __int16)[v12 integerValue];

    v8->_bulletinType = 0LL;
  }

  return v8;
}

+ (BOOL)shouldProcessNotification
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers(a1);
  }
  id v3 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKBulletin shouldProcessNotification", v7, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned __int8 v5 = [v4 isGameCenterRestricted];

  return v5 ^ 1;
}

- (void)executeBulletinWithBulletinController:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKBulletin executeBulletinWithBulletinController:",  v8,  2u);
  }

  [v5 presentBulletin:self];
}

+ (void)performAsync:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin performAsync:", v9, 2u);
  }

  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 syncQueue]);
  dispatch_async(v8, v5);
}

- (void)handleAction:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  BOOL v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletin handleAction:", buf, 2u);
  }

  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  uint64_t v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "bulletin handle action: %@", buf, 0xCu);
  }

  if (([v5 isEqualToString:@"GKDefault"] & 1) != 0
    || [v5 isEqualToString:@"GKAccepted"])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001052F4;
    v11[3] = &unk_100273038;
    v11[4] = self;
    id v12 = v5;
    -[GKBulletin launchBulletinWithCompletionHandler:](self, "launchBulletinWithCompletionHandler:", v11);
  }

  else
  {
    -[GKBulletin reportMetricsForActionID:withAdditionalFields:]( self,  "reportMetricsForActionID:withAdditionalFields:",  v5,  0LL);
  }
}

- (void)launchBulletinWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void (**)(void, void))v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  BOOL v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKBulletin launchBulletinWithCompletionHandler:",  buf,  2u);
  }

  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  uint64_t v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Launching: %@", buf, 0xCu);
  }

  id v11 = self->_acceptAction;
  if (!v11) {
    id v11 = self->_defaultAction;
  }
  id v12 = -[GKBulletinAction type](v11, "type");
  if (v12 != (id)1)
  {
    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers(v12);
    }
    uint64_t v24 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR)) {
      sub_100106218((uint64_t)v11, v24, v25);
    }
    goto LABEL_26;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction appLaunchTrampolineURL](v11, "appLaunchTrampolineURL"));

  if (!v13)
  {
    if (!os_log_GKGeneral) {
      id v26 = (id)GKOSLoggers(v14);
    }
    v27 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1001061D8(v27);
    }
LABEL_26:
    v5[2](v5, 0LL);
    goto LABEL_27;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKUtilityServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v15,  0LL));
  id v17 = (void *)v16;
  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers(v16);
  }
  v19 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v20 = v19;
    uint64_t v21 = (GKBulletin *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction appLaunchTrampolineURL](v11, "appLaunchTrampolineURL"));
    *(_DWORD *)buf = 138412290;
    id v31 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Invoking AppLaunchTrampoline with URL: %@",  buf,  0xCu);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction appLaunchTrampolineURL](v11, "appLaunchTrampolineURL"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1001056D4;
  v28[3] = &unk_100273060;
  uint64_t v29 = v5;
  [v17 invokeASCAppLaunchTrampolineWithURL:v22 handler:v28];

LABEL_27:
}

- (NSString)metricsBundleID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](self, "gameDescriptor"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);

  return (NSString *)v3;
}

- (void)reportMetricsForPresented
{
}

- (void)reportMetricsForActionID:(id)a3 withAdditionalFields:(id)a4
{
  uint64_t v10 = @"actionType";
  id v11 = a3;
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _gkAddEntriesFrom:v6]);
  -[GKBulletin reportMetricsWithEventType:additionalFields:]( self,  "reportMetricsWithEventType:additionalFields:",  @"click",  v9);
}

- (void)reportMetricsWithEventType:(id)a3 additionalFields:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[GKBulletin metricsBundleID](self, "metricsBundleID"));
  id v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (const __CFString *)v8;
  }
  else {
    uint64_t v10 = &stru_10027B720;
  }
  v15[0] = v7;
  v14[0] = @"eventType";
  v14[1] = @"pageId";
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  -[GKBulletin pushCommand](self, "pushCommand")));
  v14[2] = @"pageType";
  v15[1] = v11;
  v15[2] = @"notification";
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 _gkAddEntriesFrom:v6]);
  -[GKBulletin reportMetricsWithHostAppBundleId:fields:](self, "reportMetricsWithHostAppBundleId:fields:", v10, v13);
}

- (void)reportMetricsWithHostAppBundleId:(id)a3 fields:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller"));
  [v7 reportClickStreamEventWithHostAppBundleId:v6 metricsFields:v5];
}

- (id)updatedNotificationCategoriesOrNil:(id)a3
{
  return 0LL;
}

+ (BOOL)playerIsLocal:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin playerIsLocal:", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allCredentialsForEnvironment:", objc_msgSend(v8, "currentEnvironment")));

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)i), "playerInternal", (void)v18));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 playerID]);
        unsigned __int8 v16 = [v15 isEqualToString:v4];

        if ((v16 & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_15;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

- (id)description
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___GKBulletin;
  id v3 = -[GKBulletin description](&v20, "description");
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v3);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin recordID](self, "recordID"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin title](self, "title"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin message](self, "message"));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin date](self, "date"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin expirationDate](self, "expirationDate"));
  id v5 = @"NO";
  if (-[GKBulletin hasSound](self, "hasSound")) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin soundPath](self, "soundPath"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin defaultAction](self, "defaultAction"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin acceptAction](self, "acceptAction"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin dismissAction](self, "dismissAction"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin declineAction](self, "declineAction"));
  if (-[GKBulletin showInListOnly](self, "showInListOnly")) {
    id v5 = @"YES";
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin categoryIdentifier](self, "categoryIdentifier"));
  id v14 = (id)objc_claimAutoreleasedReturnValue( [v19 stringByAppendingFormat:@"\nrecordID:%@\ntitle:%@\nmessage:%@\ndate:%@\nexpirationDate:%@\nhasSound:%@\nsoundPath:%@\ndefaultAction:%@\nacceptAction:%@\ndismissAction:%@\ndeclineAction:%@\nshowInListOnly:%@\ncategoryIdentifier:%@", v18, v17, v4, v16, v15, v6, v7, v8, v9, v10, v11, v5, v12]);

  return v14;
}

- (signed)pushCommand
{
  return self->_pushCommand;
}

- (void)setPushCommand:(signed __int16)a3
{
  self->_pushCommand = a3;
}

- (NSString)recordID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRecordID:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setMessage:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)hasSound
{
  return self->_hasSound;
}

- (void)setHasSound:(BOOL)a3
{
  self->_hasSound = a3;
}

- (NSString)soundPath
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSoundPath:(id)a3
{
}

- (GKBulletinAction)acceptAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setAcceptAction:(id)a3
{
}

- (GKBulletinAction)defaultAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setDefaultAction:(id)a3
{
}

- (GKBulletinAction)dismissAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDismissAction:(id)a3
{
}

- (GKBulletinAction)declineAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setDeclineAction:(id)a3
{
}

- (GKBulletinAction)viewAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setViewAction:(id)a3
{
}

- (BOOL)showInListOnly
{
  return self->_showInListOnly;
}

- (void)setShowInListOnly:(BOOL)a3
{
  self->_showInListOnly = a3;
}

- (NSString)gameName
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setGameName:(id)a3
{
}

- (NSURL)gameIcon
{
  return (NSURL *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setGameIcon:(id)a3
{
}

- (GKGameDescriptor)gameDescriptor
{
  return (GKGameDescriptor *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setGameDescriptor:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (unint64_t)bulletinType
{
  return self->_bulletinType;
}

- (void)setBulletinType:(unint64_t)a3
{
  self->_bulletinType = a3;
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setAttachments:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)cacheTransactionGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v4 = [v2 environment];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 currentGame]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v3 primaryCredentialForEnvironment:v4 conformsToMultiUserRestrictions:0 gameID:v6]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerInternal]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKSystemBulletin.m",  54LL,  "+[GKBulletin(CacheTransactionGroup) cacheTransactionGroup]"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 playerID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v2 transactionGroupWithName:v9 forPlayerID:v10]);

  return v11;
}

@end