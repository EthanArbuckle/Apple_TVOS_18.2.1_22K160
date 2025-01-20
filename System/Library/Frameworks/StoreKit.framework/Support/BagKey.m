@interface BagKey
+ (NSString)addPushTypeURL;
+ (NSString)allowedCustomBuyParams;
+ (NSString)allowedCustomGatewaySheetOptions;
+ (NSString)appleIDLookupURL;
+ (NSString)buyProductURL;
+ (NSString)checkForMessagesURL;
+ (NSString)commerceUIURLPatterns;
+ (NSString)countryCode;
+ (NSString)createAppReceiptURL;
+ (NSString)createVPPReceiptURL;
+ (NSString)currencyCode;
+ (NSString)disableNewExternalGatewaySheet;
+ (NSString)disablePurchaseIntentNotifications;
+ (NSString)externalCustomLinkSheetURL;
+ (NSString)externalLinkAccountLearnMoreURL;
+ (NSString)externalLinkAccountSheetURL;
+ (NSString)externalLinkLearnMoreURL;
+ (NSString)externalLinkSheetURL;
+ (NSString)externalPurchaseLearnMoreURL;
+ (NSString)externalPurchaseSpringBoardAppDeleteAlertEnabled;
+ (NSString)externalPurchaseSupportedTokenTypes;
+ (NSString)externalPurchaseTokenCreate;
+ (NSString)externalPurchaseTokenStatus;
+ (NSString)externalPurchaseTokenV2;
+ (NSString)externalPurchaseTokenV2Refresh;
+ (NSString)externalPurchasesSheetURL;
+ (NSString)finishTransactionURL;
+ (NSString)hideableSystemApps;
+ (NSString)ignoreIAPQueueCheckSuppression;
+ (NSString)inAppBuyURL;
+ (NSString)languageTag;
+ (NSString)legacyClientMediaAPIRate;
+ (NSString)localizationInternalJetpackURL;
+ (NSString)localizationJetpackURL;
+ (NSString)manageSubscriptionsURL;
+ (NSString)mediaAPIHost;
+ (NSString)mediaAPISandboxHost;
+ (NSString)paymentAccountBindingEligibilityURL;
+ (NSString)paymentAccountBindingURL;
+ (NSString)pendingTransactionsCountURL;
+ (NSString)pendingTransactionsURL;
+ (NSString)productsBatchLimit;
+ (NSString)productsURL;
+ (NSString)pushEnvironment;
+ (NSString)receiptRefreshMinAge;
+ (NSString)redeemCodeURL;
+ (NSString)refundRequestURL;
+ (NSString)registerPushTokenURL;
+ (NSString)removePushTypeURL;
+ (NSString)restoreTransactionsURL;
+ (NSString)storefrontCountryCode;
+ (NSString)storefrontIdentifier;
+ (NSString)subscriptionStatusMaxAge;
+ (NSString)subscriptionStatusURL;
+ (NSString)timestamp;
+ (NSString)transactionReceiptsMaxAge;
+ (NSString)transactionReceiptsMaxCount;
+ (NSString)transactionReceiptsURL;
+ (NSString)transactionReceiptsURLv2;
+ (NSString)trustedDomains;
- (_TtC9storekitd6BagKey)init;
@end

@implementation BagKey

+ (NSString)allowedCustomBuyParams
{
  return (NSString *)sub_10011DD6C(&qword_100328B68, (id *)&qword_10033E1F0);
}

+ (NSString)allowedCustomGatewaySheetOptions
{
  return (NSString *)sub_10011DD6C(&qword_100328B70, (id *)&qword_10033E1F8);
}

+ (NSString)appleIDLookupURL
{
  return (NSString *)sub_10011DD6C(&qword_100328B78, (id *)&qword_10033E200);
}

+ (NSString)buyProductURL
{
  return (NSString *)sub_10011DD6C(&qword_100328B80, (id *)&qword_10033E208);
}

+ (NSString)checkForMessagesURL
{
  return (NSString *)sub_10011DD6C(&qword_100328B88, (id *)&qword_10033E210);
}

+ (NSString)commerceUIURLPatterns
{
  return (NSString *)sub_10011DD6C(&qword_100328B90, (id *)&qword_10033E218);
}

+ (NSString)countryCode
{
  return (NSString *)sub_10011DD6C(&qword_100328B98, (id *)&qword_10033E220);
}

