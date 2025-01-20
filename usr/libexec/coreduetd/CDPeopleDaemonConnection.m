@interface CDPeopleDaemonConnection
- (BOOL)queryInteractionsOnlyAuthorization;
- (CDPeopleDaemon)daemon;
- (id)unauthorizedClientError;
- (void)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4 reply:(id)a5;
- (void)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4 reply:(id)a5;
- (void)adviseInteractionsUsingSettings:(id)a3 reply:(id)a4;
- (void)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5 reply:(id)a6;
- (void)autocompleteSearchResultsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)candidatesForShareSheetRanking:(id)a3;
- (void)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3 reply:(id)a4;
- (void)contactSuggestionsWithMaxSuggestions:(id)a3 excludedContactIds:(id)a4 reply:(id)a5;
- (void)countContactsUsingPredicate:(id)a3 reply:(id)a4;
- (void)countInteractionsUsingPredicate:(id)a3 reply:(id)a4;
- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6;
- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 reply:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 reply:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 reply:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 reply:(id)a4;
- (void)familyRecommendedSuggestionsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)mapsSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5;
- (void)photosContactInferencesSuggestionsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)photosRelationshipSuggestionsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)provideFeedbackForContactsAutocompleteSuggestions:(id)a3;
- (void)provideMessagesPinningFeedback:(id)a3;
- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6;
- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6;
- (void)rankCandidateContacts:(id)a3 usingSettings:(id)a4 reply:(id)a5;
- (void)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4 reply:(id)a5;
- (void)rankedFamilySuggestionsWithReply:(id)a3;
- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 excludeBackfillSuggestions:(BOOL)a6 reply:(id)a7;
- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 reply:(id)a6;
- (void)rankedHandlesFromCandidateHandles:(id)a3 reply:(id)a4;
- (void)rankedMessagesPinsWithMaxSuggestions:(id)a3 reply:(id)a4;
- (void)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4 reply:(id)a5;
- (void)rankedSiriMLCRHandlesFromContext:(id)a3 handles:(id)a4 reply:(id)a5;
- (void)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5 reply:(id)a6;
- (void)recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6;
- (void)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(id)a4 reply:(id)a5;
- (void)setDaemon:(id)a3;
- (void)setQueryInteractionsOnlyAuthorization:(BOOL)a3;
- (void)shareExtensionSuggestionsFromContext:(id)a3 reply:(id)a4;
- (void)suggestInteractionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5;
- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4 reply:(id)a5;
- (void)updateInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6;
- (void)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4 reply:(id)a5;
- (void)zkwSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5;
@end

@implementation CDPeopleDaemonConnection

- (id)unauthorizedClientError
{
  uint64_t v2 = _DKErrorDomain;
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  v7 = @"unauthorized client";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v2,  9LL,  v3));

  return v4;
}

- (void)recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v12 = a3;
  v10 = (void (**)(id, void))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v10[2](v10, 0LL);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v11 recordInteractions:v12 enforceDataLimits:v8 enforcePrivacy:v7 reply:v10];
  }
}

- (void)updateInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v12 = a3;
  v10 = (void (**)(id, void))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v10[2](v10, 0LL);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v11 updateInteractions:v12 enforceDataLimits:v8 enforcePrivacy:v7 reply:v10];
  }
}

- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
  [v13 queryInteractionsUsingPredicate:v12 sortDescriptors:v11 limit:a5 reply:v10];
}

- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v11[2](v11, 0LL, v12);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v12 queryContactsUsingPredicate:v13 sortDescriptors:v10 limit:a5 reply:v11];
  }
}

- (void)countInteractionsUsingPredicate:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0LL, v7);
  }

  else
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 countInteractionsUsingPredicate:v8 reply:v6];
  }
}

- (void)countContactsUsingPredicate:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0LL, v7);
  }

  else
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 countContactsUsingPredicate:v8 reply:v6];
  }
}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v11[2](v11, 0LL, v12);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v12 deleteInteractionsMatchingPredicate:v13 sortDescriptors:v10 limit:a5 reply:v11];
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void, void *))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0LL, v7);
  }

  else
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 deleteInteractionsWithBundleId:v8 reply:v6];
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v9[2](v9, 0LL, v10);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 deleteInteractionsWithBundleId:v11 account:v8 reply:v9];
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v9[2](v9, 0LL, v10);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 deleteInteractionsWithBundleId:v11 domainIdentifier:v8 reply:v9];
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v9[2](v9, 0LL, v10);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 deleteInteractionsWithBundleId:v11 domainIdentifiers:v8 reply:v9];
  }
}

- (void)rankCandidateContacts:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 rankCandidateContacts:v11 usingSettings:v8 reply:v9];
  }
}

- (void)adviseInteractionsUsingSettings:(id)a3 reply:(id)a4
{
  id v9 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void))a4;
  unsigned int v7 = -[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization");
  if (!v9 || v7)
  {
    v6[2](v6, 0LL);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v8 adviseInteractionsUsingSettings:v9 reply:v6];
  }
}

- (void)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 adviseInteractionsForDate:v11 usingSettings:v8 reply:v9];
  }
}

- (void)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5 reply:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization")) {
    v12[2](v12, 0LL);
  }
  else {
    -[CDPeopleDaemonConnection adviseSocialInteractionsForDate:andSeedContacts:usingSettings:reply:]( self,  "adviseSocialInteractionsForDate:andSeedContacts:usingSettings:reply:",  v13,  v10,  v11,  v12);
  }
}

