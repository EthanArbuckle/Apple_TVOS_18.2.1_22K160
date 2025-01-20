@interface SUControllerPolicyParam
+ (BOOL)supportsSecureCoding;
- (BOOL)acceptedTerms;
- (BOOL)failedBackward;
- (BOOL)failedForward;
- (BOOL)isApplied;
- (BOOL)isPrepared;
- (BOOL)rampingForeground;
- (BOOL)successfulOTA;
- (BOOL)tetheredRestore;
- (NSData)ssoToken;
- (NSError)error;
- (NSSet)docAssetIDs;
- (NSSet)suAssetIDs;
- (NSString)applyInvokedBy;
- (NSString)brainAssetID;
- (NSString)scanUUID;
- (NSString)suAssetID;
- (SUControllerPolicyParam)init;
- (SUControllerPolicyParam)initWithActiveDescriptor:(id)a3;
- (SUControllerPolicyParam)initWithActiveDescriptor:(id)a3 ssoToken:(id)a4;
- (SUControllerPolicyParam)initWithActiveDescriptor:(id)a3 withApplyInvokedBy:(id)a4;
- (SUControllerPolicyParam)initWithActiveDescriptor:(id)a3 withPurgeCompletion:(id)a4;
- (SUControllerPolicyParam)initWithApplyInvokedBy:(id)a3;
- (SUControllerPolicyParam)initWithBrainAssetID:(id)a3 suAssetID:(id)a4 isPrepared:(BOOL)a5 isApplied:(BOOL)a6;
- (SUControllerPolicyParam)initWithCoder:(id)a3;
- (SUControllerPolicyParam)initWithDocAssetIDs:(id)a3 suAssetIDs:(id)a4;
- (SUControllerPolicyParam)initWithError:(id)a3;
- (SUControllerPolicyParam)initWithParamType:(int64_t)a3 withSuccessfulOTA:(BOOL)a4 withTetheredRestore:(BOOL)a5 withFailedForward:(BOOL)a6 withFailedBackward:(BOOL)a7 withBrainAssetID:(id)a8 withSUAssetID:(id)a9 isPrepared:(BOOL)a10 isApplied:(BOOL)a11 hasAcceptedTerms:(BOOL)a12 withDocAssetIDs:(id)a13 withSUAssetIDs:(id)a14 withScanPolicy:(id)a15 withScanUUID:(id)a16 withRampingForeground:(BOOL)a17 withPrimaryDescriptor:(id)a18 withSecondaryDescriptor:(id)a19 withVerifyDescriptor:(id)a20 withDifferentPrimary:(id)a21 withDifferentSecondary:(id)a22 withActiveDescriptor:(id)a23 withSSOToken:(id)a24 withScanOptions:(id)a25 withProgress:(id)a26 withApplyInvokedBy:(id)a27 reachingPolicyState:(int64_t)a28 withError:(id)a29 withPurgeCompletion:(id)a30;
- (SUControllerPolicyParam)initWithPolicyState:(int64_t)a3;
- (SUControllerPolicyParam)initWithPrimaryDescriptor:(id)a3 withSecondaryDescriptor:(id)a4;
- (SUControllerPolicyParam)initWithProgress:(id)a3 reachingPolicyState:(int64_t)a4;
- (SUControllerPolicyParam)initWithScanPolicy:(id)a3;
- (SUControllerPolicyParam)initWithScanPolicy:(id)a3 scanUUID:(id)a4 rampingForeground:(BOOL)a5 primaryDescriptor:(id)a6 secondaryDescriptor:(id)a7 hasAcceptedTerms:(BOOL)a8 withSSOToken:(id)a9;
- (SUControllerPolicyParam)initWithScanPolicy:(id)a3 scanUUID:(id)a4 rampingForeground:(BOOL)a5 primaryDescriptor:(id)a6 secondaryDescriptor:(id)a7 scanOptions:(id)a8;
- (SUControllerPolicyParam)initWithScanPolicy:(id)a3 verifyDescriptor:(id)a4 differentPrimary:(id)a5 differentSecondary:(id)a6;
- (SUControllerPolicyParam)initWithSuccessfulOTA:(BOOL)a3 tetheredRestore:(BOOL)a4 failedForward:(BOOL)a5 failedBackward:(BOOL)a6;
- (SUControllerScanOptions)scanOptions;
- (SUCoreDescriptor)activeDescriptor;
- (SUCoreDescriptor)differentPrimary;
- (SUCoreDescriptor)differentSecondary;
- (SUCoreDescriptor)primaryDescriptor;
- (SUCoreDescriptor)secondaryDescriptor;
- (SUCoreDescriptor)verifyDescriptor;
- (SUCorePolicy)scanPolicy;
- (SUCoreProgress)progress;
- (id)_descriptionActivePurgeCompletion;
- (id)_descriptionActiveSSOToken;
- (id)_descriptionApply;
- (id)_descriptionBlank;
- (id)_descriptionError;
- (id)_descriptionMAAssetSets;
- (id)_descriptionMSUCurrentUpdate;
- (id)_descriptionMSUPreviousBoot;
- (id)_descriptionProgress;
- (id)_descriptionReloadedDescriptors;
- (id)_descriptionScanPolicy;
- (id)_descriptionScanPolicyFound;
- (id)_descriptionScanPolicyVerifyDifferent;
- (id)_descriptionUnknown;
- (id)description;
- (id)purgeCompletion;
- (int64_t)msuHandle;
- (int64_t)paramType;
- (int64_t)reachedState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUControllerPolicyParam

