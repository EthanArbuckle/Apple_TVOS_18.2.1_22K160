@interface IDSOffGridMessenger
- (void)__im_donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 priority:(int64_t)a5 isInitial:(BOOL)a6 completion:(id)a7;
- (void)__im_sendServiceUpdateMessageWithPreferredService:(int64_t)a3 recipientURI:(id)a4 fromURI:(id)a5 options:(id)a6 completion:(id)a7;
@end

@implementation IDSOffGridMessenger

- (void)__im_donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 priority:(int64_t)a5 isInitial:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  if ((objc_opt_respondsToSelector(self, "donateHandlesForMessagingKeys:fromURI:options:completion:") & 1) != 0)
  {
    uint64_t v16 = 0LL;
    v17 = &v16;
    uint64_t v18 = 0x3052000000LL;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v13 = (objc_class *)getIDSOffGridDeliveryHandlesDonationOptionsClass_softClass;
    uint64_t v21 = getIDSOffGridDeliveryHandlesDonationOptionsClass_softClass;
    if (!getIDSOffGridDeliveryHandlesDonationOptionsClass_softClass)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = __getIDSOffGridDeliveryHandlesDonationOptionsClass_block_invoke;
      v15[3] = &unk_490E0;
      v15[4] = &v16;
      __getIDSOffGridDeliveryHandlesDonationOptionsClass_block_invoke((uint64_t)v15);
      v13 = (objc_class *)v17[5];
    }

    _Block_object_dispose(&v16, 8);
    id v14 = objc_alloc_init(v13);
    [v14 setPriority:a5];
    if ((objc_opt_respondsToSelector(v14, "setIsInitialDonation:") & 1) != 0) {
      [v14 setIsInitialDonation:v8];
    }
    -[IDSOffGridMessenger donateHandlesForMessagingKeys:fromURI:options:completion:]( self,  "donateHandlesForMessagingKeys:fromURI:options:completion:",  a3,  a4,  v14,  a7);
  }

  else
  {
    (*((void (**)(id, void, void))a7 + 2))(a7, 0LL, 0LL);
  }

- (void)__im_sendServiceUpdateMessageWithPreferredService:(int64_t)a3 recipientURI:(id)a4 fromURI:(id)a5 options:(id)a6 completion:(id)a7
{
  if ((objc_opt_respondsToSelector(self, "sendServiceUpdateMessage:options:completion:") & 1) != 0)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3052000000LL;
    uint64_t v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v12 = (objc_class *)getIDSOffGridServiceUpdateMessageClass_softClass;
    uint64_t v20 = getIDSOffGridServiceUpdateMessageClass_softClass;
    if (!getIDSOffGridServiceUpdateMessageClass_softClass)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = __getIDSOffGridServiceUpdateMessageClass_block_invoke;
      v14[3] = &unk_490E0;
      v14[4] = &v15;
      __getIDSOffGridServiceUpdateMessageClass_block_invoke((uint64_t)v14);
      v12 = (objc_class *)v16[5];
    }

    _Block_object_dispose(&v15, 8);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __149__IDSOffGridMessenger_ForwardDeclareSubstitute_127513240____im_sendServiceUpdateMessageWithPreferredService_recipientURI_fromURI_options_completion___block_invoke;
    v13[3] = &unk_490B8;
    v13[4] = a7;
    -[IDSOffGridMessenger sendServiceUpdateMessage:options:completion:]( self,  "sendServiceUpdateMessage:options:completion:",  [[v12 alloc] initWithPreferredServiceType:a3 senderURI:a5 recipientURI:a4],  0,  v13);
  }

  else
  {
    (*((void (**)(id, void, void, void))a7 + 2))(a7, 0LL, 0LL, 0LL);
  }

uint64_t __149__IDSOffGridMessenger_ForwardDeclareSubstitute_127513240____im_sendServiceUpdateMessageWithPreferredService_recipientURI_fromURI_options_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end