+ (NSString)createAppReceiptURL
{
  return (NSString *)sub_10011DD6C(&qword_100328BA0, (id *)&qword_10033E228);
}

+ (NSString)createVPPReceiptURL
{
  return (NSString *)sub_10011DD6C(&qword_100328BA8, (id *)&qword_10033E230);
}

+ (NSString)currencyCode
{
  return (NSString *)sub_10011DD6C(&qword_100328BB0, (id *)&qword_10033E238);
}

+ (NSString)disablePurchaseIntentNotifications
{
  return (NSString *)sub_10011DD6C(&qword_100328BB8, (id *)&qword_10033E240);
}

+ (NSString)externalLinkSheetURL
{
  return (NSString *)sub_10011DD6C(&qword_100328BC0, (id *)&qword_10033E248);
}

+ (NSString)externalLinkAccountLearnMoreURL
{
  return (NSString *)sub_10011DD6C(&qword_100328BC8, (id *)&qword_10033E250);
}

+ (NSString)externalLinkAccountSheetURL
{
  return (NSString *)sub_10011DD6C(&qword_100328BD0, (id *)&qword_10033E258);
}

+ (NSString)externalLinkLearnMoreURL
{
  return (NSString *)sub_10011DD6C(&qword_100328BD8, (id *)&qword_10033E260);
}

+ (NSString)externalPurchaseLearnMoreURL
{
  return (NSString *)sub_10011DD6C(&qword_100328BE0, (id *)&qword_10033E268);
}

+ (NSString)externalPurchasesSheetURL
{
  return (NSString *)sub_10011DD6C(&qword_100328BE8, (id *)&qword_10033E270);
}

+ (NSString)externalCustomLinkSheetURL
{
  return (NSString *)sub_10011DD6C(&qword_100328BF0, (id *)&qword_10033E278);
}

+ (NSString)externalPurchaseSpringBoardAppDeleteAlertEnabled
{
  return (NSString *)sub_10011DD6C(&qword_100328BF8, (id *)&qword_10033E280);
}

+ (NSString)externalPurchaseTokenCreate
{
  return (NSString *)sub_10011DD6C(&qword_100328C00, (id *)&qword_10033E288);
}

+ (NSString)externalPurchaseTokenV2
{
  return (NSString *)sub_10011DD6C(&qword_100328C08, (id *)&qword_10033E290);
}

+ (NSString)externalPurchaseTokenV2Refresh
{
  return (NSString *)sub_10011DD6C(&qword_100328C10, (id *)&qword_10033E298);
}

+ (NSString)externalPurchaseTokenStatus
{
  return (NSString *)sub_10011DD6C(&qword_100328C18, (id *)&qword_10033E2A0);
}

+ (NSString)disableNewExternalGatewaySheet
{
  return (NSString *)sub_10011DD6C(&qword_100328C20, (id *)&qword_10033E2A8);
}

+ (NSString)externalPurchaseSupportedTokenTypes
{
  return (NSString *)sub_10011DD6C(&qword_100328C28, (id *)&qword_10033E2B0);
}

+ (NSString)finishTransactionURL
{
  return (NSString *)sub_10011DD6C(&qword_100328C30, (id *)&qword_10033E2B8);
}

+ (NSString)hideableSystemApps
{
  return (NSString *)sub_10011DD6C(&qword_100328C38, (id *)&qword_10033E2C0);
}

+ (NSString)ignoreIAPQueueCheckSuppression
{
  return (NSString *)sub_10011DD6C(&qword_100328C40, (id *)&qword_10033E2C8);
}

+ (NSString)inAppBuyURL
{
  return (NSString *)sub_10011DD6C(&qword_100328C48, (id *)&qword_10033E2D0);
}

+ (NSString)languageTag
{
  return (NSString *)sub_10011DD6C(&qword_100328C50, (id *)&qword_10033E2D8);
}

+ (NSString)legacyClientMediaAPIRate
{
  return (NSString *)sub_10011DD6C(&qword_100328C58, (id *)&qword_10033E2E0);
}

+ (NSString)localizationJetpackURL
{
  return (NSString *)sub_10011DD6C(&qword_100328C60, (id *)&qword_10033E2E8);
}

+ (NSString)localizationInternalJetpackURL
{
  return (NSString *)sub_10011DD6C(&qword_100328C68, (id *)&qword_10033E2F0);
}

