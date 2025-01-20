@interface CWFChannel
+ (BOOL)supportsSecureCoding;
+ (CWFChannel)channelWithNumber:(unint64_t)a3 band:(unsigned int)a4 width:(int)a5;
- (BOOL)extAbove;
- (BOOL)is2GHz;
- (BOOL)is5GHz;
- (BOOL)is6GHz;
- (BOOL)is6GHzPSC;
- (BOOL)isDFS;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChannel:(id)a3;
- (CWFChannel)initWithCoder:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (int)width;
- (unint64_t)channel;
- (unint64_t)hash;
- (unsigned)band;
- (unsigned)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setChannel:(unint64_t)a3;
- (void)setFlags:(unsigned int)a3;
@end

@implementation CWFChannel

- (int)width
{
  unsigned int flags = self->_flags;
  if ((flags & 0x800) != 0) {
    return 160;
  }
  if ((flags & 4) != 0) {
    int v3 = 40;
  }
  else {
    int v3 = ((int)(flags << 30) >> 31) & 0x14;
  }
  if ((flags & 0x400) != 0) {
    return 80;
  }
  else {
    return v3;
  }
}

- (unsigned)band
{
  unsigned int flags = self->_flags;
  if ((flags & 0x10) != 0) {
    unsigned int v3 = 2;
  }
  else {
    unsigned int v3 = ((int)(flags << 18) >> 31) & 3;
  }
  if ((flags & 8) != 0) {
    return 1;
  }
  else {
    return v3;
  }
}

- (BOOL)isDFS
{
  return BYTE1(self->_flags) & 1;
}

- (BOOL)is2GHz
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)is5GHz
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (BOOL)is6GHz
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (BOOL)is6GHzPSC
{
  if ((~self->_flags & 0x2002) != 0) {
    return 0;
  }
  unint64_t v2 = 0LL;
  int channel = self->_channel;
  do
  {
    int v4 = dword_18653E1E8[v2];
    BOOL result = v4 == channel;
    if (v2 > 0xD) {
      break;
    }
    ++v2;
  }

  while (v4 != channel);
  return result;
}

+ (CWFChannel)channelWithNumber:(unint64_t)a3 band:(unsigned int)a4 width:(int)a5
{
  v8 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
  objc_msgSend_setChannel_(v8, v9, a3, v10, v11);
  if (a4 - 1 > 2) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = dword_18653E224[a4 - 1];
  }
  unsigned int v16 = v15 | 0x400;
  int v17 = v15 | 0x800;
  if (a5 != 160) {
    int v17 = v15;
  }
  if (a5 != 80) {
    unsigned int v16 = v17;
  }
  int v18 = v15 | 2;
  if (a5 == 40) {
    v15 |= 4u;
  }
  if (a5 == 20) {
    unsigned int v15 = v18;
  }
  if (a5 <= 79) {
    objc_msgSend_setFlags_(v8, v12, v15, v13, v14);
  }
  else {
    objc_msgSend_setFlags_(v8, v12, v16, v13, v14);
  }
  return v8;
}

