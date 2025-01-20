@interface _ADSiriInfoBroadcastLink
- (_ADSiriInfoBroadcastLink)init;
- (id)siriInfoToBeBroadcasted;
- (void)_broadcastSiriInfo:(BOOL)a3;
- (void)_configureRapportLinkAndReconnectNow:(BOOL)a3;
- (void)_handleFoundRemoteDevice:(id)a3;
- (void)_handleUpdatedLocalDevice:(id)a3;
- (void)rapportLink:(id)a3 didFindDevice:(id)a4;
- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)updateSiriInfoWithObject:(id)a3 forKey:(id)a4;
@end

@implementation _ADSiriInfoBroadcastLink

- (_ADSiriInfoBroadcastLink)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____ADSiriInfoBroadcastLink;
  v2 = -[_ADSiriInfoBroadcastLink init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("_ADSiriInfoBroadcastLink", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    siriInfoCache = v2->_siriInfoCache;
    v2->_siriInfoCache = v9;

    -[_ADSiriInfoBroadcastLink _configureRapportLinkAndReconnectNow:](v2, "_configureRapportLinkAndReconnectNow:", 1LL);
  }

  return v2;
}

- (void)_configureRapportLinkAndReconnectNow:(BOOL)a3
{
  BOOL v3 = a3;
  rapportLink = self->_rapportLink;
  if (rapportLink)
  {
    -[ADRapportLink removeListener:](rapportLink, "removeListener:", self);
    -[ADRapportLink invalidate](self->_rapportLink, "invalidate");
    v6 = self->_rapportLink;
    self->_rapportLink = 0LL;
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100084AC0;
  v13[3] = &unk_1004FD940;
  v13[4] = self;
  dispatch_queue_t v7 = objc_retainBlock(v13);
  v8 = v7;
  if (v3)
  {
    ((void (*)(void *))v7[2])(v7);
  }

  else
  {
    dispatch_time_t v9 = dispatch_time(0LL, 20000000000LL);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100084B94;
    block[3] = &unk_1004FD990;
    block[4] = self;
    id v12 = v8;
    dispatch_after(v9, queue, block);
  }
}

- (id)siriInfoToBeBroadcasted
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  dispatch_time_t v9 = sub_100084A70;
  v10 = sub_100084A80;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100084A88;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)updateSiriInfoWithObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100084840;
  block[3] = &unk_1004FD4C0;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    id v10 = "-[_ADSiriInfoBroadcastLink rapportLink:didUpdateLocalDevice:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  -[_ADSiriInfoBroadcastLink _handleUpdatedLocalDevice:](self, "_handleUpdatedLocalDevice:", v7);
}

- (void)rapportLink:(id)a3 didFindDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    id v10 = "-[_ADSiriInfoBroadcastLink rapportLink:didFindDevice:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  -[_ADSiriInfoBroadcastLink _handleFoundRemoteDevice:](self, "_handleFoundRemoteDevice:", v7);
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[_ADSiriInfoBroadcastLink rapportLinkDidInterrupt:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }

  -[_ADSiriInfoBroadcastLink _configureRapportLinkAndReconnectNow:](self, "_configureRapportLinkAndReconnectNow:", 1LL);
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[_ADSiriInfoBroadcastLink rapportLinkDidInvalidate:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }

  -[_ADSiriInfoBroadcastLink _configureRapportLinkAndReconnectNow:](self, "_configureRapportLinkAndReconnectNow:", 0LL);
}

- (void)_handleUpdatedLocalDevice:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_isLocalDeviceAvailble)
  {
    self->_isLocalDeviceAvailble = 1;
    dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      id v7 = "-[_ADSiriInfoBroadcastLink _handleUpdatedLocalDevice:]";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Local device %@ becomes available, broadcasting SiriInfo now...",  (uint8_t *)&v6,  0x16u);
    }

    -[_ADSiriInfoBroadcastLink _broadcastSiriInfo:](self, "_broadcastSiriInfo:", 1LL);
  }
}

- (void)_handleFoundRemoteDevice:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    id v7 = "-[_ADSiriInfoBroadcastLink _handleFoundRemoteDevice:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Remote device %@ found, broadcasting soon...",  (uint8_t *)&v6,  0x16u);
  }

  -[_ADSiriInfoBroadcastLink _broadcastSiriInfo:](self, "_broadcastSiriInfo:", 0LL);
}

- (void)_broadcastSiriInfo:(BOOL)a3
{
  BOOL v3 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100084750;
  v13[3] = &unk_1004FD940;
  v13[4] = self;
  dispatch_queue_attr_t v5 = objc_retainBlock(v13);
  int v6 = v5;
  unint64_t v7 = self->_generation + 1;
  self->_generation = v7;
  if (v3)
  {
    ((void (*)(void *))v5[2])(v5);
  }

  else
  {
    dispatch_time_t v8 = dispatch_time(0LL, 250000000LL);
    queue = (dispatch_queue_s *)self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10008481C;
    v10[3] = &unk_1004FB930;
    v10[4] = self;
    unint64_t v12 = v7;
    id v11 = v6;
    dispatch_after(v8, queue, v10);
  }
}

- (void).cxx_destruct
{
}

@end