- (SUControllerPolicyParam)init
{
  LOBYTE(v4) = 0;
  BYTE2(v3) = 0;
  LOWORD(v3) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v3,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithSuccessfulOTA:(BOOL)a3 tetheredRestore:(BOOL)a4 failedForward:(BOOL)a5 failedBackward:(BOOL)a6
{
  LOBYTE(v8) = 0;
  BYTE2(v7) = 0;
  LOWORD(v7) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  1LL,  a3,  a4,  a5,  a6,  0LL,  0LL,  v7,  0LL,  0LL,  0LL,  0LL,  v8,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithBrainAssetID:(id)a3 suAssetID:(id)a4 isPrepared:(BOOL)a5 isApplied:(BOOL)a6
{
  LOBYTE(v8) = 0;
  BYTE2(v7) = 0;
  BYTE1(v7) = a6;
  LOBYTE(v7) = a5;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  2LL,  0LL,  0LL,  0LL,  0LL,  a3,  a4,  v7,  0LL,  0LL,  0LL,  0LL,  v8,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithDocAssetIDs:(id)a3 suAssetIDs:(id)a4
{
  LOBYTE(v6) = 0;
  BYTE2(v5) = 0;
  LOWORD(v5) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  3LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  a3,  a4,  0LL,  0LL,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithPrimaryDescriptor:(id)a3 withSecondaryDescriptor:(id)a4
{
  LOBYTE(v6) = 0;
  BYTE2(v5) = 0;
  LOWORD(v5) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  4LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  v6,  a3,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithScanPolicy:(id)a3
{
  LOBYTE(v5) = 0;
  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  5LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  a3,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithScanPolicy:(id)a3 scanUUID:(id)a4 rampingForeground:(BOOL)a5 primaryDescriptor:(id)a6 secondaryDescriptor:(id)a7 scanOptions:(id)a8
{
  LOBYTE(v10) = a5;
  BYTE2(v9) = 0;
  LOWORD(v9) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  6LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v9,  0LL,  0LL,  a3,  a4,  v10,  a6,  a7,  0LL,  0LL,  0LL,  0LL,  0LL,  a8,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithScanPolicy:(id)a3 scanUUID:(id)a4 rampingForeground:(BOOL)a5 primaryDescriptor:(id)a6 secondaryDescriptor:(id)a7 hasAcceptedTerms:(BOOL)a8 withSSOToken:(id)a9
{
  LOBYTE(v11) = a5;
  BYTE2(v10) = a8;
  LOWORD(v10) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  6LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v10,  0LL,  0LL,  a3,  a4,  v11,  a6,  a7,  0LL,  0LL,  0LL,  0LL,  a9,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithScanPolicy:(id)a3 verifyDescriptor:(id)a4 differentPrimary:(id)a5 differentSecondary:(id)a6
{
  LOBYTE(v8) = 0;
  BYTE2(v7) = 0;
  LOWORD(v7) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  7LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v7,  0LL,  0LL,  a3,  0LL,  v8,  0LL,  0LL,  a4,  a5,  a6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithActiveDescriptor:(id)a3
{
  LOBYTE(v5) = 0;
  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  8LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithActiveDescriptor:(id)a3 ssoToken:(id)a4
{
  LOBYTE(v6) = 0;
  BYTE2(v5) = 0;
  LOWORD(v5) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  8LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithActiveDescriptor:(id)a3 withPurgeCompletion:(id)a4
{
  LOBYTE(v6) = 0;
  BYTE2(v5) = 0;
  LOWORD(v5) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  9LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4);
}

- (SUControllerPolicyParam)initWithActiveDescriptor:(id)a3 withApplyInvokedBy:(id)a4
{
  LOBYTE(v6) = 0;
  BYTE2(v5) = 0;
  LOWORD(v5) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  11LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  a4,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithProgress:(id)a3 reachingPolicyState:(int64_t)a4
{
  LOBYTE(v6) = 0;
  BYTE2(v5) = 0;
  LOWORD(v5) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  10LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  a4,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithApplyInvokedBy:(id)a3
{
  LOBYTE(v5) = 0;
  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  11LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithPolicyState:(int64_t)a3
{
  LOBYTE(v5) = 0;
  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  10LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL);
}

- (SUControllerPolicyParam)initWithError:(id)a3
{
  LOBYTE(v5) = 0;
  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  return -[SUControllerPolicyParam initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID:withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrimary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy:reachingPolicyState:withError:withPurgeCompletion:]( self,  "initWithParamType:withSuccessfulOTA:withTetheredRestore:withFailedForward:withFailedBackward:withBrainAssetID :withSUAssetID:isPrepared:isApplied:hasAcceptedTerms:withDocAssetIDs:withSUAssetIDs:withScanPolicy:withScanUU ID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withVerifyDescriptor:withDifferentPrim ary:withDifferentSecondary:withActiveDescriptor:withSSOToken:withScanOptions:withProgress:withApplyInvokedBy: reachingPolicyState:withError:withPurgeCompletion:",  12LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL);
}

- (SUControllerPolicyParam)initWithParamType:(int64_t)a3 withSuccessfulOTA:(BOOL)a4 withTetheredRestore:(BOOL)a5 withFailedForward:(BOOL)a6 withFailedBackward:(BOOL)a7 withBrainAssetID:(id)a8 withSUAssetID:(id)a9 isPrepared:(BOOL)a10 isApplied:(BOOL)a11 hasAcceptedTerms:(BOOL)a12 withDocAssetIDs:(id)a13 withSUAssetIDs:(id)a14 withScanPolicy:(id)a15 withScanUUID:(id)a16 withRampingForeground:(BOOL)a17 withPrimaryDescriptor:(id)a18 withSecondaryDescriptor:(id)a19 withVerifyDescriptor:(id)a20 withDifferentPrimary:(id)a21 withDifferentSecondary:(id)a22 withActiveDescriptor:(id)a23 withSSOToken:(id)a24 withScanOptions:(id)a25 withProgress:(id)a26 withApplyInvokedBy:(id)a27 reachingPolicyState:(int64_t)a28 withError:(id)a29 withPurgeCompletion:(id)a30
{
  id v58 = a8;
  id v57 = a9;
  id v56 = a13;
  id v54 = a14;
  id v52 = a15;
  id v51 = a16;
  id v49 = a18;
  id v59 = a19;
  id v55 = a20;
  id v53 = a21;
  id v50 = a22;
  id v30 = a23;
  id v31 = a24;
  id v32 = a25;
  id v33 = a26;
  id v34 = a27;
  id v35 = a29;
  id v36 = a30;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___SUControllerPolicyParam;
  v37 = -[SUControllerPolicyParam init](&v60, "init");
  v38 = v37;
  if (v37)
  {
    v37->_paramType = a3;
    v37->_successfulOTA = a4;
    v37->_tetheredRestore = a5;
    v37->_failedForward = a6;
    v37->_failedBackward = a7;
    objc_storeStrong((id *)&v37->_brainAssetID, a8);
    objc_storeStrong((id *)&v38->_suAssetID, a9);
    v38->_isPrepared = a10;
    v38->_isApplied = a11;
    v38->_acceptedTerms = a12;
    objc_storeStrong((id *)&v38->_docAssetIDs, a13);
    objc_storeStrong((id *)&v38->_suAssetIDs, a14);
    objc_storeStrong((id *)&v38->_scanPolicy, a15);
    objc_storeStrong((id *)&v38->_scanUUID, a16);
    v38->_rampingForeground = a17;
    objc_storeStrong((id *)&v38->_primaryDescriptor, a18);
    objc_storeStrong((id *)&v38->_secondaryDescriptor, a19);
    objc_storeStrong((id *)&v38->_verifyDescriptor, a20);
    objc_storeStrong((id *)&v38->_differentPrimary, a21);
    objc_storeStrong((id *)&v38->_differentSecondary, a22);
    objc_storeStrong((id *)&v38->_activeDescriptor, a23);
    objc_storeStrong((id *)&v38->_ssoToken, a24);
    objc_storeStrong((id *)&v38->_scanOptions, a25);
    objc_storeStrong((id *)&v38->_progress, a26);
    objc_storeStrong((id *)&v38->_applyInvokedBy, a27);
    v38->_reachedState = a28;
    objc_storeStrong((id *)&v38->_error, a29);
    id v39 = objc_retainBlock(v36);
    id purgeCompletion = v38->_purgeCompletion;
    v38->_id purgeCompletion = v39;
  }

  return v38;
}

- (SUControllerPolicyParam)initWithCoder:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___SUControllerPolicyParam;
  uint64_t v5 = -[SUControllerPolicyParam init](&v61, "init");
  if (v5)
  {
    v5->_paramType = (int64_t)[v4 decodeInt64ForKey:@"paramType"];
    v5->_successfulOTA = [v4 decodeBoolForKey:@"successfulOTA"];
    v5->_tetheredRestore = [v4 decodeBoolForKey:@"tetheredRestore"];
    v5->_failedForward = [v4 decodeBoolForKey:@"failedForward"];
    v5->_failedBackward = [v4 decodeBoolForKey:@"failedBackward"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"brainAssetID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    brainAssetID = v5->_brainAssetID;
    v5->_brainAssetID = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"suAssetID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    suAssetID = v5->_suAssetID;
    v5->_suAssetID = (NSString *)v10;

    v5->_isPrepared = [v4 decodeBoolForKey:@"isPrepared"];
    v5->_isApplied = [v4 decodeBoolForKey:@"isApplied"];
    v5->_acceptedTerms = [v4 decodeBoolForKey:@"acceptedTerms"];
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSSet);
    v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"docAssetIDs"]);
    docAssetIDs = v5->_docAssetIDs;
    v5->_docAssetIDs = (NSSet *)v15;

    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSSet);
    v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v17,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v19 forKey:@"suAssetIDs"]);
    suAssetIDs = v5->_suAssetIDs;
    v5->_suAssetIDs = (NSSet *)v20;

    id v22 = [v4 decodeObjectOfClass:objc_opt_class(SUCorePolicy) forKey:@"scanPolicy"];
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
    scanPolicy = v5->_scanPolicy;
    v5->_scanPolicy = (SUCorePolicy *)v23;

    id v25 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"scanUUID"];
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
    scanUUID = v5->_scanUUID;
    v5->_scanUUID = (NSString *)v26;

    v5->_rampingForeground = [v4 decodeBoolForKey:@"rampingForeground"];
    id v28 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"primaryDescriptor"];
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    primaryDescriptor = v5->_primaryDescriptor;
    v5->_primaryDescriptor = (SUCoreDescriptor *)v29;

    id v31 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"secondaryDescriptor"];
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    secondaryDescriptor = v5->_secondaryDescriptor;
    v5->_secondaryDescriptor = (SUCoreDescriptor *)v32;

    id v34 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"verifyDescriptor"];
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    verifyDescriptor = v5->_verifyDescriptor;
    v5->_verifyDescriptor = (SUCoreDescriptor *)v35;

    id v37 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"differentPrimary"];
    uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
    differentPrimary = v5->_differentPrimary;
    v5->_differentPrimary = (SUCoreDescriptor *)v38;

    id v40 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"differentSecondary"];
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
    differentSecondary = v5->_differentSecondary;
    v5->_differentSecondary = (SUCoreDescriptor *)v41;

    id v43 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"activeDescriptor"];
    uint64_t v44 = objc_claimAutoreleasedReturnValue(v43);
    activeDescriptor = v5->_activeDescriptor;
    v5->_activeDescriptor = (SUCoreDescriptor *)v44;

    id v46 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"ssoToken"];
    uint64_t v47 = objc_claimAutoreleasedReturnValue(v46);
    ssoToken = v5->_ssoToken;
    v5->_ssoToken = (NSData *)v47;

    id v49 = [v4 decodeObjectOfClass:objc_opt_class(SUControllerScanOptions) forKey:@"scanOptions"];
    uint64_t v50 = objc_claimAutoreleasedReturnValue(v49);
    scanOptions = v5->_scanOptions;
    v5->_scanOptions = (SUControllerScanOptions *)v50;

    id v52 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreProgress) forKey:@"progress"];
    uint64_t v53 = objc_claimAutoreleasedReturnValue(v52);
    progress = v5->_progress;
    v5->_progress = (SUCoreProgress *)v53;

    id v55 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"applyInvokedBy"];
    uint64_t v56 = objc_claimAutoreleasedReturnValue(v55);
    applyInvokedBy = v5->_applyInvokedBy;
    v5->_applyInvokedBy = (NSString *)v56;

    v5->_reachedState = (int64_t)[v4 decodeInt64ForKey:@"reachedState"];
    error = v5->_error;
    v5->_error = 0LL;

    id purgeCompletion = v5->_purgeCompletion;
    v5->_id purgeCompletion = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  objc_msgSend(v20, "encodeInt64:forKey:", -[SUControllerPolicyParam paramType](self, "paramType"), @"paramType");
  objc_msgSend( v20,  "encodeBool:forKey:",  -[SUControllerPolicyParam successfulOTA](self, "successfulOTA"),  @"successfulOTA");
  objc_msgSend( v20,  "encodeBool:forKey:",  -[SUControllerPolicyParam tetheredRestore](self, "tetheredRestore"),  @"tetheredRestore");
  objc_msgSend( v20,  "encodeBool:forKey:",  -[SUControllerPolicyParam failedForward](self, "failedForward"),  @"failedForward");
  objc_msgSend( v20,  "encodeBool:forKey:",  -[SUControllerPolicyParam failedBackward](self, "failedBackward"),  @"failedBackward");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam brainAssetID](self, "brainAssetID"));
  [v20 encodeObject:v4 forKey:@"brainAssetID"];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam suAssetID](self, "suAssetID"));
  [v20 encodeObject:v5 forKey:@"suAssetID"];

  objc_msgSend( v20,  "encodeBool:forKey:",  -[SUControllerPolicyParam isPrepared](self, "isPrepared"),  @"isPrepared");
  objc_msgSend(v20, "encodeBool:forKey:", -[SUControllerPolicyParam isApplied](self, "isApplied"), @"isApplied");
  objc_msgSend( v20,  "encodeBool:forKey:",  -[SUControllerPolicyParam acceptedTerms](self, "acceptedTerms"),  @"acceptedTerms");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam docAssetIDs](self, "docAssetIDs"));
  [v20 encodeObject:v6 forKey:@"docAssetIDs"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam suAssetIDs](self, "suAssetIDs"));
  [v20 encodeObject:v7 forKey:@"suAssetIDs"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam scanPolicy](self, "scanPolicy"));
  [v20 encodeObject:v8 forKey:@"scanPolicy"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam scanUUID](self, "scanUUID"));
  [v20 encodeObject:v9 forKey:@"scanUUID"];

  objc_msgSend( v20,  "encodeBool:forKey:",  -[SUControllerPolicyParam rampingForeground](self, "rampingForeground"),  @"rampingForeground");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam primaryDescriptor](self, "primaryDescriptor"));
  [v20 encodeObject:v10 forKey:@"primaryDescriptor"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam secondaryDescriptor](self, "secondaryDescriptor"));
  [v20 encodeObject:v11 forKey:@"secondaryDescriptor"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam verifyDescriptor](self, "verifyDescriptor"));
  [v20 encodeObject:v12 forKey:@"verifyDescriptor"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam differentPrimary](self, "differentPrimary"));
  [v20 encodeObject:v13 forKey:@"differentPrimary"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam differentSecondary](self, "differentSecondary"));
  [v20 encodeObject:v14 forKey:@"differentSecondary"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam activeDescriptor](self, "activeDescriptor"));
  [v20 encodeObject:v15 forKey:@"activeDescriptor"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam ssoToken](self, "ssoToken"));
  [v20 encodeObject:v16 forKey:@"ssoToken"];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam scanOptions](self, "scanOptions"));
  [v20 encodeObject:v17 forKey:@"scanOptions"];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam progress](self, "progress"));
  [v20 encodeObject:v18 forKey:@"progress"];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam applyInvokedBy](self, "applyInvokedBy"));
  [v20 encodeObject:v19 forKey:@"applyInvokedBy"];

  objc_msgSend( v20,  "encodeInt64:forKey:",  -[SUControllerPolicyParam reachedState](self, "reachedState"),  @"reachedState");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  switch(-[SUControllerPolicyParam paramType](self, "paramType"))
  {
    case 0LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionBlank](self, "_descriptionBlank"));
      break;
    case 1LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionMSUPreviousBoot](self, "_descriptionMSUPreviousBoot"));
      break;
    case 2LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionMSUCurrentUpdate](self, "_descriptionMSUCurrentUpdate"));
      break;
    case 3LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionMAAssetSets](self, "_descriptionMAAssetSets"));
      break;
    case 4LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionReloadedDescriptors](self, "_descriptionReloadedDescriptors"));
      break;
    case 5LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionScanPolicy](self, "_descriptionScanPolicy"));
      break;
    case 6LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionScanPolicyFound](self, "_descriptionScanPolicyFound"));
      break;
    case 7LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyParam _descriptionScanPolicyVerifyDifferent]( self,  "_descriptionScanPolicyVerifyDifferent"));
      break;
    case 8LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionActiveSSOToken](self, "_descriptionActiveSSOToken"));
      break;
    case 9LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerPolicyParam _descriptionActivePurgeCompletion]( self,  "_descriptionActivePurgeCompletion"));
      break;
    case 0xALL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionProgress](self, "_descriptionProgress"));
      break;
    case 0xBLL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionApply](self, "_descriptionApply"));
      break;
    case 0xCLL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionError](self, "_descriptionError"));
      break;
    default:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam _descriptionUnknown](self, "_descriptionUnknown"));
      break;
  }

  return v3;
}

