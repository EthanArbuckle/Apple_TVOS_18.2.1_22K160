@interface GKPlayerInternalOnboarding
- (id)initWithPlayerID:(id)a3;
@end

@implementation GKPlayerInternalOnboarding

- (id)initWithPlayerID:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = &OBJC_CLASS___GKPlayerInternalOnboarding;
  v5 = -[GKPlayerInternalOnboarding init](&v14, "init");
  if (v5)
  {
    unint64_t v6 = +[GKAccountServicePrivate lastWelcomeWhatsNewCopyVersionDisplayedForPlayerID:]( &OBJC_CLASS___GKAccountServicePrivate,  "lastWelcomeWhatsNewCopyVersionDisplayedForPlayerID:",  v4);
    unint64_t v7 = +[GKAccountServicePrivate lastPrivacyNoticeVersionDisplayedForPlayerID:]( &OBJC_CLASS___GKAccountServicePrivate,  "lastPrivacyNoticeVersionDisplayedForPlayerID:",  v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKAccountServicePrivate lastPersonalizationVersionDisplayedForPlayerID:]( &OBJC_CLASS___GKAccountServicePrivate,  "lastPersonalizationVersionDisplayedForPlayerID:",  v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKAccountServicePrivate lastProfilePrivacyVersionDisplayedForPlayerID:]( &OBJC_CLASS___GKAccountServicePrivate,  "lastProfilePrivacyVersionDisplayedForPlayerID:",  v4));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKAccountServicePrivate lastFriendSuggestionsVersionDisplayedForPlayerID:]( &OBJC_CLASS___GKAccountServicePrivate,  "lastFriendSuggestionsVersionDisplayedForPlayerID:",  v4));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKAccountServicePrivate lastContactsIntegrationConsentVersionDisplayedForPlayerID:]( &OBJC_CLASS___GKAccountServicePrivate,  "lastContactsIntegrationConsentVersionDisplayedForPlayerID:",  v4));
    v12 = -[GKPlayerInternalOnboarding initWithLastWelcomeWhatsNewCopyVersionDisplayed:lastPrivacyNoticeVersionDisplayed:lastPersonalizationVersionDisplayed:lastProfilePrivacyVersionDisplayed:lastFriendSuggestionsVersionDisplayed:lastContactsIntegrationConsentVersionDisplayed:]( objc_alloc(&OBJC_CLASS___GKPlayerInternalOnboarding),  "initWithLastWelcomeWhatsNewCopyVersionDisplayed:lastPrivacyNoticeVersionDisplayed:lastPersonalizationVersion Displayed:lastProfilePrivacyVersionDisplayed:lastFriendSuggestionsVersionDisplayed:lastContactsIntegrationCo nsentVersionDisplayed:",  v6,  v7,  v8,  v9,  v10,  v11);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

@end