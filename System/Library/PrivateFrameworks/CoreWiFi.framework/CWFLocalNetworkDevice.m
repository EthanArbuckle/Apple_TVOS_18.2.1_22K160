@interface CWFLocalNetworkDevice
- (NSSet)serviceNames;
- (NSSet)sourceAddresses;
- (NSString)deviceInfo;
- (NSString)name;
- (id)description;
- (id)preferredSourceAddress;
- (id)sanitizedName;
- (unint64_t)hash;
- (void)setDeviceInfo:(id)a3;
- (void)setName:(id)a3;
- (void)setServiceNames:(id)a3;
- (void)setSourceAddresses:(id)a3;
@end

@implementation CWFLocalNetworkDevice

- (id)preferredSourceAddress
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anyObject(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sanitizedName
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__stringByRemovingSpecialCharacters(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_hash(v6, v7, v8, v9, v10);
  objc_msgSend_sourceAddresses(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v21 = objc_msgSend_hash(v16, v17, v18, v19, v20) ^ v11;

  return v21;
}

- (id)description
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)@"<%@ : %p", v10, v11, v8, self);

  objc_msgSend_name(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_name(self, v17, v18, v19, v20);
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v22, (uint64_t)@" name='%@'", v23, v24, v21);
  }

  objc_msgSend_sourceAddresses(self, v17, v18, v19, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend_sourceAddresses(self, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = objc_msgSend_count(v30, v31, v32, v33, v34);

    objc_msgSend_sourceAddresses(self, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v45 = objc_msgSend__prettyDescription(v40, v41, v42, v43, v44);
    v49 = (void *)v45;
    if (v35 == 1) {
      objc_msgSend_appendFormat_(v6, v46, (uint64_t)@" address='%@'", v47, v48, v45);
    }
    else {
      objc_msgSend_appendFormat_(v6, v46, (uint64_t)@" addresses='%@'", v47, v48, v45);
    }
  }

  objc_msgSend_serviceNames(self, v26, v27, v28, v29);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend_serviceNames(self, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__prettyDescription(v55, v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v61, (uint64_t)@" services='%@'", v62, v63, v60);
  }

  objc_msgSend_appendString_(v6, v51, (uint64_t)@">", v53, v54);
  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSSet)sourceAddresses
{
  return self->_sourceAddresses;
}

- (void)setSourceAddresses:(id)a3
{
}

- (NSSet)serviceNames
{
  return self->_serviceNames;
}

- (void)setServiceNames:(id)a3
{
}

- (NSString)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end