- (id)_descriptionBlank
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n    paramType: Blank\n<<<]");
}

- (id)_descriptionMSUPreviousBoot
{
  if (-[SUControllerPolicyParam successfulOTA](self, "successfulOTA")) {
    uint64_t v3 = @"YES";
  }
  else {
    uint64_t v3 = @"NO";
  }
  if (-[SUControllerPolicyParam tetheredRestore](self, "tetheredRestore")) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if (-[SUControllerPolicyParam failedForward](self, "failedForward")) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  if (-[SUControllerPolicyParam failedBackward](self, "failedBackward")) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n          paramType: MSUPreviousBoot\n      successfulOTA: %@\n    tetheredRestore: %@\n      failedForward: %@\n     failedBackward: %@\n<<<]",  v3,  v4,  v5,  v6);
}

- (id)_descriptionMSUCurrentUpdate
{
  int64_t v3 = -[SUControllerPolicyParam msuHandle](self, "msuHandle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam brainAssetID](self, "brainAssetID"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam suAssetID](self, "suAssetID"));
  if (-[SUControllerPolicyParam isPrepared](self, "isPrepared")) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  if (-[SUControllerPolicyParam isApplied](self, "isApplied")) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n       paramType: MSUCurrentUpdate\n       msuHandle: %ld\n    brainAssetID: %@\n       suAssetID: %@\n      isPrepared: %@\n       isApplied: %@\n<<<]",  v3,  v4,  v5,  v6,  v7));

  return v8;
}

