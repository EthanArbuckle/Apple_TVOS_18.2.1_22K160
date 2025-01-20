@interface SiriTVAceShim
- (BOOL)canConvertAceView:(id)a3;
- (BOOL)shouldIgnoreAceView:(id)a3;
- (NSMapTable)aceConversionMap;
- (NSSet)deniedDialogIdentifiers;
- (SiriTVAceShim)init;
- (SiriTVAceShim)initWithAceConversionMap:(id)a3 deniedDialogIdentifiers:(id)a4;
- (id)convertAceView:(id)a3;
- (void)setAceConversionMap:(id)a3;
- (void)setDeniedDialogIdentifiers:(id)a3;
@end

@implementation SiriTVAceShim

- (SiriTVAceShim)init
{
  v3 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  0LL,  12LL);
  v54 = objc_alloc_init(&OBJC_CLASS____TtC6SiriTV16ClockSnippetShim);
  v4 = (objc_class *)objc_opt_class(&OBJC_CLASS___SAClockSnippet);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v54, v6);

  v7 = objc_alloc_init(&OBJC_CLASS____TtC6SiriTV18AthleteSnippetShim);
  v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___SASportsAthleteSnippet);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v7, v10);

  v53 = -[AthleteComparisonSnippetShim initWithAthleteSnippetShim:]( objc_alloc(&OBJC_CLASS____TtC6SiriTV28AthleteComparisonSnippetShim),  "initWithAthleteSnippetShim:",  v7);
  v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___SASportsAthleteComparisonSnippet);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v53, v13);

  v52 = objc_alloc_init(&OBJC_CLASS____TtC6SiriTV25MatchupDetailsSnippetShim);
  v14 = (objc_class *)objc_opt_class(&OBJC_CLASS___SASportsMatchupDetailsSnippet);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v52, v16);

  v51 = objc_alloc_init(&OBJC_CLASS____TtC6SiriTV19ScheduleSnippetShim);
  v17 = (objc_class *)objc_opt_class(&OBJC_CLASS___SASportsScheduleSnippet);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v51, v19);

  v50 = objc_alloc_init(&OBJC_CLASS____TtC6SiriTV20StandingsSnippetShim);
  v20 = (objc_class *)objc_opt_class(&OBJC_CLASS___SASportsStandingsSnippet);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v50, v22);

  v23 = -[TeamSnippetShim initWithAthleteSnippetShim:]( objc_alloc(&OBJC_CLASS____TtC6SiriTV15TeamSnippetShim),  "initWithAthleteSnippetShim:",  v7);
  v24 = (objc_class *)objc_opt_class(&OBJC_CLASS___SASportsTeamSnippet);
  v25 = NSStringFromClass(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v23, v26);

  v27 = objc_alloc_init(&OBJC_CLASS____TtC6SiriTV17StocksSnippetShim);
  v28 = (objc_class *)objc_opt_class(&OBJC_CLASS___SAStockSnippet);
  v29 = NSStringFromClass(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v27, v30);

  v31 = objc_alloc_init(&OBJC_CLASS____TtC6SiriTV20ConfirmationViewShim);
  v32 = (objc_class *)objc_opt_class(&OBJC_CLASS___SAUIConfirmationView);
  v33 = NSStringFromClass(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v31, v34);

  v35 = objc_alloc_init(&OBJC_CLASS____TtC6SiriTV18DialogPunchoutShim);
  v36 = (objc_class *)objc_opt_class(&OBJC_CLASS___SAUIDialogPunchout);
  v37 = NSStringFromClass(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v35, v38);

  v39 = objc_alloc_init(&OBJC_CLASS____TtC6SiriTV22DisambiguationListShim);
  v40 = (objc_class *)objc_opt_class(&OBJC_CLASS___SAUIDisambiguationList);
  v41 = NSStringFromClass(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v39, v42);

  v43 = objc_alloc_init(&OBJC_CLASS____TtC6SiriTV30VideoContentCabinetSnippetShim);
  v44 = (objc_class *)objc_opt_class(&OBJC_CLASS___SAVCSContentCabinet);
  v45 = NSStringFromClass(v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v43, v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"clock#showTimeInCurrentLocation",  @"clock#showTimeInOtherLocation",  @"media#getActors",  @"sportsSchedule#leagueScheduleComment",  @"stock#foundMultipleMarkets",  @"VIDEO#availabilitySearch",  @"VIDEO#genericSearch",  @"VIDEO#preciseReleaseSearch",  @"VIDEO#qualitySearch",  @"VIDEO#titleSearch",  @"VIDEO#topicSearch",  @"VIDEO#tvShowEpisodeSeasonSearch",  @"weather#currentWeatherCommentary",  @"weather#forecastCommentary",  @"ShowClock#IntentHandledResponseShowTime#en#dialog1",  0LL));
  v48 = -[SiriTVAceShim initWithAceConversionMap:deniedDialogIdentifiers:]( self,  "initWithAceConversionMap:deniedDialogIdentifiers:",  v3,  v47);

  return v48;
}

- (SiriTVAceShim)initWithAceConversionMap:(id)a3 deniedDialogIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SiriTVAceShim;
  v9 = -[SiriTVAceShim init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_aceConversionMap, a3);
    objc_storeStrong((id *)&v10->_deniedDialogIdentifiers, a4);
  }

  return v10;
}

- (BOOL)shouldIgnoreAceView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SAUIAssistantUtteranceView);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dialogIdentifier]);
    if (v6) {
      BOOL v7 = -[NSSet containsObject:](self->_deniedDialogIdentifiers, "containsObject:", v6);
    }
    else {
      BOOL v7 = 0;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)canConvertAceView:(id)a3
{
  id v4 = (objc_class *)objc_opt_class(a3);
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_aceConversionMap, "objectForKey:", v6));
  LOBYTE(self) = v7 != 0LL;

  return (char)self;
}

- (id)convertAceView:(id)a3
{
  id v4 = a3;
  aceConversionMap = self->_aceConversionMap;
  v6 = (objc_class *)objc_opt_class(v4);
  BOOL v7 = NSStringFromClass(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](aceConversionMap, "objectForKey:", v8));

  v10 = (void *)AFSiriLogContextConnection;
  if (v9)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v13 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 encodedClassName]);
      int v17 = 136315394;
      v18 = "-[SiriTVAceShim convertAceView:]";
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_debug_impl( &dword_0,  v13,  OS_LOG_TYPE_DEBUG,  "%s #aceshim shimming ACE object: %@",  (uint8_t *)&v17,  0x16u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 makeVisualResponseSnippetWithAceView:v4]);
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v15 = v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 encodedClassName]);
      int v17 = 136315394;
      v18 = "-[SiriTVAceShim convertAceView:]";
      __int16 v19 = 2112;
      v20 = v16;
      _os_log_error_impl( &dword_0,  v15,  OS_LOG_TYPE_ERROR,  "%s #aceshim shimming ACE object: %@ failed with no shim found",  (uint8_t *)&v17,  0x16u);
    }

    v11 = 0LL;
  }

  return v11;
}

- (NSMapTable)aceConversionMap
{
  return self->_aceConversionMap;
}

- (void)setAceConversionMap:(id)a3
{
}

- (NSSet)deniedDialogIdentifiers
{
  return self->_deniedDialogIdentifiers;
}

- (void)setDeniedDialogIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end