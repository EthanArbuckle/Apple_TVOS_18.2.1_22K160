id CuttlefishAPIAsyncOperationClient.reset(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v24;
  v4 = v3;
  v8 = sub_100007578((uint64_t *)&unk_100251E90);
  v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for ResetRequest);
  v16 = type metadata accessor for ResetRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v15, 0LL, 1LL, v16);
  v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.ResetOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, (uint64_t *)&unk_100251E90);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0x7465736572LL, 0xE500000000000000LL, v12);
  sub_100041590((uint64_t)v15, (uint64_t *)&unk_100251E90);
  v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  v21 = v19;
  v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.establish(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251E80);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for EstablishRequest);
  uint64_t v16 = type metadata accessor for EstablishRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v15, 0LL, 1LL, v16);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.EstablishOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251E80);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0x73696C6261747365LL, 0xE900000000000068LL, v12);
  sub_100041590((uint64_t)v15, &qword_100251E80);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.joinWithVoucher(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578((uint64_t *)&unk_100251E70);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for JoinWithVoucherRequest);
  uint64_t v16 = type metadata accessor for JoinWithVoucherRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v15, 0LL, 1LL, v16);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.JoinWithVoucherOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, (uint64_t *)&unk_100251E70);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0x687469576E696F6ALL, 0xEF72656863756F56LL, v12);
  sub_100041590((uint64_t)v15, (uint64_t *)&unk_100251E70);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.updateTrust(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578((uint64_t *)&unk_100251E60);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for UpdateTrustRequest);
  uint64_t updated = type metadata accessor for UpdateTrustRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(updated - 8) + 56LL))(v15, 0LL, 1LL, updated);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.UpdateTrustOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, (uint64_t *)&unk_100251E60);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0x7254657461647075LL, 0xEB00000000747375LL, v12);
  sub_100041590((uint64_t)v15, (uint64_t *)&unk_100251E60);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.setRecoveryKey(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578((uint64_t *)&unk_100251E50);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for SetRecoveryKeyRequest);
  uint64_t v16 = type metadata accessor for SetRecoveryKeyRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v15, 0LL, 1LL, v16);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.SetRecoveryKeyOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, (uint64_t *)&unk_100251E50);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0x766F636552746573LL, 0xEE0079654B797265LL, v12);
  sub_100041590((uint64_t)v15, (uint64_t *)&unk_100251E50);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.addCustodianRecoveryKey(_:completion:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251DE0);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for AddCustodianRecoveryKeyRequest);
  uint64_t v16 = type metadata accessor for AddCustodianRecoveryKeyRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v15, 0LL, 1LL, v16);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.AddCustodianRecoveryKeyOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251DE0);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD000000000000017LL, 0x80000001001F6C60LL, v12);
  sub_100041590((uint64_t)v15, &qword_100251DE0);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.fetchChanges(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251E40);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for FetchChangesRequest);
  uint64_t ChangesRequest = type metadata accessor for FetchChangesRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(ChangesRequest - 8) + 56LL))( v15,  0LL,  1LL,  ChangesRequest);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.FetchChangesOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251E40);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0x6168436863746566LL, 0xEC0000007365676ELL, v12);
  sub_100041590((uint64_t)v15, &qword_100251E40);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.fetchViableBottles(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251E30);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for FetchViableBottlesRequest);
  uint64_t ViableBottlesRequest = type metadata accessor for FetchViableBottlesRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(ViableBottlesRequest - 8) + 56LL))( v15,  0LL,  1LL,  ViableBottlesRequest);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.FetchViableBottlesOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251E30);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD000000000000012LL, 0x80000001001F6CE0LL, v12);
  sub_100041590((uint64_t)v15, &qword_100251E30);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.fetchRecoverableTlkshares(_:completion:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251DD0);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for FetchRecoverableTLKSharesRequest);
  uint64_t RecoverableTLKSharesRequest = type metadata accessor for FetchRecoverableTLKSharesRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(RecoverableTLKSharesRequest - 8) + 56LL))( v15,  0LL,  1LL,  RecoverableTLKSharesRequest);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.FetchRecoverableTlksharesOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251DD0);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD000000000000019LL, 0x80000001001F6C40LL, v12);
  sub_100041590((uint64_t)v15, &qword_100251DD0);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.fetchPolicyDocuments(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251E20);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for FetchPolicyDocumentsRequest);
  uint64_t PolicyDocumentsRequest = type metadata accessor for FetchPolicyDocumentsRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(PolicyDocumentsRequest - 8) + 56LL))( v15,  0LL,  1LL,  PolicyDocumentsRequest);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.FetchPolicyDocumentsOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251E20);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD000000000000014LL, 0x80000001001F6CC0LL, v12);
  sub_100041590((uint64_t)v15, &qword_100251E20);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.getRepairAction(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578((uint64_t *)&unk_100251E10);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for GetRepairActionRequest);
  uint64_t RepairActionRequest = type metadata accessor for GetRepairActionRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(RepairActionRequest - 8) + 56LL))( v15,  0LL,  1LL,  RepairActionRequest);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.GetRepairActionOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, (uint64_t *)&unk_100251E10);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0x6961706552746567LL, 0xEF6E6F6974634172LL, v12);
  sub_100041590((uint64_t)v15, (uint64_t *)&unk_100251E10);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.getSupportAppInfo(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251E00);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for GetSupportAppInfoRequest);
  uint64_t SupportAppInfoRequest = type metadata accessor for GetSupportAppInfoRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(SupportAppInfoRequest - 8) + 56LL))( v15,  0LL,  1LL,  SupportAppInfoRequest);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.GetSupportAppInfoOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251E00);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD000000000000011LL, 0x80000001001F6CA0LL, v12);
  sub_100041590((uint64_t)v15, &qword_100251E00);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.resetAccountCdpcontents(_:completion:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578((uint64_t *)&unk_100251DF0);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for ResetAccountCDPContentsRequest);
  uint64_t v16 = type metadata accessor for ResetAccountCDPContentsRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v15, 0LL, 1LL, v16);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.ResetAccountCdpcontentsOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, (uint64_t *)&unk_100251DF0);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD000000000000017LL, 0x80000001001F6C80LL, v12);
  sub_100041590((uint64_t)v15, (uint64_t *)&unk_100251DF0);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.removeRecoveryKey(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251DC0);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for RemoveRecoveryKeyRequest);
  uint64_t v16 = type metadata accessor for RemoveRecoveryKeyRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v15, 0LL, 1LL, v16);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.RemoveRecoveryKeyOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251DC0);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD000000000000011LL, 0x80000001001F6C20LL, v12);
  sub_100041590((uint64_t)v15, &qword_100251DC0);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.performAtoprvactions(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251DB0);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for PerformATOPRVActionsRequest);
  uint64_t v16 = type metadata accessor for PerformATOPRVActionsRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v15, 0LL, 1LL, v16);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.PerformAtoprvactionsOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251DB0);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD000000000000014LL, 0x80000001001F6C00LL, v12);
  sub_100041590((uint64_t)v15, &qword_100251DB0);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.fetchPcsidentityByPublicKey(_:completion:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251D90);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for DirectPCSIdentityFetchRequest);
  uint64_t Request = type metadata accessor for DirectPCSIdentityFetchRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(Request - 8) + 56LL))(v15, 0LL, 1LL, Request);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.FetchPcsidentityByPublicKeyOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251D90);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD00000000000001BLL, 0x80000001001F6BC0LL, v12);
  sub_100041590((uint64_t)v15, &qword_100251D90);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.fetchCurrentItem(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578((uint64_t *)&unk_100251DA0);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for CurrentItemFetchRequest);
  uint64_t Request = type metadata accessor for CurrentItemFetchRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(Request - 8) + 56LL))(v15, 0LL, 1LL, Request);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.FetchCurrentItemOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, (uint64_t *)&unk_100251DA0);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD000000000000010LL, 0x80000001001F6BE0LL, v12);
  sub_100041590((uint64_t)v15, (uint64_t *)&unk_100251DA0);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id CuttlefishAPIAsyncOperationClient.performCkserverUnreadableDataRemoval(_:completion:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007578(&qword_100251D80);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v24 - v14;
  sub_10004164C(a1, (uint64_t)&v24 - v14, type metadata accessor for RemoveUnreadableCKServerDataRequest);
  uint64_t v16 = type metadata accessor for RemoveUnreadableCKServerDataRequest(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v15, 0LL, 1LL, v16);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CuttlefishAPI.PerformCkserverUnreadableDataRemovalOperation(0LL));
  sub_10000FC68((uint64_t)v15, (uint64_t)v12, &qword_100251D80);
  v18 = (void *)CKCodeOperation.init(functionName:request:)(0xD000000000000024LL, 0x80000001001F6B90LL, v12);
  sub_100041590((uint64_t)v15, &qword_100251D80);
  id v19 = v18;
  swift_retain(a3);
  dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter(a2, a3);

  v20 = *(void **)(v4 + 16);
  id v21 = v19;
  id v22 = v20;
  dispatch thunk of CKCodeOperation.codeService.setter(v20);

  return v21;
}

id sub_1001A2280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.reset(_:completion:)(a1, a2, a3);
}

id sub_1001A22A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.establish(_:completion:)(a1, a2, a3);
}

id sub_1001A22C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.joinWithVoucher(_:completion:)(a1, a2, a3);
}

id sub_1001A22E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.updateTrust(_:completion:)(a1, a2, a3);
}

id sub_1001A2300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.setRecoveryKey(_:completion:)(a1, a2, a3);
}

id sub_1001A2320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.addCustodianRecoveryKey(_:completion:)(a1, a2, a3);
}

id sub_1001A2340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.fetchChanges(_:completion:)(a1, a2, a3);
}

id sub_1001A2360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.fetchViableBottles(_:completion:)(a1, a2, a3);
}

id sub_1001A2380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.fetchRecoverableTlkshares(_:completion:)(a1, a2, a3);
}

id sub_1001A23A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.fetchPolicyDocuments(_:completion:)(a1, a2, a3);
}

id sub_1001A23C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.getRepairAction(_:completion:)(a1, a2, a3);
}

id sub_1001A23E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.getSupportAppInfo(_:completion:)(a1, a2, a3);
}

id sub_1001A2400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.resetAccountCdpcontents(_:completion:)(a1, a2, a3);
}

id sub_1001A2420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.removeRecoveryKey(_:completion:)(a1, a2, a3);
}

id sub_1001A2440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.performAtoprvactions(_:completion:)(a1, a2, a3);
}

id sub_1001A2460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.fetchPcsidentityByPublicKey(_:completion:)(a1, a2, a3);
}

id sub_1001A2480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.fetchCurrentItem(_:completion:)(a1, a2, a3);
}

id sub_1001A24A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CuttlefishAPIAsyncOperationClient.performCkserverUnreadableDataRemoval(_:completion:)(a1, a2, a3);
}

ValueMetadata *type metadata accessor for CuttlefishAPI()
{
  return &type metadata for CuttlefishAPI;
}

uint64_t sub_1001A24D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.ResetOperation);
}

uint64_t sub_1001A24DC()
{
  return type metadata accessor for CuttlefishAPI.ResetOperation(0LL);
}

uint64_t sub_1001A24E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.EstablishOperation);
}

uint64_t sub_1001A24F0()
{
  return type metadata accessor for CuttlefishAPI.EstablishOperation(0LL);
}

uint64_t sub_1001A24F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.JoinWithVoucherOperation);
}

uint64_t sub_1001A2504()
{
  return type metadata accessor for CuttlefishAPI.JoinWithVoucherOperation(0LL);
}

uint64_t sub_1001A250C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.UpdateTrustOperation);
}

uint64_t sub_1001A2518()
{
  return type metadata accessor for CuttlefishAPI.UpdateTrustOperation(0LL);
}

uint64_t sub_1001A2520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.SetRecoveryKeyOperation);
}

uint64_t sub_1001A252C()
{
  return type metadata accessor for CuttlefishAPI.SetRecoveryKeyOperation(0LL);
}

uint64_t sub_1001A2534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.AddCustodianRecoveryKeyOperation);
}

uint64_t sub_1001A2540()
{
  return type metadata accessor for CuttlefishAPI.AddCustodianRecoveryKeyOperation(0LL);
}

uint64_t sub_1001A2548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.FetchChangesOperation);
}

uint64_t sub_1001A2554()
{
  return type metadata accessor for CuttlefishAPI.FetchChangesOperation(0LL);
}

uint64_t sub_1001A255C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.FetchViableBottlesOperation);
}

uint64_t sub_1001A2568()
{
  return type metadata accessor for CuttlefishAPI.FetchViableBottlesOperation(0LL);
}

uint64_t sub_1001A2570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.FetchRecoverableTlksharesOperation);
}

uint64_t sub_1001A257C()
{
  return type metadata accessor for CuttlefishAPI.FetchRecoverableTlksharesOperation(0LL);
}

uint64_t sub_1001A2584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.FetchPolicyDocumentsOperation);
}

uint64_t sub_1001A2590()
{
  return type metadata accessor for CuttlefishAPI.FetchPolicyDocumentsOperation(0LL);
}

uint64_t sub_1001A2598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.GetRepairActionOperation);
}

uint64_t sub_1001A25A4()
{
  return type metadata accessor for CuttlefishAPI.GetRepairActionOperation(0LL);
}

uint64_t sub_1001A25AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.GetSupportAppInfoOperation);
}

uint64_t sub_1001A25B8()
{
  return type metadata accessor for CuttlefishAPI.GetSupportAppInfoOperation(0LL);
}

uint64_t sub_1001A25C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.ResetAccountCdpcontentsOperation);
}

uint64_t sub_1001A25CC()
{
  return type metadata accessor for CuttlefishAPI.ResetAccountCdpcontentsOperation(0LL);
}

uint64_t sub_1001A25D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.RemoveRecoveryKeyOperation);
}

uint64_t sub_1001A25E0()
{
  return type metadata accessor for CuttlefishAPI.RemoveRecoveryKeyOperation(0LL);
}

uint64_t sub_1001A25E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.PerformAtoprvactionsOperation);
}

uint64_t sub_1001A25F4()
{
  return type metadata accessor for CuttlefishAPI.PerformAtoprvactionsOperation(0LL);
}

uint64_t sub_1001A25FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.FetchPcsidentityByPublicKeyOperation);
}

uint64_t sub_1001A2608()
{
  return type metadata accessor for CuttlefishAPI.FetchPcsidentityByPublicKeyOperation(0LL);
}

uint64_t sub_1001A2610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630(a1, a2, a3, class metadata base offset for CuttlefishAPI.FetchCurrentItemOperation);
}

uint64_t sub_1001A261C()
{
  return type metadata accessor for CuttlefishAPI.FetchCurrentItemOperation(0LL);
}

uint64_t sub_1001A2624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001A2630( a1,  a2,  a3,  class metadata base offset for CuttlefishAPI.PerformCkserverUnreadableDataRemovalOperation);
}

uint64_t sub_1001A2630(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v5, a1 + *a4);
}

uint64_t sub_1001A2668()
{
  return type metadata accessor for CuttlefishAPI.PerformCkserverUnreadableDataRemovalOperation(0LL);
}

uint64_t type metadata accessor for CuttlefishAPIAsyncClient()
{
  return objc_opt_self(&OBJC_CLASS____TtC18TrustedPeersHelper24CuttlefishAPIAsyncClient);
}

uint64_t type metadata accessor for CuttlefishAPIAsyncOperationClient()
{
  return objc_opt_self(&OBJC_CLASS____TtC18TrustedPeersHelper33CuttlefishAPIAsyncOperationClient);
}

uint64_t sub_1001A26C0(void *a1)
{
  return sub_100199204(a1);
}

uint64_t sub_1001A26D4(void *a1)
{
  return sub_10019923C(a1);
}

uint64_t sub_1001A26E8(uint64_t a1)
{
  return sub_100199180(a1);
}

uint64_t sub_1001A26FC(_TtC18TrustedPeersHelper6Client **a1)
{
  return sub_100199260(a1);
}

uint64_t sub_1001A2710(_TtC18TrustedPeersHelper6Client **a1)
{
  return sub_100199708(a1);
}

uint64_t sub_1001A2724(_TtC18TrustedPeersHelper6Client **a1)
{
  return sub_10019983C(a1);
}

uint64_t sub_1001A2738(_BYTE *a1)
{
  return sub_100199970(a1);
}

void sub_1001A274C(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v2 = a1;
    }
    else {
      uint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = __CocoaSet.makeIterator()(v2);
    uint64_t v4 = type metadata accessor for MachineMO();
    uint64_t v5 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    v6 = Set.Iterator.init(_cocoa:)(v28, v3, v4, v5);
    uint64_t v1 = v28[0];
    uint64_t v26 = v28[1];
    uint64_t v7 = v28[2];
    uint64_t v8 = v28[3];
    unint64_t v9 = v28[4];
  }

  else
  {
    uint64_t v10 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v26 = a1 + 56;
    uint64_t v7 = ~v10;
    uint64_t v11 = -v10;
    if (v11 < 64) {
      uint64_t v12 = ~(-1LL << v11);
    }
    else {
      uint64_t v12 = -1LL;
    }
    unint64_t v9 = v12 & *(void *)(a1 + 56);
    v6 = (void *)swift_bridgeObjectRetain(a1);
    uint64_t v8 = 0LL;
  }

  int64_t v25 = (unint64_t)(v7 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_13;
  }
  while (1)
  {
    if (v9)
    {
      uint64_t v13 = (v9 - 1) & v9;
      unint64_t v14 = __clz(__rbit64(v9)) | (v8 << 6);
      uint64_t v15 = v8;
      goto LABEL_32;
    }

    int64_t v21 = v8 + 1;
    if (__OFADD__(v8, 1LL)) {
      break;
    }
    if (v21 >= v25) {
      goto LABEL_38;
    }
    unint64_t v22 = *(void *)(v26 + 8 * v21);
    uint64_t v15 = v8 + 1;
    if (!v22)
    {
      uint64_t v15 = v8 + 2;
      if (v8 + 2 >= v25) {
        goto LABEL_38;
      }
      unint64_t v22 = *(void *)(v26 + 8 * v15);
      if (!v22)
      {
        uint64_t v15 = v8 + 3;
        if (v8 + 3 >= v25) {
          goto LABEL_38;
        }
        unint64_t v22 = *(void *)(v26 + 8 * v15);
        if (!v22)
        {
          uint64_t v15 = v8 + 4;
          if (v8 + 4 >= v25) {
            goto LABEL_38;
          }
          unint64_t v22 = *(void *)(v26 + 8 * v15);
          if (!v22)
          {
            uint64_t v15 = v8 + 5;
            if (v8 + 5 >= v25) {
              goto LABEL_38;
            }
            unint64_t v22 = *(void *)(v26 + 8 * v15);
            if (!v22)
            {
              uint64_t v23 = v8 + 6;
              while (v25 != v23)
              {
                unint64_t v22 = *(void *)(v26 + 8 * v23++);
                if (v22)
                {
                  uint64_t v15 = v23 - 1;
                  goto LABEL_31;
                }
              }

void sub_1001A2A40(uint64_t a1)
{
  int64_t v2 = 0LL;
  uint64_t v3 = a1 + 56;
  uint64_t v4 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v5 = -1LL;
  if (v4 < 64) {
    uint64_t v5 = ~(-1LL << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }

    int64_t v20 = v2 + 1;
    if (__OFADD__(v2, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v20 >= v7) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v3 + 8 * v20);
    ++v2;
    if (!v21)
    {
      int64_t v2 = v20 + 1;
      if (v20 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v3 + 8 * v2);
      if (!v21)
      {
        int64_t v2 = v20 + 2;
        if (v20 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v21 = *(void *)(v3 + 8 * v2);
        if (!v21)
        {
          int64_t v2 = v20 + 3;
          if (v20 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v21 = *(void *)(v3 + 8 * v2);
          if (!v21) {
            break;
          }
        }
      }
    }

Swift::Int sub_1001A2BAC()
{
  uint64_t v1 = sub_100007578(&qword_100256D28);
  uint64_t v3 = __chkstk_darwin(v1, v2);
  uint64_t v5 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v3, v6);
  v99 = (char *)&v92 - v8;
  uint64_t v10 = __chkstk_darwin(v7, v9);
  v98 = (char *)&v92 - v11;
  __chkstk_darwin(v10, v12);
  v97 = (char *)&v92 - v13;
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v17 = __chkstk_darwin(v14, v16);
  v96 = (char *)&v92 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v17, v19);
  v95 = (char *)&v92 - v21;
  uint64_t v23 = __chkstk_darwin(v20, v22);
  v94 = (char *)&v92 - v24;
  uint64_t v26 = __chkstk_darwin(v23, v25);
  v28 = (char *)&v92 - v27;
  __chkstk_darwin(v26, v29);
  v93 = (char *)&v92 - v30;
  uint64_t v31 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO;
  id v32 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                              + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO), "honorIDMSListChanges"));
  if (v32)
  {
    v33 = v32;
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
    uint64_t v36 = v35;

    if (v34 == 0x4E574F4E4B4E55LL && v36 == 0xE700000000000000LL)
    {
      swift_bridgeObjectRelease(0xE700000000000000LL);
      return 1LL;
    }

    char v38 = _stringCompareWithSmolCheck(_:_:expecting:)(v34, v36, 0x4E574F4E4B4E55LL, 0xE700000000000000LL, 0LL);
    swift_bridgeObjectRelease(v36);
    if ((v38 & 1) != 0) {
      return 1LL;
    }
  }

  id v40 = [*(id *)(v0 + v31) machines];
  if (v40
    && (v41 = v40,
        uint64_t v104 = 0LL,
        uint64_t v42 = type metadata accessor for MachineMO(),
        uint64_t v43 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject),  static Set._conditionallyBridgeFromObjectiveC(_:result:)(v41, &v104, v42, v43),  v41,  (v44 = v104) != 0))
  {
    if ((v104 & 0xC000000000000001LL) != 0) {
      goto LABEL_11;
    }
  }

  else
  {
    swift_bridgeObjectRelease(0LL);
    uint64_t v44 = (uint64_t)&_swiftEmptySetSingleton;
    if (((unint64_t)&_swiftEmptySetSingleton & 0xC000000000000001LL) != 0)
    {
LABEL_11:
      uint64_t v45 = (uint64_t)&_swiftEmptySetSingleton;
      uint64_t v104 = (uint64_t)&_swiftEmptySetSingleton;
      if (v44 >= 0) {
        v44 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      uint64_t v46 = __CocoaSet.makeIterator()(v44);
      uint64_t v47 = __CocoaSet.Iterator.next()(v46);
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v101 = type metadata accessor for MachineMO();
        v100 = (char *)&type metadata for Swift.AnyObject + 8;
        while (1)
        {
          uint64_t v102 = v48;
          swift_dynamicCast(&v103, &v102, v100, v101, 7LL);
          id v54 = v103;
          if (![v103 status])
          {
            id v77 = [v54 modified];
            uint64_t v56 = (uint64_t)v5;
            if (!v77)
            {
LABEL_37:
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v56, 1LL, 1LL, v14);
LABEL_38:
              sub_1001AE34C(v56);
LABEL_39:
              id v85 = v103;
              uint64_t v84 = v104;
              unint64_t v86 = *(void *)(v104 + 16);
              if (*(void *)(v104 + 24) <= v86)
              {
                sub_10014FD58(v86 + 1);
                uint64_t v84 = v104;
              }

              Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v84 + 40));
              uint64_t v49 = v84 + 56;
              uint64_t v50 = -1LL << *(_BYTE *)(v84 + 32);
              unint64_t v51 = result & ~v50;
              unint64_t v52 = v51 >> 6;
              if (((-1LL << v51) & ~*(void *)(v84 + 56 + 8 * (v51 >> 6))) != 0)
              {
                unint64_t v53 = __clz(__rbit64((-1LL << v51) & ~*(void *)(v84 + 56 + 8 * (v51 >> 6)))) | v51 & 0x7FFFFFFFFFFFFFC0LL;
              }

              else
              {
                char v87 = 0;
                unint64_t v88 = (unint64_t)(63 - v50) >> 6;
                do
                {
                  if (++v52 == v88 && (v87 & 1) != 0)
                  {
                    __break(1u);
                    return result;
                  }

                  BOOL v89 = v52 == v88;
                  if (v52 == v88) {
                    unint64_t v52 = 0LL;
                  }
                  v87 |= v89;
                  uint64_t v90 = *(void *)(v49 + 8 * v52);
                }

                while (v90 == -1);
                unint64_t v53 = __clz(__rbit64(~v90)) + (v52 << 6);
              }

              *(void *)(v49 + ((v53 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v53;
              *(void *)(*(void *)(v84 + 48) + 8 * v53) = v85;
              ++*(void *)(v84 + 16);
              goto LABEL_18;
            }

            v78 = v77;
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            v79 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
            v79(v5, v28, v14);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v5, 0LL, 1LL, v14);
            uint64_t v56 = (uint64_t)v5;
            v80 = v96;
            uint64_t v81 = ((uint64_t (*)(char *, char *, uint64_t))v79)(v96, v5, v14);
            Date.init(timeIntervalSinceNow:)(v81, -172800.0);
            uint64_t v82 = Date.compare(_:)(v28);
            v83 = *(void (**)(char *, uint64_t))(v15 + 8);
            v83(v28, v14);
            v83(v80, v14);
            if (v82 != 1) {
              goto LABEL_39;
            }
          }

          if ([v54 status] == (id)3)
          {
            id v55 = [v54 modified];
            uint64_t v56 = (uint64_t)v99;
            if (!v55) {
              goto LABEL_37;
            }
            v57 = v55;
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            v58 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
            uint64_t v56 = (uint64_t)v99;
            v58(v99, v28, v14);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v56, 0LL, 1LL, v14);
            v59 = v95;
            uint64_t v60 = ((uint64_t (*)(char *, char *, uint64_t))v58)(v95, v99, v14);
            Date.init(timeIntervalSinceNow:)(v60, -172800.0);
            uint64_t v61 = Date.compare(_:)(v28);
            v62 = *(void (**)(char *, uint64_t))(v15 + 8);
            v62(v28, v14);
            v62(v59, v14);
            if (v61 != 1) {
              goto LABEL_39;
            }
          }

          if ([v54 status] == (id)4)
          {
            id v63 = [v54 modified];
            uint64_t v56 = (uint64_t)v98;
            if (!v63) {
              goto LABEL_37;
            }
            v64 = v63;
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            v65 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
            uint64_t v56 = (uint64_t)v98;
            v65(v98, v28, v14);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v56, 0LL, 1LL, v14);
            v66 = v94;
            uint64_t v67 = ((uint64_t (*)(char *, char *, uint64_t))v65)(v94, v98, v14);
            Date.init(timeIntervalSinceNow:)(v67, -172800.0);
            uint64_t v68 = Date.compare(_:)(v28);
            v69 = *(void (**)(char *, uint64_t))(v15 + 8);
            v69(v28, v14);
            v69(v66, v14);
            if (v68 != 1) {
              goto LABEL_39;
            }
          }

          if ([v54 status] == (id)5)
          {
            id v70 = [v54 modified];
            uint64_t v56 = (uint64_t)v97;
            if (!v70) {
              goto LABEL_37;
            }
            v71 = v70;
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            v72 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
            uint64_t v56 = (uint64_t)v97;
            v72(v97, v28, v14);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v56, 0LL, 1LL, v14);
            v73 = v93;
            uint64_t v74 = ((uint64_t (*)(char *, char *, uint64_t))v72)(v93, v97, v14);
            Date.init(timeIntervalSinceNow:)(v74, -172800.0);
            uint64_t v75 = Date.compare(_:)(v28);
            v76 = *(void (**)(char *, uint64_t))(v15 + 8);
            v76(v28, v14);
            v76(v73, v14);
            if (v75 != 1) {
              goto LABEL_39;
            }
          }

LABEL_18:
          uint64_t v48 = __CocoaSet.Iterator.next()(result);
          if (!v48)
          {
            uint64_t v45 = v104;
            break;
          }
        }
      }

      swift_release(v46);
      if ((v45 & 0xC000000000000001LL) != 0) {
        goto LABEL_55;
      }
      goto LABEL_51;
    }
  }

  uint64_t v45 = sub_1001502FC(v44, (uint64_t (*)(char *, unint64_t, uint64_t))sub_1001AAC7C);
  if ((v45 & 0xC000000000000001LL) != 0)
  {
LABEL_55:
    uint64_t v91 = __CocoaSet.count.getter(v45);
    goto LABEL_56;
  }

LABEL_51:
  uint64_t v91 = *(void *)(v45 + 16);
LABEL_56:
  swift_release(v45);
  return v91 != 0;
}

uint64_t sub_1001A3414()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO), "machines"));
  if (!v1) {
    goto LABEL_10;
  }
  uint64_t v2 = v1;
  v38[0] = 0LL;
  uint64_t v3 = type metadata accessor for MachineMO();
  uint64_t v4 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
  static Set._conditionallyBridgeFromObjectiveC(_:result:)(v2, v38, v3, v4);

  uint64_t v5 = v38[0];
  if (!v38[0]) {
    goto LABEL_10;
  }
  unint64_t v6 = v38[0] & 0xC000000000000001LL;
  if ((v38[0] & 0xC000000000000001LL) != 0)
  {
    do
    {
      uint64_t v7 = v5 < 0 ? v5 : v5 & 0xFFFFFFFFFFFFFF8LL;
      uint64_t v8 = __CocoaSet.count.getter(v7);
      if (!v8) {
        goto LABEL_24;
      }
      uint64_t v9 = v8;
      uint64_t v42 = _swiftEmptyArrayStorage;
      ((void (*)(void))specialized ContiguousArray.reserveCapacity(_:))();
      uint64_t v39 = __CocoaSet.startIndex.getter(v7);
      uint64_t v40 = v10;
      char v41 = 1;
      if ((v9 & 0x8000000000000000LL) == 0) {
        goto LABEL_13;
      }
      __break(1u);
LABEL_10:
      swift_bridgeObjectRelease(0LL);
      uint64_t v5 = (uint64_t)&_swiftEmptySetSingleton;
      unint64_t v6 = (unint64_t)&_swiftEmptySetSingleton & 0xC000000000000001LL;
    }

    while (((unint64_t)&_swiftEmptySetSingleton & 0xC000000000000001LL) != 0);
  }

  uint64_t v9 = *(void *)(v5 + 16);
  if (!v9)
  {
LABEL_24:
    swift_bridgeObjectRelease(v5);
    uint64_t v34 = _swiftEmptyArrayStorage;
LABEL_25:
    id v35 = objc_allocWithZone(&OBJC_CLASS___TPMachineIDList);
    sub_100007620(0LL, &qword_100257C38, &OBJC_CLASS___TPMachineID_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v34);
    id v37 = [v35 initWithEntries:isa];

    return (uint64_t)v37;
  }

  uint64_t v42 = _swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v9);
  uint64_t v39 = sub_1001AC2C0(v5);
  uint64_t v40 = v11;
  char v41 = v12 & 1;
LABEL_13:
  if (v5 < 0) {
    uint64_t v13 = v5;
  }
  else {
    uint64_t v13 = v5 & 0xFFFFFFFFFFFFFF8LL;
  }
  while (1)
  {
    while (1)
    {
      int64_t v19 = v39;
      uint64_t v20 = v40;
      char v21 = v41;
      sub_1001AC4DC(v39, v40, v41, v5, (uint64_t (*)(void))type metadata accessor for MachineMO);
      uint64_t v23 = v22;
      uint64_t v24 = sub_1001A543C();

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v25);
      uint64_t v26 = v42[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v26);
      uint64_t v27 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v24);
      uint64_t result = specialized ContiguousArray._endMutation()(v27);
      if (v6) {
        break;
      }
      int64_t v14 = sub_1001AC3EC(v19, v20, v21, v5);
      uint64_t v16 = v15;
      char v18 = v17;
      sub_100171978(v19, v20, v21);
      uint64_t v39 = v14;
      uint64_t v40 = v16;
      char v41 = v18 & 1;
      if (!--v9) {
        goto LABEL_23;
      }
    }

    if ((v21 & 1) == 0) {
      break;
    }
    uint64_t v29 = __CocoaSet.Index.handleBitPattern.getter(v19, v20);
    if (v29) {
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v29);
    }
    else {
      uint64_t isUniquelyReferenced_nonNull_native = 1LL;
    }
    uint64_t v31 = sub_100007578(&qword_100257C30);
    id v32 = (void (*)(void *, void))Set.Index._asCocoa.modify(v38, v31);
    __CocoaSet.formIndex(after:isUnique:)(v33, isUniquelyReferenced_nonNull_native, v13);
    v32(v38, 0LL);
    if (!--v9)
    {
LABEL_23:
      sub_100171978(v39, v40, v41);
      uint64_t v34 = v42;
      swift_bridgeObjectRelease(v5);
      goto LABEL_25;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_1001A372C(uint64_t a1, unint64_t a2)
{
  id v4 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                             + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO), "machines"));
  if (!v4
    || (char v12 = v4,
        v104[0] = 0LL,
        uint64_t v13 = type metadata accessor for MachineMO(),
        uint64_t v14 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject),  static Set._conditionallyBridgeFromObjectiveC(_:result:)(v12, v104, v13, v14),  v12,  (v15 = v104[0]) == 0))
  {
    swift_bridgeObjectRelease(0LL, v5, v6, v7, v8, v9, v10, v11);
    uint64_t v15 = (uint64_t)&_swiftEmptySetSingleton;
    uint64_t v16 = sub_1001AE38C();
    if ((v16 & 1) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)v15, v17, v18, v19, v20, v21, v22, v23);
    if (qword_100250ED8 != -1) {
      goto LABEL_64;
    }
    goto LABEL_11;
  }

  uint64_t v16 = sub_1001AE38C();
  if ((v16 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  v100 = (_TtC18TrustedPeersHelper6Client *)a2;
  if ((v15 & 0xC000000000000001LL) != 0)
  {
    if (v15 < 0) {
      uint64_t v24 = v15;
    }
    else {
      uint64_t v24 = v15 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v25 = __CocoaSet.makeIterator()(v24);
    uint64_t v26 = type metadata accessor for MachineMO();
    uint64_t v27 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    uint64_t v16 = (uint64_t)Set.Iterator.init(_cocoa:)(v104, v25, v26, v27);
    uint64_t v15 = v104[0];
    uint64_t v99 = v104[1];
    uint64_t v28 = v104[2];
    a2 = v104[3];
    unint64_t v29 = v104[4];
  }

  else
  {
    a2 = 0LL;
    uint64_t v37 = -1LL << *(_BYTE *)(v15 + 32);
    uint64_t v99 = v15 + 56;
    uint64_t v38 = ~v37;
    uint64_t v39 = -v37;
    if (v39 < 64) {
      uint64_t v40 = ~(-1LL << v39);
    }
    else {
      uint64_t v40 = -1LL;
    }
    unint64_t v29 = v40 & *(void *)(v15 + 56);
    uint64_t v28 = v38;
  }

  int64_t v97 = (unint64_t)(v28 + 64) >> 6;
  while (v15 < 0)
  {
    uint64_t v52 = __CocoaSet.Iterator.next()(v16);
    if (!v52) {
      goto LABEL_54;
    }
    uint64_t v53 = v52;
    uint64_t v102 = v52;
    uint64_t v54 = type metadata accessor for MachineMO();
    swift_unknownObjectRetain(v53, v55);
    swift_dynamicCast(&v103, &v102, (char *)&type metadata for Swift.AnyObject + 8, v54, 7LL);
    id v56 = v103;
    swift_unknownObjectRelease(v53);
    unint64_t v51 = a2;
    uint64_t v49 = v29;
    if (!v56)
    {
LABEL_54:
      unint64_t v58 = (unint64_t)v100;
      goto LABEL_55;
    }

LABEL_55:
            sub_100172694(v15);
            if (qword_100250ED8 != -1) {
              swift_once(&qword_100250ED8, sub_1001A5008);
            }
            uint64_t v89 = type metadata accessor for Logger(0LL);
            sub_100006BAC(v89, (uint64_t)qword_100257C18);
            uint64_t v90 = swift_bridgeObjectRetain_n(v58, 2LL);
            uint64_t v91 = (os_log_s *)Logger.logObject.getter(v90);
            os_log_type_t v92 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v91, v92))
            {
              v93 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
              uint64_t v94 = swift_slowAlloc(32LL, -1LL);
              id v103 = (void *)v94;
              *(_DWORD *)v93 = 136446210;
              swift_bridgeObjectRetain(v58);
              uint64_t v102 = sub_10017C4C4(a1, v58, (uint64_t *)&v103);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v102, &v103, v93 + 4, v93 + 12);
              swift_bridgeObjectRelease_n(v58, 3LL);
              _os_log_impl((void *)&_mh_execute_header, v91, v92, "machineID %{public}s not found on list", v93, 0xCu);
              swift_arrayDestroy(v94, 1LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v94, -1LL, -1LL);
              swift_slowDealloc(v93, -1LL, -1LL);
            }

            else
            {

              swift_bridgeObjectRelease_n(v58, 2LL);
            }

            return 0LL;
          }
        }
      }
    }

  __break(1u);
}

void sub_1001A3FE8(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v2 = a1;
    }
    else {
      uint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = __CocoaSet.makeIterator()(v2);
    uint64_t v4 = type metadata accessor for MachineMO();
    uint64_t v5 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    unint64_t v6 = Set.Iterator.init(_cocoa:)(v28, v3, v4, v5);
    uint64_t v1 = v28[0];
    uint64_t v26 = v28[1];
    uint64_t v7 = v28[2];
    uint64_t v8 = v28[3];
    unint64_t v9 = v28[4];
  }

  else
  {
    uint64_t v10 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v26 = a1 + 56;
    uint64_t v7 = ~v10;
    uint64_t v11 = -v10;
    if (v11 < 64) {
      uint64_t v12 = ~(-1LL << v11);
    }
    else {
      uint64_t v12 = -1LL;
    }
    unint64_t v9 = v12 & *(void *)(a1 + 56);
    unint64_t v6 = (void *)swift_bridgeObjectRetain(a1);
    uint64_t v8 = 0LL;
  }

  int64_t v25 = (unint64_t)(v7 + 64) >> 6;
  while (1)
  {
    uint64_t v17 = v8;
    if ((v1 & 0x8000000000000000LL) == 0) {
      break;
    }
    uint64_t v21 = __CocoaSet.Iterator.next()(v6);
    if (!v21) {
      goto LABEL_34;
    }
    uint64_t v22 = v21;
    uint64_t v27 = v21;
    uint64_t v23 = type metadata accessor for MachineMO();
    swift_unknownObjectRetain(v22, v24);
    swift_dynamicCast(&v29, &v27, (char *)&type metadata for Swift.AnyObject + 8, v23, 7LL);
    id v15 = v29;
    swift_unknownObjectRelease(v22);
    if (!v15) {
      goto LABEL_34;
    }
LABEL_13:
    unsigned int v16 = [v15 allowed];

    if (v16) {
      goto LABEL_34;
    }
  }

  if (v9)
  {
    unint64_t v13 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v14 = v13 | (v8 << 6);
LABEL_12:
    id v15 = *(id *)(*(void *)(v1 + 48) + 8 * v14);
    if (!v15) {
      goto LABEL_34;
    }
    goto LABEL_13;
  }

  int64_t v18 = v8 + 1;
  if (!__OFADD__(v8, 1LL))
  {
    if (v18 >= v25) {
      goto LABEL_34;
    }
    unint64_t v19 = *(void *)(v26 + 8 * v18);
    ++v8;
    if (!v19)
    {
      uint64_t v8 = v17 + 2;
      if (v17 + 2 >= v25) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v26 + 8 * v8);
      if (!v19)
      {
        uint64_t v8 = v17 + 3;
        if (v17 + 3 >= v25) {
          goto LABEL_34;
        }
        unint64_t v19 = *(void *)(v26 + 8 * v8);
        if (!v19)
        {
          uint64_t v8 = v17 + 4;
          if (v17 + 4 >= v25) {
            goto LABEL_34;
          }
          unint64_t v19 = *(void *)(v26 + 8 * v8);
          if (!v19)
          {
            uint64_t v8 = v17 + 5;
            if (v17 + 5 >= v25) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v26 + 8 * v8);
            if (!v19)
            {
              uint64_t v20 = v17 + 6;
              while (v25 != v20)
              {
                unint64_t v19 = *(void *)(v26 + 8 * v20++);
                if (v19)
                {
                  uint64_t v8 = v20 - 1;
                  goto LABEL_31;
                }
              }

uint64_t sub_1001A42C0(void *a1)
{
  uint64_t v3 = type metadata accessor for Date(0LL);
  v115 = *(void (***)(char *, uint64_t))(v3 - 8);
  uint64_t v116 = v3;
  __chkstk_darwin(v3, v4);
  unint64_t v6 = (char *)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v117 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO;
  v118 = v1;
  id v7 = [*(id *)&v1[OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO] machines];
  if (!v7
    || (uint64_t v8 = v7,
        v121[0] = 0LL,
        uint64_t v9 = type metadata accessor for MachineMO(),
        uint64_t v10 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject),  static Set._conditionallyBridgeFromObjectiveC(_:result:)(v8, v121, v9, v10),  v8,  (v11 = (void *)v121[0]) == 0LL))
  {
    swift_bridgeObjectRelease(0LL);
    uint64_t v11 = &_swiftEmptySetSingleton;
  }

  uint64_t v112 = (uint64_t)v11;
  sub_1000DCA18((uint64_t)v11);
  uint64_t v13 = v12;
  uint64_t v14 = sub_100161634(v12);
  swift_bridgeObjectRelease(v13);
  id v15 = [a1 includedPeerIDs];
  uint64_t v16 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v15,  &type metadata for String,  &protocol witness table for String);

  uint64_t v17 = v118;
  uint64_t v18 = sub_1001AC9B8(v16, (uint64_t)v17);
  swift_bridgeObjectRelease(v16);

  uint64_t v19 = sub_100161634(v18);
  swift_bridgeObjectRelease(v18);
  v114 = v17;
  char v20 = sub_1001AE38C();
  p_vtable = &OBJC_CLASS___VoucherMO.vtable;
  uint64_t v22 = (uint64_t)&type metadata for Any;
  uint64_t v107 = v19;
  if ((v20 & 1) == 0)
  {
    swift_bridgeObjectRelease(v14);
    if (qword_100250ED8 != -1) {
      goto LABEL_88;
    }
    goto LABEL_8;
  }

  if (*(void *)(v14 + 16) <= *(void *)(v19 + 16) >> 3)
  {
    v121[0] = v19;
    swift_bridgeObjectRetain(v19);
    sub_1001560D8(v14);
    swift_bridgeObjectRelease(v14);
    uint64_t v23 = (unint64_t *)v121[0];
  }

  else
  {
    swift_bridgeObjectRetain(v19);
    uint64_t v23 = sub_10015626C(v14, v19);
    swift_bridgeObjectRelease(v14);
  }

  uint64_t v22 = 0LL;
  unint64_t v32 = v23[7];
  *(void *)&__int128 v110 = v23 + 7;
  uint64_t v33 = 1LL << *((_BYTE *)v23 + 32);
  uint64_t v34 = -1LL;
  if (v33 < 64) {
    uint64_t v34 = ~(-1LL << v33);
  }
  unint64_t v35 = v34 & v32;
  uint64_t v113 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_moc;
  int64_t v111 = (unint64_t)(v33 + 63) >> 6;
  *(void *)&__int128 v24 = 136446210LL;
  __int128 v109 = v24;
  v108 = (char *)&type metadata for Any + 8;
  while (1)
  {
    if (v35)
    {
      unint64_t v44 = __clz(__rbit64(v35));
      v35 &= v35 - 1;
      unint64_t v45 = v44 | (v22 << 6);
      goto LABEL_33;
    }

    int64_t v46 = v22 + 1;
    if (__OFADD__(v22, 1LL))
    {
      __break(1u);
LABEL_86:
      __break(1u);
      goto LABEL_87;
    }

    if (v46 >= v111) {
      goto LABEL_37;
    }
    unint64_t v47 = *(void *)(v110 + 8 * v46);
    ++v22;
    if (!v47)
    {
      uint64_t v22 = v46 + 1;
      if (v46 + 1 >= v111) {
        goto LABEL_37;
      }
      unint64_t v47 = *(void *)(v110 + 8 * v22);
      if (!v47)
      {
        uint64_t v22 = v46 + 2;
        if (v46 + 2 >= v111) {
          goto LABEL_37;
        }
        unint64_t v47 = *(void *)(v110 + 8 * v22);
        if (!v47) {
          break;
        }
      }
    }

LABEL_87:
  __break(1u);
LABEL_88:
  swift_once(&qword_100250ED8, sub_1001A5008);
LABEL_8:
  uint64_t v25 = type metadata accessor for Logger(0LL);
  uint64_t v26 = sub_100006BAC(v25, (uint64_t)qword_100257C18);
  uint64_t v27 = (os_log_s *)Logger.logObject.getter(v26);
  os_log_type_t v28 = ((uint64_t (*)(void))static os_log_type_t.info.getter)();
  if (os_log_type_enabled(v27, v28))
  {
    unint64_t v29 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unint64_t v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Not enforcing IDMS list changes", v29, 2u);
    swift_slowDealloc(v29, -1LL, -1LL);
  }

LABEL_38:
  uint64_t v61 = v112;
  if ((v112 & 0xC000000000000001LL) != 0)
  {
    if (v112 < 0) {
      uint64_t v62 = v112;
    }
    else {
      uint64_t v62 = v112 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v63 = __CocoaSet.makeIterator()(v62);
    uint64_t v64 = type metadata accessor for MachineMO();
    uint64_t v65 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    uint64_t v30 = Set.Iterator.init(_cocoa:)(v121, v63, v64, v65);
    uint64_t v61 = v121[0];
    uint64_t v66 = v121[1];
    uint64_t v67 = v121[2];
    uint64_t v68 = v121[3];
    unint64_t v69 = v121[4];
  }

  else
  {
    uint64_t v68 = 0LL;
    uint64_t v70 = -1LL << *(_BYTE *)(v112 + 32);
    uint64_t v66 = v112 + 56;
    uint64_t v71 = ~v70;
    uint64_t v72 = -v70;
    if (v72 < 64) {
      uint64_t v73 = ~(-1LL << v72);
    }
    else {
      uint64_t v73 = -1LL;
    }
    unint64_t v69 = v73 & *(void *)(v112 + 56);
    uint64_t v67 = v71;
  }

  uint64_t v116 = v61 & 0x7FFFFFFFFFFFFFFFLL;
  v108 = (char *)v67;
  int64_t v74 = (unint64_t)(v67 + 64) >> 6;
  *(void *)&__int128 v31 = 136446210LL;
  __int128 v110 = v31;
  *(void *)&__int128 v109 = v22 + 8;
  v114 = (char *)v74;
  v115 = (void (**)(char *, uint64_t))((char *)&type metadata for Swift.AnyObject + 8);
  int64_t v111 = v66;
  uint64_t v112 = v61;
  while (2)
  {
    if (v61 < 0)
    {
      uint64_t v77 = __CocoaSet.Iterator.next()(v30);
      if (!v77) {
        goto LABEL_84;
      }
      uint64_t v78 = v77;
      v120[0] = v77;
      uint64_t v79 = type metadata accessor for MachineMO();
      swift_unknownObjectRetain(v78, v80);
      swift_dynamicCast(v119, v120, v115, v79, 7LL);
      id v81 = (id)v119[0];
      swift_unknownObjectRelease(v78);
      uint64_t v76 = v68;
      uint64_t v22 = v69;
      if (!v81) {
        goto LABEL_84;
      }
      goto LABEL_72;
    }

    if (v69)
    {
      uint64_t v22 = (v69 - 1) & v69;
      unint64_t v75 = __clz(__rbit64(v69)) | (v68 << 6);
      uint64_t v76 = v68;
LABEL_71:
      id v81 = *(id *)(*(void *)(v61 + 48) + 8 * v75);
      if (!v81) {
        goto LABEL_84;
      }
LABEL_72:
      if (objc_msgSend(v81, "status", v107, v108) == (id)2)
      {
        id v85 = [v81 machineID];
        if (v85)
        {
          id v86 = v85;
          uint64_t v87 = static String._unconditionallyBridgeFromObjectiveC(_:)(v85);
          uint64_t v89 = v88;
        }

        else
        {
          uint64_t v87 = 0LL;
          uint64_t v89 = 0xE000000000000000LL;
        }

        char v90 = sub_10003B7F0(v87, v89, v107);
        swift_bridgeObjectRelease(v89);
        if ((v90 & 1) == 0)
        {
          if (qword_100250ED8 != -1) {
            swift_once(&qword_100250ED8, sub_1001A5008);
          }
          uint64_t v91 = type metadata accessor for Logger(0LL);
          sub_100006BAC(v91, (uint64_t)qword_100257C18);
          id v92 = v81;
          v93 = (os_log_s *)Logger.logObject.getter(v92);
          os_log_type_t v94 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v93, v94))
          {
            uint64_t v95 = swift_slowAlloc(12LL, -1LL);
            uint64_t v113 = swift_slowAlloc(32LL, -1LL);
            v120[0] = v113;
            *(_DWORD *)uint64_t v95 = v110;
            id v96 = [v92 machineID];
            if (v96)
            {
              int64_t v97 = v96;
              uint64_t v98 = static String._unconditionallyBridgeFromObjectiveC(_:)(v96);
              uint64_t v100 = v99;
            }

            else
            {
              uint64_t v98 = 0LL;
              uint64_t v100 = 0LL;
            }

            v119[0] = v98;
            v119[1] = v100;
            uint64_t v101 = sub_100007578((uint64_t *)&unk_100256C60);
            uint64_t v102 = String.init<A>(describing:)(v119, v101);
            unint64_t v104 = v103;
            *(void *)(v95 + 4) = sub_10017C4C4(v102, v103, v120);

            swift_bridgeObjectRelease(v104);
            _os_log_impl( (void *)&_mh_execute_header,  v93,  v94,  "Dropping knowledge of machineID %{public}s",  (uint8_t *)v95,  0xCu);
            uint64_t v105 = v113;
            swift_arrayDestroy(v113, 1LL, v109);
            swift_slowDealloc(v105, -1LL, -1LL);
            swift_slowDealloc(v95, -1LL, -1LL);

            uint64_t v66 = v111;
          }

          else
          {
          }

          [*(id *)&v118[v117] removeMachinesObject:v92];
          int64_t v74 = (int64_t)v114;
        }
      }

      uint64_t v68 = v76;
      unint64_t v69 = v22;
      uint64_t v61 = v112;
      continue;
    }

    break;
  }

  int64_t v82 = v68 + 1;
  if (__OFADD__(v68, 1LL)) {
    goto LABEL_86;
  }
  if (v82 >= v74) {
    goto LABEL_84;
  }
  unint64_t v83 = *(void *)(v66 + 8 * v82);
  uint64_t v76 = v68 + 1;
  if (v83) {
    goto LABEL_70;
  }
  uint64_t v76 = v68 + 2;
  if (v68 + 2 >= v74) {
    goto LABEL_84;
  }
  unint64_t v83 = *(void *)(v66 + 8 * v76);
  if (v83) {
    goto LABEL_70;
  }
  uint64_t v76 = v68 + 3;
  if (v68 + 3 >= v74) {
    goto LABEL_84;
  }
  unint64_t v83 = *(void *)(v66 + 8 * v76);
  if (v83) {
    goto LABEL_70;
  }
  uint64_t v76 = v68 + 4;
  if (v68 + 4 >= v74) {
    goto LABEL_84;
  }
  unint64_t v83 = *(void *)(v66 + 8 * v76);
  if (v83)
  {
LABEL_70:
    uint64_t v22 = (v83 - 1) & v83;
    unint64_t v75 = __clz(__rbit64(v83)) + (v76 << 6);
    goto LABEL_71;
  }

  uint64_t v84 = v68 + 5;
  while (v74 != v84)
  {
    unint64_t v83 = *(void *)(v66 + 8 * v84++);
    if (v83)
    {
      uint64_t v76 = v84 - 1;
      uint64_t v61 = v112;
      goto LABEL_70;
    }
  }

LABEL_84:
  sub_100172694(v112);
  return swift_bridgeObjectRelease(v107);
}

uint64_t sub_1001A4D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Container.SemaphoreWrapper();
  swift_allocObject(v5, 41LL, 7LL);
  unint64_t v6 = v2;
  uint64_t v7 = sub_100159634(v6, 0xD00000000000001ELL, 0x80000001001FB8D0LL);

  uint64_t v8 = (void *)swift_allocObject(&unk_10023D5B8, 40LL, 7LL);
  v8[2] = v7;
  v8[3] = a1;
  v8[4] = a2;
  uint64_t v9 = qword_100250ED8;
  swift_retain(v7);
  swift_retain(a2);
  if (v9 != -1) {
    swift_once(&qword_100250ED8, sub_1001A5008);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = sub_100006BAC(v10, (uint64_t)qword_100257C18);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.info.getter(v12);
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Fetching allowed machine IDs", v14, 2u);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  id v15 = *(void **)&v6[OBJC_IVAR____TtC18TrustedPeersHelper9Container_moc];
  uint64_t v16 = (void *)swift_allocObject(&unk_10023D5E0, 40LL, 7LL);
  v16[2] = v6;
  v16[3] = sub_1001AE560;
  v16[4] = v8;
  uint64_t v17 = swift_allocObject(&unk_10023D608, 32LL, 7LL);
  *(void *)(v17 + 16) = sub_1001AE598;
  *(void *)(v17 + 24) = v16;
  v23[4] = sub_100044980;
  uint64_t v24 = v17;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 1107296256LL;
  uint64_t v23[2] = sub_1000DC9F8;
  v23[3] = &unk_10023D620;
  uint64_t v18 = _Block_copy(v23);
  uint64_t v19 = v24;
  char v20 = v6;
  swift_retain(v8);
  swift_retain(v17);
  swift_release(v19);
  [v15 performBlockAndWait:v18];
  swift_release(v8);
  swift_release(v7);
  _Block_release(v18);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v17, "", 119LL, 628LL, 33LL, 1LL);
  swift_release(v16);
  uint64_t result = swift_release(v17);
  if ((isEscapingClosureAtFileLocation & 1) != 0) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1001A5008()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100006B6C(v0, qword_100257C18);
  sub_100006BAC(v0, (uint64_t)qword_100257C18);
  return Logger.init(subsystem:category:)( 0xD00000000000001FLL,  0x80000001001E7520LL,  0x69656E696863616DLL,  0xEA00000000007364LL);
}

BOOL sub_1001A5080(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100007578(&qword_100256D28);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  os_log_type_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11, v14);
  uint64_t v16 = (char *)&v24 - v15;
  id v17 = [v2 modified];
  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1LL, 1LL, v8);
    goto LABEL_5;
  }

  uint64_t v18 = v17;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v19(v7, v13, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0LL, 1LL, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8) == 1)
  {
LABEL_5:
    sub_1001AE34C((uint64_t)v7);
    return 0LL;
  }

  uint64_t v20 = ((uint64_t (*)(char *, char *, uint64_t))v19)(v16, v7, v8);
  Date.init(timeIntervalSinceNow:)(v20, (double)a1 * -3600.0);
  BOOL v21 = Date.compare(_:)(v13) == 1;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v13, v8);
  v22(v16, v8);
  return v21;
}

uint64_t sub_1001A5244()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100007578(&qword_100256D28);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)&v23 - v13;
  id v15 = [v1 modified];
  if (!v15)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1LL, 1LL, v6);
    goto LABEL_5;
  }

  uint64_t v16 = v15;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  id v17 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v17(v5, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0LL, 1LL, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6) == 1)
  {
LABEL_5:
    sub_1001AE34C((uint64_t)v5);
    return 0x6E776F6E6B6E75LL;
  }

  v17(v14, v5, v6);
  id v18 = [objc_allocWithZone(NSISO8601DateFormatter) init];
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v20 = [v18 stringFromDate:isa];

  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
  return v21;
}

uint64_t sub_1001A543C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100007578(&qword_100256D28);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)&v30 - v13;
  id v15 = [v1 machineID];
  if (v15)
  {
    uint64_t v16 = v15;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    unint64_t v18 = v17;
  }

  else
  {
    unint64_t v18 = 0xE700000000000000LL;
  }

  unint64_t v19 = (unint64_t)[v1 status];
  if ((v19 & 0x8000000000000000LL) == 0)
  {
    unint64_t v20 = v19;
    id v21 = [v1 modified];
    if (v21)
    {
      uint64_t v22 = v21;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v23(v5, v11, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0LL, 1LL, v6);
      uint64_t v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6);
      if ((_DWORD)v24 != 1)
      {
        v23(v14, v5, v6);
LABEL_10:
        id v25 = objc_allocWithZone(&OBJC_CLASS___TPMachineID);
        NSString v26 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v18);
        Class isa = Date._bridgeToObjectiveC()().super.isa;
        id v28 = [v25 initWithMachineID:v26 status:v20 modified:isa];

        (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
        return (uint64_t)v28;
      }
    }

    else
    {
      uint64_t v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1LL, 1LL, v6);
    }

    Date.init()(v24);
    sub_1001AE34C((uint64_t)v5);
    goto LABEL_10;
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Negative value is not representable",  35LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3451LL,  0);
  __break(1u);
  return result;
}

void sub_1001A56D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_100007578(&qword_100256C10);
  uint64_t inited = swift_initStackObject(v12, v30);
  *(_OWORD *)(inited + 16) = xmmword_1001DE710;
  v29[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecurityRTCFieldEgoMachineIDVanishedFromTDL);
  v29[1] = v14;
  AnyHashable.init<A>(_:)(v29, &type metadata for String, &protocol witness table for String);
  char v15 = *(_BYTE *)(v6 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_egoMachineIDVanished);
  *(void *)(inited + 96) = &type metadata for Bool;
  *(_BYTE *)(inited + 72) = v15;
  unint64_t v16 = sub_10000BE44(inited);
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecurityRTCEventNameMIDVanishedFromTDL);
  uint64_t v19 = v18;
  unint64_t v20 = (void *)kSecurityRTCEventCategoryAccountDataAccessRecovery;
  objc_allocWithZone(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  swift_bridgeObjectRetain(a6);
  id v21 = v20;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  id v22 = sub_10005F250(v16, a1, a2, a3, a4, a5, a6, v17, v19, 0, 1, v21);
  uint64_t v23 = (void *)objc_opt_self(&OBJC_CLASS___SecurityAnalyticsReporterRTC);
  unint64_t v24 = sub_100043F74();
  uint64_t v25 = swift_allocError(&type metadata for ContainerError, v24, 0LL, 0LL);
  *(_OWORD *)uint64_t v26 = xmmword_1001E6D10;
  *(_BYTE *)(v26 + 16) = 13;
  uint64_t v27 = (void *)_convertErrorToNSError(_:)(v25);
  swift_errorRelease();
  [v23 sendMetricWithEvent:v22 success:0 error:v27];
}

uint64_t sub_1001A58B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  if (qword_100250ED8 != -1) {
    swift_once(&qword_100250ED8, sub_1001A5008);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  sub_100006BAC(v5, (uint64_t)qword_100257C18);
  swift_errorRetain(a1);
  uint64_t v6 = swift_errorRetain(a1);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.info.getter(v7);
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v10 = swift_slowAlloc(32LL, -1LL);
    uint64_t v34 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v11 = (_TtC18TrustedPeersHelper6Client *)0xE700000000000000LL;
    if (a1)
    {
      uint64_t v32 = 0x203A726F727265LL;
      unint64_t v33 = 0xE700000000000000LL;
      uint64_t v31 = a1;
      swift_errorRetain(a1);
      swift_errorRetain(a1);
      uint64_t v12 = sub_100007578(&qword_100251D70);
      v13._countAndFlagsBits = String.init<A>(describing:)(&v31, v12);
      object = (_TtC18TrustedPeersHelper6Client *)v13._object;
      String.append(_:)(v13);
      swift_bridgeObjectRelease(object, v15, v16, v17, v18, v19, v20, v21);
      swift_errorRelease();
      uint64_t v22 = v32;
      uint64_t v11 = (_TtC18TrustedPeersHelper6Client *)v33;
    }

    else
    {
      uint64_t v22 = 0x73736563637573LL;
    }

    uint64_t v32 = sub_10017C4C4(v22, (unint64_t)v11, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v11, v23, v24, v25, v26, v27, v28, v29);
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "markTrustedDeviceListFetchFailed complete: %{public}s", v9, 0xCu);
    swift_arrayDestroy(v10, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_1000E3368(0xD000000000000028LL, 0x80000001001FAE30LL);
  return a3(a1);
}

uint64_t sub_1001A5B08(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  if (qword_100250ED8 != -1) {
    swift_once(&qword_100250ED8, sub_1001A5008);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_100006BAC(v4, (uint64_t)qword_100257C18);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter(v6);
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_log_type_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Setting honorIDMSListChanges to NO", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  id v9 = *(id *)(a1 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO);
  NSString v10 = String._bridgeToObjectiveC()();
  [v9 setHonorIDMSListChanges:v10];

  uint64_t v11 = *(void **)(a1 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_moc);
  id v40 = 0LL;
  unsigned int v12 = [v11 save:&v40];
  id v13 = v40;
  if (v12)
  {
    id v14 = v40;
    return a2(0LL);
  }

  else
  {
    id v16 = v40;
    uint64_t v17 = _convertNSErrorToError(_:)(v13);

    swift_willThrow(v18);
    swift_errorRetain(v17);
    uint64_t v19 = swift_errorRetain(v17);
    BOOL v20 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v24 = static os_log_type_t.error.getter(v20, v21, v22, v23);
    if (os_log_type_enabled(v20, v24))
    {
      int64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      id v26 = (void *)swift_slowAlloc(32LL, -1LL);
      id v40 = v26;
      *(_DWORD *)int64_t v25 = 136446210;
      uint64_t v38 = v17;
      swift_errorRetain(v17);
      uint64_t v27 = sub_100007578(&qword_100251D70);
      uint64_t v28 = String.init<A>(describing:)(&v38, v27);
      uint64_t v30 = (_TtC18TrustedPeersHelper6Client *)v29;
      uint64_t v38 = sub_10017C4C4(v28, v29, (uint64_t *)&v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease(v30, v31, v32, v33, v34, v35, v36, v37);
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl( (void *)&_mh_execute_header,  v20,  v24,  "Error marking machine ID list as unusable: %{public}s",  v25,  0xCu);
      swift_arrayDestroy(v26, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1LL, -1LL);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_errorRetain(v17);
    a2(v17);
    swift_errorRelease();
    return swift_errorRelease();
  }

uint64_t sub_1001A5E38(char a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, void))
{
  if (qword_100250ED8 != -1) {
    swift_once(&qword_100250ED8, sub_1001A5008);
  }
  uint64_t v7 = type metadata accessor for Logger(0LL);
  sub_100006BAC(v7, (uint64_t)qword_100257C18);
  swift_errorRetain(a2);
  uint64_t v8 = swift_errorRetain(a2);
  id v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.info.getter(v9);
  if (os_log_type_enabled(v9, v10))
  {
    int64_t v33 = a4;
    uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v12 = swift_slowAlloc(32LL, -1LL);
    uint64_t v37 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    id v13 = (_TtC18TrustedPeersHelper6Client *)0xE700000000000000LL;
    if (a2)
    {
      uint64_t v35 = 0x203A726F727265LL;
      unint64_t v36 = 0xE700000000000000LL;
      uint64_t v34 = a2;
      swift_errorRetain(a2);
      swift_errorRetain(a2);
      uint64_t v14 = sub_100007578(&qword_100251D70);
      v15._countAndFlagsBits = String.init<A>(describing:)(&v34, v14);
      object = (_TtC18TrustedPeersHelper6Client *)v15._object;
      String.append(_:)(v15);
      swift_bridgeObjectRelease(object, v17, v18, v19, v20, v21, v22, v23);
      swift_errorRelease();
      uint64_t v24 = v35;
      id v13 = (_TtC18TrustedPeersHelper6Client *)v36;
    }

    else
    {
      uint64_t v24 = 0x73736563637573LL;
    }

    uint64_t v35 = sub_10017C4C4(v24, (unint64_t)v13, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v13, v25, v26, v27, v28, v29, v30, v31);
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "setAllowedMachineIDs complete: %{public}s", v11, 0xCu);
    swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);

    a4 = v33;
  }

  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_1000E3368(0xD0000000000000E7LL, 0x80000001001FB8F0LL);
  return a4(a1 & 1, a2);
}

void sub_1001A609C( _BYTE *a1, _TtC18TrustedPeersHelper6Client *a2, uint64_t a3, uint64_t a4, _TtC18TrustedPeersHelper6Client *a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t a14, unint64_t a15, char a16, uint64_t a17, void *a18, void (*a19)(uint64_t, uint64_t), uint64_t a20)
{
  uint64_t v708 = a8;
  unint64_t v704 = a7;
  uint64_t v701 = a6;
  v711 = a5;
  uint64_t v697 = type metadata accessor for Date(0LL);
  uint64_t v696 = *(void *)(v697 - 8);
  __chkstk_darwin(v697, v24);
  v695 = (char *)&v693 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v726 = 0LL;
  v727 = 0LL;
  BOOL v717 = 0;
  uint64_t v712 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO;
  v713 = a1;
  id v26 = [*(id *)&a1[OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO] egoPeerID];
  p_vtable = &OBJC_CLASS___VoucherMO.vtable;
  v703 = a2;
  v709 = (_TtC18TrustedPeersHelper6Client *)a4;
  v710 = (_TtC18TrustedPeersHelper6Client *)a3;
  if (v26)
  {
    id v28 = v26;
    uint64_t v29 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_model;
    BOOL v30 = *(void **)&v713[OBJC_IVAR____TtC18TrustedPeersHelper9Container_model];
    id v722 = 0LL;
    id v31 = [v30 peerWithID:v28 error:&v722];
    id v32 = v31;
    if (v722)
    {
      id v33 = v722;

      swift_willThrow(v34);
      if (qword_100250ED8 != -1) {
        swift_once(&qword_100250ED8, sub_1001A5008);
      }
      uint64_t v35 = type metadata accessor for Logger(0LL);
      sub_100006BAC(v35, (uint64_t)qword_100257C18);
      id v36 = v33;
      uint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
      os_log_type_t v41 = static os_log_type_t.error.getter(v37, v38, v39, v40);
      if (os_log_type_enabled(v37, v41))
      {
        uint64_t v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        id v43 = (void *)swift_slowAlloc(32LL, -1LL);
        id v722 = v43;
        *(_DWORD *)uint64_t v42 = 136446210;
        uint64_t v720 = (uint64_t)v36;
        id v44 = v36;
        uint64_t v45 = sub_100007578(&qword_100251D70);
        uint64_t v46 = String.init<A>(describing:)(&v720, v45);
        int64_t v48 = (_TtC18TrustedPeersHelper6Client *)v47;
        uint64_t v720 = sub_10017C4C4(v46, v47, (uint64_t *)&v722);
        p_vtable = (void **)(&OBJC_CLASS___VoucherMO + 24);
        a2 = v703;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v720, &v721, v42 + 4, v42 + 12);

        uint64_t v49 = v48;
        a3 = (uint64_t)v710;
        swift_bridgeObjectRelease(v49, v50, v51, v52, v53, v54, v55, v56);
        _os_log_impl((void *)&_mh_execute_header, v37, v41, "Error getting ego peer from model: %{public}s", v42, 0xCu);
        swift_arrayDestroy(v43, 1LL, (char *)&type metadata for Any + 8);
        os_log_type_t v57 = v43;
        a4 = (uint64_t)v709;
        swift_slowDealloc(v57, -1LL, -1LL);
        swift_slowDealloc(v42, -1LL, -1LL);
      }

      else
      {
      }

      uint64_t v699 = 0LL;
    }

    else
    {
      uint64_t v699 = 0LL;
      if (v31)
      {
        id v58 = v31;
        id v59 = [v58 permanentInfo];
        id v60 = [v59 machineID];

        uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
        uint64_t v63 = v62;

        uint64_t v726 = v61;
        v727 = v63;
        uint64_t v64 = *(void **)&v713[v29];
        id v722 = 0LL;
        id v65 = v64;
        id v66 = [v65 statusOfPeerWithID:v28 error:&v722];

        if (v722)
        {
          id v67 = v722;
          swift_willThrow(v67);
          if (qword_100250ED8 != -1) {
            swift_once(&qword_100250ED8, sub_1001A5008);
          }
          uint64_t v68 = type metadata accessor for Logger(0LL);
          sub_100006BAC(v68, (uint64_t)qword_100257C18);
          id v69 = v67;
          uint64_t v70 = (os_log_s *)Logger.logObject.getter(v69);
          os_log_type_t v74 = static os_log_type_t.error.getter(v70, v71, v72, v73);
          if (os_log_type_enabled(v70, v74))
          {
            unint64_t v75 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v76 = (void *)swift_slowAlloc(8LL, -1LL);
            *(_DWORD *)unint64_t v75 = 138543362;
            id v77 = v69;
            uint64_t v78 = (void *)_swift_stdlib_bridgeErrorToNSError(v77);
            id v722 = v78;
            p_vtable = (void **)(&OBJC_CLASS___VoucherMO + 24);
            a2 = v703;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v722, &v723, v75 + 4, v75 + 12);
            *uint64_t v76 = v78;
            a3 = (uint64_t)v710;

            _os_log_impl((void *)&_mh_execute_header, v70, v74, "error calling statusOfPeer: %{public}@", v75, 0xCu);
            uint64_t v79 = sub_100007578(&qword_100250F90);
            swift_arrayDestroy(v76, 1LL, v79);
            swift_slowDealloc(v76, -1LL, -1LL);
            swift_slowDealloc(v75, -1LL, -1LL);
          }

          else
          {
          }

          uint64_t v699 = 0LL;
          a4 = (uint64_t)v709;
        }

        else
        {

          BOOL v692 = 0;
          if (v66 == (id)4)
          {
            a4 = (uint64_t)v709;
          }

          else
          {
            a4 = (uint64_t)v709;
            if (v66 != (id)32) {
              BOOL v692 = v66 != (id)128;
            }
          }

          BOOL v717 = v692;
        }
      }

      else
      {
        if (qword_100250ED8 != -1) {
          swift_once(&qword_100250ED8, sub_1001A5008);
        }
        uint64_t v684 = type metadata accessor for Logger(0LL);
        uint64_t v685 = sub_100006BAC(v684, (uint64_t)qword_100257C18);
        v686 = (os_log_s *)Logger.logObject.getter(v685);
        os_log_type_t v690 = static os_log_type_t.error.getter(v686, v687, v688, v689);
        if (os_log_type_enabled(v686, v690))
        {
          v691 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)v691 = 0;
          _os_log_impl((void *)&_mh_execute_header, v686, v690, "Couldn't find ego peer in model", v691, 2u);
          swift_slowDealloc(v691, -1LL, -1LL);
        }
      }
    }
  }

  else
  {
    uint64_t v699 = 0LL;
  }

  v716 = (_TtC18TrustedPeersHelper6Client *)&_swiftEmptySetSingleton;
  if (a2)
  {
    uint64_t v80 = swift_bridgeObjectRetain(a2);
    sub_1001A2A40(v80);
  }

  if (a3)
  {
    uint64_t v81 = swift_bridgeObjectRetain(a3);
    sub_1001A2A40(v81);
  }

  if (a4)
  {
    uint64_t v82 = swift_bridgeObjectRetain(a4);
    sub_1001A2A40(v82);
  }

  __int128 v83 = xmmword_1001E6D20;
  __int128 v725 = xmmword_1001E6D20;
  uint64_t v84 = v716;
  if (*(void *)v716->endpoint)
  {
    __int128 v707 = xmmword_1001E6D20;
    id v85 = (_TtC18TrustedPeersHelper6Client *)swift_bridgeObjectRetain(v716);
    id v86 = (void *)sub_1001AF130(v85);
    uint64_t v88 = v87;
    swift_bridgeObjectRelease(v84, v87, v89, v90, v91, v92, v93, v94);
    *(void *)&__int128 v725 = v86;
    *((void *)&v725 + 1) = v88;
    uint64_t v95 = p_vtable[475];
    swift_bridgeObjectRetain(v88);
    uint64_t v96 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v96, (uint64_t)qword_100257C18);
    uint64_t v97 = swift_bridgeObjectRetain(v88);
    uint64_t v98 = (os_log_s *)Logger.logObject.getter(v97);
    os_log_type_t v99 = static os_log_type_t.info.getter(v98);
    if (os_log_type_enabled(v98, v99))
    {
      uint64_t v100 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v101 = swift_slowAlloc(32LL, -1LL);
      uint64_t v720 = v101;
      *(_DWORD *)uint64_t v100 = 136446210;
      id v722 = v86;
      v723 = v88;
      swift_bridgeObjectRetain(v88);
      uint64_t v102 = sub_100007578((uint64_t *)&unk_100256C60);
      uint64_t v103 = String.init<A>(describing:)(&v722, v102);
      uint64_t v105 = (_TtC18TrustedPeersHelper6Client *)v104;
      id v722 = (id)sub_10017C4C4(v103, v104, &v720);
      p_vtable = (void **)(&OBJC_CLASS___VoucherMO + 24);
      a2 = v703;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v722, &v723, v100 + 4, v100 + 12);
      swift_bridgeObjectRelease_n(v88, 2LL);
      swift_bridgeObjectRelease(v105, v106, v107, v108, v109, v110, v111, v112);
      _os_log_impl((void *)&_mh_execute_header, v98, v99, "sha256 of deleted list: %{public}s", v100, 0xCu);
      swift_arrayDestroy(v101, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v101, -1LL, -1LL);
      swift_slowDealloc(v100, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v88, 2LL);
    }

    a3 = (uint64_t)v710;
    __int128 v83 = v707;
  }

  unint64_t v113 = a15;
  uint64_t v114 = a13;
  *(void *)&__int128 v707 = a12;
  uint64_t v706 = a11;
  uint64_t v705 = a10;
  __int128 v724 = v83;
  uint64_t v115 = *(void *)v711->endpoint;
  uint64_t v702 = a13;
  if (v115)
  {
    uint64_t v116 = (void *)sub_1001AF130(v711);
    v118 = v117;
    *(void *)&__int128 v724 = v116;
    *((void *)&v724 + 1) = v117;
    v119 = p_vtable[475];
    swift_bridgeObjectRetain(v117);
    uint64_t v120 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v120, (uint64_t)qword_100257C18);
    uint64_t v121 = swift_bridgeObjectRetain(v118);
    v122 = (os_log_s *)Logger.logObject.getter(v121);
    os_log_type_t v123 = static os_log_type_t.info.getter(v122);
    if (os_log_type_enabled(v122, v123))
    {
      v124 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v125 = swift_slowAlloc(32LL, -1LL);
      uint64_t v720 = v125;
      *(_DWORD *)v124 = 136446210;
      id v722 = v116;
      v723 = v118;
      swift_bridgeObjectRetain(v118);
      uint64_t v126 = sub_100007578((uint64_t *)&unk_100256C60);
      uint64_t v127 = String.init<A>(describing:)(&v722, v126);
      v129 = (_TtC18TrustedPeersHelper6Client *)v128;
      id v722 = (id)sub_10017C4C4(v127, v128, &v720);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v722, &v723, v124 + 4, v124 + 12);
      swift_bridgeObjectRelease_n(v118, 2LL);
      swift_bridgeObjectRelease(v129, v130, v131, v132, v133, v134, v135, v136);
      _os_log_impl((void *)&_mh_execute_header, v122, v123, "sha256 of allowed list: %{public}s", v124, 0xCu);
      swift_arrayDestroy(v125, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v137 = v125;
      a2 = v703;
      swift_slowDealloc(v137, -1LL, -1LL);
      swift_slowDealloc(v124, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v118, 2LL);
    }

    a3 = (uint64_t)v710;
    uint64_t v114 = v702;
  }

  uint64_t v138 = a9;
  uint64_t v700 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_testHashMismatchDetected;
  v713[OBJC_IVAR____TtC18TrustedPeersHelper9Container_testHashMismatchDetected] = 0;
  swift_beginAccess(&v724, &v722, 0LL, 0LL);
  if (!v704)
  {
    if (!*((void *)&v724 + 1)) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }

  if (!*((void *)&v724 + 1)
    || v724 != __PAIR128__(v704, v701)
    && (_stringCompareWithSmolCheck(_:_:expecting:)(v701, v704, v724, *((void *)&v724 + 1), 0LL) & 1) == 0)
  {
LABEL_42:
    uint64_t v139 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecurityRTCEventNameAllowedMIDHashMismatch);
    uint64_t v141 = v140;
    v142 = (void *)kSecurityRTCEventCategoryAccountDataAccessRecovery;
    objc_allocWithZone(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    swift_bridgeObjectRetain(v114);
    id v143 = v142;
    swift_bridgeObjectRetain(a9);
    uint64_t v144 = v706;
    swift_bridgeObjectRetain(v706);
    uint64_t v145 = v144;
    unint64_t v113 = a15;
    id v146 = sub_10005F250(0LL, v708, a9, v705, v145, v707, v114, v139, v141, 0, 1, v143);
    v147 = (void *)objc_opt_self(&OBJC_CLASS___SecurityAnalyticsReporterRTC);
    unint64_t v148 = sub_100043F74();
    uint64_t v149 = swift_allocError(&type metadata for ContainerError, v148, 0LL, 0LL);
    *(_OWORD *)uint64_t v150 = xmmword_1001E6D30;
    *(_BYTE *)(v150 + 16) = 13;
    v151 = (void *)_convertErrorToNSError(_:)(v149);
    swift_errorRelease();
    [v147 sendMetricWithEvent:v146 success:0 error:v151];

    v713[v700] = 1;
  }

LABEL_43:
  swift_beginAccess(&v725, &v720, 0LL, 0LL);
  unint64_t v704 = a9;
  if (v113)
  {
    if (*((void *)&v725 + 1)
      && (v725 == __PAIR128__(v113, a14)
       || (_stringCompareWithSmolCheck(_:_:expecting:)(a14, v113, v725, *((void *)&v725 + 1), 0LL) & 1) != 0))
    {
      goto LABEL_50;
    }
  }

  else if (!*((void *)&v725 + 1))
  {
    goto LABEL_50;
  }

  uint64_t v152 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecurityRTCEventNameDeletedMIDHashMismatch);
  uint64_t v154 = v153;
  v155 = (void *)kSecurityRTCEventCategoryAccountDataAccessRecovery;
  objc_allocWithZone(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  swift_bridgeObjectRetain(v114);
  id v156 = v155;
  swift_bridgeObjectRetain(a9);
  uint64_t v157 = v706;
  swift_bridgeObjectRetain(v706);
  uint64_t v158 = v157;
  uint64_t v138 = v704;
  id v159 = sub_10005F250(0LL, v708, v704, v705, v158, v707, v114, v152, v154, 0, 1, v156);
  v160 = (void *)objc_opt_self(&OBJC_CLASS___SecurityAnalyticsReporterRTC);
  unint64_t v161 = sub_100043F74();
  uint64_t v162 = swift_allocError(&type metadata for ContainerError, v161, 0LL, 0LL);
  *(_OWORD *)uint64_t v163 = xmmword_1001E6D40;
  *(_BYTE *)(v163 + 16) = 13;
  v164 = (void *)_convertErrorToNSError(_:)(v162);
  swift_errorRelease();
  [v160 sendMetricWithEvent:v159 success:0 error:v164];

  v713[v700] = 1;
LABEL_50:
  sub_1001AEBDC((uint64_t)v711, (uint64_t)a2, a3, (uint64_t)v709, v705, v706, v707, v114, v708, v138, 0);
  int v694 = v165;
  uint64_t v701 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_midVanishedFromTDL;
  v166 = v713;
  v713[OBJC_IVAR____TtC18TrustedPeersHelper9Container_midVanishedFromTDL] = 0;
  v166[OBJC_IVAR____TtC18TrustedPeersHelper9Container_egoMachineIDVanished] = 0;
  unsigned __int8 v715 = 0;
  uint64_t v167 = v712;
  if ((a16 & 1) != 0) {
    v168 = (_TtC18TrustedPeersHelper6Client *)0xE300000000000000LL;
  }
  else {
    v168 = (_TtC18TrustedPeersHelper6Client *)0xE200000000000000LL;
  }
  id v169 = *(id *)&v166[v712];
  NSString v170 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v168, v171, v172, v173, v174, v175, v176, v177);
  [v169 setHonorIDMSListChanges:v170];

  id v178 = [*(id *)&v166[v167] machines];
  v179 = (_TtC18TrustedPeersHelper6Client *)&_swiftEmptySetSingleton;
  if (v178)
  {
    v180 = v178;
    v719 = 0LL;
    uint64_t v181 = type metadata accessor for MachineMO();
    uint64_t v182 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    static Set._conditionallyBridgeFromObjectiveC(_:result:)(v180, &v719, v181, v182);

    if (v719) {
      v179 = v719;
    }
  }

  uint64_t v183 = swift_bridgeObjectRetain(v179);
  sub_1000DCA18(v183);
  v185 = v184;
  swift_bridgeObjectRelease(v179, v186, v187, v188, v189, v190, v191, v192);
  v193 = (_TtC18TrustedPeersHelper6Client *)sub_100161634((uint64_t)v185);
  swift_bridgeObjectRelease(v185, v194, v195, v196, v197, v198, v199, v200);
  v201 = v709;
  swift_bridgeObjectRetain(v709);
  swift_bridgeObjectRetain(v179);
  v202 = v711;
  swift_bridgeObjectRetain(v711);
  v203 = v713;
  v204 = v713;
  swift_bridgeObjectRetain(a2);
  v205 = v710;
  swift_bridgeObjectRetain(v710);
  sub_1001AD808( (uint64_t)v179,  (uint64_t)v202,  &v715,  (uint64_t)a2,  (uint64_t)v205,  (uint64_t)v204,  (uint64_t)v201,  &v717,  &v726);
  swift_bridgeObjectRelease(v179, v206, v207, v208, v209, v210, v211, v212);
  swift_bridgeObjectRelease(v202, v213, v214, v215, v216, v217, v218, v219);
  swift_bridgeObjectRelease(a2, v220, v221, v222, v223, v224, v225, v226);
  swift_bridgeObjectRelease(v205, v227, v228, v229, v230, v231, v232, v233);

  swift_bridgeObjectRelease(v201, v234, v235, v236, v237, v238, v239, v240);
  id v241 = [*(id *)&v203[v712] machines];
  if (v241)
  {
    v249 = v241;
    v718 = 0LL;
    uint64_t v250 = type metadata accessor for MachineMO();
    uint64_t v251 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    static Set._conditionallyBridgeFromObjectiveC(_:result:)(v249, &v718, v250, v251);

    v252 = v718;
    swift_bridgeObjectRelease(v179, v253, v254, v255, v256, v257, v258, v259);
    if (v252) {
      v260 = v252;
    }
    else {
      v260 = (_TtC18TrustedPeersHelper6Client *)&_swiftEmptySetSingleton;
    }
  }

  else
  {
    swift_bridgeObjectRelease(v179, v242, v243, v244, v245, v246, v247, v248);
    v260 = (_TtC18TrustedPeersHelper6Client *)&_swiftEmptySetSingleton;
  }

  v714 = v260;
  uint64_t v261 = swift_bridgeObjectRetain(v260);
  sub_1000DCA18(v261);
  v263 = v262;
  swift_bridgeObjectRelease(v260, v264, v265, v266, v267, v268, v269, v270);
  v271 = (_TtC18TrustedPeersHelper6Client *)sub_100161634((uint64_t)v263);
  swift_bridgeObjectRelease(v193, v272, v273, v274, v275, v276, v277, v278);
  swift_bridgeObjectRelease(v263, v279, v280, v281, v282, v283, v284, v285);
  v719 = v271;
  v286 = v204;
  sub_1001ACEDC((uint64_t)v711, &v719, (uint64_t)v286, &v715, (uint64_t)&v714, 1LL, "Newly trusted machine ID: %{public}s");

  id v287 = [*(id *)&v713[v712] machines];
  v295 = (_TtC18TrustedPeersHelper6Client *)&_swiftEmptySetSingleton;
  uint64_t v296 = v702;
  if (v287)
  {
    v297 = v287;
    v718 = 0LL;
    uint64_t v298 = type metadata accessor for MachineMO();
    uint64_t v299 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    static Set._conditionallyBridgeFromObjectiveC(_:result:)(v297, &v718, v298, v299);

    if (v718) {
      v295 = v718;
    }
  }

  swift_bridgeObjectRelease(v714, v288, v289, v290, v291, v292, v293, v294);
  v714 = v295;
  uint64_t v300 = swift_bridgeObjectRetain(v295);
  sub_1000DCA18(v300);
  v302 = v301;
  swift_bridgeObjectRelease(v295, v303, v304, v305, v306, v307, v308, v309);
  v310 = (_TtC18TrustedPeersHelper6Client *)sub_100161634((uint64_t)v302);
  swift_bridgeObjectRelease(v271, v311, v312, v313, v314, v315, v316, v317);
  swift_bridgeObjectRelease(v302, v318, v319, v320, v321, v322, v323, v324);
  v719 = v310;
  uint64_t v325 = (uint64_t)v703;
  if (v703)
  {
    v326 = v286;
    sub_1001ACEDC(v325, &v719, (uint64_t)v326, &v715, (uint64_t)&v714, 2LL, "Newly distrusted machine ID: %{public}s");
  }

  id v327 = [*(id *)&v713[v712] machines];
  v335 = (_TtC18TrustedPeersHelper6Client *)&_swiftEmptySetSingleton;
  if (v327)
  {
    v336 = v327;
    v718 = 0LL;
    uint64_t v337 = type metadata accessor for MachineMO();
    uint64_t v338 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    static Set._conditionallyBridgeFromObjectiveC(_:result:)(v336, &v718, v337, v338);

    if (v718) {
      v335 = v718;
    }
  }

  swift_bridgeObjectRelease(v714, v328, v329, v330, v331, v332, v333, v334);
  v714 = v335;
  uint64_t v339 = swift_bridgeObjectRetain(v335);
  sub_1000DCA18(v339);
  v341 = v340;
  swift_bridgeObjectRelease(v335, v342, v343, v344, v345, v346, v347, v348);
  v349 = (_TtC18TrustedPeersHelper6Client *)sub_100161634((uint64_t)v341);
  swift_bridgeObjectRelease(v310, v350, v351, v352, v353, v354, v355, v356);
  swift_bridgeObjectRelease(v341, v357, v358, v359, v360, v361, v362, v363);
  v719 = v349;
  uint64_t v364 = (uint64_t)v710;
  if (v710)
  {
    v365 = v286;
    sub_1001ACEDC(v364, &v719, (uint64_t)v365, &v715, (uint64_t)&v714, 3LL, "Newly evicted machine ID: %{public}s");
  }

  id v366 = [*(id *)&v713[v712] machines];
  v374 = (_TtC18TrustedPeersHelper6Client *)&_swiftEmptySetSingleton;
  if (v366)
  {
    v375 = v366;
    v718 = 0LL;
    uint64_t v376 = type metadata accessor for MachineMO();
    uint64_t v377 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    static Set._conditionallyBridgeFromObjectiveC(_:result:)(v375, &v718, v376, v377);

    if (v718) {
      v374 = v718;
    }
  }

  swift_bridgeObjectRelease(v714, v367, v368, v369, v370, v371, v372, v373);
  v714 = v374;
  uint64_t v378 = swift_bridgeObjectRetain(v374);
  sub_1000DCA18(v378);
  v380 = v379;
  swift_bridgeObjectRelease(v374, v381, v382, v383, v384, v385, v386, v387);
  v388 = (_TtC18TrustedPeersHelper6Client *)sub_100161634((uint64_t)v380);
  swift_bridgeObjectRelease(v349, v389, v390, v391, v392, v393, v394, v395);
  swift_bridgeObjectRelease(v380, v396, v397, v398, v399, v400, v401, v402);
  v719 = v388;
  uint64_t v403 = (uint64_t)v709;
  if (v709)
  {
    v404 = v286;
    sub_1001ACEDC( v403,  &v719,  (uint64_t)v404,  &v715,  (uint64_t)&v714,  4LL,  "Newly removed with unknown reason machine ID: %{public}s");
  }

  uint64_t v699 = a20;
  id v405 = [*(id *)&v713[v712] machines];
  v413 = (_TtC18TrustedPeersHelper6Client *)&_swiftEmptySetSingleton;
  if (v405)
  {
    v414 = v405;
    v718 = 0LL;
    uint64_t v415 = type metadata accessor for MachineMO();
    uint64_t v416 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    static Set._conditionallyBridgeFromObjectiveC(_:result:)(v414, &v718, v415, v416);

    if (v718) {
      v413 = v718;
    }
  }

  v698 = a19;
  swift_bridgeObjectRelease(v714, v406, v407, v408, v409, v410, v411, v412);
  v714 = v413;
  uint64_t v417 = swift_bridgeObjectRetain(v413);
  sub_1000DCA18(v417);
  v419 = v418;
  swift_bridgeObjectRelease(v413, v420, v421, v422, v423, v424, v425, v426);
  v427 = (_TtC18TrustedPeersHelper6Client *)sub_100161634((uint64_t)v419);
  swift_bridgeObjectRelease(v388, v428, v429, v430, v431, v432, v433, v434);
  swift_bridgeObjectRelease(v419, v435, v436, v437, v438, v439, v440, v441);
  v719 = v427;
  swift_bridgeObjectRetain(v413);
  char v442 = sub_1001AE38C();
  swift_bridgeObjectRelease(v413, v443, v444, v445, v446, v447, v448, v449);
  if ((v442 & 1) != 0)
  {
    v450 = *(void **)&v286[OBJC_IVAR____TtC18TrustedPeersHelper9Container_model];
    v718 = 0LL;
    id v451 = [v450 allMachineIDsWithError:&v718];
    v452 = v718;
    if (!v451)
    {
      v626 = (_TtC18TrustedPeersHelper6Client *)*((void *)&v724 + 1);
      v627 = v718;
      swift_bridgeObjectRelease(v626, v628, v629, v630, v631, v632, v633, v634);
      swift_bridgeObjectRelease( *((_TtC18TrustedPeersHelper6Client **)&v725 + 1),  v635,  v636,  v637,  v638,  v639,  v640,  v641);
      swift_bridgeObjectRelease(v716, v642, v643, v644, v645, v646, v647, v648);
      uint64_t v609 = _convertNSErrorToError(_:)(v452);

      swift_willThrow(v649);
      swift_bridgeObjectRelease(v413, v650, v651, v652, v653, v654, v655, v656);
      v625 = v427;
      goto LABEL_100;
    }

    v453 = v451;
    v454 = (_TtC18TrustedPeersHelper6Client *)static Set._unconditionallyBridgeFromObjectiveC(_:)( v451,  &type metadata for String,  &protocol witness table for String);
    v455 = v452;

    v456 = v703;
    swift_bridgeObjectRetain(v703);
    uint64_t v457 = (uint64_t)v710;
    swift_bridgeObjectRetain(v710);
    v458 = v709;
    swift_bridgeObjectRetain(v709);
    v459 = v711;
    swift_bridgeObjectRetain(v711);
    v460 = v286;
    sub_1001AD0E0((uint64_t)v454, &v719, (uint64_t)v459, v457, (uint64_t)v458, (uint64_t)v456, (uint64_t)v460, &v715);
    swift_bridgeObjectRelease(v459, v461, v462, v463, v464, v465, v466, v467);
    v468 = (_TtC18TrustedPeersHelper6Client *)v457;
    uint64_t v296 = v702;
    swift_bridgeObjectRelease(v468, v469, v470, v471, v472, v473, v474, v475);
    swift_bridgeObjectRelease(v458, v476, v477, v478, v479, v480, v481, v482);
    swift_bridgeObjectRelease(v456, v483, v484, v485, v486, v487, v488, v489);

    swift_bridgeObjectRelease( *((_TtC18TrustedPeersHelper6Client **)&v724 + 1),  v490,  v491,  v492,  v493,  v494,  v495,  v496);
    swift_bridgeObjectRelease( *((_TtC18TrustedPeersHelper6Client **)&v725 + 1),  v497,  v498,  v499,  v500,  v501,  v502,  v503);
    v504 = v716;
    swift_bridgeObjectRelease(v454, v505, v506, v507, v508, v509, v510, v511);
    v519 = v504;
    goto LABEL_87;
  }

  if (qword_100250ED8 != -1) {
    swift_once(&qword_100250ED8, sub_1001A5008);
  }
  uint64_t v520 = type metadata accessor for Logger(0LL);
  uint64_t v521 = sub_100006BAC(v520, (uint64_t)qword_100257C18);
  v522 = (void *)Logger.logObject.getter(v521);
  os_log_type_t v523 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled((os_log_t)v522, v523))
  {

    swift_bridgeObjectRelease( *((_TtC18TrustedPeersHelper6Client **)&v724 + 1),  v546,  v547,  v548,  v549,  v550,  v551,  v552);
    swift_bridgeObjectRelease( *((_TtC18TrustedPeersHelper6Client **)&v725 + 1),  v553,  v554,  v555,  v556,  v557,  v558,  v559);
    v519 = v716;
LABEL_87:
    swift_bridgeObjectRelease(v519, v512, v513, v514, v515, v516, v517, v518);
    goto LABEL_88;
  }

  v524 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
  *(_WORD *)v524 = 0;
  swift_bridgeObjectRelease(*((_TtC18TrustedPeersHelper6Client **)&v724 + 1), v525, v526, v527, v528, v529, v530, v531);
  swift_bridgeObjectRelease(*((_TtC18TrustedPeersHelper6Client **)&v725 + 1), v532, v533, v534, v535, v536, v537, v538);
  swift_bridgeObjectRelease(v716, v539, v540, v541, v542, v543, v544, v545);
  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v522,  v523,  "Believe we're in a demo account, not enforcing IDMS list",  v524,  2u);
  swift_slowDealloc(v524, -1LL, -1LL);

LABEL_88:
  NSString v560 = a18;
  v561 = *(void **)&v713[v712];
  id v562 = v561;
  if (a18) {
    NSString v560 = String._bridgeToObjectiveC()();
  }
  [v561 setIdmsTrustedDevicesVersion:v560];

  uint64_t v563 = v712;
  v564 = v713;
  id v565 = *(id *)&v713[v712];
  v566 = v695;
  Date.init()(v565);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v696 + 8))(v566, v697);
  [v565 setIdmsTrustedDeviceListFetchDate:isa];

  v568 = *(void **)&v564[v563];
  id v569 = objc_allocWithZone(&OBJC_CLASS___NSSet);
  id v570 = v568;
  id v571 = [v569 init];
  [v570 setAllowedMachineIDs:v571];

  if (v564[v701] == 1) {
    sub_1001A56D4(v708, v704, v705, v706, v707, v296);
  }
  uint64_t v572 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecurityRTCEventNameTDLProcessingSuccess);
  uint64_t v574 = v573;
  v575 = (void *)kSecurityRTCEventCategoryAccountDataAccessRecovery;
  objc_allocWithZone(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  swift_bridgeObjectRetain(v296);
  id v576 = v575;
  uint64_t v577 = v704;
  swift_bridgeObjectRetain(v704);
  uint64_t v578 = v706;
  swift_bridgeObjectRetain(v706);
  id v579 = sub_10005F250(0LL, v708, v577, v705, v578, v707, v296, v572, v574, 0, 1, v576);
  BOOL v580 = ((v713[v701] | v694) & 1) == 0 && v713[v700] != 1;
  [(id)objc_opt_self(SecurityAnalyticsReporterRTC) sendMetricWithEvent:v579 success:v580 error:0];
  v581 = *(void **)&v286[OBJC_IVAR____TtC18TrustedPeersHelper9Container_moc];
  id v582 = *(id *)&v713[v712];
  sub_100162BE4(v582, (uint64_t)v581);

  v718 = 0LL;
  unsigned int v583 = [v581 save:&v718];
  v584 = v718;
  if (v583)
  {
    uint64_t v585 = v715;
    v586 = v718;
    v698(v585, 0LL);

    swift_bridgeObjectRelease(v719, v587, v588, v589, v590, v591, v592, v593);
    swift_bridgeObjectRelease(v714, v594, v595, v596, v597, v598, v599, v600);
    swift_bridgeObjectRelease(v727, v601, v602, v603, v604, v605, v606, v607);
    return;
  }

  v608 = v718;
  uint64_t v609 = _convertNSErrorToError(_:)(v584);

  swift_willThrow(v610);
  swift_bridgeObjectRelease(v719, v611, v612, v613, v614, v615, v616, v617);
  v625 = v714;
LABEL_100:
  swift_bridgeObjectRelease(v625, v618, v619, v620, v621, v622, v623, v624);
  swift_bridgeObjectRelease(v727, v657, v658, v659, v660, v661, v662, v663);
  if (qword_100250ED8 != -1) {
    swift_once(&qword_100250ED8, sub_1001A5008);
  }
  uint64_t v664 = type metadata accessor for Logger(0LL);
  sub_100006BAC(v664, (uint64_t)qword_100257C18);
  swift_errorRetain(v609);
  uint64_t v665 = swift_errorRetain(v609);
  v666 = (os_log_s *)Logger.logObject.getter(v665);
  os_log_type_t v670 = static os_log_type_t.error.getter(v666, v667, v668, v669);
  if (os_log_type_enabled(v666, v670))
  {
    v671 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v672 = swift_slowAlloc(32LL, -1LL);
    uint64_t v726 = v672;
    *(_DWORD *)v671 = 136446210;
    *(void *)&__int128 v725 = v609;
    swift_errorRetain(v609);
    uint64_t v673 = sub_100007578(&qword_100251D70);
    uint64_t v674 = String.init<A>(describing:)(&v725, v673);
    v676 = (_TtC18TrustedPeersHelper6Client *)v675;
    *(void *)&__int128 v725 = sub_10017C4C4(v674, v675, &v726);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v725, (char *)&v725 + 8, v671 + 4, v671 + 12);
    swift_bridgeObjectRelease(v676, v677, v678, v679, v680, v681, v682, v683);
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v666, v670, "Error setting machine ID list: %{public}s", v671, 0xCu);
    swift_arrayDestroy(v672, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v672, -1LL, -1LL);
    swift_slowDealloc(v671, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_errorRetain(v609);
  v698(0LL, v609);
  swift_errorRelease();
  swift_errorRelease();
}

  __break(1u);
  return result;
}

          __break(1u);
          JUMPOUT(0x1001BAB08LL);
        }

void sub_1001A7D2C( id *a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8, uint64_t *a9)
{
  BOOL v510 = a3;
  uint64_t v514 = type metadata accessor for Date(0LL);
  uint64_t v512 = *(void *)(v514 - 8);
  __chkstk_darwin(v514, v17);
  v513 = (char *)&v508 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v515 = *a1;
  id v19 = [v515 machineID];
  if (!v19)
  {
    if (qword_100250ED8 != -1) {
      swift_once(&qword_100250ED8, sub_1001A5008);
    }
    uint64_t v43 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v43, (uint64_t)qword_100257C18);
    id v44 = v515;
    uint64_t v45 = (os_log_s *)Logger.logObject.getter(v44);
    os_log_type_t v46 = static os_log_type_t.info.getter(v45);
    if (os_log_type_enabled(v45, v46))
    {
      unint64_t v47 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      id v515 = (id)swift_slowAlloc(32LL, -1LL);
      uint64_t v516 = (uint64_t)v515;
      *(_DWORD *)unint64_t v47 = 136446210;
      uint64_t v514 = (uint64_t)(v47 + 4);
      id v48 = v44;
      id v49 = [v48 description];
      uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
      int64_t v52 = v51;

      uint64_t v518 = sub_10017C4C4(v50, (unint64_t)v52, &v516);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v518, &v519, v514, v47 + 12);

      swift_bridgeObjectRelease(v52, v53, v54, v55, v56, v57, v58, v59);
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "Machine has no ID: %{public}s", v47, 0xCu);
      id v60 = v515;
      swift_arrayDestroy(v515, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v60, -1LL, -1LL);
      swift_slowDealloc(v47, -1LL, -1LL);
    }

    else
    {
    }

    return;
  }

  id v20 = v19;
  uint64_t v511 = v9;
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
  BOOL v23 = v22;

  if ((sub_10003B7F0(v21, (uint64_t)v23, a2) & 1) != 0)
  {
    swift_bridgeObjectRelease(v23, v24, v25, v26, v27, v28, v29, v30);
    id v31 = v515;
    if ([v515 status] == (id)1)
    {
      if (qword_100250ED8 != -1) {
        swift_once(&qword_100250ED8, sub_1001A5008);
      }
      uint64_t v32 = type metadata accessor for Logger(0LL);
      sub_100006BAC(v32, (uint64_t)qword_100257C18);
      id v33 = v31;
      uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
      os_log_type_t v35 = static os_log_type_t.info.getter(v34);
      if (os_log_type_enabled(v34, v35))
      {
        id v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v37 = swift_slowAlloc(32LL, -1LL);
        uint64_t v518 = v37;
        *(_DWORD *)id v36 = 136446210;
        id v38 = [v33 machineID];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
          uint64_t v42 = v41;
        }

        else
        {
          uint64_t v40 = 0LL;
          uint64_t v42 = 0LL;
        }

        uint64_t v516 = v40;
        uint64_t v517 = v42;
        uint64_t v165 = sub_100007578((uint64_t *)&unk_100256C60);
        uint64_t v166 = String.init<A>(describing:)(&v516, v165);
        v168 = (_TtC18TrustedPeersHelper6Client *)v167;
        uint64_t v516 = sub_10017C4C4(v166, v167, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v36 + 4, v36 + 12);

        swift_bridgeObjectRelease(v168, v169, v170, v171, v172, v173, v174, v175);
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Machine ID still trusted: %{public}s", v36, 0xCu);
        swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v37, -1LL, -1LL);
        swift_slowDealloc(v36, -1LL, -1LL);

        id v31 = v515;
      }

      else
      {
      }
    }

    else
    {
      if (qword_100250ED8 != -1) {
        swift_once(&qword_100250ED8, sub_1001A5008);
      }
      uint64_t v117 = type metadata accessor for Logger(0LL);
      sub_100006BAC(v117, (uint64_t)qword_100257C18);
      id v118 = v31;
      v119 = (os_log_s *)Logger.logObject.getter(v118);
      os_log_type_t v120 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v119, v120))
      {
        uint64_t v121 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v122 = swift_slowAlloc(32LL, -1LL);
        uint64_t v518 = v122;
        *(_DWORD *)uint64_t v121 = 136446210;
        id v123 = [v118 machineID];
        if (v123)
        {
          v124 = v123;
          uint64_t v125 = static String._unconditionallyBridgeFromObjectiveC(_:)(v123);
          uint64_t v127 = v126;
        }

        else
        {
          uint64_t v125 = 0LL;
          uint64_t v127 = 0LL;
        }

        uint64_t v516 = v125;
        uint64_t v517 = v127;
        uint64_t v176 = sub_100007578((uint64_t *)&unk_100256C60);
        uint64_t v177 = String.init<A>(describing:)(&v516, v176);
        v179 = (_TtC18TrustedPeersHelper6Client *)v178;
        uint64_t v516 = sub_10017C4C4(v177, v178, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v121 + 4, v121 + 12);

        swift_bridgeObjectRelease(v179, v180, v181, v182, v183, v184, v185, v186);
        _os_log_impl((void *)&_mh_execute_header, v119, v120, "Machine ID newly retrusted: %{public}s", v121, 0xCu);
        swift_arrayDestroy(v122, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v122, -1LL, -1LL);
        swift_slowDealloc(v121, -1LL, -1LL);

        id v31 = v515;
      }

      else
      {
      }

      *BOOL v510 = 1;
    }

    [v31 setStatus:1];
    id v187 = [v31 setSeenOnFullList:1];
    int64_t v188 = v513;
    Date.init()(v187);
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v512 + 8))(v188, v514);
    [v31 setModified:isa];

    return;
  }

  id v61 = v515;
  if (!a4 || (sub_10003B7F0(v21, (uint64_t)v23, a4) & 1) == 0)
  {
    if (a5 && (sub_10003B7F0(v21, (uint64_t)v23, a5) & 1) != 0)
    {
      swift_bridgeObjectRelease(v23, v90, v91, v92, v93, v94, v95, v96);
      if (qword_100250ED8 != -1) {
        swift_once(&qword_100250ED8, sub_1001A5008);
      }
      uint64_t v97 = type metadata accessor for Logger(0LL);
      sub_100006BAC(v97, (uint64_t)qword_100257C18);
      id v70 = v61;
      uint64_t v98 = (os_log_s *)Logger.logObject.getter(v70);
      os_log_type_t v99 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v98, v99))
      {
        uint64_t v100 = swift_slowAlloc(22LL, -1LL);
        uint64_t v101 = swift_slowAlloc(64LL, -1LL);
        uint64_t v518 = v101;
        *(_DWORD *)uint64_t v100 = 136446466;
        uint64_t v102 = sub_1001A5244();
        unint64_t v104 = (_TtC18TrustedPeersHelper6Client *)v103;
        uint64_t v516 = sub_10017C4C4(v102, v103, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v100 + 4, v100 + 12);

        swift_bridgeObjectRelease(v104, v105, v106, v107, v108, v109, v110, v111);
        *(_WORD *)(v100 + 12) = 2082;
        id v112 = [v70 machineID];
        if (v112)
        {
          unint64_t v113 = v112;
          uint64_t v114 = static String._unconditionallyBridgeFromObjectiveC(_:)(v112);
          uint64_t v116 = v115;
        }

        else
        {
          uint64_t v114 = 0LL;
          uint64_t v116 = 0LL;
        }

        uint64_t v516 = v114;
        uint64_t v517 = v116;
        uint64_t v245 = sub_100007578((uint64_t *)&unk_100256C60);
        uint64_t v246 = String.init<A>(describing:)(&v516, v245);
        BOOL v248 = (_TtC18TrustedPeersHelper6Client *)v247;
        uint64_t v516 = sub_10017C4C4(v246, v247, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v100 + 14, v100 + 22);

        swift_bridgeObjectRelease(v248, v249, v250, v251, v252, v253, v254, v255);
        _os_log_impl( (void *)&_mh_execute_header,  v98,  v99,  "Evicted removal! machine ID last modified %{public}s; tagging as evicted: %{public}s",
          (uint8_t *)v100,
          0x16u);
        swift_arrayDestroy(v101, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v101, -1LL, -1LL);
        swift_slowDealloc(v100, -1LL, -1LL);
      }

      else
      {
      }

      if ([v70 status] != (id)3)
      {
        id v224 = [v70 setStatus:3];
        goto LABEL_130;
      }

      uint64_t v162 = "Evicted machine ID last modified %{public}s; leaving evicted: %{public}s";
      uint64_t v163 = "Evicted machine ID last modified %{public}s; distrusting: %{public}s";
      goto LABEL_87;
    }

    if (a7 && (sub_10003B7F0(v21, (uint64_t)v23, a7) & 1) != 0)
    {
      swift_bridgeObjectRelease(v23, v128, v129, v130, v131, v132, v133, v134);
      if (qword_100250ED8 != -1) {
        swift_once(&qword_100250ED8, sub_1001A5008);
      }
      uint64_t v135 = type metadata accessor for Logger(0LL);
      sub_100006BAC(v135, (uint64_t)qword_100257C18);
      id v70 = v61;
      BOOL v136 = (os_log_s *)Logger.logObject.getter(v70);
      os_log_type_t v137 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v136, v137))
      {
        uint64_t v138 = swift_slowAlloc(22LL, -1LL);
        uint64_t v139 = swift_slowAlloc(64LL, -1LL);
        uint64_t v518 = v139;
        *(_DWORD *)uint64_t v138 = 136446466;
        uint64_t v140 = sub_1001A5244();
        v142 = (_TtC18TrustedPeersHelper6Client *)v141;
        uint64_t v516 = sub_10017C4C4(v140, v141, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v138 + 4, v138 + 12);

        swift_bridgeObjectRelease(v142, v143, v144, v145, v146, v147, v148, v149);
        *(_WORD *)(v138 + 12) = 2082;
        id v150 = [v70 machineID];
        if (v150)
        {
          v151 = v150;
          uint64_t v152 = static String._unconditionallyBridgeFromObjectiveC(_:)(v150);
          uint64_t v154 = v153;
        }

        else
        {
          uint64_t v152 = 0LL;
          uint64_t v154 = 0LL;
        }

        uint64_t v516 = v152;
        uint64_t v517 = v154;
        uint64_t v256 = sub_100007578((uint64_t *)&unk_100256C60);
        uint64_t v257 = String.init<A>(describing:)(&v516, v256);
        BOOL v259 = (_TtC18TrustedPeersHelper6Client *)v258;
        uint64_t v516 = sub_10017C4C4(v257, v258, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v138 + 14, v138 + 22);

        swift_bridgeObjectRelease(v259, v260, v261, v262, v263, v264, v265, v266);
        _os_log_impl( (void *)&_mh_execute_header,  v136,  v137,  "Unknown reason removal! machine ID last modified %{public}s; tagging as unknown reason: %{public}s",
          (uint8_t *)v138,
          0x16u);
        swift_arrayDestroy(v139, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v139, -1LL, -1LL);
        swift_slowDealloc(v138, -1LL, -1LL);
      }

      else
      {
      }

      if ([v70 status] != (id)4)
      {
        id v224 = [v70 setStatus:4];
        goto LABEL_130;
      }

      uint64_t v162 = "Unknown reason machine ID last modified %{public}s; leaving unknown reason: %{public}s";
      uint64_t v163 = "Unknown reason machine ID last modified %{public}s; distrusting: %{public}s";
LABEL_87:
      v164 = v70;
      goto LABEL_88;
    }

    if (!sub_1001A5080(240LL)
      || ![v61 status]
      || [v61 status] == (id)5
      || [v61 status] == (id)2)
    {
      swift_bridgeObjectRelease(v23, v155, v156, v157, v158, v159, v160, v161);
      goto LABEL_45;
    }

    if (qword_100250ED8 != -1) {
      swift_once(&qword_100250ED8, sub_1001A5008);
    }
    uint64_t v267 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v267, (uint64_t)qword_100257C18);
    id v268 = v61;
    uint64_t v269 = swift_bridgeObjectRetain(v23);
    BOOL v270 = (os_log_s *)Logger.logObject.getter(v269);
    os_log_type_t v271 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v270, v271))
    {
      uint64_t v272 = swift_slowAlloc(22LL, -1LL);
      id v508 = (id)swift_slowAlloc(64LL, -1LL);
      uint64_t v516 = (uint64_t)v508;
      *(_DWORD *)uint64_t v272 = 136446466;
      uint64_t v509 = a6;
      os_log_type_t v273 = v271;
      swift_bridgeObjectRetain(v23);
      uint64_t v518 = sub_10017C4C4(v21, (unint64_t)v23, &v516);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v518, &v519, v272 + 4, v272 + 12);
      swift_bridgeObjectRelease_n(v23, 3LL);
      *(_WORD *)(v272 + 12) = 2080;
      uint64_t v274 = sub_1001A5244();
      id v276 = (_TtC18TrustedPeersHelper6Client *)v275;
      uint64_t v518 = sub_10017C4C4(v274, v275, &v516);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v518, &v519, v272 + 14, v272 + 22);

      swift_bridgeObjectRelease(v276, v277, v278, v279, v280, v281, v282, v283);
      os_log_type_t v284 = v273;
      a6 = v509;
      _os_log_impl( (void *)&_mh_execute_header,  v270,  v284,  "machineID that vanished: %{public}s, last modified : %s",  (uint8_t *)v272,  0x16u);
      id v285 = v508;
      swift_arrayDestroy(v508, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v285, -1LL, -1LL);
      swift_slowDealloc(v272, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v23, 2LL);
    }

    if (*a8 == 1)
    {
      BOOL v324 = (_TtC18TrustedPeersHelper6Client *)a9[1];
      if (v324)
      {
        uint64_t v325 = *a9;
        swift_bridgeObjectRetain(a9[1]);
        id v326 = [v268 machineID];
        if (v326)
        {
          BOOL v334 = v326;
          uint64_t v335 = static String._unconditionallyBridgeFromObjectiveC(_:)(v326);
          uint64_t v337 = v336;

          if (v325 == v335 && v324 == v337)
          {
            swift_bridgeObjectRelease(v337, v338, v339, v340, v341, v342, v343, v344);
            swift_bridgeObjectRelease(v324, v345, v346, v347, v348, v349, v350, v351);
            id v61 = v515;
LABEL_140:
            *(_BYTE *)(a6 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_egoMachineIDVanished) = 1;
            goto LABEL_141;
          }

          char v420 = _stringCompareWithSmolCheck(_:_:expecting:)(v325, v324, v335, v337, 0LL);
          swift_bridgeObjectRelease(v337, v421, v422, v423, v424, v425, v426, v427);
          swift_bridgeObjectRelease(v324, v428, v429, v430, v431, v432, v433, v434);
          id v61 = v515;
          if ((v420 & 1) != 0) {
            goto LABEL_140;
          }
        }

        else
        {
          swift_bridgeObjectRelease(v324, v327, v328, v329, v330, v331, v332, v333);
        }
      }
    }

LABEL_141:
    *(_BYTE *)(a6 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_midVanishedFromTDL) = 1;
LABEL_45:
    if ([v61 status] == (id)3)
    {
      uint64_t v162 = "Evicted machine ID last modified %{public}s; leaving evicted: %{public}s";
      uint64_t v163 = "Evicted machine ID last modified %{public}s; distrusting: %{public}s";
      v164 = v61;
LABEL_88:
      sub_1001AD2E8(v164, v510, v162, v163);
      return;
    }

    if ([v61 status] == (id)4)
    {
      uint64_t v162 = "Unknown reason machine ID last modified %{public}s; leaving unknown reason: %{public}s";
      uint64_t v163 = "Unknown reason machine ID last modified %{public}s; distrusting: %{public}s";
      v164 = v61;
      goto LABEL_88;
    }

    if ([v61 status] != (id)5)
    {
      if ([v61 status] == (id)1)
      {
        if (qword_100250ED8 != -1) {
          swift_once(&qword_100250ED8, sub_1001A5008);
        }
        uint64_t v225 = type metadata accessor for Logger(0LL);
        sub_100006BAC(v225, (uint64_t)qword_100257C18);
        id v70 = v61;
        BOOL v226 = (os_log_s *)Logger.logObject.getter(v70);
        os_log_type_t v227 = static os_log_type_t.info.getter(v226);
        if (os_log_type_enabled(v226, v227))
        {
          uint64_t v228 = swift_slowAlloc(22LL, -1LL);
          uint64_t v229 = swift_slowAlloc(64LL, -1LL);
          uint64_t v518 = v229;
          *(_DWORD *)uint64_t v228 = 136446466;
          uint64_t v230 = sub_1001A5244();
          BOOL v232 = (_TtC18TrustedPeersHelper6Client *)v231;
          uint64_t v516 = sub_10017C4C4(v230, v231, &v518);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v228 + 4, v228 + 12);

          swift_bridgeObjectRelease(v232, v233, v234, v235, v236, v237, v238, v239);
          *(_WORD *)(v228 + 12) = 2082;
          id v240 = [v70 machineID];
          if (v240)
          {
            id v241 = v240;
            uint64_t v242 = static String._unconditionallyBridgeFromObjectiveC(_:)(v240);
            uint64_t v244 = v243;
          }

          else
          {
            uint64_t v242 = 0LL;
            uint64_t v244 = 0LL;
          }

          uint64_t v516 = v242;
          uint64_t v517 = v244;
          uint64_t v386 = sub_100007578((uint64_t *)&unk_100256C60);
          uint64_t v387 = String.init<A>(describing:)(&v516, v386);
          SEL v389 = (_TtC18TrustedPeersHelper6Client *)v388;
          uint64_t v516 = sub_10017C4C4(v387, v388, &v518);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v228 + 14, v228 + 22);

          swift_bridgeObjectRelease(v389, v390, v391, v392, v393, v394, v395, v396);
          _os_log_impl( (void *)&_mh_execute_header,  v226,  v227,  "MachineID was allowed but no longer on the TDL, last modified %{public}s, tagging as ghosted fromt TDL: %{public}s",  (uint8_t *)v228,  0x16u);
          swift_arrayDestroy(v229, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v229, -1LL, -1LL);
          swift_slowDealloc(v228, -1LL, -1LL);
        }

        else
        {
        }

        id v224 = [v70 setStatus:5];
        goto LABEL_130;
      }

      if ([v61 status]) {
        return;
      }
      if (!sub_1001A5080(48LL))
      {
        if (qword_100250ED8 != -1) {
          swift_once(&qword_100250ED8, sub_1001A5008);
        }
        uint64_t v400 = type metadata accessor for Logger(0LL);
        sub_100006BAC(v400, (uint64_t)qword_100257C18);
        id v70 = v61;
        BOOL v401 = (os_log_s *)Logger.logObject.getter(v70);
        os_log_type_t v402 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v401, v402))
        {
          uint64_t v403 = swift_slowAlloc(22LL, -1LL);
          uint64_t v404 = swift_slowAlloc(64LL, -1LL);
          uint64_t v518 = v404;
          *(_DWORD *)uint64_t v403 = 136446466;
          uint64_t v405 = sub_1001A5244();
          v407 = (_TtC18TrustedPeersHelper6Client *)v406;
          uint64_t v516 = sub_10017C4C4(v405, v406, &v518);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v403 + 4, v403 + 12);

          swift_bridgeObjectRelease(v407, v408, v409, v410, v411, v412, v413, v414);
          *(_WORD *)(v403 + 12) = 2082;
          id v415 = [v70 machineID];
          if (v415)
          {
            uint64_t v416 = v415;
            uint64_t v417 = static String._unconditionallyBridgeFromObjectiveC(_:)(v415);
            uint64_t v419 = v418;
          }

          else
          {
            uint64_t v417 = 0LL;
            uint64_t v419 = 0LL;
          }

          uint64_t v516 = v417;
          uint64_t v517 = v419;
          uint64_t v497 = sub_100007578((uint64_t *)&unk_100256C60);
          uint64_t v498 = String.init<A>(describing:)(&v516, v497);
          id v500 = (_TtC18TrustedPeersHelper6Client *)v499;
          uint64_t v516 = sub_10017C4C4(v498, v499, &v518);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v403 + 14, v403 + 22);

          swift_bridgeObjectRelease(v500, v501, v502, v503, v504, v505, v506, v507);
          _os_log_impl( (void *)&_mh_execute_header,  v401,  v402,  "Unknown machine ID last modified %{public}s; distrusting: %{public}s",
            (uint8_t *)v403,
            0x16u);
          swift_arrayDestroy(v404, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v404, -1LL, -1LL);
          swift_slowDealloc(v403, -1LL, -1LL);
        }

        else
        {
        }

        goto LABEL_71;
      }

      if (qword_100250ED8 != -1) {
        swift_once(&qword_100250ED8, sub_1001A5008);
      }
      uint64_t v307 = type metadata accessor for Logger(0LL);
      sub_100006BAC(v307, (uint64_t)qword_100257C18);
      id v193 = v61;
      SEL v194 = (os_log_s *)Logger.logObject.getter(v193);
      os_log_type_t v308 = static os_log_type_t.info.getter(v194);
      if (os_log_type_enabled(v194, v308))
      {
        uint64_t v196 = swift_slowAlloc(22LL, -1LL);
        uint64_t v197 = swift_slowAlloc(64LL, -1LL);
        uint64_t v518 = v197;
        *(_DWORD *)uint64_t v196 = 136446466;
        uint64_t v309 = sub_1001A5244();
        SEL v311 = (_TtC18TrustedPeersHelper6Client *)v310;
        uint64_t v516 = sub_10017C4C4(v309, v310, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v196 + 4, v196 + 12);

        swift_bridgeObjectRelease(v311, v312, v313, v314, v315, v316, v317, v318);
        *(_WORD *)(v196 + 12) = 2082;
        id v319 = [v193 machineID];
        if (v319)
        {
          int64_t v320 = v319;
          uint64_t v321 = static String._unconditionallyBridgeFromObjectiveC(_:)(v319);
          uint64_t v323 = v322;
        }

        else
        {
          uint64_t v321 = 0LL;
          uint64_t v323 = 0LL;
        }

        uint64_t v516 = v321;
        uint64_t v517 = v323;
        uint64_t v486 = sub_100007578((uint64_t *)&unk_100256C60);
        uint64_t v487 = String.init<A>(describing:)(&v516, v486);
        BOOL v489 = (_TtC18TrustedPeersHelper6Client *)v488;
        uint64_t v516 = sub_10017C4C4(v487, v488, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v196 + 14, v196 + 22);

        swift_bridgeObjectRelease(v489, v490, v491, v492, v493, v494, v495, v496);
        os_log_type_t v446 = v308;
        id v447 = "Unknown machine ID last modified %{public}s; leaving unknown: %{public}s";
        goto LABEL_155;
      }

      goto LABEL_119;
    }

    BOOL v190 = sub_1001A5080(48LL);
    unsigned int v191 = [v61 seenOnFullList];
    if (v190)
    {
      if (v191)
      {
        if (qword_100250ED8 != -1) {
          swift_once(&qword_100250ED8, sub_1001A5008);
        }
        uint64_t v192 = type metadata accessor for Logger(0LL);
        sub_100006BAC(v192, (uint64_t)qword_100257C18);
        id v193 = v61;
        SEL v194 = (os_log_s *)Logger.logObject.getter(v193);
        os_log_type_t v195 = static os_log_type_t.info.getter(v194);
        if (os_log_type_enabled(v194, v195))
        {
          uint64_t v196 = swift_slowAlloc(22LL, -1LL);
          uint64_t v197 = swift_slowAlloc(64LL, -1LL);
          uint64_t v518 = v197;
          *(_DWORD *)uint64_t v196 = 136446466;
          uint64_t v198 = sub_1001A5244();
          BOOL v200 = (_TtC18TrustedPeersHelper6Client *)v199;
          uint64_t v516 = sub_10017C4C4(v198, v199, &v518);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v196 + 4, v196 + 12);

          swift_bridgeObjectRelease(v200, v201, v202, v203, v204, v205, v206, v207);
          *(_WORD *)(v196 + 12) = 2082;
          id v208 = [v193 machineID];
          if (v208)
          {
            id v209 = v208;
            uint64_t v210 = static String._unconditionallyBridgeFromObjectiveC(_:)(v208);
            uint64_t v212 = v211;
          }

          else
          {
            uint64_t v210 = 0LL;
            uint64_t v212 = 0LL;
          }

          uint64_t v516 = v210;
          uint64_t v517 = v212;
          uint64_t v435 = sub_100007578((uint64_t *)&unk_100256C60);
          uint64_t v436 = String.init<A>(describing:)(&v516, v435);
          id v438 = (_TtC18TrustedPeersHelper6Client *)v437;
          uint64_t v516 = sub_10017C4C4(v436, v437, &v518);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v196 + 14, v196 + 22);

          swift_bridgeObjectRelease(v438, v439, v440, v441, v442, v443, v444, v445);
          os_log_type_t v446 = v195;
          id v447 = "Seen on full list machine ID isn't on full list, last modified %{public}s, ignoring: %{public}s";
LABEL_155:
          _os_log_impl((void *)&_mh_execute_header, v194, v446, v447, (uint8_t *)v196, 0x16u);
          swift_arrayDestroy(v197, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v197, -1LL, -1LL);
          swift_slowDealloc(v196, -1LL, -1LL);

          return;
        }
      }

      else
      {
        if (qword_100250ED8 != -1) {
          swift_once(&qword_100250ED8, sub_1001A5008);
        }
        uint64_t v352 = type metadata accessor for Logger(0LL);
        sub_100006BAC(v352, (uint64_t)qword_100257C18);
        id v193 = v61;
        SEL v194 = (os_log_s *)Logger.logObject.getter(v193);
        os_log_type_t v353 = static os_log_type_t.info.getter(v194);
        if (os_log_type_enabled(v194, v353))
        {
          uint64_t v196 = swift_slowAlloc(22LL, -1LL);
          uint64_t v197 = swift_slowAlloc(64LL, -1LL);
          uint64_t v518 = v197;
          *(_DWORD *)uint64_t v196 = 136446466;
          uint64_t v354 = sub_1001A5244();
          BOOL v356 = (_TtC18TrustedPeersHelper6Client *)v355;
          uint64_t v516 = sub_10017C4C4(v354, v355, &v518);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v196 + 4, v196 + 12);

          swift_bridgeObjectRelease(v356, v357, v358, v359, v360, v361, v362, v363);
          *(_WORD *)(v196 + 12) = 2082;
          id v364 = [v193 machineID];
          if (v364)
          {
            v365 = v364;
            uint64_t v366 = static String._unconditionallyBridgeFromObjectiveC(_:)(v364);
            uint64_t v368 = v367;
          }

          else
          {
            uint64_t v366 = 0LL;
            uint64_t v368 = 0LL;
          }

          uint64_t v516 = v366;
          uint64_t v517 = v368;
          uint64_t v461 = sub_100007578((uint64_t *)&unk_100256C60);
          uint64_t v462 = String.init<A>(describing:)(&v516, v461);
          id v464 = (_TtC18TrustedPeersHelper6Client *)v463;
          uint64_t v516 = sub_10017C4C4(v462, v463, &v518);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v196 + 14, v196 + 22);

          swift_bridgeObjectRelease(v464, v465, v466, v467, v468, v469, v470, v471);
          os_log_type_t v446 = v353;
          id v447 = "Allowed-but-unseen machine ID isn't on full list, last modified %{public}s, ignoring: %{public}s";
          goto LABEL_155;
        }
      }

LABEL_119:
      return;
    }

    if (v191)
    {
      if (qword_100250ED8 != -1) {
        swift_once(&qword_100250ED8, sub_1001A5008);
      }
      uint64_t v286 = type metadata accessor for Logger(0LL);
      sub_100006BAC(v286, (uint64_t)qword_100257C18);
      id v287 = v61;
      v288 = (os_log_s *)Logger.logObject.getter(v287);
      os_log_type_t v289 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v288, v289))
      {
        uint64_t v290 = swift_slowAlloc(22LL, -1LL);
        uint64_t v291 = swift_slowAlloc(64LL, -1LL);
        uint64_t v518 = v291;
        *(_DWORD *)uint64_t v290 = 136446466;
        uint64_t v292 = sub_1001A5244();
        BOOL v294 = (_TtC18TrustedPeersHelper6Client *)v293;
        uint64_t v516 = sub_10017C4C4(v292, v293, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v290 + 4, v290 + 12);

        swift_bridgeObjectRelease(v294, v295, v296, v297, v298, v299, v300, v301);
        *(_WORD *)(v290 + 12) = 2082;
        id v302 = [v287 machineID];
        if (v302)
        {
          SEL v303 = v302;
          uint64_t v304 = static String._unconditionallyBridgeFromObjectiveC(_:)(v302);
          uint64_t v306 = v305;
        }

        else
        {
          uint64_t v304 = 0LL;
          uint64_t v306 = 0LL;
        }

        uint64_t v516 = v304;
        uint64_t v517 = v306;
        uint64_t v448 = sub_100007578((uint64_t *)&unk_100256C60);
        uint64_t v449 = String.init<A>(describing:)(&v516, v448);
        id v451 = (_TtC18TrustedPeersHelper6Client *)v450;
        uint64_t v516 = sub_10017C4C4(v449, v450, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v290 + 14, v290 + 22);

        swift_bridgeObjectRelease(v451, v452, v453, v454, v455, v456, v457, v458);
        os_log_type_t v459 = v289;
        v460 = "Seen on full list machine ID isn't on full list, last modified %{public}s, distrusting: %{public}s";
LABEL_150:
        _os_log_impl((void *)&_mh_execute_header, v288, v459, v460, (uint8_t *)v290, 0x16u);
        swift_arrayDestroy(v291, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v291, -1LL, -1LL);
        swift_slowDealloc(v290, -1LL, -1LL);

        id v61 = v515;
        goto LABEL_151;
      }
    }

    else
    {
      if (qword_100250ED8 != -1) {
        swift_once(&qword_100250ED8, sub_1001A5008);
      }
      uint64_t v369 = type metadata accessor for Logger(0LL);
      sub_100006BAC(v369, (uint64_t)qword_100257C18);
      id v287 = v61;
      v288 = (os_log_s *)Logger.logObject.getter(v287);
      os_log_type_t v370 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v288, v370))
      {
        uint64_t v290 = swift_slowAlloc(22LL, -1LL);
        uint64_t v291 = swift_slowAlloc(64LL, -1LL);
        uint64_t v518 = v291;
        *(_DWORD *)uint64_t v290 = 136446466;
        uint64_t v371 = sub_1001A5244();
        BOOL v373 = (_TtC18TrustedPeersHelper6Client *)v372;
        uint64_t v516 = sub_10017C4C4(v371, v372, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v290 + 4, v290 + 12);

        swift_bridgeObjectRelease(v373, v374, v375, v376, v377, v378, v379, v380);
        *(_WORD *)(v290 + 12) = 2082;
        id v381 = [v287 machineID];
        if (v381)
        {
          id v382 = v381;
          uint64_t v383 = static String._unconditionallyBridgeFromObjectiveC(_:)(v381);
          uint64_t v385 = v384;
        }

        else
        {
          uint64_t v383 = 0LL;
          uint64_t v385 = 0LL;
        }

        uint64_t v516 = v383;
        uint64_t v517 = v385;
        uint64_t v472 = sub_100007578((uint64_t *)&unk_100256C60);
        uint64_t v473 = String.init<A>(describing:)(&v516, v472);
        BOOL v475 = (_TtC18TrustedPeersHelper6Client *)v474;
        uint64_t v516 = sub_10017C4C4(v473, v474, &v518);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v290 + 14, v290 + 22);

        swift_bridgeObjectRelease(v475, v476, v477, v478, v479, v480, v481, v482);
        os_log_type_t v459 = v370;
        v460 = "Allowed-but-unseen machine ID isn't on full list, last modified %{public}s, distrusting: %{public}s";
        goto LABEL_150;
      }
    }

LABEL_151:
    id v483 = [v61 setStatus:2];
    id v484 = v513;
    Date.init()(v483);
    Class v485 = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v512 + 8))(v484, v514);
    [v61 setModified:v485];

    id v399 = v510;
    goto LABEL_131;
  }

  swift_bridgeObjectRelease(v23, v62, v63, v64, v65, v66, v67, v68);
  if (qword_100250ED8 != -1) {
    swift_once(&qword_100250ED8, sub_1001A5008);
  }
  uint64_t v69 = type metadata accessor for Logger(0LL);
  sub_100006BAC(v69, (uint64_t)qword_100257C18);
  id v70 = v61;
  uint64_t v71 = (os_log_s *)Logger.logObject.getter(v70);
  os_log_type_t v72 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v71, v72))
  {
    uint64_t v73 = swift_slowAlloc(22LL, -1LL);
    uint64_t v74 = swift_slowAlloc(64LL, -1LL);
    uint64_t v518 = v74;
    *(_DWORD *)uint64_t v73 = 136446466;
    uint64_t v75 = sub_1001A5244();
    id v77 = (_TtC18TrustedPeersHelper6Client *)v76;
    uint64_t v516 = sub_10017C4C4(v75, v76, &v518);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v73 + 4, v73 + 12);

    swift_bridgeObjectRelease(v77, v78, v79, v80, v81, v82, v83, v84);
    *(_WORD *)(v73 + 12) = 2082;
    id v85 = [v70 machineID];
    if (v85)
    {
      id v86 = v85;
      uint64_t v87 = static String._unconditionallyBridgeFromObjectiveC(_:)(v85);
      uint64_t v89 = v88;
    }

    else
    {
      uint64_t v87 = 0LL;
      uint64_t v89 = 0LL;
    }

    uint64_t v516 = v87;
    uint64_t v517 = v89;
    uint64_t v213 = sub_100007578((uint64_t *)&unk_100256C60);
    uint64_t v214 = String.init<A>(describing:)(&v516, v213);
    id v216 = (_TtC18TrustedPeersHelper6Client *)v215;
    uint64_t v516 = sub_10017C4C4(v214, v215, &v518);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v516, &v517, v73 + 14, v73 + 22);

    swift_bridgeObjectRelease(v216, v217, v218, v219, v220, v221, v222, v223);
    _os_log_impl( (void *)&_mh_execute_header,  v71,  v72,  "User initiated removal! machine ID last modified %{public}s; distrusting: %{public}s",
      (uint8_t *)v73,
      0x16u);
    swift_arrayDestroy(v74, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v74, -1LL, -1LL);
    swift_slowDealloc(v73, -1LL, -1LL);
  }

  else
  {
  }

  if ([v70 status] != (id)2)
  {
LABEL_71:
    id v224 = [v70 setStatus:2];
LABEL_130:
    id v397 = v513;
    Date.init()(v224);
    Class v398 = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v512 + 8))(v397, v514);
    [v70 setModified:v398];

    id v399 = v510;
LABEL_131:
    *id v399 = 1;
  }

void sub_1001A9C08( uint64_t *a1, _TtC18TrustedPeersHelper6Client **a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, const char *a7)
{
  id v56 = a7;
  uint64_t v57 = a6;
  BOOL v58 = a4;
  uint64_t v59 = a5;
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  Swift::String v15 = (char *)v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = *a1;
  uint64_t v16 = a1[1];
  uint64_t v18 = *a2;
  swift_bridgeObjectRetain(v18);
  char v19 = sub_10003B7F0(v17, v16, (uint64_t)v18);
  swift_bridgeObjectRelease(v18, v20, v21, v22, v23, v24, v25, v26);
  if ((v19 & 1) == 0)
  {
    v55[1] = v7;
    uint64_t v27 = type metadata accessor for MachineMO();
    id v28 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v27)) initWithContext:*(void *)(a3 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_moc)];
    NSString v29 = String._bridgeToObjectiveC()();
    [v28 setMachineID:v29];

    uint64_t v30 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO;
    [v28 setContainer:*(void *)(a3 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO)];
    Date.init()([v28 setSeenOnFullList:1]);
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    [v28 setModified:isa];

    [v28 setStatus:v57];
    uint64_t v32 = a3;
    if (qword_100250ED8 != -1) {
      swift_once(&qword_100250ED8, sub_1001A5008);
    }
    uint64_t v33 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v33, (uint64_t)qword_100257C18);
    id v34 = v28;
    os_log_type_t v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v55[0] = v30;
      uint64_t v57 = v32;
      uint64_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v38 = swift_slowAlloc(32LL, -1LL);
      uint64_t v62 = v38;
      *(_DWORD *)uint64_t v37 = 136446210;
      id v39 = [v34 machineID];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
        uint64_t v43 = v42;
      }

      else
      {
        uint64_t v41 = 0LL;
        uint64_t v43 = 0LL;
      }

      id v60 = v41;
      uint64_t v61 = v43;
      uint64_t v44 = sub_100007578((uint64_t *)&unk_100256C60);
      uint64_t v45 = String.init<A>(describing:)(&v60, v44);
      unint64_t v47 = (_TtC18TrustedPeersHelper6Client *)v46;
      id v60 = (id)sub_10017C4C4(v45, v46, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v37 + 4, v37 + 12);

      swift_bridgeObjectRelease(v47, v48, v49, v50, v51, v52, v53, v54);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, v56, v37, 0xCu);
      swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1LL, -1LL);
      swift_slowDealloc(v37, -1LL, -1LL);

      uint64_t v32 = v57;
      uint64_t v30 = v55[0];
    }

    else
    {
    }

    *BOOL v58 = 1;
    [*(id *)(v32 + v30) addMachinesObject:v34];
    sub_100151C24((Swift::Int *)&v60, v34);
  }

void sub_1001A9F98( uint64_t *a1, _TtC18TrustedPeersHelper6Client **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  uint64_t v44 = a7;
  uint64_t v43 = a8;
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v41 = *(void *)(v14 - 8);
  uint64_t v42 = v14;
  __chkstk_darwin(v14, v15);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = *a1;
  unint64_t v19 = a1[1];
  SEL v20 = *a2;
  swift_bridgeObjectRetain(v20);
  char v21 = sub_10003B7F0(v18, v19, (uint64_t)v20);
  swift_bridgeObjectRelease(v20, v22, v23, v24, v25, v26, v27, v28);
  if ((v21 & 1) == 0
    && (sub_10003B7F0(v18, v19, a3) & 1) == 0
    && (!a4 || (sub_10003B7F0(v18, v19, a4) & 1) == 0)
    && (!a5 || (sub_10003B7F0(v18, v19, a5) & 1) == 0)
    && (!a6 || (sub_10003B7F0(v18, v19, a6) & 1) == 0))
  {
    if (qword_100250ED8 != -1) {
      swift_once(&qword_100250ED8, sub_1001A5008);
    }
    uint64_t v29 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v29, (uint64_t)qword_100257C18);
    uint64_t v30 = swift_bridgeObjectRetain_n(v19, 2LL);
    id v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v34 = swift_slowAlloc(32LL, -1LL);
      uint64_t v47 = v34;
      *(_DWORD *)uint64_t v33 = 136446210;
      swift_bridgeObjectRetain(v19);
      uint64_t v45 = sub_10017C4C4(v18, v19, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v33 + 4, v33 + 12);
      swift_bridgeObjectRelease_n(v19, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "Peer machineID is unknown, beginning grace period: %{public}s",  v33,  0xCu);
      swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1LL, -1LL);
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v19, 2LL);
    }

    uint64_t v35 = type metadata accessor for MachineMO();
    uint64_t v36 = v44;
    id v37 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v35)) initWithContext:*(void *)(v44 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_moc)];
    NSString v38 = String._bridgeToObjectiveC()();
    [v37 setMachineID:v38];

    uint64_t v39 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO;
    [v37 setContainer:*(void *)(v36 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO)];
    Date.init()([v37 setSeenOnFullList:0]);
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v41 + 8))(v17, v42);
    [v37 setModified:isa];

    [v37 setStatus:0];
    *uint64_t v43 = 1;
    [*(id *)(v36 + v39) addMachinesObject:v37];
  }

uint64_t sub_1001AA324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, void))
{
  if (qword_100250ED8 != -1) {
    swift_once(&qword_100250ED8, sub_1001A5008);
  }
  uint64_t v7 = type metadata accessor for Logger(0LL);
  sub_100006BAC(v7, (uint64_t)qword_100257C18);
  swift_errorRetain(a2);
  uint64_t v8 = swift_errorRetain(a2);
  uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.info.getter(v9);
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v33 = a4;
    uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v12 = swift_slowAlloc(32LL, -1LL);
    uint64_t v37 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v13 = (_TtC18TrustedPeersHelper6Client *)0xE700000000000000LL;
    if (a2)
    {
      uint64_t v35 = 0x203A726F727265LL;
      unint64_t v36 = 0xE700000000000000LL;
      uint64_t v34 = a2;
      swift_errorRetain(a2);
      swift_errorRetain(a2);
      uint64_t v14 = sub_100007578(&qword_100251D70);
      v15._countAndFlagsBits = String.init<A>(describing:)(&v34, v14);
      object = (_TtC18TrustedPeersHelper6Client *)v15._object;
      String.append(_:)(v15);
      swift_bridgeObjectRelease(object, v17, v18, v19, v20, v21, v22, v23);
      swift_errorRelease();
      uint64_t v24 = v35;
      uint64_t v13 = (_TtC18TrustedPeersHelper6Client *)v36;
    }

    else
    {
      uint64_t v24 = 0x73736563637573LL;
    }

    uint64_t v35 = sub_10017C4C4(v24, (unint64_t)v13, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v13, v25, v26, v27, v28, v29, v30, v31);
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "fetchAllowedMachineIDs complete: %{public}s", v11, 0xCu);
    swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);

    a4 = v33;
  }

  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_1000E3368(0xD00000000000001ELL, 0x80000001001FB8D0LL);
  return a4(a1, a2);
}

void sub_1001AA588(uint64_t a1, void (*a2)(_TtC18TrustedPeersHelper6Client *, void))
{
  id v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO), "machines"));
  if (!v3
    || (uint64_t v11 = v3,
        uint64_t v53 = 0LL,
        uint64_t v12 = type metadata accessor for MachineMO(),
        uint64_t v13 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject),  static Set._conditionallyBridgeFromObjectiveC(_:result:)(v11, &v53, v12, v13),  v11,  (v14 = v53) == 0))
  {
    swift_bridgeObjectRelease(0LL, v4, v5, v6, v7, v8, v9, v10);
    uint64_t v14 = (uint64_t)&_swiftEmptySetSingleton;
LABEL_25:
    Swift::String v15 = (void *)sub_1001502FC(v14, (uint64_t (*)(char *, unint64_t, uint64_t))sub_1001AB410);
    goto LABEL_28;
  }

  if ((v53 & 0xC000000000000001LL) == 0) {
    goto LABEL_25;
  }
LABEL_4:
  Swift::String v15 = &_swiftEmptySetSingleton;
  uint64_t v53 = (uint64_t)&_swiftEmptySetSingleton;
  if (v14 >= 0) {
    v14 &= 0xFFFFFFFFFFFFFF8uLL;
  }
  uint64_t v16 = __CocoaSet.makeIterator()(v14);
  uint64_t v17 = __CocoaSet.Iterator.next()(v16);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = type metadata accessor for MachineMO();
    do
    {
      uint64_t v51 = v18;
      swift_dynamicCast(v52, &v51, (char *)&type metadata for Swift.AnyObject + 8, v19, 7LL);
      id v21 = [v52[0] status];
      id v22 = v52[0];
      if (v21 == (id)1)
      {
        uint64_t v23 = v53;
        unint64_t v24 = *(void *)(v53 + 16);
        if (*(void *)(v53 + 24) <= v24)
        {
          sub_10014FD58(v24 + 1);
          uint64_t v23 = v53;
        }

        Swift::Int v20 = NSObject._rawHashValue(seed:)(*(void *)(v23 + 40));
        uint64_t v25 = v23 + 56;
        uint64_t v26 = -1LL << *(_BYTE *)(v23 + 32);
        unint64_t v27 = v20 & ~v26;
        unint64_t v28 = v27 >> 6;
        if (((-1LL << v27) & ~*(void *)(v23 + 56 + 8 * (v27 >> 6))) != 0)
        {
          unint64_t v29 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v23 + 56 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v30 = 0;
          unint64_t v31 = (unint64_t)(63 - v26) >> 6;
          do
          {
            if (++v28 == v31 && (v30 & 1) != 0)
            {
              __break(1u);
              return;
            }

            BOOL v32 = v28 == v31;
            if (v28 == v31) {
              unint64_t v28 = 0LL;
            }
            v30 |= v32;
            uint64_t v33 = *(void *)(v25 + 8 * v28);
          }

          while (v33 == -1);
          unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
        }

        *(void *)(v25 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v29;
        *(void *)(*(void *)(v23 + 48) + 8 * v29) = v22;
        ++*(void *)(v23 + 16);
      }

      else
      {
      }

      uint64_t v18 = __CocoaSet.Iterator.next()(v20);
    }

    while (v18);
    Swift::String v15 = (void *)v53;
  }

  swift_release(v16);
LABEL_28:
  sub_1000DCA18((uint64_t)v15);
  uint64_t v35 = v34;
  swift_release(v15);
  unint64_t v36 = (_TtC18TrustedPeersHelper6Client *)sub_100161634((uint64_t)v35);
  swift_bridgeObjectRelease(v35, v37, v38, v39, v40, v41, v42, v43);
  a2(v36, 0LL);
  swift_bridgeObjectRelease(v36, v44, v45, v46, v47, v48, v49, v50);
}

void sub_1001AA864(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *a1;
  unint64_t v4 = a1[1];
  id v6 = *(id *)(a2 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_model);
  NSString v7 = String._bridgeToObjectiveC()();
  id v32 = 0LL;
  id v8 = [v6 peerWithID:v7 error:&v32];

  if (v32)
  {
    id v9 = v32;

    swift_willThrow(v10);
    if (qword_100250ED8 != -1) {
      swift_once(&qword_100250ED8, sub_1001A5008);
    }
    uint64_t v11 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v11, (uint64_t)qword_100257C18);
    swift_bridgeObjectRetain_n(v4, 2LL);
    id v12 = v9;
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v17 = static os_log_type_t.error.getter(v13, v14, v15, v16);
    if (os_log_type_enabled(v13, v17))
    {
      uint64_t v18 = swift_slowAlloc(22LL, -1LL);
      char v30 = a3;
      uint64_t v19 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      Swift::Int v20 = (void *)swift_slowAlloc(32LL, -1LL);
      id v32 = v20;
      *(_DWORD *)uint64_t v18 = 136446466;
      swift_bridgeObjectRetain(v4);
      uint64_t v31 = sub_10017C4C4(v5, v4, (uint64_t *)&v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v18 + 4, v18 + 12);
      swift_bridgeObjectRelease_n(v4, 3LL);
      *(_WORD *)(v18 + 12) = 2114;
      id v21 = v12;
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError(v21);
      uint64_t v31 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v18 + 14, v18 + 22);
      *uint64_t v19 = v22;

      _os_log_impl( (void *)&_mh_execute_header,  v13,  v17,  "Error getting peer with machineID %{public}s: %{public}@",  (uint8_t *)v18,  0x16u);
      uint64_t v23 = sub_100007578(&qword_100250F90);
      swift_arrayDestroy(v19, 1LL, v23);
      unint64_t v24 = v19;
      a3 = v30;
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1LL, -1LL);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v4, 2LL);
    }
  }

  else if (v8)
  {
    id v25 = [v8 permanentInfo];

    id v26 = [v25 machineID];
    uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    uint64_t v29 = v28;

    *a3 = v27;
    a3[1] = v29;
    return;
  }

  *a3 = 0LL;
  a3[1] = 0LL;
}

uint64_t sub_1001AABB8(uint64_t a1, uint64_t a2)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v5 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v5 += a1 - result;
  }

  BOOL v6 = __OFSUB__(a2, a1);
  uint64_t v7 = a2 - a1;
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v8 = __DataStorage._length.getter();
  if (v8 >= v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = v5 + v9;
  if (v5) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0LL;
  }
  uint64_t v12 = type metadata accessor for SHA256(0LL);
  uint64_t v13 = sub_1000077B8( &qword_100257C50,  (uint64_t (*)(uint64_t))&type metadata accessor for SHA256,  (uint64_t)&protocol conformance descriptor for SHA256);
  return dispatch thunk of HashFunction.update(bufferPointer:)(v5, v11, v12, v13);
}

void sub_1001AAC7C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v94 = a2;
  BOOL v95 = a1;
  uint64_t v4 = sub_100007578(&qword_100256D28);
  uint64_t v6 = __chkstk_darwin(v4, v5);
  uint64_t v8 = (char *)&v93 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v6, v9);
  uint64_t v101 = (char *)&v93 - v11;
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v15 = (char *)&v93 - v14;
  __chkstk_darwin(v13, v16);
  uint64_t v18 = (char *)&v93 - v17;
  uint64_t v19 = type metadata accessor for Date(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v22 = __chkstk_darwin(v19, v21);
  uint64_t v97 = (char *)&v93 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = __chkstk_darwin(v22, v24);
  uint64_t v100 = (char *)&v93 - v26;
  uint64_t v28 = __chkstk_darwin(v25, v27);
  os_log_type_t v99 = (char *)&v93 - v29;
  uint64_t v31 = __chkstk_darwin(v28, v30);
  int64_t v107 = (char *)&v93 - v32;
  uint64_t v34 = __chkstk_darwin(v31, v33);
  uint64_t v98 = (char *)&v93 - v35;
  uint64_t v96 = 0LL;
  int64_t v36 = 0LL;
  uint64_t v104 = a3;
  uint64_t v39 = *(void *)(a3 + 56);
  uint64_t v38 = a3 + 56;
  uint64_t v37 = v39;
  uint64_t v40 = 1LL << *(_BYTE *)(v38 - 24);
  uint64_t v41 = -1LL;
  if (v40 < 64) {
    uint64_t v41 = ~(-1LL << v40);
  }
  unint64_t v42 = v41 & v37;
  uint64_t v102 = v38;
  int64_t v103 = (unint64_t)(v40 + 63) >> 6;
  BOOL v43 = &selRef_setAllSelves_;
  id v106 = v8;
  uint64_t v110 = v34;
  while (v42)
  {
    uint64_t v108 = (v42 - 1) & v42;
    int64_t v109 = v36;
    unint64_t v44 = __clz(__rbit64(v42)) | (v36 << 6);
LABEL_21:
    uint64_t v49 = *(void *)(v104 + 48);
    unint64_t v105 = v44;
    id v50 = *(id *)(v49 + 8 * v44);
    if (![v50 v43[147]])
    {
      id v51 = [v50 modified];
      if (!v51)
      {
        uint64_t v66 = (uint64_t)v8;
        goto LABEL_45;
      }

      id v52 = v51;
      uint64_t v53 = v107;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      BOOL v54 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
      v54(v8, v53, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v8, 0LL, 1LL, v19);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v8, 1LL, v19) == 1)
      {
        uint64_t v66 = (uint64_t)v8;
        goto LABEL_46;
      }

      int64_t v55 = v97;
      uint64_t v56 = ((uint64_t (*)(char *, char *, uint64_t))v54)(v97, v8, v19);
      Date.init(timeIntervalSinceNow:)(v56, -172800.0);
      uint64_t v57 = Date.compare(_:)(v53);
      BOOL v58 = *(void (**)(char *, uint64_t))(v20 + 8);
      v58(v53, v19);
      uint64_t v59 = v55;
      BOOL v43 = &selRef_setAllSelves_;
      v58(v59, v19);
      uint64_t v8 = v106;
      if (v57 != 1) {
        goto LABEL_47;
      }
    }

    if ([v50 v43[147]] == (id)3)
    {
      id v60 = [v50 modified];
      if (!v60)
      {
        uint64_t v66 = (uint64_t)v101;
LABEL_45:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v66, 1LL, 1LL, v19);
        goto LABEL_46;
      }

      uint64_t v61 = v60;
      uint64_t v62 = v18;
      uint64_t v63 = v15;
      int64_t v64 = v107;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      id v65 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
      uint64_t v66 = (uint64_t)v101;
      v65(v101, v64, v19);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56))(v66, 0LL, 1LL, v19);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v66, 1LL, v19) == 1)
      {
        uint64_t v15 = v63;
        uint64_t v18 = v62;
        BOOL v43 = &selRef_setAllSelves_;
LABEL_46:
        sub_1001AE34C(v66);
        goto LABEL_47;
      }

      uint64_t v67 = v20;
      BOOL v68 = v100;
      uint64_t v69 = ((uint64_t (*)(char *, uint64_t, uint64_t))v65)(v100, v66, v110);
      Date.init(timeIntervalSinceNow:)(v69, -172800.0);
      uint64_t v70 = Date.compare(_:)(v64);
      uint64_t v71 = *(void (**)(char *, uint64_t))(v67 + 8);
      v71(v64, v110);
      os_log_type_t v72 = v68;
      uint64_t v20 = v67;
      uint64_t v19 = v110;
      v71(v72, v110);
      uint64_t v8 = v106;
      uint64_t v15 = v63;
      uint64_t v18 = v62;
      BOOL v43 = &selRef_setAllSelves_;
      if (v70 != 1) {
        goto LABEL_47;
      }
    }

    if ([v50 v43[147]] == (id)4)
    {
      id v73 = [v50 modified];
      if (!v73)
      {
        uint64_t v66 = (uint64_t)v15;
        goto LABEL_45;
      }

      uint64_t v74 = v73;
      uint64_t v75 = v107;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      unint64_t v76 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
      v76(v15, v75, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v15, 0LL, 1LL, v19);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v15, 1LL, v19) == 1)
      {
        uint64_t v66 = (uint64_t)v15;
        goto LABEL_46;
      }

      id v77 = v99;
      uint64_t v78 = ((uint64_t (*)(char *, char *, uint64_t))v76)(v99, v15, v110);
      Date.init(timeIntervalSinceNow:)(v78, -172800.0);
      uint64_t v79 = Date.compare(_:)(v75);
      int64_t v80 = *(void (**)(char *, uint64_t))(v20 + 8);
      v80(v75, v110);
      id v81 = v77;
      uint64_t v19 = v110;
      v80(v81, v110);
      uint64_t v8 = v106;
      if (v79 == 1) {
        goto LABEL_33;
      }
LABEL_47:

      unint64_t v42 = v108;
      int64_t v36 = v109;
LABEL_48:
      *(unint64_t *)((char *)v95 + ((v105 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v105;
      if (__OFADD__(v96++, 1LL)) {
        goto LABEL_54;
      }
    }

    else
    {
LABEL_33:
      if ([v50 v43[147]] == (id)5)
      {
        id v82 = [v50 modified];
        if (!v82)
        {
          uint64_t v66 = (uint64_t)v18;
          goto LABEL_45;
        }

        BOOL v83 = v82;
        BOOL v84 = v107;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        id v85 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
        v85(v18, v84, v19);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v18, 0LL, 1LL, v19);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1LL, v19) == 1)
        {
          uint64_t v66 = (uint64_t)v18;
          goto LABEL_46;
        }

        id v86 = v98;
        uint64_t v87 = ((uint64_t (*)(char *, char *, uint64_t))v85)(v98, v18, v19);
        Date.init(timeIntervalSinceNow:)(v87, -172800.0);
        uint64_t v88 = Date.compare(_:)(v84);
        uint64_t v89 = *(void (**)(char *, uint64_t))(v20 + 8);
        v89(v84, v19);
        int64_t v90 = v86;
        BOOL v43 = &selRef_setAllSelves_;
        v89(v90, v19);
        uint64_t v8 = v106;

        unint64_t v42 = v108;
        int64_t v36 = v109;
        if (v88 != 1) {
          goto LABEL_48;
        }
      }

      else
      {

        unint64_t v42 = v108;
        int64_t v36 = v109;
      }
    }
  }

  int64_t v45 = v36 + 1;
  if (__OFADD__(v36, 1LL))
  {
    __break(1u);
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }

  if (v45 >= v103) {
    goto LABEL_52;
  }
  unint64_t v46 = *(void *)(v102 + 8 * v45);
  int64_t v47 = v36 + 1;
  if (v46) {
    goto LABEL_20;
  }
  int64_t v47 = v36 + 2;
  if (v36 + 2 >= v103) {
    goto LABEL_52;
  }
  unint64_t v46 = *(void *)(v102 + 8 * v47);
  if (v46) {
    goto LABEL_20;
  }
  int64_t v47 = v36 + 3;
  if (v36 + 3 >= v103) {
    goto LABEL_52;
  }
  unint64_t v46 = *(void *)(v102 + 8 * v47);
  if (v46)
  {
LABEL_20:
    uint64_t v108 = (v46 - 1) & v46;
    int64_t v109 = v47;
    unint64_t v44 = __clz(__rbit64(v46)) + (v47 << 6);
    goto LABEL_21;
  }

  uint64_t v48 = v36 + 4;
  if (v36 + 4 >= v103)
  {
LABEL_52:
    uint64_t v92 = v104;
    swift_retain(v104);
    sub_100151470(v95, v94, v96, v92);
    return;
  }

  unint64_t v46 = *(void *)(v102 + 8 * v48);
  if (v46)
  {
    int64_t v47 = v36 + 4;
    goto LABEL_20;
  }

  while (1)
  {
    int64_t v47 = v48 + 1;
    if (__OFADD__(v48, 1LL)) {
      break;
    }
    if (v47 >= v103) {
      goto LABEL_52;
    }
    unint64_t v46 = *(void *)(v102 + 8 * v47);
    ++v48;
    if (v46) {
      goto LABEL_20;
    }
  }

unint64_t *sub_1001AB410(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  uint64_t v5 = 0LL;
  int64_t v6 = 0LL;
  uint64_t v7 = a3 + 56;
  uint64_t v8 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v9 = -1LL;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }

    int64_t v14 = v6 + 1;
    if (__OFADD__(v6, 1LL))
    {
      __break(1u);
      goto LABEL_26;
    }

    if (v14 >= v11) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      int64_t v6 = v14 + 1;
      if (v14 + 1 >= v11) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v7 + 8 * v6);
      if (!v15)
      {
        int64_t v6 = v14 + 2;
        if (v14 + 2 >= v11) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v7 + 8 * v6);
        if (!v15) {
          break;
        }
      }
    }

Swift::Int sub_1001AB5AC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v2 = sub_1001AC9A4(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_1001AB614(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_1001AB614(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        return sub_1001ABCFC(0LL, v3, 1LL, a1);
      }
      return result;
    }

    goto LABEL_154;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1)
  {
LABEL_162:
    Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
    return result;
  }

  Swift::Int v111 = result;
  uint64_t v108 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      int64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_120:
      uint64_t v101 = v11;
      uint64_t v110 = v8;
      if (v12 < 2) {
        goto LABEL_117;
      }
      uint64_t v102 = *v108;
      while (1)
      {
        unint64_t v103 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_149;
        }
        if (!v102) {
          goto LABEL_161;
        }
        uint64_t v100 = v101;
        uint64_t v104 = *(void *)&v101[16 * v103 + 32];
        uint64_t v105 = *(void *)&v101[16 * v12 + 24];
        sub_1001ABDC8( (char *)(v102 + 16 * v104),  (char *)(v102 + 16LL * *(void *)&v101[16 * v12 + 16]),  v102 + 16 * v105,  __dst);
        if (v1) {
          goto LABEL_116;
        }
        if (v105 < v104) {
          goto LABEL_150;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v100) & 1) == 0) {
          uint64_t v100 = sub_1001AC2A8((uint64_t)v100);
        }
        if (v103 >= *((void *)v100 + 2)) {
          goto LABEL_151;
        }
        id v106 = &v100[16 * v103 + 32];
        *(void *)id v106 = v104;
        *((void *)v106 + 1) = v105;
        unint64_t v107 = *((void *)v100 + 2);
        if (v12 > v107) {
          goto LABEL_152;
        }
        memmove(&v100[16 * v12 + 16], &v100[16 * v12 + 32], 16 * (v107 - v12));
        uint64_t v101 = v100;
        *((void *)v100 + 2) = v107 - 1;
        unint64_t v12 = v107 - 1;
        if (v107 <= 2) {
          goto LABEL_117;
        }
      }
    }

    uint64_t v110 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5 >> 1, &type metadata for String);
    *(void *)(v7 + 16) = v6;
    uint64_t v110 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }

  Swift::Int v9 = 0LL;
  uint64_t v10 = *a1;
  uint64_t v109 = v10 + 8;
  int64_t v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v112 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    int64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    uint64_t v18 = v17[1];
    if (v15 == *v17 && v16 == v18)
    {
      Swift::Int v21 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v20 = 0;
    }

    else
    {
      int v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, *v17, v18, 1LL);
      Swift::Int v21 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }

    uint64_t v22 = (uint64_t *)(v109 + 16 * v21);
    do
    {
      uint64_t v24 = *(v22 - 1);
      uint64_t v25 = *v22;
      uint64_t v26 = (void *)(v10 + 16 * v9);
      uint64_t v27 = v26[1];
      if (v24 == *v26 && v25 == v27)
      {
        if ((v20 & 1) != 0) {
          goto LABEL_37;
        }
      }

      else if (((v20 ^ _stringCompareWithSmolCheck(_:_:expecting:)(v24, v25, *v26, v27, 1LL)) & 1) != 0)
      {
        goto LABEL_36;
      }

      v22 += 2;
      Swift::Int v23 = v21 + 1;
      Swift::Int v9 = v21;
      Swift::Int v21 = v23;
    }

    while (v23 < v3);
    Swift::Int v21 = v23;
LABEL_36:
    Swift::Int v9 = v21;
    if ((v20 & 1) != 0)
    {
LABEL_37:
      if (v21 < v13) {
        goto LABEL_157;
      }
      if (v13 < v21)
      {
        uint64_t v29 = 16 * v21;
        uint64_t v30 = 16 * v13;
        Swift::Int v31 = v21;
        Swift::Int v32 = v13;
        do
        {
          if (v32 != --v31)
          {
            if (!v10) {
              goto LABEL_160;
            }
            uint64_t v33 = v10 + v29;
            uint64_t v34 = *(void *)(v10 + v30);
            uint64_t v35 = *(void *)(v10 + v30 + 8);
            *(_OWORD *)(v10 + v30) = *(_OWORD *)(v10 + v29 - 16);
            *(void *)(v33 - 16) = v34;
            *(void *)(v33 - 8) = v35;
          }

          ++v32;
          v29 -= 16LL;
          v30 += 16LL;
        }

        while (v32 < v31);
      }

LABEL_99:
    if ((v73 & 1) != 0) {
      goto LABEL_141;
    }
    id v81 = &v48[16 * v50];
    uint64_t v83 = *(void *)v81;
    uint64_t v82 = *((void *)v81 + 1);
    BOOL v61 = __OFSUB__(v82, v83);
    uint64_t v84 = v82 - v83;
    if (v61) {
      goto LABEL_144;
    }
    if (v84 < v72) {
      goto LABEL_15;
    }
LABEL_107:
    unint64_t v89 = v50 - 1;
    if (v50 - 1 >= v12)
    {
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      __break(1u);
LABEL_143:
      __break(1u);
LABEL_144:
      __break(1u);
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }

    uint64_t v90 = v10;
    if (!v10) {
      goto LABEL_159;
    }
    id v91 = v11;
    uint64_t v92 = &v48[16 * v89];
    uint64_t v93 = *(void *)v92;
    uint64_t v94 = v48;
    unint64_t v95 = v50;
    uint64_t v96 = &v48[16 * v50];
    uint64_t v97 = *((void *)v96 + 1);
    uint64_t v98 = v90;
    sub_1001ABDC8((char *)(v90 + 16LL * *(void *)v92), (char *)(v90 + 16LL * *(void *)v96), v90 + 16 * v97, __dst);
    if (v1) {
      break;
    }
    if (v97 < v93) {
      goto LABEL_134;
    }
    if (v95 > *((void *)v91 + 2)) {
      goto LABEL_135;
    }
    *(void *)uint64_t v92 = v93;
    *(void *)&v94[16 * v89 + 8] = v97;
    unint64_t v99 = *((void *)v91 + 2);
    if (v95 >= v99) {
      goto LABEL_136;
    }
    int64_t v11 = v91;
    unint64_t v12 = v99 - 1;
    memmove(v96, v96 + 16, 16 * (v99 - 1 - v95));
    uint64_t v48 = v94;
    *((void *)v91 + 2) = v99 - 1;
    uint64_t v10 = v98;
    Swift::Int v9 = v113;
    if (v99 <= 2) {
      goto LABEL_15;
    }
  }

  uint64_t v100 = v91;
LABEL_116:
  uint64_t v101 = v100;
LABEL_117:
  swift_bridgeObjectRelease(v101);
  v110[2] = 0LL;
  return swift_bridgeObjectRelease(v110);
}

uint64_t sub_1001ABCFC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      uint64_t v13 = *(v12 - 2);
      uint64_t v14 = *(v12 - 1);
      BOOL v15 = result == v13 && v10 == v14;
      if (v15 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v10, v13, v14, 1LL), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16LL;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }

      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_1001ABDC8(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  uint64_t v13 = v12 >> 4;
  Swift::Int v31 = __src;
  uint64_t v30 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v19 = &v4[16 * v13];
      uint64_t v29 = v19;
      Swift::Int v31 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        int v20 = (char *)(a3 - 16);
        Swift::Int v21 = v6;
        while (1)
        {
          uint64_t v22 = v20 + 16;
          uint64_t v23 = *((void *)v19 - 2);
          uint64_t v24 = *((void *)v19 - 1);
          uint64_t v25 = *((void *)v21 - 2);
          uint64_t v26 = *((void *)v21 - 1);
          v21 -= 16;
          BOOL v27 = v23 == v25 && v24 == v26;
          if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v25, v26, 1LL) & 1) == 0)
          {
            uint64_t v29 = v19 - 16;
            if (v22 < v19 || v20 >= v19 || v22 != v19) {
              *(_OWORD *)int v20 = *((_OWORD *)v19 - 1);
            }
            Swift::Int v21 = v6;
            v19 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }

          else
          {
            if (v22 != v6 || v20 >= v6) {
              *(_OWORD *)int v20 = *(_OWORD *)v21;
            }
            Swift::Int v31 = v21;
            if (v21 <= v7) {
              goto LABEL_50;
            }
          }

          v20 -= 16;
          uint64_t v6 = v21;
          if (v19 <= v4) {
            goto LABEL_50;
          }
        }
      }

      goto LABEL_50;
    }
  }

  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v29 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        uint64_t v15 = *((void *)v6 + 1);
        uint64_t v16 = *((void *)v4 + 1);
        BOOL v17 = *(void *)v6 == *(void *)v4 && v15 == v16;
        if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(*(void *)v6, v15, *(void *)v4, v16, 1LL) & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v30 = v4;
          uint64_t v18 = v6;
        }

        else
        {
          uint64_t v18 = v6 + 16;
          if (v7 < v6 || v7 >= v18 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }

        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v18;
      }

      while ((unint64_t)v18 < a3);
      Swift::Int v31 = v7;
    }

LABEL_50:
    sub_1001AC200((void **)&v31, (const void **)&v30, &v29);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_1001AC060(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100007578(&qword_100257C68);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_1001AC158(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7]) {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }

  return result;
}

char *sub_1001AC200(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7]) {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }

  return result;
}

char *sub_1001AC2A8(uint64_t a1)
{
  return sub_1001AC060(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1001AC2C0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0LL;
    return __clz(__rbit64(v1)) + v2;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1LL << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2LL;
  }
  unint64_t v8 = v7 - 2;
  char v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

uint64_t sub_1001AC348(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0LL;
    return __clz(__rbit64(v1)) + v2;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1LL << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3LL;
  }
  unint64_t v8 = v7 - 3;
  char v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

int64_t sub_1001AC3EC(int64_t result, int a2, char a3, uint64_t a4)
{
  if ((a3 & 1) != 0) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1LL << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }

  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }

  unint64_t v8 = v7 & (-2LL << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0LL;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }

  return result;
}

void sub_1001AC4D0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1001AC4DC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t (*a5)(void))
{
  unint64_t v9 = a1;
  if ((a4 & 0xC000000000000001LL) == 0)
  {
    if ((a3 & 1) != 0) {
      goto LABEL_13;
    }
    if (a1 < 0 || 1LL << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }

    else if (((*(void *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2) {
        goto LABEL_20;
      }
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        uint64_t v14 = __CocoaSet.Index.element.getter(v9, a2);
        uint64_t v25 = v14;
        uint64_t v15 = a5(0LL);
        swift_unknownObjectRetain(v14, v16);
        swift_dynamicCast(&v26, &v25, (char *)&type metadata for Swift.AnyObject + 8, v15, 7LL);
        unint64_t v5 = v26;
        swift_unknownObjectRelease(v14);
        Swift::Int v17 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
        uint64_t v18 = -1LL << *(_BYTE *)(a4 + 32);
        unint64_t v9 = v17 & ~v18;
        if (((*(void *)(a4 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v9) & 1) != 0)
        {
          id v19 = *(id *)(*(void *)(a4 + 48) + 8 * v9);
          char v20 = static NSObject.== infix(_:_:)();

          if ((v20 & 1) == 0)
          {
            uint64_t v21 = ~v18;
            do
            {
              unint64_t v9 = (v9 + 1) & v21;
              if (((*(void *)(a4 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v9) & 1) == 0) {
                goto LABEL_24;
              }
              id v22 = *(id *)(*(void *)(a4 + 48) + 8 * v9);
              char v23 = static NSObject.== infix(_:_:)();
            }

            while ((v23 & 1) == 0);
          }

LABEL_20:
          id v24 = *(id *)(*(void *)(a4 + 48) + 8 * v9);
          return;
        }

void sub_1001AC728(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v7 = a1;
  if ((a4 & 0xC000000000000001LL) == 0)
  {
    if ((a3 & 1) != 0) {
      goto LABEL_13;
    }
    if (a1 < 0 || 1LL << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }

    else if (((*(void *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2) {
        goto LABEL_20;
      }
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        uint64_t v12 = __CocoaSet.Index.element.getter(v7, a2);
        uint64_t v23 = v12;
        uint64_t v13 = sub_100007620(0LL, (unint64_t *)&qword_100256DB0, &OBJC_CLASS___TPPolicyVersion_ptr);
        swift_unknownObjectRetain(v12, v14);
        swift_dynamicCast(&v24, &v23, (char *)&type metadata for Swift.AnyObject + 8, v13, 7LL);
        unint64_t v4 = v24;
        swift_unknownObjectRelease(v12);
        Swift::Int v15 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
        uint64_t v16 = -1LL << *(_BYTE *)(a4 + 32);
        unint64_t v7 = v15 & ~v16;
        if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0)
        {
          id v17 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
          char v18 = static NSObject.== infix(_:_:)(v17);

          if ((v18 & 1) == 0)
          {
            uint64_t v19 = ~v16;
            do
            {
              unint64_t v7 = (v7 + 1) & v19;
              if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) == 0) {
                goto LABEL_24;
              }
              id v20 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
              char v21 = static NSObject.== infix(_:_:)(v20);
            }

            while ((v21 & 1) == 0);
          }

LABEL_20:
          id v22 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
          return;
        }

uint64_t sub_1001AC990(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *(void *)(a1 + 16),  0LL,  a1);
}

uint64_t sub_1001AC9A4(uint64_t a1)
{
  return sub_10014EC68(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1001AC9B8(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = a2;
  uint64_t v23 = a1 + 56;
  uint64_t v4 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v5 = -1LL;
  if (v4 < 64) {
    uint64_t v5 = ~(-1LL << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v24 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v8 = 0LL;
  uint64_t v9 = _swiftEmptyArrayStorage;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v8 << 6);
      goto LABEL_17;
    }

    if (__OFADD__(v8++, 1LL)) {
      break;
    }
    if (v8 >= v24) {
      goto LABEL_31;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v8);
    if (!v13)
    {
      int64_t v14 = v8 + 1;
      if (v8 + 1 >= v24) {
        goto LABEL_31;
      }
      unint64_t v13 = *(void *)(v23 + 8 * v14);
      if (v13) {
        goto LABEL_15;
      }
      int64_t v14 = v8 + 2;
      if (v8 + 2 >= v24) {
        goto LABEL_31;
      }
      unint64_t v13 = *(void *)(v23 + 8 * v14);
      if (v13) {
        goto LABEL_15;
      }
      int64_t v14 = v8 + 3;
      if (v8 + 3 >= v24) {
        goto LABEL_31;
      }
      unint64_t v13 = *(void *)(v23 + 8 * v14);
      if (v13)
      {
LABEL_15:
        int64_t v8 = v14;
      }

      else
      {
        int64_t v22 = v8 + 4;
        if (v8 + 4 >= v24)
        {
LABEL_31:
          swift_release(a1);
          return (uint64_t)v9;
        }

        unint64_t v13 = *(void *)(v23 + 8 * v22);
        for (v8 += 4LL; !v13; ++v22)
        {
          int64_t v8 = v22 + 1;
          if (__OFADD__(v22, 1LL)) {
            goto LABEL_34;
          }
          if (v8 >= v24) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v23 + 8 * v8);
        }
      }
    }

    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_17:
    Swift::Int v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v16 = v15[1];
    v27[0] = *v15;
    v27[1] = v16;
    swift_bridgeObjectRetain(v16);
    sub_1001AA864(v27, v28, &v25);
    if (v2)
    {
      swift_bridgeObjectRelease(v9);
      swift_release(a1);
      swift_bridgeObjectRelease(v16);
      return (uint64_t)v9;
    }

    uint64_t result = swift_bridgeObjectRelease(v16);
    uint64_t v17 = v26;
    if (v26)
    {
      uint64_t v18 = v25;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native(v9);
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1001498EC(0LL, v9[2] + 1LL, 1, v9);
        uint64_t v9 = (void *)result;
      }

      unint64_t v20 = v9[2];
      unint64_t v19 = v9[3];
      if (v20 >= v19 >> 1)
      {
        uint64_t result = (uint64_t)sub_1001498EC((void *)(v19 > 1), v20 + 1, 1, v9);
        uint64_t v9 = (void *)result;
      }

      v9[2] = v20 + 1;
      char v21 = &v9[2 * v20];
      v21[4] = v18;
      v21[5] = v17;
    }
  }

  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

void sub_1001ACC20(uint64_t a1, uint64_t a2, void *a3)
{
  id v29 = a3;
  uint64_t v28 = a2;
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  int64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v26 = a1 + 56;
  uint64_t v10 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & v9;
  int64_t v27 = (unint64_t)(v10 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  int64_t v13 = 0LL;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v13 << 6);
      goto LABEL_5;
    }

    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v22 >= v27) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v27) {
        goto LABEL_23;
      }
      unint64_t v23 = *(void *)(v26 + 8 * v13);
      if (!v23)
      {
        int64_t v13 = v22 + 2;
        if (v22 + 2 >= v27) {
          goto LABEL_23;
        }
        unint64_t v23 = *(void *)(v26 + 8 * v13);
        if (!v23)
        {
          int64_t v13 = v22 + 3;
          if (v22 + 3 >= v27) {
            goto LABEL_23;
          }
          unint64_t v23 = *(void *)(v26 + 8 * v13);
          if (!v23) {
            break;
          }
        }
      }
    }

void sub_1001ACEDC( uint64_t a1, _TtC18TrustedPeersHelper6Client **a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, const char *a7)
{
  uint64_t v43 = a7;
  uint64_t v39 = a1 + 56;
  uint64_t v13 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v14 = -1LL;
  if (v13 < 64) {
    uint64_t v14 = ~(-1LL << v13);
  }
  unint64_t v15 = v14 & *(void *)(a1 + 56);
  int64_t v40 = (unint64_t)(v13 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  int64_t v16 = 0LL;
  if (!v15) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v17 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    int64_t v22 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    unint64_t v23 = (_TtC18TrustedPeersHelper6Client *)v22[1];
    v42[0] = *v22;
    v42[1] = (uint64_t)v23;
    swift_bridgeObjectRetain(v23);
    sub_1001A9C08(v42, a2, a3, a4, a5, a6, v43);
    if (v7)
    {
      swift_release(a1);
      swift_bridgeObjectRelease(v23, v32, v33, v34, v35, v36, v37, v38);
      return;
    }

    swift_bridgeObjectRelease(v23, v24, v25, v26, v27, v28, v29, v30);
    if (v15) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v16++, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v16 >= v40) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v39 + 8 * v16);
    if (!v20)
    {
      int64_t v21 = v16 + 1;
      if (v16 + 1 >= v40) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v39 + 8 * v21);
      if (v20) {
        goto LABEL_14;
      }
      int64_t v21 = v16 + 2;
      if (v16 + 2 >= v40) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v39 + 8 * v21);
      if (v20) {
        goto LABEL_14;
      }
      int64_t v21 = v16 + 3;
      if (v16 + 3 >= v40) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v39 + 8 * v21);
      if (v20)
      {
LABEL_14:
        int64_t v16 = v21;
        goto LABEL_15;
      }

      int64_t v31 = v16 + 4;
      if (v16 + 4 >= v40)
      {
LABEL_26:
        swift_release(a1);
        return;
      }

      unint64_t v20 = *(void *)(v39 + 8 * v31);
      v16 += 4LL;
      if (!v20) {
        break;
      }
    }

void sub_1001AD0E0( uint64_t a1, _TtC18TrustedPeersHelper6Client **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  BOOL v45 = a8;
  uint64_t v40 = a1 + 56;
  uint64_t v14 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v15 = -1LL;
  if (v14 < 64) {
    uint64_t v15 = ~(-1LL << v14);
  }
  unint64_t v16 = v15 & *(void *)(a1 + 56);
  int64_t v41 = (unint64_t)(v14 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  int64_t v17 = 0LL;
  if (!v16) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v18 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v18 | (v17 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v17 << 6))
  {
    unint64_t v23 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    int64_t v24 = (_TtC18TrustedPeersHelper6Client *)v23[1];
    v44[0] = *v23;
    v44[1] = (uint64_t)v24;
    swift_bridgeObjectRetain(v24);
    sub_1001A9F98(v44, a2, a3, a4, a5, a6, a7, v45);
    if (v8)
    {
      swift_release(a1);
      swift_bridgeObjectRelease(v24, v33, v34, v35, v36, v37, v38, v39);
      return;
    }

    swift_bridgeObjectRelease(v24, v25, v26, v27, v28, v29, v30, v31);
    if (v16) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v17++, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v17 >= v41) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v40 + 8 * v17);
    if (!v21)
    {
      int64_t v22 = v17 + 1;
      if (v17 + 1 >= v41) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v40 + 8 * v22);
      if (v21) {
        goto LABEL_14;
      }
      int64_t v22 = v17 + 2;
      if (v17 + 2 >= v41) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v40 + 8 * v22);
      if (v21) {
        goto LABEL_14;
      }
      int64_t v22 = v17 + 3;
      if (v17 + 3 >= v41) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v40 + 8 * v22);
      if (v21)
      {
LABEL_14:
        int64_t v17 = v22;
        goto LABEL_15;
      }

      int64_t v32 = v17 + 4;
      if (v17 + 4 >= v41)
      {
LABEL_26:
        swift_release(a1);
        return;
      }

      unint64_t v21 = *(void *)(v40 + 8 * v32);
      v17 += 4LL;
      if (!v21) {
        break;
      }
    }

void sub_1001AD2E8(void *a1, _BYTE *a2, const char *a3, const char *a4)
{
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  unint64_t v12 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (sub_1001A5080(48LL))
  {
    if (qword_100250ED8 != -1) {
      swift_once(&qword_100250ED8, sub_1001A5008);
    }
    uint64_t v13 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v13, (uint64_t)qword_100257C18);
    id v79 = a1;
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v79);
    os_log_type_t v15 = static os_log_type_t.info.getter(v14);
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc(22LL, -1LL);
      uint64_t v17 = swift_slowAlloc(64LL, -1LL);
      uint64_t v82 = v17;
      *(_DWORD *)uint64_t v16 = 136446466;
      uint64_t v18 = sub_1001A5244();
      unint64_t v20 = (_TtC18TrustedPeersHelper6Client *)v19;
      uint64_t v80 = sub_10017C4C4(v18, v19, &v82);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v16 + 4, v16 + 12);

      swift_bridgeObjectRelease(v20, v21, v22, v23, v24, v25, v26, v27);
      *(_WORD *)(v16 + 12) = 2082;
      id v28 = [v79 machineID];
      if (v28)
      {
        BOOL v29 = v28;
        uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
        uint64_t v32 = v31;
      }

      else
      {
        uint64_t v30 = 0LL;
        uint64_t v32 = 0LL;
      }

      uint64_t v80 = v30;
      uint64_t v81 = v32;
      uint64_t v53 = sub_100007578((uint64_t *)&unk_100256C60);
      uint64_t v54 = String.init<A>(describing:)(&v80, v53);
      uint64_t v56 = (_TtC18TrustedPeersHelper6Client *)v55;
      uint64_t v80 = sub_10017C4C4(v54, v55, &v82);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v16 + 14, v16 + 22);

      swift_bridgeObjectRelease(v56, v57, v58, v59, v60, v61, v62, v63);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, a3, (uint8_t *)v16, 0x16u);
      swift_arrayDestroy(v17, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1LL, -1LL);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    else
    {
    }
  }

  else
  {
    if (qword_100250ED8 != -1) {
      swift_once(&qword_100250ED8, sub_1001A5008);
    }
    uint64_t v33 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v33, (uint64_t)qword_100257C18);
    id v34 = a1;
    int64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v35, v36))
    {
      BOOL v78 = a4;
      id v79 = a2;
      uint64_t v37 = swift_slowAlloc(22LL, -1LL);
      uint64_t v77 = swift_slowAlloc(64LL, -1LL);
      uint64_t v82 = v77;
      *(_DWORD *)uint64_t v37 = 136446466;
      uint64_t v38 = sub_1001A5244();
      uint64_t v40 = (_TtC18TrustedPeersHelper6Client *)v39;
      uint64_t v80 = sub_10017C4C4(v38, v39, &v82);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v37 + 4, v37 + 12);

      swift_bridgeObjectRelease(v40, v41, v42, v43, v44, v45, v46, v47);
      *(_WORD *)(v37 + 12) = 2082;
      id v48 = [v34 machineID];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
        uint64_t v52 = v51;
      }

      else
      {
        uint64_t v50 = 0LL;
        uint64_t v52 = 0LL;
      }

      uint64_t v80 = v50;
      uint64_t v81 = v52;
      uint64_t v64 = sub_100007578((uint64_t *)&unk_100256C60);
      uint64_t v65 = String.init<A>(describing:)(&v80, v64);
      uint64_t v67 = (_TtC18TrustedPeersHelper6Client *)v66;
      uint64_t v80 = sub_10017C4C4(v65, v66, &v82);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v37 + 14, v37 + 22);

      swift_bridgeObjectRelease(v67, v68, v69, v70, v71, v72, v73, v74);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, v78, (uint8_t *)v37, 0x16u);
      uint64_t v75 = v77;
      swift_arrayDestroy(v77, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v75, -1LL, -1LL);
      swift_slowDealloc(v37, -1LL, -1LL);

      a2 = v79;
    }

    else
    {
    }

    Date.init()([v34 setStatus:2]);
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    [v34 setModified:isa];

    *a2 = 1;
  }

void sub_1001AD808( uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8, uint64_t *a9)
{
  uint64_t v10 = v9;
  uint64_t v11 = a1;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v12 = a1;
    }
    else {
      uint64_t v12 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v13 = __CocoaSet.makeIterator()(v12);
    uint64_t v14 = type metadata accessor for MachineMO();
    uint64_t v15 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject);
    uint64_t v16 = Set.Iterator.init(_cocoa:)(v46, v13, v14, v15);
    uint64_t v11 = v46[0];
    uint64_t v37 = v46[1];
    uint64_t v17 = v46[2];
    int64_t v18 = v46[3];
    unint64_t v19 = v46[4];
  }

  else
  {
    uint64_t v20 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v37 = a1 + 56;
    uint64_t v21 = ~v20;
    uint64_t v22 = -v20;
    if (v22 < 64) {
      uint64_t v23 = ~(-1LL << v22);
    }
    else {
      uint64_t v23 = -1LL;
    }
    unint64_t v19 = v23 & *(void *)(a1 + 56);
    uint64_t v16 = (void *)swift_bridgeObjectRetain(a1);
    uint64_t v17 = v21;
    int64_t v18 = 0LL;
  }

  int64_t v36 = (unint64_t)(v17 + 64) >> 6;
  if ((v11 & 0x8000000000000000LL) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v24 = __CocoaSet.Iterator.next()(v16);
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v45 = v24;
    uint64_t v26 = type metadata accessor for MachineMO();
    swift_unknownObjectRetain(v25, v27);
    swift_dynamicCast(&v47, &v45, (char *)&type metadata for Swift.AnyObject + 8, v26, 7LL);
    id v28 = v47;
    swift_unknownObjectRelease(v25);
    int64_t v29 = v18;
    uint64_t v30 = v19;
    while (v28)
    {
      id v47 = v28;
      sub_1001A7D2C(&v47, a2, a3, a4, a5, a6, a7, a8, a9);

      if (v10)
      {
        uint64_t v35 = v11;
        goto LABEL_39;
      }

      int64_t v18 = v29;
      unint64_t v19 = v30;
      if (v11 < 0) {
        goto LABEL_11;
      }
LABEL_14:
      if (v19)
      {
        uint64_t v30 = (v19 - 1) & v19;
        unint64_t v31 = __clz(__rbit64(v19)) | (v18 << 6);
        int64_t v29 = v18;
      }

      else
      {
        int64_t v29 = v18 + 1;
        if (__OFADD__(v18, 1LL))
        {
          __break(1u);
          return;
        }

        if (v29 >= v36) {
          break;
        }
        unint64_t v32 = *(void *)(v37 + 8 * v29);
        if (!v32)
        {
          int64_t v33 = v18 + 2;
          if (v18 + 2 >= v36) {
            break;
          }
          unint64_t v32 = *(void *)(v37 + 8 * v33);
          if (v32) {
            goto LABEL_25;
          }
          int64_t v33 = v18 + 3;
          if (v18 + 3 >= v36) {
            break;
          }
          unint64_t v32 = *(void *)(v37 + 8 * v33);
          if (v32) {
            goto LABEL_25;
          }
          int64_t v33 = v18 + 4;
          if (v18 + 4 >= v36) {
            break;
          }
          unint64_t v32 = *(void *)(v37 + 8 * v33);
          if (v32)
          {
LABEL_25:
            int64_t v29 = v33;
          }

          else
          {
            int64_t v29 = v18 + 5;
            if (v18 + 5 >= v36) {
              break;
            }
            unint64_t v32 = *(void *)(v37 + 8 * v29);
            if (!v32)
            {
              int64_t v34 = v18 + 6;
              while (v36 != v34)
              {
                unint64_t v32 = *(void *)(v37 + 8 * v34++);
                if (v32)
                {
                  int64_t v29 = v34 - 1;
                  goto LABEL_26;
                }
              }

              break;
            }
          }
        }

Swift::Int sub_1001ADB14(Swift::Int result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v33 = (unint64_t *)result;
  uint64_t v34 = 0LL;
  int64_t v5 = 0LL;
  uint64_t v8 = *(void *)(a3 + 56);
  uint64_t v6 = a3 + 56;
  uint64_t v7 = v8;
  uint64_t v9 = 1LL << *(_BYTE *)(v6 - 24);
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & v7;
  uint64_t v35 = v6;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v39 = a4 + 56;
  while (1)
  {
    while (v11)
    {
      unint64_t v12 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v13 = v12 | (v5 << 6);
      if (!*(void *)(a4 + 16)) {
        goto LABEL_38;
      }
LABEL_23:
      uint64_t v17 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v13);
      uint64_t v19 = *v17;
      uint64_t v18 = v17[1];
      Hasher.init(_seed:)(v38);
      swift_bridgeObjectRetain(v18);
      String.hash(into:)(v38, v19, v18);
      Swift::Int v20 = Hasher._finalize()();
      uint64_t v21 = -1LL << *(_BYTE *)(a4 + 32);
      unint64_t v22 = v20 & ~v21;
      if (((*(void *)(v39 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v22) & 1) == 0) {
        goto LABEL_37;
      }
      uint64_t v23 = *(void *)(a4 + 48);
      uint64_t v24 = (void *)(v23 + 16 * v22);
      uint64_t v25 = v24[1];
      BOOL v26 = *v24 == v19 && v25 == v18;
      if (!v26 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v24, v25, v19, v18, 0LL) & 1) == 0)
      {
        uint64_t v27 = ~v21;
        while (1)
        {
          unint64_t v22 = (v22 + 1) & v27;
          if (((*(void *)(v39 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v22) & 1) == 0) {
            break;
          }
          id v28 = (void *)(v23 + 16 * v22);
          uint64_t v29 = v28[1];
          BOOL v30 = *v28 == v19 && v29 == v18;
          if (v30 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v28, v29, v19, v18, 0LL) & 1) != 0) {
            goto LABEL_5;
          }
        }

LABEL_37:
        uint64_t result = swift_bridgeObjectRelease(v18);
        goto LABEL_38;
      }

Swift::Int sub_1001ADDD4(uint64_t a1, uint64_t a2)
{
  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1LL << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n(a2, 2LL);
  if (v6 <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(v8, 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe, v10);
    bzero((char *)&v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL), v8);
    swift_bridgeObjectRetain(a2);
    Swift::Int v11 = sub_1001ADB14((Swift::Int)&v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL), v7, a1, a2);
    swift_release(a1);
    uint64_t v12 = swift_bridgeObjectRelease(a2);
    if (v2) {
      swift_willThrow(v12);
    }
    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  else
  {
    unint64_t v13 = (void *)swift_slowAlloc(v8, -1LL);
    bzero(v13, v8);
    swift_bridgeObjectRetain(a2);
    Swift::Int v11 = sub_1001ADB14((Swift::Int)v13, v7, a1, a2);
    swift_release(a1);
    swift_bridgeObjectRelease(a2);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  return v11;
}

id sub_1001ADF98(void *a1, void *a2)
{
  id v4 = [a1 machines];
  if (!v4
    || (char v5 = v4,
        id v24 = 0LL,
        uint64_t v6 = type metadata accessor for MachineMO(),
        v7 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject),  static Set._conditionallyBridgeFromObjectiveC(_:result:)(v5, &v24, v6, v7),  v5,  (id v8 = v24) == 0LL))
  {
    swift_bridgeObjectRelease(0LL);
    id v8 = &_swiftEmptySetSingleton;
  }

  sub_1000DCA18((uint64_t)v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease(v8);
  uint64_t v11 = sub_100161634(v10);
  swift_bridgeObjectRelease(v10);
  id v12 = [a1 allowedMachineIDs];
  if (!v12
    || (unint64_t v13 = v12,
        id v24 = 0LL,
        static Set._conditionallyBridgeFromObjectiveC(_:result:)( v12,  &v24,  &type metadata for String,  &protocol witness table for String),  v13,  (id v14 = v24) == 0LL))
  {
    swift_bridgeObjectRelease(0LL);
    id v14 = &_swiftEmptySetSingleton;
  }

  Swift::Int v15 = sub_1001ADDD4((uint64_t)v14, v11);
  swift_bridgeObjectRelease(v11);
  id v16 = a2;
  id v17 = a1;
  sub_1001ACC20(v15, (uint64_t)v16, v17);
  swift_release(v15);

  Class isa = Set._bridgeToObjectiveC()().super.isa;
  [v17 setAllowedMachineIDs:isa];

  id v24 = 0LL;
  unsigned int v19 = [v16 save:&v24];
  id v20 = v24;
  if (v19) {
    return v24;
  }
  id v22 = v24;
  _convertNSErrorToError(_:)(v20);

  return (id)swift_willThrow(v23);
}

id sub_1001AE1D8(void *a1, void *a2)
{
  id v3 = [a1 machines];
  if (!v3
    || (id v4 = v3,
        id v14 = 0LL,
        uint64_t v5 = type metadata accessor for MachineMO(),
        v6 = sub_1000077B8( &qword_100256B78,  (uint64_t (*)(uint64_t))type metadata accessor for MachineMO,  (uint64_t)&protocol conformance descriptor for NSObject),  static Set._conditionallyBridgeFromObjectiveC(_:result:)(v4, &v14, v5, v6),  v4,  (id v7 = v14) == 0LL))
  {
    swift_bridgeObjectRelease(0LL);
    id v7 = &_swiftEmptySetSingleton;
  }

  sub_1001A3FE8((uint64_t)v7);
  if ((v8 & 1) == 0) {
    return (id)swift_bridgeObjectRelease(v7);
  }
  sub_1001A274C((uint64_t)v7);
  swift_bridgeObjectRelease(v7);
  id v14 = 0LL;
  unsigned int v9 = [a2 save:&v14];
  id v10 = v14;
  if (v9) {
    return v14;
  }
  id v12 = v14;
  _convertNSErrorToError(_:)(v10);

  return (id)swift_willThrow(v13);
}

uint64_t sub_1001AE34C(uint64_t a1)
{
  uint64_t v2 = sub_100007578(&qword_100256D28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1001AE38C()
{
  uint64_t v1 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO;
  id v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO), "honorIDMSListChanges"));
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    uint64_t v6 = v5;

    if (v4 == 5457241 && v6 == 0xE300000000000000LL)
    {
      swift_bridgeObjectRelease(0xE300000000000000LL);
      char v16 = 1;
      return v16 & 1;
    }

    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, 5457241LL, 0xE300000000000000LL, 0LL);
    swift_bridgeObjectRelease(v6);
    if ((v8 & 1) != 0) {
      goto LABEL_20;
    }
  }

  id v9 = [*(id *)(v0 + v1) honorIDMSListChanges];
  if (!v9) {
    goto LABEL_13;
  }
  id v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  uint64_t v13 = v12;

  if (v11 == 20302 && v13 == 0xE200000000000000LL)
  {
    unint64_t v24 = 0xE200000000000000LL;
    goto LABEL_23;
  }

  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, 20302LL, 0xE200000000000000LL, 0LL);
  swift_bridgeObjectRelease(v13);
  char v16 = 0;
  if ((v15 & 1) == 0)
  {
LABEL_13:
    id v17 = [*(id *)(v0 + v1) honorIDMSListChanges];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
      uint64_t v21 = v20;

      if (v19 != 0x4E574F4E4B4E55LL || v21 != 0xE700000000000000LL)
      {
        char v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v21, 0x4E574F4E4B4E55LL, 0xE700000000000000LL, 0LL);
        swift_bridgeObjectRelease(v21);
        char v16 = v23 ^ 1;
        return v16 & 1;
      }

      unint64_t v24 = 0xE700000000000000LL;
LABEL_23:
      swift_bridgeObjectRelease(v24);
      char v16 = 0;
      return v16 & 1;
    }

uint64_t sub_1001AE560(uint64_t a1, uint64_t a2)
{
  return sub_1001AA324(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(void, void))(v2 + 24));
}

uint64_t sub_1001AE56C()
{
  swift_release(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_1001AE598()
{
}

uint64_t sub_1001AE5A4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1001AE5B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1001AE5C4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1001AE5CC( _TtC18TrustedPeersHelper6Client *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v23 = type metadata accessor for Container.SemaphoreWrapper();
  swift_allocObject(v23, 41LL, 7LL);
  unint64_t v24 = v19;
  uint64_t v25 = sub_100159634(v24, 0xD0000000000000E7LL, 0x80000001001FB8F0LL);
  uint64_t v76 = v24;

  BOOL v26 = (void *)swift_allocObject(&unk_10023D658, 40LL, 7LL);
  v26[2] = v25;
  v26[3] = a18;
  uint64_t v75 = v26;
  v26[4] = a19;
  uint64_t v27 = qword_100250ED8;
  swift_retain(v25);
  swift_retain(a19);
  if (v27 != -1) {
    swift_once(&qword_100250ED8, sub_1001A5008);
  }
  uint64_t v28 = a16;
  uint64_t v29 = a10;
  uint64_t v30 = type metadata accessor for Logger(0LL);
  sub_100006BAC(v30, (uint64_t)qword_100257C18);
  swift_bridgeObjectRetain_n(a7, 2LL);
  uint64_t v31 = swift_bridgeObjectRetain_n(a1, 2LL);
  unint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
  os_log_type_t v33 = static os_log_type_t.info.getter(v32);
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc(22LL, -1LL);
    uint64_t v70 = swift_slowAlloc(64LL, -1LL);
    uint64_t v80 = v70;
    *(_DWORD *)uint64_t v34 = 136446466;
    uint64_t v35 = swift_bridgeObjectRetain(a1);
    uint64_t v36 = Set.description.getter(v35, &type metadata for String, &protocol witness table for String);
    uint64_t v38 = (_TtC18TrustedPeersHelper6Client *)v37;
    swift_bridgeObjectRelease(a1, v37, v39, v40, v41, v42, v43, v44);
    uint64_t aBlock = sub_10017C4C4(v36, (unint64_t)v38, &v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v82, v34 + 4, v34 + 12);
    swift_bridgeObjectRelease_n(a1, 2LL);
    swift_bridgeObjectRelease(v38, v45, v46, v47, v48, v49, v50, v51);
    *(_WORD *)(v34 + 12) = 2082;
    uint64_t aBlock = a6;
    v82[0] = a7;
    swift_bridgeObjectRetain(a7);
    uint64_t v52 = sub_100007578((uint64_t *)&unk_100256C60);
    uint64_t v53 = String.init<A>(describing:)(&aBlock, v52);
    unint64_t v55 = (_TtC18TrustedPeersHelper6Client *)v54;
    uint64_t aBlock = sub_10017C4C4(v53, v54, &v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v82, v34 + 14, v34 + 22);
    swift_bridgeObjectRelease_n(a7, 2LL);
    uint64_t v56 = v55;
    uint64_t v28 = a16;
    uint64_t v29 = a10;
    swift_bridgeObjectRelease(v56, v57, v58, v59, v60, v61, v62, v63);
    _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "Setting allowed machine IDs: %{public}s, version %{public}s",  (uint8_t *)v34,  0x16u);
    swift_arrayDestroy(v70, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v70, -1LL, -1LL);
    swift_slowDealloc(v34, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a7, 2LL);
    swift_bridgeObjectRelease_n(a1, 2LL);
  }

  id v71 = *(id *)&v76[OBJC_IVAR____TtC18TrustedPeersHelper9Container_moc];
  uint64_t v64 = swift_allocObject(&unk_10023D680, 176LL, 7LL);
  *(void *)(v64 + 16) = v76;
  *(void *)(v64 + 24) = a2;
  *(void *)(v64 + 32) = a3;
  *(void *)(v64 + 40) = a4;
  *(void *)(v64 + 48) = a1;
  *(void *)(v64 + 56) = a14;
  *(void *)(v64 + 64) = a15;
  *(void *)(v64 + 72) = a12;
  *(void *)(v64 + 80) = a13;
  *(void *)(v64 + 88) = a8;
  *(void *)(v64 + 96) = a9;
  *(void *)(v64 + 104) = v29;
  *(void *)(v64 + 112) = a11;
  *(void *)(v64 + 120) = v28;
  *(void *)(v64 + 128) = a17;
  *(_BYTE *)(v64 + 136) = a5 & 1;
  *(void *)(v64 + 144) = a6;
  *(void *)(v64 + 152) = a7;
  *(void *)(v64 + 160) = sub_1001AEAE8;
  *(void *)(v64 + 168) = v75;
  uint64_t v65 = swift_allocObject(&unk_10023D6A8, 32LL, 7LL);
  *(void *)(v65 + 16) = sub_1001AEB70;
  *(void *)(v65 + 24) = v64;
  v82[3] = sub_100044B24;
  uint64_t v83 = v65;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  v82[0] = 1107296256LL;
  v82[1] = sub_1000DC9F8;
  v82[2] = &unk_10023D6C0;
  unint64_t v66 = _Block_copy(&aBlock);
  uint64_t v74 = v83;
  swift_bridgeObjectRetain(a17);
  swift_retain(v75);
  swift_retain(v65);
  uint64_t v67 = v76;
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a4);
  swift_bridgeObjectRetain(a15);
  swift_bridgeObjectRetain(a13);
  swift_bridgeObjectRetain(a9);
  swift_bridgeObjectRetain(a11);
  swift_release(v74);
  [v71 performBlockAndWait:v66];
  swift_release(v75);
  swift_release(v25);
  _Block_release(v66);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v65, "", 119LL, 260LL, 33LL, 1LL);
  swift_release(v64);
  uint64_t result = swift_release(v65);
  if ((isEscapingClosureAtFileLocation & 1) != 0) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1001AEAE8(char a1, uint64_t a2)
{
  return sub_1001A5E38(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(void, void))(v2 + 24));
}

uint64_t sub_1001AEAF4()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 24));
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  swift_bridgeObjectRelease(*(void *)(v0 + 40));
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  swift_bridgeObjectRelease(*(void *)(v0 + 64));
  swift_bridgeObjectRelease(*(void *)(v0 + 80));
  swift_bridgeObjectRelease(*(void *)(v0 + 96));
  swift_bridgeObjectRelease(*(void *)(v0 + 112));
  swift_bridgeObjectRelease(*(void *)(v0 + 128));
  swift_bridgeObjectRelease(*(void *)(v0 + 152));
  swift_release(*(void *)(v0 + 168));
  return swift_deallocObject(v0, 176LL, 7LL);
}

void sub_1001AEB70()
{
}

uint64_t sub_1001AEBCC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1001AEBDC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v80 = a1 + 56;
  uint64_t v14 = 1LL << *(_BYTE *)(a1 + 32);
  if (v14 < 64) {
    uint64_t v15 = ~(-1LL << v14);
  }
  else {
    uint64_t v15 = -1LL;
  }
  unint64_t v16 = v15 & *(void *)(a1 + 56);
  int64_t v81 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v83 = a4 + 56;
  uint64_t v84 = a2 + 56;
  swift_bridgeObjectRetain(a1);
  int64_t v17 = 0LL;
  while (v16)
  {
    unint64_t v18 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    unint64_t v19 = v18 | (v17 << 6);
LABEL_22:
    uint64_t v23 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v19);
    uint64_t v24 = *v23;
    uint64_t v25 = (_TtC18TrustedPeersHelper6Client *)v23[1];
    if (a2 && *(void *)(a2 + 16))
    {
      Hasher.init(_seed:)(v86);
      swift_bridgeObjectRetain(v25);
      String.hash(into:)(v86, v24, v25);
      Swift::Int v26 = Hasher._finalize()();
      uint64_t v34 = -1LL << *(_BYTE *)(a2 + 32);
      unint64_t v35 = v26 & ~v34;
      if (((*(void *)(v84 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v35) & 1) != 0)
      {
        uint64_t v36 = *(void *)(a2 + 48);
        uint64_t v37 = (void *)(v36 + 16 * v35);
        uint64_t v27 = (const char *)v37[1];
        BOOL v38 = *v37 == v24 && v27 == (const char *)v25;
        if (v38 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v37, v27, v24, v25, 0LL) & 1) != 0)
        {
LABEL_60:
          swift_bridgeObjectRelease(v25, v27, v28, v29, v30, v31, v32, v33);
          swift_release(a1);
          goto LABEL_61;
        }

        uint64_t v39 = ~v34;
        while (1)
        {
          unint64_t v35 = (v35 + 1) & v39;
          if (((*(void *)(v84 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v35) & 1) == 0) {
            break;
          }
          int64_t v40 = (void *)(v36 + 16 * v35);
          uint64_t v27 = (const char *)v40[1];
          BOOL v41 = *v40 == v24 && v27 == (const char *)v25;
          if (v41 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v40, v27, v24, v25, 0LL) & 1) != 0) {
            goto LABEL_60;
          }
        }
      }
    }

    else
    {
      swift_bridgeObjectRetain(v25);
    }

    if (a3)
    {
      uint64_t v85 = a1;
      v86[0] = a3;
      uint64_t v42 = sub_100007578(&qword_100257C40);
      uint64_t v43 = sub_1001738E0(&qword_100257C48, &qword_100257C40, (uint64_t)&protocol conformance descriptor for Set<A>);
      if ((Collection<>.contains<A>(_:)(&v85, v42, v42, v43, v43, &protocol witness table for String) & 1) != 0) {
        goto LABEL_60;
      }
    }

    if (a4)
    {
      if (*(void *)(a4 + 16))
      {
        Hasher.init(_seed:)(v86);
        String.hash(into:)(v86, v24, v25);
        Swift::Int v44 = Hasher._finalize()();
        uint64_t v45 = -1LL << *(_BYTE *)(a4 + 32);
        unint64_t v46 = v44 & ~v45;
        if (((*(void *)(v83 + ((v46 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v46) & 1) != 0)
        {
          uint64_t v47 = *(void *)(a4 + 48);
          id v48 = (void *)(v47 + 16 * v46);
          id v49 = (_TtC18TrustedPeersHelper6Client *)v48[1];
          BOOL v50 = *v48 == v24 && v49 == v25;
          if (v50 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v48, v49, v24, v25, 0LL) & 1) != 0) {
            goto LABEL_59;
          }
          uint64_t v51 = ~v45;
          unint64_t v52 = (v46 + 1) & v51;
          if (((*(void *)(v83 + ((v52 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v52) & 1) != 0)
          {
            uint64_t v53 = (uint64_t *)(v47 + 16 * v52);
            uint64_t v54 = *v53;
            unint64_t v55 = (_TtC18TrustedPeersHelper6Client *)v53[1];
            if (*v53 != v24 || v55 != v25)
            {
              do
              {
                if ((_stringCompareWithSmolCheck(_:_:expecting:)(v54, v55, v24, v25, 0LL) & 1) != 0) {
                  break;
                }
                unint64_t v52 = (v52 + 1) & v51;
                if (((*(void *)(v83 + ((v52 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v52) & 1) == 0) {
                  goto LABEL_5;
                }
                uint64_t v56 = (uint64_t *)(v47 + 16 * v52);
                uint64_t v54 = *v56;
                unint64_t v55 = (_TtC18TrustedPeersHelper6Client *)v56[1];
              }

              while (*v56 != v24 || v55 != v25);
            }

uint64_t sub_1001AF130(_TtC18TrustedPeersHelper6Client *a1)
{
  uint64_t v2 = type metadata accessor for SHA256(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v62[8] = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for SHA256Digest(0LL);
  v62[6] = *(void *)(v6 - 8);
  v62[7] = v6;
  uint64_t v8 = __chkstk_darwin(v6, v7);
  id v10 = (char *)v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8, v11);
  v62[5] = (char *)v62 - v12;
  uint64_t v13 = type metadata accessor for String.Encoding(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  int64_t v17 = (char *)v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v64 = 0LL;
  uint64_t v65 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
  uint64_t v18 = swift_bridgeObjectRetain(a1);
  unint64_t v19 = sub_10014E370(v18);
  swift_bridgeObjectRelease(a1, v20, v21, v22, v23, v24, v25, v26);
  BOOL v63 = v19;
  sub_1001AB5AC((uint64_t *)&v63);
  uint64_t v27 = (uint64_t)v63;
  v62[2] = 0LL;
  v62[3] = v3;
  v62[4] = v10;
  uint64_t v28 = v63[2];
  if (v28)
  {
    uint64_t v29 = v2;
    uint64_t v30 = (_TtC18TrustedPeersHelper6Client **)(v63 + 5);
    do
    {
      uint64_t v32 = (uint64_t)*(v30 - 1);
      uint64_t v31 = *v30;
      swift_bridgeObjectRetain(*v30);
      v33._countAndFlagsBits = v32;
      v33._object = v31;
      String.append(_:)(v33);
      swift_bridgeObjectRelease(v31, v34, v35, v36, v37, v38, v39, v40);
      v30 += 2;
      --v28;
    }

    while (v28);
    swift_release(v27);
    uint64_t v42 = v64;
    BOOL v41 = v65;
    uint64_t v2 = v29;
  }

  else
  {
    swift_release(v63);
    uint64_t v42 = 0LL;
    BOOL v41 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
  }

  uint64_t v43 = swift_bridgeObjectRetain(v41);
  static String.Encoding.utf8.getter(v43);
  String.data(using:allowLossyConversion:)(v17, 0LL, v42, v41);
  uint64_t v45 = v44;
  swift_bridgeObjectRelease(v41, v44, v46, v47, v48, v49, v50, v51);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  if ((unint64_t)v45 >> 60 != 15)
  {
    uint64_t v59 = sub_1000077B8( &qword_100257C50,  (uint64_t (*)(uint64_t))&type metadata accessor for SHA256,  (uint64_t)&protocol conformance descriptor for SHA256);
    dispatch thunk of HashFunction.init()(v2, v59);
    int64_t v60 = (char *)&loc_1001AF37C + dword_1001AF73C[(unint64_t)v45 >> 62];
    v62[1] = v45;
    __asm { BR              X10 }
  }

  swift_bridgeObjectRelease(v65, v52, v53, v54, v55, v56, v57, v58);
  return 0LL;
}

uint64_t *sub_1001AF754(uint64_t a1, unint64_t a2, uint64_t a3, _TtC18TrustedPeersHelper6Client *a4)
{
  id v10 = (uint64_t *)&v4[OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_secret];
  *id v10 = a1;
  v10[1] = a2;
  uint64_t v11 = (uint64_t *)&v4[OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_bottleSalt];
  *uint64_t v11 = a3;
  v11[1] = (uint64_t)a4;
  uint64_t v12 = v4;
  sub_1000084E8(a1, a2);
  swift_bridgeObjectRetain(a4);
  unint64_t v13 = sub_1001B1E5C(1, a1, a2, a3, (unint64_t)a4);
  if (v5)
  {
    sub_10000852C(a1, a2);
    swift_bridgeObjectRelease(a4, v15, v16, v17, v18, v19, v20, v21);
    uint64_t v26 = type metadata accessor for EscrowKeys();
    sub_10000852C(*v10, v10[1]);
    uint64_t v27 = (_TtC18TrustedPeersHelper6Client *)v11[1];

    swift_bridgeObjectRelease(v27, v28, v29, v30, v31, v32, v33, v34);
    swift_deallocPartialClassInstance(v12, v26, 64LL, 7LL);
  }

  else
  {
    unint64_t v22 = v14;
    uint64_t v100 = v12;
    uint64_t v23 = v13;
    SecKeyRef v24 = sub_1001B2148();
    unint64_t v94 = v22;
    id v25 = [objc_allocWithZone(_SFECKeyPair) initWithSecKey:v24];

    uint64_t v93 = OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_encryptionKey;
    *(void *)&v100[OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_encryptionKey] = v25;
    unint64_t v92 = sub_1001B1E5C(0, a1, a2, a3, (unint64_t)a4);
    unint64_t v91 = v36;
    SecKeyRef v37 = sub_1001B2148();
    id v38 = [objc_allocWithZone(_SFECKeyPair) initWithSecKey:v37];

    uint64_t v39 = OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_signingKey;
    *(void *)&v100[OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_signingKey] = v38;
    uint64_t v40 = v39;
    unint64_t v41 = sub_1001B1E5C(2, a1, a2, a3, (unint64_t)a4);
    unint64_t v43 = (unint64_t)v42;
    uint64_t v90 = v40;
    swift_bridgeObjectRelease(a4, v42, v44, v45, v46, v47, v48, v49);
    id v89 = (id)objc_opt_self(&OBJC_CLASS___TPHObjectiveC);
    id v50 = objc_msgSend( objc_allocWithZone(_SFAESKeySpecifier),  "initWithBitSize:",  objc_msgSend(v89, "aes256BitSize"));
    id v51 = objc_allocWithZone(&OBJC_CLASS____SFAESKey);
    sub_1000084E8(v41, v43);
    id v52 = sub_100009908(v41, v43, (uint64_t)v50);
    uint64_t v86 = v50;
    sub_10000852C(v41, v43);
    uint64_t v53 = v100;
    uint64_t v85 = OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_symmetricKey;
    *(void *)&v100[OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_symmetricKey] = v52;
    id v54 = [*(id *)&v53[v90] publicKey];
    unint64_t v87 = v43;
    id v55 = [v54 spki];
    swift_unknownObjectRelease(v54);
    uint64_t v56 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v55);
    unint64_t v58 = v57;

    ccsha384_di(v59, v60);
    uint64_t v98 = sub_100009698((uint64_t)objc_msgSend(v89, "ccsha384_diSize"));
    unint64_t v99 = v61;
    uint64_t v96 = v56;
    unint64_t v97 = v58;
    unint64_t v88 = v58;
    sub_1000084E8(v56, v58);
    sub_1001B0F4C((uint64_t)&v98);
    uint64_t v62 = v98;
    unint64_t v63 = v99;
    sub_1000084E8(v98, v99);
    Swift::String v64 = Data.base64EncodedString(options:)(0LL);
    sub_10000852C(v62, v63);
    sub_10000852C(v62, v63);
    sub_10000852C(v56, v97);
    sub_10000852C(v56, v88);
    id v65 = [*(id *)&v100[v90] keyData];
    uint64_t v66 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v65);
    unint64_t v68 = v67;

    sub_1001B26DC(v66, v68, v64._countAndFlagsBits, (uint64_t)v64._object, 0xD000000000000017LL, 0x80000001001FBAE0LL);
    sub_10000852C(v66, v68);
    id v69 = [*(id *)&v100[v93] keyData];
    uint64_t v70 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v69);
    unint64_t v72 = v71;

    sub_1001B243C(v70, v72, v64._countAndFlagsBits, (uint64_t)v64._object);
    sub_10000852C(v70, v72);
    id v73 = [*(id *)&v100[v85] keyData];
    uint64_t v74 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v73);
    unint64_t v76 = v75;

    sub_1001B26DC(v74, v76, v64._countAndFlagsBits, (uint64_t)v64._object, 0xD000000000000019LL, 0x80000001001FBAA0LL);
    id v77 = v100;

    sub_10000852C(v74, v76);
    swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)v64._object, v78, v79, v80, v81, v82, v83, v84);
    sub_10000852C(v41, v87);
    sub_10000852C(v92, v91);
    sub_10000852C(v23, v94);
    v95.receiver = v77;
    v95.super_class = (Class)type metadata accessor for EscrowKeys();
    id v10 = (uint64_t *)objc_msgSendSuper2(&v95, "init");
    sub_10000852C(a1, a2);
  }

  return v10;
}

void sub_1001AFE28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }

void sub_1001AFE98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = v5;
  __int16 v8 = v6;
  char v9 = BYTE2(v6);
  char v10 = BYTE3(v6);
  char v11 = BYTE4(v6);
  char v12 = BYTE5(v6);
  sub_1001B0098((uint64_t)&v7, (uint64_t)&v7 + BYTE6(v6), a5);
}

void sub_1001B0098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X10 }

uint64_t sub_1001B0108( uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v15 - 104) = v11;
  *(_WORD *)(v15 - 96) = v10;
  *(_BYTE *)(v15 - 94) = BYTE2(v10);
  *(_BYTE *)(v15 - 93) = BYTE3(v10);
  *(_BYTE *)(v15 - 92) = BYTE4(v10);
  *(_BYTE *)(v15 - 91) = BYTE5(v10);
  sub_1001B0320(v15 - 104, v15 - 104 + BYTE6(v10), a4, a5, a6, v8, a7, a8, v17, v12, v9, v13, v14);
  return sub_10000852C(v11, v10);
}

uint64_t sub_1001B0320( uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, uint64_t *a11, uint64_t a12, void *a13)
{
  uint64_t result = ccsha384_di(a1, a2);
  if (!a4)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (!a6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  if (!a1)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  if (!a8)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  uint64_t v22 = a7 - a6;
  uint64_t v23 = a9 - a8;
  uint64_t result = cchkdf(result, a5 - a4, a4, v22, a6, a2 - a1, a1, a9 - a8, a8);
  *a3 = result;
  if ((_DWORD)result)
  {
LABEL_6:
    uint64_t v24 = result;
    unint64_t v25 = sub_1001B0668();
    uint64_t v26 = swift_allocError(&type metadata for EscrowKeysError, v25, 0LL, 0LL);
    *(void *)uint64_t v27 = v24;
    *(void *)(v27 + 8) = 0LL;
    *(_BYTE *)(v27 + 16) = 2;
    return swift_willThrow(v26);
  }

  if (a10 < 2u)
  {
    uint64_t result = ccrng(0LL);
    if (result)
    {
      uint64_t result = ccec_generate_key_deterministic(a12, v23, a8, result, 1LL, a13);
      *a3 = result;
      if ((_DWORD)result) {
        goto LABEL_6;
      }
      if (a13)
      {
        unint64_t v28 = sub_10000FCAC(a13);
        uint64_t v34 = sub_100009698(v28);
        uint64_t v35 = v29;
        sub_1001B14B0((uint64_t)&v34);
        sub_10000B6C4(v34, v35);
LABEL_15:
        uint64_t v32 = *a11;
        unint64_t v33 = a11[1];
        *a11 = v30;
        a11[1] = v31;
        return sub_10000852C(v32, v33);
      }

uint64_t sub_1001B04C0(uint64_t __src, uint64_t a2)
{
  if (__src)
  {
    if (a2)
    {
      uint64_t v3 = __src;
      if (a2 <= 14)
      {
        return sub_10000EF44((_BYTE *)__src, (_BYTE *)(__src + a2));
      }

      else
      {
        uint64_t v4 = type metadata accessor for __DataStorage(0LL);
        swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
        __DataStorage.init(bytes:length:)(v3, a2);
        if ((unint64_t)a2 >= 0x7FFFFFFF)
        {
          uint64_t v5 = type metadata accessor for Data.RangeReference(0LL);
          __src = swift_allocObject(v5, 32LL, 7LL);
          *(void *)(__src + 16) = 0LL;
          *(void *)(__src + 24) = a2;
        }

        else
        {
          return a2 << 32;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return __src;
}

id sub_1001B05A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EscrowKeys();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EscrowKeys()
{
  return objc_opt_self(&OBJC_CLASS____TtC18TrustedPeersHelper10EscrowKeys);
}

unint64_t sub_1001B0668()
{
  unint64_t result = qword_100257CC0;
  if (!qword_100257CC0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1001E6DC0, &type metadata for EscrowKeysError);
    atomic_store(result, (unint64_t *)&qword_100257CC0);
  }

  return result;
}

uint64_t sub_1001B06AC(uint64_t a1)
{
  unint64_t v2 = sub_1001B0B44();
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1001B06D4(uint64_t a1)
{
  unint64_t v2 = sub_1001B0B44();
  return Error<>._code.getter(a1, v2);
}

void sub_1001B06FC(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }

unint64_t sub_1001B0734()
{
  v0._countAndFlagsBits = ((uint64_t (*)(void *, void *))dispatch thunk of CustomStringConvertible.description.getter)( &type metadata for Int32,  &protocol witness table for Int32);
  object = v0._object;
  String.append(_:)(v0);
  swift_bridgeObjectRelease(object);
  return 0xD000000000000021LL;
}

void sub_1001B0880()
{
}

unint64_t sub_1001B088C(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v6 = sub_10000BBEC((uint64_t)_swiftEmptyArrayStorage);
  sub_1001B06FC(a1, a2, a3);
  if (v8)
  {
    uint64_t v9 = v7;
    uint64_t v10 = v8;
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    uint64_t v13 = v12;
    unint64_t v67 = &type metadata for String;
    *(void *)&__int128 v66 = v9;
    *((void *)&v66 + 1) = v10;
    sub_100008570(&v66, v65);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v6);
    sub_10014BF08(v65, v11, (uint64_t)v13, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease(v13, v15, v16, v17, v18, v19, v20, v21);
    swift_bridgeObjectRelease( (_TtC18TrustedPeersHelper6Client *)0x8000000000000000LL,  v22,  v23,  v24,  v25,  v26,  v27,  v28);
  }

  if (a3 == 2)
  {
    uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUnderlyingErrorKey);
    uint64_t v31 = v44;
    uint64_t v45 = (int)a1;
    id v46 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v47 = String._bridgeToObjectiveC()();
    id v48 = [v46 initWithDomain:v47 code:v45 userInfo:0];

    unint64_t v67 = (void *)sub_1001B0B88();
    *(void *)&__int128 v66 = v48;
    goto LABEL_7;
  }

  if (!a3)
  {
    uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUnderlyingErrorKey);
    uint64_t v31 = v30;
    static String._unconditionallyBridgeFromObjectiveC(_:)(NSOSStatusErrorDomain);
    unint64_t v33 = v32;
    id v34 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v33, v36, v37, v38, v39, v40, v41, v42);
    id v43 = [v34 initWithDomain:v35 code:(int)a1 userInfo:0];

    unint64_t v67 = (void *)sub_1001B0B88();
    *(void *)&__int128 v66 = v43;
LABEL_7:
    sub_100008570(&v66, v65);
    char v49 = swift_isUniquelyReferenced_nonNull_native(v6);
    sub_10014BF08(v65, v29, (uint64_t)v31, v49);
    swift_bridgeObjectRelease(v31, v50, v51, v52, v53, v54, v55, v56);
    swift_bridgeObjectRelease( (_TtC18TrustedPeersHelper6Client *)0x8000000000000000LL,  v57,  v58,  v59,  v60,  v61,  v62,  v63);
  }

  return v6;
}

unint64_t sub_1001B0AD4()
{
  return 0xD00000000000002ALL;
}

uint64_t sub_1001B0AF0()
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1001B0B10 + 4 * byte_1001E6D64[*(unsigned __int8 *)(v0 + 16)]))(3LL);
}

uint64_t sub_1001B0B10()
{
  return 4LL;
}

uint64_t sub_1001B0B18()
{
  return 5LL;
}

uint64_t sub_1001B0B20()
{
  if (*v0 == 0LL) {
    return 1LL;
  }
  else {
    return 2LL;
  }
}

unint64_t sub_1001B0B38()
{
  return sub_1001B088C(*(void *)v0, *(void *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

unint64_t sub_1001B0B44()
{
  unint64_t result = qword_100257CC8;
  if (!qword_100257CC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1001E6D80, &type metadata for EscrowKeysError);
    atomic_store(result, (unint64_t *)&qword_100257CC8);
  }

  return result;
}

unint64_t sub_1001B0B88()
{
  unint64_t result = qword_100251528;
  if (!qword_100251528)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSError);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100251528);
  }

  return result;
}

void sub_1001B0BC4(uint64_t a1)
{
  __asm { BR              X12 }

uint64_t sub_1001B0C4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v7 = v1;
  LOWORD(v8) = a1;
  BYTE2(v8) = BYTE2(a1);
  HIBYTE(v8) = BYTE3(a1);
  unsigned __int8 v9 = BYTE4(a1);
  unsigned __int8 v10 = BYTE5(a1);
  unsigned __int8 v11 = BYTE6(a1);
  sub_1000084E8(v4, v2);
  sub_1001B1180(v3);
  uint64_t result = sub_10000852C(v4, v2);
  *uint64_t v5 = v7;
  v5[1] = v8 | ((unint64_t)v9 << 32) | ((unint64_t)v10 << 40) | ((unint64_t)v11 << 48);
  return result;
}

void sub_1001B0F4C(uint64_t a1)
{
  __asm { BR              X12 }

void sub_1001B0FAC(uint64_t a1@<X8>)
{
  uint64_t v4 = v1;
  LOWORD(v5) = a1;
  BYTE2(v5) = BYTE2(a1);
  HIBYTE(v5) = BYTE3(a1);
  unsigned __int8 v6 = BYTE4(a1);
  unsigned __int8 v7 = BYTE5(a1);
  unsigned __int8 v8 = BYTE6(a1);
  sub_1001B1774(v3);
  *unint64_t v2 = v4;
  v2[1] = v5 | ((unint64_t)v6 << 32) | ((unint64_t)v7 << 40) | ((unint64_t)v8 << 48);
}

void sub_1001B1180(uint64_t a1)
{
  __asm { BR              X12 }

uint64_t sub_1001B11F4()
{
  *(void *)(v5 - 104) = v0;
  *(_WORD *)(v5 - 96) = v1;
  *(_BYTE *)(v5 - 94) = BYTE2(v1);
  *(_BYTE *)(v5 - 93) = BYTE3(v1);
  *(_BYTE *)(v5 - 92) = BYTE4(v1);
  *(_BYTE *)(v5 - 91) = BYTE5(v1);
  *(_BYTE *)(v5 - 90) = BYTE6(v1);
  sub_1001AFE28(v5 - 104, v5 - 104 + BYTE6(v1), v3, v2);
  uint64_t v6 = *(void *)(v5 - 104);
  uint64_t v7 = *(unsigned int *)(v5 - 96);
  uint64_t v8 = *(unsigned __int8 *)(v5 - 92);
  uint64_t v9 = *(unsigned __int8 *)(v5 - 91);
  uint64_t v10 = *(unsigned __int8 *)(v5 - 90);
  uint64_t result = sub_10000852C(v3, v2);
  *uint64_t v4 = v6;
  v4[1] = v7 | (v8 << 32) | (v9 << 40) | (v10 << 48);
  return result;
}

void sub_1001B14B0(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_1001B150C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v6 = v3;
  LOWORD(v7) = a1;
  BYTE2(v7) = BYTE2(a1);
  HIBYTE(v7) = BYTE3(a1);
  unsigned __int8 v8 = BYTE4(a1);
  unsigned __int8 v9 = BYTE5(a1);
  unsigned __int8 v10 = BYTE6(a1);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t *, uint64_t))ccec_x963_export)(1LL, &v6, v2);
  unint64_t v5 = v7 | ((unint64_t)v8 << 32) | ((unint64_t)v9 << 40) | ((unint64_t)v10 << 48);
  *uint64_t v1 = v6;
  v1[1] = v5;
  return result;
}

void sub_1001B1774(uint64_t a1)
{
  __asm { BR              X13 }

uint64_t sub_1001B17D4()
{
  uint64_t v7 = v1;
  LOWORD(v8) = v0;
  BYTE2(v8) = BYTE2(v0);
  HIBYTE(v8) = BYTE3(v0);
  unsigned __int8 v9 = BYTE4(v0);
  unsigned __int8 v10 = BYTE5(v0);
  unsigned __int8 v11 = BYTE6(v0);
  if (!v3)
  {
    __break(1u);
    JUMPOUT(0x1001B1990LL);
  }

  uint64_t result = ccdigest(v4, BYTE6(v0), &v7, v3);
  unint64_t v6 = v8 | ((unint64_t)v9 << 32) | ((unint64_t)v10 << 40) | ((unint64_t)v11 << 48);
  *uint64_t v2 = v7;
  v2[1] = v6;
  return result;
}

void sub_1001B19AC(int *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (a1[1] < (int)v3)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (__DataStorage._bytes.getter())
  {
    if (!__OFSUB__(v3, __DataStorage._offset.getter()))
    {
      __DataStorage._length.getter();
      sub_1001B1180(a2);
      return;
    }

    goto LABEL_6;
  }

void sub_1001B1A9C(int *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  if (a1[1] < (int)v4)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (__DataStorage._bytes.getter())
  {
    if (!__OFSUB__(v4, __DataStorage._offset.getter()))
    {
      __DataStorage._length.getter();
      sub_1001B1774(a2);
      return;
    }

    goto LABEL_6;
  }

void sub_1001B1B4C(int *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  if ((int)v7 < (int)v6)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v8 = __DataStorage._bytes.getter();
  if (!v8)
  {
LABEL_10:
    __break(1u);
    return;
  }

  uint64_t v9 = v8;
  uint64_t v10 = __DataStorage._offset.getter();
  uint64_t v11 = v6 - v10;
  if (__OFSUB__(v6, v10))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v12 = v7 - v6;
  uint64_t v13 = __DataStorage._length.getter();
  if (v13 >= v12) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v13;
  }
  sub_1001AFE28(v9 + v11, v9 + v11 + v14, a2, a3);
  sub_10000852C(a2, a3);
}

uint64_t sub_1001B1C58( uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11, uint64_t *a12, uint64_t a13, void *a14)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v21 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v21 += a1 - result;
  }

  BOOL v22 = __OFSUB__(a2, a1);
  uint64_t v23 = a2 - a1;
  if (v22)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v24 = __DataStorage._length.getter();
  if (v24 >= v23) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = v24;
  }
  uint64_t v26 = v21 + v25;
  if (v21) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = 0LL;
  }
  return sub_1001B0320(v21, v27, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

void sub_1001B1D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = __DataStorage._bytes.getter();
  if (v6)
  {
    uint64_t v7 = __DataStorage._offset.getter();
    if (__OFSUB__(a1, v7))
    {
LABEL_13:
      __break(1u);
      return;
    }

    v6 += a1 - v7;
  }

  BOOL v8 = __OFSUB__(a2, a1);
  uint64_t v9 = a2 - a1;
  if (v8)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v10 = __DataStorage._length.getter();
  if (v10 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = v6 + v11;
  if (v6) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0LL;
  }
  sub_1001B0098(v6, v13, a4);
}

unint64_t sub_1001B1E5C(int a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  int v47 = a1;
  if (!(_BYTE)a1)
  {
    uint64_t v9 = 0xD00000000000001ALL;
    uint64_t v10 = "Escrow Signing Private Key";
    goto LABEL_5;
  }

  if (a1 == 1)
  {
    uint64_t v9 = 0xD00000000000001DLL;
    uint64_t v10 = "Escrow Encryption Private Key";
LABEL_5:
    uint64_t v11 = sub_10017C7E0(v9, (unint64_t)(v10 - 32) | 0x8000000000000000LL);
    uint64_t v12 = sub_100009734((_BYTE *)v11 + 32, v11[2]);
    unint64_t v14 = v13;
    uint64_t v15 = swift_release(v11);
    uint64_t v45 = v12;
    uint64_t v17 = 56LL;
    goto LABEL_7;
  }

  id v18 = sub_10017C7E0(0xD000000000000014LL, 0x80000001001FBB40LL);
  uint64_t v12 = sub_100009734((_BYTE *)v18 + 32, v18[2]);
  unint64_t v14 = v19;
  uint64_t v15 = swift_release(v18);
  uint64_t v45 = v12;
  uint64_t v17 = 32LL;
LABEL_7:
  unint64_t v20 = v14;
  unint64_t v46 = v14;
  uint64_t v21 = ccec_cp_384(v15, v16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v41 = v12;
    uint64_t v23 = (void *)objc_opt_self(&OBJC_CLASS___TPHObjectiveC);
    id v24 = [v23 ccec384Context];
    uint64_t v43 = sub_100009698(v17);
    unint64_t v44 = v25;
    sub_1000084E8(a2, a3);
    swift_bridgeObjectRetain(a5);
    unint64_t v14 = a4;
    uint64_t v26 = sub_10017C7E0(a4, a5);
    swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)a5, v27, v28, v29, v30, v31, v32, v33);
    if ((a5 & 0x1000000000000000LL) != 0)
    {
      Swift::Int v34 = String.UTF8View._foreignCount()();
    }

    else if ((a5 & 0x2000000000000000LL) != 0)
    {
      Swift::Int v34 = HIBYTE(a5) & 0xF;
    }

    else
    {
      Swift::Int v34 = a4 & 0xFFFFFFFFFFFFLL;
    }

    sub_100009734((_BYTE *)v26 + 32, v34);
    swift_release(v26);
    sub_1001B0BC4((uint64_t)&v43);
    if (!v5)
    {
      unint64_t v14 = 0LL;
      sub_1000084E8(0LL, 0xC000000000000000LL);
      sub_10000852C(a2, a3);
      objc_msgSend(v23, "contextFree:", v24, v22, v24);
      sub_10000852C(v43, v44);
      sub_10000852C(0LL, 0xC000000000000000LL);
      sub_10000852C(v41, v20);
      return v14;
    }

    sub_10000852C(a2, a3);
    objc_msgSend(v23, "contextFree:", v24, v22, v24);
    sub_10000852C(v43, v44);
    sub_10000852C(0LL, 0xC000000000000000LL);
    uint64_t v35 = v41;
    unint64_t v36 = v20;
  }

  else
  {
    unint64_t v37 = sub_1001B0668();
    uint64_t v38 = swift_allocError(&type metadata for EscrowKeysError, v37, 0LL, 0LL);
    *(void *)uint64_t v39 = 0LL;
    *(void *)(v39 + 8) = 0LL;
    *(_BYTE *)(v39 + 16) = 3;
    swift_willThrow(v38);
    sub_10000852C(0LL, 0xC000000000000000LL);
    uint64_t v35 = v45;
    unint64_t v36 = v46;
  }

  sub_10000852C(v35, v36);
  return v14;
}

SecKeyRef sub_1001B2148()
{
  uint64_t v0 = sub_100007578(&qword_100251598);
  uint64_t inited = swift_initStackObject(v0, &v21);
  *(_OWORD *)(inited + 16) = xmmword_1001DE420;
  *(void *)(inited + 32) = kSecAttrKeyClass;
  *(void *)(inited + 40) = kSecAttrKeyClassPrivate;
  *(void *)(inited + 48) = kSecAttrKeyType;
  *(void *)(inited + 56) = kSecAttrKeyTypeEC;
  uint64_t v2 = (id)kSecAttrKeyClass;
  uint64_t v3 = (id)kSecAttrKeyClassPrivate;
  uint64_t v4 = (id)kSecAttrKeyType;
  uint64_t v5 = (id)kSecAttrKeyTypeEC;
  uint64_t v6 = (_TtC18TrustedPeersHelper6Client *)sub_10000BAAC(inited);
  Class isa = (const __CFData *)Data._bridgeToObjectiveC()().super.isa;
  type metadata accessor for CFString(0LL);
  sub_1001B2968();
  BOOL v8 = (const __CFDictionary *)Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6, v9, v10, v11, v12, v13, v14, v15);
  SecKeyRef v16 = SecKeyCreateWithData(isa, v8, 0LL);

  if (!v16)
  {
    unint64_t v17 = sub_1001B0668();
    uint64_t v18 = swift_allocError(&type metadata for EscrowKeysError, v17, 0LL, 0LL);
    *(void *)uint64_t v19 = 0LL;
    *(void *)(v19 + 8) = 0LL;
    *(_BYTE *)(v19 + 16) = 3;
    swift_willThrow(v18);
  }

  return v16;
}

uint64_t sub_1001B22A0(_TtC18TrustedPeersHelper6Client *a1)
{
  CFTypeRef result = 0LL;
  type metadata accessor for CFString(0LL);
  sub_1001B2968();
  Class isa = (const __CFDictionary *)Dictionary._bridgeToObjectiveC()().super.isa;
  unsigned int v3 = SecItemAdd(isa, &result);

  if (v3)
  {
    if (v3 != -25299) {
      goto LABEL_4;
    }
    uint64_t v18 = a1;
    swift_bridgeObjectRetain(a1);
    uint64_t v4 = (id)kSecClass;
    sub_10000CD14((uint64_t)v4, v19);

    sub_100007538((uint64_t)v19);
    uint64_t v5 = (const __CFDictionary *)Dictionary._bridgeToObjectiveC()().super.isa;
    uint64_t v6 = (const __CFDictionary *)Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v18, v7, v8, v9, v10, v11, v12, v13);
    unsigned int v3 = SecItemUpdate(v5, v6);

    if (v3)
    {
LABEL_4:
      unint64_t v14 = sub_1001B0668();
      uint64_t v15 = swift_allocError(&type metadata for EscrowKeysError, v14, 0LL, 0LL);
      *(void *)uint64_t v16 = v3;
      *(void *)(v16 + 8) = 0LL;
      *(_BYTE *)(v16 + 16) = 0;
      swift_willThrow(v15);
    }
  }

  swift_unknownObjectRelease(result);
  return 1LL;
}

uint64_t sub_1001B243C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = sub_100007578((uint64_t *)&unk_100256EE0);
  uint64_t inited = swift_initStackObject(v6, v40);
  *(_OWORD *)(inited + 16) = xmmword_1001DE700;
  *(void *)(inited + 32) = kSecClass;
  type metadata accessor for CFString(0LL);
  *(void *)(inited + 40) = kSecClassKey;
  *(void *)(inited + 64) = v8;
  *(void *)(inited + 72) = kSecAttrAccessible;
  *(void *)(inited + 80) = kSecAttrAccessibleWhenUnlocked;
  *(void *)(inited + 104) = v8;
  *(void *)(inited + 112) = kSecUseDataProtectionKeychain;
  *(_BYTE *)(inited + 120) = 1;
  *(void *)(inited + 144) = &type metadata for Bool;
  *(void *)(inited + 152) = kSecAttrAccessGroup;
  *(void *)(inited + 160) = 0xD00000000000001ALL;
  *(void *)(inited + 168) = 0x80000001001E79C0LL;
  *(void *)(inited + 184) = &type metadata for String;
  *(void *)(inited + 192) = kSecAttrSynchronizable;
  *(_BYTE *)(inited + 200) = 0;
  *(void *)(inited + 224) = &type metadata for Bool;
  *(void *)(inited + 232) = kSecAttrLabel;
  *(void *)(inited + 240) = a3;
  *(void *)(inited + 248) = v4;
  *(void *)(inited + 264) = &type metadata for String;
  *(void *)(inited + 272) = kSecAttrApplicationLabel;
  uint64_t v9 = sub_100007578(&qword_100251578);
  uint64_t v10 = swift_allocObject(v9, 72LL, 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_1001DE710;
  id v36 = objc_allocWithZone(&OBJC_CLASS___NSUUID);
  id v11 = (id)kSecClass;
  BOOL v12 = (id)kSecClassKey;
  BOOL v13 = (id)kSecAttrAccessible;
  unint64_t v14 = (id)kSecAttrAccessibleWhenUnlocked;
  uint64_t v15 = (id)kSecUseDataProtectionKeychain;
  uint64_t v16 = (id)kSecAttrAccessGroup;
  unint64_t v17 = (id)kSecAttrSynchronizable;
  uint64_t v18 = (id)kSecAttrLabel;
  swift_bridgeObjectRetain(a4);
  uint64_t v19 = (id)kSecAttrApplicationLabel;
  id v20 = [v36 init];
  id v21 = [v20 UUIDString];

  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  uint64_t v24 = v23;

  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = sub_10000FC24();
  *(void *)(v10 + 32) = v22;
  *(void *)(v10 + 40) = v24;
  *(void *)(inited + 280) = String.init(format:_:)(0xD00000000000001ALL, 0x80000001001FBAC0LL, v10);
  *(void *)(inited + 288) = v25;
  *(void *)(inited + 304) = &type metadata for String;
  *(void *)(inited + 312) = kSecValueData;
  *(void *)(inited + 344) = &type metadata for Data;
  *(void *)(inited + 320) = a1;
  *(void *)(inited + 328) = a2;
  uint64_t v26 = (id)kSecValueData;
  sub_1000084E8(a1, a2);
  SEL v27 = (_TtC18TrustedPeersHelper6Client *)sub_10000BAC0(inited);
  LOBYTE(v4) = sub_1001B22A0(v27);
  swift_bridgeObjectRelease(v27, v28, v29, v30, v31, v32, v33, v34);
  return v4 & 1;
}

uint64_t sub_1001B26DC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = sub_100007578((uint64_t *)&unk_100256EE0);
  uint64_t inited = swift_initStackObject(v6, v44);
  *(_OWORD *)(inited + 16) = xmmword_1001DE700;
  *(void *)(inited + 32) = kSecClass;
  type metadata accessor for CFString(0LL);
  *(void *)(inited + 40) = kSecClassKey;
  *(void *)(inited + 64) = v8;
  *(void *)(inited + 72) = kSecAttrAccessible;
  *(void *)(inited + 80) = kSecAttrAccessibleWhenUnlocked;
  *(void *)(inited + 104) = v8;
  *(void *)(inited + 112) = kSecUseDataProtectionKeychain;
  *(_BYTE *)(inited + 120) = 1;
  *(void *)(inited + 144) = &type metadata for Bool;
  *(void *)(inited + 152) = kSecAttrAccessGroup;
  *(void *)(inited + 160) = 0xD00000000000001ALL;
  *(void *)(inited + 168) = 0x80000001001E79C0LL;
  *(void *)(inited + 184) = &type metadata for String;
  *(void *)(inited + 192) = kSecAttrSynchronizable;
  *(_BYTE *)(inited + 200) = 0;
  *(void *)(inited + 224) = &type metadata for Bool;
  *(void *)(inited + 232) = kSecAttrApplicationLabel;
  uint64_t v9 = sub_100007578(&qword_100251578);
  uint64_t v10 = swift_allocObject(v9, 72LL, 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_1001DE710;
  id v11 = objc_allocWithZone(&OBJC_CLASS___NSUUID);
  BOOL v12 = (id)kSecClass;
  BOOL v13 = (id)kSecClassKey;
  unint64_t v14 = (id)kSecAttrAccessible;
  uint64_t v15 = (id)kSecAttrAccessibleWhenUnlocked;
  uint64_t v16 = (id)kSecUseDataProtectionKeychain;
  unint64_t v17 = (id)kSecAttrAccessGroup;
  uint64_t v18 = (id)kSecAttrSynchronizable;
  uint64_t v19 = (id)kSecAttrApplicationLabel;
  id v20 = [v11 init];
  id v21 = [v20 UUIDString];

  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  uint64_t v24 = v23;

  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = sub_10000FC24();
  *(void *)(v10 + 32) = v22;
  *(void *)(v10 + 40) = v24;
  *(void *)(inited + 240) = String.init(format:_:)(a5, a6, v10);
  *(void *)(inited + 248) = v25;
  *(void *)(inited + 264) = &type metadata for String;
  *(void *)(inited + 272) = kSecAttrLabel;
  *(void *)(inited + 280) = a3;
  *(void *)(inited + 288) = a4;
  *(void *)(inited + 304) = &type metadata for String;
  *(void *)(inited + 312) = kSecValueData;
  *(void *)(inited + 344) = &type metadata for Data;
  *(void *)(inited + 320) = a1;
  *(void *)(inited + 328) = a2;
  uint64_t v26 = (id)kSecAttrLabel;
  swift_bridgeObjectRetain(a4);
  SEL v27 = (id)kSecValueData;
  sub_1000084E8(a1, a2);
  SEL v28 = (_TtC18TrustedPeersHelper6Client *)sub_10000BAC0(inited);
  char v29 = sub_1001B22A0(v28);
  swift_bridgeObjectRelease(v28, v30, v31, v32, v33, v34, v35, v36);
  return v29 & 1;
}

unint64_t sub_1001B2968()
{
  unint64_t result = qword_1002510E8;
  if (!qword_1002510E8)
  {
    type metadata accessor for CFString(255LL);
    unint64_t result = swift_getWitnessTable(&unk_1001DE394, v1);
    atomic_store(result, (unint64_t *)&qword_1002510E8);
  }

  return result;
}

ValueMetadata *type metadata accessor for EscrowKeysError()
{
  return &type metadata for EscrowKeysError;
}

void sub_1001B29C0(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v2 = a1;
    }
    else {
      uint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = __CocoaSet.makeIterator()(v2);
    uint64_t v4 = type metadata accessor for EscrowRecordMO();
    unint64_t v5 = sub_1001B6D90();
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)Set.Iterator.init(_cocoa:)(v38, v3, v4, v5);
    uint64_t v1 = v38[0];
    uint64_t v36 = v38[1];
    uint64_t v7 = v38[2];
    uint64_t v8 = v38[3];
    unint64_t v9 = v38[4];
  }

  else
  {
    uint64_t v10 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v36 = a1 + 56;
    uint64_t v7 = ~v10;
    uint64_t v11 = -v10;
    if (v11 < 64) {
      uint64_t v12 = ~(-1LL << v11);
    }
    else {
      uint64_t v12 = -1LL;
    }
    unint64_t v9 = v12 & *(void *)(a1 + 56);
    uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRetain(a1);
    uint64_t v8 = 0LL;
  }

  uint64_t v33 = v7;
  id v34 = _swiftEmptyArrayStorage;
  int64_t v35 = (unint64_t)(v7 + 64) >> 6;
  while (1)
  {
    uint64_t v13 = v8;
    if ((v1 & 0x8000000000000000LL) == 0) {
      break;
    }
    uint64_t v16 = __CocoaSet.Iterator.next()(isUniquelyReferenced_nonNull_native);
    if (!v16) {
      goto LABEL_42;
    }
    uint64_t v17 = v16;
    uint64_t v37 = v16;
    uint64_t v18 = type metadata accessor for EscrowRecordMO();
    swift_unknownObjectRetain(v17, v19);
    swift_dynamicCast(&v39, &v37, (char *)&type metadata for Swift.AnyObject + 8, v18, 7LL);
    id v20 = v39;
    swift_unknownObjectRelease(v17);
    if (!v20) {
      goto LABEL_42;
    }
LABEL_35:
    id v24 = objc_msgSend(v20, "escrowMetadata", v33);
    if (v24
      && (uint64_t v25 = v24, v26 = [v24 bottleID], v25, v26))
    {
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      uint64_t v29 = v28;

      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v34);
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_1001498EC(0LL, v34[2] + 1LL, 1, v34);
        id v34 = (void *)isUniquelyReferenced_nonNull_native;
      }

      unint64_t v31 = v34[2];
      unint64_t v30 = v34[3];
      if (v31 >= v30 >> 1)
      {
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_1001498EC((void *)(v30 > 1), v31 + 1, 1, v34);
        id v34 = (void *)isUniquelyReferenced_nonNull_native;
      }

      v34[2] = v31 + 1;
      int64_t v32 = &v34[2 * v31];
      v32[4] = v27;
      v32[5] = v29;
    }

    else
    {
    }
  }

  if (v9)
  {
    unint64_t v14 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v15 = v14 | (v8 << 6);
LABEL_34:
    id v20 = *(id *)(*(void *)(v1 + 48) + 8 * v15);
    if (!v20) {
      goto LABEL_42;
    }
    goto LABEL_35;
  }

  int64_t v21 = v8 + 1;
  if (!__OFADD__(v8, 1LL))
  {
    if (v21 >= v35) {
      goto LABEL_42;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v21);
    ++v8;
    if (!v22)
    {
      uint64_t v8 = v13 + 2;
      if (v13 + 2 >= v35) {
        goto LABEL_42;
      }
      unint64_t v22 = *(void *)(v36 + 8 * v8);
      if (!v22)
      {
        uint64_t v8 = v13 + 3;
        if (v13 + 3 >= v35) {
          goto LABEL_42;
        }
        unint64_t v22 = *(void *)(v36 + 8 * v8);
        if (!v22)
        {
          uint64_t v8 = v13 + 4;
          if (v13 + 4 >= v35) {
            goto LABEL_42;
          }
          unint64_t v22 = *(void *)(v36 + 8 * v8);
          if (!v22)
          {
            uint64_t v8 = v13 + 5;
            if (v13 + 5 >= v35) {
              goto LABEL_42;
            }
            unint64_t v22 = *(void *)(v36 + 8 * v8);
            if (!v22)
            {
              uint64_t v23 = v13 + 6;
              while (v35 != v23)
              {
                unint64_t v22 = *(void *)(v36 + 8 * v23++);
                if (v22)
                {
                  uint64_t v8 = v23 - 1;
                  goto LABEL_33;
                }
              }

void sub_1001B2D30(uint64_t a1, uint64_t a2)
{
  uint64_t v579 = a2;
  uint64_t v4 = sub_100007578(&qword_1002520A0);
  uint64_t v6 = __chkstk_darwin(v4, v5);
  uint64_t v613 = (uint64_t)&v574 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v611 = (uint64_t)&v574 - v10;
  uint64_t v12 = __chkstk_darwin(v9, v11);
  uint64_t v607 = (uint64_t)&v574 - v13;
  uint64_t v15 = __chkstk_darwin(v12, v14);
  uint64_t v603 = (uint64_t)&v574 - v16;
  uint64_t v18 = __chkstk_darwin(v15, v17);
  uint64_t v599 = (uint64_t)&v574 - v19;
  uint64_t v21 = __chkstk_darwin(v18, v20);
  uint64_t v595 = (uint64_t)&v574 - v22;
  uint64_t v24 = __chkstk_darwin(v21, v23);
  uint64_t v591 = (uint64_t)&v574 - v25;
  uint64_t v27 = __chkstk_darwin(v24, v26);
  uint64_t v587 = (uint64_t)&v574 - v28;
  uint64_t v30 = __chkstk_darwin(v27, v29);
  uint64_t v615 = (uint64_t)&v574 - v31;
  uint64_t v33 = __chkstk_darwin(v30, v32);
  uint64_t v620 = (uint64_t)&v574 - v34;
  uint64_t v36 = __chkstk_darwin(v33, v35);
  uint64_t v631 = (uint64_t)&v574 - v37;
  __chkstk_darwin(v36, v38);
  uint64_t v630 = (uint64_t)&v574 - v39;
  uint64_t v656 = type metadata accessor for EscrowInformation.Metadata.ClientMetadata(0LL);
  uint64_t v629 = *(void *)(v656 - 8);
  uint64_t v41 = __chkstk_darwin(v656, v40);
  id v612 = (char *)&v574 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v44 = __chkstk_darwin(v41, v43);
  uint64_t v610 = (char *)&v574 - v45;
  uint64_t v47 = __chkstk_darwin(v44, v46);
  BOOL v606 = (char *)&v574 - v48;
  uint64_t v50 = __chkstk_darwin(v47, v49);
  id v602 = (char *)&v574 - v51;
  uint64_t v53 = __chkstk_darwin(v50, v52);
  id v598 = (char *)&v574 - v54;
  uint64_t v56 = __chkstk_darwin(v53, v55);
  SEL v594 = (char *)&v574 - v57;
  uint64_t v59 = __chkstk_darwin(v56, v58);
  id v590 = (char *)&v574 - v60;
  uint64_t v62 = __chkstk_darwin(v59, v61);
  v586 = (char *)&v574 - v63;
  uint64_t v65 = __chkstk_darwin(v62, v64);
  id v632 = (char *)&v574 - v66;
  uint64_t v68 = __chkstk_darwin(v65, v67);
  v619 = (_OWORD *)((char *)&v574 - v69);
  uint64_t v71 = __chkstk_darwin(v68, v70);
  v625 = (char *)&v574 - v72;
  __chkstk_darwin(v71, v73);
  BOOL v624 = (_OWORD *)((char *)&v574 - v74);
  v666 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for PasscodeGeneration(0LL);
  uint64_t v649 = *((void *)v666 - 1);
  __chkstk_darwin(v666, v75);
  id v576 = (uint64_t *)((char *)&v574 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v77 = sub_100007578(&qword_1002520E8);
  uint64_t v79 = __chkstk_darwin(v77, v78);
  uint64_t v578 = (uint64_t)&v574 - ((v80 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v79, v81);
  uint64_t v648 = (uint64_t)&v574 - v82;
  uint64_t v83 = sub_100007578(&qword_100252098);
  uint64_t v85 = __chkstk_darwin(v83, v84);
  uint64_t v609 = (uint64_t)&v574 - ((v86 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v88 = __chkstk_darwin(v85, v87);
  uint64_t v605 = (uint64_t)&v574 - v89;
  uint64_t v91 = __chkstk_darwin(v88, v90);
  uint64_t v601 = (uint64_t)&v574 - v92;
  uint64_t v94 = __chkstk_darwin(v91, v93);
  uint64_t v597 = (uint64_t)&v574 - v95;
  uint64_t v97 = __chkstk_darwin(v94, v96);
  uint64_t v593 = (uint64_t)&v574 - v98;
  uint64_t v100 = __chkstk_darwin(v97, v99);
  uint64_t v589 = (uint64_t)&v574 - v101;
  uint64_t v103 = __chkstk_darwin(v100, v102);
  uint64_t v585 = (uint64_t)&v574 - v104;
  uint64_t v106 = __chkstk_darwin(v103, v105);
  uint64_t v583 = (uint64_t)&v574 - v107;
  uint64_t v109 = __chkstk_darwin(v106, v108);
  v618 = (char *)&v574 - v110;
  uint64_t v112 = __chkstk_darwin(v109, v111);
  uint64_t v617 = (uint64_t)&v574 - v113;
  uint64_t v115 = __chkstk_darwin(v112, v114);
  uint64_t v628 = (uint64_t)&v574 - v116;
  uint64_t v118 = __chkstk_darwin(v115, v117);
  uint64_t v627 = (uint64_t)&v574 - v119;
  uint64_t v121 = __chkstk_darwin(v118, v120);
  uint64_t v577 = (uint64_t)&v574 - v122;
  uint64_t v124 = __chkstk_darwin(v121, v123);
  uint64_t v647 = (uint64_t)&v574 - v125;
  uint64_t v127 = __chkstk_darwin(v124, v126);
  uint64_t v645 = (uint64_t)&v574 - v128;
  uint64_t v130 = __chkstk_darwin(v127, v129);
  uint64_t v644 = (uint64_t)&v574 - v131;
  uint64_t v133 = __chkstk_darwin(v130, v132);
  uint64_t v642 = (uint64_t)&v574 - v134;
  uint64_t v136 = __chkstk_darwin(v133, v135);
  uint64_t v640 = (uint64_t)&v574 - v137;
  uint64_t v139 = __chkstk_darwin(v136, v138);
  uint64_t v637 = (uint64_t)&v574 - v140;
  uint64_t v142 = __chkstk_darwin(v139, v141);
  BOOL v655 = (uint64_t *)((char *)&v574 - v143);
  uint64_t v145 = __chkstk_darwin(v142, v144);
  id v654 = (uint64_t *)((char *)&v574 - v146);
  __chkstk_darwin(v145, v147);
  uint64_t v653 = (uint64_t)&v574 - v148;
  uint64_t v149 = type metadata accessor for EscrowInformation.Metadata(0LL);
  uint64_t v651 = *(void *)(v149 - 8);
  uint64_t v151 = __chkstk_darwin(v149, v150);
  uint64_t v608 = (uint64_t)&v574 - ((v152 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v154 = __chkstk_darwin(v151, v153);
  uint64_t v604 = (uint64_t)&v574 - v155;
  uint64_t v157 = __chkstk_darwin(v154, v156);
  uint64_t v600 = (uint64_t)&v574 - v158;
  uint64_t v160 = __chkstk_darwin(v157, v159);
  uint64_t v596 = (uint64_t)&v574 - v161;
  uint64_t v163 = __chkstk_darwin(v160, v162);
  uint64_t v592 = (uint64_t)&v574 - v164;
  uint64_t v166 = __chkstk_darwin(v163, v165);
  uint64_t v588 = (uint64_t)&v574 - v167;
  uint64_t v169 = __chkstk_darwin(v166, v168);
  uint64_t v584 = (uint64_t)&v574 - v170;
  uint64_t v172 = __chkstk_darwin(v169, v171);
  uint64_t v582 = (uint64_t)&v574 - v173;
  uint64_t v175 = __chkstk_darwin(v172, v174);
  uint64_t v614 = (uint64_t)&v574 - v176;
  uint64_t v178 = __chkstk_darwin(v175, v177);
  BOOL v616 = (uint64_t *)((char *)&v574 - v179);
  uint64_t v181 = __chkstk_darwin(v178, v180);
  uint64_t v623 = (uint64_t)&v574 - v182;
  uint64_t v184 = __chkstk_darwin(v181, v183);
  uint64_t v622 = (uint64_t)&v574 - v185;
  uint64_t v187 = __chkstk_darwin(v184, v186);
  uint64_t v575 = (uint64_t)&v574 - v188;
  uint64_t v190 = __chkstk_darwin(v187, v189);
  uint64_t v646 = (uint64_t)&v574 - v191;
  uint64_t v193 = __chkstk_darwin(v190, v192);
  id v643 = (char *)&v574 - v194;
  uint64_t v196 = __chkstk_darwin(v193, v195);
  uint64_t v641 = (uint64_t)&v574 - v197;
  uint64_t v199 = __chkstk_darwin(v196, v198);
  uint64_t v639 = (uint64_t)&v574 - v200;
  uint64_t v202 = __chkstk_darwin(v199, v201);
  uint64_t v638 = (uint64_t)&v574 - v203;
  uint64_t v205 = __chkstk_darwin(v202, v204);
  uint64_t v636 = (uint64_t)&v574 - v206;
  uint64_t v208 = __chkstk_darwin(v205, v207);
  uint64_t v633 = (uint64_t)&v574 - v209;
  uint64_t v211 = __chkstk_darwin(v208, v210);
  uint64_t v652 = (uint64_t)&v574 - v212;
  __chkstk_darwin(v211, v213);
  uint64_t v650 = (uint64_t)&v574 - v214;
  uint64_t v662 = type metadata accessor for Date(0LL);
  unint64_t v215 = *(void **)(v662 - 8);
  __chkstk_darwin(v662, v216);
  id v661 = (char *)&v574 - ((v217 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v218 = sub_100007578((uint64_t *)&unk_100256D30);
  uint64_t v220 = __chkstk_darwin(v218, v219);
  uint64_t v626 = (uint64_t)&v574 - ((v221 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v223 = __chkstk_darwin(v220, v222);
  uint64_t v635 = (uint64_t)&v574 - v224;
  __chkstk_darwin(v223, v225);
  os_log_type_t v227 = (char *)&v574 - v226;
  uint64_t v228 = type metadata accessor for Google_Protobuf_Timestamp(0LL);
  uint64_t v229 = *(void *)(v228 - 8);
  uint64_t v231 = __chkstk_darwin(v228, v230);
  v621 = (char *)&v574 - ((v232 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v234 = __chkstk_darwin(v231, v233);
  BOOL v634 = (char *)&v574 - v235;
  __chkstk_darwin(v234, v236);
  BOOL v238 = (char *)&v574 - v237;
  uint64_t v239 = type metadata accessor for EscrowRecordMO();
  uint64_t v580 = v2;
  id v240 = *(void **)(v2 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_moc);
  id v241 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v239));
  id v667 = v240;
  uint64_t v242 = (uint64_t *)[v241 initWithContext:v240];
  NSString v243 = String._bridgeToObjectiveC()();
  id v660 = v242;
  [v242 setLabel:v243];

  uint64_t v244 = type metadata accessor for EscrowInformation(0LL);
  sub_10000FC68(a1 + *(int *)(v244 + 48), (uint64_t)v227, (uint64_t *)&unk_100256D30);
  SEL v657 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v229 + 48);
  if (v657(v227, 1LL, v228) == 1)
  {
    Google_Protobuf_Timestamp.init()();
    uint64_t v245 = sub_100041590((uint64_t)v227, (uint64_t *)&unk_100256D30);
  }

  else
  {
    uint64_t v245 = (*(uint64_t (**)(char *, char *, uint64_t))(v229 + 32))(v238, v227, v228);
  }

  uint64_t v246 = v661;
  Google_Protobuf_Timestamp.date.getter(v245);
  uint64_t v664 = v229;
  unint64_t v247 = *(void (**)(void, void))(v229 + 8);
  uint64_t v665 = v228;
  int64_t v659 = (void (*)(char *, uint64_t))v247;
  v247(v238, v228);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v658 = (void (*)(char *, uint64_t))v215[1];
  v658(v246, v662);
  SEL v249 = v660;
  [v660 setCreationDate:isa];

  if ((*(void *)a1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_177;
  }

  objc_msgSend(v249, "setRemainingAttempts:");
  if ((*(void *)(a1 + 24) & 0x8000000000000000LL) != 0)
  {
LABEL_177:
    __break(1u);
LABEL_178:
    __break(1u);
LABEL_179:
    __break(1u);
LABEL_180:
    __break(1u);
LABEL_181:
    __break(1u);
    goto LABEL_182;
  }

  objc_msgSend(v249, "setSilentAttemptAllowed:");
  if (*(_BYTE *)(a1 + 40)) {
    uint64_t v250 = *(void *)(a1 + 32) != 0LL;
  }
  else {
    uint64_t v250 = *(void *)(a1 + 32);
  }
  [v249 setRecordStatus:v250];
  [v249 setSosViability:*(void *)(a1 + 48)];
  NSString v251 = String._bridgeToObjectiveC()();
  [v249 setFederationID:v251];

  NSString v252 = String._bridgeToObjectiveC()();
  [v249 setExpectedFederationID:v252];

  uint64_t v253 = type metadata accessor for EscrowMetadataMO();
  id v254 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v253));
  id v663 = [v254 initWithContext:v667];
  uint64_t v255 = a1 + *(int *)(v244 + 52);
  uint64_t v256 = v653;
  sub_10000FC68(v255, v653, &qword_100252098);
  uint64_t v257 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v651 + 48);
  if (v257(v256, 1LL, v149) == 1)
  {
    uint64_t v258 = v650;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v259 = *(int *)(v149 + 20);
    SEL v260 = v655;
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v261 = qword_100251ED8;
    *(void *)(v258 + v259) = qword_100251ED8;
    swift_retain(v261);
    sub_100041590(v256, &qword_100252098);
  }

  else
  {
    uint64_t v258 = v650;
    sub_100041608(v256, v650, type metadata accessor for EscrowInformation.Metadata);
    SEL v260 = v655;
  }

  uint64_t v262 = *(void *)(v258 + *(int *)(v149 + 20));
  swift_beginAccess(v262 + 16, v690, 0LL, 0LL);
  uint64_t v263 = *(void *)(v262 + 16);
  SEL v249 = *(uint64_t **)(v262 + 24);
  sub_1000084E8(v263, (unint64_t)v249);
  sub_1000415CC(v258, type metadata accessor for EscrowInformation.Metadata);
  Class v264 = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v263, (unint64_t)v249);
  [v663 setBackupKeybagDigest:v264];

  unint64_t v215 = v654;
  sub_10000FC68(v255, (uint64_t)v654, &qword_100252098);
  if (v257((uint64_t)v215, 1LL, v149) == 1)
  {
    uint64_t v265 = v652;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v266 = *(int *)(v149 + 20);
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v267 = qword_100251ED8;
    *(void *)(v265 + v266) = qword_100251ED8;
    swift_retain(v267);
    sub_100041590((uint64_t)v215, &qword_100252098);
  }

  else
  {
    uint64_t v265 = v652;
    sub_100041608((uint64_t)v215, v652, type metadata accessor for EscrowInformation.Metadata);
  }

  id v268 = v663;
  swift_beginAccess(v269, v689, 0LL, 0LL);
  uint64_t v270 = *v269;
  sub_1000415CC(v265, type metadata accessor for EscrowInformation.Metadata);
  if (v270 < 0) {
    goto LABEL_178;
  }
  [v268 setSecureBackupUsesMultipleiCSCS:v270];
  sub_10000FC68(v255, (uint64_t)v260, &qword_100252098);
  os_log_type_t v271 = v257;
  if (v257((uint64_t)v260, 1LL, v149) != 1)
  {
    uint64_t v272 = v633;
    sub_100041608((uint64_t)v260, v633, type metadata accessor for EscrowInformation.Metadata);
    goto LABEL_24;
  }

  uint64_t v272 = v633;
  _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  id v273 = (id)*(int *)(v149 + 20);
  if (qword_100250E50 != -1) {
    goto LABEL_185;
  }
  while (1)
  {
    uint64_t v274 = qword_100251ED8;
    *(void *)((char *)v273 + v272) = qword_100251ED8;
    swift_retain(v274);
    sub_100041590((uint64_t)v260, &qword_100252098);
LABEL_24:
    swift_beginAccess(v275, v688, 0LL, 0LL);
    id v276 = *(_TtC18TrustedPeersHelper6Client **)(v275 + 8);
    swift_bridgeObjectRetain(v276);
    sub_1000415CC(v272, type metadata accessor for EscrowInformation.Metadata);
    NSString v277 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v276, v278, v279, v280, v281, v282, v283, v284);
    [v268 setBottleID:v277];

    uint64_t v285 = v637;
    sub_10000FC68(v255, v637, &qword_100252098);
    if (v271(v285, 1LL, v149) == 1)
    {
      uint64_t v286 = v636;
      _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
      uint64_t v287 = *(int *)(v149 + 20);
      if (qword_100250E50 != -1) {
        swift_once(&qword_100250E50, sub_10009EA7C);
      }
      uint64_t v288 = qword_100251ED8;
      *(void *)(v286 + v287) = qword_100251ED8;
      swift_retain(v288);
      sub_100041590(v285, &qword_100252098);
      uint64_t v289 = v286;
    }

    else
    {
      uint64_t v290 = v285;
      uint64_t v289 = v636;
      sub_100041608(v290, v636, type metadata accessor for EscrowInformation.Metadata);
    }

    uint64_t v291 = v634;
    uint64_t v292 = v271;
    swift_beginAccess(v293, v687, 0LL, 0LL);
    uint64_t v294 = v293;
    uint64_t v295 = v635;
    sub_10000FC68(v294, v635, (uint64_t *)&unk_100256D30);
    uint64_t v296 = v665;
    int64_t v297 = v268;
    if (v657((char *)v295, 1LL, v665) == 1)
    {
      Google_Protobuf_Timestamp.init()();
      sub_100041590(v295, (uint64_t *)&unk_100256D30);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v664 + 32))(v291, v295, v296);
    }

    uint64_t v298 = sub_1000415CC(v289, type metadata accessor for EscrowInformation.Metadata);
    id v299 = v661;
    Google_Protobuf_Timestamp.date.getter(v298);
    v659(v291, v296);
    Class v300 = Date._bridgeToObjectiveC()().super.isa;
    v658(v299, v662);
    [v268 setSecureBackupTimestamp:v300];

    uint64_t v301 = v640;
    sub_10000FC68(v255, v640, &qword_100252098);
    if (v292(v301, 1LL, v149) == 1)
    {
      uint64_t v302 = v638;
      _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
      uint64_t v303 = *(int *)(v149 + 20);
      if (qword_100250E50 != -1) {
        swift_once(&qword_100250E50, sub_10009EA7C);
      }
      uint64_t v304 = qword_100251ED8;
      *(void *)(v302 + v303) = qword_100251ED8;
      swift_retain(v304);
      sub_100041590(v301, &qword_100252098);
    }

    else
    {
      uint64_t v302 = v638;
      sub_100041608(v301, v638, type metadata accessor for EscrowInformation.Metadata);
    }

    swift_beginAccess(v305, v686, 0LL, 0LL);
    uint64_t v307 = *v305;
    unint64_t v306 = v305[1];
    sub_1000084E8(v307, v306);
    sub_1000415CC(v302, type metadata accessor for EscrowInformation.Metadata);
    Class v308 = Data._bridgeToObjectiveC()().super.isa;
    sub_10000852C(v307, v306);
    [v297 setEscrowedSPKI:v308];

    uint64_t v309 = v642;
    sub_10000FC68(v255, v642, &qword_100252098);
    if (v292(v309, 1LL, v149) == 1)
    {
      uint64_t v310 = v639;
      _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
      uint64_t v311 = *(int *)(v149 + 20);
      if (qword_100250E50 != -1) {
        swift_once(&qword_100250E50, sub_10009EA7C);
      }
      uint64_t v312 = qword_100251ED8;
      *(void *)(v310 + v311) = qword_100251ED8;
      swift_retain(v312);
      sub_100041590(v309, &qword_100252098);
    }

    else
    {
      uint64_t v310 = v639;
      sub_100041608(v309, v639, type metadata accessor for EscrowInformation.Metadata);
    }

    swift_beginAccess(v313, v685, 0LL, 0LL);
    uint64_t v315 = *v313;
    unint64_t v314 = v313[1];
    sub_1000084E8(v315, v314);
    sub_1000415CC(v310, type metadata accessor for EscrowInformation.Metadata);
    Class v316 = Data._bridgeToObjectiveC()().super.isa;
    sub_10000852C(v315, v314);
    [v297 setPeerInfo:v316];

    uint64_t v317 = v644;
    sub_10000FC68(v255, v644, &qword_100252098);
    if (v292(v317, 1LL, v149) == 1)
    {
      uint64_t v318 = v641;
      _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
      uint64_t v319 = *(int *)(v149 + 20);
      uint64_t v320 = (uint64_t)v643;
      if (qword_100250E50 != -1) {
        swift_once(&qword_100250E50, sub_10009EA7C);
      }
      uint64_t v321 = qword_100251ED8;
      *(void *)(v318 + v319) = qword_100251ED8;
      swift_retain(v321);
      sub_100041590(v317, &qword_100252098);
    }

    else
    {
      uint64_t v318 = v641;
      sub_100041608(v317, v641, type metadata accessor for EscrowInformation.Metadata);
      uint64_t v320 = (uint64_t)v643;
    }

    swift_beginAccess(v322, v684, 0LL, 0LL);
    uint64_t v323 = *(_TtC18TrustedPeersHelper6Client **)(v322 + 8);
    swift_bridgeObjectRetain(v323);
    sub_1000415CC(v318, type metadata accessor for EscrowInformation.Metadata);
    NSString v324 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v323, v325, v326, v327, v328, v329, v330, v331);
    [v297 setSerial:v324];

    uint64_t v332 = v645;
    sub_10000FC68(v255, v645, &qword_100252098);
    if (v292(v332, 1LL, v149) == 1)
    {
      _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
      uint64_t v333 = *(int *)(v149 + 20);
      if (qword_100250E50 != -1) {
        swift_once(&qword_100250E50, sub_10009EA7C);
      }
      uint64_t v334 = qword_100251ED8;
      *(void *)(v320 + v333) = qword_100251ED8;
      swift_retain(v334);
      sub_100041590(v332, &qword_100252098);
    }

    else
    {
      sub_100041608(v332, v320, type metadata accessor for EscrowInformation.Metadata);
    }

    swift_beginAccess(v335, &v683, 0LL, 0LL);
    v336 = *(_TtC18TrustedPeersHelper6Client **)(v335 + 8);
    swift_bridgeObjectRetain(v336);
    sub_1000415CC(v320, type metadata accessor for EscrowInformation.Metadata);
    NSString v337 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v336, v338, v339, v340, v341, v342, v343, v344);
    [v297 setBuild:v337];

    uint64_t v345 = v647;
    sub_10000FC68(v255, v647, &qword_100252098);
    if (v292(v345, 1LL, v149) == 1)
    {
      uint64_t v346 = v646;
      _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
      uint64_t v347 = *(int *)(v149 + 20);
      if (qword_100250E50 != -1) {
        swift_once(&qword_100250E50, sub_10009EA7C);
      }
      uint64_t v348 = qword_100251ED8;
      *(void *)(v346 + v347) = qword_100251ED8;
      swift_retain(v348);
      sub_100041590(v345, &qword_100252098);
    }

    else
    {
      uint64_t v346 = v646;
      sub_100041608(v345, v646, type metadata accessor for EscrowInformation.Metadata);
    }

    SEL v260 = &OBJC_IVAR____TtCV18TrustedPeersHelper23GetRepairActionResponseP33_34B9299B76A248B7A76BCBE38D1FA2CF13_StorageClass__collectedEscrowRecords;
    swift_beginAccess(v349, &v682, 0LL, 0LL);
    uint64_t v350 = v648;
    sub_10000FC68(v349, v648, &qword_1002520E8);
    BOOL v351 = *(uint64_t (**)(uint64_t, uint64_t, void *))(v649 + 48);
    LODWORD(v349) = v351(v350, 1LL, v666);
    sub_100041590(v350, &qword_1002520E8);
    sub_1000415CC(v346, type metadata accessor for EscrowInformation.Metadata);
    if ((_DWORD)v349 == 1) {
      break;
    }
    uint64_t v352 = type metadata accessor for PasscodeGen();
    id v353 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v352));
    id v273 = [v353 initWithContext:v667];
    uint64_t v354 = v577;
    sub_10000FC68(v255, v577, &qword_100252098);
    if (v292(v354, 1LL, v149) == 1)
    {
      uint64_t v355 = v575;
      _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
      uint64_t v356 = *(int *)(v149 + 20);
      if (qword_100250E50 != -1) {
        swift_once(&qword_100250E50, sub_10009EA7C);
      }
      uint64_t v357 = qword_100251ED8;
      *(void *)(v355 + v356) = qword_100251ED8;
      swift_retain(v357);
      sub_100041590(v354, &qword_100252098);
      uint64_t v272 = v355;
    }

    else
    {
      uint64_t v358 = v354;
      uint64_t v272 = v575;
      sub_100041608(v358, v575, type metadata accessor for EscrowInformation.Metadata);
    }

    swift_beginAccess(v359, &v668, 0LL, 0LL);
    uint64_t v360 = v578;
    sub_10000FC68(v359, v578, &qword_1002520E8);
    if (v351(v360, 1LL, v666) == 1)
    {
      uint64_t v361 = v360;
      os_log_type_t v271 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v576;
      *id v576 = 0LL;
      _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
      sub_100041590(v361, &qword_1002520E8);
    }

    else
    {
      uint64_t v362 = v360;
      os_log_type_t v271 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v576;
      sub_100041608(v362, (uint64_t)v576, type metadata accessor for PasscodeGeneration);
    }

    id v268 = v663;
    sub_1000415CC(v272, type metadata accessor for EscrowInformation.Metadata);
    uint64_t v363 = *(void *)v271;
    sub_1000415CC((uint64_t)v271, type metadata accessor for PasscodeGeneration);
    if ((v363 & 0x8000000000000000LL) == 0)
    {
      [v273 setValue:v363];
      [v268 setPasscodeGen:v273];

      break;
    }

    __break(1u);
LABEL_185:
    swift_once(&qword_100250E50, sub_10009EA7C);
  }

  [v660 setEscrowMetadata:v663];
  uint64_t v364 = type metadata accessor for EscrowClientMetadataMO();
  id v365 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v364));
  id v667 = [v365 initWithContext:v667];
  uint64_t v366 = v627;
  sub_10000FC68(v255, v627, &qword_100252098);
  unsigned int v367 = v292(v366, 1LL, v149);
  SEL v249 = (uint64_t *)v632;
  uint64_t v581 = v255;
  if (v367 == 1)
  {
    uint64_t v368 = v622;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v369 = *(int *)(v149 + 20);
    unint64_t v215 = v625;
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v370 = qword_100251ED8;
    *(void *)(v368 + v369) = qword_100251ED8;
    swift_retain(v370);
    sub_100041590(v366, &qword_100252098);
    uint64_t v371 = v368;
  }

  else
  {
    uint64_t v372 = v366;
    uint64_t v371 = v622;
    sub_100041608(v372, v622, type metadata accessor for EscrowInformation.Metadata);
    unint64_t v215 = v625;
  }

  BOOL v655 = (uint64_t *)v292;
  swift_beginAccess(v373, &v681, 0LL, 0LL);
  uint64_t v374 = v630;
  sub_10000FC68(v373, v630, &qword_1002520A0);
  uint64_t v375 = v656;
  v666 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v629 + 48);
  if (v666(v374, 1LL, v656) == 1)
  {
    int64_t v376 = v624;
    *BOOL v624 = 0u;
    v376[1] = 0u;
    *((void *)v376 + 6) = 0xE000000000000000LL;
    *((void *)v376 + 7) = 0LL;
    *((void *)v376 + 8) = 0xE000000000000000LL;
    *((void *)v376 + 9) = 0LL;
    *((void *)v376 + 10) = 0xE000000000000000LL;
    *((void *)v376 + 11) = 0LL;
    *((void *)v376 + 12) = 0xE000000000000000LL;
    *((void *)v376 + 13) = 0LL;
    *((void *)v376 + 14) = 0xE000000000000000LL;
    *((void *)v376 + 15) = 0LL;
    *((void *)v376 + 16) = 0xE000000000000000LL;
    *((void *)v376 + 17) = 0LL;
    *((void *)v376 + 4) = 0xE000000000000000LL;
    *((void *)v376 + 5) = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v377 = v664;
    uint64_t v378 = v665;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v664 + 56))( (char *)v376 + *(int *)(v375 + 64),  1LL,  1LL,  v665);
    sub_100041590(v374, &qword_1002520A0);
  }

  else
  {
    int64_t v376 = v624;
    sub_100041608(v374, (uint64_t)v624, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
    uint64_t v377 = v664;
    uint64_t v378 = v665;
  }

  sub_1000415CC(v371, type metadata accessor for EscrowInformation.Metadata);
  uint64_t v379 = v626;
  sub_10000FC68((uint64_t)v376 + *(int *)(v375 + 64), v626, (uint64_t *)&unk_100256D30);
  if (v657((char *)v379, 1LL, v378) == 1)
  {
    BOOL v380 = v621;
    Google_Protobuf_Timestamp.init()();
    sub_100041590(v379, (uint64_t *)&unk_100256D30);
  }

  else
  {
    id v381 = *(void (**)(char *, uint64_t, uint64_t))(v377 + 32);
    BOOL v380 = v621;
    v381(v621, v379, v378);
  }

  uint64_t v382 = sub_1000415CC((uint64_t)v376, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  uint64_t v383 = v661;
  Google_Protobuf_Timestamp.date.getter(v382);
  v659(v380, v378);
  Class v384 = Date._bridgeToObjectiveC()().super.isa;
  v658(v383, v662);
  [v667 setSecureBackupMetadataTimestamp:v384];

  uint64_t v385 = v581;
  uint64_t v386 = v628;
  sub_10000FC68(v581, v628, &qword_100252098);
  uint64_t v387 = v655;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v655)(v386, 1LL, v149) == 1)
  {
    uint64_t v388 = v656;
    uint64_t v389 = v385;
    SEL v390 = v387;
    uint64_t v391 = v623;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v392 = *(int *)(v149 + 20);
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v393 = qword_100251ED8;
    *(void *)(v391 + v392) = qword_100251ED8;
    swift_retain(v393);
    sub_100041590(v386, &qword_100252098);
    uint64_t v394 = v391;
    uint64_t v387 = v390;
    uint64_t v385 = v389;
    BOOL v395 = (int *)v388;
  }

  else
  {
    uint64_t v396 = v386;
    uint64_t v394 = v623;
    sub_100041608(v396, v623, type metadata accessor for EscrowInformation.Metadata);
    BOOL v395 = (int *)v656;
  }

  swift_beginAccess(v397, &v680, 0LL, 0LL);
  uint64_t v398 = v397;
  uint64_t v399 = v631;
  sub_10000FC68(v398, v631, &qword_1002520A0);
  unsigned int v400 = v666(v399, 1LL, (uint64_t)v395);
  uint64_t v401 = v665;
  if (v400 == 1)
  {
    *(_OWORD *)unint64_t v215 = 0u;
    *((_OWORD *)v215 + 1) = 0u;
    v215[6] = 0xE000000000000000LL;
    v215[7] = 0LL;
    v215[8] = 0xE000000000000000LL;
    v215[9] = 0LL;
    v215[10] = 0xE000000000000000LL;
    v215[11] = 0LL;
    v215[12] = 0xE000000000000000LL;
    v215[13] = 0LL;
    v215[14] = 0xE000000000000000LL;
    v215[15] = 0LL;
    v215[16] = 0xE000000000000000LL;
    v215[17] = 0LL;
    v215[4] = 0xE000000000000000LL;
    v215[5] = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v664 + 56))((char *)v215 + v395[16], 1LL, 1LL, v401);
    sub_100041590(v399, &qword_1002520A0);
  }

  else
  {
    sub_100041608(v399, (uint64_t)v215, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  sub_1000415CC(v394, type metadata accessor for EscrowInformation.Metadata);
  uint64_t v402 = *v215;
  sub_1000415CC((uint64_t)v215, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  if (v402 < 0) {
    goto LABEL_179;
  }
  [v667 setSecureBackupNumericPassphraseLength:v402];
  uint64_t v403 = v617;
  sub_10000FC68(v385, v617, &qword_100252098);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v387)(v403, 1LL, v149) == 1)
  {
    uint64_t v404 = (uint64_t)v616;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v405 = *(int *)(v149 + 20);
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v406 = qword_100251ED8;
    *(void *)(v404 + v405) = qword_100251ED8;
    swift_retain(v406);
    sub_100041590(v403, &qword_100252098);
    unint64_t v215 = (void *)v404;
  }

  else
  {
    uint64_t v407 = v403;
    unint64_t v215 = v616;
    sub_100041608(v407, (uint64_t)v616, type metadata accessor for EscrowInformation.Metadata);
  }

  swift_beginAccess(v408, &v679, 0LL, 0LL);
  uint64_t v409 = v620;
  sub_10000FC68(v408, v620, &qword_1002520A0);
  if (v666(v409, 1LL, (uint64_t)v395) == 1)
  {
    int64_t v410 = v619;
    _OWORD *v619 = 0u;
    v410[1] = 0u;
    *((void *)v410 + 6) = 0xE000000000000000LL;
    *((void *)v410 + 7) = 0LL;
    *((void *)v410 + 8) = 0xE000000000000000LL;
    *((void *)v410 + 9) = 0LL;
    *((void *)v410 + 10) = 0xE000000000000000LL;
    *((void *)v410 + 11) = 0LL;
    *((void *)v410 + 12) = 0xE000000000000000LL;
    *((void *)v410 + 13) = 0LL;
    *((void *)v410 + 14) = 0xE000000000000000LL;
    *((void *)v410 + 15) = 0LL;
    *((void *)v410 + 16) = 0xE000000000000000LL;
    *((void *)v410 + 17) = 0LL;
    *((void *)v410 + 4) = 0xE000000000000000LL;
    *((void *)v410 + 5) = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v664 + 56))((char *)v410 + v395[16], 1LL, 1LL, v401);
    sub_100041590(v409, &qword_1002520A0);
  }

  else
  {
    int64_t v410 = v619;
    sub_100041608(v409, (uint64_t)v619, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  sub_1000415CC((uint64_t)v215, type metadata accessor for EscrowInformation.Metadata);
  uint64_t v411 = (uint64_t)v410;
  uint64_t v412 = *((void *)v410 + 1);
  sub_1000415CC(v411, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  uint64_t v413 = (uint64_t)v618;
  if (v412 < 0) {
    goto LABEL_180;
  }
  [v667 setSecureBackupUsesComplexPassphrase:v412];
  sub_10000FC68(v385, v413, &qword_100252098);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v387)(v413, 1LL, v149) == 1)
  {
    unint64_t v215 = v395;
    uint64_t v414 = v385;
    id v415 = v387;
    uint64_t v416 = v614;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v417 = *(int *)(v149 + 20);
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v418 = qword_100251ED8;
    *(void *)(v416 + v417) = qword_100251ED8;
    swift_retain(v418);
    sub_100041590(v413, &qword_100252098);
    uint64_t v419 = v416;
    uint64_t v387 = v415;
    uint64_t v385 = v414;
    BOOL v395 = (int *)v215;
  }

  else
  {
    uint64_t v420 = v413;
    uint64_t v419 = v614;
    sub_100041608(v420, v614, type metadata accessor for EscrowInformation.Metadata);
  }

  swift_beginAccess(v421, &v678, 0LL, 0LL);
  uint64_t v422 = v421;
  uint64_t v423 = v615;
  sub_10000FC68(v422, v615, &qword_1002520A0);
  if (v666(v423, 1LL, (uint64_t)v395) == 1)
  {
    *(_OWORD *)SEL v249 = 0u;
    *((_OWORD *)v249 + 1) = 0u;
    v249[6] = 0xE000000000000000LL;
    v249[7] = 0LL;
    v249[8] = 0xE000000000000000LL;
    v249[9] = 0LL;
    v249[10] = 0xE000000000000000LL;
    v249[11] = 0LL;
    v249[12] = 0xE000000000000000LL;
    v249[13] = 0LL;
    v249[14] = 0xE000000000000000LL;
    v249[15] = 0LL;
    v249[16] = 0xE000000000000000LL;
    v249[17] = 0LL;
    v249[4] = 0xE000000000000000LL;
    v249[5] = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v664 + 56))((char *)v249 + v395[16], 1LL, 1LL, v401);
    sub_100041590(v423, &qword_1002520A0);
  }

  else
  {
    sub_100041608(v423, (uint64_t)v249, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  sub_1000415CC(v419, type metadata accessor for EscrowInformation.Metadata);
  uint64_t v424 = v249[2];
  sub_1000415CC((uint64_t)v249, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  if (v424 < 0) {
    goto LABEL_181;
  }
  [v667 setSecureBackupUsesNumericPassphrase:v424];
  uint64_t v425 = v583;
  sub_10000FC68(v385, v583, &qword_100252098);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v387)(v425, 1LL, v149) == 1)
  {
    uint64_t v426 = v582;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v427 = *(int *)(v149 + 20);
    uint64_t v428 = (uint64_t)v586;
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v429 = qword_100251ED8;
    *(void *)(v426 + v427) = qword_100251ED8;
    swift_retain(v429);
    sub_100041590(v425, &qword_100252098);
  }

  else
  {
    uint64_t v426 = v582;
    sub_100041608(v425, v582, type metadata accessor for EscrowInformation.Metadata);
    uint64_t v428 = (uint64_t)v586;
  }

  swift_beginAccess(v430, &v677, 0LL, 0LL);
  uint64_t v431 = v430;
  uint64_t v432 = v587;
  sub_10000FC68(v431, v587, &qword_1002520A0);
  if (v666(v432, 1LL, (uint64_t)v395) == 1)
  {
    *(_OWORD *)uint64_t v428 = 0u;
    *(_OWORD *)(v428 + 16) = 0u;
    *(void *)(v428 + 48) = 0xE000000000000000LL;
    *(void *)(v428 + 56) = 0LL;
    *(void *)(v428 + 64) = 0xE000000000000000LL;
    *(void *)(v428 + 72) = 0LL;
    *(void *)(v428 + 80) = 0xE000000000000000LL;
    *(void *)(v428 + 88) = 0LL;
    *(void *)(v428 + 96) = 0xE000000000000000LL;
    *(void *)(v428 + 104) = 0LL;
    *(void *)(v428 + 112) = 0xE000000000000000LL;
    *(void *)(v428 + 120) = 0LL;
    *(void *)(v428 + 128) = 0xE000000000000000LL;
    *(void *)(v428 + 136) = 0LL;
    *(void *)(v428 + 32) = 0xE000000000000000LL;
    *(void *)(v428 + 40) = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v664 + 56))(v428 + v395[16], 1LL, 1LL, v401);
    sub_100041590(v432, &qword_1002520A0);
  }

  else
  {
    sub_100041608(v432, v428, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  sub_1000415CC(v426, type metadata accessor for EscrowInformation.Metadata);
  BOOL v433 = *(_TtC18TrustedPeersHelper6Client **)(v428 + 32);
  swift_bridgeObjectRetain(v433);
  sub_1000415CC(v428, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  NSString v434 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v433, v435, v436, v437, v438, v439, v440, v441);
  [v667 setDeviceColor:v434];

  uint64_t v442 = v585;
  sub_10000FC68(v385, v585, &qword_100252098);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v387)(v442, 1LL, v149) == 1)
  {
    uint64_t v443 = v584;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v444 = *(int *)(v149 + 20);
    uint64_t v445 = (uint64_t)v590;
    uint64_t v446 = (uint64_t)v598;
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v447 = qword_100251ED8;
    *(void *)(v443 + v444) = qword_100251ED8;
    swift_retain(v447);
    sub_100041590(v442, &qword_100252098);
  }

  else
  {
    uint64_t v443 = v584;
    sub_100041608(v442, v584, type metadata accessor for EscrowInformation.Metadata);
    uint64_t v445 = (uint64_t)v590;
    uint64_t v446 = (uint64_t)v598;
  }

  swift_beginAccess(v448, &v676, 0LL, 0LL);
  uint64_t v449 = v448;
  uint64_t v450 = v591;
  sub_10000FC68(v449, v591, &qword_1002520A0);
  if (v666(v450, 1LL, (uint64_t)v395) == 1)
  {
    *(_OWORD *)uint64_t v445 = 0u;
    *(_OWORD *)(v445 + 16) = 0u;
    *(void *)(v445 + 48) = 0xE000000000000000LL;
    *(void *)(v445 + 56) = 0LL;
    *(void *)(v445 + 64) = 0xE000000000000000LL;
    *(void *)(v445 + 72) = 0LL;
    *(void *)(v445 + 80) = 0xE000000000000000LL;
    *(void *)(v445 + 88) = 0LL;
    *(void *)(v445 + 96) = 0xE000000000000000LL;
    *(void *)(v445 + 104) = 0LL;
    *(void *)(v445 + 112) = 0xE000000000000000LL;
    *(void *)(v445 + 120) = 0LL;
    *(void *)(v445 + 128) = 0xE000000000000000LL;
    *(void *)(v445 + 136) = 0LL;
    *(void *)(v445 + 32) = 0xE000000000000000LL;
    *(void *)(v445 + 40) = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v664 + 56))(v445 + v395[16], 1LL, 1LL, v665);
    sub_100041590(v450, &qword_1002520A0);
  }

  else
  {
    sub_100041608(v450, v445, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  sub_1000415CC(v443, type metadata accessor for EscrowInformation.Metadata);
  uint64_t v451 = v445;
  SEL v452 = *(_TtC18TrustedPeersHelper6Client **)(v445 + 48);
  swift_bridgeObjectRetain(v452);
  sub_1000415CC(v451, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  NSString v453 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v452, v454, v455, v456, v457, v458, v459, v460);
  [v667 setDeviceEnclosureColor:v453];

  uint64_t v461 = v589;
  sub_10000FC68(v385, v589, &qword_100252098);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v387)(v461, 1LL, v149) == 1)
  {
    uint64_t v462 = v588;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v463 = *(int *)(v149 + 20);
    uint64_t v464 = (uint64_t)v594;
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v465 = qword_100251ED8;
    *(void *)(v462 + v463) = qword_100251ED8;
    swift_retain(v465);
    sub_100041590(v461, &qword_100252098);
    uint64_t v466 = v462;
  }

  else
  {
    uint64_t v467 = v461;
    uint64_t v466 = v588;
    sub_100041608(v467, v588, type metadata accessor for EscrowInformation.Metadata);
    uint64_t v464 = (uint64_t)v594;
  }

  swift_beginAccess(v468, &v675, 0LL, 0LL);
  uint64_t v469 = v468;
  uint64_t v470 = v595;
  sub_10000FC68(v469, v595, &qword_1002520A0);
  unsigned int v471 = v666(v470, 1LL, (uint64_t)v395);
  uint64_t v472 = v665;
  if (v471 == 1)
  {
    *(_OWORD *)uint64_t v464 = 0u;
    *(_OWORD *)(v464 + 16) = 0u;
    *(void *)(v464 + 48) = 0xE000000000000000LL;
    *(void *)(v464 + 56) = 0LL;
    *(void *)(v464 + 64) = 0xE000000000000000LL;
    *(void *)(v464 + 72) = 0LL;
    *(void *)(v464 + 80) = 0xE000000000000000LL;
    *(void *)(v464 + 88) = 0LL;
    *(void *)(v464 + 96) = 0xE000000000000000LL;
    *(void *)(v464 + 104) = 0LL;
    *(void *)(v464 + 112) = 0xE000000000000000LL;
    *(void *)(v464 + 120) = 0LL;
    *(void *)(v464 + 128) = 0xE000000000000000LL;
    *(void *)(v464 + 136) = 0LL;
    *(void *)(v464 + 32) = 0xE000000000000000LL;
    *(void *)(v464 + 40) = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v664 + 56))(v464 + v395[16], 1LL, 1LL, v472);
    sub_100041590(v470, &qword_1002520A0);
  }

  else
  {
    sub_100041608(v470, v464, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  sub_1000415CC(v466, type metadata accessor for EscrowInformation.Metadata);
  uint64_t v473 = v464;
  unint64_t v474 = *(_TtC18TrustedPeersHelper6Client **)(v464 + 64);
  swift_bridgeObjectRetain(v474);
  sub_1000415CC(v473, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  NSString v475 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v474, v476, v477, v478, v479, v480, v481, v482);
  [v667 setDeviceMid:v475];

  uint64_t v483 = v593;
  sub_10000FC68(v385, v593, &qword_100252098);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v387)(v483, 1LL, v149) == 1)
  {
    uint64_t v484 = v592;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v485 = *(int *)(v149 + 20);
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v486 = qword_100251ED8;
    *(void *)(v484 + v485) = qword_100251ED8;
    swift_retain(v486);
    sub_100041590(v483, &qword_100252098);
  }

  else
  {
    uint64_t v484 = v592;
    sub_100041608(v483, v592, type metadata accessor for EscrowInformation.Metadata);
  }

  swift_beginAccess(v487, &v674, 0LL, 0LL);
  uint64_t v488 = v487;
  uint64_t v489 = v599;
  sub_10000FC68(v488, v599, &qword_1002520A0);
  if (v666(v489, 1LL, (uint64_t)v395) == 1)
  {
    *(_OWORD *)uint64_t v446 = 0u;
    *(_OWORD *)(v446 + 16) = 0u;
    *(void *)(v446 + 48) = 0xE000000000000000LL;
    *(void *)(v446 + 56) = 0LL;
    *(void *)(v446 + 64) = 0xE000000000000000LL;
    *(void *)(v446 + 72) = 0LL;
    *(void *)(v446 + 80) = 0xE000000000000000LL;
    *(void *)(v446 + 88) = 0LL;
    *(void *)(v446 + 96) = 0xE000000000000000LL;
    *(void *)(v446 + 104) = 0LL;
    *(void *)(v446 + 112) = 0xE000000000000000LL;
    *(void *)(v446 + 120) = 0LL;
    *(void *)(v446 + 128) = 0xE000000000000000LL;
    *(void *)(v446 + 136) = 0LL;
    *(void *)(v446 + 32) = 0xE000000000000000LL;
    *(void *)(v446 + 40) = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v664 + 56))(v446 + v395[16], 1LL, 1LL, v472);
    sub_100041590(v489, &qword_1002520A0);
  }

  else
  {
    sub_100041608(v489, v446, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  sub_1000415CC(v484, type metadata accessor for EscrowInformation.Metadata);
  SEL v490 = *(_TtC18TrustedPeersHelper6Client **)(v446 + 80);
  swift_bridgeObjectRetain(v490);
  sub_1000415CC(v446, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  NSString v491 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v490, v492, v493, v494, v495, v496, v497, v498);
  [v667 setDeviceModel:v491];

  uint64_t v499 = v597;
  sub_10000FC68(v385, v597, &qword_100252098);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v387)(v499, 1LL, v149) == 1)
  {
    uint64_t v500 = v596;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v501 = *(int *)(v149 + 20);
    uint64_t v502 = (uint64_t)v602;
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v503 = qword_100251ED8;
    *(void *)(v500 + v501) = qword_100251ED8;
    swift_retain(v503);
    sub_100041590(v499, &qword_100252098);
  }

  else
  {
    uint64_t v500 = v596;
    sub_100041608(v499, v596, type metadata accessor for EscrowInformation.Metadata);
    uint64_t v502 = (uint64_t)v602;
  }

  swift_beginAccess(v504, &v673, 0LL, 0LL);
  uint64_t v505 = v504;
  uint64_t v506 = v603;
  sub_10000FC68(v505, v603, &qword_1002520A0);
  if (v666(v506, 1LL, (uint64_t)v395) == 1)
  {
    *(_OWORD *)uint64_t v502 = 0u;
    *(_OWORD *)(v502 + 16) = 0u;
    *(void *)(v502 + 48) = 0xE000000000000000LL;
    *(void *)(v502 + 56) = 0LL;
    *(void *)(v502 + 64) = 0xE000000000000000LL;
    *(void *)(v502 + 72) = 0LL;
    *(void *)(v502 + 80) = 0xE000000000000000LL;
    *(void *)(v502 + 88) = 0LL;
    *(void *)(v502 + 96) = 0xE000000000000000LL;
    *(void *)(v502 + 104) = 0LL;
    *(void *)(v502 + 112) = 0xE000000000000000LL;
    *(void *)(v502 + 120) = 0LL;
    *(void *)(v502 + 128) = 0xE000000000000000LL;
    *(void *)(v502 + 136) = 0LL;
    *(void *)(v502 + 32) = 0xE000000000000000LL;
    *(void *)(v502 + 40) = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v664 + 56))(v502 + v395[16], 1LL, 1LL, v665);
    sub_100041590(v506, &qword_1002520A0);
  }

  else
  {
    sub_100041608(v506, v502, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  sub_1000415CC(v500, type metadata accessor for EscrowInformation.Metadata);
  BOOL v507 = *(_TtC18TrustedPeersHelper6Client **)(v502 + 96);
  swift_bridgeObjectRetain(v507);
  sub_1000415CC(v502, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  NSString v508 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v507, v509, v510, v511, v512, v513, v514, v515);
  [v667 setDeviceModelClass:v508];

  uint64_t v516 = v601;
  sub_10000FC68(v385, v601, &qword_100252098);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v387)(v516, 1LL, v149) == 1)
  {
    uint64_t v517 = v600;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v518 = *(int *)(v149 + 20);
    uint64_t v519 = (uint64_t)v606;
    uint64_t v520 = v665;
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v521 = qword_100251ED8;
    *(void *)(v517 + v518) = qword_100251ED8;
    swift_retain(v521);
    sub_100041590(v516, &qword_100252098);
  }

  else
  {
    uint64_t v517 = v600;
    sub_100041608(v516, v600, type metadata accessor for EscrowInformation.Metadata);
    uint64_t v519 = (uint64_t)v606;
    uint64_t v520 = v665;
  }

  swift_beginAccess(v522, &v672, 0LL, 0LL);
  uint64_t v523 = v522;
  uint64_t v524 = v607;
  sub_10000FC68(v523, v607, &qword_1002520A0);
  if (v666(v524, 1LL, (uint64_t)v395) == 1)
  {
    *(_OWORD *)uint64_t v519 = 0u;
    *(_OWORD *)(v519 + 16) = 0u;
    *(void *)(v519 + 48) = 0xE000000000000000LL;
    *(void *)(v519 + 56) = 0LL;
    *(void *)(v519 + 64) = 0xE000000000000000LL;
    *(void *)(v519 + 72) = 0LL;
    *(void *)(v519 + 80) = 0xE000000000000000LL;
    *(void *)(v519 + 88) = 0LL;
    *(void *)(v519 + 96) = 0xE000000000000000LL;
    *(void *)(v519 + 104) = 0LL;
    *(void *)(v519 + 112) = 0xE000000000000000LL;
    *(void *)(v519 + 120) = 0LL;
    *(void *)(v519 + 128) = 0xE000000000000000LL;
    *(void *)(v519 + 136) = 0LL;
    *(void *)(v519 + 32) = 0xE000000000000000LL;
    *(void *)(v519 + 40) = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v664 + 56))(v519 + v395[16], 1LL, 1LL, v520);
    sub_100041590(v524, &qword_1002520A0);
  }

  else
  {
    sub_100041608(v524, v519, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  sub_1000415CC(v517, type metadata accessor for EscrowInformation.Metadata);
  uint64_t v525 = v519;
  id v526 = *(_TtC18TrustedPeersHelper6Client **)(v519 + 112);
  swift_bridgeObjectRetain(v526);
  sub_1000415CC(v525, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  NSString v527 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v526, v528, v529, v530, v531, v532, v533, v534);
  [v667 setDeviceModelVersion:v527];

  uint64_t v535 = v605;
  sub_10000FC68(v385, v605, &qword_100252098);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v387)(v535, 1LL, v149) == 1)
  {
    uint64_t v536 = v604;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v537 = *(int *)(v149 + 20);
    uint64_t v538 = (uint64_t)v610;
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v539 = qword_100251ED8;
    *(void *)(v536 + v537) = qword_100251ED8;
    swift_retain(v539);
    sub_100041590(v535, &qword_100252098);
  }

  else
  {
    uint64_t v536 = v604;
    sub_100041608(v535, v604, type metadata accessor for EscrowInformation.Metadata);
    uint64_t v538 = (uint64_t)v610;
  }

  swift_beginAccess(v540, &v671, 0LL, 0LL);
  uint64_t v541 = v540;
  uint64_t v542 = v611;
  sub_10000FC68(v541, v611, &qword_1002520A0);
  if (v666(v542, 1LL, (uint64_t)v395) == 1)
  {
    *(_OWORD *)uint64_t v538 = 0u;
    *(_OWORD *)(v538 + 16) = 0u;
    *(void *)(v538 + 48) = 0xE000000000000000LL;
    *(void *)(v538 + 56) = 0LL;
    *(void *)(v538 + 64) = 0xE000000000000000LL;
    *(void *)(v538 + 72) = 0LL;
    *(void *)(v538 + 80) = 0xE000000000000000LL;
    *(void *)(v538 + 88) = 0LL;
    *(void *)(v538 + 96) = 0xE000000000000000LL;
    *(void *)(v538 + 104) = 0LL;
    *(void *)(v538 + 112) = 0xE000000000000000LL;
    *(void *)(v538 + 120) = 0LL;
    *(void *)(v538 + 128) = 0xE000000000000000LL;
    *(void *)(v538 + 136) = 0LL;
    *(void *)(v538 + 32) = 0xE000000000000000LL;
    *(void *)(v538 + 40) = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v664 + 56))(v538 + v395[16], 1LL, 1LL, v665);
    sub_100041590(v542, &qword_1002520A0);
  }

  else
  {
    sub_100041608(v542, v538, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  sub_1000415CC(v536, type metadata accessor for EscrowInformation.Metadata);
  id v543 = *(_TtC18TrustedPeersHelper6Client **)(v538 + 128);
  swift_bridgeObjectRetain(v543);
  sub_1000415CC(v538, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  NSString v544 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v543, v545, v546, v547, v548, v549, v550, v551);
  [v667 setDeviceName:v544];

  uint64_t v552 = v609;
  sub_10000FC68(v385, v609, &qword_100252098);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v387)(v552, 1LL, v149) == 1)
  {
    uint64_t v553 = v608;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v554 = *(int *)(v149 + 20);
    uint64_t v555 = (uint64_t)v612;
    uint64_t v556 = v665;
    if (qword_100250E50 != -1) {
      swift_once(&qword_100250E50, sub_10009EA7C);
    }
    uint64_t v557 = qword_100251ED8;
    *(void *)(v553 + v554) = qword_100251ED8;
    swift_retain(v557);
    sub_100041590(v552, &qword_100252098);
  }

  else
  {
    uint64_t v553 = v608;
    sub_100041608(v552, v608, type metadata accessor for EscrowInformation.Metadata);
    uint64_t v555 = (uint64_t)v612;
    uint64_t v556 = v665;
  }

  swift_beginAccess(v558, v670, 0LL, 0LL);
  uint64_t v559 = v558;
  uint64_t v560 = v613;
  sub_10000FC68(v559, v613, &qword_1002520A0);
  unsigned int v561 = v666(v560, 1LL, (uint64_t)v395);
  SEL v249 = v660;
  if (v561 == 1)
  {
    *(_OWORD *)uint64_t v555 = 0u;
    *(_OWORD *)(v555 + 16) = 0u;
    *(void *)(v555 + 48) = 0xE000000000000000LL;
    *(void *)(v555 + 56) = 0LL;
    *(void *)(v555 + 64) = 0xE000000000000000LL;
    *(void *)(v555 + 72) = 0LL;
    *(void *)(v555 + 80) = 0xE000000000000000LL;
    *(void *)(v555 + 88) = 0LL;
    *(void *)(v555 + 96) = 0xE000000000000000LL;
    *(void *)(v555 + 104) = 0LL;
    *(void *)(v555 + 112) = 0xE000000000000000LL;
    *(void *)(v555 + 120) = 0LL;
    *(void *)(v555 + 128) = 0xE000000000000000LL;
    *(void *)(v555 + 136) = 0LL;
    *(void *)(v555 + 32) = 0xE000000000000000LL;
    *(void *)(v555 + 40) = 0LL;
    _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v664 + 56))(v555 + v395[16], 1LL, 1LL, v556);
    sub_100041590(v560, &qword_1002520A0);
  }

  else
  {
    sub_100041608(v560, v555, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  }

  unint64_t v215 = v663;
  sub_1000415CC(v553, type metadata accessor for EscrowInformation.Metadata);
  uint64_t v562 = *(void *)(v555 + 136);
  sub_1000415CC(v555, type metadata accessor for EscrowInformation.Metadata.ClientMetadata);
  if ((v562 & 0x8000000000000000LL) == 0)
  {
    id v563 = v667;
    [v667 setDevicePlatform:v562];
    [v215 setClientMetadata:v563];
    if (qword_100250EE0 == -1) {
      goto LABEL_172;
    }
    goto LABEL_183;
  }

LABEL_182:
  __break(1u);
LABEL_183:
  swift_once(&qword_100250EE0, sub_1001B6978);
LABEL_172:
  uint64_t v564 = type metadata accessor for Logger(0LL);
  sub_100006BAC(v564, (uint64_t)qword_100257CD0);
  id v565 = v249;
  v566 = (os_log_s *)Logger.logObject.getter(v565);
  os_log_type_t v567 = static os_log_type_t.info.getter(v566);
  if (os_log_type_enabled(v566, v567))
  {
    v568 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    id v569 = (uint64_t **)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)v568 = 138543362;
    uint64_t v669 = v565;
    id v570 = v565;
    unint64_t v215 = v663;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v669, v670, v568 + 4, v568 + 12);
    *id v569 = v565;

    _os_log_impl( (void *)&_mh_execute_header,  v566,  v567,  "setEscrowRecord saving new escrow record: %{public}@",  v568,  0xCu);
    uint64_t v571 = sub_100007578(&qword_100250F90);
    swift_arrayDestroy(v569, 1LL, v571);
    swift_slowDealloc(v569, -1LL, -1LL);
    swift_slowDealloc(v568, -1LL, -1LL);
  }

  else
  {

    v566 = (os_log_s *)v565;
  }

  uint64_t v572 = (SEL *)(&off_10023D7F8)[(char)v579];
  id v573 = *(id *)(v580 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO);
  objc_msgSend(v573, *v572, v565);
}

id sub_1001B5FD0()
{
  uint64_t v1 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO;
  id v2 =  [*(id *)(v0 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO) fullyViableEscrowRecords];
  if (v2
    && (uint64_t v3 = v2,
        uint64_t v49 = 0LL,
        uint64_t v4 = type metadata accessor for EscrowRecordMO(),
        unint64_t v5 = sub_1001B6D90(),
        static Set._conditionallyBridgeFromObjectiveC(_:result:)(v3, &v49, v4, v5),
        v3,
        (uint64_t v6 = v49) != 0LL))
  {
    sub_1001B29C0((uint64_t)v49);
    uint64_t v8 = v7;
    swift_bridgeObjectRelease(v6, v9, v10, v11, v12, v13, v14, v15);
  }

  else
  {
    uint64_t v8 = (_TtC18TrustedPeersHelper6Client *)_swiftEmptyArrayStorage;
  }

  id v16 = [*(id *)(v0 + v1) partiallyViableEscrowRecords];
  if (v16
    && (uint64_t v17 = v16,
        uint64_t v49 = 0LL,
        uint64_t v18 = type metadata accessor for EscrowRecordMO(),
        unint64_t v19 = sub_1001B6D90(),
        static Set._conditionallyBridgeFromObjectiveC(_:result:)(v17, &v49, v18, v19),
        v17,
        (uint64_t v20 = v49) != 0LL))
  {
    sub_1001B29C0((uint64_t)v49);
    uint64_t v22 = v21;
    swift_bridgeObjectRelease(v20, v23, v24, v25, v26, v27, v28, v29);
  }

  else
  {
    uint64_t v22 = (_TtC18TrustedPeersHelper6Client *)_swiftEmptyArrayStorage;
  }

  id v30 = objc_allocWithZone(&OBJC_CLASS___TPCachedViableBottles);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8, v32, v33, v34, v35, v36, v37, v38);
  Class v39 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v22, v40, v41, v42, v43, v44, v45, v46);
  id v47 = [v30 initWithViableBottles:isa partialBottles:v39];

  return v47;
}

void sub_1001B6168()
{
  unint64_t v106 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v1 = OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO;
  id v2 =  [*(id *)(v0 + OBJC_IVAR____TtC18TrustedPeersHelper9Container_containerMO) fullyViableEscrowRecords];
  if (!v2) {
    goto LABEL_40;
  }
  uint64_t v3 = v2;
  v109[0] = 0LL;
  uint64_t v4 = type metadata accessor for EscrowRecordMO();
  unint64_t v5 = sub_1001B6D90();
  uint64_t v101 = v4;
  static Set._conditionallyBridgeFromObjectiveC(_:result:)(v3, v109, v4, v5);

  uint64_t v7 = v109[0];
  if (!v109[0]) {
    goto LABEL_40;
  }
  uint64_t v97 = v1;
  uint64_t v99 = v0;
  if ((v109[0] & 0xC000000000000001LL) != 0)
  {
    if (v109[0] >= 0LL) {
      uint64_t v8 = v109[0] & 0xFFFFFFFFFFFFFF8LL;
    }
    else {
      uint64_t v8 = v109[0];
    }
    uint64_t v9 = __CocoaSet.makeIterator()(v8);
    uint64_t v6 = Set.Iterator.init(_cocoa:)(v107, v9, v4, v5);
    uint64_t v7 = v107[0];
    uint64_t v10 = v107[1];
    uint64_t v11 = v107[2];
    uint64_t v12 = v107[3];
    unint64_t v13 = v107[4];
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v14 = -1LL << *(_BYTE *)(v109[0] + 32LL);
    uint64_t v10 = v109[0] + 56LL;
    uint64_t v11 = ~v14;
    uint64_t v15 = -v14;
    if (v15 < 64) {
      uint64_t v16 = ~(-1LL << v15);
    }
    else {
      uint64_t v16 = -1LL;
    }
    unint64_t v13 = v16 & *(void *)(v109[0] + 56LL);
  }

  uint64_t v95 = v11;
  int64_t v17 = (unint64_t)(v11 + 64) >> 6;
  while (v7 < 0)
  {
    uint64_t v23 = __CocoaSet.Iterator.next()(v6);
    if (!v23) {
      goto LABEL_39;
    }
    uint64_t v25 = v23;
    v108[0] = v23;
    swift_unknownObjectRetain(v23, v24);
    swift_dynamicCast(v109, v108, (char *)&type metadata for Swift.AnyObject + 8, v101, 7LL);
    id v19 = (id)v109[0];
    swift_unknownObjectRelease(v25);
    uint64_t v22 = v12;
    uint64_t v20 = v13;
    if (!v19) {
      goto LABEL_39;
    }
LABEL_36:
    BOOL v29 = (void *)sub_1001B6DD8(v19, 0);
    if (v29)
    {
      id v30 = v29;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v30);
      unint64_t v32 = *(void *)((v106 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      unint64_t v31 = *(void *)((v106 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
      if (v32 >= v31 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1LL);
      }
      uint64_t v18 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v32, v30);
      specialized Array._endMutation()(v18);

      id v19 = v30;
    }

    uint64_t v12 = v22;
    unint64_t v13 = v20;
  }

  if (v13)
  {
    uint64_t v20 = (v13 - 1) & v13;
    unint64_t v21 = __clz(__rbit64(v13)) | (v12 << 6);
    uint64_t v22 = v12;
    goto LABEL_35;
  }

  int64_t v26 = v12 + 1;
  if (__OFADD__(v12, 1LL))
  {
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
    return;
  }

  if (v26 >= v17) {
    goto LABEL_39;
  }
  unint64_t v27 = *(void *)(v10 + 8 * v26);
  uint64_t v22 = v12 + 1;
  if (v27) {
    goto LABEL_34;
  }
  uint64_t v22 = v12 + 2;
  if (v12 + 2 >= v17) {
    goto LABEL_39;
  }
  unint64_t v27 = *(void *)(v10 + 8 * v22);
  if (v27) {
    goto LABEL_34;
  }
  uint64_t v22 = v12 + 3;
  if (v12 + 3 >= v17) {
    goto LABEL_39;
  }
  unint64_t v27 = *(void *)(v10 + 8 * v22);
  if (v27) {
    goto LABEL_34;
  }
  uint64_t v22 = v12 + 4;
  if (v12 + 4 >= v17) {
    goto LABEL_39;
  }
  unint64_t v27 = *(void *)(v10 + 8 * v22);
  if (v27)
  {
LABEL_34:
    uint64_t v20 = (v27 - 1) & v27;
    unint64_t v21 = __clz(__rbit64(v27)) + (v22 << 6);
LABEL_35:
    id v19 = *(id *)(*(void *)(v7 + 48) + 8 * v21);
    if (!v19) {
      goto LABEL_39;
    }
    goto LABEL_36;
  }

  uint64_t v28 = v12 + 5;
  while (v17 != v28)
  {
    unint64_t v27 = *(void *)(v10 + 8 * v28++);
    if (v27)
    {
      uint64_t v22 = v28 - 1;
      goto LABEL_34;
    }
  }

LABEL_117:
  sub_100172694(v69);
}

uint64_t sub_1001B6978()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100006B6C(v0, qword_100257CD0);
  sub_100006BAC(v0, (uint64_t)qword_100257CD0);
  return Logger.init(subsystem:category:)( 0xD00000000000001FLL,  0x80000001001E7520LL,  0x6572776F72637365LL,  0xED00007364726F63LL);
}

uint64_t sub_1001B69F8(uint64_t a1, char a2, uint64_t a3, void (*a4)(void, void))
{
  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    if (qword_100250EE0 != -1) {
      swift_once(&qword_100250EE0, sub_1001B6978);
    }
    uint64_t v12 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v12, (uint64_t)qword_100257CD0);
    swift_errorRetain(a1);
    uint64_t v13 = swift_errorRetain(a1);
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v18 = static os_log_type_t.error.getter(v14, v15, v16, v17);
    if (os_log_type_enabled(v14, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v41 = a4;
      uint64_t v42 = a1;
      uint64_t v20 = swift_slowAlloc(32LL, -1LL);
      *(_DWORD *)id v19 = 136446210;
      uint64_t v43 = 0x203A726F727265LL;
      unint64_t v44 = (_TtC18TrustedPeersHelper6Client *)0xE700000000000000LL;
      uint64_t v45 = v20;
      swift_errorRetain(a1);
      swift_errorRetain(a1);
      uint64_t v21 = sub_100007578(&qword_100251D70);
      v22._countAndFlagsBits = String.init<A>(describing:)(&v42, v21);
      object = (_TtC18TrustedPeersHelper6Client *)v22._object;
      String.append(_:)(v22);
      swift_bridgeObjectRelease(object, v24, v25, v26, v27, v28, v29, v30);
      sub_100174D94(a1, 1);
      unint64_t v31 = v44;
      uint64_t v43 = sub_10017C4C4(v43, (unint64_t)v44, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease(v31, v32, v33, v34, v35, v36, v37, v38);
      sub_100174D94(a1, 1);
      sub_100174D94(a1, 1);
      _os_log_impl((void *)&_mh_execute_header, v14, v18, "fetchEscrowRecords failed with %{public}s", v19, 0xCu);
      swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v39 = v20;
      a4 = v41;
      swift_slowDealloc(v39, -1LL, -1LL);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    else
    {
      sub_100174D94(a1, 1);
      sub_100174D94(a1, 1);
    }

    swift_errorRetain(a1);
    a4(0LL, a1);
    sub_100174D94(a1, 1);
    return sub_100174D94(a1, 1);
  }

  else
  {
    if (qword_100250EE0 != -1) {
      swift_once(&qword_100250EE0, sub_1001B6978);
    }
    uint64_t v7 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v7, (uint64_t)qword_100257CD0);
    uint64_t v8 = swift_bridgeObjectRetain(a1);
    uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
    os_log_type_t v10 = static os_log_type_t.info.getter(v9);
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v11 = 134349056;
      uint64_t v43 = *(void *)(a1 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v11 + 4, v11 + 12);
      sub_100174D94(a1, 0);
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "fetchEscrowRecords succeeded with %{public}ld records",  v11,  0xCu);
      swift_slowDealloc(v11, -1LL, -1LL);
    }

    else
    {
      sub_100174D94(a1, 0);
    }

    return ((uint64_t (*)(uint64_t, void))a4)(a1, 0LL);
  }

unint64_t sub_1001B6D90()
{
  unint64_t result = qword_100257050;
  if (!qword_100257050)
  {
    uint64_t v1 = type metadata accessor for EscrowRecordMO();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100257050);
  }

  return result;
}

uint64_t sub_1001B6DD8(void *a1, unsigned __int8 a2)
{
  uint64_t v4 = sub_100007578(&qword_100256D28);
  uint64_t v6 = __chkstk_darwin(v4, v5);
  uint64_t v8 = (char *)&v268 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v6, v9);
  uint64_t v12 = (char *)&v268 - v11;
  __chkstk_darwin(v10, v13);
  uint64_t v15 = (char *)&v268 - v14;
  uint64_t v16 = type metadata accessor for Date(0LL);
  uint64_t v276 = *(void *)(v16 - 8);
  uint64_t v277 = v16;
  uint64_t v18 = __chkstk_darwin(v16, v17);
  os_log_type_t v271 = (char *)&v268 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = __chkstk_darwin(v18, v20);
  uint64_t v272 = (char *)&v268 - v22;
  uint64_t v24 = __chkstk_darwin(v21, v23);
  uint64_t v275 = (char *)&v268 - v25;
  __chkstk_darwin(v24, v26);
  id v28 = (char *)&v268 - v27;
  id v29 = [objc_allocWithZone((Class)OTEscrowRecord) init];
  id v30 = [objc_allocWithZone((Class)OTEscrowRecordMetadata) init];
  id v31 = [objc_allocWithZone((Class)OTEscrowRecordMetadataClientMetadata) init];
  if (!v29)
  {

    return (uint64_t)v29;
  }

  uint64_t v269 = v8;
  id v273 = v29;
  id v274 = v31;
  id v32 = v29;
  id v33 = [a1 creationDate];
  if (!v33)
  {
    uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v276 + 56);
    v42(v15, 1LL, 1LL, v277);
    goto LABEL_7;
  }

  int64_t v34 = v33;
  id v270 = v30;
  id v35 = v12;
  id v36 = v32;
  unsigned __int8 v37 = a2;
  BOOL v38 = v275;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v39 = v276;
  uint64_t v40 = v277;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v276 + 32);
  v41(v15, v38, v277);
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
  v42(v15, 0LL, 1LL, v40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v15, 1LL, v40) == 1)
  {
    a2 = v37;
    id v32 = v36;
    uint64_t v12 = v35;
    id v30 = v270;
LABEL_7:
    sub_100041590((uint64_t)v15, &qword_100256D28);
    goto LABEL_12;
  }

  uint64_t v43 = ((uint64_t (*)(char *, char *, uint64_t))v41)(v28, v15, v277);
  double v44 = Date.timeIntervalSince1970.getter(v43);
  if ((~*(void *)&v44 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_104;
  }

  if (v44 <= -1.0)
  {
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }

  if (v44 >= 1.84467441e19)
  {
LABEL_105:
    __break(1u);
    goto LABEL_106;
  }

  a2 = v37;
  id v32 = v36;
  [v36 setCreationDate:(unint64_t)v44];
  (*(void (**)(char *, uint64_t))(v276 + 8))(v28, v277);
  uint64_t v12 = v35;
  id v30 = v270;
LABEL_12:
  id v45 = [a1 label];
  if (v45)
  {
    uint64_t v46 = v45;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
    int64_t v48 = v47;
  }

  else
  {
    int64_t v48 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
  }

  NSString v49 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v48, v50, v51, v52, v53, v54, v55, v56);
  [v32 setLabel:v49];

  unint64_t v57 = (unint64_t)[a1 remainingAttempts];
  if ((v57 & 0x8000000000000000LL) != 0) {
    goto LABEL_112;
  }
  [v32 setRemainingAttempts:v57];
  unint64_t v58 = (unint64_t)[a1 silentAttemptAllowed];
  if ((v58 & 0x8000000000000000LL) != 0) {
    goto LABEL_112;
  }
  [v32 setSilentAttemptAllowed:v58];
  objc_msgSend(v32, "setRecordStatus:", objc_msgSend(a1, "recordStatus") != 0);
  id v59 = [a1 federationID];
  if (v59)
  {
    uint64_t v60 = v59;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
    unint64_t v62 = v61;
  }

  else
  {
    unint64_t v62 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
  }

  NSString v63 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v62, v64, v65, v66, v67, v68, v69, v70);
  [v32 setFederationId:v63];

  id v71 = [a1 expectedFederationID];
  if (v71)
  {
    uint64_t v72 = v71;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v71);
    uint64_t v74 = v73;
  }

  else
  {
    uint64_t v74 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
  }

  NSString v75 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v74, v76, v77, v78, v79, v80, v81, v82);
  [v32 setExpectedFederationId:v75];

  [v32 setRecordViability:a2];
  id v83 = [a1 sosViability];
  if (v83 == (id)2) {
    uint64_t v84 = 2LL;
  }
  else {
    uint64_t v84 = v83 == (id)1;
  }
  [v32 setViabilityStatus:v84];
  if (!v30)
  {

    return (uint64_t)v273;
  }

  id v85 = v30;
  id v86 = [a1 escrowMetadata];
  id v87 = v274;
  if (!v86)
  {
LABEL_100:
    [v32 setEscrowInformationMetadata:v85];

    return (uint64_t)v273;
  }

  int64_t v88 = v86;
  id v89 = [v86 backupKeybagDigest];
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v91 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v89);
    unint64_t v93 = v92;
  }

  else
  {
    uint64_t v91 = 0LL;
    unint64_t v93 = 0xC000000000000000LL;
  }

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v91, v93);
  [v85 setBackupKeybagDigest:isa];

  id v95 = [v88 secureBackupTimestamp];
  if (!v95)
  {
    v42(v12, 1LL, 1LL, v277);
    goto LABEL_39;
  }

  uint64_t v96 = v95;
  uint64_t v97 = v275;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v98 = v276;
  uint64_t v99 = *(void (**)(char *, char *, uint64_t))(v276 + 32);
  uint64_t v100 = v97;
  uint64_t v101 = v277;
  v99(v12, v100, v277);
  v42(v12, 0LL, 1LL, v101);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v98 + 48))(v12, 1LL, v101) == 1)
  {
LABEL_39:
    sub_100041590((uint64_t)v12, &qword_100256D28);
    goto LABEL_40;
  }

  uint64_t v102 = v272;
  uint64_t v103 = ((uint64_t (*)(char *, char *, uint64_t))v99)(v272, v12, v277);
  double v104 = Date.timeIntervalSince1970.getter(v103);
  if ((~*(void *)&v104 & 0x7FF0000000000000LL) == 0)
  {
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }

  if (v104 <= -1.0)
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }

  if (v104 >= 1.84467441e19)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }

  [v85 setSecureBackupTimestamp:(unint64_t)v104];
  (*(void (**)(char *, uint64_t))(v276 + 8))(v102, v277);
LABEL_40:
  unint64_t v105 = (unint64_t)[v88 secureBackupUsesMultipleiCSCS];
  if ((v105 & 0x8000000000000000LL) == 0)
  {
    [v85 setSecureBackupUsesMultipleIcscs:v105];
    id v106 = [v88 bottleID];
    if (v106)
    {
      uint64_t v107 = v106;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v106);
      uint64_t v109 = v108;
    }

    else
    {
      uint64_t v109 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
    }

    NSString v110 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v109, v111, v112, v113, v114, v115, v116, v117);
    [v85 setBottleId:v110];

    id v118 = [v88 escrowedSPKI];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v118);
      unint64_t v122 = v121;
    }

    else
    {
      uint64_t v120 = 0LL;
      unint64_t v122 = 0xC000000000000000LL;
    }

    Class v123 = Data._bridgeToObjectiveC()().super.isa;
    sub_10000852C(v120, v122);
    [v85 setEscrowedSpki:v123];

    id v124 = [v88 peerInfo];
    if (v124)
    {
      uint64_t v125 = v124;
      uint64_t v126 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v124);
      unint64_t v128 = v127;
    }

    else
    {
      uint64_t v126 = 0LL;
      unint64_t v128 = 0xC000000000000000LL;
    }

    Class v129 = Data._bridgeToObjectiveC()().super.isa;
    sub_10000852C(v126, v128);
    [v85 setPeerInfo:v129];

    id v130 = [v88 serial];
    if (v130)
    {
      uint64_t v131 = v130;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v130);
      uint64_t v133 = v132;
    }

    else
    {
      uint64_t v133 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
    }

    NSString v134 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v133, v135, v136, v137, v138, v139, v140, v141);
    [v85 setSerial:v134];

    id v142 = [v88 build];
    if (v142)
    {
      uint64_t v143 = v142;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v142);
      uint64_t v145 = v144;
    }

    else
    {
      uint64_t v145 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
    }

    NSString v146 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v145, v147, v148, v149, v150, v151, v152, v153);
    [v85 setBuild:v146];

    id v154 = [v88 passcodeGen];
    if (v154)
    {
      uint64_t v155 = v154;
      id v156 = [objc_allocWithZone(OTEscrowRecordMetadataPasscodeGeneration) init];
      if (v156)
      {
        uint64_t v157 = v156;
        unint64_t v158 = (unint64_t)[v155 value];
        if ((v158 & 0x8000000000000000LL) != 0) {
          goto LABEL_112;
        }
        [v157 setValue:v158];
        id v159 = v157;
        [v85 setPasscodeGeneration:v159];
      }
    }

    if (!v87)
    {
LABEL_99:
      [v85 setClientMetadata:v87];

      goto LABEL_100;
    }

    uint64_t v272 = (char *)v42;
    id v160 = v87;
    id v161 = [v88 clientMetadata];
    if (!v161)
    {
      uint64_t v162 = v160;
LABEL_98:

      goto LABEL_99;
    }

    uint64_t v162 = v161;
    id v163 = [v161 deviceMid];
    if (v163)
    {
      uint64_t v164 = v163;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v163);
      uint64_t v166 = v165;
    }

    else
    {
      uint64_t v166 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
    }

    NSString v167 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v166, v168, v169, v170, v171, v172, v173, v174);
    [v160 setDeviceMid:v167];

    id v175 = [v162 deviceColor];
    if (v175)
    {
      uint64_t v176 = v175;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v175);
      uint64_t v178 = v177;
    }

    else
    {
      uint64_t v178 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
    }

    NSString v179 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v178, v180, v181, v182, v183, v184, v185, v186);
    [v160 setDeviceColor:v179];

    id v187 = [v162 deviceModel];
    if (v187)
    {
      uint64_t v188 = v187;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v187);
      uint64_t v190 = v189;
    }

    else
    {
      uint64_t v190 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
    }

    NSString v191 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v190, v192, v193, v194, v195, v196, v197, v198);
    [v160 setDeviceModel:v191];

    id v199 = [v162 deviceName];
    if (v199)
    {
      uint64_t v200 = v199;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v199);
      uint64_t v202 = v201;
    }

    else
    {
      uint64_t v202 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
    }

    NSString v203 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v202, v204, v205, v206, v207, v208, v209, v210);
    [v160 setDeviceName:v203];

    unint64_t v211 = (unint64_t)[v162 devicePlatform];
    if ((v211 & 0x8000000000000000LL) == 0)
    {
      [v160 setDevicePlatform:v211];
      id v212 = [v162 deviceModelClass];
      if (v212)
      {
        uint64_t v213 = v212;
        static String._unconditionallyBridgeFromObjectiveC(_:)(v212);
        unint64_t v215 = v214;
      }

      else
      {
        unint64_t v215 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
      }

      NSString v216 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v215, v217, v218, v219, v220, v221, v222, v223);
      [v160 setDeviceModelClass:v216];

      id v224 = [v162 deviceModelVersion];
      if (v224)
      {
        uint64_t v225 = v224;
        static String._unconditionallyBridgeFromObjectiveC(_:)(v224);
        os_log_type_t v227 = v226;
      }

      else
      {
        os_log_type_t v227 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
      }

      NSString v228 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v227, v229, v230, v231, v232, v233, v234, v235);
      [v160 setDeviceModelVersion:v228];

      id v236 = [v162 deviceEnclosureColor];
      if (v236)
      {
        uint64_t v237 = v236;
        static String._unconditionallyBridgeFromObjectiveC(_:)(v236);
        uint64_t v239 = v238;
      }

      else
      {
        uint64_t v239 = (_TtC18TrustedPeersHelper6Client *)0xE000000000000000LL;
      }

      NSString v240 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v239, v241, v242, v243, v244, v245, v246, v247);
      [v160 setDeviceEnclosureColor:v240];

      id v248 = [v162 secureBackupMetadataTimestamp];
      if (v248)
      {
        SEL v249 = v248;
        id v250 = v85;
        NSString v251 = v88;
        NSString v252 = v162;
        id v253 = v160;
        id v254 = v87;
        uint64_t v255 = v275;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v256 = v276;
        uint64_t v257 = *(void (**)(char *, char *, uint64_t))(v276 + 32);
        uint64_t v258 = (uint64_t)v269;
        uint64_t v259 = v255;
        id v87 = v254;
        id v160 = v253;
        uint64_t v162 = v252;
        int64_t v88 = v251;
        id v85 = v250;
        uint64_t v260 = v277;
        v257(v269, v259, v277);
        ((void (*)(uint64_t, void, uint64_t, uint64_t))v272)(v258, 0LL, 1LL, v260);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v256 + 48))(v258, 1LL, v260) != 1)
        {
          uint64_t v261 = v271;
          uint64_t v262 = ((uint64_t (*)(char *, uint64_t, uint64_t))v257)(v271, v258, v277);
          double v263 = Date.timeIntervalSince1970.getter(v262);
          if ((~*(void *)&v263 & 0x7FF0000000000000LL) != 0)
          {
            if (v263 > -1.0)
            {
              if (v263 < 1.84467441e19)
              {
                [v160 setSecureBackupMetadataTimestamp:(unint64_t)v263];
                (*(void (**)(char *, uint64_t))(v276 + 8))(v261, v277);
LABEL_94:
                unint64_t v264 = (unint64_t)[v162 secureBackupUsesComplexPassphrase];
                if ((v264 & 0x8000000000000000LL) == 0)
                {
                  [v160 setSecureBackupUsesComplexPassphrase:v264];
                  unint64_t v265 = (unint64_t)[v162 secureBackupUsesNumericPassphrase];
                  if ((v265 & 0x8000000000000000LL) == 0)
                  {
                    [v160 setSecureBackupUsesNumericPassphrase:v265];
                    unint64_t v266 = (unint64_t)[v162 secureBackupNumericPassphraseLength];
                    if ((v266 & 0x8000000000000000LL) == 0)
                    {
                      [v160 setSecureBackupNumericPassphraseLength:v266];

                      goto LABEL_98;
                    }
                  }
                }

                goto LABEL_112;
              }

LABEL_111:
              __break(1u);
              goto LABEL_112;
            }

LABEL_110:
            __break(1u);
            goto LABEL_111;
          }

LABEL_109:
          __break(1u);
          goto LABEL_110;
        }
      }

      else
      {
        uint64_t v258 = (uint64_t)v269;
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v272)(v269, 1LL, 1LL, v277);
      }

      sub_100041590(v258, &qword_100256D28);
      goto LABEL_94;
    }
  }

LABEL_112:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Negative value is not representable",  35LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3451LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_1001B7D3C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100006B6C(v0, qword_100257CE8);
  sub_100006BAC(v0, (uint64_t)qword_100257CE8);
  return Logger.init(subsystem:category:)( 0xD00000000000001FLL,  0x80000001001E7520LL,  0x7064656C74746F62LL,  0xEB00000000726565LL);
}

char *sub_1001B7DB8( uint64_t a1, _TtC18TrustedPeersHelper6Client *a2, uint64_t a3, _TtC18TrustedPeersHelper6Client *a4, void *a5, void *a6, uint64_t a7, _TtC18TrustedPeersHelper6Client *a8)
{
  uint64_t v15 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  uint64_t v16 = v8;
  uint64_t v380 = 0x4800000000LL;
  uint64_t v381 = __DataStorage.init(length:)(72LL);
  sub_1001BAF28((int *)&v380);
  if (v9)
  {
    uint64_t v17 = v381;

    swift_release(v17);
    swift_bridgeObjectRelease(a4, v18, v19, v20, v21, v22, v23, v24);
    swift_bridgeObjectRelease(a2, v25, v26, v27, v28, v29, v30, v31);
    swift_bridgeObjectRelease(a8, v32, v33, v34, v35, v36, v37, v38);
LABEL_30:
    uint64_t v237 = type metadata accessor for BottledPeer();
    swift_deallocPartialClassInstance(v16, v237, 168LL, 7LL);
    return v16;
  }

  uint64_t v366 = a1;
  unsigned int v367 = a2;
  uint64_t v368 = a4;
  uint64_t v369 = a6;
  uint64_t v371 = a5;
  uint64_t v39 = v380;
  uint64_t v40 = v381;
  uint64_t v41 = v381 | 0x4000000000000000LL;
  uint64_t v42 = v16;
  uint64_t v43 = (uint64_t *)&v16[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_secret];
  *uint64_t v43 = v380;
  v43[1] = v41;
  objc_allocWithZone((Class)type metadata accessor for EscrowKeys());
  sub_1000084E8(v39, v40 | 0x4000000000000000LL);
  sub_1000084E8(v39, v40 | 0x4000000000000000LL);
  double v44 = sub_1001AF754(v39, v40 | 0x4000000000000000LL, a7, a8);
  uint64_t v45 = v40;
  uint64_t v378 = v43;
  uint64_t v46 = OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowKeys;
  *(void *)&v42[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowKeys] = v44;
  id v47 = [objc_allocWithZone((Class)OTBottleContents) init];
  BOOL v55 = v42;
  if (!v47)
  {
    swift_bridgeObjectRelease(a4, v48, v49, v50, v51, v52, v53, v54);
    swift_bridgeObjectRelease(v367, v177, v178, v179, v180, v181, v182, v183);
    unint64_t v184 = sub_1001BACA0();
    uint64_t v185 = swift_allocError(&type metadata for BottledPeer.Error, v184, 0LL, 0LL);
    *BOOL v186 = 3;
    swift_willThrow(v185);
    swift_release(v40);

    id v187 = a6;
LABEL_13:

LABEL_14:
    int v188 = 0;
    int v189 = 0;
    int v190 = 0;
LABEL_15:
    NSString v191 = v378;
    goto LABEL_20;
  }

  BOOL v56 = v47;
  uint64_t v376 = v46;
  id v57 = [objc_allocWithZone((Class)OTPrivateKey) init];
  uint64_t v65 = v45;
  if (!v57)
  {
    swift_bridgeObjectRelease(a4, v58, v59, v60, v61, v62, v63, v64);
    swift_bridgeObjectRelease(v367, v192, v193, v194, v195, v196, v197, v198);
    unint64_t v199 = sub_1001BACA0();
    uint64_t v200 = swift_allocError(&type metadata for BottledPeer.Error, v199, 0LL, 0LL);
    _BYTE *v201 = 5;
    swift_willThrow(v200);
    swift_release(v45);

    int v188 = 0;
    int v189 = 0;
    int v190 = 0;
    NSString v191 = v378;
    goto LABEL_20;
  }

  int64_t v66 = v57;
  id v364 = v56;
  id v365 = v42;
  [v57 setKeyType:1];
  id v67 = [v371 keyData];
  uint64_t v68 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v67);
  unint64_t v70 = v69;

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v68, v70);
  [v66 setKeyData:isa];

  id v72 = [objc_allocWithZone((Class)OTPrivateKey) init];
  if (!v72)
  {
    swift_bridgeObjectRelease(v368, v73, v74, v75, v76, v77, v78, v79);
    swift_bridgeObjectRelease(v367, v202, v203, v204, v205, v206, v207, v208);
    unint64_t v209 = sub_1001BACA0();
    uint64_t v210 = swift_allocError(&type metadata for BottledPeer.Error, v209, 0LL, 0LL);
    *unint64_t v211 = 5;
    swift_willThrow(v210);
    swift_release(v65);

    int v188 = 0;
    int v189 = 0;
    int v190 = 0;
    NSString v191 = v378;
LABEL_19:
    BOOL v55 = v42;
LABEL_20:

    sub_10000852C(*v191, v191[1]);
    if (v188)
    {
      swift_bridgeObjectRelease( *(_TtC18TrustedPeersHelper6Client **)&v55[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peerID + 8],  v222,  v223,  v224,  v225,  v226,  v227,  v228);
      swift_bridgeObjectRelease( *(_TtC18TrustedPeersHelper6Client **)&v55[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_bottleID + 8],  v229,  v230,  v231,  v232,  v233,  v234,  v235);
      uint64_t v16 = v55;
      if ((v190 & 1) == 0)
      {
LABEL_22:
        if (!v189)
        {
LABEL_29:

          goto LABEL_30;
        }

        uint64_t v236 = OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingEscrowKey;
LABEL_28:
        sub_10000852C(*(void *)&v16[v236], *(void *)&v16[v236 + 8]);
        goto LABEL_29;
      }
    }

    else
    {
      uint64_t v16 = v55;
      if (!v190) {
        goto LABEL_22;
      }
    }

    if ((v189 & 1) != 0) {
      sub_10000852C( *(void *)&v16[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingEscrowKey],  *(void *)&v16[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingEscrowKey + 8]);
    }
    sub_10000852C( *(void *)&v16[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningPublicKey],  *(void *)&v16[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningPublicKey + 8]);
    sub_10000852C( *(void *)&v16[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningSPKI],  *(void *)&v16[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningSPKI + 8]);
    sub_10000852C( *(void *)&v16[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peersigningSPKI],  *(void *)&v16[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peersigningSPKI + 8]);
    uint64_t v236 = OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_contents;
    goto LABEL_28;
  }

  id v80 = v72;
  uint64_t v363 = v65;
  [v72 setKeyType:1];
  id v81 = [v369 keyData];
  uint64_t v82 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v81);
  unint64_t v84 = v83;

  Class v85 = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v82, v84);
  [v80 setKeyData:v85];

  [v56 setPeerSigningPrivKey:v66];
  [v56 setPeerEncryptionPrivKey:v80];
  id v86 = [v56 data];
  unint64_t v94 = v80;
  uint64_t v46 = v376;
  if (!v86)
  {
    swift_bridgeObjectRelease(v368, v87, v88, v89, v90, v91, v92, v93);
    swift_bridgeObjectRelease(v367, v212, v213, v214, v215, v216, v217, v218);
    unint64_t v219 = sub_1001BACA0();
    uint64_t v220 = swift_allocError(&type metadata for BottledPeer.Error, v219, 0LL, 0LL);
    *id v221 = 3;
    swift_willThrow(v220);
    swift_release(v65);

    int v188 = 0;
    int v189 = 0;
    int v190 = 0;
    NSString v191 = v378;
    goto LABEL_19;
  }

  id v95 = v86;
  uint64_t v362 = v94;
  uint64_t v96 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v86);
  unint64_t v98 = v97;

  id v99 = objc_msgSend( objc_allocWithZone(_SFAESKeySpecifier),  "initWithBitSize:",  objc_msgSend((id)objc_opt_self(TPHObjectiveC), "aes256BitSize"));
  id v100 = [objc_allocWithZone(_SFAuthenticatedEncryptionOperation) initWithKeySpecifier:v99];

  Class v101 = Data._bridgeToObjectiveC()().super.isa;
  BOOL v55 = v365;
  uint64_t v102 = *(void *)(*(void *)&v365[v376] + OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_symmetricKey);
  uint64_t v380 = 0LL;
  id v103 = [v100 encrypt:v101 withKey:v102 error:&v380];

  id v104 = (id)v380;
  if (!v103)
  {
    id v239 = (id)v380;
    swift_bridgeObjectRelease(v368, v240, v241, v242, v243, v244, v245, v246);
    swift_bridgeObjectRelease(v367, v247, v248, v249, v250, v251, v252, v253);
    _convertNSErrorToError(_:)(v104);

    swift_willThrow(v254);
    swift_release(v363);

    sub_10000852C(v96, v98);
    goto LABEL_14;
  }

  uint64_t v105 = objc_opt_self(&OBJC_CLASS____SFAuthenticatedCiphertext);
  uint64_t v106 = swift_dynamicCastObjCClass(v103, v105);
  if (!v106)
  {
    id v255 = v104;
    swift_bridgeObjectRelease(v368, v256, v257, v258, v259, v260, v261, v262);
    swift_bridgeObjectRelease(v367, v263, v264, v265, v266, v267, v268, v269);
    unint64_t v270 = sub_1001BACA0();
    uint64_t v271 = swift_allocError(&type metadata for BottledPeer.Error, v270, 0LL, 0LL);
    *uint64_t v272 = 4;
    swift_willThrow(v271);

    sub_10000852C(v96, v98);
    swift_release(v363);

LABEL_37:
    id v187 = v362;
    goto LABEL_13;
  }

  id v349 = (id)v106;
  uint64_t v360 = v96;
  unint64_t v361 = v98;
  uint64_t v359 = v100;
  uint64_t v107 = *(void **)(*(void *)&v365[v376] + OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_signingKey);
  id v108 = v104;
  id v358 = v103;
  id v109 = [v107 publicKey];
  uint64_t v110 = objc_opt_self(&OBJC_CLASS____SFECPublicKey);
  uint64_t v357 = v109;
  id v351 = (id)swift_dynamicCastObjCClassUnconditional(v109, v110, 0LL, 0LL, 0LL);
  id v111 =  [*(id *)(*(void *)&v365[v376] + OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_encryptionKey) publicKey];
  uint64_t v112 = objc_opt_self(&OBJC_CLASS____SFECPublicKey);
  id v352 = (id)swift_dynamicCastObjCClassUnconditional(v111, v112, 0LL, 0LL, 0LL);
  id v113 = [v371 publicKey];
  uint64_t v114 = objc_opt_self(&OBJC_CLASS____SFECPublicKey);
  id v356 = (id)swift_dynamicCastObjCClassUnconditional(v113, v114, 0LL, 0LL, 0LL);
  id v115 = [v369 publicKey];
  uint64_t v116 = objc_opt_self(&OBJC_CLASS____SFECPublicKey);
  id v354 = (id)swift_dynamicCastObjCClassUnconditional(v115, v116, 0LL, 0LL, 0LL);
  id v117 = [objc_allocWithZone((Class)OTBottle) init];
  if (!v117)
  {
    swift_bridgeObjectRelease(v368, v118, v119, v120, v121, v122, v123, v124);
    swift_bridgeObjectRelease(v367, v273, v274, v275, v276, v277, v278, v279);
    unint64_t v280 = sub_1001BACA0();
    uint64_t v281 = swift_allocError(&type metadata for BottledPeer.Error, v280, 0LL, 0LL);
    *id v282 = 3;
    swift_willThrow(v281);

LABEL_36:
    sub_10000852C(v360, v361);
    swift_release(v363);

    goto LABEL_37;
  }

  uint64_t v125 = v117;
  uint64_t v347 = v115;
  uint64_t v348 = v113;
  uint64_t v350 = v111;
  NSString v126 = String._bridgeToObjectiveC()();
  [v125 setPeerID:v126];

  NSString v127 = String._bridgeToObjectiveC()();
  [v125 setBottleID:v127];

  id v128 = [v351 encodeSubjectPublicKeyInfo];
  uint64_t v129 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v128);
  unint64_t v131 = v130;

  Class v132 = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v129, v131);
  [v125 setEscrowedSigningSPKI:v132];

  id v133 = [v352 encodeSubjectPublicKeyInfo];
  uint64_t v134 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v133);
  unint64_t v136 = v135;

  Class v137 = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v134, v136);
  [v125 setEscrowedEncryptionSPKI:v137];

  id v138 = [v356 encodeSubjectPublicKeyInfo];
  uint64_t v139 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v138);
  unint64_t v141 = v140;

  Class v142 = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v139, v141);
  [v125 setPeerSigningSPKI:v142];

  id v143 = [v354 encodeSubjectPublicKeyInfo];
  uint64_t v144 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v143);
  unint64_t v146 = v145;

  Class v147 = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v144, v146);
  [v125 setPeerEncryptionSPKI:v147];

  id v148 = [objc_allocWithZone((Class)OTAuthenticatedCiphertext) init];
  if (!v148)
  {
    swift_bridgeObjectRelease(v368, v149, v150, v151, v152, v153, v154, v155);
    swift_bridgeObjectRelease(v367, v283, v284, v285, v286, v287, v288, v289);
    unint64_t v290 = sub_1001BACA0();
    uint64_t v291 = swift_allocError(&type metadata for BottledPeer.Error, v290, 0LL, 0LL);
    _BYTE *v292 = 4;
    swift_willThrow(v291);

    goto LABEL_36;
  }

  id v355 = v125;
  id v156 = v148;
  id v157 = [v349 ciphertext];
  uint64_t v158 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v157);
  unint64_t v160 = v159;

  Class v161 = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v158, v160);
  [v156 setCiphertext:v161];

  id v162 = [v349 authenticationCode];
  uint64_t v163 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v162);
  unint64_t v165 = v164;

  Class v166 = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v163, v165);
  [v156 setAuthenticationCode:v166];

  id v167 = [v349 initializationVector];
  uint64_t v168 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v167);
  unint64_t v170 = v169;

  Class v171 = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(v168, v170);
  [v156 setInitializationVector:v171];

  id v353 = v156;
  [v355 setContents:v156];
  id v172 = (uint64_t *)&v365[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peerID];
  *id v172 = v366;
  v172[1] = (uint64_t)v367;
  BOOL v173 = &v365[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_bottleID];
  *(void *)BOOL v173 = a3;
  *((void *)v173 + 1) = v368;
  id v174 = objc_allocWithZone((Class)type metadata accessor for OctagonSelfPeerKeys());
  swift_bridgeObjectRetain(v367);
  id v175 = v371;
  id v176 = v369;
  uint64_t v372 = v175;
  uint64_t v374 = v176;
  *(void *)&v365[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peerKeys] = sub_100044CDC( v366,  (uint64_t)v367,  v175,  v176);
  uint64_t result = (char *)[v355 data];
  if (result)
  {
    uint64_t v293 = result;
    uint64_t v294 = static Data._unconditionallyBridgeFromObjectiveC(_:)(result);
    uint64_t v296 = v295;

    int64_t v297 = (uint64_t *)&v365[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_contents];
    uint64_t v370 = (uint64_t *)&v365[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_contents];
    uint64_t *v297 = v294;
    v297[1] = v296;
    id v298 =  [*(id *)(*(void *)&v365[v376] + OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_signingKey) publicKey];
    uint64_t v299 = objc_opt_self(&OBJC_CLASS____SFECPublicKey);
    Class v300 = (void *)swift_dynamicCastObjCClassUnconditional(v298, v299, 0LL, 0LL, 0LL);
    id v301 = [v300 keyData];
    uint64_t v302 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v301);
    uint64_t v304 = v303;

    uint64_t v305 = (uint64_t *)&v365[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningPublicKey];
    *uint64_t v305 = v302;
    v305[1] = v304;
    id v306 = [v300 encodeSubjectPublicKeyInfo];
    uint64_t v307 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v306);
    uint64_t v309 = v308;

    uint64_t v310 = (uint64_t *)&v365[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningSPKI];
    uint64_t *v310 = v307;
    v310[1] = v309;
    id v311 = [v356 encodeSubjectPublicKeyInfo];
    uint64_t v312 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v311);
    uint64_t v314 = v313;

    uint64_t v315 = (uint64_t *)&v365[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peersigningSPKI];
    *uint64_t v315 = v312;
    v315[1] = v314;
    id v316 = [objc_allocWithZone(_SFECKeySpecifier) initWithCurve:4];
    id v317 = [objc_allocWithZone(_SFSHA384DigestOperation) init];
    id v318 = [objc_allocWithZone(_SFEC_X962SigningOperation) initWithKeySpecifier:v316 digestOperation:v317];

    uint64_t v319 = *v370;
    unint64_t v320 = v370[1];
    sub_1000084E8(*v370, v320);
    Class v321 = Data._bridgeToObjectiveC()().super.isa;
    sub_10000852C(v319, v320);
    uint64_t v322 = v318;
    uint64_t v323 = *(void *)(*(void *)&v365[v376] + OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_signingKey);
    uint64_t v380 = 0LL;
    id v324 = [v318 sign:v321 withKey:v323 error:&v380];

    uint64_t v325 = v380;
    if (v324)
    {
      id v326 = (id)v380;
      id v327 = [v324 signature];
      uint64_t v328 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v327);
      uint64_t v330 = v329;

      BOOL v331 = (uint64_t *)&v365[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingEscrowKey];
      uint64_t *v331 = v328;
      v331[1] = v330;
      uint64_t v332 = *v370;
      unint64_t v333 = v370[1];
      sub_1000084E8(*v370, v333);
      Class v334 = Data._bridgeToObjectiveC()().super.isa;
      sub_10000852C(v332, v333);
      uint64_t v380 = 0LL;
      id v335 = [v322 sign:v334 withKey:v372 error:&v380];

      uint64_t v336 = v380;
      if (v335)
      {
        id v337 = (id)v380;
        id v338 = [v335 signature];
        uint64_t v339 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v338);
        uint64_t v341 = v340;

        swift_release(v363);
        sub_10000852C(v360, v361);

        id v342 = (uint64_t *)&v365[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingPeerKey];
        *id v342 = v339;
        v342[1] = v341;

        v379.receiver = v365;
        v379.super_class = (Class)type metadata accessor for BottledPeer();
        uint64_t v16 = (char *)objc_msgSendSuper2(&v379, "init");

        return v16;
      }

      id v345 = (id)v380;
      _convertNSErrorToError(_:)(v336);

      swift_willThrow(v346);
      swift_release(v363);

      sub_10000852C(v360, v361);
      int v188 = 1;
      int v189 = 1;
    }

    else
    {
      id v343 = (id)v380;
      _convertNSErrorToError(_:)(v325);

      swift_willThrow(v344);
      swift_release(v363);

      sub_10000852C(v360, v361);
      int v189 = 0;
      int v188 = 1;
    }

    int v190 = 1;
    goto LABEL_15;
  }

  __break(1u);
  return result;
}

char *sub_1001B91FC( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, _TtC18TrustedPeersHelper6Client *a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10)
{
  uint64_t v16 = &v10[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_secret];
  *(void *)uint64_t v16 = a3;
  *((void *)v16 + 1) = a4;
  objc_allocWithZone((Class)type metadata accessor for EscrowKeys());
  sub_1000084E8(a3, a4);
  sub_1000084E8(a3, a4);
  uint64_t v17 = v10;
  SEL v18 = sub_1001AF754(a3, a4, a5, a6);
  if (v11)
  {
    sub_10000852C(a9, a10);
    sub_10000852C(a7, a8);
    sub_10000852C(a3, a4);
    sub_10000852C(a1, a2);
    sub_10000852C(*(void *)v16, *((void *)v16 + 1));
    id v19 = v17;
    goto LABEL_36;
  }

  unint64_t v127 = a4;
  uint64_t v124 = a3;
  uint64_t v125 = OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowKeys;
  id v19 = v17;
  *(void *)&v17[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowKeys] = v18;
  id v20 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)v18
                                                              + OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_signingKey), "publicKey"));
  uint64_t v21 = objc_opt_self(&OBJC_CLASS____SFECPublicKey);
  id v22 = (void *)swift_dynamicCastObjCClass(v20, v21);
  id v126 = v22;
  if (!v22)
  {
    swift_unknownObjectRelease(v20);
    if (qword_100250EE8 != -1) {
      swift_once(&qword_100250EE8, sub_1001B7D3C);
    }
    uint64_t v80 = type metadata accessor for Logger(0LL);
    uint64_t v81 = sub_100006BAC(v80, (uint64_t)qword_100257CE8);
    uint64_t v82 = (os_log_s *)Logger.logObject.getter(v81);
    os_log_type_t v83 = static os_log_type_t.info.getter(v82);
    if (os_log_type_enabled(v82, v83))
    {
      unint64_t v84 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v84 = 0;
      _os_log_impl((void *)&_mh_execute_header, v82, v83, "escrow key not an SFECPublicKey?", v84, 2u);
      swift_slowDealloc(v84, -1LL, -1LL);
    }

    unint64_t v85 = sub_1001BACA0();
    uint64_t v86 = swift_allocError(&type metadata for BottledPeer.Error, v85, 0LL, 0LL);
    *id v87 = 3;
    swift_willThrow(v86);
    sub_10000852C(a9, a10);
    sub_10000852C(a7, a8);
    sub_10000852C(a3, a4);
    sub_10000852C(a1, a2);
    goto LABEL_32;
  }

  id v23 = [v22 encodeSubjectPublicKeyInfo];
  uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v23);
  uint64_t v26 = v25;

  int64_t v27 = (uint64_t *)&v19[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningSPKI];
  *int64_t v27 = v24;
  v27[1] = v26;
  BOOL v123 = v27;
  id v28 = objc_allocWithZone((Class)&OBJC_CLASS___OTBottle);
  sub_1000084E8(a1, a2);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C(a1, a2);
  id v30 = [v28 initWithData:isa];

  if (!v30)
  {
    if (qword_100250EE8 != -1) {
      swift_once(&qword_100250EE8, sub_1001B7D3C);
    }
    uint64_t v88 = type metadata accessor for Logger(0LL);
    uint64_t v89 = sub_100006BAC(v88, (uint64_t)qword_100257CE8);
    uint64_t v90 = (os_log_s *)Logger.logObject.getter(v89);
    os_log_type_t v91 = static os_log_type_t.info.getter(v90);
    if (os_log_type_enabled(v90, v91))
    {
      BOOL v92 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)BOOL v92 = 0;
      _os_log_impl((void *)&_mh_execute_header, v90, v91, "Unable to deserialize bottle", v92, 2u);
      swift_slowDealloc(v92, -1LL, -1LL);
    }

    unint64_t v93 = sub_1001BACA0();
    uint64_t v94 = swift_allocError(&type metadata for BottledPeer.Error, v93, 0LL, 0LL);
    _BYTE *v95 = 0;
    swift_willThrow(v94);
    sub_10000852C(a9, a10);
    sub_10000852C(a7, a8);
    sub_10000852C(a3, a4);
    sub_10000852C(a1, a2);
    swift_unknownObjectRelease(v20);
    goto LABEL_32;
  }

  id v122 = v30;
  id v31 = [v30 escrowedSigningSPKI];
  unint64_t v121 = v16;
  if (!v31)
  {
    uint64_t v33 = 0LL;
    uint64_t v37 = *v123;
    unint64_t v36 = v123[1];
    unint64_t v35 = 0xF000000000000000LL;
    uint64_t v38 = a1;
    goto LABEL_26;
  }

  SEL v32 = v31;
  uint64_t v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v31);
  unint64_t v35 = v34;

  uint64_t v37 = *v123;
  unint64_t v36 = v123[1];
  uint64_t v38 = a1;
  if (v35 >> 60 == 15)
  {
LABEL_26:
    sub_1000084E8(v37, v36);
    sub_10003C1D0(v33, v35);
    sub_10003C1D0(v37, v36);
    goto LABEL_27;
  }

  sub_1000084E8(*v123, v123[1]);
  sub_10004C798(v33, v35);
  sub_100041318(v33, v35);
  char v40 = v39;
  sub_10000852C(v37, v36);
  sub_10003C1D0(v33, v35);
  sub_10003C1D0(v33, v35);
  if ((v40 & 1) == 0)
  {
LABEL_27:
    if (qword_100250EE8 != -1) {
      swift_once(&qword_100250EE8, sub_1001B7D3C);
    }
    uint64_t v96 = type metadata accessor for Logger(0LL);
    uint64_t v97 = sub_100006BAC(v96, (uint64_t)qword_100257CE8);
    unint64_t v98 = (os_log_s *)Logger.logObject.getter(v97);
    os_log_type_t v99 = static os_log_type_t.info.getter(v98);
    uint64_t v16 = v121;
    if (os_log_type_enabled(v98, v99))
    {
      id v100 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v100 = 0;
      _os_log_impl((void *)&_mh_execute_header, v98, v99, "Bottled SPKI does not match re-created SPKI", v100, 2u);
      swift_slowDealloc(v100, -1LL, -1LL);
    }

    unint64_t v101 = sub_1001BACA0();
    uint64_t v102 = swift_allocError(&type metadata for BottledPeer.Error, v101, 0LL, 0LL);
    *id v103 = 8;
    swift_willThrow(v102);
    sub_10000852C(a9, a10);
    sub_10000852C(a7, a8);
    sub_10000852C(v124, v127);
    sub_10000852C(v38, a2);
    swift_unknownObjectRelease(v20);

LABEL_32:
    id v104 = v16;
LABEL_33:
    uint64_t v105 = &qword_100257000;
    goto LABEL_34;
  }

  id v119 = v20;
  id v41 = [objc_allocWithZone(_SFECKeySpecifier) initWithCurve:4];
  id v42 = [objc_allocWithZone(_SFSHA384DigestOperation) init];
  id v120 = [objc_allocWithZone(_SFEC_X962SigningOperation) initWithKeySpecifier:v41 digestOperation:v42];

  id v43 = objc_allocWithZone(&OBJC_CLASS____SFSignedData);
  sub_1000084E8(a1, a2);
  sub_1000084E8(a7, a8);
  Class v44 = Data._bridgeToObjectiveC()().super.isa;
  Class v45 = Data._bridgeToObjectiveC()().super.isa;
  id v46 = [v43 initWithData:v44 signature:v45];
  sub_10000852C(a7, a8);
  sub_10000852C(a1, a2);

  id v132 = 0LL;
  id v118 = v46;
  id v47 = [v120 verify:v46 withKey:v126 error:&v132];
  id v48 = v132;
  if (v47)
  {
    uint64_t v49 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v47);
    sub_10000852C(v49, v50);

    id v51 = objc_msgSend( objc_allocWithZone(_SFAESKeySpecifier),  "initWithBitSize:",  objc_msgSend((id)objc_opt_self(TPHObjectiveC), "aes256BitSize"));
    id v52 = [objc_allocWithZone(_SFAuthenticatedEncryptionOperation) initWithKeySpecifier:v51];

    id v53 = [v122 contents];
    if (v53)
    {
      BOOL v54 = v53;
      id v55 = [v53 ciphertext];
      if (v55)
      {
        BOOL v56 = v55;
        uint64_t v57 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v55);
        unint64_t v59 = v58;

        id v60 = [v54 authenticationCode];
        if (v60)
        {
          id v61 = v60;
          id v117 = v52;
          uint64_t v62 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v60);
          unint64_t v116 = v63;

          id v115 = v54;
          id v64 = [v54 initializationVector];
          if (v64)
          {
            uint64_t v65 = v64;
            uint64_t v66 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v64);
            unint64_t v68 = v67;

            id v112 = objc_allocWithZone(&OBJC_CLASS____SFAuthenticatedCiphertext);
            unint64_t v114 = v59;
            Class v69 = Data._bridgeToObjectiveC()().super.isa;
            id v113 = (id)v62;
            Class v70 = Data._bridgeToObjectiveC()().super.isa;
            Class v71 = Data._bridgeToObjectiveC()().super.isa;
            id v72 = [v112 initWithCiphertext:v69 authenticationCode:v70 initializationVector:v71];
            uint64_t v73 = v66;
            uint64_t v74 = v72;
            sub_10000852C(v73, v68);
            sub_10000852C((uint64_t)v113, v116);
            sub_10000852C(v57, v114);

            uint64_t v75 = *(void *)(*(void *)&v19[v125] + OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_symmetricKey);
            id v132 = 0LL;
            id v76 = [v117 decrypt:v74 withKey:v75 error:&v132];
            id v77 = v132;
            if (v76)
            {
              static Data._unconditionallyBridgeFromObjectiveC(_:)(v76);
              uint64_t v79 = v78;

              __asm { BR              X10 }
            }

            uint64_t v110 = v77;
            _convertNSErrorToError(_:)(v77);

            swift_willThrow(v111);
            sub_10000852C(a9, a10);
            sub_10000852C(a7, a8);
            sub_10000852C(v124, v127);
            sub_10000852C(a1, a2);
            swift_unknownObjectRelease(v119);

            id v104 = v121;
            goto LABEL_33;
          }

id sub_1001BAB60()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BottledPeer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BottledPeer()
{
  return objc_opt_self(&OBJC_CLASS____TtC18TrustedPeersHelper11BottledPeer);
}

unint64_t sub_1001BACA0()
{
  unint64_t result = qword_100257D80;
  if (!qword_100257D80)
  {
    unint64_t result = swift_getWitnessTable(&unk_1001E6EE0, &type metadata for BottledPeer.Error);
    atomic_store(result, (unint64_t *)&qword_100257D80);
  }

  return result;
}

BOOL sub_1001BACE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1001BACF8(uint64_t a1)
{
  unint64_t v2 = sub_1001BAEE4();
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1001BAD20(uint64_t a1)
{
  unint64_t v2 = sub_1001BAEE4();
  return Error<>._code.getter(a1, v2);
}

void sub_1001BAD48(char a1)
{
  __asm { BR              X11 }

void *sub_1001BAD94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = a1 + 5;
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
  uint64_t v4 = v3;
  id v23 = &type metadata for String;
  *(void *)&__int128 v22 = v1;
  *((void *)&v22 + 1) = 0x80000001001FBD60LL;
  sub_100008570(&v22, v21);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
  sub_10014BF08(v21, v2, (uint64_t)v4, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease(v4, v6, v7, v8, v9, v10, v11, v12);
  swift_bridgeObjectRelease((_TtC18TrustedPeersHelper6Client *)0x8000000000000000LL, v13, v14, v15, v16, v17, v18, v19);
  return &_swiftEmptyDictionarySingleton;
}

unint64_t sub_1001BAEAC()
{
  return 0xD000000000000024LL;
}

uint64_t sub_1001BAEC8()
{
  return qword_1001E6F98[*v0];
}

void sub_1001BAEDC()
{
}

unint64_t sub_1001BAEE4()
{
  unint64_t result = qword_100257D88;
  if (!qword_100257D88)
  {
    unint64_t result = swift_getWitnessTable(&unk_1001E6EA0, &type metadata for BottledPeer.Error);
    atomic_store(result, (unint64_t *)&qword_100257D88);
  }

  return result;
}

void sub_1001BAF28(int *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if ((int)v3 < (int)v2)
  {
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v4 = __DataStorage._bytes.getter();
  if (!v4)
  {
LABEL_12:
    __break(1u);
    return;
  }

  uint64_t v5 = v4;
  uint64_t v6 = __DataStorage._offset.getter();
  uint64_t v7 = v2 - v6;
  if (__OFSUB__(v2, v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  int64_t v8 = v3 - v2;
  uint64_t v9 = __DataStorage._length.getter();
  if (v9 >= v8) {
    size_t v10 = v8;
  }
  else {
    size_t v10 = v9;
  }
  if (SecRandomCopyBytes(kSecRandomDefault, v10, (void *)(v5 + v7)))
  {
    unint64_t v11 = sub_1001BACA0();
    uint64_t v12 = swift_allocError(&type metadata for BottledPeer.Error, v11, 0LL, 0LL);
    *SEL v13 = 7;
    swift_willThrow(v12);
  }

unint64_t sub_1001BAFEC()
{
  unint64_t result = qword_100257D90;
  if (!qword_100257D90)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS____SFPublicKey);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100257D90);
  }

  return result;
}

uint64_t sub_1001BB028(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  id v10 = [objc_allocWithZone(_SFECKeySpecifier) initWithCurve:4];
  id v11 = [objc_allocWithZone(_SFSHA384DigestOperation) init];
  id v12 = [objc_allocWithZone(_SFEC_X962SigningOperation) initWithKeySpecifier:v10 digestOperation:v11];

  id v13 = objc_allocWithZone(&OBJC_CLASS____SFSignedData);
  sub_1000084E8(a1, a2);
  sub_1000084E8(a3, a4);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  Class v15 = Data._bridgeToObjectiveC()().super.isa;
  id v16 = [v13 initWithData:isa signature:v15];
  sub_10000852C(a3, a4);
  sub_10000852C(a1, a2);

  id v25 = 0LL;
  id v17 = [v12 verify:v16 withKey:a5 error:&v25];
  id v18 = v25;
  if (v17)
  {
    uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v17);
    unint64_t v21 = v20;

    sub_10000852C(v19, v21);
  }

  else
  {
    __int128 v22 = v18;
    _convertNSErrorToError(_:)(v18);

    swift_willThrow(v23);
  }

  return 1LL;
}

uint64_t getEnumTagSinglePayload for BottledPeer.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 8;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }

uint64_t storeEnumTagSinglePayload for BottledPeer.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF7) {
    return ((uint64_t (*)(void))((char *)&loc_1001BB304 + 4 * byte_1001E6E7E[v4]))();
  }
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_1001BB338 + 4 * byte_1001E6E79[v4]))();
}

uint64_t sub_1001BB338(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BB340(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1001BB348LL);
  }
  return result;
}

uint64_t sub_1001BB354(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1001BB35CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 8;
  return result;
}

uint64_t sub_1001BB360(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001BB368(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1001BB374(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BottledPeer.Error()
{
  return &type metadata for BottledPeer.Error;
}

unint64_t sub_1001BB390()
{
  unint64_t result = qword_100257D98;
  if (!qword_100257D98)
  {
    unint64_t result = swift_getWitnessTable(&unk_1001E6F68, &type metadata for BottledPeer.Error);
    atomic_store(result, (unint64_t *)&qword_100257D98);
  }

  return result;
}

id sub_1001BB3D8(void *a1, void *a2)
{
  id result = [a1 hasChanges];
  return result;
}

void sub_1001BB428(void *a1, void *a2)
{
  uint64_t v3 = v2;
  if (qword_100250EF0 != -1) {
    swift_once(&qword_100250EF0, sub_1001BB540);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_100006BAC(v6, (uint64_t)qword_100257DA0);
  int v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "onqueueRemoveDuplicateVouchers start", v10, 2u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  id v11 = objc_autoreleasePoolPush();
  sub_1001BD114(a1, a2, v3);
  objc_autoreleasePoolPop(v11);
}

uint64_t sub_1001BB540()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100006B6C(v0, qword_100257DA0);
  sub_100006BAC(v0, (uint64_t)qword_100257DA0);
  return Logger.init(subsystem:category:)( 0xD00000000000001FLL,  0x80000001001E7520LL,  0x656E6961746E6F63LL,  0xE900000000000072LL);
}

id sub_1001BB5B8(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t *a7, uint64_t *a8)
{
  id v12 = [a1 voucherInfo];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v12);
    unint64_t v16 = v15;
  }

  else
  {
    uint64_t v14 = 0LL;
    unint64_t v16 = 0xC000000000000000LL;
  }

  id v181 = a6;
  id v187 = a1;
  id v17 = [a1 voucherInfoSig];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v17);
    unint64_t v21 = v20;
  }

  else
  {
    uint64_t v19 = 0LL;
    unint64_t v21 = 0xC000000000000000LL;
  }

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  Class v23 = Data._bridgeToObjectiveC()().super.isa;
  id v24 = [(id)objc_opt_self(TPVoucher) voucherInfoWithData:isa sig:v23];
  sub_10000852C(v19, v21);
  sub_10000852C(v14, v16);

  if (v24)
  {
    id v25 = v24;
    id v26 = [v25 beneficiaryID];
    uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    uint64_t v29 = v28;

    id v30 = [a4 peerID];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      uint64_t v34 = v33;

      if (v27 == v32 && v29 == v34)
      {
        swift_bridgeObjectRelease_n(v29, 2LL);
        goto LABEL_19;
      }

      char v49 = _stringCompareWithSmolCheck(_:_:expecting:)(v27, v29, v32, v34, 0LL);
      swift_bridgeObjectRelease(v29);
      swift_bridgeObjectRelease(v34);
      if ((v49 & 1) != 0)
      {
LABEL_19:
        uint64_t v50 = *a8;
        swift_bridgeObjectRetain(*a8);
        char v51 = sub_10003B924(v25, v50);
        swift_bridgeObjectRelease(v50);
        if ((v51 & 1) != 0)
        {
          id v52 = v187;
          if (qword_100250EF0 != -1) {
            swift_once(&qword_100250EF0, sub_1001BB540);
          }
          uint64_t v53 = type metadata accessor for Logger(0LL);
          sub_100006BAC(v53, (uint64_t)qword_100257DA0);
          id v54 = v25;
          id v55 = a4;
          id v56 = v54;
          id v57 = v55;
          id v58 = v56;
          unint64_t v59 = (os_log_s *)Logger.logObject.getter(v58);
          os_log_type_t v60 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v59, v60))
          {
            uint64_t v61 = swift_slowAlloc(42LL, -1LL);
            unint64_t v183 = swift_slowAlloc(96LL, -1LL);
            unint64_t v191 = v183;
            *(_DWORD *)uint64_t v61 = 136446978;
            id v62 = [v57 peerID];
            if (v62)
            {
              unint64_t v63 = v62;
              uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)(v62);
              unint64_t v66 = v65;
            }

            else
            {
              uint64_t v64 = 7104878LL;
              unint64_t v66 = 0xE300000000000000LL;
            }

            uint64_t v189 = sub_10017C4C4(v64, v66, (uint64_t *)&v191);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v61 + 4, v61 + 12);

            swift_bridgeObjectRelease(v66);
            *(_WORD *)(v61 + 12) = 2082;
            id v152 = [v58 sponsorID];
            uint64_t v153 = static String._unconditionallyBridgeFromObjectiveC(_:)(v152);
            unint64_t v155 = v154;

            uint64_t v189 = sub_10017C4C4(v153, v155, (uint64_t *)&v191);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v61 + 14, v61 + 22);

            swift_bridgeObjectRelease(v155);
            *(_WORD *)(v61 + 22) = 2082;
            id v156 = [v58 beneficiaryID];
            uint64_t v157 = static String._unconditionallyBridgeFromObjectiveC(_:)(v156);
            unint64_t v159 = v158;

            uint64_t v189 = sub_10017C4C4(v157, v159, (uint64_t *)&v191);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v61 + 24, v61 + 32);

            swift_bridgeObjectRelease(v159);
            *(_WORD *)(v61 + 32) = 2050;
            id v160 = [v58 reason];

            uint64_t v189 = (uint64_t)v160;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v61 + 34, v61 + 42);

            _os_log_impl( (void *)&_mh_execute_header,  v59,  v60,  "duplicate voucher for peerID %{public}s sponsorID %{public}s beneficiaryID %{public}s reason %{public}lu",  (uint8_t *)v61,  0x2Au);
            swift_arrayDestroy(v183, 3LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v183, -1LL, -1LL);
            swift_slowDealloc(v61, -1LL, -1LL);

            id v52 = v187;
          }

          else
          {
          }

          id v161 = v52;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v161);
          unint64_t v163 = *(void *)((*v181 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v162 = *(void *)((*v181 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v163 >= v162 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v162 > 1, v163 + 1, 1LL);
          }
          uint64_t v164 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v163, v161);
          specialized Array._endMutation()(v164);
        }

        else
        {
          id v81 = v25;
          sub_100151C38((Swift::Int *)&v191, v81);

          id v52 = v187;
          if (qword_100250EF0 != -1) {
            swift_once(&qword_100250EF0, sub_1001BB540);
          }
          uint64_t v82 = type metadata accessor for Logger(0LL);
          sub_100006BAC(v82, (uint64_t)qword_100257DA0);
          id v83 = v81;
          id v84 = a4;
          id v85 = v83;
          id v86 = v84;
          id v58 = v85;
          id v87 = (os_log_s *)Logger.logObject.getter(v58);
          os_log_type_t v88 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v87, v88))
          {
            uint64_t v89 = swift_slowAlloc(42LL, -1LL);
            unint64_t v184 = swift_slowAlloc(96LL, -1LL);
            unint64_t v191 = v184;
            *(_DWORD *)uint64_t v89 = 136446978;
            id v90 = [v86 peerID];
            if (v90)
            {
              os_log_type_t v91 = v90;
              uint64_t v92 = static String._unconditionallyBridgeFromObjectiveC(_:)(v90);
              unint64_t v94 = v93;
            }

            else
            {
              uint64_t v92 = 7104878LL;
              unint64_t v94 = 0xE300000000000000LL;
            }

            uint64_t v189 = sub_10017C4C4(v92, v94, (uint64_t *)&v191);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v89 + 4, v89 + 12);

            swift_bridgeObjectRelease(v94);
            *(_WORD *)(v89 + 12) = 2082;
            id v165 = [v58 sponsorID];
            uint64_t v166 = static String._unconditionallyBridgeFromObjectiveC(_:)(v165);
            unint64_t v168 = v167;

            uint64_t v189 = sub_10017C4C4(v166, v168, (uint64_t *)&v191);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v89 + 14, v89 + 22);

            swift_bridgeObjectRelease(v168);
            *(_WORD *)(v89 + 22) = 2082;
            id v169 = [v58 beneficiaryID];
            uint64_t v170 = static String._unconditionallyBridgeFromObjectiveC(_:)(v169);
            unint64_t v172 = v171;

            uint64_t v189 = sub_10017C4C4(v170, v172, (uint64_t *)&v191);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v89 + 24, v89 + 32);

            swift_bridgeObjectRelease(v172);
            *(_WORD *)(v89 + 32) = 2050;
            id v173 = [v58 reason];

            uint64_t v189 = (uint64_t)v173;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v89 + 34, v89 + 42);

            _os_log_impl( (void *)&_mh_execute_header,  v87,  v88,  "voucher kept for peerID %{public}s sponsorID %{public}s beneficiaryID %{public}s reason %{public}lu",  (uint8_t *)v89,  0x2Au);
            swift_arrayDestroy(v184, 3LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v184, -1LL, -1LL);
            swift_slowDealloc(v89, -1LL, -1LL);

            id v52 = v187;
            goto LABEL_66;
          }
        }

LABEL_66:
        id result = [v52 hasChanges];
        return result;
      }
    }

    else
    {
      swift_bridgeObjectRelease(v29);
    }

    if (qword_100250EF0 != -1) {
      swift_once(&qword_100250EF0, sub_1001BB540);
    }
    uint64_t v67 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v67, (uint64_t)qword_100257DA0);
    id v68 = v25;
    id v69 = a4;
    id v70 = v68;
    id v71 = v69;
    id v72 = v70;
    uint64_t v73 = (os_log_s *)Logger.logObject.getter(v72);
    os_log_type_t v74 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v73, v74))
    {
      uint64_t v75 = swift_slowAlloc(42LL, -1LL);
      unint64_t v178 = swift_slowAlloc(96LL, -1LL);
      unint64_t v191 = v178;
      *(_DWORD *)uint64_t v75 = 136446978;
      id v76 = [v71 peerID];
      os_log_type_t v179 = v74;
      if (v76)
      {
        id v77 = v76;
        uint64_t v78 = static String._unconditionallyBridgeFromObjectiveC(_:)(v76);
        unint64_t v80 = v79;
      }

      else
      {
        uint64_t v78 = 7104878LL;
        unint64_t v80 = 0xE300000000000000LL;
      }

      uint64_t v189 = sub_10017C4C4(v78, v80, (uint64_t *)&v191);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v75 + 4, v75 + 12);

      swift_bridgeObjectRelease(v80);
      *(_WORD *)(v75 + 12) = 2082;
      id v97 = [v72 sponsorID];
      uint64_t v98 = static String._unconditionallyBridgeFromObjectiveC(_:)(v97);
      unint64_t v100 = v99;

      uint64_t v189 = sub_10017C4C4(v98, v100, (uint64_t *)&v191);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v75 + 14, v75 + 22);

      swift_bridgeObjectRelease(v100);
      *(_WORD *)(v75 + 22) = 2082;
      id v101 = [v72 beneficiaryID];
      uint64_t v102 = static String._unconditionallyBridgeFromObjectiveC(_:)(v101);
      unint64_t v104 = v103;

      uint64_t v189 = sub_10017C4C4(v102, v104, (uint64_t *)&v191);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v75 + 24, v75 + 32);

      swift_bridgeObjectRelease(v104);
      *(_WORD *)(v75 + 32) = 2050;
      id v105 = [v72 reason];

      uint64_t v189 = (uint64_t)v105;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v75 + 34, v75 + 42);

      _os_log_impl( (void *)&_mh_execute_header,  v73,  v179,  "voucher inconsistency for peerID %{public}s sponsorID %{public}s beneficiaryID %{public}s reason %{public}lu",  (uint8_t *)v75,  0x2Au);
      swift_arrayDestroy(v178, 3LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v178, -1LL, -1LL);
      swift_slowDealloc(v75, -1LL, -1LL);
    }

    else
    {
    }

    id v106 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
    NSString v107 = String._bridgeToObjectiveC()();
    id v108 = [v106 initWithEntityName:v107];

    sub_1001BD678();
    uint64_t v109 = sub_100007578(&qword_100251578);
    uint64_t v110 = swift_allocObject(v109, 112LL, 7LL);
    *(_OWORD *)(v110 + 16) = xmmword_1001DE420;
    *(void *)(v110 + 56) = type metadata accessor for ContainerMO();
    *(void *)(v110 + 64) = sub_1001BE0C0( &qword_100256BA8,  (uint64_t (*)(uint64_t))type metadata accessor for ContainerMO);
    *(void *)(v110 + 32) = a5;
    id v111 = a5;
    id v112 = [v72 beneficiaryID];
    uint64_t v113 = static String._unconditionallyBridgeFromObjectiveC(_:)(v112);
    uint64_t v115 = v114;

    *(void *)(v110 + 96) = &type metadata for String;
    *(void *)(v110 + 104) = sub_10000FC24();
    *(void *)(v110 + 72) = v113;
    *(void *)(v110 + 80) = v115;
    unint64_t v116 = (void *)NSPredicate.init(format:_:)(0xD00000000000001FLL, 0x80000001001FBE30LL, v110);
    [v108 setPredicate:v116];

    [v108 setFetchLimit:1];
    uint64_t v117 = type metadata accessor for PeerMO();
    uint64_t v118 = NSManagedObjectContext.count<A>(for:)(v108, v117);
    if (!v188)
    {
      id v52 = v187;
      if (v118)
      {
        id v119 = (os_log_s *)Logger.logObject.getter(v118);
        os_log_type_t v120 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v119, v120))
        {
          unint64_t v121 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)unint64_t v121 = 0;
          _os_log_impl((void *)&_mh_execute_header, v119, v120, "moving voucher", v121, 2u);
          swift_slowDealloc(v121, -1LL, -1LL);
        }

        id v122 = [v72 beneficiaryID];
        uint64_t v123 = static String._unconditionallyBridgeFromObjectiveC(_:)(v122);
        uint64_t v125 = v124;

        uint64_t v126 = *a7;
        if (*(void *)(*a7 + 16) && (unint64_t v127 = sub_10000D1E8(v123, v125), (v128 & 1) != 0)) {
          uint64_t v129 = (void *)swift_bridgeObjectRetain(*(void *)(*(void *)(v126 + 56) + 8 * v127));
        }
        else {
          uint64_t v129 = _swiftEmptyArrayStorage;
        }
        unint64_t v191 = (unint64_t)v129;
        swift_bridgeObjectRelease(v125);
        id v130 = v187;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v130);
        unint64_t v132 = *(void *)((v191 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v131 = *(void *)((v191 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v132 >= v131 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v131 > 1, v132 + 1, 1LL);
        }
        uint64_t v133 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v132, v130);
        specialized Array._endMutation()(v133);
        id v134 = [v72 beneficiaryID];
        uint64_t v135 = static String._unconditionallyBridgeFromObjectiveC(_:)(v134);
        uint64_t v137 = v136;

        int64_t v138 = v191;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a7);
        uint64_t v189 = *a7;
        *a7 = 0x8000000000000000LL;
        sub_10014CD00(v138, v135, v137, isUniquelyReferenced_nonNull_native);
        uint64_t v140 = *a7;
        *a7 = v189;

        swift_bridgeObjectRelease(v137);
        swift_bridgeObjectRelease(v140);
      }

      else
      {
        id v141 = v72;
        Class v142 = (os_log_s *)Logger.logObject.getter(v141);
        os_log_type_t v146 = static os_log_type_t.error.getter(v142, v143, v144, v145);
        if (os_log_type_enabled(v142, v146))
        {
          Class v147 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          unint64_t v185 = swift_slowAlloc(32LL, -1LL);
          unint64_t v191 = v185;
          *(_DWORD *)Class v147 = 136315138;
          id v148 = [v141 beneficiaryID];
          uint64_t v149 = static String._unconditionallyBridgeFromObjectiveC(_:)(v148);
          unint64_t v151 = v150;

          uint64_t v189 = sub_10017C4C4(v149, v151, (uint64_t *)&v191);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v147 + 4, v147 + 12);

          swift_bridgeObjectRelease(v151);
          _os_log_impl( (void *)&_mh_execute_header,  v142,  v146,  "deleting voucher due to peerID not found: %s",  v147,  0xCu);
          swift_arrayDestroy(v185, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v185, -1LL, -1LL);
          swift_slowDealloc(v147, -1LL, -1LL);
        }

        else
        {
        }

        id v52 = v187;
        id v174 = v187;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v174);
        unint64_t v176 = *(void *)((*v181 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v175 = *(void *)((*v181 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v176 >= v175 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v175 > 1, v176 + 1, 1LL);
        }
        uint64_t v177 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v176, v174);
        specialized Array._endMutation()(v177);
      }

      goto LABEL_66;
    }

    id v95 = v187;
    id result = [v187 hasChanges];
    return [a3 refreshObject:v95 mergeChanges:0];
  }

  if (qword_100250EF0 != -1) {
    swift_once(&qword_100250EF0, sub_1001BB540);
  }
  uint64_t v35 = type metadata accessor for Logger(0LL);
  sub_100006BAC(v35, (uint64_t)qword_100257DA0);
  id v36 = a4;
  uint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
  os_log_type_t v41 = static os_log_type_t.error.getter(v37, v38, v39, v40);
  if (os_log_type_enabled(v37, v41))
  {
    id v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    unint64_t v43 = swift_slowAlloc(32LL, -1LL);
    unint64_t v191 = v43;
    *(_DWORD *)id v42 = 136446210;
    id v44 = [v36 peerID];
    if (v44)
    {
      Class v45 = v44;
      uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
      unint64_t v48 = v47;
    }

    else
    {
      uint64_t v46 = 7104878LL;
      unint64_t v48 = 0xE300000000000000LL;
    }

    uint64_t v189 = sub_10017C4C4(v46, v48, (uint64_t *)&v191);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v189, &v190, v42 + 4, v42 + 12);

    swift_bridgeObjectRelease(v48);
    _os_log_impl( (void *)&_mh_execute_header,  v37,  v41,  "voucher dedup unable to construct TPVoucher for peerID %{public}s, leaving in DB",  v42,  0xCu);
    swift_arrayDestroy(v43, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1LL, -1LL);
    swift_slowDealloc(v42, -1LL, -1LL);
  }

  else
  {
  }

  id v95 = v187;
  id result = [v187 hasChanges];
  return result;
}

void sub_1001BC834(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v10 = objc_autoreleasePoolPush();
  sub_1001BC8A0(a4, a5, a1, a2, a3);
  objc_autoreleasePoolPop(v10);
}

void sub_1001BC8A0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (id)a4;
  uint64_t v8 = a3;
  id v10 = (void *)sub_1001616C8((uint64_t)a1, a2, a3, a4);
  if (v5)
  {
    uint64_t v11 = v5;
LABEL_3:
    swift_errorRetain(v11);
    if (qword_100250EF0 != -1) {
      swift_once(&qword_100250EF0, sub_1001BB540);
    }
    uint64_t v12 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v12, (uint64_t)qword_100257DA0);
    swift_bridgeObjectRetain(v7);
    swift_errorRetain(v11);
    swift_bridgeObjectRetain(v7);
    uint64_t v13 = swift_errorRetain(v11);
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v18 = static os_log_type_t.error.getter(v14, v15, v16, v17);
    if (os_log_type_enabled(v14, v18))
    {
      uint64_t v19 = swift_slowAlloc(22LL, -1LL);
      unint64_t v20 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      unint64_t v21 = (void *)swift_slowAlloc(32LL, -1LL);
      id v78 = v21;
      *(_DWORD *)uint64_t v19 = 136446466;
      swift_bridgeObjectRetain(v7);
      uint64_t v77 = sub_10017C4C4(v8, (unint64_t)v7, (uint64_t *)&v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease_n(v7, 3LL);
      *(_WORD *)(v19 + 12) = 2112;
      swift_errorRetain(v11);
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError(v11);
      uint64_t v77 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v19 + 14, v19 + 22);
      uint64_t *v20 = v22;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v18,  "Failed to move vouchers for beneficiary %{public}s): %@",  (uint8_t *)v19,  0x16u);
      uint64_t v23 = sub_100007578(&qword_100250F90);
      swift_arrayDestroy(v20, 1LL, v23);
      swift_slowDealloc(v20, -1LL, -1LL);
      swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1LL, -1LL);
      swift_slowDealloc(v19, -1LL, -1LL);

      swift_errorRelease();
      swift_errorRelease();
    }

    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_bridgeObjectRelease_n(v7, 2LL);
      swift_errorRelease();
      swift_errorRelease();
    }

    return;
  }

  id v24 = v10;
  uint64_t v75 = v8;
  unint64_t v25 = (unint64_t)a5 >> 62;
  if (!v10)
  {
    if (qword_100250EF0 == -1) {
      goto LABEL_18;
    }
    goto LABEL_57;
  }

  if (v25)
  {
    if (a5 < 0) {
      uint64_t v46 = a5;
    }
    else {
      uint64_t v46 = a5 & 0xFFFFFFFFFFFFFF8LL;
    }
    id v47 = v10;
    swift_bridgeObjectRetain(a5);
    uint64_t v26 = _CocoaArrayWrapper.endIndex.getter(v46);
    if (!v26) {
      goto LABEL_33;
    }
  }

  else
  {
    uint64_t v26 = *(void *)((a5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    id v27 = v10;
    swift_bridgeObjectRetain(a5);
    if (!v26) {
      goto LABEL_33;
    }
  }

  if (v26 < 1)
  {
LABEL_56:
    __break(1u);
LABEL_57:
    swift_once(&qword_100250EF0, sub_1001BB540);
LABEL_18:
    uint64_t v31 = type metadata accessor for Logger(0LL);
    sub_100006BAC(v31, (uint64_t)qword_100257DA0);
    uint64_t v32 = swift_bridgeObjectRetain_n(v7, 2LL);
    uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
    os_log_type_t v37 = static os_log_type_t.error.getter(v33, v34, v35, v36);
    if (os_log_type_enabled(v33, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v39 = (void *)swift_slowAlloc(32LL, -1LL);
      id v78 = v39;
      *(_DWORD *)uint64_t v38 = 136446210;
      os_log_type_t v74 = v38 + 4;
      swift_bridgeObjectRetain(v7);
      uint64_t v77 = sub_10017C4C4(v75, (unint64_t)v7, (uint64_t *)&v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v38 + 4, v38 + 12);
      swift_bridgeObjectRelease_n(v7, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v33, v37, "Could not find peerMO for beneficiary %{public}s", v38, 0xCu);
      swift_arrayDestroy(v39, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v39, -1LL, -1LL);
      swift_slowDealloc(v38, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v7, 2LL);
    }

    if (v25)
    {
      if (a5 < 0) {
        uint64_t v71 = a5;
      }
      else {
        uint64_t v71 = a5 & 0xFFFFFFFFFFFFFF8LL;
      }
      id v72 = a1;
      swift_bridgeObjectRetain(a5);
      id v73 = v72;
      uint64_t v40 = _CocoaArrayWrapper.endIndex.getter(v71);
      if (v40) {
        goto LABEL_23;
      }
    }

    else
    {
      uint64_t v40 = *(void *)((a5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      id v41 = a1;
      swift_bridgeObjectRetain(a5);
      id v42 = v41;
      if (v40)
      {
LABEL_23:
        if (v40 < 1) {
          __break(1u);
        }
        for (uint64_t i = 0LL; i != v40; ++i)
        {
          if ((a5 & 0xC000000000000001LL) != 0) {
            id v44 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a5);
          }
          else {
            id v44 = *(id *)(a5 + 8 * i + 32);
          }
          Class v45 = v44;
          objc_msgSend(a1, "deleteObject:", v44, v74);
        }
      }
    }

    swift_bridgeObjectRelease(a5);

    return;
  }

  for (uint64_t j = 0LL; j != v26; ++j)
  {
    if ((a5 & 0xC000000000000001LL) != 0) {
      id v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(j, a5);
    }
    else {
      id v29 = *(id *)(a5 + 8 * j + 32);
    }
    id v30 = v29;
    [v24 addVouchersObject:v29];
  }

void sub_1001BD114(void *a1, void *a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v7 initWithEntityName:v8];

  sub_1001BD678();
  uint64_t v10 = sub_100007578(&qword_100251578);
  uint64_t v11 = swift_allocObject(v10, 72LL, 7LL);
  __int128 v38 = xmmword_1001DE710;
  *(_OWORD *)(v11 + 16) = xmmword_1001DE710;
  *(void *)(v11 + 56) = type metadata accessor for ContainerMO();
  *(void *)(v11 + 64) = sub_1001BE0C0( &qword_100256BA8,  (uint64_t (*)(uint64_t))type metadata accessor for ContainerMO);
  *(void *)(v11 + 32) = a1;
  id v12 = a1;
  uint64_t v13 = (void *)NSPredicate.init(format:_:)(0x656E6961746E6F63LL, 0xEF4025203D3D2072LL, v11);
  [v9 setPredicate:v13];

  uint64_t v14 = sub_100007578(&qword_100256C28);
  uint64_t v15 = swift_allocObject(v14, 64LL, 7LL);
  *(_OWORD *)(v15 + 16) = v38;
  *(void *)(v15 + 56) = &type metadata for String;
  *(void *)(v15 + 32) = 0x444972656570LL;
  *(void *)(v15 + 40) = 0xE600000000000000LL;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  [v9 setPropertiesToFetch:isa];

  [v9 setFetchBatchSize:10];
  char v47 = 0;
  unint64_t v43 = &v47;
  uint64_t v44 = a3;
  id v45 = v12;
  uint64_t v46 = a2;
  uint64_t v17 = swift_allocObject(&unk_10023D938, 24LL, 7LL);
  *(void *)(v17 + 16) = a2;
  uint64_t v40 = sub_1001BD6EC;
  uint64_t v41 = v17;
  id v18 = a2;
  sub_1000DE3A8( v9,  (void (*)(void *, _BYTE *))sub_1001BD6B4,  (uint64_t)v42,  (void (*)(uint64_t))sub_1001BD71C,  (uint64_t)v39);
  swift_release(v17);
  if (!v3)
  {
    if (v47 == 1)
    {
      if (qword_100250EF0 != -1) {
        swift_once(&qword_100250EF0, sub_1001BB540);
      }
      uint64_t v19 = type metadata accessor for Logger(0LL);
      uint64_t v20 = sub_100006BAC(v19, (uint64_t)qword_100257DA0);
      unint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
      os_log_type_t v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "voucher cleanup: have to iterate again", v23, 2u);
        swift_slowDealloc(v23, -1LL, -1LL);
      }

      char v47 = 0;
      __chkstk_darwin(v24, v25);
      v37[2] = &v47;
      v37[3] = a3;
      v37[4] = v12;
      v37[5] = v18;
      uint64_t v26 = swift_allocObject(&unk_10023D960, 24LL, 7LL);
      *(void *)(v26 + 16) = v18;
      v36[2] = sub_1001BD76C;
      v36[3] = __chkstk_darwin(v26, v27);
      id v28 = v18;
      sub_1000DE3A8( v9,  (void (*)(void *, _BYTE *))sub_1001BD6B4,  (uint64_t)v37,  (void (*)(uint64_t))sub_1001BE1F8,  (uint64_t)v36);
      uint64_t v29 = swift_release(v26);
      if (v47 == 1)
      {
        id v30 = (os_log_s *)Logger.logObject.getter(v29);
        os_log_type_t v34 = static os_log_type_t.error.getter(v30, v31, v32, v33);
        if (os_log_type_enabled(v30, v34))
        {
          uint64_t v35 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v35 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  v34,  "voucher cleanup: Unexpectedly have to iterate again??",  v35,  2u);
          swift_slowDealloc(v35, -1LL, -1LL);
        }
      }
    }

    objc_msgSend(v18, "refreshAllObjects", v38);
  }
}

uint64_t sub_1001BD56C(uint64_t a1, void (*a2)(void *))
{
  v5[3] = sub_100007578(&qword_100257DC0);
  v5[4] = sub_1001BE128();
  v5[0] = a1;
  swift_bridgeObjectRetain(a1);
  a2(v5);
  return sub_100007600(v5);
}

uint64_t sub_1001BD5DC(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_1000084C4(a1, v9);
  uint64_t v11 = swift_allocObject(a3, 24LL, 7LL);
  *(void *)(v11 + 16) = a2;
  v14[2] = a4;
  v14[3] = v11;
  id v12 = a2;
  Sequence.forEach(_:)(a5, v14, v9, v10);
  return swift_release(v11);
}

unint64_t sub_1001BD678()
{
  unint64_t result = qword_100256B70;
  if (!qword_100256B70)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSPredicate);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100256B70);
  }

  return result;
}

uint64_t sub_1001BD6B4(void *a1)
{
  return sub_1001BD734(a1);
}

uint64_t sub_1001BD6C8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1001BD6EC(void *a1)
{
  return sub_1001BD5DC(a1, *(void **)(v1 + 16), (uint64_t)&unk_10023D9B0, (uint64_t)sub_1001BD79C, (uint64_t)sub_1001BE1D8);
}

uint64_t sub_1001BD71C(uint64_t a1)
{
  return sub_1001BD56C(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t sub_1001BD734(void *a1)
{
  uint64_t v3 = *(_BYTE **)(v1 + 16);
  uint64_t result = sub_1001BD980(a1, *(void ***)(v1 + 32), *(void **)(v1 + 40));
  if (!v2) {
    *uint64_t v3 = (result | *v3) & 1;
  }
  return result;
}

uint64_t sub_1001BD76C(void *a1)
{
  return sub_1001BD5DC(a1, *(void **)(v1 + 16), (uint64_t)&unk_10023D988, (uint64_t)sub_1001BD79C, (uint64_t)sub_1001BD7C4);
}

uint64_t sub_1001BD7A0(void *a1, uint64_t (*a2)(void))
{
  return a2(*a1);
}

uint64_t sub_1001BD7C4(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1001BD7E8(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v10 = 0LL;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }

    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v17 >= v8) {
      return swift_release(a1);
    }
    unint64_t v18 = *(void *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      int64_t v10 = v17 + 1;
      if (v17 + 1 >= v8) {
        return swift_release(a1);
      }
      unint64_t v18 = *(void *)(v4 + 8 * v10);
      if (!v18)
      {
        int64_t v10 = v17 + 2;
        if (v17 + 2 >= v8) {
          return swift_release(a1);
        }
        unint64_t v18 = *(void *)(v4 + 8 * v10);
        if (!v18)
        {
          int64_t v10 = v17 + 3;
          if (v17 + 3 >= v8) {
            return swift_release(a1);
          }
          unint64_t v18 = *(void *)(v4 + 8 * v10);
          if (!v18) {
            break;
          }
        }
      }
    }

uint64_t sub_1001BD980(void *a1, void **a2, void *a3)
{
  uint64_t v4 = v3;
  if (qword_100250EF0 != -1) {
    swift_once(&qword_100250EF0, sub_1001BB540);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_100006BAC(v8, (uint64_t)qword_100257DA0);
  id v10 = a1;
  uint64_t v65 = v9;
  unint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v64 = v3;
    unint64_t v66 = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v14 = (void *)swift_slowAlloc(32LL, -1LL);
    id v70 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    id v15 = [v10 peerID];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      unint64_t v19 = v18;
    }

    else
    {
      unint64_t v19 = 0xE300000000000000LL;
      uint64_t v17 = 7104878LL;
    }

    uint64_t v69 = sub_10017C4C4(v17, v19, (uint64_t *)&v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70, v13 + 4, v13 + 12);

    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "cleaning up vouchers for peer %{public}s", v13, 0xCu);
    swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);

    a2 = v66;
    uint64_t v4 = v64;
  }

  else
  {
  }

  id v70 = &_swiftEmptySetSingleton;
  uint64_t v69 = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v68 = &_swiftEmptyDictionarySingleton;
  id v20 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v21 = String._bridgeToObjectiveC()();
  id v22 = [v20 initWithEntityName:v21];

  sub_1001BD678();
  uint64_t v23 = sub_100007578(&qword_100251578);
  uint64_t v24 = swift_allocObject(v23, 72LL, 7LL);
  *(_OWORD *)(v24 + 16) = xmmword_1001DE710;
  *(void *)(v24 + 56) = type metadata accessor for PeerMO();
  *(void *)(v24 + 64) = sub_1001BE0C0( &qword_100257DB8,  (uint64_t (*)(uint64_t))type metadata accessor for PeerMO);
  *(void *)(v24 + 32) = v10;
  id v25 = v10;
  uint64_t v26 = (void *)NSPredicate.init(format:_:)(0xD000000000000011LL, 0x80000001001FBE10LL, v24);
  [v22 setPredicate:v26];

  uint64_t v27 = sub_100007578(&qword_100256C28);
  uint64_t v28 = swift_allocObject(v27, 96LL, 7LL);
  *(_OWORD *)(v28 + 16) = xmmword_1001DE420;
  *(void *)(v28 + 32) = 0x4972656863756F76LL;
  *(void *)(v28 + 40) = 0xEB000000006F666ELL;
  *(void *)(v28 + 88) = &type metadata for String;
  *(void *)(v28 + 56) = &type metadata for String;
  strcpy((char *)(v28 + 64), "voucherInfoSig");
  *(_BYTE *)(v28 + 79) = -18;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v28);
  [v22 setPropertiesToFetch:isa];

  id v30 = [v22 setFetchBatchSize:10];
  uint64_t v31 = (os_log_s *)&v64;
  __chkstk_darwin(v30, v32);
  v61[2] = a3;
  v61[3] = v25;
  v61[4] = a2;
  v61[5] = &v69;
  uint64_t v62 = (void **)&v68;
  uint64_t v63 = &v70;
  sub_1000DE684( v22,  (void (*)(void *, _BYTE *))sub_1001BE100,  (uint64_t)v61,  (void (*)(uint64_t))ResetReason.rawValue.getter,  0LL);
  if (v4)
  {

LABEL_29:
    swift_bridgeObjectRelease(v68);
    swift_bridgeObjectRelease(v69);
    swift_bridgeObjectRelease(v70);
    return v31 & 1;
  }

  uint64_t v33 = v69;
  unint64_t v66 = a2;
  if ((unint64_t)v69 >> 62)
  {
    if (v69 < 0) {
      uint64_t v39 = v69;
    }
    else {
      uint64_t v39 = v69 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain_n(v69, 2LL);
    id v40 = a3;
    uint64_t v34 = _CocoaArrayWrapper.endIndex.getter(v39);
    if (!v34) {
      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v34 = *(void *)((v69 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain_n(v69, 2LL);
    id v35 = a3;
    if (!v34) {
      goto LABEL_23;
    }
  }

  if (v34 < 1) {
    __break(1u);
  }
  for (uint64_t i = 0LL; i != v34; ++i)
  {
    if ((v33 & 0xC000000000000001LL) != 0) {
      id v37 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v33);
    }
    else {
      id v37 = *(id *)(v33 + 8 * i + 32);
    }
    __int128 v38 = v37;
    objc_msgSend(a3, "deleteObject:", v37, v64, v65);
  }

uint64_t sub_1001BE0C0(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = a2(255LL);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v4);
    atomic_store(result, a1);
  }

  return result;
}

id sub_1001BE100(void *a1, uint64_t a2)
{
  return sub_1001BB5B8( a1,  a2,  *(void **)(v2 + 16),  *(void **)(v2 + 24),  *(void **)(v2 + 32),  *(void **)(v2 + 40),  *(uint64_t **)(v2 + 48),  *(uint64_t **)(v2 + 56));
}

void sub_1001BE120(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

unint64_t sub_1001BE128()
{
  unint64_t result = qword_100257DC8;
  if (!qword_100257DC8)
  {
    uint64_t v1 = sub_1000076A4(&qword_100257DC0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100257DC8);
  }

  return result;
}

id sub_1001BE174(void *a1)
{
  uint64_t v3 = *(void **)(v1 + 16);
  id result = [a1 hasChanges];
  return result;
}

uint64_t sub_1001BE1C4(void *a1, uint64_t (*a2)(void))
{
  return sub_1001BD7A0(a1, a2);
}

uint64_t sub_1001BE1D8(void *a1)
{
  return sub_1001BD7C4(a1);
}

uint64_t sub_1001BE1F8(uint64_t a1)
{
  return sub_1001BD71C(a1);
}

BOOL sub_1001BE210(void **a1, void **a2)
{
  return _sSo15TPPolicyVersionC18TrustedPeersHelperE1loiySbAB_ABtFZ_0(*a1, *a2);
}

BOOL _sSo15TPPolicyVersionC18TrustedPeersHelperE1loiySbAB_ABtFZ_0(void *a1, void *a2)
{
  id v4 = [a1 versionNumber];
  if (v4 == [a2 versionNumber])
  {
    id v5 = [a1 policyHash];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    uint64_t v8 = v7;

    id v9 = [a2 policyHash];
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    uint64_t v12 = v11;

    if (v6 == v10 && v8 == v12)
    {
      swift_bridgeObjectRelease_n(v8, 2LL);
      return 0LL;
    }

    else
    {
      char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v8, v10, v12, 1LL);
      swift_bridgeObjectRelease(v8);
      swift_bridgeObjectRelease(v12);
      return v14 & 1;
    }
  }

  else
  {
    id v16 = [a1 versionNumber];
    return v16 < [a2 versionNumber];
  }

unint64_t sub_1001BE34C()
{
  unint64_t result = qword_100257DD0;
  if (!qword_100257DD0)
  {
    unint64_t v1 = sub_100044A38();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100257DD0);
  }

  return result;
}

id VoucherMO.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = [objc_allocWithZone(v2) initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

id BottleMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for BottleMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for BottleMO()
{
  return objc_opt_self(&OBJC_CLASS___BottleMO);
}

id BottleMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BottleMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static BottleMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

void *sub_1001BE54C()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_1001BE558@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for BottleMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id ContainerMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for ContainerMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for ContainerMO()
{
  return objc_opt_self(&OBJC_CLASS___ContainerMO);
}

id ContainerMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContainerMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static ContainerMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BE704@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ContainerMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id CustodianRecoveryKeyMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for CustodianRecoveryKeyMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for CustodianRecoveryKeyMO()
{
  return objc_opt_self(&OBJC_CLASS___CustodianRecoveryKeyMO);
}

id CustodianRecoveryKeyMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CustodianRecoveryKeyMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static CustodianRecoveryKeyMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BE8B0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CustodianRecoveryKeyMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id EscrowClientMetadataMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for EscrowClientMetadataMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for EscrowClientMetadataMO()
{
  return objc_opt_self(&OBJC_CLASS___EscrowClientMetadataMO);
}

id EscrowClientMetadataMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EscrowClientMetadataMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static EscrowClientMetadataMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BEA5C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for EscrowClientMetadataMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id EscrowMetadataMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for EscrowMetadataMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for EscrowMetadataMO()
{
  return objc_opt_self(&OBJC_CLASS___EscrowMetadataMO);
}

id EscrowMetadataMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EscrowMetadataMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static EscrowMetadataMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BEC10@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for EscrowMetadataMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id EscrowRecordMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for EscrowRecordMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for EscrowRecordMO()
{
  return objc_opt_self(&OBJC_CLASS___EscrowRecordMO);
}

id EscrowRecordMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EscrowRecordMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static EscrowRecordMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BEDC0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for EscrowRecordMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id MachineMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for MachineMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for MachineMO()
{
  return objc_opt_self(&OBJC_CLASS___MachineMO);
}

id MachineMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MachineMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static MachineMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BEF68@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for MachineMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id PasscodeGen.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PasscodeGen();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for PasscodeGen()
{
  return objc_opt_self(&OBJC_CLASS___PasscodeGen);
}

id PasscodeGen.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PasscodeGen();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static PasscodeGen.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BF118@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PasscodeGen();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id PeerMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PeerMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for PeerMO()
{
  return objc_opt_self(&OBJC_CLASS___PeerMO);
}

id PeerMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeerMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static PeerMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BF2B8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PeerMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id PolicyMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PolicyMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for PolicyMO()
{
  return objc_opt_self(&OBJC_CLASS___PolicyMO);
}

id PolicyMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PolicyMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static PolicyMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BF45C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PolicyMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id RecoveryVoucherMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for RecoveryVoucherMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for RecoveryVoucherMO()
{
  return objc_opt_self(&OBJC_CLASS___RecoveryVoucherMO);
}

id RecoveryVoucherMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RecoveryVoucherMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static RecoveryVoucherMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BF610@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for RecoveryVoucherMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

id VoucherMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for VoucherMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for VoucherMO()
{
  return objc_opt_self(&OBJC_CLASS___VoucherMO);
}

id VoucherMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoucherMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static VoucherMO.fetchRequest()()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1001BF7B8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for VoucherMO();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

LABEL_8:
    uint64_t v13 = 0;
LABEL_13:

    goto LABEL_14;
  }

  uint64_t v13 = 0;
LABEL_14:

  return v13;
}

  if (a8)
  {
    NSString v21 = v21;
    uint64_t v32 = 0LL;
    *a8 = v21;
  }

  else
  {
    uint64_t v32 = 0LL;
  }

void sub_1001BFFB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1001BFFD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1001BFFE0(uint64_t a1)
{
}

void sub_1001BFFE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CKRetryAfter"]);

  id v5 = obj;
  if (obj)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (!*(void *)(v6 + 40))
    {
LABEL_5:
      objc_storeStrong((id *)(v6 + 40), obj);
      id v5 = obj;
      goto LABEL_6;
    }

    [obj doubleValue];
    double v8 = v7;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) doubleValue];
    id v5 = obj;
    if (v8 < v9)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
      goto LABEL_5;
    }
  }

uint64_t sub_1001C30BC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t Data = PBReaderReadData(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v14 = 24LL;
        goto LABEL_44;
      case 2u:
        id v16 = objc_alloc_init(&OBJC_CLASS___OTEscrowRecordMetadataClientMetadata);
        objc_storeStrong((id *)(a1 + 56), v16);
        unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
        unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
        goto LABEL_47;
      case 3u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 96) |= 2u;
        while (2)
        {
          unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1LL || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v21 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v19 |= (unint64_t)(v21 & 0x7F) << v17;
            if (v21 < 0)
            {
              v17 += 7;
              BOOL v9 = v18++ >= 9;
              if (v9)
              {
                uint64_t v19 = 0LL;
                goto LABEL_51;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v19 = 0LL;
        }
LABEL_51:
        uint64_t v33 = 16LL;
        goto LABEL_56;
      case 4u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v14 = 32LL;
        goto LABEL_44;
      case 5u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 96) |= 1u;
        while (2)
        {
          unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v25 == -1LL || v25 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v26 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
            v19 |= (unint64_t)(v26 & 0x7F) << v23;
            if (v26 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                uint64_t v19 = 0LL;
                goto LABEL_55;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v19 = 0LL;
        }
LABEL_55:
        uint64_t v33 = 8LL;
LABEL_56:
        *(void *)(a1 + v33) = v19;
        goto LABEL_57;
      case 6u:
        uint64_t v27 = PBReaderReadData(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v27);
        uint64_t v14 = 64LL;
        goto LABEL_44;
      case 7u:
        uint64_t v28 = PBReaderReadData(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v28);
        uint64_t v14 = 80LL;
        goto LABEL_44;
      case 8u:
        uint64_t v29 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v29);
        uint64_t v14 = 40LL;
        goto LABEL_44;
      case 9u:
        uint64_t v30 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v30);
        uint64_t v14 = 88LL;
        goto LABEL_44;
      case 0xAu:
        uint64_t v31 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v31);
        uint64_t v14 = 48LL;
LABEL_44:
        uint64_t v32 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        goto LABEL_57;
      case 0xBu:
        id v16 = objc_alloc_init(&OBJC_CLASS___OTEscrowRecordMetadataPasscodeGeneration);
        objc_storeStrong((id *)(a1 + 72), v16);
        unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
        unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
        if (PBReaderPlaceMark(a2, &v34)
          && (OTEscrowRecordMetadataPasscodeGenerationReadFrom(v16, a2) & 1) != 0)
        {
LABEL_47:
          PBReaderRecallMark(a2, &v34);

LABEL_57:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

LABEL_121:
  LOBYTE(v30) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v30;
}

BOOL sub_1001C67A0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0LL;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0LL;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0LL;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v12 = v6 >> 3;
      if ((_DWORD)v12 == 2)
      {
        uint64_t Data = PBReaderReadData(a2);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v15 = 8LL;
        goto LABEL_23;
      }

      if ((_DWORD)v12 == 1)
      {
        uint64_t v13 = PBReaderReadData(a2);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
        uint64_t v15 = 16LL;
LABEL_23:
        unsigned int v18 = *(void **)(a1 + v15);
        *(void *)(a1 + v15) = v14;

        goto LABEL_25;
      }

      if ((PBReaderSkipValueWithTag(a2) & 1) == 0) {
        return 0LL;
      }
LABEL_25:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }

    uint64_t v16 = PBReaderReadData(a2);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v16);
    uint64_t v15 = 24LL;
    goto LABEL_23;
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_1001C6A24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_1001C6A3C(uint64_t a1)
{
  unint64_t v6 = 0LL;
  if (!qword_100268FB8)
  {
    __int128 v7 = off_10023DBE8;
    uint64_t v8 = 0LL;
    qword_100268FB8 = _sl_dlopen(&v7, &v6);
  }

  if (!qword_100268FB8)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    char v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *ManagedConfigurationLibrary(void)"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"OTManagedConfigurationAdapter.m",  33,  @"%s",  v6);

    goto LABEL_10;
  }

  if (v6) {
    free(v6);
  }
  Class result = objc_getClass("MCProfileConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getMCProfileConnectionClass(void)_block_invoke"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v5,  @"OTManagedConfigurationAdapter.m",  34,  @"Unable to find class %s",  "MCProfileConnection");

LABEL_10:
    __break(1u);
  }

  qword_100268FB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

id TrustedPeersHelperSetupProtocol(void *a1)
{
  id v1 = a1;
  if (qword_100268FC8 != -1) {
    dispatch_once(&qword_100268FC8, &stru_10023DC00);
  }
  v35[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v35[1] = objc_opt_class(&OBJC_CLASS___CKKSKeychainBackedKeySet);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  v34[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v34[1] = objc_opt_class(&OBJC_CLASS___CKKSTLKShare);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
  char v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  v33[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v33[1] = objc_opt_class(&OBJC_CLASS___CKRecord);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
  char v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  unint64_t v6 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___TrustedPeersHelperPeerState));
  char v23 = (void *)objc_claimAutoreleasedReturnValue(v6);
  __int128 v7 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___TrustedPeersHelperCustodianRecoveryKey));
  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v8 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___TrustedPeersHelperHealthCheckResult));
  char v21 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v32[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v32[1] = objc_opt_class(&OBJC_CLASS___TrustedPeersHelperPeer);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

  v31[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v31[1] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v31[2] = objc_opt_class(&OBJC_CLASS___NSString);
  v31[3] = objc_opt_class(&OBJC_CLASS___TPPBPeerStableInfoSetting);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 4LL));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

  v30[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v30[1] = objc_opt_class(&OBJC_CLASS___CuttlefishPCSServiceIdentifier);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

  v29[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v29[1] = objc_opt_class(&OBJC_CLASS___CuttlefishPCSIdentity);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v12));

  v28[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v28[1] = objc_opt_class(&OBJC_CLASS___CuttlefishCurrentItemSpecifier);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
  char v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));

  v27[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v27[1] = objc_opt_class(&OBJC_CLASS___CuttlefishCurrentItem);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));

  [v1 setClasses:qword_100268FC0 forSelector:"honorIDMSListChangesForSpecificUser:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"dumpWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"octagonPeerIDGivenBottleIDWithSpecificUser:bottleID:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"trustedDeviceNamesByPeerIDWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"departByDistrustingSelfWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"distrustPeerIDsWithSpecificUser:peerIDs:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"dropPeerIDsWithSpecificUser:peerIDs:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"trustStatusWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"resetWithSpecificUser:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:is Guitarfish:accountType:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"localResetWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"setAllowedMachineIDsWithSpecificUser:allowedMachineIDs:userInitiatedRemovals:evictedRemovals:unknownReasonRemovals:h onorIDMSListChanges:version:flowID:deviceSessionID:canSendMetrics:altDSID:trustedDeviceHash:deletedDeviceHash:truste dDevicesUpdateTimestamp:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"markTrustedDeviceListFetchFailed:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"fetchAllowedMachineIDsWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"fetchEgoEpochWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"prepareWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersion: policySecrets:syncUserControllableViews:secureElementIdentity:setting:signingPrivKeyPersistentRef:encPrivKeyPersistentRef:reply:" argumentIndex:6 ofReply:1];
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  [v1 setClasses:qword_100268FC0 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:3 ofReply:1];
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  [v1 setClasses:qword_100268FC0 forSelector:"preflightVouchWithBottleWithSpecificUser:bottleID:reply:" argumentIndex:3 ofReply:1];
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  [v1 setClasses:qword_100268FC0 forSelector:"preflightVouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:reply:" argumentIndex:2 ofReply:1];
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  [v1 setClasses:qword_100268FC0 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:3 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"preflightPreapprovedJoinWithSpecificUser:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:3 ofReply:1];
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  [v1 setClasses:qword_100268FC0 forSelector:"setPreapprovedKeysWithSpecificUser:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  [v1 setClasses:qword_100268FC0 forSelector:"fetchViableBottlesWithSpecificUser:source:flowID:deviceSessionID:reply:" argumentIndex:2 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"fetchViableEscrowRecordsWithSpecificUser:source:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"fetchEscrowContentsWithSpecificUser:reply:" argumentIndex:3 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"fetchPolicyDocumentsWithSpecificUser:versions:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"fetchCurrentPolicyWithSpecificUser:modelIDOverride:isInheritedAccount:reply:" argumentIndex:2 ofReply:1];
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  [v1 setClasses:qword_100268FC0 forSelector:"setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:2 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"removeCustodianRecoveryKeyWithSpecificUser:uuid:reply:" argumentIndex:0 ofReply:1];
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", qword_100268FC0);
  [v1 setClasses:qword_100268FC0 forSelector:"getSupportAppInfoWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"resetAccountCDPContentsWithSpecificUser:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"removeEscrowCacheWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"fetchAccountSettingsWithSpecificUser:forceFetch:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"isRecoveryKeySet:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:qword_100268FC0 forSelector:"testSemaphoreWithSpecificUser:arg:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v22 forSelector:"fetchAccountSettingsWithSpecificUser:forceFetch:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v26 forSelector:"fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v25 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:0];
  [v1 setClasses:v4 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:2 ofReply:0];
  [v1 setClasses:v26 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:v25 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:3 ofReply:0];
  [v1 setClasses:v4 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:4 ofReply:0];
  [v1 setClasses:v26 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:v25 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:0];
  [v1 setClasses:v4 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:2 ofReply:0];
  [v1 setClasses:v26 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:v25 forSelector:"vouchWithSpecificUser:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:ckksKeys:flowID:deviceSessionID :canSendMetrics:reply:" argumentIndex:6 ofReply:0];
  [v1 setClasses:v4 forSelector:"vouchWithBottleWithSpecificUser:bottleID:entropy:bottleSalt:tlkShares:reply:" argumentIndex:4 ofReply:0];
  [v1 setClasses:v4 forSelector:"vouchWithBottleWithSpecificUser:bottleID:entropy:bottleSalt:tlkShares:reply:" argumentIndex:2 ofReply:1];
  [v1 setClasses:v25 forSelector:"setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:" argumentIndex:3 ofReply:0];
  [v1 setClasses:v26 forSelector:"setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v25 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:3 ofReply:0];
  [v1 setClasses:v26 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v4 forSelector:"vouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:tlkShares:reply:" argumentIndex:3 ofReply:0];
  [v1 setClasses:v4 forSelector:"vouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:tlkShares:reply:" argumentIndex:2 ofReply:1];
  [v1 setClasses:v4 forSelector:"vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:" argumentIndex:2 ofReply:0];
  [v1 setClasses:v4 forSelector:"vouchWithRerollWithSpecificUser:oldPeerID:tlkShares:reply:" argumentIndex:2 ofReply:0];
  [v1 setClasses:v26 forSelector:"prepareInheritancePeerWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion :policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:signingPrivKeyPersistentRef:encPrivKeyP ersistentRef:crk:reply:" argumentIndex:7 ofReply:1];
  [v1 setClasses:v4 forSelector:"vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:" argumentIndex:2 ofReply:1];
  [v1 setClasses:v4 forSelector:"recoverTLKSharesForInheritorWithSpecificUser:crk:tlkShares:reply:" argumentIndex:2 ofReply:0];
  [v1 setClasses:v4 forSelector:"recoverTLKSharesForInheritorWithSpecificUser:crk:tlkShares:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v24 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:v24 forSelector:"preflightVouchWithCustodianRecoveryKeyWithSpecificUser:crk:reply:" argumentIndex:1 ofReply:0];
  [v1 setClasses:v24 forSelector:"vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:" argumentIndex:1 ofReply:0];
  [v1 setClasses:v24 forSelector:"findCustodianRecoveryKeyWithSpecificUser:uuid:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v21 forSelector:"requestHealthCheckWithSpecificUser:requiresEscrowCheck:repair:knownFederations:flowID:deviceSessionID:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v23 forSelector:"updateWithSpecificUser:forceRefetch:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllab leViews:secureElementIdentity:walrusSetting:webAccess:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v23 forSelector:"fetchTrustStateWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v20 forSelector:"fetchTrustStateWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:v25 forSelector:"updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:" argumentIndex:1 ofReply:0];
  [v1 setClasses:v4 forSelector:"updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:" argumentIndex:2 ofReply:0];
  [v1 setClasses:v26 forSelector:"updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v17 forSelector:"fetchCurrentItemWithSpecificUser:items:reply:" argumentIndex:1 ofReply:0];
  [v1 setClasses:v16 forSelector:"fetchCurrentItemWithSpecificUser:items:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v26 forSelector:"fetchCurrentItemWithSpecificUser:items:reply:" argumentIndex:1 ofReply:1];
  [v1 setClasses:v19 forSelector:"fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:" argumentIndex:1 ofReply:0];
  [v1 setClasses:v18 forSelector:"fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:" argumentIndex:0 ofReply:1];
  [v1 setClasses:v26 forSelector:"fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:" argumentIndex:1 ofReply:1];

  return v1;
}

void sub_1001CA01C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, __int128 buf)
{
  if (a2 == 1)
  {
    id v33 = objc_begin_catch(a1);
    uint64_t v34 = secLogObjForScope("SecError");
    unint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "TrustedPeersHelperSetupProtocol failed, continuing, but you might crash later: %@",  (uint8_t *)&buf,  0xCu);
    }

    objc_exception_throw(v33);
    __break(1u);
    JUMPOUT(0x1001CA0CCLL);
  }

  _Unwind_Resume(a1);
}

void sub_1001CA0E8(id a1)
{
  uint64_t v1 = CKAcceptableValueClasses(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v2));
  char v4 = (void *)qword_100268FC0;
  qword_100268FC0 = v3;

  unsigned int v5 = (void *)qword_100268FC0;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SecXPCHelper safeErrorClasses](&OBJC_CLASS___SecXPCHelper, "safeErrorClasses"));
  [v5 unionSet:v6];
}

LABEL_48:
    goto LABEL_49;
  }

  uint64_t v13 = 0;
LABEL_38:

  return v13;
}

id SecCKKSHostOSVersion()
{
  *(void *)&__int128 v0 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[14] = v0;
  __int128 v13 = v0;
  v12[12] = v0;
  v12[13] = v0;
  v12[10] = v0;
  v12[11] = v0;
  v12[8] = v0;
  v12[9] = v0;
  v12[6] = v0;
  v12[7] = v0;
  v12[4] = v0;
  v12[5] = v0;
  v12[2] = v0;
  v12[3] = v0;
  v12[0] = v0;
  v12[1] = v0;
  size_t v9 = 256LL;
  int v1 = sysctlbyname("kern.osrelease", v12, &v9, 0LL, 0LL);
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[14] = v2;
  __int128 v11 = v2;
  v10[12] = v2;
  v10[13] = v2;
  v10[10] = v2;
  v10[11] = v2;
  v10[8] = v2;
  v10[9] = v2;
  v10[6] = v2;
  v10[7] = v2;
  v10[4] = v2;
  v10[5] = v2;
  v10[2] = v2;
  v10[3] = v2;
  v10[0] = v2;
  v10[1] = v2;
  size_t v8 = 256LL;
  if (sysctlbyname("kern.osversion", v10, &v8, 0LL, 0LL) | v1
    || (HIBYTE(v13) = 0,
        HIBYTE(v11) = 0,
        (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s (%s)",  v12,  v10))) == 0LL))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    char v4 = (void *)objc_claimAutoreleasedReturnValue([v3 operatingSystemVersionString]);

    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByReplacingOccurrencesOfString:@"Version" withString:&stru_10023F258]);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  @"tv",  v5));

  return v6;
}

uint64_t sub_1001CD850(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      uint64_t Data = PBReaderReadData(a2);
      uint64_t v18 = objc_claimAutoreleasedReturnValue(Data);
      uint64_t v19 = *(void **)(a1 + 8);
      *(void *)(a1 + _Block_object_dispose(va, 8) = v18;
    }

    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0LL;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1LL || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }

      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
    }

    else
    {
      uint64_t result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_1001CF4C0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v15 = 0LL;
  char v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_1001CF5F8;
  uint64_t v19 = sub_1001CF608;
  id v5 = &_os_log_disabled;
  id v20 = &_os_log_disabled;
  if (qword_100268FD8 != -1) {
    dispatch_once(&qword_100268FD8, &stru_10023DC60);
  }
  unint64_t v6 = (dispatch_queue_s *)qword_100268FD0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001CF610;
  block[3] = &unk_10023DC88;
  id v12 = v4;
  id v13 = v3;
  uint64_t v14 = &v15;
  id v7 = v3;
  id v8 = v4;
  dispatch_sync(v6, block);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t sub_1001CF5F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1001CF608(uint64_t a1)
{
}

void sub_1001CF610(void *a1)
{
  if (!qword_100268FE0)
  {
    uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v3 = (void *)qword_100268FE0;
    qword_100268FE0 = v2;
  }

  id v4 = (void *)a1[5];
  if (a1[4]) {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@"-%@", a1[4]]);
  }
  else {
    id v5 = v4;
  }
  id v13 = v5;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([(id)qword_100268FE0 objectForKeyedSubscript:v5]);
  uint64_t v7 = *(void *)(a1[6] + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(a1[6] + 8LL) + 40LL))
  {
    id v9 = v13;
    os_log_t v10 = os_log_create("com.apple.security.ckks", (const char *)[v9 cStringUsingEncoding:4]);
    uint64_t v11 = *(void *)(a1[6] + 8LL);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    [(id)qword_100268FE0 setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:v9];
  }
}

void sub_1001CF718(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("ckks-logger", v4);
  id v3 = (void *)qword_100268FD0;
  qword_100268FD0 = (uint64_t)v2;
}

uint64_t sub_1001D0D7C(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0LL;
        *(_BYTE *)(a1 + 104) |= 2u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1LL || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_64;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0LL;
            goto LABEL_66;
          }
        }

        *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_64:
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0LL;
        }
LABEL_66:
        uint64_t v44 = 16LL;
        goto LABEL_83;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v14 = 0LL;
        *(_BYTE *)(a1 + 104) |= 4u;
        while (2)
        {
          unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1LL || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v21 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v14 |= (unint64_t)(v21 & 0x7F) << v18;
            if (v21 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                uint64_t v14 = 0LL;
                goto LABEL_70;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0LL;
        }
LABEL_70:
        uint64_t v44 = 24LL;
        goto LABEL_83;
      case 3u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v14 = 0LL;
        *(_BYTE *)(a1 + 104) |= 8u;
        while (2)
        {
          unint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v24 == -1LL || v24 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v25 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
            v14 |= (unint64_t)(v25 & 0x7F) << v22;
            if (v25 < 0)
            {
              v22 += 7;
              BOOL v9 = v23++ >= 9;
              if (v9)
              {
                uint64_t v14 = 0LL;
                goto LABEL_74;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0LL;
        }
LABEL_74:
        uint64_t v44 = 32LL;
        goto LABEL_83;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v14 = 0LL;
        *(_BYTE *)(a1 + 104) |= 0x10u;
        while (2)
        {
          unint64_t v28 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v28 == -1LL || v28 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v29 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v28);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v28 + 1;
            v14 |= (unint64_t)(v29 & 0x7F) << v26;
            if (v29 < 0)
            {
              v26 += 7;
              BOOL v9 = v27++ >= 9;
              if (v9)
              {
                uint64_t v14 = 0LL;
                goto LABEL_78;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0LL;
        }
LABEL_78:
        uint64_t v44 = 40LL;
        goto LABEL_83;
      case 5u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v32 = 48LL;
        goto LABEL_55;
      case 6u:
        uint64_t v33 = PBReaderReadString(a2);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(v33);
        uint64_t v32 = 56LL;
        goto LABEL_55;
      case 7u:
        uint64_t v34 = PBReaderReadString(a2);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(v34);
        uint64_t v32 = 64LL;
        goto LABEL_55;
      case 8u:
        uint64_t v35 = PBReaderReadString(a2);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(v35);
        uint64_t v32 = 72LL;
        goto LABEL_55;
      case 9u:
        uint64_t v36 = PBReaderReadString(a2);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(v36);
        uint64_t v32 = 80LL;
        goto LABEL_55;
      case 0xAu:
        uint64_t v37 = PBReaderReadString(a2);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(v37);
        uint64_t v32 = 88LL;
        goto LABEL_55;
      case 0xBu:
        uint64_t v38 = PBReaderReadString(a2);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(v38);
        uint64_t v32 = 96LL;
LABEL_55:
        uint64_t v39 = *(void **)(a1 + v32);
        *(void *)(a1 + v32) = v31;

        continue;
      case 0xCu:
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v14 = 0LL;
        *(_BYTE *)(a1 + 104) |= 1u;
        break;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        continue;
    }

    while (1)
    {
      unint64_t v42 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v42 == -1LL || v42 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v43 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v42);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v42 + 1;
      v14 |= (unint64_t)(v43 & 0x7F) << v40;
      if ((v43 & 0x80) == 0) {
        goto LABEL_80;
      }
      v40 += 7;
      BOOL v9 = v41++ >= 9;
      if (v9)
      {
        uint64_t v14 = 0LL;
        goto LABEL_82;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_80:
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v14 = 0LL;
    }
LABEL_82:
    uint64_t v44 = 8LL;
LABEL_83:
    *(void *)(a1 + v44) = v14;
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

CFURLRef SecCopyURLForFileInUserScopedKeychainDirectory(uint64_t a1)
{
  dispatch_queue_t v2 = (const __CFURL *)SecCopyBaseFilesURL(1LL);
  if (a1) {
    Copy = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@/%@", @"Library/Keychains", a1);
  }
  else {
    Copy = CFStringCreateCopy(kCFAllocatorDefault, @"Library/Keychains");
  }
  char v4 = Copy;
  if (v2 && Copy)
  {
    CFURLRef v5 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v2, Copy, a1 == 0);
    CFRelease(v4);
LABEL_10:
    CFRelease(v2);
    return v5;
  }

  if (Copy) {
    CFRelease(Copy);
  }
  CFURLRef v5 = 0LL;
  if (v2) {
    goto LABEL_10;
  }
  return v5;
}

uint64_t _s18TrustedPeersHelper8ViewKeysV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0()
{
  return UnknownStorage.init()();
}

id objc_msgSend_CKPropertiesDescription(void *a1, const char *a2, ...)
{
  return _[a1 CKPropertiesDescription];
}

id objc_msgSend_PCSPublicKey(void *a1, const char *a2, ...)
{
  return _[a1 PCSPublicKey];
}

id objc_msgSend_PCSServiceID(void *a1, const char *a2, ...)
{
  return _[a1 PCSServiceID];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__isCKServerInternalError(void *a1, const char *a2, ...)
{
  return _[a1 _isCKServerInternalError];
}

id objc_msgSend__isRetryableNSURLError(void *a1, const char *a2, ...)
{
  return _[a1 _isRetryableNSURLError];
}

id objc_msgSend__newZeroingDataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newZeroingDataWithBytes:length:");
}

id objc_msgSend_aessivkey(void *a1, const char *a2, ...)
{
  return _[a1 aessivkey];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allSelves(void *a1, const char *a2, ...)
{
  return _[a1 allSelves];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return _[a1 altDSID];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appleAccountID(void *a1, const char *a2, ...)
{
  return _[a1 appleAccountID];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticationCode(void *a1, const char *a2, ...)
{
  return _[a1 authenticationCode];
}

id objc_msgSend_base64EncodedDataWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedDataWithOptions:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_ciphertext(void *a1, const char *a2, ...)
{
  return _[a1 ciphertext];
}

id objc_msgSend_classA(void *a1, const char *a2, ...)
{
  return _[a1 classA];
}

id objc_msgSend_classC(void *a1, const char *a2, ...)
{
  return _[a1 classC];
}

id objc_msgSend_cloudkitContainerName(void *a1, const char *a2, ...)
{
  return _[a1 cloudkitContainerName];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectableEscrowRecords(void *a1, const char *a2, ...)
{
  return _[a1 collectableEscrowRecords];
}

id objc_msgSend_collectableTlkShares(void *a1, const char *a2, ...)
{
  return _[a1 collectableTlkShares];
}

id objc_msgSend_collectedEscrowRecords(void *a1, const char *a2, ...)
{
  return _[a1 collectedEscrowRecords];
}

id objc_msgSend_collectedTlkShares(void *a1, const char *a2, ...)
{
  return _[a1 collectedTlkShares];
}

id objc_msgSend_containerIDForContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerIDForContainerIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createSecKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSecKey:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return _[a1 currentPersona];
}

id objc_msgSend_currentSelf(void *a1, const char *a2, ...)
{
  return _[a1 currentSelf];
}

id objc_msgSend_currentThreadPersonaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 currentThreadPersonaUniqueString];
}

id objc_msgSend_curve(void *a1, const char *a2, ...)
{
  return _[a1 curve];
}

id objc_msgSend_cuttlefishRetryAfter(void *a1, const char *a2, ...)
{
  return _[a1 cuttlefishRetryAfter];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataForSigning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForSigning:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeBytesForKey_returnedLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBytesForKey:returnedLength:");
}

id objc_msgSend_decodeInt32ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt32ForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decrypt_withKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decrypt:withKey:error:");
}

id objc_msgSend_decryptData_authenticatedData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decryptData:authenticatedData:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doSIV_nonce_text_buffer_bufferLength_authenticatedData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_egoPeerID(void *a1, const char *a2, ...)
{
  return _[a1 egoPeerID];
}

id objc_msgSend_egoPeerMachineID(void *a1, const char *a2, ...)
{
  return _[a1 egoPeerMachineID];
}

id objc_msgSend_egoStatus(void *a1, const char *a2, ...)
{
  return _[a1 egoStatus];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeInt32_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt32:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeSubjectPublicKeyInfo(void *a1, const char *a2, ...)
{
  return _[a1 encodeSubjectPublicKeyInfo];
}

id objc_msgSend_encodeWithCoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeWithCoder:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _[a1 encodedData];
}

id objc_msgSend_encrypt_withKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encrypt:withKey:error:");
}

id objc_msgSend_encryptData_authenticatedData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptData:authenticatedData:error:");
}

id objc_msgSend_encryptionKey(void *a1, const char *a2, ...)
{
  return _[a1 encryptionKey];
}

id objc_msgSend_encryptionSPKI(void *a1, const char *a2, ...)
{
  return _[a1 encryptionSPKI];
}

id objc_msgSend_ensureKeyLoadedFromKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensureKeyLoadedFromKeychain:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_epoch(void *a1, const char *a2, ...)
{
  return _[a1 epoch];
}

id objc_msgSend_errorWithDomain_code_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:description:");
}

id objc_msgSend_errorWithDomain_code_description_underlying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:description:underlying:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_escrowRecordGarbageCollectionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 escrowRecordGarbageCollectionEnabled];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_fetchKeyMaterialItemFromKeychain_resave_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchKeyMaterialItemFromKeychain:resave:error:");
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return _[a1 finishDecoding];
}

id objc_msgSend_generateAndRestorePersonaContextWithPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAndRestorePersonaContextWithPersonaUniqueString:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_identityIsPreapproved(void *a1, const char *a2, ...)
{
  return _[a1 identityIsPreapproved];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_init_sender_receiver_curve_version_epoch_poisoned_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:sender:receiver:curve:version:epoch:poisoned:zoneID:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithAESKey_wrappedAESKey_uuid_parentKeyUUID_keyclass_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:");
}

id objc_msgSend_initWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAltDSID:");
}

id objc_msgSend_initWithBase64EncodedData_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedData:options:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBytes_len_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:len:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCiphertext_authenticationCode_initializationVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCiphertext:authenticationCode:initializationVector:");
}

id objc_msgSend_initWithCloudkitContainerName_octagonContextID_appleAccountID_altDSID_isPrimaryPersona_personaUniqueString_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:");
}

id objc_msgSend_initWithCoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCoder:");
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerID:options:");
}

id objc_msgSend_initWithCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCurve:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_signature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:signature:");
}

id objc_msgSend_initWithKeySpecifier_digestOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeySpecifier:digestOperation:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithSecKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSecKey:");
}

id objc_msgSend_initWithSecureElementIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSecureElementIdentity:");
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneName:ownerName:");
}

id objc_msgSend_initializationVector(void *a1, const char *a2, ...)
{
  return _[a1 initializationVector];
}

id objc_msgSend_isCloudKeychainSyncAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isCloudKeychainSyncAllowed];
}

id objc_msgSend_isCuttlefishError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCuttlefishError:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExcluded(void *a1, const char *a2, ...)
{
  return _[a1 isExcluded];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return _[a1 isLocked];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isPrimaryAccount(void *a1, const char *a2, ...)
{
  return _[a1 isPrimaryAccount];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_itemPtr(void *a1, const char *a2, ...)
{
  return _[a1 itemPtr];
}

id objc_msgSend_itemPtrName(void *a1, const char *a2, ...)
{
  return _[a1 itemPtrName];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_key_wrappedByKey_uuid_parentKeyUUID_keyclass_zoneID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "key:wrappedByKey:uuid:parentKeyUUID:keyclass:zoneID:error:");
}

id objc_msgSend_keyData(void *a1, const char *a2, ...)
{
  return _[a1 keyData];
}

id objc_msgSend_keyType(void *a1, const char *a2, ...)
{
  return _[a1 keyType];
}

id objc_msgSend_keyWithSubjectPublicKeyInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWithSubjectPublicKeyInfo:");
}

id objc_msgSend_keyWrappedBySelf_uuid_keyclass_zoneID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWrappedBySelf:uuid:keyclass:zoneID:error:");
}

id objc_msgSend_keyclass(void *a1, const char *a2, ...)
{
  return _[a1 keyclass];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return _[a1 kind];
}

id objc_msgSend_leaveTrust(void *a1, const char *a2, ...)
{
  return _[a1 leaveTrust];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadFromProtobuf_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromProtobuf:error:");
}

id objc_msgSend_loadKeyMaterialFromKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadKeyMaterialFromKeychain:");
}

id objc_msgSend_memberChanges(void *a1, const char *a2, ...)
{
  return _[a1 memberChanges];
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_moveRequest(void *a1, const char *a2, ...)
{
  return _[a1 moveRequest];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_newUpload(void *a1, const char *a2, ...)
{
  return _[a1 newUpload];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_octagonContextID(void *a1, const char *a2, ...)
{
  return _[a1 octagonContextID];
}

id objc_msgSend_operatingSystemVersionString(void *a1, const char *a2, ...)
{
  return _[a1 operatingSystemVersionString];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return _[a1 osVersion];
}

id objc_msgSend_parentKeyUUID(void *a1, const char *a2, ...)
{
  return _[a1 parentKeyUUID];
}

id objc_msgSend_peerCountsByMachineID(void *a1, const char *a2, ...)
{
  return _[a1 peerCountsByMachineID];
}

id objc_msgSend_peerID(void *a1, const char *a2, ...)
{
  return _[a1 peerID];
}

id objc_msgSend_peerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 peerIdentifier];
}

id objc_msgSend_peerStatus(void *a1, const char *a2, ...)
{
  return _[a1 peerStatus];
}

id objc_msgSend_peersCleanedup(void *a1, const char *a2, ...)
{
  return _[a1 peersCleanedup];
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 personaUniqueString];
}

id objc_msgSend_poisoned(void *a1, const char *a2, ...)
{
  return _[a1 poisoned];
}

id objc_msgSend_postEscrowCFU(void *a1, const char *a2, ...)
{
  return _[a1 postEscrowCFU];
}

id objc_msgSend_postRepairCFU(void *a1, const char *a2, ...)
{
  return _[a1 postRepairCFU];
}

id objc_msgSend_prepareThreadForKeychainAPIUseForPersonaIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareThreadForKeychainAPIUseForPersonaIdentifier:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_publicEncryptionKey(void *a1, const char *a2, ...)
{
  return _[a1 publicEncryptionKey];
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return _[a1 publicKey];
}

id objc_msgSend_publicSigningKey(void *a1, const char *a2, ...)
{
  return _[a1 publicSigningKey];
}

id objc_msgSend_queryKeyMaterialInKeychain_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryKeyMaterialInKeychain:error:");
}

id objc_msgSend_randomKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "randomKey:");
}

id objc_msgSend_randomKeyWrappedByParent_keyclass_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "randomKeyWrappedByParent:keyclass:error:");
}

id objc_msgSend_receiverPeerID(void *a1, const char *a2, ...)
{
  return _[a1 receiverPeerID];
}

id objc_msgSend_receiverPublicEncryptionKeySPKI(void *a1, const char *a2, ...)
{
  return _[a1 receiverPublicEncryptionKeySPKI];
}

id objc_msgSend_recoveryString(void *a1, const char *a2, ...)
{
  return _[a1 recoveryString];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_reroll(void *a1, const char *a2, ...)
{
  return _[a1 reroll];
}

id objc_msgSend_resetOctagon(void *a1, const char *a2, ...)
{
  return _[a1 resetOctagon];
}

id objc_msgSend_safeErrorClasses(void *a1, const char *a2, ...)
{
  return _[a1 safeErrorClasses];
}

id objc_msgSend_salt(void *a1, const char *a2, ...)
{
  return _[a1 salt];
}

id objc_msgSend_saveKeyMaterialToKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveKeyMaterialToKeychain:");
}

id objc_msgSend_secureElementIdentity(void *a1, const char *a2, ...)
{
  return _[a1 secureElementIdentity];
}

id objc_msgSend_senderPeerID(void *a1, const char *a2, ...)
{
  return _[a1 senderPeerID];
}

id objc_msgSend_serializeAsProtobuf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializeAsProtobuf:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccountOverrideInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountOverrideInfo:");
}

id objc_msgSend_setAessivkey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAessivkey:");
}

id objc_msgSend_setAuthenticationCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationCode:");
}

id objc_msgSend_setBackupKeybagDigest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackupKeybagDigest:");
}

id objc_msgSend_setBottleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottleID:");
}

id objc_msgSend_setBottleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottleId:");
}

id objc_msgSend_setBottleValidity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottleValidity:");
}

id objc_msgSend_setBuild_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBuild:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setBypassPCSEncryption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBypassPCSEncryption:");
}

id objc_msgSend_setCiphertext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCiphertext:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientMetadata:");
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContents:");
}

id objc_msgSend_setCurrentFederation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentFederation:");
}

id objc_msgSend_setCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurve:");
}

id objc_msgSend_setDeviceColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceColor:");
}

id objc_msgSend_setDeviceEnclosureColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceEnclosureColor:");
}

id objc_msgSend_setDeviceMid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceMid:");
}

id objc_msgSend_setDeviceModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceModel:");
}

id objc_msgSend_setDeviceModelClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceModelClass:");
}

id objc_msgSend_setDeviceModelVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceModelVersion:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setEncryptionSPKI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEncryptionSPKI:");
}

id objc_msgSend_setEpoch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpoch:");
}

id objc_msgSend_setEscrowInformationMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEscrowInformationMetadata:");
}

id objc_msgSend_setEscrowRecordLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEscrowRecordLabel:");
}

id objc_msgSend_setEscrowedEncryptionSPKI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEscrowedEncryptionSPKI:");
}

id objc_msgSend_setEscrowedSigningSPKI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEscrowedSigningSPKI:");
}

id objc_msgSend_setEscrowedSpki_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEscrowedSpki:");
}

id objc_msgSend_setExpectedFederationId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedFederationId:");
}

id objc_msgSend_setExpectedReceiveSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedReceiveSize:");
}

id objc_msgSend_setExpectedSendSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedSendSize:");
}

id objc_msgSend_setFederationId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFederationId:");
}

id objc_msgSend_setInitializationVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializationVector:");
}

id objc_msgSend_setIntendedFederation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntendedFederation:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setKeyData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyData:");
}

id objc_msgSend_setKeyMaterialInKeychain_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyMaterialInKeychain:error:");
}

id objc_msgSend_setKeyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyType:");
}

id objc_msgSend_setKeyclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyclass:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setParentKeyUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentKeyUUID:");
}

id objc_msgSend_setPasscodeGeneration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPasscodeGeneration:");
}

id objc_msgSend_setPeerEncryptionPrivKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerEncryptionPrivKey:");
}

id objc_msgSend_setPeerEncryptionSPKI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerEncryptionSPKI:");
}

id objc_msgSend_setPeerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerID:");
}

id objc_msgSend_setPeerInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerInfo:");
}

id objc_msgSend_setPeerSigningPrivKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerSigningPrivKey:");
}

id objc_msgSend_setPeerSigningSPKI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerSigningSPKI:");
}

id objc_msgSend_setPoisoned_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPoisoned:");
}

id objc_msgSend_setReceiverPeerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceiverPeerID:");
}

id objc_msgSend_setReceiverPublicEncryptionKeySPKI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceiverPublicEncryptionKeySPKI:");
}

id objc_msgSend_setRecordId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordId:");
}

id objc_msgSend_setReserved1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReserved1:");
}

id objc_msgSend_setReserved2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReserved2:");
}

id objc_msgSend_setReserved3_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReserved3:");
}

id objc_msgSend_setReserved4_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReserved4:");
}

id objc_msgSend_setReserved5_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReserved5:");
}

id objc_msgSend_setReserved6_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReserved6:");
}

id objc_msgSend_setReserved7_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReserved7:");
}

id objc_msgSend_setSenderPeerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSenderPeerID:");
}

id objc_msgSend_setSerial_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSerial:");
}

id objc_msgSend_setSerialNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSerialNumber:");
}

id objc_msgSend_setSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignature:");
}

id objc_msgSend_setSigningSPKI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSigningSPKI:");
}

id objc_msgSend_setTlkUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTlkUUID:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_setWrappedTLK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWrappedTLK:");
}

id objc_msgSend_setWrappedkey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWrappedkey:");
}

id objc_msgSend_setZoneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZoneName:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sign_withKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sign:withKey:error:");
}

id objc_msgSend_signRecord_ckrecord_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signRecord:ckrecord:error:");
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return _[a1 signature];
}

id objc_msgSend_signingKey(void *a1, const char *a2, ...)
{
  return _[a1 signingKey];
}

id objc_msgSend_signingSPKI(void *a1, const char *a2, ...)
{
  return _[a1 signingSPKI];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_spid(void *a1, const char *a2, ...)
{
  return _[a1 spid];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringForObjectValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForObjectValue:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_successfulKeysRecovered(void *a1, const char *a2, ...)
{
  return _[a1 successfulKeysRecovered];
}

id objc_msgSend_superfluousPeers(void *a1, const char *a2, ...)
{
  return _[a1 superfluousPeers];
}

id objc_msgSend_superfluousPeersCleanupEnabled(void *a1, const char *a2, ...)
{
  return _[a1 superfluousPeersCleanupEnabled];
}

id objc_msgSend_tlk(void *a1, const char *a2, ...)
{
  return _[a1 tlk];
}

id objc_msgSend_tlkRecoveryErrors(void *a1, const char *a2, ...)
{
  return _[a1 tlkRecoveryErrors];
}

id objc_msgSend_tlkShareGarbageCollectionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 tlkShareGarbageCollectionEnabled];
}

id objc_msgSend_tlkUUID(void *a1, const char *a2, ...)
{
  return _[a1 tlkUUID];
}

id objc_msgSend_totalEscrowRecords(void *a1, const char *a2, ...)
{
  return _[a1 totalEscrowRecords];
}

id objc_msgSend_totalPeers(void *a1, const char *a2, ...)
{
  return _[a1 totalPeers];
}

id objc_msgSend_totalTLKSharesRecovered(void *a1, const char *a2, ...)
{
  return _[a1 totalTLKSharesRecovered];
}

id objc_msgSend_totalTlkShares(void *a1, const char *a2, ...)
{
  return _[a1 totalTlkShares];
}

id objc_msgSend_trustedPeers(void *a1, const char *a2, ...)
{
  return _[a1 trustedPeers];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unknownMachineIDsPresent(void *a1, const char *a2, ...)
{
  return _[a1 unknownMachineIDsPresent];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unwrapAESKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unwrapAESKey:error:");
}

id objc_msgSend_unwrapUsing_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unwrapUsing:error:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userPersonaType(void *a1, const char *a2, ...)
{
  return _[a1 userPersonaType];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 userPersonaUniqueString];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_verify_withKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verify:withKey:error:");
}

id objc_msgSend_verifySignature_verifyingPeer_ckrecord_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifySignature:verifyingPeer:ckrecord:error:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_viablePeerCountsByModelID(void *a1, const char *a2, ...)
{
  return _[a1 viablePeerCountsByModelID];
}

id objc_msgSend_viewList(void *a1, const char *a2, ...)
{
  return _[a1 viewList];
}

id objc_msgSend_walrus(void *a1, const char *a2, ...)
{
  return _[a1 walrus];
}

id objc_msgSend_webAccess(void *a1, const char *a2, ...)
{
  return _[a1 webAccess];
}

id objc_msgSend_wrap_publicKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrap:publicKey:error:");
}

id objc_msgSend_wrapAESKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrapAESKey:error:");
}

id objc_msgSend_wrappedData(void *a1, const char *a2, ...)
{
  return _[a1 wrappedData];
}

id objc_msgSend_wrappedTLK(void *a1, const char *a2, ...)
{
  return _[a1 wrappedTLK];
}

id objc_msgSend_wrappedkey(void *a1, const char *a2, ...)
{
  return _[a1 wrappedkey];
}

id objc_msgSend_wrapsSelf(void *a1, const char *a2, ...)
{
  return _[a1 wrapsSelf];
}

id objc_msgSend_zeroKey(void *a1, const char *a2, ...)
{
  return _[a1 zeroKey];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return _[a1 zoneID];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return _[a1 zoneName];
}