- (id)_descriptionMAAssetSets
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam docAssetIDs](self, "docAssetIDs"));
  id v4 = [v3 count];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam suAssetIDs](self, "suAssetIDs"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"\n[>>>\n      paramType: MAAssetSets\n      docAssets: %ld\n       suAssets: %ld\n<<<]",  v4,  [v5 count]));

  return v6;
}

- (id)_descriptionReloadedDescriptors
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam primaryDescriptor](self, "primaryDescriptor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam secondaryDescriptor](self, "secondaryDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n              paramType: ReloadedDescriptors\n      primaryDescriptor: %@\n    secondaryDescriptor: %@\n<<<]",  v4,  v6));

  return v7;
}

- (id)_descriptionScanPolicy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam scanPolicy](self, "scanPolicy"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerCore scanPolicySummary:](&OBJC_CLASS___SUControllerCore, "scanPolicySummary:", v2));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n      paramType: ScanPolicy\n     scanPolicy: %@\n<<<]",  v3));

  return v4;
}

- (id)_descriptionScanPolicyFound
{
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam scanPolicy](self, "scanPolicy"));
  uint64_t v24 = objc_claimAutoreleasedReturnValue(+[SUControllerCore scanPolicySummary:](&OBJC_CLASS___SUControllerCore, "scanPolicySummary:"));
  uint64_t v23 = objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam scanUUID](self, "scanUUID"));
  if (-[SUControllerPolicyParam rampingForeground](self, "rampingForeground")) {
    int64_t v3 = @"YES";
  }
  else {
    int64_t v3 = @"NO";
  }
  v21 = v3;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam primaryDescriptor](self, "primaryDescriptor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v22 summary]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam secondaryDescriptor](self, "secondaryDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
  if (-[SUControllerPolicyParam acceptedTerms](self, "acceptedTerms")) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam ssoToken](self, "ssoToken"));
  if (v8) {
    id v9 = @"present";
  }
  else {
    id v9 = @"none";
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam scanOptions](self, "scanOptions"));
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam scanOptions](self, "scanOptions"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
    v19 = v9;
    uint64_t v17 = v7;
    v14 = (void *)v23;
    v13 = (void *)v24;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n              paramType: ScanPolicyFound\n             scanPolicy: %@\n               scanUUID: %@\n      rampingForeground: %@\n      primaryDescriptor: %@\n    secondaryDescriptor: %@\n          acceptedTerms: %@\n               ssoToken: %@\n            scanOptions: %@\n<<<]",  v24,  v23,  v21,  v4,  v6,  v17,  v19,  v12));
  }

  else
  {
    id v20 = v9;
    v18 = v7;
    v14 = (void *)v23;
    v13 = (void *)v24;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n              paramType: ScanPolicyFound\n             scanPolicy: %@\n               scanUUID: %@\n      rampingForeground: %@\n      primaryDescriptor: %@\n    secondaryDescriptor: %@\n          acceptedTerms: %@\n               ssoToken: %@\n            scanOptions: %@\n<<<]",  v24,  v23,  v21,  v4,  v6,  v18,  v20,  @"none"));
  }

  return v15;
}

