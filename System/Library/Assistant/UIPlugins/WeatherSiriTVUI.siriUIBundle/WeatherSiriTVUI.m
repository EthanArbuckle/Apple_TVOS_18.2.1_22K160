}

void sub_1FF0(uint64_t a1)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_allSnippetViewControllers", 0));
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) siriWeatherObject]);
        [v7 setSiriWeatherObject:v8];

        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) weatherBackground]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) city]);
  [v9 setCity:v10];
}

uint64_t sub_2148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_2414(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSummaryLabel];
}

void sub_329C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 setNeedsLayout];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v3 layoutIfNeeded];
}

void sub_3474(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _childViewControllersForLayoutType:*(void *)(a1 + 40)]);
  [*(id *)(a1 + 32) _setTextStyle:*(void *)(a1 + 48) withChildViewControllers:v2];
}

void sub_355C(uint64_t a1)
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewsToFadeOut]);
  id v3 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) weatherBackground]);

        if (v7 != v8)
        {
          if (*(_BYTE *)(a1 + 40)) {
            double v9 = 0.0;
          }
          else {
            double v9 = 1.0;
          }
          [v7 setAlpha:v9];
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v4);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "viewsToFadeIn", 0));
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)j);
        v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) weatherBackground]);

        if (v15 != v16)
        {
          if (*(_BYTE *)(a1 + 40)) {
            double v17 = 1.0;
          }
          else {
            double v17 = 0.0;
          }
          [v15 setAlpha:v17];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v12);
  }
}

LABEL_14:
        -[WTVSnippetViewController _updateEffectivePreferredContentSize](self, "_updateEffectivePreferredContentSize");
        break;
    }
  }

_UNKNOWN **_WTVDebugSupportedMicaConditions()
{
  return &off_1E778;
}

void sub_73C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 condition]);
  [v4 setConditionCodeIndex:*(void *)(a1 + 32)];
  [v3 setCondition:v4];
}

void sub_7890( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_18:
              v15 = (char *)v15 + 1;
            }

            while (v13 != v15);
            __int128 v25 = [v11 countByEnumeratingWithState:&v39 objects:v48 count:16];
            uint64_t v13 = v25;
          }

          while (v25);
        }

LABEL_23:
        double v9 = v38 + 1;
      }

      while ((id)(v38 + 1) != v37);
      v37 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (!v37)
      {
LABEL_25:

        v8 = v29;
        -[WTVConstraintInterpolator setConstraints:](v29, "setConstraints:", v33);
        -[WTVConstraintInterpolator setStartConstants:](v29, "setStartConstants:", v32);
        -[WTVConstraintInterpolator setEndConstants:](v29, "setEndConstants:", v31);

        v6 = v30;
        break;
      }
    }
  }

  return v8;
}

void sub_AA64(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v14 = (id)objc_claimAutoreleasedReturnValue([v5 startConstants]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:a3]);
  [v7 doubleValue];
  double v9 = v8;
  double v10 = 1.0 - *(double *)(a1 + 40);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) endConstants]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:a3]);
  [v12 doubleValue];
  [v6 setConstant:v13 * *(double *)(a1 + 40) + v9 * v10];
}

double WTVConvertToUserTemperatureUnit(uint64_t a1, double a2)
{
  id v2 = [[WFTemperature alloc] initWithTemperatureUnit:a1 value:a2];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WFTemperatureUnitObserver sharedObserver](&OBJC_CLASS___WFTemperatureUnitObserver, "sharedObserver"));
  objc_msgSend(v2, "temperatureForUnit:", objc_msgSend(v3, "temperatureUnit"));
  double v5 = v4;

  return v5;
}

LABEL_8:
}

LABEL_10:
}

void sub_E5A4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  +[WTVUtilities configureLightLineView:forTextStyle:]( WTVUtilities,  "configureLightLineView:forTextStyle:",  v3,  [v2 textStyle]);
}

void sub_E8D0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_23EF0;
  qword_23EF0 = (uint64_t)v1;
}

LABEL_21:
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController siriWeatherObject](self, "siriWeatherObject"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 currentConditions]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 sunset]);

    if (v38)
    {
      v39 = objc_alloc_init(&OBJC_CLASS___WTVHourlyForecast);
      -[WTVHourlyForecast setType:](v39, "setType:", 2LL);
      -[WTVHourlyForecast setTimeIntValue:](v39, "setTimeIntValue:", TimeStringToIntValue(v38));
      v40 = TimeInRegionFormatFromFourDigitTime(v38, 1LL);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      -[WTVHourlyForecast setFormattedTimeString:](v39, "setFormattedTimeString:", v41);

      if ([v4 count])
      {
        v42 = 1LL;
        while (1)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v42 - 1]);
          v44 = (char *)(v42 - 1) >= (char *)[v4 count] - 1
              ? 0LL
              : (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v42]);
          v45 = -[WTVHourlyForecast timeIntValue](v39, "timeIntValue");
          if (v45 >= (int)[v43 timeIntValue])
          {
            if (!v44) {
              break;
            }
            v46 = [v44 timeIntValue];
            if (v46 > -[WTVHourlyForecast timeIntValue](v39, "timeIntValue")) {
              break;
            }
          }

          v35 = v42++ >= (unint64_t)[v4 count];
          if (v35) {
            goto LABEL_35;
          }
        }

        [v4 insertObject:v39 atIndex:v42];
      }

LABEL_35:
    }

    v47 = [v4 count];
    else {
      v48 = (uint64_t)v47;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, v48));
    -[WTVHourlyForecastViewController setDisplayedHourlyForecasts:](self, "setDisplayedHourlyForecasts:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[WTVHourlyForecastViewController collectionView](self, "collectionView"));
    [v50 reloadData];
  }

void sub_11A4C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11AB0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11B14(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "conditionString: %@", (uint8_t *)&v2, 0xCu);
  sub_78A0();
}

void sub_11B84(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Encountered exception attempting to encode layer tree (layer=%@): %@",  buf,  0x16u);
}

void sub_11BE8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11C50( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_windSpeed(void *a1, const char *a2, ...)
{
  return [a1 windSpeed];
}