- (void)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 adviseInteractionsForKeywordsInString:v11 usingSettings:v8 reply:v9];
  }
}

- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 tuneSocialAdvisorUsingSettings:v11 heartBeatHandler:v8 reply:v9];
  }
}

- (void)suggestInteractionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v11 = a4;
  id v8 = (void (**)(id, void *, id))a5;
  id v9 = a3;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    [v9 setSuggestionPath:@"suggestionPathQueryInteractionsOnlyAuthorization"];
    v8[2](v8, &__NSArray0__struct, v9);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 suggestInteractionsFromContext:v9 maxSuggestions:v11 reply:v8];

    id v8 = (void (**)(id, void *, id))v9;
    id v9 = v10;
  }
}

- (void)shareExtensionSuggestionsFromContext:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, &__NSArray0__struct);
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 shareExtensionSuggestionsFromContext:v8 reply:v6];
  }
}

- (void)candidatesForShareSheetRanking:(id)a3
{
  v4 = (void (**)(void))a3;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v5 = objc_opt_new(&OBJC_CLASS___NSSet);
    v4[2](v4);
  }

  else
  {
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    -[NSSet candidatesForShareSheetRanking:](v5, "candidatesForShareSheetRanking:", v4);
  }
}

- (void)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, v8);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 validateCoreMLScoringModelWithRawInput:v11 predictionContext:v8 reply:v9];
  }
}

- (void)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, &__NSDictionary0__struct);
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 computeShareSheetEphemeralFeaturesWithPredictionContext:v8 reply:v6];
  }
}

- (void)mapsSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 mapsSuggestionsFromContext:v11 maxSuggestions:v8 reply:v9];
  }
}

- (void)zkwSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 zkwSuggestionsFromContext:v11 maxSuggestions:v8 reply:v9];
  }
}

- (void)autocompleteSearchResultsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0LL);
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 autocompleteSearchResultsWithPredictionContext:v8 reply:v6];
  }
}

- (void)provideFeedbackForContactsAutocompleteSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
  [v5 provideFeedbackForContactsAutocompleteSuggestions:v4];
}

- (void)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 rankedNameSuggestionsFromContext:v11 name:v8 reply:v9];
  }
}

- (void)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 rankedAutocompleteSuggestionsFromContext:v11 candidates:v8 reply:v9];
  }
}

- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v11[2](v11, 0LL);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v12 rankedGlobalSuggestionsFromContext:v13 contactsOnly:v8 maxSuggestions:v10 reply:v11];
  }
}

- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 excludeBackfillSuggestions:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v15 = a3;
  id v12 = a5;
  id v13 = (void (**)(id, void))a7;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v13[2](v13, 0LL);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v14 rankedGlobalSuggestionsFromContext:v15 contactsOnly:v10 maxSuggestions:v12 excludeBackfillSuggestions:v8 reply:v13];
  }
}

- (void)rankedMessagesPinsWithMaxSuggestions:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0LL);
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 rankedMessagesPinsWithMaxSuggestions:v8 reply:v6];
  }
}

- (void)provideMessagesPinningFeedback:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
  [v5 provideMessagesPinningFeedback:v4];
}

- (void)rankedFamilySuggestionsWithReply:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v5[2](v5, 0LL);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v4 rankedFamilySuggestionsWithReply:v5];
  }
}

- (void)familyRecommendedSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0LL);
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 familyRecommendedSuggestionsWithPredictionContext:v8 reply:v6];
  }
}

- (void)photosRelationshipSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0LL);
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 photosRelationshipSuggestionsWithPredictionContext:v8 reply:v6];
  }
}

- (void)photosContactInferencesSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0LL);
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 photosContactInferencesSuggestionsWithPredictionContext:v8 reply:v6];
  }
}

- (void)rankedSiriMLCRHandlesFromContext:(id)a3 handles:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 rankedSiriMLCRHandlesFromContext:v11 handles:v8 reply:v9];
  }
}

- (void)rankedHandlesFromCandidateHandles:(id)a3 reply:(id)a4
{
  id v8 = a3;
  NSErrorUserInfoKey v6 = (void (**)(id, void))a4;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v6[2](v6, 0LL);
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v7 rankedHandlesFromCandidateHandles:v8 reply:v6];
  }
}

- (void)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 relativeAppUsageProbabilitiesForCandidateBundleIds:v11 daysAgo:v8 reply:v9];
  }
}

- (void)contactSuggestionsWithMaxSuggestions:(id)a3 excludedContactIds:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v10 contactSuggestionsWithMaxSuggestions:v11 excludedContactIds:v8 reply:v9];
  }
}

- (void)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5 reply:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  if (-[CDPeopleDaemonConnection queryInteractionsOnlyAuthorization](self, "queryInteractionsOnlyAuthorization"))
  {
    v12[2](v12, 0LL);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemonConnection daemon](self, "daemon"));
    [v13 rankedSiriNLContactSuggestionsFromContext:v14 maxSuggestions:v10 interactionId:v11 reply:v12];
  }
}

- (BOOL)queryInteractionsOnlyAuthorization
{
  return self->_queryInteractionsOnlyAuthorization;
}

- (void)setQueryInteractionsOnlyAuthorization:(BOOL)a3
{
  self->_queryInteractionsOnlyAuthorization = a3;
}

- (CDPeopleDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end