- (id)_descriptionScanPolicyVerifyDifferent
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam scanPolicy](self, "scanPolicy"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerCore scanPolicySummary:](&OBJC_CLASS___SUControllerCore, "scanPolicySummary:", v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam verifyDescriptor](self, "verifyDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam differentPrimary](self, "differentPrimary"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam differentSecondary](self, "differentSecondary"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 summary]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n             paramType: ScanPolicyVerifyDifferent\n            scanPolicy: %@\n      verifyDescriptor: %@\n      differentPrimary: %@\n    differentSecondary: %@\n<<<]",  v4,  v6,  v8,  v10));

  return v11;
}

- (id)_descriptionActiveSSOToken
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam activeDescriptor](self, "activeDescriptor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam ssoToken](self, "ssoToken"));
  id v6 = @"present";
  if (!v5) {
    id v6 = @"none";
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n           paramType: ActiveSSOToken\n    activeDescriptor: %@\n            ssoToken: %@\n<<<]",  v4,  v6));

  return v7;
}

- (id)_descriptionActivePurgeCompletion
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam activeDescriptor](self, "activeDescriptor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam purgeCompletion](self, "purgeCompletion"));
  id v6 = @"present";
  if (!v5) {
    id v6 = @"none";
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n           paramType: ActivePurgeCompletion\n    activeDescriptor: %@\n     purgeCompletion: %@\n<<<]",  v4,  v6));

  return v7;
}

