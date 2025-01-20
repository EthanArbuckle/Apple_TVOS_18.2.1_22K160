void sub_2E84(id a1)
{
  id v1;
  void *v2;
  v1 = -[AXBannerUIServer _init](objc_alloc(&OBJC_CLASS___AXBannerUIServer), "_init");
  v2 = (void *)qword_88F8;
  qword_88F8 = (uint64_t)v1;
}

void sub_2FD8(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bannerPresenter]);
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"title"]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"message"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"duration"]);
  [v4 doubleValue];
  objc_msgSend(v5, "presentBannerViewWithText:secondaryText:duration:fromUserAction:", v2, v3, 0);
}

void sub_3084(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bannerPresenter]);
  [v1 dismissFloatingView];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}