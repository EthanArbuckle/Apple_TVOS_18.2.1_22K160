}

void sub_10000166C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100001684(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100001694(uint64_t a1)
{
}

void sub_10000169C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if ([v3 code] == (id)2) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) extensionIsCanceling];
    }
  }

  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) extensionIsFinishing];
  }
}

LABEL_4:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKAuthenticateExtensionViewController onboardingMetricsHandler](self, "onboardingMetricsHandler"));
  [v6 onboardingDidEnd];
}

void sub_1000019B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) mode] == (id)1)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100001A94;
    v7[3] = &unk_100004268;
    id v8 = *(id *)(a1 + 40);
    gk_dispatch_group_do(v3, v7);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100001B58;
  block[3] = &unk_100004290;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_group_notify(v3, &_dispatch_main_q, block);
}

void sub_100001A94(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer authenticatedLocalPlayers](&OBJC_CLASS___GKLocalPlayer, "authenticatedLocalPlayers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100001B4C;
  v8[3] = &unk_100004240;
  id v9 = v3;
  id v7 = v3;
  [v4 loadAccountRemoteUIForPlayer:v6 mode:1 completionHandler:v8];
}

uint64_t sub_100001B4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100001B58(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 setNeedsUpdateConstraints];

  if ([*(id *)(a1 + 32) mode] == (id)1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) accountController]);

    if (v3)
    {
      [*(id *)(a1 + 32) setNavigationBarHidden:0];
      id v4 = *(void **)(a1 + 40);
      v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationItem]);
      [v4 addCancelButtonToNavigationItem:v5];

      id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) accountController]);
      [v6 presentInParentNavigationController:*(void *)(a1 + 32) animated:0];
    }
  }

  else
  {
    [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:0];
  }

id sub_100001CB0(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "viewControllers", 0));
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        [v7 willMoveToParentViewController:0];
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
        [v8 removeFromSuperview];

        [v7 removeFromParentViewController];
        if ((objc_opt_respondsToSelector(v7, "setViewControllers:") & 1) != 0) {
          [v7 setViewControllers:&__NSArray0__struct];
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  return [*(id *)(a1 + 32) setContentViewController:0];
}

void sub_100002060(id a1, NSError *a2)
{
  v2 = a2;
  id v4 = v2;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v2, v3);
  }
  id v6 = (void *)os_log_GKHosted;
  if (os_log_type_enabled(os_log_GKHosted, OS_LOG_TYPE_DEBUG)) {
    sub_100002268(v6, v4);
  }
}

void sub_1000021F4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "error while decoding messageFromExtension arhive in GKAuthenticateExtensionViewController:%@",  (uint8_t *)&v2,  0xCu);
}

void sub_100002268(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "error calling host - %@",  (uint8_t *)&v5,  0xCu);
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}