- (id)_descriptionProgress
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam progress](self, "progress"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerPolicyStatus policyStateName:]( &OBJC_CLASS___SUControllerPolicyStatus,  "policyStateName:",  -[SUControllerPolicyParam reachedState](self, "reachedState")));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n       paramType: Progress\n        progress: %@\n    reachedState: %@\n<<<]",  v4,  v5));

  return v6;
}

- (id)_descriptionApply
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam applyInvokedBy](self, "applyInvokedBy"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam applyInvokedBy](self, "applyInvokedBy"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n       paramType: ApplyInformation\n  applyInvokedBy: %@\n<<<]",  v4));
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n       paramType: ApplyInformation\n  applyInvokedBy: %@\n<<<]",  @"Unknown"));
  }

  return v5;
}

- (id)_descriptionError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyParam error](self, "error"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n   paramType: Error\n       error: %@\n<<<]",  v3));

  return v4;
}

- (id)_descriptionUnknown
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n         paramType: Unknown(%ld)\n<<<]",  -[SUControllerPolicyParam paramType](self, "paramType"));
}

- (int64_t)paramType
{
  return self->_paramType;
}

- (BOOL)successfulOTA
{
  return self->_successfulOTA;
}

- (BOOL)tetheredRestore
{
  return self->_tetheredRestore;
}

