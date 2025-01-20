id sub_1000027E0(id a1, GKPlayerInternal *a2, unint64_t a3)
{
  return +[GKPlayer canonicalizedPlayerForInternal:](&OBJC_CLASS___GKPlayer, "canonicalizedPlayerForInternal:", a2);
}

void sub_10000290C(_Unwind_Exception *a1)
{
}

uint64_t sub_100002924(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100002934(uint64_t a1)
{
}

id sub_10000293C(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 contentViewController]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  [v6 removeFromSuperview];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setContentViewController:v4];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_CLASS___GKChallengeIssueExtensionViewController;
  return objc_msgSendSuper2(&v8, "constructContentViewController");
}

void sub_1000029DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = GKExtensionMessageCommandKey;
  v11 = &off_100004310;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7));

  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 _gkMapWithBlock:&stru_100004210]);
    [v8 setObject:v9 forKeyedSubscript:GKExtensionMessagePlayerList];
  }

  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:GKExtensionMessageChallengeMessage];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) sendMessageToClient:v8];
}

id sub_100002B1C(id a1, GKPlayer *a2, unint64_t a3)
{
  return -[GKPlayer internal](a2, "internal", a3);
}

void sub_100002C38(id a1, NSError *a2)
{
  v2 = a2;
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = (void *)os_log_GKHosted;
  if (os_log_type_enabled(os_log_GKHosted, OS_LOG_TYPE_DEBUG)) {
    sub_100002DC4(v4, v2);
  }
}

void sub_100002DC4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "error calling host - %@",  (uint8_t *)&v5,  0xCu);
}

id objc_msgSend_composeAndSendFlowForChallenge_selectPlayers_defaultMessage_forcePicker_readyHandler_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "composeAndSendFlowForChallenge:selectPlayers:defaultMessage:forcePicker:readyHandler:completionHandler:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}