id SASiriTVUIColorFadedByPercent(void *a1, double a2)
{
  id v3;
  double v4;
  void *v5;
  v3 = a1;
  [v3 alphaComponent];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 colorWithAlphaComponent:v4 * a2]);

  return v5;
}

void sub_40CC(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 effectView]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 contentView]);
  [v4 addSubview:v3];
}

void sub_4128(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 effectView]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 contentView]);
  [v4 addSubview:v3];
}

void sub_4184(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 effectView]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 contentView]);
  [v4 addSubview:v3];
}
}

void sub_4A48(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

void sub_4B04(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

void sub_5340(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

UILabel *createLabel()
{
  v0 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v0, "setBackgroundColor:", v1);

  -[UILabel setAdjustsFontSizeToFitWidth:](v0, "setAdjustsFontSizeToFitWidth:", 1LL);
  return v0;
}

LABEL_16:
  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 yearRange]);
  if ([v14 length])
  {
    v15 = (char *)[v14 rangeOfString:@" - "];
    if (v15 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = v15;
      v18 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v14 substringToIndex:v15]);
      [v4 setObject:v19 forKey:StockYearLowKey];
      v20 = (void *)objc_claimAutoreleasedReturnValue([v14 substringFromIndex:&v17[v18]]);
      [v4 setObject:v20 forKey:StockYearHighKey];
    }
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 averageDailyVolume]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);

  if ([v22 length]) {
    [v4 setObject:v22 forKey:StockAverageVolumeKey];
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 dividendYield]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 stringValue]);

  if ([v24 length]) {
    [v4 setObject:v24 forKey:StockDividendYieldKey];
  }
  v44 = v22;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 link]);
  if ([v25 length]) {
    [v4 setObject:v25 forKey:StockInfoURLKey];
  }
  v47 = v7;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v3 high]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 stringValue]);

  if ([v27 length]) {
    [v4 setObject:v27 forKey:StockHighPriceKey];
  }
  v43 = v24;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v3 low]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 stringValue]);

  if ([v29 length]) {
    [v4 setObject:v29 forKey:StockLowPriceKey];
  }
  v45 = v14;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "open", v29));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 stringValue]);

  if ([v31 length]) {
    [v4 setObject:v31 forKey:StockOpenPriceKey];
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue([v3 peRatio]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 stringValue]);

  if ([v33 length]) {
    [v4 setObject:v33 forKey:StockPERatioKey];
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue([v3 price]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 stringValue]);

  if ([v35 length]) {
    [v4 setObject:v35 forKey:StockPriceKey];
  }
  v46 = v8;
  v36 = (void *)objc_claimAutoreleasedReturnValue([v3 change]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 stringValue]);

  if ([v37 length]) {
    [v4 setObject:v37 forKey:StockChangeKey];
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue([v3 volume]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 stringValue]);

  if ([v39 length]) {
    [v4 setObject:v39 forKey:StockVolumeKey];
  }
  v40 = -[Stock initWithDictionary:](self, "initWithDictionary:", v4);

  return v40;
}

void sub_AA18()
{
}

void sub_AA40(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Chart Update Failed. %@",  (uint8_t *)&v1,  0xCu);
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_yieldLabel(void *a1, const char *a2, ...)
{
  return [a1 yieldLabel];
}