- (BOOL)failedForward
{
  return self->_failedForward;
}

- (BOOL)failedBackward
{
  return self->_failedBackward;
}

- (int64_t)msuHandle
{
  return self->_msuHandle;
}

- (NSString)brainAssetID
{
  return self->_brainAssetID;
}

- (NSString)suAssetID
{
  return self->_suAssetID;
}

- (BOOL)isPrepared
{
  return self->_isPrepared;
}

- (BOOL)isApplied
{
  return self->_isApplied;
}

- (BOOL)acceptedTerms
{
  return self->_acceptedTerms;
}

- (NSSet)docAssetIDs
{
  return self->_docAssetIDs;
}

- (NSSet)suAssetIDs
{
  return self->_suAssetIDs;
}

- (SUCorePolicy)scanPolicy
{
  return self->_scanPolicy;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (BOOL)rampingForeground
{
  return self->_rampingForeground;
}

- (SUCoreDescriptor)primaryDescriptor
{
  return self->_primaryDescriptor;
}

- (SUCoreDescriptor)secondaryDescriptor
{
  return self->_secondaryDescriptor;
}

- (SUCoreDescriptor)verifyDescriptor
{
  return self->_verifyDescriptor;
}

- (SUCoreDescriptor)differentPrimary
{
  return self->_differentPrimary;
}

- (SUCoreDescriptor)differentSecondary
{
  return self->_differentSecondary;
}

- (SUCoreDescriptor)activeDescriptor
{
  return self->_activeDescriptor;
}

- (NSData)ssoToken
{
  return self->_ssoToken;
}

- (SUCoreProgress)progress
{
  return self->_progress;
}

- (int64_t)reachedState
{
  return self->_reachedState;
}

- (SUControllerScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (NSString)applyInvokedBy
{
  return self->_applyInvokedBy;
}

- (NSError)error
{
  return self->_error;
}

- (id)purgeCompletion
{
  return self->_purgeCompletion;
}

- (void).cxx_destruct
{
}

@end