+ (NSString)manageSubscriptionsURL
{
  return (NSString *)sub_10011DD6C(&qword_100328C70, (id *)&qword_10033E2F8);
}

+ (NSString)mediaAPIHost
{
  return (NSString *)sub_10011DD6C(&qword_100328C78, (id *)&qword_10033E300);
}

+ (NSString)mediaAPISandboxHost
{
  return (NSString *)sub_10011DD6C(&qword_100328C80, (id *)&qword_10033E308);
}

+ (NSString)paymentAccountBindingEligibilityURL
{
  return (NSString *)sub_10011DD6C(&qword_100328C88, (id *)&qword_10033E310);
}

+ (NSString)paymentAccountBindingURL
{
  return (NSString *)sub_10011DD6C(&qword_100328C90, (id *)&qword_10033E318);
}

+ (NSString)pendingTransactionsCountURL
{
  return (NSString *)sub_10011DD6C(&qword_100328C98, (id *)&qword_10033E320);
}

+ (NSString)pendingTransactionsURL
{
  return (NSString *)sub_10011DD6C(&qword_100328CA0, (id *)&qword_10033E328);
}

+ (NSString)productsBatchLimit
{
  return (NSString *)sub_10011DD6C(&qword_100328CA8, (id *)&qword_10033E330);
}

+ (NSString)productsURL
{
  return (NSString *)sub_10011DD6C(&qword_100328CB0, (id *)&qword_10033E338);
}

+ (NSString)receiptRefreshMinAge
{
  return (NSString *)sub_10011DD6C(&qword_100328CB8, (id *)&qword_10033E340);
}

+ (NSString)redeemCodeURL
{
  return (NSString *)sub_10011DD6C(&qword_100328CC0, (id *)&qword_10033E348);
}

+ (NSString)refundRequestURL
{
  return (NSString *)sub_10011DD6C(&qword_100328CC8, (id *)&qword_10033E350);
}

+ (NSString)restoreTransactionsURL
{
  return (NSString *)sub_10011DD6C(&qword_100328CD0, (id *)&qword_10033E358);
}

+ (NSString)storefrontCountryCode
{
  return (NSString *)sub_10011DD6C(&qword_100328CD8, (id *)&qword_10033E360);
}

+ (NSString)storefrontIdentifier
{
  return (NSString *)sub_10011DD6C(&qword_100328CE0, (id *)&qword_10033E368);
}

+ (NSString)subscriptionStatusMaxAge
{
  return (NSString *)sub_10011DD6C(&qword_100328CE8, (id *)&qword_10033E370);
}

+ (NSString)subscriptionStatusURL
{
  return (NSString *)sub_10011DD6C(&qword_100328CF0, (id *)&qword_10033E378);
}

+ (NSString)timestamp
{
  return (NSString *)sub_10011DD6C(&qword_100328CF8, (id *)&qword_10033E380);
}

+ (NSString)transactionReceiptsMaxAge
{
  return (NSString *)sub_10011DD6C(&qword_100328D00, (id *)&qword_10033E388);
}

+ (NSString)transactionReceiptsMaxCount
{
  return (NSString *)sub_10011DD6C(&qword_100328D08, (id *)&qword_10033E390);
}

+ (NSString)transactionReceiptsURL
{
  return (NSString *)sub_10011DD6C(&qword_100328D10, (id *)&qword_10033E398);
}

+ (NSString)transactionReceiptsURLv2
{
  return (NSString *)sub_10011DD6C(&qword_100328D18, (id *)&qword_10033E3A0);
}

+ (NSString)trustedDomains
{
  return (NSString *)sub_10011DD6C(&qword_100328D20, (id *)&qword_10033E3A8);
}

+ (NSString)addPushTypeURL
{
  return (NSString *)sub_10011DD6C(&qword_100328D28, (id *)&qword_10033E3B0);
}

+ (NSString)pushEnvironment
{
  return (NSString *)sub_10011DD6C(&qword_100328D30, (id *)&qword_10033E3B8);
}

+ (NSString)registerPushTokenURL
{
  return (NSString *)sub_10011DD6C(&qword_100328D38, (id *)&qword_10033E3C0);
}

+ (NSString)removePushTypeURL
{
  return (NSString *)sub_10011DD6C(&qword_100328D40, (id *)&qword_10033E3C8);
}

- (_TtC9storekitd6BagKey)init
{
  return (_TtC9storekitd6BagKey *)sub_10012CDDC();
}

@end