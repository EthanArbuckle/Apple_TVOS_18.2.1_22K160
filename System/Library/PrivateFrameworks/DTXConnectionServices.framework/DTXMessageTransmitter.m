@interface DTXMessageTransmitter
- (unsigned)fragmentsForLength:(unint64_t)a3;
- (unsigned)suggestedFragmentSize;
- (void)setSuggestedFragmentSize:(unsigned int)a3;
- (void)transmitMessage:(id)a3 routingInfo:(DTXMessageRoutingInfo)a4 fragment:(unsigned int)a5 transmitter:(id)a6;
@end

@implementation DTXMessageTransmitter

- (unsigned)fragmentsForLength:(unint64_t)a3
{
  unint64_t v8 = (a3 - 1) / (objc_msgSend_suggestedFragmentSize(self, v5, v6) - 32);
  else {
    return v8 + 2;
  }
}

- (void)transmitMessage:(id)a3 routingInfo:(DTXMessageRoutingInfo)a4 fragment:(unsigned int)a5 transmitter:(id)a6
{
  uint64_t v8 = *(void *)&a4.var2;
  uint64_t v9 = *(void *)&a4.var0;
  id v12 = a3;
  v15 = (void (**)(id, uint64_t *, uint64_t))a6;
  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v13, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v24,  v25,  (uint64_t)a2,  self,  @"DTXMessageProtocols.m",  236,  @"Invalid parameter not satisfying: %@",  @"message");
  }

  uint64_t v16 = objc_msgSend_serializedLength(v12, v13, v14);
  unsigned int v18 = objc_msgSend_fragmentsForLength_(self, v17, v16);
  if (v18 <= a5) {
    sub_188BDA408();
  }
  uint64_t v36 = 0x201F3D5B79LL;
  __int16 v37 = a5;
  __int16 v38 = v18;
  int v39 = v16;
  uint64_t v40 = v9;
  uint64_t v41 = v8;
  if (v18 == 1)
  {
    v15[2](v15, &v36, 32LL);
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = sub_188BD2230;
    v34[3] = &unk_18A2EDFA0;
    v35 = v15;
    objc_msgSend_serializedFormApply_(v12, v21, (uint64_t)v34);
  }

  else if (a5)
  {
    unint64_t v22 = objc_msgSend_suggestedFragmentSize(self, v19, v20) - 32;
    v32[0] = 0LL;
    v32[1] = v32;
    v32[2] = 0x2020000000LL;
    uint64_t v33 = v22 * (a5 - 1);
    v30[0] = 0LL;
    v30[1] = v30;
    v30[2] = 0x2020000000LL;
    if (v16 - v33 < v22) {
      LODWORD(v22) = v16 - v33;
    }
    int v31 = v22;
    int v39 = v22;
    v15[2](v15, &v36, 32LL);
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = sub_188BD223C;
    v26[3] = &unk_18A2EDFC8;
    v28 = v30;
    v29 = v32;
    v27 = v15;
    objc_msgSend_serializedFormApply_(v12, v23, (uint64_t)v26);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
  }

  else
  {
    v15[2](v15, &v36, 32LL);
  }
}

- (unsigned)suggestedFragmentSize
{
  return self->_suggestedFragmentSize;
}

- (void)setSuggestedFragmentSize:(unsigned int)a3
{
  self->_suggestedFragmentSize = a3;
}

@end