- (NSString)description
{
  v6 = (void *)NSString;
  unsigned int v7 = objc_msgSend_band(self, a2, v2, v3, v4);
  sub_186453480(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_channel(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_width(self, v14, v15, v16, v17);
  objc_msgSend_stringWithFormat_(v6, v19, (uint64_t)@"%@%ld/%d", v20, v21, v8, v13, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v22;
}

- (NSString)debugDescription
{
  v6 = (void *)NSString;
  unsigned int v7 = objc_msgSend_band(self, a2, v2, v3, v4);
  sub_186453480(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_channel(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_width(self, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_flags(self, v19, v20, v21, v22);
  objc_msgSend_stringWithFormat_(v6, v24, (uint64_t)@"%@%ld/%d (0x%x)", v25, v26, v8, v13, v18, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v27;
}

- (BOOL)isEqualToChannel:(id)a3
{
  id v4 = a3;
  unint64_t channel = self->_channel;
  if (channel == objc_msgSend_channel(v4, v6, v7, v8, v9))
  {
    unsigned int flags = self->_flags;
    BOOL v15 = flags == objc_msgSend_flags(v4, v10, v11, v12, v13);
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFChannel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToChannel = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToChannel = objc_msgSend_isEqualToChannel_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToChannel = 0;
  }

  return isEqualToChannel;
}

- (unint64_t)hash
{
  return self->_channel ^ self->_flags;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = (void *)objc_msgSend_allocWithZone_(CWFChannel, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setChannel_(v11, v12, self->_channel, v13, v14);
  objc_msgSend_setFlags_(v11, v15, self->_flags, v16, v17);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x189607968];
  unint64_t channel = self->_channel;
  id v14 = a3;
  objc_msgSend_numberWithUnsignedInteger_(v4, v6, channel, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v14, v10, (uint64_t)v9, (uint64_t)@"_channel", v11);

  objc_msgSend_encodeInt_forKey_(v14, v12, self->_flags, (uint64_t)@"_flags", v13);
}

- (CWFChannel)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CWFChannel;
  v5 = -[CWFChannel init](&v18, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)@"_channel", v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t channel = objc_msgSend_unsignedIntegerValue(v9, v10, v11, v12, v13);

    v5->_unsigned int flags = objc_msgSend_decodeIntForKey_(v4, v14, (uint64_t)@"_flags", v15, v16);
  }

  return v5;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_unint64_t channel = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
}

- (BOOL)extAbove
{
  return (objc_msgSend_flags(self, a2, v2, v3, v4) >> 9) & 1;
}

- (id)JSONCompatibleKeyValueMap
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)MEMORY[0x189607968];
  uint64_t v12 = objc_msgSend_channel(self, v8, v9, v10, v11);
  objc_msgSend_numberWithUnsignedInteger_(v7, v13, v12, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v17, (uint64_t)v16, (uint64_t)@"channel", v18);

  v19 = (void *)MEMORY[0x189607968];
  uint64_t v24 = objc_msgSend_flags(self, v20, v21, v22, v23);
  objc_msgSend_numberWithUnsignedInt_(v19, v25, v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v29, (uint64_t)v28, (uint64_t)@"flags", v30);

  v31 = (void *)MEMORY[0x189607968];
  uint64_t isDFS = objc_msgSend_isDFS(self, v32, v33, v34, v35);
  objc_msgSend_numberWithBool_(v31, v37, isDFS, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v40, (uint64_t)@"dfs", v42);

  v43 = (void *)MEMORY[0x189607968];
  uint64_t v48 = objc_msgSend_extAbove(self, v44, v45, v46, v47);
  objc_msgSend_numberWithBool_(v43, v49, v48, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, (uint64_t)@"ext_above", v54);

  objc_msgSend_array(MEMORY[0x189603FA8], v55, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_flags(self, v60, v61, v62, v63) & 2) != 0) {
    objc_msgSend_addObject_(v59, v64, (uint64_t)&unk_189E896A8, v66, v67);
  }
  if ((objc_msgSend_flags(self, v64, v65, v66, v67) & 4) != 0) {
    objc_msgSend_addObject_(v59, v68, (uint64_t)&unk_189E896C0, v70, v71);
  }
  if ((objc_msgSend_flags(self, v68, v69, v70, v71) & 0x400) != 0) {
    objc_msgSend_addObject_(v59, v72, (uint64_t)&unk_189E896D8, v74, v75);
  }
  if ((objc_msgSend_flags(self, v72, v73, v74, v75) & 0x800) != 0) {
    objc_msgSend_addObject_(v59, v76, (uint64_t)&unk_189E896F0, v77, v78);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v6, v76, (uint64_t)v59, (uint64_t)@"widths", v78);
  if ((objc_msgSend_flags(self, v79, v80, v81, v82) & 0x2000) != 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v83, (uint64_t)&unk_189E89708, (uint64_t)@"band", v86);
  }

  else if ((objc_msgSend_flags(self, v83, v84, v85, v86) & 0x10) != 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v87, (uint64_t)&unk_189E89720, (uint64_t)@"band", v90);
  }

  else if ((objc_msgSend_flags(self, v87, v88, v89, v90) & 8) != 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v91, (uint64_t)&unk_189E89738, (uint64_t)@"band", v92);
  }

  sub_1864586CC(v6, 0LL, 1u);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v93, (uint64_t)v96, v94, v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v97 = 0LL;
  }

  return v97;
}

@end